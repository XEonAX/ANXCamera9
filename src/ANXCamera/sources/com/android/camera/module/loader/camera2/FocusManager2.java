package com.android.camera.module.loader.camera2;

import android.annotation.TargetApi;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.params.MeteringRectangle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.android.camera.CameraSettings;
import com.android.camera.FocusManagerAbstract;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.util.List;

@TargetApi(21)
public class FocusManager2 extends FocusManagerAbstract {
    private static final int FOCUS_TIME_OUT = 4000;
    private static final int FORCE_RESET_TOUCH_FOCUS = 1;
    private static final int FORCE_RESET_TOUCH_FOCUS_DELAY = 5000;
    private static final int MAX_FACE_MOVE = 80;
    private static final int RESET_TOUCH_FOCUS = 0;
    private static final int RESET_TOUCH_FOCUS_DELAY = 3000;
    private static final String TAG = "FocusManager";
    private static final int TAP_ACTION_AE = 1;
    private static final int TAP_ACTION_AE_AND_AF = 2;
    private boolean mAeAwbLock;
    private long mCafStartTime;
    private Rect mCameraFocusArea;
    private Rect mCameraMeteringArea;
    private boolean mFocusAreaSupported;
    private String mFocusMode;
    private Consumer<FocusTask> mFocusResultConsumer = new Consumer<FocusTask>() {
        public void accept(FocusTask focusTask) throws Exception {
            String str = FocusManager2.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("focusResult: ");
            stringBuilder.append(focusTask.getFocusTrigger());
            stringBuilder.append("|");
            stringBuilder.append(focusTask.isSuccess());
            stringBuilder.append("|");
            stringBuilder.append(focusTask.isFocusing());
            stringBuilder.append("|");
            stringBuilder.append(FocusManager2.this.mState);
            Log.v(str, stringBuilder.toString());
            if (focusTask.getFocusTrigger() == 2 || focusTask.getFocusTrigger() == 3) {
                FocusManager2.this.onAutoFocusMoving(focusTask.isFocusing(), focusTask.isSuccess());
                return;
            }
            if (FocusManager2.this.mState == 2) {
                if (focusTask.isSuccess()) {
                    FocusManager2.this.setFocusState(3);
                    FocusManager2.this.setLastFocusState(3);
                } else {
                    FocusManager2.this.setFocusState(4);
                    FocusManager2.this.setLastFocusState(4);
                }
                FocusManager2.this.updateFocusUI();
                if (FocusManager2.this.mPendingMultiCapture) {
                    FocusManager2.this.multiCapture();
                } else {
                    FocusManager2.this.capture();
                }
            } else if (FocusManager2.this.mState == 1) {
                if (focusTask.isSuccess()) {
                    FocusManager2.this.setFocusState(3);
                    FocusManager2.this.setLastFocusState(3);
                    if ("auto".equals(FocusManager2.this.mFocusMode) && FocusManager2.this.mLastFocusFrom != 1) {
                        FocusManager2.this.mListener.playFocusSound(1);
                    }
                } else {
                    FocusManager2.this.setFocusState(FocusManager2.this.mMirror ? 1 : 4);
                    FocusManager2.this.setLastFocusState(4);
                }
                FocusManager2.this.updateFocusUI();
                FocusManager2.this.mHandler.removeMessages(1);
                FocusManager2.this.mCancelAutoFocusIfMove = true;
            } else {
                FocusManager2.this.mState;
            }
        }
    };
    private Disposable mFocusResultDisposable;
    private ObservableEmitter<FocusTask> mFocusResultEmitter;
    private Handler mHandler;
    private boolean mKeepFocusUIState;
    private int mLastFocusFrom = -1;
    private int mLastState = 0;
    private RectF mLatestFocusFace;
    private long mLatestFocusTime;
    private Listener mListener;
    private boolean mLockAeAwbNeeded;
    private boolean mMeteringAreaSupported;
    private String mOverrideFocusMode;
    private boolean mPendingMultiCapture;
    private List<String> mSupportedFocusModes;

    public interface Listener {
        void cancelFocus(boolean z);

        boolean multiCapture();

        void notifyFocusAreaUpdate();

        boolean onWaitingFocusFinished();

        void playFocusSound(int i);

        void startFaceDetection();

        void startFocus();

        void stopFaceDetection(boolean z);

