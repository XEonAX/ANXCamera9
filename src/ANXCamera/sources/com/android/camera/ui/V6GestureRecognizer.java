package com.android.camera.ui;

import android.graphics.Point;
import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.SimpleOnScaleGestureListener;
import android.view.ViewConfiguration;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.HandlerSwitcher;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.ModeChangeController;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.EdgeGestureDetector.EdgeGestureListener;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class V6GestureRecognizer {
    public static final int GESTURE_EFFECT_CROP_VIEW = 6;
    public static final int GESTURE_EV_ADJUST = 7;
    public static final int GESTURE_HON = 100;
    public static final int GESTURE_NONE = 0;
    public static final int GESTURE_TRACK = 10;
    public static final int GESTURE_VER = 200;
    public static final int GESTURE_ZOOM = 9;
    public static final int SINGLE_MAX_GESTURE = 100;
    private static final String TAG = "CameraGestureRecognizer";
    private static V6GestureRecognizer sV6GestureRecognizer;
    private final int MIN_DETECT_DISTANCE;
    private final Camera mActivity;
    private final CameraGestureDetector mCameraGestureDetector;
    private Module mCurrentModule;
    private float mDistanceX;
    private float mDistanceY;
    private int mEdgeGesture = 0;
    private final EdgeGestureDetector mEdgeGestureDetector;
    private int mGesture = 0;
    private final GestureDetector mGestureDetector;
    private boolean mInScaling;
    private final ScaleGestureDetector mScaleDetector;
    private boolean mScaleDetectorEnable = true;
    private int mScrollDirection;
    private boolean mScrolled;
    private boolean mTouchDown;

    private class CameraGestureDetector {
        private Point mStartPoint = new Point();

        public void onTouchEvent(MotionEvent motionEvent) {
            int action = motionEvent.getAction() & 255;
            if (action == 0) {
                this.mStartPoint.set((int) motionEvent.getX(), (int) motionEvent.getY());
            } else if (action == 2) {
                String str = Log.GESTURE_TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("CameraGestureDetector ACTION_MOVE mGesture=");
                stringBuilder.append(V6GestureRecognizer.this.mGesture);
                Log.v(str, stringBuilder.toString());
                int i = 100;
                if (V6GestureRecognizer.this.mGesture / 100 == 0) {
                    Point access$400 = V6GestureRecognizer.this.getMoveVector(this.mStartPoint.x, this.mStartPoint.y, (int) motionEvent.getX(), (int) motionEvent.getY());
                    str = V6GestureRecognizer.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("mGesture=");
                    stringBuilder2.append(V6GestureRecognizer.this.mGesture);
                    stringBuilder2.append(" orientation=");
                    stringBuilder2.append(Math.abs(access$400.x) > Math.abs(access$400.y) ? SupportedConfigFactory.CLOSE_BY_VIDEO : "v");
                    stringBuilder2.append(" dx=");
                    stringBuilder2.append(access$400.x);
                    stringBuilder2.append(" dy=");
                    stringBuilder2.append(access$400.y);
                    Log.v(str, stringBuilder2.toString());
                    if (V6GestureRecognizer.this.MIN_DETECT_DISTANCE <= (access$400.x * access$400.x) + (access$400.y * access$400.y)) {
                        V6GestureRecognizer v6GestureRecognizer = V6GestureRecognizer.this;
                        if (Math.abs(access$400.x) <= Math.abs(access$400.y)) {
                            i = 200;
                        }
                        V6GestureRecognizer.access$312(v6GestureRecognizer, i);
                    }
                }
                String str2 = Log.GESTURE_TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("CameraGestureDetector ACTION_MOVE end mGesture=");
                stringBuilder3.append(V6GestureRecognizer.this.mGesture);
                Log.v(str2, stringBuilder3.toString());
            } else if (action == 6 && motionEvent.getPointerCount() == 2 && V6GestureRecognizer.this.couldNotifyGesture(false)) {
                float x;
                float x2;
                float y;
                float y2;
                if (motionEvent.getX(0) < motionEvent.getX(1)) {
                    x = motionEvent.getX(0);
                    x2 = motionEvent.getX(1);
                } else {
                    x = motionEvent.getX(1);
                    x2 = motionEvent.getX(0);
                }
                if (motionEvent.getY(0) < motionEvent.getY(1)) {
                    y = motionEvent.getY(0);
                    y2 = motionEvent.getY(1);
                } else {
                    y = motionEvent.getY(1);
                    y2 = motionEvent.getY(0);
                }
                if (V6GestureRecognizer.this.couldNotifyGesture(false)) {
                    V6GestureRecognizer.access$312(V6GestureRecognizer.this, 10);
                    V6GestureRecognizer.this.mCurrentModule.onGestureTrack(new RectF(x, y, x2, y2), true);
                }
            }
        }
    }

    private class MyEdgeGestureListener implements EdgeGestureListener {
        private MyEdgeGestureListener() {
        }

        public boolean onEdgeTap(int i, int i2) {
            String str = V6GestureRecognizer.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("MyEdgeGestureListener onEdgeTap x=");
            stringBuilder.append(i);
            stringBuilder.append(" y=");
            stringBuilder.append(i2);
            Log.v(str, stringBuilder.toString());
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent() || !ModuleManager.isCameraModule()) {
                return false;
            }
            Log.v(V6GestureRecognizer.TAG, "EdgeGesture detectTap success");
            return V6GestureRecognizer.this.mActivity.getEdgeShutterView().onEdgeTap(i, i2);
        }

        public boolean onEdgeTouch(int i, int i2) {
            String str = V6GestureRecognizer.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("MyEdgeGestureListener onEdgeTouch x=");
            stringBuilder.append(i);
            stringBuilder.append(" y=");
            stringBuilder.append(i2);
            Log.v(str, stringBuilder.toString());
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent() || !ModuleManager.isCameraModule()) {
                return false;
            }
            Log.v(V6GestureRecognizer.TAG, "EdgeGesture detectTouch success");
            return V6GestureRecognizer.this.mActivity.getEdgeShutterView().onEdgeTouch(i, i2);
        }
    }

    private class MyGestureListener extends SimpleOnGestureListener {
        private boolean mHandleConfirmTap;

        private MyGestureListener() {
        }

        private boolean handleSingleTap(MotionEvent motionEvent) {
            if (!V6GestureRecognizer.this.couldNotifyGesture(false)) {
                return false;
            }
            V6GestureRecognizer.this.mCurrentModule.onSingleTapUp((int) motionEvent.getX(), (int) motionEvent.getY());
            return true;
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            Log.v(V6GestureRecognizer.TAG, "onSingleTapUp");
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (mainContentProtocol == null || !mainContentProtocol.isEffectViewVisible()) {
                return handleSingleTap(motionEvent);
            }
            this.mHandleConfirmTap = V6GestureRecognizer.this.couldNotifyGesture(false);
            return false;
        }

        public boolean onDoubleTap(MotionEvent motionEvent) {
            int i = 0;
            if (!this.mHandleConfirmTap) {
                return false;
            }
            int invertFlag = EffectController.getInstance().getInvertFlag();
            EffectController instance = EffectController.getInstance();
            if (invertFlag == 0) {
                i = 1;
            }
            instance.setInvertFlag(i);
            return true;
        }

        public boolean onSingleTapConfirmed(MotionEvent motionEvent) {
            MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
            if (mainContentProtocol != null && mainContentProtocol.isEffectViewVisible() && this.mHandleConfirmTap) {
                return handleSingleTap(motionEvent);
            }
            return false;
        }

        public void onLongPress(MotionEvent motionEvent) {
            Log.v(V6GestureRecognizer.TAG, "onLongPress");
            if (V6GestureRecognizer.this.couldNotifyGesture(false)) {
                V6GestureRecognizer.this.mCurrentModule.onLongPress((int) motionEvent.getX(), (int) motionEvent.getY());
            }
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            if (V6GestureRecognizer.this.mInScaling || V6GestureRecognizer.this.mScrolled) {
                return false;
            }
            String str = V6GestureRecognizer.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onScroll: ");
            stringBuilder.append(motionEvent.getX());
            stringBuilder.append("|");
            stringBuilder.append(motionEvent.getY());
            stringBuilder.append("|");
            stringBuilder.append(motionEvent2.getX());
            stringBuilder.append("|");
            stringBuilder.append(motionEvent2.getY());
            stringBuilder.append("|distanceX:");
            stringBuilder.append(f);
            stringBuilder.append("|distanceY:");
            stringBuilder.append(f2);
            Log.d(str, stringBuilder.toString());
            V6GestureRecognizer.access$1016(V6GestureRecognizer.this, -f2);
            if (Math.abs(V6GestureRecognizer.this.mDistanceY) > ((float) Util.dpToPixel(80.0f)) || V6GestureRecognizer.this.getCurrentGesture() == 7 || V6GestureRecognizer.this.getCurrentGesture() == 6) {
                return false;
            }
            V6GestureRecognizer.access$1116(V6GestureRecognizer.this, -f);
            if (V6GestureRecognizer.this.mScrollDirection == 0 && ((float) V6GestureRecognizer.this.MIN_DETECT_DISTANCE) <= (V6GestureRecognizer.this.mDistanceX * V6GestureRecognizer.this.mDistanceX) + (V6GestureRecognizer.this.mDistanceY * V6GestureRecognizer.this.mDistanceY)) {
                V6GestureRecognizer.this.mScrollDirection = Math.abs(V6GestureRecognizer.this.mDistanceX) > Math.abs(V6GestureRecognizer.this.mDistanceY) ? 100 : 200;
            }
            if (V6GestureRecognizer.this.mScrollDirection != 100) {
                return false;
            }
            int i = -1;
            float f3 = (float) 35;
            if (V6GestureRecognizer.this.mDistanceX > ((float) Util.dpToPixel(f3)) && V6GestureRecognizer.this.mDistanceY < ((float) Util.dpToPixel(f3))) {
                i = 3;
                V6GestureRecognizer.this.mScrolled = true;
            } else if (V6GestureRecognizer.this.mDistanceX < ((float) (-Util.dpToPixel(f3))) && V6GestureRecognizer.this.mDistanceY > ((float) (-Util.dpToPixel(f3)))) {
                i = 5;
                V6GestureRecognizer.this.mScrolled = true;
            }
            HandlerSwitcher handlerSwitcher = (HandlerSwitcher) ModeCoordinatorImpl.getInstance().getAttachProtocol(183);
            if (handlerSwitcher != null && handlerSwitcher.onHandleSwitcher(i)) {
                return true;
            }
            ModeChangeController modeChangeController = (ModeChangeController) ModeCoordinatorImpl.getInstance().getAttachProtocol(179);
            if (modeChangeController == null || !modeChangeController.canSwipeChangeMode()) {
                return false;
            }
            modeChangeController.selectMode(i, 0);
            return true;
        }
    }

    private class MyScaleListener extends SimpleOnScaleGestureListener {
        private boolean mZoomScaled;

        private MyScaleListener() {
        }

        public boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
            if (!V6GestureRecognizer.this.isCurrentModuleAlive() || V6GestureRecognizer.this.mCurrentModule.isIgnoreTouchEvent()) {
                return false;
            }
            this.mZoomScaled = false;
            return V6GestureRecognizer.this.mCurrentModule.onScaleBegin(scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY());
        }

        public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
            if (!V6GestureRecognizer.this.isCurrentModuleAlive()) {
                return false;
            }
            if (!V6GestureRecognizer.this.couldNotifyGesture(false) && V6GestureRecognizer.this.getCurrentGesture() != 9) {
                return false;
            }
            V6GestureRecognizer.this.setGesture(9);
            boolean onScale = V6GestureRecognizer.this.mCurrentModule.onScale(scaleGestureDetector.getFocusX(), scaleGestureDetector.getFocusY(), scaleGestureDetector.getScaleFactor());
            if (!this.mZoomScaled) {
                this.mZoomScaled = onScale;
            }
            return onScale;
        }

        public void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
            if (this.mZoomScaled) {
                CameraStatUtil.trackZoomAdjusted(CameraStat.ZOOM_MODE_GESTURE);
                this.mZoomScaled = false;
            }
            if (V6GestureRecognizer.this.isCurrentModuleAlive()) {
                V6GestureRecognizer.this.mCurrentModule.onScaleEnd();
            }
        }
    }

    static /* synthetic */ float access$1016(V6GestureRecognizer v6GestureRecognizer, float f) {
        float f2 = v6GestureRecognizer.mDistanceY + f;
        v6GestureRecognizer.mDistanceY = f2;
        return f2;
    }

    static /* synthetic */ float access$1116(V6GestureRecognizer v6GestureRecognizer, float f) {
        float f2 = v6GestureRecognizer.mDistanceX + f;
        v6GestureRecognizer.mDistanceX = f2;
        return f2;
    }

    static /* synthetic */ int access$312(V6GestureRecognizer v6GestureRecognizer, int i) {
        int i2 = v6GestureRecognizer.mGesture + i;
        v6GestureRecognizer.mGesture = i2;
        return i2;
    }

    private V6GestureRecognizer(ActivityBase activityBase) {
        this.mActivity = (Camera) activityBase;
        this.MIN_DETECT_DISTANCE = ViewConfiguration.get(this.mActivity).getScaledTouchSlop() * ViewConfiguration.get(this.mActivity).getScaledTouchSlop();
        this.mGestureDetector = new GestureDetector(activityBase, new MyGestureListener(), null, true);
        this.mEdgeGestureDetector = new EdgeGestureDetector(new MyEdgeGestureListener());
        this.mScaleDetector = new ScaleGestureDetector(activityBase, new MyScaleListener());
        this.mCameraGestureDetector = new CameraGestureDetector();
    }

    public static synchronized V6GestureRecognizer getInstance(ActivityBase activityBase) {
        V6GestureRecognizer v6GestureRecognizer;
        synchronized (V6GestureRecognizer.class) {
            if (sV6GestureRecognizer == null || activityBase != sV6GestureRecognizer.mActivity) {
                sV6GestureRecognizer = new V6GestureRecognizer(activityBase);
            }
            v6GestureRecognizer = sV6GestureRecognizer;
        }
        return v6GestureRecognizer;
    }

    public boolean onEdgeTouchEvent(MotionEvent motionEvent) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onEdgeTouchEvent mGesture=");
        stringBuilder.append(this.mGesture);
        stringBuilder.append(" maskAction=");
        stringBuilder.append(motionEvent.getActionMasked());
        Log.v(str, stringBuilder.toString());
        this.mEdgeGestureDetector.onTouchEvent(motionEvent);
        return true;
    }

    public void setCurrentModule(Module module) {
        this.mCurrentModule = module;
    }

    public void setScaleDetectorEnable(boolean z) {
        this.mScaleDetectorEnable = z;
    }

    private boolean isCurrentModuleAlive() {
        return (this.mCurrentModule == null || !this.mCurrentModule.isCreated() || this.mCurrentModule.isDeparted()) ? false : true;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onTouchEvent mGesture=");
        stringBuilder.append(this.mGesture);
        stringBuilder.append(" action=");
        stringBuilder.append(motionEvent.getAction());
        Log.v(str, stringBuilder.toString());
        if (motionEvent.getActionMasked() == 0) {
            this.mGesture = 0;
        }
        if (motionEvent.getActionMasked() == 0) {
            this.mTouchDown = true;
            this.mInScaling = false;
        } else if (!this.mTouchDown) {
            return false;
        } else {
            if (motionEvent.getActionMasked() == 3 || motionEvent.getActionMasked() == 1) {
                this.mTouchDown = false;
            }
        }
        if (motionEvent.getActionMasked() == 0 || motionEvent.getActionMasked() == 5) {
            this.mScrolled = false;
            this.mScrollDirection = 0;
            this.mDistanceX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            this.mDistanceY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        }
        Log.v(TAG, "set to detector");
        if (this.mScaleDetectorEnable) {
            this.mScaleDetector.onTouchEvent(motionEvent);
            if (this.mScaleDetector.isInProgress()) {
                this.mInScaling = true;
            }
        } else {
            this.mInScaling = false;
        }
        this.mCameraGestureDetector.onTouchEvent(motionEvent);
        checkControlView(motionEvent);
        this.mGestureDetector.onTouchEvent(motionEvent);
        boolean isGestureDetecting = isGestureDetecting() ^ true;
        if (motionEvent.getAction() == 1 || motionEvent.getAction() == 3) {
            this.mGesture = 0;
            this.mInScaling = false;
            this.mScrolled = false;
            this.mScrollDirection = 0;
            this.mDistanceX = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            this.mDistanceY = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        }
        return isGestureDetecting;
    }

    private boolean checkControlView(MotionEvent motionEvent) {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null) {
            if (mainContentProtocol.isEffectViewVisible()) {
                mainContentProtocol.onViewTouchEvent(R.id.v6_effect_crop_view, motionEvent);
                if (mainContentProtocol.isEffectViewMoved()) {
                    if (isGestureDetecting()) {
                        this.mGesture += 6;
                    }
                } else if (!mainContentProtocol.isEffectViewMoved() && getCurrentGesture() == 6) {
                    setGesture(0);
                }
            }
            if (mainContentProtocol.isIndicatorVisible(2)) {
                boolean isEvAdjusted = mainContentProtocol.isEvAdjusted(false);
                mainContentProtocol.onViewTouchEvent(R.id.v6_focus_view, motionEvent);
                if (mainContentProtocol.isEvAdjusted(false)) {
                    if (isGestureDetecting()) {
                        this.mGesture += 7;
                    }
                } else if (!isEvAdjusted && getCurrentGesture() == 7) {
                    setGesture(0);
                }
            }
        }
        return isGestureDetecting() ^ 1;
    }

    public void setGesture(int i) {
        this.mGesture = ((this.mGesture / 100) * 100) + i;
    }

    private Point getMoveVector(int i, int i2, int i3, int i4) {
        Point point = new Point();
        point.x = i - i3;
        point.y = i2 - i4;
        return point;
    }

    private boolean couldNotifyGesture(boolean z) {
        return isGestureDetecting(z) && isCurrentModuleAlive();
    }

    private boolean isGestureDetecting(boolean z) {
        return (z ? this.mEdgeGesture : this.mGesture) % 100 == 0;
    }

    public boolean isGestureDetecting() {
        return this.mGesture % 100 == 0;
    }

    public int getGestureOrientation() {
        return (this.mGesture / 100) * 100;
    }

    public int getCurrentGesture() {
        return this.mGesture % 100;
    }

    public static void onDestroy(ActivityBase activityBase) {
        if (sV6GestureRecognizer != null && sV6GestureRecognizer.mActivity == activityBase) {
            sV6GestureRecognizer = null;
        }
    }
}
