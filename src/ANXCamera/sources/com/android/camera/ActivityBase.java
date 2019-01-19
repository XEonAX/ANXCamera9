package com.android.camera;

import android.app.AlertDialog;
import android.app.KeyguardManager;
import android.app.NotificationManager;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.UiThread;
import android.support.v4.app.FragmentActivity;
import android.view.Display;
import android.view.KeyEvent;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.CameraScreenNail.NailListener;
import com.android.camera.CameraScreenNail.RequestRenderListener;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.loader.SurfaceStateListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.ScreenHint;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V9EdgeShutterView;
import com.android.camera2.Camera2Proxy;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

public abstract class ActivityBase extends FragmentActivity implements AppController, SurfaceStateListener {
    public static final int MSG_CAMERA_OPEN_EXCEPTION = 10;
    protected static final int MSG_DEBUG_INFO = 0;
    protected static final int MSG_KEYGUARD_TWICE_RESUME = 1;
    private static final int START_GALLERY_TIMEOUT = 300;
    private static final String TAG = "ActivityBase";
    private static final int TOUCH_EVENT_TRACK_TIME_OUT = 1000;
    protected volatile boolean mActivityPaused;
    private HashMap mAppLunchMap;
    protected long mAppStartTime;
    protected CameraAppImpl mApplication;
    protected Camera2Proxy mCamera2Device;
    protected CameraBrightness mCameraBrightness;
    private boolean mCameraErrorShown;
    public CameraIntentManager mCameraIntentManager;
    protected CameraRootView mCameraRootView;
    protected CameraScreenNail mCameraScreenNail;
    private MiuiCameraSound mCameraSound;
    private Thread mCloseActivityThread;
    protected Module mCurrentModule;
    private int mCurrentSurfaceState = 1;
    protected TextView mDebugInfoView;
    protected boolean mDelayReleaseCamera;
    protected int mDisplayRotation;
    protected V9EdgeShutterView mEdgeShutterView;
    private AlertDialog mErrorDialog;
    private Disposable mGLCoverDisposable;
    protected ImageView mGLCoverView;
    protected V6CameraGLSurfaceView mGLView;
    private boolean mGalleryLocked = false;
    protected final Handler mHandler = new ActivityHandler(this);
    private boolean mIsFinishInKeyguard = false;
    private boolean mIsSwitchingModule;
    private int mJumpFlag = 0;
    protected boolean mJumpedToGallery;
    private KeyguardManager mKeyguardManager;
    private boolean mKeyguardSecureLocked = false;
    private int mLastJumpFlag = 0;
    private LocationManager mLocationManager;
    protected int mOrientation = -1;
    protected int mOrientationCompensation = 0;
    protected ScreenHint mScreenHint;
    private ArrayList<Uri> mSecureUriList;
    private boolean mStartFromKeyguard = false;
    private ThumbnailUpdater mThumbnailUpdater;
    private Disposable mTrackAppLunchDisposable;

    private static class ActivityHandler extends Handler {
        private final WeakReference<ActivityBase> mActivity;

        public ActivityHandler(ActivityBase activityBase) {
            this.mActivity = new WeakReference(activityBase);
        }

        public void handleMessage(Message message) {
            ActivityBase activityBase = (ActivityBase) this.mActivity.get();
            if (activityBase != null) {
                int i = message.what;
                if (i == 10) {
                    i = message.arg1;
                    Log.d(ActivityBase.TAG, String.format(Locale.ENGLISH, "msg = %s , exception = 0x%x", new Object[]{message, Integer.valueOf(i)}));
                    switch (i) {
                        case 226:
                        case 228:
                        case 230:
                        case 231:
                        case 236:
                        case 237:
                            int i2;
                            if (Util.isInVideoCall(activityBase)) {
                                i2 = R.string.cannot_connect_camera_volte_call;
                            } else if (CameraSettings.updateOpenCameraFailTimes() > 1) {
                                i2 = R.string.cannot_connect_camera_twice;
                            } else {
                                i2 = R.string.cannot_connect_camera_once;
                            }
                            Util.showErrorAndFinish(activityBase, i2);
                            activityBase.showErrorDialog();
                            break;
                        case 227:
                            Util.showErrorAndFinish(activityBase, R.string.camera_disabled);
                            activityBase.showErrorDialog();
                            break;
                    }
                }
                switch (i) {
                    case 0:
                        if (!activityBase.isActivityPaused()) {
                            activityBase.showDebugInfo((String) message.obj);
                            break;
                        }
                        break;
                    case 1:
                        Log.d(ActivityBase.TAG, "handleMessage:  set mIsFinishInKeyguard = true;");
                        activityBase.mIsFinishInKeyguard = true;
                        break;
                }
            }
        }
    }