        void stopObjectTracking(boolean z);
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                case 1:
                    MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
                    if (mainContentProtocol != null) {
                        mainContentProtocol.reShowFaceRect();
                    }
                    if (message.what == 1 && FocusManager2.this.isFocusingSnapOnFinish()) {
                        FocusManager2.this.setFocusState(4);
                        FocusManager2.this.setLastFocusState(4);
                        if (FocusManager2.this.mPendingMultiCapture) {
                            FocusManager2.this.multiCapture();
                            return;
                        } else {
                            FocusManager2.this.capture();
                            return;
                        }
                    }
                    FocusManager2.this.cancelFocus();
                    return;
                default:
                    return;
            }
        }
    }

    public FocusManager2(CameraCapabilities cameraCapabilities, Listener listener, boolean z, Looper looper) {
        this.mHandler = new MainHandler(looper);
        setCharacteristics(cameraCapabilities);
        this.mListener = listener;
        setMirror(z);
        this.mFocusResultDisposable = Observable.create(new ObservableOnSubscribe<FocusTask>() {
            public void subscribe(ObservableEmitter<FocusTask> observableEmitter) throws Exception {
                FocusManager2.this.mFocusResultEmitter = observableEmitter;
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mFocusResultConsumer);
    }

    public void setCharacteristics(CameraCapabilities cameraCapabilities) {
        this.mFocusAreaSupported = cameraCapabilities.isAFRegionSupported();
        this.mMeteringAreaSupported = cameraCapabilities.isAERegionSupported();
        boolean z = cameraCapabilities.isAELockSupported() || cameraCapabilities.isAWBLockSupported();
        this.mLockAeAwbNeeded = z;
        this.mSupportedFocusModes = AutoFocus.convertToLegacyFocusModes(cameraCapabilities.getSupportedFocusModes());
        this.mActiveArraySize = cameraCapabilities.getActiveArraySize();
    }

    public void setPreviewSize(int i, int i2) {
        if (this.mPreviewWidth != i || this.mPreviewHeight != i2) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setPreviewSize: ");
            stringBuilder.append(this.mPreviewWidth);
            stringBuilder.append("x");
            stringBuilder.append(this.mPreviewHeight);
            Log.d(str, stringBuilder.toString());
            setMatrix();
        }
    }

    private void setFocusState(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setFocusState: ");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
        this.mState = i;
    }

    private void setLastFocusState(int i) {
        this.mLastState = i;
    }

    public int getLastFocusState() {
        return this.mLastState;
    }

    public void prepareCapture(boolean z, int i) {
        if (this.mInitialized) {
            String focusMode = getFocusMode();
            boolean z2 = false;
            boolean z3 = i != 2 || (!("auto".equals(focusMode) || AutoFocus.LEGACY_MACRO.equals(focusMode)) || (this.mLastState != 3 && z));
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("prepareCapture: ");
            stringBuilder.append(z);
            stringBuilder.append("|");
            stringBuilder.append(i);
            stringBuilder.append("|");
            stringBuilder.append(focusMode);
            Log.v(str, stringBuilder.toString());
            boolean equals = AutoFocus.LEGACY_CONTINUOUS_PICTURE.equals(focusMode);
            if (isFocusEnabled() && !equals && z3) {
                if (this.mState != 3 && this.mState != 4) {
                    MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
                    if (mainContentProtocol == null || !mainContentProtocol.isFaceExists(mainContentProtocol.getActiveIndicator())) {
                        resetFocusAreaToCenter();
                        startFocus(0);
                    } else {
                        focusFaceArea();
                    }
                } else if (!(!z || this.mCameraFocusArea == null || b.go())) {
                    this.mKeepFocusUIState = true;
                    startFocus(this.mLastFocusFrom);
                    this.mKeepFocusUIState = false;
                }
                z2 = true;
            }
            if (!z2 && z && equals) {
                if (!b.hd()) {
                    requestAutoFocus();
                } else if (this.mState == 1) {
                    cancelFocus();
                }
            }
        }
    }

    public void onShutterDown() {
    }

    public void onShutterUp() {
    }

    private void lockAeAwbIfNeeded() {
        if (this.mLockAeAwbNeeded && !this.mAeAwbLock) {
            this.mAeAwbLock = true;
            this.mListener.notifyFocusAreaUpdate();
        }
    }

    private void unlockAeAwbIfNeeded() {
        if (this.mLockAeAwbNeeded && this.mAeAwbLock && this.mState != 2) {
            this.mAeAwbLock = false;
            this.mListener.notifyFocusAreaUpdate();
        }
    }

    public void doSnap() {
        if (this.mInitialized) {
            if (this.mState == 3 || this.mState == 4 || !needAutoFocusCall()) {
                capture();
            } else if (this.mState == 1) {
                setFocusState(2);
            } else if (this.mState == 0) {
                capture();
            }
        }
    }

    public void doMultiSnap(boolean z) {
        if (this.mInitialized) {
            if (!z) {
                multiCapture();
            }
            if (this.mState == 3 || this.mState == 4 || !needAutoFocusCall()) {
                multiCapture();
            } else if (this.mState == 1) {
                setFocusState(2);
                this.mPendingMultiCapture = true;
            } else if (this.mState == 0) {
                multiCapture();
            }
        }
    }

    public void onFocusResult(FocusTask focusTask) {
        this.mFocusResultEmitter.onNext(focusTask);
    }

    private void onAutoFocusMoving(boolean z, boolean z2) {
        if (this.mInitialized) {
            boolean z3;
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (mainContentProtocol.isFaceExists(mainContentProtocol.getActiveIndicator())) {
                mainContentProtocol.clearFocusView(3);
                z3 = false;
            } else {
                z3 = true;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onAutoFocusMoving: mode=");
            stringBuilder.append(getFocusMode());
            stringBuilder.append(" show=");
            stringBuilder.append(z3);
            Log.d(str, stringBuilder.toString());
            if (this.mCameraFocusArea == null && !"auto".equals(getFocusMode())) {
                mainContentProtocol.setFocusViewType(false);
                if (z) {
                    if (this.mState != 2) {
                        setFocusState(1);
                    }
                    Log.v(TAG, "Camera KPI: CAF start");
                    this.mCafStartTime = System.currentTimeMillis();
                    if (z3) {
                        mainContentProtocol.showIndicator(2, 1);
                    }
                } else {
                    int i = this.mState;
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Camera KPI: CAF stop: Focus time: ");
                    stringBuilder2.append(System.currentTimeMillis() - this.mCafStartTime);
                    Log.v(str2, stringBuilder2.toString());
                    if (z2) {
                        setFocusState(3);
                        setLastFocusState(3);
                    } else {
                        setFocusState(4);
                        setLastFocusState(4);
                    }
                    if (z3) {
                        mainContentProtocol.showIndicator(2, z2 ? 2 : 3);
                    }
                    if (i == 2) {
                        setFocusState(3);
                        if (this.mPendingMultiCapture) {
                            multiCapture();
                        } else {
                            capture();
                        }
                    }
                }
                return;
            }
            return;
        }
        Log.d(TAG, "onAutoFocusMoving");
    }

    private boolean resetFocusAreaToFaceArea() {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null && mainContentProtocol.isFaceExists(mainContentProtocol.getActiveIndicator())) {
            RectF focusRect = mainContentProtocol.getFocusRect(mainContentProtocol.getActiveIndicator());
            if (focusRect != null) {
                this.mLatestFocusFace = focusRect;
                initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, (int) ((focusRect.left + focusRect.right) / 2.0f), (int) ((focusRect.top + focusRect.bottom) / 2.0f), this.mPreviewWidth, this.mPreviewHeight);
                return true;
            }
        }
        return false;
    }

    private void resetFocusAreaToCenter() {
        initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, this.mPreviewWidth / 2, this.mPreviewHeight / 2, this.mPreviewWidth, this.mPreviewHeight);
        initializeFocusIndicator(5, this.mPreviewWidth / 2, this.mPreviewHeight / 2);
    }

    private void initializeFocusAreas(int i, int i2, int i3, int i4, int i5, int i6) {
        if (this.mCameraFocusArea == null) {
            this.mCameraFocusArea = new Rect();
        }
        calculateTapArea(i, i2, 1.0f, i3, i4, i5, i6, this.mCameraFocusArea);
    }

    private void initializeMeteringAreas(int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (i7 != 1 || mainContentProtocol == null || mainContentProtocol.isNeedExposure(1)) {
            if (this.mCameraMeteringArea == null) {
                this.mCameraMeteringArea = new Rect();
            }
            calculateTapArea(i, i2, 1.8f, i3, i4, i5, i6, this.mCameraMeteringArea);
            return;
        }
        this.mCameraMeteringArea = null;
    }

    private void initializeFocusIndicator(int i, int i2, int i3) {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null) {
            mainContentProtocol.setFocusViewPosition(i, i2, i3);
        }
    }

    public void resetFocusIndicator(int i) {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null) {
            mainContentProtocol.clearFocusView(i);
        }
    }

    private void initializeParameters(int i, int i2, int i3, boolean z) {
        if (this.mFocusAreaSupported && !z) {
            initializeFocusAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, i, i2, this.mPreviewWidth, this.mPreviewHeight);
        }
        if (this.mMeteringAreaSupported) {
            initializeMeteringAreas(this.FOCUS_AREA_WIDTH, this.FOCUS_AREA_HEIGHT, i, i2, this.mPreviewWidth, this.mPreviewHeight, i3);
        }
    }

    public void onSingleTapUp(int i, int i2) {
        focusPoint(i, i2, 3, onlyAe());
    }

    private boolean onlyAe() {
        return getTapAction() == 1;
    }

    private void focusPoint(int i, int i2, int i3, boolean z) {
        if (this.mInitialized && this.mState != 2 && (this.mOverrideFocusMode == null || isAutoFocusMode(this.mOverrideFocusMode))) {
            if (isNeedCancelAutoFocus()) {
                cancelFocus();
            }
            initializeParameters(i, i2, i3, z);
            initializeFocusIndicator(1, i, i2);
            this.mListener.notifyFocusAreaUpdate();
            if (!this.mFocusAreaSupported || z) {
                if (this.mMeteringAreaSupported) {
                    if (3 == i3 && isFocusValid(i3)) {
                        this.mListener.playFocusSound(1);
                        this.mCancelAutoFocusIfMove = true;
                    }
                    this.mLastFocusFrom = i3;
                    setFocusState(1);
                    updateFocusUI();
                    setFocusState(3);
                    updateFocusUI();
                    this.mHandler.removeMessages(0);
                }
            } else if (isFocusValid(i3)) {
                startFocus(i3);
            }
        }
    }

    public void requestAutoFocus() {
        if (needAutoFocusCall() && this.mInitialized && this.mState != 2) {
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            int i = 4;
            if (isNeedCancelAutoFocus()) {
                this.mListener.cancelFocus(false);
                if (mainContentProtocol != null) {
                    mainContentProtocol.clearFocusView(2);
                }
                setFocusState(0);
                this.mCancelAutoFocusIfMove = false;
                this.mHandler.removeMessages(0);
                this.mHandler.removeMessages(1);
            }
            if (resetFocusAreaToFaceArea()) {
                if (mainContentProtocol != null) {
                    mainContentProtocol.clearFocusView(9);
                }
                i = 1;
            } else {
                resetFocusAreaToCenter();
            }
            this.mAeAwbLock = false;
            this.mListener.notifyFocusAreaUpdate();
            startFocus(i);
        }
    }

    public boolean focusFaceArea() {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (!isAutoFocusMode(getFocusMode()) || (mainContentProtocol != null && 2 == mainContentProtocol.getActiveIndicator())) {
            return false;
        }
        RectF focusRect = mainContentProtocol != null ? mainContentProtocol.getFocusRect(mainContentProtocol.getActiveIndicator()) : null;
        if (focusRect == null || focusRect.isEmpty()) {
            return false;
        }
        if (this.mLatestFocusFace != null && this.mLastFocusFrom == 1 && Math.abs(focusRect.left - this.mLatestFocusFace.left) < 80.0f && Math.abs((focusRect.right - focusRect.left) - (this.mLatestFocusFace.right - this.mLatestFocusFace.left)) < 80.0f) {
            return false;
        }
        this.mLatestFocusFace = focusRect;
        focusPoint((int) ((focusRect.left + focusRect.right) / 2.0f), (int) ((focusRect.top + focusRect.bottom) / 2.0f), 1, false);
        return true;
    }

    public void onShutter() {
        updateFocusUI();
        this.mAeAwbLock = false;
    }

    public void onPreviewStarted() {
        setFocusState(0);
    }

    public void onPreviewStopped() {
        setFocusState(0);
        resetTouchFocus(7);
        updateFocusUI();
    }

    public void onCameraReleased() {
        onPreviewStopped();
    }

    private boolean isFocusValid(int i) {
        long currentTimeMillis = System.currentTimeMillis();
        long j = (this.mLastFocusFrom == 3 || this.mLastFocusFrom == 4) ? 5000 : FunctionParseBeautyBodySlimCount.TIP_TIME;
        if (i >= 3 || i >= this.mLastFocusFrom || Util.isTimeout(currentTimeMillis, this.mLatestFocusTime, j)) {
            this.mLatestFocusTime = System.currentTimeMillis();
            return true;
        }
        if (this.mLastFocusFrom == 1) {
            resetTouchFocus(7);
        }
        return false;
    }

    private void startFocus(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("startFocus: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        setFocusMode("auto");
        this.mLastFocusFrom = i;
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (i != 1 || (mainContentProtocol != null && 1 == mainContentProtocol.getActiveIndicator())) {
            this.mListener.stopObjectTracking(false);
        }
        this.mListener.startFocus();
        setFocusState(1);
        updateFocusUI();
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    public void cancelFocus() {
        setFocusMode(CameraSettings.getFocusMode());
        resetTouchFocus(2);
        if (needAutoFocusCall()) {
            this.mListener.cancelFocus(true);
        } else {
            this.mListener.notifyFocusAreaUpdate();
        }
        if (2 != this.mState) {
            setFocusState(0);
        } else {
            Log.e(TAG, "waiting focus timeout!");
        }
        updateFocusUI();
        this.mCancelAutoFocusIfMove = false;
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        Log.d(TAG, "cancelFocus");
    }

    private void capture() {
        if (this.mListener.onWaitingFocusFinished()) {
            if (b.go()) {
                setFocusState(0);
                this.mCancelAutoFocusIfMove = false;
            }
            this.mPendingMultiCapture = false;
            this.mHandler.removeMessages(0);
        }
    }

    private void multiCapture() {
        if (this.mListener.multiCapture()) {
            setFocusState(0);
            this.mPendingMultiCapture = false;
            this.mHandler.removeMessages(0);
        }
    }

    public void resetFocusStateIfNeeded() {
        this.mCameraFocusArea = null;
        this.mCameraMeteringArea = null;
        setFocusState(0);
        setLastFocusState(0);
        this.mCancelAutoFocusIfMove = false;
        if (!this.mHandler.hasMessages(0)) {
            this.mHandler.sendEmptyMessage(0);
        }
    }

    public String setFocusMode(String str) {
        if (str == null) {
            Log.e(TAG, "setFocusMode: null focus mode", new RuntimeException());
            return str;
        }
        if ("auto".equals(str) || !Util.isSupported(str, this.mSupportedFocusModes)) {
            this.mFocusMode = "auto";
        } else {
            this.mFocusMode = str;
        }
        if (AutoFocus.LEGACY_CONTINUOUS_PICTURE.equals(this.mFocusMode) || AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mFocusMode)) {
            this.mLastFocusFrom = -1;
        }
        return this.mFocusMode;
    }

    public String getFocusMode() {
        if (this.mOverrideFocusMode != null) {
            return this.mOverrideFocusMode;
        }
        if (this.mFocusMode == null) {
            this.mFocusMode = CameraSettings.getFocusMode();
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getFocusMode=");
        stringBuilder.append(this.mFocusMode);
        Log.d(str, stringBuilder.toString());
        return this.mFocusMode;
    }

    public MeteringRectangle[] getFocusAreas(Rect rect, Rect rect2) {
        if (this.mCameraFocusArea == null) {
            return null;
        }
        return afaeRectangle(this.mCameraFocusArea, rect, rect2);
    }

    public MeteringRectangle[] getMeteringAreas(Rect rect, Rect rect2) {
        if (this.mCameraMeteringArea == null) {
            return null;
        }
        return afaeRectangle(this.mCameraMeteringArea, rect, rect2);
    }

    public void updateFocusUI() {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (this.mInitialized && !this.mKeepFocusUIState && mainContentProtocol != null) {
            int activeIndicator;
            int i = 2;
            if (1 == this.mLastFocusFrom) {
                activeIndicator = mainContentProtocol.getActiveIndicator();
            } else {
                activeIndicator = 2;
            }
            switch (this.mState) {
                case 0:
                    if (activeIndicator != 2) {
                        mainContentProtocol.clearIndicator(activeIndicator);
                        break;
                    } else {
                        mainContentProtocol.clearFocusView(7);
                        break;
                    }
                case 1:
                case 2:
                    mainContentProtocol.showIndicator(activeIndicator, 1);
                    break;
                case 3:
                    mainContentProtocol.showIndicator(activeIndicator, 2);
                    break;
                case 4:
                    if (!(AutoFocus.LEGACY_CONTINUOUS_PICTURE.equals(this.mFocusMode) || AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mFocusMode))) {
                        i = 3;
                    }
                    mainContentProtocol.showIndicator(activeIndicator, i);
                    break;
            }
        }
    }

    public void resetTouchFocus(int i) {
        if (this.mInitialized) {
            this.mCameraFocusArea = null;
            this.mCameraMeteringArea = null;
            this.mCancelAutoFocusIfMove = false;
            resetFocusIndicator(i);
        }
    }

    public void resetAfterCapture(boolean z) {
        if (b.go()) {
            resetTouchFocus(7);
        } else if (!z) {
        } else {
            if (this.mLastFocusFrom == 4) {
                this.mListener.cancelFocus(false);
                resetTouchFocus(7);
                removeMessages();
                return;
            }
            setLastFocusState(0);
        }
    }

    public boolean isFocusCompleted() {
        return this.mState == 3 || this.mState == 4;
    }

    public int getCurrentFocusState() {
        return this.mState;
    }

    public boolean isFocusingSnapOnFinish() {
        return this.mState == 2;
    }

    public boolean cancelMultiSnapPending() {
        if (this.mState != 2 || !this.mPendingMultiCapture) {
            return false;
        }
        this.mPendingMultiCapture = false;
        return true;
    }

    public void removeMessages() {
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
    }

    public void overrideFocusMode(String str) {
        this.mOverrideFocusMode = str;
    }

    public void setAeAwbLock(boolean z) {
        this.mAeAwbLock = z;
    }

    public boolean getAeAwbLock() {
        return this.mAeAwbLock;
    }

    private boolean needAutoFocusCall() {
        return 2 == getTapAction() && this.mFocusAreaSupported;
    }

    private int getTapAction() {
        String focusMode = getFocusMode();
        if (focusMode.equals(AutoFocus.LEGACY_EDOF) || focusMode.equals("manual")) {
            return 1;
        }
        return 2;
    }

    private boolean isAutoFocusMode(String str) {
        return "auto".equals(str) || AutoFocus.LEGACY_MACRO.equals(str);
    }

    public void onDeviceBecomeStable() {
    }

    public boolean isNeedCancelAutoFocus() {
        return this.mHandler.hasMessages(0) || this.mHandler.hasMessages(1) || this.mCancelAutoFocusIfMove;
    }

    public void onDeviceKeepMoving(double d) {
        if (Util.isTimeout(System.currentTimeMillis(), this.mLatestFocusTime, 3000)) {
            setLastFocusState(0);
            if (this.mCancelAutoFocusIfMove) {
                this.mHandler.sendEmptyMessage(0);
            }
        }
    }

    public void cancelLongPressedAutoFocus() {
        if (!this.mCancelAutoFocusIfMove) {
            setLastFocusState(0);
        }
        this.mHandler.sendEmptyMessage(0);
    }

    private boolean isFocusEnabled() {
        if (!this.mInitialized || this.mState == 2 || this.mState == 1 || !needAutoFocusCall()) {
            return false;
        }
        return true;
    }

    private MeteringRectangle[] afaeRectangle(Rect rect, Rect rect2, Rect rect3) {
        MeteringRectangle[] meteringRectangleArr = new MeteringRectangle[1];
        RectF rectF = new RectF(rect);
        this.mMatrix.mapRect(rectF);
        Matrix matrix = new Matrix();
        matrix.postTranslate((float) (rect3.width() / 2), (float) (rect3.height() / 2));
        matrix.mapRect(rectF);
        rectF.left = ((rectF.left * ((float) rect2.width())) / ((float) rect3.width())) + ((float) rect2.left);
        rectF.top = ((rectF.top * ((float) rect2.height())) / ((float) rect3.height())) + ((float) rect2.top);
        rectF.right = ((rectF.right * ((float) rect2.width())) / ((float) rect3.width())) + ((float) rect2.left);
        rectF.bottom = ((rectF.bottom * ((float) rect2.height())) / ((float) rect3.height())) + ((float) rect2.top);
        rect = new Rect();
        Util.rectFToRect(rectF, rect);
        rect.left = Util.clamp(rect.left, rect2.left, rect2.right);
        rect.top = Util.clamp(rect.top, rect2.top, rect2.bottom);
        rect.right = Util.clamp(rect.right, rect2.left, rect2.right);
        rect.bottom = Util.clamp(rect.bottom, rect2.top, rect2.bottom);
        meteringRectangleArr[0] = new MeteringRectangle(rect, 1);
        return meteringRectangleArr;
    }

    public boolean canRecord() {
        if (!isFocusing()) {
            return true;
        }
        setFocusState(2);
        return false;
    }

    public boolean isFocusing() {
        return this.mState == 1 || this.mState == 2;
    }

    public void resetFocused() {
        setFocusState(0);
    }

    public void destroy() {
        removeMessages();
        this.mFocusResultDisposable.dispose();
    }
}