    @UiThread
    public abstract void notifyOnFirstFrameArrived(int i);

    public boolean couldShowErrorDialog() {
        return this.mCameraErrorShown ^ 1;
    }

    public void showErrorDialog() {
        this.mCameraErrorShown = true;
    }

    public void setErrorDialog(AlertDialog alertDialog) {
        this.mErrorDialog = alertDialog;
    }

    public void showDebugInfo(String str) {
        if (this.mDebugInfoView != null) {
            this.mDebugInfoView.setText(str);
        }
    }

    public V9EdgeShutterView getEdgeShutterView() {
        return this.mEdgeShutterView;
    }

    public CameraAppImpl getCameraAppImpl() {
        return this.mApplication;
    }

    public Camera2Proxy getCameraDevice() {
        return this.mCamera2Device;
    }

    public void onCreate(Bundle bundle) {
        int i;
        if (Util.isNotchDevice) {
            CompatibilityUtils.setCutoutModeShortEdges(getWindow());
        }
        getWindow().addFlags(1024);
        if ((getIntent().getFlags() & 8388608) == 0) {
            i = 1;
        } else {
            i = 0;
        }
        if (i != 0) {
            getWindow().addFlags(2097152);
        }
        super.onCreate(bundle);
        setVolumeControlStream(1);
        this.mScreenHint = new ScreenHint(this);
        this.mThumbnailUpdater = new ThumbnailUpdater(this);
        this.mKeyguardManager = (KeyguardManager) getSystemService("keyguard");
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard) {
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
        }
        this.mApplication.addActivity(this);
        this.mCameraBrightness = new CameraBrightness(this);
        this.mLocationManager = LocationManager.instance();
        this.mCloseActivityThread = new Thread(new Runnable() {
            public void run() {
                ActivityBase.this.mApplication.closeAllActivitiesBut(ActivityBase.this);
            }
        });
        try {
            this.mCloseActivityThread.start();
        } catch (IllegalThreadStateException e) {
            Log.e(TAG, e.getMessage());
        }
    }

    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        checkGalleryLock();
        checkKeyguardFlag();
    }

    protected void onResume() {
        super.onResume();
        showBlurCover();
        this.mLastJumpFlag = this.mJumpFlag;
        this.mJumpFlag = 0;
        checkGalleryLock();
        checkKeyguardFlag();
        resume();
    }

    protected void showBlurCover() {
        if (!isShowBottomIntentDone()) {
            if ((!this.mDelayReleaseCamera || isPostProcessing()) && !getCameraIntentManager().isFromScreenSlide().booleanValue()) {
                final long currentTimeMillis = System.currentTimeMillis();
                this.mGLCoverDisposable = new Single<Bitmap>() {
                    protected void subscribeActual(SingleObserver<? super Bitmap> singleObserver) {
                        Object lastFrameGaussianBitmap;
                        if (ActivityBase.this.mCameraScreenNail != null) {
                            lastFrameGaussianBitmap = ActivityBase.this.mCameraScreenNail.getLastFrameGaussianBitmap();
                        } else {
                            lastFrameGaussianBitmap = null;
                        }
                        if (lastFrameGaussianBitmap == null || lastFrameGaussianBitmap.isRecycled()) {
                            lastFrameGaussianBitmap = BitmapFactory.decodeFile(new File(ActivityBase.this.getFilesDir(), Util.LAST_FRAME_GAUSSIAN_FILE_NAME).getAbsolutePath());
                            Log.d(ActivityBase.TAG, "showBlurCover: blur bitmap from user blur file!");
                        } else {
                            Log.d(ActivityBase.TAG, "showBlurCover: blur bitmap from memory!");
                        }
                        singleObserver.onSuccess(lastFrameGaussianBitmap);
                    }
                }.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Bitmap>() {
                    public void accept(Bitmap bitmap) {
                        if (bitmap == null || bitmap.isRecycled()) {
                            ActivityBase.this.mGLCoverView.setVisibility(8);
                        } else {
                            Rect displayRect = Util.getDisplayRect(ActivityBase.this.getApplicationContext());
                            ((MarginLayoutParams) ActivityBase.this.mGLCoverView.getLayoutParams()).topMargin = displayRect.top;
                            ActivityBase.this.mGLCoverView.setMaxWidth(displayRect.right - displayRect.left);
                            ActivityBase.this.mGLCoverView.setMaxHeight(displayRect.bottom - displayRect.top);
                            ActivityBase.this.mGLCoverView.setImageBitmap(bitmap);
                            ActivityBase.this.mGLCoverView.setAlpha(1.0f);
                            ActivityBase.this.mGLCoverView.setVisibility(0);
                        }
                        String str = ActivityBase.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("showBlurCover: show... cost time = ");
                        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                        stringBuilder.append("ms");
                        Log.d(str, stringBuilder.toString());
                    }
                });
            }
        }
    }

    protected void trackAppLunchTimeStart(boolean z) {
        ScenarioTrackUtil.trackAppLunchTimeStart(z);
        this.mTrackAppLunchDisposable = new Single<HashMap>() {
            protected void subscribeActual(SingleObserver<? super HashMap> singleObserver) {
                HashMap hashMap = new HashMap();
                String execCommand = Util.execCommand("cat /dev/cpuset/camera-daemon/cpus", false);
                if (execCommand != null) {
                    hashMap.put("cpus", execCommand);
                    execCommand = Util.execCommand("cat $(dirname $(grep -nir \"xo_therm\" /sys/class/thermal/thermal_zone*/type))/temp", false);
                    if (execCommand != null) {
                        hashMap.put("temperature", execCommand);
                        execCommand = Util.execCommand("cat /proc/meminfo|grep -E 'MemFree|MemAvailable'", true);
                        if (execCommand != null) {
                            String[] split = execCommand.split("\r\n");
                            if (split.length == 2) {
                                for (String split2 : split) {
                                    String[] split3 = split2.split(":");
                                    hashMap.put(split3[0], split3[1].replaceAll("\\D", ""));
                                }
                                singleObserver.onSuccess(hashMap);
                            }
                        }
                    }
                }
            }
        }.subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<HashMap>() {
            public void accept(HashMap hashMap) {
                ActivityBase.this.mAppLunchMap = hashMap;
            }
        });
    }

    protected boolean isShowBottomIntentDone() {
        if (getCameraIntentManager().isImageCaptureIntent() || getCameraIntentManager().isVideoCaptureIntent()) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_action) == 4083) {
                return true;
            }
        }
        return false;
    }

    protected boolean getKeyguardFlag() {
        if (this.mKeyguardManager != null && getIntent().getBooleanExtra("StartActivityWhenLocked", false) && this.mKeyguardManager.isKeyguardLocked()) {
            return true;
        }
        return false;
    }

    private void checkGalleryLock() {
        this.mGalleryLocked = Util.isAppLocked(this, Util.REVIEW_ACTIVITY_PACKAGE);
    }

    private void checkKeyguardFlag() {
        String str;
        this.mStartFromKeyguard = getKeyguardFlag();
        if (this.mStartFromKeyguard && !this.mIsFinishInKeyguard) {
            getWindow().addFlags(524288);
            this.mKeyguardSecureLocked = this.mKeyguardManager.isKeyguardSecure();
            DataRepository.dataItemGlobal().setStartFromKeyguard(this.mKeyguardSecureLocked);
            this.mIsFinishInKeyguard = false;
            this.mHandler.sendEmptyMessageDelayed(1, 100);
        }
        if (!this.mKeyguardSecureLocked && !isGalleryLocked()) {
            this.mSecureUriList = null;
        } else if (this.mSecureUriList == null) {
            this.mSecureUriList = new ArrayList();
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("checkKeyguard: fromKeyguard=");
        stringBuilder.append(this.mStartFromKeyguard);
        stringBuilder.append(" keyguardSecureLocked=");
        stringBuilder.append(this.mKeyguardSecureLocked);
        stringBuilder.append(" secureUriList is ");
        if (this.mSecureUriList == null) {
            str = TEDefine.FACE_BEAUTY_NULL;
        } else {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("not null (");
            stringBuilder2.append(this.mSecureUriList.size());
            stringBuilder2.append(")");
            str = stringBuilder2.toString();
        }
        stringBuilder.append(str);
        Log.v(str2, stringBuilder.toString());
    }

    protected void onStart() {
        super.onStart();
        this.mGLView.onResume();
    }

    protected void onPause() {
        super.onPause();
        if (!(this.mCameraScreenNail == null || isShowBottomIntentDone())) {
            Log.d(TAG, "onPause: readLastFrameGaussian...");
            this.mCameraScreenNail.readLastFrameGaussian();
        }
        if (this.mGLCoverDisposable != null) {
            this.mGLCoverDisposable.dispose();
        }
        if (this.mErrorDialog != null) {
            this.mErrorDialog.dismiss();
        }
        pause();
        if (startFromKeyguard() && this.mIsFinishInKeyguard) {
            getWindow().clearFlags(2097152);
            if (this.mJumpFlag == 0) {
                finish();
            }
        }
        if (this.mJumpFlag == 0 && (startFromSecureKeyguard() || isGalleryLocked())) {
            this.mSecureUriList = null;
            this.mThumbnailUpdater.setThumbnail(null, true, false);
        } else if (this.mJumpFlag == 1) {
            clearNotification();
        }
        this.mHandler.removeMessages(1);
    }

    protected void onStop() {
        super.onStop();
        this.mGLView.onPause();
        releaseCameraScreenNail();
    }

    public void resume() {
        if (this.mCameraSound == null) {
            this.mCameraSound = new MiuiCameraSound(this);
        }
        this.mLocationManager.recordLocation(CameraSettings.isRecordLocation());
        this.mCameraBrightness.onResume();
    }

    public void pause() {
        this.mHandler.removeCallbacksAndMessages(null);
        this.mCameraBrightness.onPause();
        if (this.mCloseActivityThread != null) {
            try {
                this.mCloseActivityThread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.mCloseActivityThread = null;
        }
        if (this.mLocationManager != null) {
            this.mLocationManager.recordLocation(false);
        }
        if (this.mThumbnailUpdater != null) {
            this.mThumbnailUpdater.saveThumbnailToFile();
            this.mThumbnailUpdater.cancelTask();
        }
    }

    public V6CameraGLSurfaceView getGLView() {
        return this.mGLView;
    }

    public ScreenHint getScreenHint() {
        return this.mScreenHint;
    }

    public boolean onSearchRequested() {
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 84 && keyEvent.isLongPress()) {
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onSaveInstanceState(bundle);
        }
    }

    protected void onDestroy() {
        if (this.mCameraScreenNail != null) {
            final Bitmap lastFrameGaussianBitmap = this.mCameraScreenNail.getLastFrameGaussianBitmap();
            if (lastFrameGaussianBitmap != null) {
                Schedulers.io().scheduleDirect(new Runnable() {
                    public void run() {
                        Util.saveLastFrameGaussian2File(lastFrameGaussianBitmap);
                    }
                });
            }
        }
        PopupManager.removeInstance(this);
        this.mApplication.removeActivity(this);
        if (this.mTrackAppLunchDisposable != null) {
            this.mTrackAppLunchDisposable.dispose();
            this.mTrackAppLunchDisposable = null;
        }
        if (this.mCameraSound != null) {
            this.mCameraSound.release();
            this.mCameraSound = null;
        }
        super.onDestroy();
    }

    public void createCameraScreenNail(boolean z, boolean z2) {
        if (this.mCameraScreenNail == null) {
            this.mCameraScreenNail = new CameraScreenNail(new NailListener() {
                public void onSurfaceTextureCreated(SurfaceTexture surfaceTexture) {
                }

                public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.onSurfaceTextureUpdated(drawExtTexAttribute);
                    }
                }

                public void onSurfaceTextureReleased() {
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.onSurfaceTextureReleased();
                    }
                }

                public void onPreviewTextureCopied() {
                }

                public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
                    ActivityBase.this.mCurrentModule.onPreviewPixelsRead(bArr, i, i2);
                }

                public void onFrameAvailable(int i) {
                    if (1 == i && ActivityBase.this.mAppStartTime != 0) {
                        try {
                            long currentTimeMillis = System.currentTimeMillis() - ActivityBase.this.mAppStartTime;
                            CameraStatUtil.trackStartAppCost(currentTimeMillis);
                            if (ActivityBase.this.mAppLunchMap != null) {
                                ScenarioTrackUtil.trackAppLunchTimeEnd(ActivityBase.this.mAppLunchMap, ActivityBase.this.getApplicationContext());
                            } else {
                                ScenarioTrackUtil.trackScenarioAbort(ScenarioTrackUtil.sLaunchTimeScenario);
                            }
                            String str = ActivityBase.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("onFrameAvailable: trackStartAppCost: ");
                            stringBuilder.append(currentTimeMillis);
                            Log.d(str, stringBuilder.toString());
                        } catch (IllegalArgumentException e) {
                            String str2 = ActivityBase.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append(e.getMessage());
                            stringBuilder2.append(", start time: ");
                            stringBuilder2.append(ActivityBase.this.mAppStartTime);
                            stringBuilder2.append(", now: ");
                            stringBuilder2.append(System.currentTimeMillis());
                            Log.w(str2, stringBuilder2.toString());
                        }
                        ActivityBase.this.mAppStartTime = 0;
                    }
                    if (ActivityBase.this.mGLCoverView != null) {
                        ActivityBase.this.mGLCoverView.post(new Runnable() {
                            public void run() {
                                ActivityBase.this.mGLCoverView.animate().alpha(0.0f).withEndAction(new Runnable() {
                                    public void run() {
                                        ActivityBase.this.mGLCoverView.setVisibility(8);
                                    }
                                }).start();
                            }
                        });
                    }
                    ActivityBase.this.notifyOnFirstFrameArrived(i);
                }

                public int getOrientation() {
                    return ActivityBase.this.mOrientation;
                }

                public boolean isKeptBitmapTexture() {
                    return ActivityBase.this.mCurrentModule.isKeptBitmapTexture();
                }
            }, new RequestRenderListener() {
                public void requestRender() {
                    ActivityBase.this.mGLView.requestRender();
                    if (ActivityBase.this.mCurrentModule != null) {
                        ActivityBase.this.mCurrentModule.requestRender();
                    }
                }
            });
        }
        initCameraScreenNail();
    }

    public void initCameraScreenNail() {
        Log.d(TAG, "initCameraScreenNail");
        if (this.mCameraScreenNail != null && this.mCameraScreenNail.getSurfaceTexture() == null) {
            Display defaultDisplay = getWindowManager().getDefaultDisplay();
            Point point = new Point();
            defaultDisplay.getSize(point);
            this.mCameraScreenNail.setPreviewSize(point.x, point.y);
        }
    }

    protected void releaseCameraScreenNail() {
        Log.d(TAG, "releaseCameraScreenNail: ");
        if (this.mCameraScreenNail != null) {
            this.mCameraScreenNail.releaseSurfaceTexture();
        }
        if (this.mCurrentModule != null) {
            this.mCurrentModule.setFrameAvailable(false);
        }
    }

    public void onLayoutChange(Rect rect) {
        this.mCameraScreenNail.setRenderArea(rect);
        if (Util.getDisplayRotation(this) % 180 == 0) {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.width(), rect.height());
        } else {
            this.mCameraScreenNail.setPreviewFrameLayoutSize(rect.height(), rect.width());
        }
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public ThumbnailUpdater getThumbnailUpdater() {
        return this.mThumbnailUpdater;
    }

    public void onNewUriArrived(Uri uri, String str) {
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onNewUriArrived(uri, str);
        }
        addSecureUriIfNecessary(uri);
    }

    private void addSecureUriIfNecessary(Uri uri) {
        if (this.mSecureUriList != null) {
            if (this.mSecureUriList.size() == 100) {
                this.mSecureUriList.remove(0);
            }
            this.mSecureUriList.add(uri);
        }
    }

    public boolean startFromSecureKeyguard() {
        return this.mKeyguardSecureLocked;
    }

    public boolean isGalleryLocked() {
        return this.mGalleryLocked;
    }

    public boolean startFromKeyguard() {
        return this.mStartFromKeyguard;
    }

    public CameraScreenNail getCameraScreenNail() {
        return this.mCameraScreenNail;
    }

    public void playCameraSound(int i) {
        this.mCameraSound.playSound(i);
    }

    public void loadCameraSound(int i) {
        if (this.mCameraSound != null) {
            this.mCameraSound.load(i);
        }
    }

    public long getSoundPlayTime() {
        if (this.mCameraSound != null) {
            return this.mCameraSound.getLastSoundPlayTime();
        }
        return 0;
    }

    public void gotoGallery() {
        if (!isActivityPaused()) {
            Thumbnail thumbnail = this.mThumbnailUpdater.getThumbnail();
            if (thumbnail != null) {
                Uri uri = thumbnail.getUri();
                if (uri == null) {
                    Log.e(TAG, "Uri null!");
                    if (!thumbnail.isWaitingForUri()) {
                        getThumbnailUpdater().getLastThumbnailUncached();
                    }
                } else if (Util.isUriValid(uri, getContentResolver())) {
                    try {
                        Intent intent = new Intent(Util.REVIEW_ACTION, uri);
                        intent.setPackage(Util.REVIEW_ACTIVITY_PACKAGE);
                        intent.putExtra(Util.KEY_REVIEW_FROM_MIUICAMERA, true);
                        if (b.gi()) {
                            if (!b.hQ()) {
                                intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS, this.mCameraBrightness.getCurrentBrightness());
                            } else if (this.mCameraBrightness.getCurrentBrightnessManual() != -1) {
                                intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS_MANUAL, this.mCameraBrightness.getCurrentBrightnessManual());
                            } else {
                                intent.putExtra(Util.KEY_CAMERA_BRIGHTNESS_AUTO, this.mCameraBrightness.getCurrentBrightnessAuto());
                            }
                        }
                        if (startFromKeyguard()) {
                            intent.putExtra("StartActivityWhenLocked", true);
                        }
                        if (Util.isAppLocked(this, Util.REVIEW_ACTIVITY_PACKAGE)) {
                            intent.putExtra(Util.EXTRAS_SKIP_LOCK, true);
                        }
                        if (this.mSecureUriList != null) {
                            intent.putParcelableArrayListExtra(Util.KEY_SECURE_ITEMS, this.mSecureUriList);
                        }
                        startActivity(intent);
                        this.mJumpFlag = 1;
                        this.mJumpedToGallery = true;
                        if (this.mCurrentModule != null) {
                            this.mCurrentModule.enableCameraControls(false);
                            CameraStatUtil.trackGotoGallery(this.mCurrentModule.getModuleIndex());
                        }
                    } catch (ActivityNotFoundException e) {
                        try {
                            startActivity(new Intent("android.intent.action.VIEW", uri));
                        } catch (Throwable e2) {
                            String str = TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("review image fail. uri=");
                            stringBuilder.append(uri);
                            Log.e(str, stringBuilder.toString(), e2);
                        }
                    }
                } else {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Uri invalid. uri=");
                    stringBuilder2.append(uri);
                    Log.e(str2, stringBuilder2.toString());
                }
            }
        }
    }

    protected void onActivityResult(int i, int i2, Intent intent) {
        this.mCurrentModule.onActivityResult(i, i2, intent);
    }

    public Module getCurrentModule() {
        return this.mCurrentModule;
    }

    public ArrayList<Uri> getSecureUriList() {
        return this.mSecureUriList;
    }

    public boolean isGotoGallery() {
        return this.mJumpFlag == 1;
    }

    public boolean isJumpBack() {
        return this.mLastJumpFlag != 0;
    }

    public void setJumpFlag(int i) {
        this.mJumpFlag = i;
    }

    public void dismissKeyguard() {
        if (this.mStartFromKeyguard) {
            sendBroadcast(new Intent(Util.ACTION_DISMISS_KEY_GUARD));
        }
    }

    public boolean isSwitchingModule() {
        return this.mIsSwitchingModule;
    }

    public void setSwitchingModule(boolean z) {
        this.mIsSwitchingModule = z;
    }

    public boolean isActivityPaused() {
        return this.mActivityPaused;
    }

    private void clearNotification() {
        NotificationManager notificationManager = (NotificationManager) getSystemService("notification");
        if (notificationManager != null) {
            notificationManager.cancelAll();
        }
    }

    /* JADX WARNING: Missing block: B:20:0x0034, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean hasSurface() {
        int i = this.mCurrentSurfaceState;
        if (i != 2) {
            if (i == 4) {
                if (getCameraScreenNail().getSurfaceTexture() != null) {
                    return true;
                }
                this.mGLView.onResume();
                return false;
            }
        } else if (Util.sIsFullScreenNavBarHidden) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ActivityBase.this.mGLView.setVisibility(4);
                    ActivityBase.this.mGLView.setVisibility(0);
                }
            });
        } else {
            this.mGLView.onResume();
        }
    }

    public synchronized void updateSurfaceState(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateSurfaceState: ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        this.mCurrentSurfaceState = i;
    }

    public void resetStartTime() {
        this.mAppStartTime = 0;
    }

    public CameraIntentManager getCameraIntentManager() {
        if (this.mCameraIntentManager == null) {
            this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        }
        return this.mCameraIntentManager;
    }

    public boolean isPostProcessing() {
        return this.mCurrentModule != null && this.mCurrentModule.isCreated() && this.mCurrentModule.isPostProcessing();
    }
}
