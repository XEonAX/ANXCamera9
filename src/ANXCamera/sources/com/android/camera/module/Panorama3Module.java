package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraCaptureSession;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.format.DateFormat;
import android.util.Size;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.AutoLockManager;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ExifHelper;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.panorama.AttachRunnable;
import com.android.camera.panorama.Camera1Image;
import com.android.camera.panorama.Camera2Image;
import com.android.camera.panorama.CaptureImage;
import com.android.camera.panorama.DirectionFunction;
import com.android.camera.panorama.DownDirectionFunction;
import com.android.camera.panorama.GyroscopeRoundDetector;
import com.android.camera.panorama.InputSave;
import com.android.camera.panorama.LeftDirectionFunction;
import com.android.camera.panorama.MorphoPanoramaGP3;
import com.android.camera.panorama.MorphoPanoramaGP3.InitParam;
import com.android.camera.panorama.MorphoSensorFusion.SensorData;
import com.android.camera.panorama.PanoramaGP3ImageFormat;
import com.android.camera.panorama.PanoramaSetting;
import com.android.camera.panorama.PanoramaState;
import com.android.camera.panorama.PositionDetector;
import com.android.camera.panorama.RightDirectionFunction;
import com.android.camera.panorama.RoundDetector;
import com.android.camera.panorama.SensorFusion;
import com.android.camera.panorama.SensorInfoManager;
import com.android.camera.panorama.UpDirectionFunction;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;

@TargetApi(21)
public class Panorama3Module extends BaseModule implements SensorEventListener, CameraAction, CameraPreviewCallback {
    private static final int MIN_SHOOTING_TIME = 600;
    private static final int PREVIEW_SKIP_COUNT = 1;
    private static final String TAG = Panorama3Module.class.getSimpleName();
    public static final Object mEngineLock = new Object();
    private static final Object mPreviewImageLock = new Object();
    private static final CaptureImage sAttachExit = new Camera1Image(null, 0, 0);
    private Sensor mAccelerometer = null;
    private final LinkedBlockingQueue<CaptureImage> mAttachImageQueue = new LinkedBlockingQueue();
    private int mAttachPosOffsetX;
    private int mAttachPosOffsetY;
    private int mCameraOrientation = 0;
    private volatile boolean mCanSavePanorama = false;
    private boolean mCaptureOrientationDecided = false;
    private SensorInfoManager mCurrentSensorInfoManager;
    private final Object mDeviceLock = new Object();
    private int mDeviceOrientationAtCapture;
    private int mDirection;
    private DirectionFunction mDirectionFunction;
    private Bitmap mDispPreviewImage;
    private Canvas mDispPreviewImageCanvas;
    private Paint mDispPreviewImagePaint;
    private final ExecutorService mExecutor = Executors.newCachedThreadPool();
    private int mGoalAngle = 280;
    private float[] mGravities;
    private Sensor mGyroscope = null;
    private Sensor mGyroscopeUncalibrated = null;
    private String mImageFormat = PanoramaGP3ImageFormat.YVU420_SEMIPLANAR;
    private InitParam mInitParam = new InitParam();
    private volatile boolean mIsRegisterGravitySensor = false;
    private boolean mIsSensorAverage;
    private volatile boolean mIsShooting = false;
    private Location mLocation;
    private float mLongSideCropRatio = 0.8766f;
    private Sensor mMagnetic;
    protected final Handler mMainHandler = new MainHandler(this, null);
    private int mMaxHeight;
    private int mMaxWidth;
    private MorphoPanoramaGP3 mMorphoPanoramaGP3;
    private PanoramaSetting mPanoramaSetting;
    private long mPanoramaShootingStartTime;
    private PanoramaState mPanoramaState;
    private int mPictureHeight;
    private int mPictureWidth;
    private Bitmap mPreviewImage;
    private int mPreviewRefY;
    private volatile boolean mRequestStop = false;
    private Sensor mRotationVector = null;
    private RoundDetector mRoundDetector;
    private SaveOutputImageTask mSaveOutputImageTask;
    private int mSensorCnt;
    private SensorFusion mSensorFusion = null;
    private int mSensorFusionMode;
    private ArrayList<SensorInfoManager> mSensorInfoManagerList;
    private SensorManager mSensorManager;
    private HandlerThread mSensorThread = null;
    private String mShutterEndTime;
    private String mShutterStartTime;
    private int mSmallPreviewHeight;
    private int mSnapshotFocusMode = 1;
    private int mTargetFocusMode = 4;
    private long mTimeTaken;
    private float mViewAngleH = 71.231476f;
    private float mViewAngleV = 56.49462f;

    private class DecideDirection extends PanoramaState {
        private boolean mHasSubmit;

        private class DecideDirectionAttach extends AttachRunnable {

            private class DecideRunnable implements Runnable {
                private DecideRunnable() {
                }

                /* synthetic */ DecideRunnable(DecideDirectionAttach decideDirectionAttach, AnonymousClass1 anonymousClass1) {
                    this();
                }

                public void run() {
                    Panorama3Module.this.unregisterGravitySensorListener();
                    if (Panorama3Module.this.mRequestStop) {
                        Log.w(Panorama3Module.TAG, "DecideRunnable exit request stop");
                        return;
                    }
                    Log.d(Panorama3Module.TAG, "go to PanoramaPreview in DecideRunnable");
                    Panorama3Module.this.mPanoramaState = new PanoramaPreview(Panorama3Module.this);
                    Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(DecideDirection.this.listener);
                    DecideDirection.this.clearListener();
                }
            }

            private DecideDirectionAttach() {
            }

            /* synthetic */ DecideDirectionAttach(DecideDirection decideDirection, AnonymousClass1 anonymousClass1) {
                this();
            }

            private int getScaleV() {
                return (int) Math.max(1.0f, (((float) Panorama3Module.this.mMaxHeight) / (((float) Panorama3Module.this.mSmallPreviewHeight) / Panorama3Module.this.mLongSideCropRatio)) - 1.0f);
            }

            private int getScaleH() {
                return Math.max(1, (Panorama3Module.this.mMaxHeight / Util.sWindowHeight) * 2);
            }

            /* JADX WARNING: Missing block: B:24:0x00c5, code:
            if (r5 != false) goto L_0x00df;
     */
            /* JADX WARNING: Missing block: B:25:0x00c7, code:
            r5 = com.android.camera.module.Panorama3Module.access$100();
            r6 = new java.lang.StringBuilder();
            r6.append("DecideDirectionAttach error ret:");
            r6.append(r0);
            com.android.camera.log.Log.e(r5, r6.toString());
     */
            /* JADX WARNING: Missing block: B:26:0x00df, code:
            com.android.camera.log.Log.e(com.android.camera.module.Panorama3Module.access$100(), java.lang.String.format(java.util.Locale.US, "attach error ret:0x%08X", new java.lang.Object[]{java.lang.Integer.valueOf(r0)}));
     */
            /* JADX WARNING: Missing block: B:29:?, code:
            closeSrc();
     */
            /* JADX WARNING: Missing block: B:30:0x00fa, code:
            return;
     */
            /* JADX WARNING: Missing block: B:38:?, code:
            closeSrc();
     */
            /* JADX WARNING: Missing block: B:53:?, code:
            closeSrc();
            com.android.camera.module.Panorama3Module.access$4102(r1.this$1.this$0, r0);
            createDirection(r0);
     */
            /* JADX WARNING: Missing block: B:54:0x01d5, code:
            if (com.android.camera.module.Panorama3Module.access$4200(r1.this$1.this$0).enabled() == false) goto L_0x01d8;
     */
            public void run() {
                /*
                r19 = this;
                r1 = r19;
            L_0x0002:
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = r0.mAttachImageQueue;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = r0.take();	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = (com.android.camera.panorama.CaptureImage) r0;	 Catch:{ InterruptedException -> 0x01e3 }
                r2 = com.android.camera.module.Panorama3Module.sAttachExit;	 Catch:{ InterruptedException -> 0x01e3 }
                if (r0 == r2) goto L_0x01e2;
            L_0x0016:
                r1.setImage(r0);	 Catch:{ all -> 0x01dd }
                r2 = com.android.camera.module.Panorama3Module.mEngineLock;	 Catch:{ all -> 0x01dd }
                monitor-enter(r2);	 Catch:{ all -> 0x01dd }
                r3 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r3 = r3.mMorphoPanoramaGP3;	 Catch:{ all -> 0x01da }
                r3 = r3.getAttachCount();	 Catch:{ all -> 0x01da }
                r5 = 5;
                r3 = r3 % r5;
                r5 = 0;
                r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1));
                r4 = 1;
                if (r3 != 0) goto L_0x0040;
            L_0x0032:
                r3 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r3.setInitialRotationByGravity();	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r3.mIsSensorAverage = r4;	 Catch:{ all -> 0x01da }
            L_0x0040:
                r3 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r3.setSensorFusionValue(r0);	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r0 = r0.mRequestStop;	 Catch:{ all -> 0x01da }
                if (r0 == 0) goto L_0x005f;
            L_0x0051:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r3 = "DecideDirectionAttach request stop";
                com.android.camera.log.Log.e(r0, r3);	 Catch:{ all -> 0x01da }
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                return;
            L_0x005f:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r3 = "DecideDirectionAttach attach start";
                com.android.camera.log.Log.d(r0, r3);	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r5 = r0.mMorphoPanoramaGP3;	 Catch:{ all -> 0x01da }
                r0 = r1.byteBuffer;	 Catch:{ all -> 0x01da }
                r3 = 0;
                r6 = r0[r3];	 Catch:{ all -> 0x01da }
                r0 = r1.byteBuffer;	 Catch:{ all -> 0x01da }
                r7 = r0[r4];	 Catch:{ all -> 0x01da }
                r0 = r1.byteBuffer;	 Catch:{ all -> 0x01da }
                r15 = 2;
                r8 = r0[r15];	 Catch:{ all -> 0x01da }
                r0 = r1.rowStride;	 Catch:{ all -> 0x01da }
                r9 = r0[r3];	 Catch:{ all -> 0x01da }
                r0 = r1.rowStride;	 Catch:{ all -> 0x01da }
                r10 = r0[r4];	 Catch:{ all -> 0x01da }
                r0 = r1.rowStride;	 Catch:{ all -> 0x01da }
                r11 = r0[r15];	 Catch:{ all -> 0x01da }
                r0 = r1.pixelStride;	 Catch:{ all -> 0x01da }
                r12 = r0[r3];	 Catch:{ all -> 0x01da }
                r0 = r1.pixelStride;	 Catch:{ all -> 0x01da }
                r13 = r0[r4];	 Catch:{ all -> 0x01da }
                r0 = r1.pixelStride;	 Catch:{ all -> 0x01da }
                r14 = r0[r15];	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r0 = r0.mCurrentSensorInfoManager;	 Catch:{ all -> 0x01da }
                r16 = 0;
                r15 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r15 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r15 = r15.getActivity();	 Catch:{ all -> 0x01da }
                r17 = r15.getApplicationContext();	 Catch:{ all -> 0x01da }
                r15 = r0;
                r0 = r5.attach(r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17);	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r6 = "DecideDirectionAttach attach end";
                com.android.camera.log.Log.d(r5, r6);	 Catch:{ all -> 0x01da }
                r5 = -1073741823; // 0xffffffffc0000001 float:-2.0000002 double:NaN;
                if (r0 != r5) goto L_0x00c1;
            L_0x00bf:
                r5 = r4;
                goto L_0x00c3;
                r5 = r3;
            L_0x00c3:
                if (r0 == 0) goto L_0x00fb;
            L_0x00c5:
                if (r5 != 0) goto L_0x00df;
            L_0x00c7:
                r5 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01da }
                r6.<init>();	 Catch:{ all -> 0x01da }
                r7 = "DecideDirectionAttach error ret:";
                r6.append(r7);	 Catch:{ all -> 0x01da }
                r6.append(r0);	 Catch:{ all -> 0x01da }
                r6 = r6.toString();	 Catch:{ all -> 0x01da }
                com.android.camera.log.Log.e(r5, r6);	 Catch:{ all -> 0x01da }
            L_0x00df:
                r5 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r6 = java.util.Locale.US;	 Catch:{ all -> 0x01da }
                r7 = "attach error ret:0x%08X";
                r4 = new java.lang.Object[r4];	 Catch:{ all -> 0x01da }
                r0 = java.lang.Integer.valueOf(r0);	 Catch:{ all -> 0x01da }
                r4[r3] = r0;	 Catch:{ all -> 0x01da }
                r0 = java.lang.String.format(r6, r7, r4);	 Catch:{ all -> 0x01da }
                com.android.camera.log.Log.e(r5, r0);	 Catch:{ all -> 0x01da }
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                return;
            L_0x00fb:
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r0 = r0.mInitParam;	 Catch:{ all -> 0x01da }
                r0 = r0.direction;	 Catch:{ all -> 0x01da }
                r0 = r1.isUnDecideDirection(r0);	 Catch:{ all -> 0x01da }
                if (r0 == 0) goto L_0x0129;
            L_0x010b:
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r0 = r0.mMorphoPanoramaGP3;	 Catch:{ all -> 0x01da }
                r0 = r0.getDirection();	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r5 = r5.mInitParam;	 Catch:{ all -> 0x01da }
                r5 = r5.direction;	 Catch:{ all -> 0x01da }
                if (r0 != r5) goto L_0x0133;
            L_0x0123:
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                goto L_0x0002;
            L_0x0129:
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r0 = r0.mInitParam;	 Catch:{ all -> 0x01da }
                r0 = r0.direction;	 Catch:{ all -> 0x01da }
            L_0x0133:
                r5 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01da }
                r6.<init>();	 Catch:{ all -> 0x01da }
                r7 = "getDirection = ";
                r6.append(r7);	 Catch:{ all -> 0x01da }
                r6.append(r0);	 Catch:{ all -> 0x01da }
                r6 = r6.toString();	 Catch:{ all -> 0x01da }
                com.android.camera.log.Log.d(r5, r6);	 Catch:{ all -> 0x01da }
                r5 = 2;
                r5 = new int[r5];	 Catch:{ all -> 0x01da }
                r6 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r6 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r6 = r6.mMorphoPanoramaGP3;	 Catch:{ all -> 0x01da }
                r6 = r6.getOutputImageSize(r5);	 Catch:{ all -> 0x01da }
                if (r6 == 0) goto L_0x0178;
            L_0x015c:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r5 = java.util.Locale.US;	 Catch:{ all -> 0x01da }
                r7 = "getOutputImageSize error ret:0x%08X";
                r4 = new java.lang.Object[r4];	 Catch:{ all -> 0x01da }
                r6 = java.lang.Integer.valueOf(r6);	 Catch:{ all -> 0x01da }
                r4[r3] = r6;	 Catch:{ all -> 0x01da }
                r3 = java.lang.String.format(r5, r7, r4);	 Catch:{ all -> 0x01da }
                com.android.camera.log.Log.e(r0, r3);	 Catch:{ all -> 0x01da }
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                return;
            L_0x0178:
                r6 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r6 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r3 = r5[r3];	 Catch:{ all -> 0x01da }
                r6.mMaxWidth = r3;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r4 = r5[r4];	 Catch:{ all -> 0x01da }
                r3.mMaxHeight = r4;	 Catch:{ all -> 0x01da }
                r3 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01da }
                r4 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01da }
                r4.<init>();	 Catch:{ all -> 0x01da }
                r5 = "mMaxWidth = ";
                r4.append(r5);	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r5 = r5.mMaxWidth;	 Catch:{ all -> 0x01da }
                r4.append(r5);	 Catch:{ all -> 0x01da }
                r5 = ", mMaxHeight = ";
                r4.append(r5);	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ all -> 0x01da }
                r5 = com.android.camera.module.Panorama3Module.this;	 Catch:{ all -> 0x01da }
                r5 = r5.mMaxHeight;	 Catch:{ all -> 0x01da }
                r4.append(r5);	 Catch:{ all -> 0x01da }
                r4 = r4.toString();	 Catch:{ all -> 0x01da }
                com.android.camera.log.Log.d(r3, r4);	 Catch:{ all -> 0x01da }
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                r2 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r2 = com.android.camera.module.Panorama3Module.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r2.mDirection = r0;	 Catch:{ InterruptedException -> 0x01e3 }
                r1.createDirection(r0);	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = com.android.camera.module.Panorama3Module.this;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = r0.mDirectionFunction;	 Catch:{ InterruptedException -> 0x01e3 }
                r0 = r0.enabled();	 Catch:{ InterruptedException -> 0x01e3 }
                if (r0 == 0) goto L_0x01d8;
            L_0x01d7:
                goto L_0x01e2;
            L_0x01d8:
                goto L_0x0002;
            L_0x01da:
                r0 = move-exception;
                monitor-exit(r2);	 Catch:{ all -> 0x01da }
                throw r0;	 Catch:{ all -> 0x01dd }
            L_0x01dd:
                r0 = move-exception;
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x01e3 }
                throw r0;	 Catch:{ InterruptedException -> 0x01e3 }
            L_0x01e2:
                goto L_0x01e7;
            L_0x01e3:
                r0 = move-exception;
                r0.printStackTrace();
            L_0x01e7:
                r0 = com.android.camera.module.Panorama3Module.DecideDirection.this;
                r0 = com.android.camera.module.Panorama3Module.this;
                r0 = r0.getActivity();
                r2 = new com.android.camera.module.Panorama3Module$DecideDirection$DecideDirectionAttach$DecideRunnable;
                r3 = 0;
                r2.<init>(r1, r3);
                r0.runOnUiThread(r2);
                r0 = com.android.camera.module.Panorama3Module.TAG;
                r1 = "DecideDirectionAttach end";
                com.android.camera.log.Log.d(r0, r1);
                return;
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.DecideDirection.DecideDirectionAttach.run():void");
            }

            private boolean isUnDecideDirection(int i) {
                return i == -1 || i == 0 || i == 2 || i == 1;
            }

            private void createDirection(int i) {
                int scaleV;
                if (Panorama3Module.this.mInitParam.output_rotation == 90 || Panorama3Module.this.mInitParam.output_rotation == 270) {
                    switch (i) {
                        case 3:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_UP");
                            scaleV = getScaleV();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module.this.mDirectionFunction = new RightDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                                return;
                            } else {
                                Panorama3Module.this.mDirectionFunction = new LeftDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                                return;
                            }
                        case 4:
                            Log.i(Panorama3Module.TAG, "direction : VERTICAL_DOWN");
                            scaleV = getScaleV();
                            if (Panorama3Module.this.mCameraOrientation == 90) {
                                Panorama3Module.this.mDirectionFunction = new LeftDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                                return;
                            } else {
                                Panorama3Module.this.mDirectionFunction = new RightDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                                return;
                            }
                        default:
                            return;
                    }
                }
                switch (i) {
                    case 3:
                        Log.i(Panorama3Module.TAG, "direction : VERTICAL_UP");
                        scaleV = getScaleH();
                        if (Panorama3Module.this.mCameraOrientation == 90) {
                            Panorama3Module.this.mDirectionFunction = new UpDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                            return;
                        } else {
                            Panorama3Module.this.mDirectionFunction = new DownDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                            return;
                        }
                    case 4:
                        Log.i(Panorama3Module.TAG, "direction : VERTICAL_DOWN");
                        scaleV = getScaleH();
                        if (Panorama3Module.this.mCameraOrientation == 90) {
                            Panorama3Module.this.mDirectionFunction = new DownDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                            return;
                        } else {
                            Panorama3Module.this.mDirectionFunction = new UpDirectionFunction(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight, Panorama3Module.this.mMaxWidth, Panorama3Module.this.mMaxHeight, scaleV, Panorama3Module.this.mInitParam.output_rotation);
                            return;
                        }
                    default:
                        return;
                }
            }
        }

        private DecideDirection() {
            this.mHasSubmit = false;
        }

        /* synthetic */ DecideDirection(Panorama3Module panorama3Module, AnonymousClass1 anonymousClass1) {
            this();
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            Panorama3Module.this.addAttachQueue(captureImage);
            if (!this.mHasSubmit) {
                Log.d(Panorama3Module.TAG, "submit DecideDirectionAttach");
                Panorama3Module.this.mExecutor.submit(new DecideDirectionAttach(this, null));
                this.mHasSubmit = true;
            }
            return true;
        }
    }

    private class MainHandler extends Handler {
        private MainHandler() {
        }

        /* synthetic */ MainHandler(Panorama3Module panorama3Module, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void handleMessage(Message message) {
            if (!Panorama3Module.this.isCreated()) {
                removeCallbacksAndMessages(null);
            } else if (Panorama3Module.this.getActivity() != null) {
                int i = message.what;
                if (i != 2) {
                    if (i == 17) {
                        Panorama3Module.this.mMainHandler.removeMessages(17);
                        Panorama3Module.this.mMainHandler.removeMessages(2);
                        Panorama3Module.this.getWindow().addFlags(128);
                        Panorama3Module.this.mMainHandler.sendEmptyMessageDelayed(2, (long) Panorama3Module.this.getScreenDelay());
                    } else if (i == 45) {
                        Panorama3Module.this.setActivity(null);
                    } else if (i != 51) {
                        if (i != 53) {
                            switch (i) {
                                case 9:
                                    int uIStyleByPreview = CameraSettings.getUIStyleByPreview(Panorama3Module.this.mPreviewSize.width, Panorama3Module.this.mPreviewSize.height);
                                    if (uIStyleByPreview != Panorama3Module.this.mUIStyle) {
                                        Panorama3Module.this.mUIStyle = uIStyleByPreview;
                                    }
                                    Panorama3Module.this.registerGravitySensorListener();
                                    Panorama3Module.this.initPreviewLayout();
                                    break;
                                case 10:
                                    Panorama3Module.this.mOpenCameraFail = true;
                                    Panorama3Module.this.onCameraException();
                                    break;
                                default:
                                    StringBuilder stringBuilder;
                                    if (!BaseModule.DEBUG) {
                                        String access$100 = Panorama3Module.TAG;
                                        stringBuilder = new StringBuilder();
                                        stringBuilder.append("no consumer for this message: ");
                                        stringBuilder.append(message.what);
                                        Log.e(access$100, stringBuilder.toString());
                                        break;
                                    }
                                    stringBuilder = new StringBuilder();
                                    stringBuilder.append("no consumer for this message: ");
                                    stringBuilder.append(message.what);
                                    throw new RuntimeException(stringBuilder.toString());
                            }
                        }
                        Panorama3Module.this.resetUI();
                    } else if (!Panorama3Module.this.mActivity.isActivityPaused()) {
                        Panorama3Module.this.mOpenCameraFail = true;
                        Panorama3Module.this.onCameraException();
                    }
                }
                Panorama3Module.this.getWindow().clearFlags(128);
            }
        }
    }

    private class PanoramaFirst extends PanoramaState {
        private PanoramaFirst() {
        }

        /* synthetic */ PanoramaFirst(Panorama3Module panorama3Module, AnonymousClass1 anonymousClass1) {
            this();
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            captureImage.close();
            Panorama3Module.this.setNullDirectionFunction();
            if (Panorama3Module.this.mRequestStop) {
                Log.e(Panorama3Module.TAG, "PanoramaFirst.onSaveImage request stop");
                return false;
            }
            Panorama3Module.this.configMorphoPanoramaGP3();
            int start = Panorama3Module.this.mMorphoPanoramaGP3.start(Panorama3Module.this.mPictureWidth, Panorama3Module.this.mPictureHeight);
            if (start != 0) {
                String access$100 = Panorama3Module.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("start error resultCode:");
                stringBuilder.append(start);
                Log.e(access$100, stringBuilder.toString());
                return false;
            }
            Panorama3Module.this.mPanoramaState = new DecideDirection(Panorama3Module.this, null);
            Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(this.listener);
            clearListener();
            return true;
        }
    }

    private class PanoramaInit extends PanoramaState {
        private PanoramaInit() {
        }

        /* synthetic */ PanoramaInit(Panorama3Module panorama3Module, AnonymousClass1 anonymousClass1) {
            this();
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            Panorama3Module.this.mImageFormat = captureImage.getImageFormat();
            String access$100 = Panorama3Module.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("ImageFormat :");
            stringBuilder.append(Panorama3Module.this.mImageFormat);
            Log.i(access$100, stringBuilder.toString());
            synchronized (Panorama3Module.mEngineLock) {
                if (Panorama3Module.this.createEngine()) {
                    int inputImageFormat = Panorama3Module.this.mMorphoPanoramaGP3.setInputImageFormat(Panorama3Module.this.mImageFormat);
                    if (inputImageFormat != 0) {
                        String access$1002 = Panorama3Module.TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("setInputImageFormat error resultCode:");
                        stringBuilder2.append(inputImageFormat);
                        Log.e(access$1002, stringBuilder2.toString());
                    }
                    Panorama3Module.this.mPanoramaState = new PanoramaFirst(Panorama3Module.this, null);
                    Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(this.listener);
                    clearListener();
                    Panorama3Module.this.mPanoramaState.onSaveImage(captureImage);
                    return true;
                }
                Log.d(Panorama3Module.TAG, "go to PanoramaPreview in PanoramaInit");
                Panorama3Module.this.mPanoramaState = new PanoramaPreview(Panorama3Module.this);
                Panorama3Module.this.mPanoramaState.setPanoramaStateEventListener(this.listener);
                clearListener();
                captureImage.close();
                return true;
            }
        }
    }

    private class PanoramaPreview extends PanoramaState {
        private PositionDetector mDetector;
        private boolean mHasSubmit;
        private int mPreviewImgHeight = 0;
        private int mPreviewImgWidth = 0;
        private final UiUpdateRunnable mUiUpdateRunnable = new UiUpdateRunnable(this, null);
        final /* synthetic */ Panorama3Module this$0;

        private class PreviewAttach extends AttachRunnable {
            public final boolean DUMP_YUV;
            private InputSave mInputSave;
            private boolean mIsAttachEnd;
            private final PostAttachRunnable mPostAttachRunnable;
            private int mResultCode;

            private class PostAttachRunnable implements Runnable {
                private PostAttachRunnable() {
                }

                /* synthetic */ PostAttachRunnable(PreviewAttach previewAttach, AnonymousClass1 anonymousClass1) {
                    this();
                }

                public void run() {
                    if (!PanoramaPreview.this.this$0.mPaused) {
                        PanoramaPreview.this.this$0.onPreviewMoving();
                        if (!PanoramaPreview.this.this$0.mCaptureOrientationDecided) {
                            PanoramaPreview.this.this$0.onCaptureOrientationDecided();
                        }
                        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
                        synchronized (Panorama3Module.mPreviewImageLock) {
                            if (panoramaProtocol != null) {
                                if (PanoramaPreview.this.this$0.mDispPreviewImage != null) {
                                    panoramaProtocol.setDisplayPreviewBitmap(PanoramaPreview.this.this$0.mDispPreviewImage);
                                }
                            }
                        }
                    }
                }
            }

            private PreviewAttach() {
                this.mIsAttachEnd = false;
                this.mPostAttachRunnable = new PostAttachRunnable(this, null);
                this.mInputSave = new InputSave();
                this.DUMP_YUV = SystemProperties.getBoolean("persist.camera.debug.panorama", false);
            }

            /* synthetic */ PreviewAttach(PanoramaPreview panoramaPreview, AnonymousClass1 anonymousClass1) {
                this();
            }

            /* JADX WARNING: Removed duplicated region for block: B:60:0x0161  */
            /* JADX WARNING: Removed duplicated region for block: B:58:0x0147  */
            /* JADX WARNING: Missing block: B:33:?, code:
            r1.this$1.this$0.getActivity().runOnUiThread(r1.mPostAttachRunnable);
            r0 = r18;
            checkAttachEnd(r0);
     */
            /* JADX WARNING: Missing block: B:34:0x010b, code:
            if (r1.mIsAttachEnd == false) goto L_0x0117;
     */
            /* JADX WARNING: Missing block: B:35:0x010d, code:
            com.android.camera.log.Log.d(com.android.camera.module.Panorama3Module.access$100(), "preview attach end");
     */
            /* JADX WARNING: Missing block: B:37:?, code:
            closeSrc();
     */
            /* JADX WARNING: Missing block: B:45:0x0123, code:
            r0 = th;
     */
            public void run() {
                /*
                r19 = this;
                r1 = r19;
                r0 = com.android.camera.module.Panorama3Module.TAG;
                r2 = "PreviewAttach.run start";
                com.android.camera.log.Log.d(r0, r2);
                r0 = 2;
                r15 = new double[r0];
            L_0x000f:
                r14 = -1;
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ InterruptedException -> 0x0130 }
                r2 = r2.this$0;	 Catch:{ InterruptedException -> 0x0130 }
                r2 = r2.mAttachImageQueue;	 Catch:{ InterruptedException -> 0x0130 }
                r2 = r2.take();	 Catch:{ InterruptedException -> 0x0130 }
                r2 = (com.android.camera.panorama.CaptureImage) r2;	 Catch:{ InterruptedException -> 0x0130 }
                r3 = com.android.camera.module.Panorama3Module.sAttachExit;	 Catch:{ InterruptedException -> 0x0130 }
                if (r2 == r3) goto L_0x012f;
            L_0x0024:
                r1.setImage(r2);	 Catch:{ all -> 0x0127 }
                r3 = r1.DUMP_YUV;	 Catch:{ all -> 0x0127 }
                if (r3 == 0) goto L_0x0038;
            L_0x002b:
                r3 = r1.mInputSave;	 Catch:{ all -> 0x0127 }
                r4 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x0127 }
                r4 = r4.this$0;	 Catch:{ all -> 0x0127 }
                r4 = r4.mImageFormat;	 Catch:{ all -> 0x0127 }
                r3.onSaveImage(r2, r4);	 Catch:{ all -> 0x0127 }
            L_0x0038:
                r16 = com.android.camera.module.Panorama3Module.mEngineLock;	 Catch:{ all -> 0x0127 }
                monitor-enter(r16);	 Catch:{ all -> 0x0127 }
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x011f }
                r3 = r3.this$0;	 Catch:{ all -> 0x011f }
                r3 = r3.mRequestStop;	 Catch:{ all -> 0x011f }
                if (r3 == 0) goto L_0x0053;
            L_0x0045:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x011f }
                r2 = "PreviewAttach request stop";
                com.android.camera.log.Log.w(r0, r2);	 Catch:{ all -> 0x011f }
                monitor-exit(r16);	 Catch:{ all -> 0x011f }
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x0130 }
                return;
            L_0x0053:
                r3 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x011f }
                r4 = "PreviewAttach attach start";
                com.android.camera.log.Log.v(r3, r4);	 Catch:{ all -> 0x011f }
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x011f }
                r3 = r3.this$0;	 Catch:{ all -> 0x011f }
                r3.setSensorFusionValue(r2);	 Catch:{ all -> 0x011f }
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x011f }
                r2 = r2.this$0;	 Catch:{ all -> 0x011f }
                r2 = r2.mMorphoPanoramaGP3;	 Catch:{ all -> 0x011f }
                r3 = r1.byteBuffer;	 Catch:{ all -> 0x011f }
                r17 = 0;
                r3 = r3[r17];	 Catch:{ all -> 0x011f }
                r4 = r1.byteBuffer;	 Catch:{ all -> 0x011f }
                r13 = 1;
                r4 = r4[r13];	 Catch:{ all -> 0x011f }
                r5 = r1.byteBuffer;	 Catch:{ all -> 0x011f }
                r5 = r5[r0];	 Catch:{ all -> 0x011f }
                r6 = r1.rowStride;	 Catch:{ all -> 0x011f }
                r6 = r6[r17];	 Catch:{ all -> 0x011f }
                r7 = r1.rowStride;	 Catch:{ all -> 0x011f }
                r7 = r7[r13];	 Catch:{ all -> 0x011f }
                r8 = r1.rowStride;	 Catch:{ all -> 0x011f }
                r8 = r8[r0];	 Catch:{ all -> 0x011f }
                r9 = r1.pixelStride;	 Catch:{ all -> 0x011f }
                r9 = r9[r17];	 Catch:{ all -> 0x011f }
                r10 = r1.pixelStride;	 Catch:{ all -> 0x011f }
                r10 = r10[r13];	 Catch:{ all -> 0x011f }
                r11 = r1.pixelStride;	 Catch:{ all -> 0x011f }
                r11 = r11[r0];	 Catch:{ all -> 0x011f }
                r12 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x011f }
                r12 = r12.this$0;	 Catch:{ all -> 0x011f }
                r12 = r12.mCurrentSensorInfoManager;	 Catch:{ all -> 0x011f }
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x011f }
                r0 = r0.this$0;	 Catch:{ all -> 0x011f }
                r0 = r0.getActivity();	 Catch:{ all -> 0x011f }
                r13 = r15;
                r18 = r15;
                r15 = r14;
                r14 = r0;
                r0 = r2.attach(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14);	 Catch:{ all -> 0x0125 }
                if (r0 == 0) goto L_0x00be;
            L_0x00ad:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x0125 }
                r2 = "PreviewAttach attach error.";
                com.android.camera.log.Log.e(r0, r2);	 Catch:{ all -> 0x0125 }
                r1.mResultCode = r15;	 Catch:{ all -> 0x0125 }
                monitor-exit(r16);	 Catch:{ all -> 0x0125 }
            L_0x00b9:
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x012d }
                goto L_0x012f;
            L_0x00be:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x0125 }
                r2 = "PreviewAttach attach end";
                com.android.camera.log.Log.v(r0, r2);	 Catch:{ all -> 0x0125 }
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x0125 }
                r0 = r0.this$0;	 Catch:{ all -> 0x0125 }
                r2 = 1;
                r0.mCanSavePanorama = r2;	 Catch:{ all -> 0x0125 }
                r19.updatePreviewImage();	 Catch:{ all -> 0x0125 }
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x0125 }
                r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0125 }
                r3.<init>();	 Catch:{ all -> 0x0125 }
                r4 = "mCenter = ";
                r3.append(r4);	 Catch:{ all -> 0x0125 }
                r4 = r18[r17];	 Catch:{ all -> 0x0125 }
                r3.append(r4);	 Catch:{ all -> 0x0125 }
                r4 = ", ";
                r3.append(r4);	 Catch:{ all -> 0x0125 }
                r4 = r18[r2];	 Catch:{ all -> 0x0125 }
                r3.append(r4);	 Catch:{ all -> 0x0125 }
                r2 = r3.toString();	 Catch:{ all -> 0x0125 }
                com.android.camera.log.Log.v(r0, r2);	 Catch:{ all -> 0x0125 }
                monitor-exit(r16);	 Catch:{ all -> 0x0125 }
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x0123 }
                r0 = r0.this$0;	 Catch:{ all -> 0x0123 }
                r0 = r0.getActivity();	 Catch:{ all -> 0x0123 }
                r2 = r1.mPostAttachRunnable;	 Catch:{ all -> 0x0123 }
                r0.runOnUiThread(r2);	 Catch:{ all -> 0x0123 }
                r0 = r18;
                r1.checkAttachEnd(r0);	 Catch:{ all -> 0x0123 }
                r2 = r1.mIsAttachEnd;	 Catch:{ all -> 0x0123 }
                if (r2 == 0) goto L_0x0117;
            L_0x010d:
                r0 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x0123 }
                r2 = "preview attach end";
                com.android.camera.log.Log.d(r0, r2);	 Catch:{ all -> 0x0123 }
                goto L_0x00b9;
            L_0x0117:
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x012d }
                r15 = r0;
                r0 = 2;
                goto L_0x000f;
            L_0x011f:
                r0 = move-exception;
                r15 = r14;
            L_0x0121:
                monitor-exit(r16);	 Catch:{ all -> 0x0125 }
                throw r0;	 Catch:{ all -> 0x0123 }
            L_0x0123:
                r0 = move-exception;
                goto L_0x0129;
            L_0x0125:
                r0 = move-exception;
                goto L_0x0121;
            L_0x0127:
                r0 = move-exception;
                r15 = r14;
            L_0x0129:
                r19.closeSrc();	 Catch:{ InterruptedException -> 0x012d }
                throw r0;	 Catch:{ InterruptedException -> 0x012d }
            L_0x012d:
                r0 = move-exception;
                goto L_0x0132;
            L_0x012f:
                goto L_0x013d;
            L_0x0130:
                r0 = move-exception;
                r15 = r14;
            L_0x0132:
                r2 = com.android.camera.module.Panorama3Module.TAG;
                r3 = "PreviewAttach interrupted";
                com.android.camera.log.Log.w(r2, r3, r0);
                r1.mResultCode = r15;
            L_0x013d:
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r0 = r0.this$0;
                r0 = r0.mRequestStop;
                if (r0 == 0) goto L_0x0161;
            L_0x0147:
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r0 = r0.this$0;
                r0 = r0.getActivity();
                r2 = new com.android.camera.module.Panorama3Module$PanoramaPreview$PreviewAttach$1;
                r2.<init>();
                r0.runOnUiThread(r2);
                r0 = com.android.camera.module.Panorama3Module.TAG;
                r1 = "PreviewAttach exit. (request exit)";
                com.android.camera.log.Log.d(r0, r1);
                return;
            L_0x0161:
                r0 = r1.mResultCode;
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r2 = r2.this$0;
                r2 = r2.getActivity();
                r3 = new com.android.camera.module.Panorama3Module$PanoramaPreview$PreviewAttach$2;
                r3.<init>(r0);
                r2.runOnUiThread(r3);
                r0 = com.android.camera.module.Panorama3Module.TAG;
                r1 = "PreviewAttach exit.";
                com.android.camera.log.Log.d(r0, r1);
                return;
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.PanoramaPreview.PreviewAttach.run():void");
            }

            /* JADX WARNING: Missing block: B:25:0x01fb, code:
            return;
     */
            private void updatePreviewImage() {
                /*
                r14 = this;
                r0 = com.android.camera.module.Panorama3Module.mPreviewImageLock;
                monitor-enter(r0);
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mMorphoPanoramaGP3;	 Catch:{ all -> 0x01fc }
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r2 = r2.this$0;	 Catch:{ all -> 0x01fc }
                r2 = r2.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r1 = r1.updatePreviewImage(r2);	 Catch:{ all -> 0x01fc }
                if (r1 == 0) goto L_0x0035;
            L_0x001b:
                r2 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01fc }
                r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01fc }
                r3.<init>();	 Catch:{ all -> 0x01fc }
                r4 = "updatePreviewImage error ret:";
                r3.append(r4);	 Catch:{ all -> 0x01fc }
                r3.append(r1);	 Catch:{ all -> 0x01fc }
                r1 = r3.toString();	 Catch:{ all -> 0x01fc }
                com.android.camera.log.Log.e(r2, r1);	 Catch:{ all -> 0x01fc }
                monitor-exit(r0);	 Catch:{ all -> 0x01fc }
                return;
            L_0x0035:
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                if (r1 != 0) goto L_0x004a;
            L_0x003f:
                r1 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01fc }
                r2 = "mPreviewImage is null when updatePreviewImage";
                com.android.camera.log.Log.w(r1, r2);	 Catch:{ all -> 0x01fc }
                monitor-exit(r0);	 Catch:{ all -> 0x01fc }
                return;
            L_0x004a:
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mInitParam;	 Catch:{ all -> 0x01fc }
                r1 = r1.output_rotation;	 Catch:{ all -> 0x01fc }
                r2 = 180; // 0xb4 float:2.52E-43 double:8.9E-322;
                r1 = r1 % r2;
                r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
                r4 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
                r5 = 90;
                r6 = 0;
                if (r1 != r5) goto L_0x0133;
            L_0x0060:
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mInitParam;	 Catch:{ all -> 0x01fc }
                r1 = r1.output_rotation;	 Catch:{ all -> 0x01fc }
                r5 = 270; // 0x10e float:3.78E-43 double:1.334E-321;
                if (r1 != r5) goto L_0x00a1;
                r12 = new android.graphics.Matrix;	 Catch:{ all -> 0x01fc }
                r12.<init>();	 Catch:{ all -> 0x01fc }
                r1 = (float) r2;	 Catch:{ all -> 0x01fc }
                r12.postRotate(r1);	 Catch:{ all -> 0x01fc }
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r8 = 0;
                r9 = 0;
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r10 = r1.getWidth();	 Catch:{ all -> 0x01fc }
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r11 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r13 = 1;
                r1 = android.graphics.Bitmap.createBitmap(r7, r8, r9, r10, r11, r12, r13);	 Catch:{ all -> 0x01fc }
                goto L_0x00a9;
            L_0x00a1:
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
            L_0x00a9:
                r2 = r1.getWidth();	 Catch:{ all -> 0x01fc }
                r5 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r5 = (float) r5;	 Catch:{ all -> 0x01fc }
                r7 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r7 = r7.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r7.mLongSideCropRatio;	 Catch:{ all -> 0x01fc }
                r5 = r5 * r7;
                r5 = java.lang.Math.round(r5);	 Catch:{ all -> 0x01fc }
                r7 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r7 = r7.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r7.mDispPreviewImage;	 Catch:{ all -> 0x01fc }
                r7 = r7.getWidth();	 Catch:{ all -> 0x01fc }
                r8 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r8 = r8.this$0;	 Catch:{ all -> 0x01fc }
                r8 = r8.mDispPreviewImage;	 Catch:{ all -> 0x01fc }
                r8 = r8.getHeight();	 Catch:{ all -> 0x01fc }
                r9 = new android.graphics.Rect;	 Catch:{ all -> 0x01fc }
                r9.<init>(r6, r6, r7, r8);	 Catch:{ all -> 0x01fc }
                r7 = (float) r7;	 Catch:{ all -> 0x01fc }
                r8 = (float) r8;	 Catch:{ all -> 0x01fc }
                r7 = r7 / r8;
                r8 = (float) r2;	 Catch:{ all -> 0x01fc }
                r8 = r8 / r7;
                r7 = (int) r8;	 Catch:{ all -> 0x01fc }
                r8 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r8 = (float) r8;	 Catch:{ all -> 0x01fc }
                r10 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r10 = r10.this$0;	 Catch:{ all -> 0x01fc }
                r10 = r10.mLongSideCropRatio;	 Catch:{ all -> 0x01fc }
                r4 = r4 - r10;
                r8 = r8 * r4;
                r8 = r8 / r3;
                r3 = (int) r8;	 Catch:{ all -> 0x01fc }
                r4 = r7 - r5;
                r4 = r4 / 2;
                r3 = r3 + r4;
                r4 = new android.graphics.Rect;	 Catch:{ all -> 0x01fc }
                r7 = r7 + r3;
                r4.<init>(r6, r3, r2, r7);	 Catch:{ all -> 0x01fc }
                r2 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01fc }
                r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01fc }
                r3.<init>();	 Catch:{ all -> 0x01fc }
                r5 = "src ";
                r3.append(r5);	 Catch:{ all -> 0x01fc }
                r3.append(r4);	 Catch:{ all -> 0x01fc }
                r5 = ", dst = ";
                r3.append(r5);	 Catch:{ all -> 0x01fc }
                r3.append(r9);	 Catch:{ all -> 0x01fc }
                r3 = r3.toString();	 Catch:{ all -> 0x01fc }
                com.android.camera.log.Log.v(r2, r3);	 Catch:{ all -> 0x01fc }
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r2 = r2.this$0;	 Catch:{ all -> 0x01fc }
                r2 = r2.mDispPreviewImageCanvas;	 Catch:{ all -> 0x01fc }
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r3 = r3.this$0;	 Catch:{ all -> 0x01fc }
                r3 = r3.mDispPreviewImagePaint;	 Catch:{ all -> 0x01fc }
                r2.drawBitmap(r1, r4, r9, r3);	 Catch:{ all -> 0x01fc }
                goto L_0x01fa;
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mInitParam;	 Catch:{ all -> 0x01fc }
                r1 = r1.output_rotation;	 Catch:{ all -> 0x01fc }
                if (r1 != r2) goto L_0x0142;
            L_0x0140:
                r5 = -90;
            L_0x0142:
                r12 = new android.graphics.Matrix;	 Catch:{ all -> 0x01fc }
                r12.<init>();	 Catch:{ all -> 0x01fc }
                r1 = (float) r5;	 Catch:{ all -> 0x01fc }
                r12.postRotate(r1);	 Catch:{ all -> 0x01fc }
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r8 = 0;
                r9 = 0;
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r10 = r1.getWidth();	 Catch:{ all -> 0x01fc }
                r1 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r1 = r1.this$0;	 Catch:{ all -> 0x01fc }
                r1 = r1.mPreviewImage;	 Catch:{ all -> 0x01fc }
                r11 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r13 = 1;
                r1 = android.graphics.Bitmap.createBitmap(r7, r8, r9, r10, r11, r12, r13);	 Catch:{ all -> 0x01fc }
                r2 = r1.getWidth();	 Catch:{ all -> 0x01fc }
                r5 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r5 = (float) r5;	 Catch:{ all -> 0x01fc }
                r7 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r7 = r7.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r7.mLongSideCropRatio;	 Catch:{ all -> 0x01fc }
                r5 = r5 * r7;
                r5 = java.lang.Math.round(r5);	 Catch:{ all -> 0x01fc }
                r7 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r7 = r7.this$0;	 Catch:{ all -> 0x01fc }
                r7 = r7.mDispPreviewImage;	 Catch:{ all -> 0x01fc }
                r7 = r7.getWidth();	 Catch:{ all -> 0x01fc }
                r8 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r8 = r8.this$0;	 Catch:{ all -> 0x01fc }
                r8 = r8.mDispPreviewImage;	 Catch:{ all -> 0x01fc }
                r8 = r8.getHeight();	 Catch:{ all -> 0x01fc }
                r9 = new android.graphics.Rect;	 Catch:{ all -> 0x01fc }
                r9.<init>(r6, r6, r7, r8);	 Catch:{ all -> 0x01fc }
                r7 = (float) r7;	 Catch:{ all -> 0x01fc }
                r8 = (float) r8;	 Catch:{ all -> 0x01fc }
                r7 = r7 / r8;
                r8 = (float) r2;	 Catch:{ all -> 0x01fc }
                r8 = r8 / r7;
                r7 = (int) r8;	 Catch:{ all -> 0x01fc }
                r8 = r1.getHeight();	 Catch:{ all -> 0x01fc }
                r8 = (float) r8;	 Catch:{ all -> 0x01fc }
                r10 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r10 = r10.this$0;	 Catch:{ all -> 0x01fc }
                r10 = r10.mLongSideCropRatio;	 Catch:{ all -> 0x01fc }
                r4 = r4 - r10;
                r8 = r8 * r4;
                r8 = r8 / r3;
                r3 = (int) r8;	 Catch:{ all -> 0x01fc }
                r4 = r7 - r5;
                r4 = r4 / 2;
                r3 = r3 + r4;
                r4 = new android.graphics.Rect;	 Catch:{ all -> 0x01fc }
                r7 = r7 + r3;
                r4.<init>(r6, r3, r2, r7);	 Catch:{ all -> 0x01fc }
                r2 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x01fc }
                r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01fc }
                r3.<init>();	 Catch:{ all -> 0x01fc }
                r5 = "src ";
                r3.append(r5);	 Catch:{ all -> 0x01fc }
                r3.append(r4);	 Catch:{ all -> 0x01fc }
                r5 = ", dst = ";
                r3.append(r5);	 Catch:{ all -> 0x01fc }
                r3.append(r9);	 Catch:{ all -> 0x01fc }
                r3 = r3.toString();	 Catch:{ all -> 0x01fc }
                com.android.camera.log.Log.v(r2, r3);	 Catch:{ all -> 0x01fc }
                r2 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r2 = r2.this$0;	 Catch:{ all -> 0x01fc }
                r2 = r2.mDispPreviewImageCanvas;	 Catch:{ all -> 0x01fc }
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x01fc }
                r3 = r3.this$0;	 Catch:{ all -> 0x01fc }
                r3 = r3.mDispPreviewImagePaint;	 Catch:{ all -> 0x01fc }
                r2.drawBitmap(r1, r4, r9, r3);	 Catch:{ all -> 0x01fc }
            L_0x01fa:
                monitor-exit(r0);	 Catch:{ all -> 0x01fc }
                return;
            L_0x01fc:
                r1 = move-exception;
                monitor-exit(r0);	 Catch:{ all -> 0x01fc }
                throw r1;
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.PanoramaPreview.PreviewAttach.updatePreviewImage():void");
            }

            private void checkAttachEnd(double[] dArr) {
                int detect = PanoramaPreview.this.mDetector.detect(dArr[0], dArr[1]);
                String access$100 = Panorama3Module.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("checkAttachEnd detect_result = ");
                stringBuilder.append(detect);
                Log.v(access$100, stringBuilder.toString());
                if (detect != 1) {
                    switch (detect) {
                        case -2:
                        case -1:
                            break;
                    }
                }
                this.mResultCode = 0;
                this.mIsAttachEnd = true;
                PanoramaPreview.this.mUiUpdateRunnable.setDetectResult(detect);
                PanoramaPreview.this.this$0.getActivity().runOnUiThread(PanoramaPreview.this.mUiUpdateRunnable);
                if (!this.mIsAttachEnd) {
                }
            }
        }

        private class UiUpdateRunnable implements Runnable {
            private int mDetectResult;

            private UiUpdateRunnable() {
            }

            /* synthetic */ UiUpdateRunnable(PanoramaPreview panoramaPreview, AnonymousClass1 anonymousClass1) {
                this();
            }

            public void setDetectResult(int i) {
                this.mDetectResult = i;
            }

            /* JADX WARNING: Missing block: B:20:0x0088, code:
            com.android.camera.module.Panorama3Module.access$6602(r5.this$1.this$0, java.lang.Math.min(r3, r4) / 2);
            r0 = (com.android.camera.protocol.ModeProtocol.PanoramaProtocol) com.android.camera.protocol.ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
     */
            /* JADX WARNING: Missing block: B:21:0x00a1, code:
            if (r0 == null) goto L_0x00bd;
     */
            /* JADX WARNING: Missing block: B:22:0x00a3, code:
            r0.setDirectionPosition(r2, com.android.camera.module.Panorama3Module.access$6600(r5.this$1.this$0));
     */
            /* JADX WARNING: Missing block: B:23:0x00b0, code:
            if (r5.mDetectResult == 2) goto L_0x00b7;
     */
            /* JADX WARNING: Missing block: B:24:0x00b2, code:
            r0.setDirectionTooFast(false, 0);
     */
            /* JADX WARNING: Missing block: B:25:0x00b7, code:
            r0.setDirectionTooFast(true, 6000);
     */
            /* JADX WARNING: Missing block: B:26:0x00bd, code:
            return;
     */
            public void run() {
                /*
                r5 = this;
                r0 = r5.mDetectResult;
                r1 = 1;
                r2 = -2;
                if (r0 == r2) goto L_0x00c1;
            L_0x0006:
                r0 = r5.mDetectResult;
                r2 = -1;
                if (r0 == r2) goto L_0x00c1;
            L_0x000b:
                r0 = r5.mDetectResult;
                if (r0 != r1) goto L_0x0011;
            L_0x000f:
                goto L_0x00c1;
            L_0x0011:
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r0 = r0.mDetector;
                r0 = r0.getFrameRect();
                r2 = com.android.camera.module.Panorama3Module.TAG;
                r3 = new java.lang.StringBuilder;
                r3.<init>();
                r4 = "frame_rect = ";
                r3.append(r4);
                r3.append(r0);
                r3 = r3.toString();
                com.android.camera.log.Log.v(r2, r3);
                r2 = new android.graphics.Point;
                r2.<init>();
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r3 = r3.this$0;
                r3 = r3.mDirection;
                r4 = 3;
                if (r3 != r4) goto L_0x0049;
            L_0x0043:
                r3 = r0.right;
                r3 = (int) r3;
                r2.x = r3;
                goto L_0x004e;
            L_0x0049:
                r3 = r0.left;
                r3 = (int) r3;
                r2.x = r3;
            L_0x004e:
                r0 = r0.centerY();
                r0 = (int) r0;
                r2.y = r0;
                r0 = com.android.camera.module.Panorama3Module.mPreviewImageLock;
                monitor-enter(r0);
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x00be }
                r3 = r3.this$0;	 Catch:{ all -> 0x00be }
                r3 = r3.mDispPreviewImage;	 Catch:{ all -> 0x00be }
                if (r3 != 0) goto L_0x006f;
            L_0x0064:
                r1 = com.android.camera.module.Panorama3Module.TAG;	 Catch:{ all -> 0x00be }
                r2 = "mPreviewImage is null in UiUpdateRunnable";
                com.android.camera.log.Log.w(r1, r2);	 Catch:{ all -> 0x00be }
                monitor-exit(r0);	 Catch:{ all -> 0x00be }
                return;
            L_0x006f:
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x00be }
                r3 = r3.this$0;	 Catch:{ all -> 0x00be }
                r3 = r3.mDispPreviewImage;	 Catch:{ all -> 0x00be }
                r3 = r3.getWidth();	 Catch:{ all -> 0x00be }
                r4 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;	 Catch:{ all -> 0x00be }
                r4 = r4.this$0;	 Catch:{ all -> 0x00be }
                r4 = r4.mDispPreviewImage;	 Catch:{ all -> 0x00be }
                r4 = r4.getHeight();	 Catch:{ all -> 0x00be }
                monitor-exit(r0);	 Catch:{ all -> 0x00be }
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r0 = r0.this$0;
                r3 = java.lang.Math.min(r3, r4);
                r4 = 2;
                r3 = r3 / r4;
                r0.mPreviewRefY = r3;
                r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
                r3 = 176; // 0xb0 float:2.47E-43 double:8.7E-322;
                r0 = r0.getAttachProtocol(r3);
                r0 = (com.android.camera.protocol.ModeProtocol.PanoramaProtocol) r0;
                if (r0 == 0) goto L_0x00bd;
            L_0x00a3:
                r3 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r3 = r3.this$0;
                r3 = r3.mPreviewRefY;
                r0.setDirectionPosition(r2, r3);
                r2 = r5.mDetectResult;
                if (r2 == r4) goto L_0x00b7;
            L_0x00b2:
                r1 = 0;
                r0.setDirectionTooFast(r1, r1);
                goto L_0x00bd;
            L_0x00b7:
                r2 = 6000; // 0x1770 float:8.408E-42 double:2.9644E-320;
                r0.setDirectionTooFast(r1, r2);
            L_0x00bd:
                return;
            L_0x00be:
                r1 = move-exception;
                monitor-exit(r0);	 Catch:{ all -> 0x00be }
                throw r1;
            L_0x00c1:
                r0 = r5.mDetectResult;
                if (r0 == r1) goto L_0x00df;
            L_0x00c5:
                r0 = com.android.camera.module.Panorama3Module.TAG;
                r2 = new java.lang.StringBuilder;
                r2.<init>();
                r3 = "stopPanoramaShooting due to detect result ";
                r2.append(r3);
                r3 = r5.mDetectResult;
                r2.append(r3);
                r2 = r2.toString();
                com.android.camera.log.Log.w(r0, r2);
            L_0x00df:
                r0 = com.android.camera.module.Panorama3Module.PanoramaPreview.this;
                r0 = r0.this$0;
                r0.stopPanoramaShooting(r1);
                return;
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.PanoramaPreview.UiUpdateRunnable.run():void");
            }
        }

        @TargetApi(21)
        public PanoramaPreview(Panorama3Module panorama3Module) {
            Panorama3Module panorama3Module2 = panorama3Module;
            this.this$0 = panorama3Module2;
            int scale = panorama3Module.mDirectionFunction.getScale();
            Size previewSize = panorama3Module.mDirectionFunction.getPreviewSize();
            Log.d(Panorama3Module.TAG, String.format(Locale.US, "previewSize %dx%d, scale %d", new Object[]{Integer.valueOf(previewSize.getWidth()), Integer.valueOf(previewSize.getHeight()), Integer.valueOf(scale)}));
            this.mPreviewImgWidth = previewSize.getWidth();
            this.mPreviewImgHeight = previewSize.getHeight();
            String access$100 = Panorama3Module.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("mPreviewImgWidth = ");
            stringBuilder.append(this.mPreviewImgWidth);
            stringBuilder.append(", mPreviewImgHeight = ");
            stringBuilder.append(this.mPreviewImgHeight);
            Log.d(access$100, stringBuilder.toString());
            if (panorama3Module.mMorphoPanoramaGP3.setPreviewImage(this.mPreviewImgWidth, this.mPreviewImgHeight) != 0) {
                Log.e(Panorama3Module.TAG, String.format(Locale.US, "setPreviewImage error ret:0x%08X", new Object[]{Integer.valueOf(scale)}));
            }
            PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            if (panoramaProtocol != null) {
                this.mDetector = new PositionDetector(panorama3Module.mInitParam, panoramaProtocol.getPreivewContainer(), false, panorama3Module2.mCameraDisplayOrientation, panorama3Module.mPictureWidth, panorama3Module.mPictureHeight, panorama3Module.mDirectionFunction.getDirection(), panorama3Module.mMaxWidth, panorama3Module.mMaxHeight);
                panorama3Module.mRoundDetector.setStartPosition(panorama3Module.mInitParam.output_rotation, 1, panorama3Module.mViewAngleH, panorama3Module.mViewAngleV, false);
                allocateDisplayBuffers();
            }
        }

        private void allocateDisplayBuffers() {
            synchronized (Panorama3Module.mPreviewImageLock) {
                if (!(this.this$0.mPreviewImage == null || (this.this$0.mPreviewImage.getWidth() == this.mPreviewImgWidth && this.this$0.mPreviewImage.getHeight() == this.mPreviewImgHeight))) {
                    this.this$0.mPreviewImage.recycle();
                    this.this$0.mPreviewImage = null;
                    this.this$0.mDispPreviewImage.recycle();
                    this.this$0.mDispPreviewImage = null;
                }
                if (this.this$0.mPreviewImage == null) {
                    this.this$0.mPreviewImage = Bitmap.createBitmap(this.mPreviewImgWidth, this.mPreviewImgHeight, Config.ARGB_8888);
                    this.this$0.mDispPreviewImage = Bitmap.createBitmap(Util.sWindowWidth, this.this$0.mSmallPreviewHeight, Config.ARGB_8888);
                    this.this$0.mAttachPosOffsetY = ((this.this$0.mDispPreviewImage.getWidth() * this.this$0.mPictureWidth) / this.this$0.mPictureHeight) / 2;
                    String access$100 = Panorama3Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("mAttachPosOffsetY = ");
                    stringBuilder.append(this.this$0.mAttachPosOffsetY);
                    Log.d(access$100, stringBuilder.toString());
                    this.this$0.mDispPreviewImageCanvas = new Canvas(this.this$0.mDispPreviewImage);
                    this.this$0.mDispPreviewImagePaint = new Paint();
                    this.this$0.mDispPreviewImagePaint.setXfermode(new PorterDuffXfermode(Mode.SRC));
                }
            }
        }

        public boolean onSaveImage(CaptureImage captureImage) {
            this.this$0.addAttachQueue(captureImage);
            if (!this.mHasSubmit) {
                Log.d(Panorama3Module.TAG, "submit PreviewAttach");
                this.this$0.mExecutor.submit(new PreviewAttach(this, null));
                this.mHasSubmit = true;
            }
            return true;
        }

        private void attachEnd(int i) {
            this.this$0.initAttachQueue();
            this.this$0.registerGravitySensorListener();
            this.listener.requestEnd(this, i);
            if (i == 0) {
                this.this$0.stopPanoramaShooting(true);
            }
        }
    }

    private class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
        private boolean mSaveImage;
        private long start_time;

        SaveOutputImageTask(boolean z) {
            this.mSaveImage = z;
        }

        protected Integer doInBackground(Void... voidArr) {
            Log.v(Panorama3Module.TAG, "doInBackground>>");
            savePanoramaPicture();
            return null;
        }

        private void savePanoramaPicture() {
            Log.d(Panorama3Module.TAG, "savePanoramaPicture start");
            synchronized (Panorama3Module.mEngineLock) {
                try {
                    Log.d(Panorama3Module.TAG, "savePanoramaPicture enter mEngineLock");
                    int createOutputImage;
                    if (Panorama3Module.this.mMorphoPanoramaGP3 == null) {
                        Log.w(Panorama3Module.TAG, "savePanoramaPicture while mMorphoPanoramaGP3 is null");
                        Panorama3Module.this.finishEngine();
                    } else if (this.mSaveImage) {
                        int noiseReductionParam = Panorama3Module.this.mMorphoPanoramaGP3.setNoiseReductionParam(0);
                        if (noiseReductionParam != 0) {
                            String access$100 = Panorama3Module.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("setNoiseReductionParam error ret:");
                            stringBuilder.append(noiseReductionParam);
                            Log.e(access$100, stringBuilder.toString());
                        }
                        if (Panorama3Module.this.mMorphoPanoramaGP3.setUnsharpStrength(1536) != 0) {
                            Log.e(Panorama3Module.TAG, String.format(Locale.US, "setUnsharpStrength error ret:0x%08X", new Object[]{Integer.valueOf(createOutputImage)}));
                        }
                        if (Panorama3Module.this.mMorphoPanoramaGP3.end(1, (double) Panorama3Module.this.mRoundDetector.currentDegree0Base()) != 0) {
                            Log.e(Panorama3Module.TAG, String.format("savePanoramaPicture, end() -> 0x%x", new Object[]{Integer.valueOf(createOutputImage)}));
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        Rect rect = new Rect();
                        if (Panorama3Module.this.mMorphoPanoramaGP3.getClippingRect(rect) != 0) {
                            Log.e(Panorama3Module.TAG, String.format("getClippingRect() -> 0x%x", new Object[]{Integer.valueOf(noiseReductionParam)}));
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        noiseReductionParam = rect.width();
                        int height = rect.height();
                        String access$1002;
                        StringBuilder stringBuilder2;
                        if (noiseReductionParam == 0 || height == 0) {
                            access$1002 = Panorama3Module.TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("getClippingRect() ");
                            stringBuilder2.append(rect);
                            Log.e(access$1002, stringBuilder2.toString());
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        createOutputImage = Panorama3Module.this.mMorphoPanoramaGP3.createOutputImage(rect);
                        if (createOutputImage != 0) {
                            access$1002 = Panorama3Module.TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("createOutputImage error ret:");
                            stringBuilder2.append(createOutputImage);
                            Log.e(access$1002, stringBuilder2.toString());
                            Panorama3Module.this.finishEngine();
                            return;
                        }
                        String generateFilepath = Storage.generateFilepath(Panorama3Module.this.createNameString(Panorama3Module.this.mTimeTaken));
                        if (Panorama3Module.this.savePanoramaFile(generateFilepath, noiseReductionParam, height)) {
                            Panorama3Module.this.finishEngine();
                            Panorama3Module.this.addImageAsApplication(generateFilepath, noiseReductionParam, height, Panorama3Module.this.calibrateRotation(1));
                            Log.d(Panorama3Module.TAG, "savePanoramaPicture end");
                            return;
                        }
                        Panorama3Module.this.finishEngine();
                    } else {
                        Log.w(Panorama3Module.TAG, String.format("savePanoramaPicture, don't save image", new Object[0]));
                        if (Panorama3Module.this.mMorphoPanoramaGP3.end(1, (double) Panorama3Module.this.mRoundDetector.currentDegree0Base()) != 0) {
                            Log.e(Panorama3Module.TAG, String.format("savePanoramaPicture, end() -> 0x%x", new Object[]{Integer.valueOf(createOutputImage)}));
                        }
                        Panorama3Module.this.finishEngine();
                    }
                } catch (Throwable th) {
                    Panorama3Module.this.finishEngine();
                }
            }
        }

        protected void onPreExecute() {
            this.start_time = System.currentTimeMillis();
            ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).updateLoading(false);
        }

        protected void onPostExecute(Integer num) {
            Log.d(Panorama3Module.TAG, "PanoramaFinish done");
            AutoLockManager.getInstance(Panorama3Module.this.mActivity).hibernateDelayed();
            if (Panorama3Module.this.mPaused) {
                Panorama3Module.this.mIsShooting = false;
                Log.w(Panorama3Module.TAG, "panorama mode has been paused");
                return;
            }
            PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            if (panoramaProtocol != null) {
                Log.d(Panorama3Module.TAG, "onPostExecute setDisplayPreviewBitmap null");
                panoramaProtocol.setDisplayPreviewBitmap(null);
            }
            if (Panorama3Module.this.mDispPreviewImage != null) {
                Panorama3Module.this.mDispPreviewImage.eraseColor(0);
            }
            Panorama3Module.this.mActivity.getThumbnailUpdater().updateThumbnailView(true);
            if (Panorama3Module.this.mCamera2Device != null) {
                if (Panorama3Module.this.mAeLockSupported) {
                    Panorama3Module.this.mCamera2Device.setAELock(false);
                }
                if (Panorama3Module.this.mAwbLockSupported) {
                    Panorama3Module.this.mCamera2Device.setAWBLock(false);
                }
                Panorama3Module.this.mCamera2Device.setFocusMode(Panorama3Module.this.mTargetFocusMode);
                Panorama3Module.this.resetToPreview();
                Panorama3Module.this.enableCameraControls(true);
            }
            Panorama3Module.this.mMainHandler.post(new Runnable() {
                public void run() {
                    Panorama3Module.this.handlePendingScreenSlide();
                }
            });
            Panorama3Module.this.mIsShooting = false;
            Log.d(Panorama3Module.TAG, String.format(Locale.ENGLISH, "[MORTIME] PanoramaFinish time = %d", new Object[]{Long.valueOf(System.currentTimeMillis() - this.start_time)}));
        }
    }

    private void initAttachQueue() {
        while (this.mAttachImageQueue.size() > 0) {
            CaptureImage captureImage = (CaptureImage) this.mAttachImageQueue.poll();
            if (captureImage != null) {
                captureImage.close();
            }
        }
        Log.d(TAG, "initAttachQueue");
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x004d  */
    private void addAttachQueue(com.android.camera.panorama.CaptureImage r5) {
        /*
        r4 = this;
        if (r5 != 0) goto L_0x000a;
    L_0x0002:
        r5 = TAG;
        r0 = "addAttachQueue failed due to image is null";
        com.android.camera.log.Log.w(r5, r0);
        return;
    L_0x000a:
        r0 = 0;
        r1 = r4.mRequestStop;	 Catch:{ all -> 0x0047 }
        if (r1 == 0) goto L_0x001b;
    L_0x000f:
        r1 = TAG;	 Catch:{ all -> 0x0047 }
        r2 = "addAttachQueue failed due to request stop";
        com.android.camera.log.Log.w(r1, r2);	 Catch:{ all -> 0x0047 }
        r5.close();
        return;
    L_0x001b:
        r1 = r4.mAttachImageQueue;	 Catch:{ all -> 0x0047 }
        r1 = r1.offer(r5);	 Catch:{ all -> 0x0047 }
    L_0x0021:
        r0 = r4.mAttachImageQueue;	 Catch:{ all -> 0x0045 }
        r0 = r0.size();	 Catch:{ all -> 0x0045 }
        r2 = 1;
        if (r0 <= r2) goto L_0x0038;
    L_0x002a:
        r0 = r4.mAttachImageQueue;	 Catch:{ all -> 0x0045 }
        r0 = r0.poll();	 Catch:{ all -> 0x0045 }
        r0 = (com.android.camera.panorama.CaptureImage) r0;	 Catch:{ all -> 0x0045 }
        if (r0 == 0) goto L_0x0037;
    L_0x0034:
        r0.close();	 Catch:{ all -> 0x0045 }
    L_0x0037:
        goto L_0x0021;
    L_0x0038:
        if (r1 != 0) goto L_0x003d;
    L_0x003a:
        r5.close();
    L_0x003d:
        r5 = TAG;
        r0 = "addAttachQueue";
        com.android.camera.log.Log.v(r5, r0);
        return;
    L_0x0045:
        r0 = move-exception;
        goto L_0x004b;
    L_0x0047:
        r1 = move-exception;
        r3 = r1;
        r1 = r0;
        r0 = r3;
    L_0x004b:
        if (r1 != 0) goto L_0x0050;
    L_0x004d:
        r5.close();
    L_0x0050:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.addAttachQueue(com.android.camera.panorama.CaptureImage):void");
    }

    private void requestStopShoot() {
        addAttachQueue(sAttachExit);
        this.mRequestStop = true;
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 174, 164);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
    }

    public void onPreviewSizeChanged(int i, int i2) {
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null && isAlive()) {
            setCameraState(1);
            updatePreferenceInWorkThread(UpdateConstant.PANORAMA_ON_PREVIEW_SUCCESS);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        this.mMainHandler.sendEmptyMessage(51);
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    public boolean isPanoramaDoing() {
        return this.mIsShooting;
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        onCameraOpened();
        this.mGoalAngle = DataRepository.dataItemFeature().fz();
        this.mLongSideCropRatio = DataRepository.dataItemFeature().fA();
        this.mSmallPreviewHeight = (int) this.mActivity.getResources().getDimension(R.dimen.pano_preview_hint_frame_height);
        this.mSensorManager = (SensorManager) getActivity().getSystemService("sensor");
        for (Sensor sensor : this.mSensorManager.getSensorList(-1)) {
            if (sensor.getType() == 4) {
                this.mGyroscope = this.mSensorManager.getDefaultSensor(4);
            }
            if (sensor.getType() == 16) {
                this.mGyroscopeUncalibrated = this.mSensorManager.getDefaultSensor(16);
            }
            if (sensor.getType() == 1) {
                this.mAccelerometer = this.mSensorManager.getDefaultSensor(1);
            }
            if (sensor.getType() == 2) {
                this.mMagnetic = sensor;
            }
            if (sensor.getType() == 15) {
                this.mRotationVector = this.mSensorManager.getDefaultSensor(15);
            }
        }
        this.mRoundDetector = new RoundDetector();
        this.mPanoramaSetting = new PanoramaSetting(this.mActivity.getApplicationContext());
        this.mSensorFusion = new SensorFusion(true);
        this.mSensorFusionMode = 1;
        if (this.mSensorFusion.setMode(this.mSensorFusionMode) != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setMode error ret:0x%08X", new Object[]{Integer.valueOf(i)}));
        }
        if (this.mSensorFusion.setOffsetMode(0) != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setOffsetMode error ret:0x%08X", new Object[]{Integer.valueOf(i)}));
        }
        if (this.mSensorFusion.setAppState(1) != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setAppState error ret:0x%08X", new Object[]{Integer.valueOf(i)}));
        }
        this.mSensorInfoManagerList = new ArrayList();
    }

    protected void onCameraOpened() {
        super.onCameraOpened();
        checkDisplayOrientation();
        updatePreferenceTrampoline(UpdateConstant.PANORAMA_TYPES_INIT);
        startSession();
        this.mMainHandler.sendEmptyMessage(9);
        Log.v(TAG, "SetupCameraThread done");
        this.mViewAngleH = this.mCameraCapabilities.getViewAngle(false);
        this.mViewAngleV = this.mCameraCapabilities.getViewAngle(true);
        this.mCameraOrientation = this.mCameraCapabilities.getSensorOrientation();
    }

    protected void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, 166);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void closeCamera() {
        Log.d(TAG, "closeCamera: start");
        synchronized (this.mDeviceLock) {
            setCameraState(0);
            if (this.mCamera2Device != null) {
                this.mCamera2Device.setErrorCallback(null);
                this.mCamera2Device.stopPreviewCallback(true);
                this.mCamera2Device = null;
            }
        }
        Log.d(TAG, "closeCamera: end");
    }

    private void setupCaptureParams() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "camera device is not ready");
            return;
        }
        this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
        this.mCamera2Device.setZoomRatio(1.0f);
        this.mCamera2Device.setFlashMode(0);
        String antiBanding = CameraSettings.getAntiBanding();
        this.mCamera2Device.setAntiBanding(Integer.valueOf(antiBanding).intValue());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("antiBanding=");
        stringBuilder.append(antiBanding);
        Log.d(str, stringBuilder.toString());
        this.mCamera2Device.setEnableZsl(true);
        this.mCamera2Device.setHHT(false);
        this.mCamera2Device.setEnableOIS(false);
        this.mCamera2Device.setTimeWaterMarkEnable(false);
        this.mCamera2Device.setFaceWaterMarkEnable(false);
    }

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            if (i == 1) {
                updatePictureAndPreviewSize();
            } else if (i == 24) {
                setZoomRatio(getZoomValue());
            } else if (i == 32) {
                setupCaptureParams();
            } else if (DEBUG) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("no consumer for this updateType: ");
                stringBuilder.append(i);
                throw new RuntimeException(stringBuilder.toString());
            } else {
                String str = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("no consumer for this updateType: ");
                stringBuilder2.append(i);
                Log.w(str, stringBuilder2.toString());
            }
        }
    }

    protected boolean isZoomEnabled() {
        return false;
    }

    private void updatePictureAndPreviewSize() {
        CameraSize bestPanoPictureSize = getBestPanoPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256));
        CameraSize optimalPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPanoPictureSize.width, bestPanoPictureSize.height));
        this.mPictureSize = bestPanoPictureSize;
        this.mPreviewSize = optimalPreviewSize;
        this.mPictureWidth = this.mPictureSize.width;
        this.mPictureHeight = this.mPictureSize.height;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("pictureSize= ");
        stringBuilder.append(bestPanoPictureSize.width);
        stringBuilder.append("X");
        stringBuilder.append(bestPanoPictureSize.height);
        stringBuilder.append(" previewSize=");
        stringBuilder.append(optimalPreviewSize.width);
        stringBuilder.append("X");
        stringBuilder.append(optimalPreviewSize.height);
        Log.d(str, stringBuilder.toString());
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    protected CameraSize getBestPanoPictureSize(List<CameraSize> list) {
        PictureSizeManager.initialize(list, 0);
        return PictureSizeManager.getBestPanoPictureSize();
    }

    private void initPreviewLayout() {
        if (isAlive()) {
            this.mActivity.getCameraScreenNail().setPreviewSize(this.mPreviewSize.width, this.mPreviewSize.height);
            CameraScreenNail cameraScreenNail = this.mActivity.getCameraScreenNail();
            int width = cameraScreenNail.getWidth();
            int height = (int) (((float) cameraScreenNail.getHeight()) * this.mLongSideCropRatio);
            int dimensionPixelSize = this.mActivity.getResources().getDimensionPixelSize(R.dimen.pano_preview_hint_frame_height);
            width = (width * dimensionPixelSize) / height;
            PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
            panoramaProtocol.initPreviewLayout(width, dimensionPixelSize, this.mPreviewSize.width, this.mPreviewSize.height);
            if (!this.mActivity.getCameraScreenNail().isAnimationRunning()) {
                panoramaProtocol.showSmallPreview(false);
            }
        }
    }

    protected void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            onShutterButtonClick(20);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x002f A:{RETURN} */
    public boolean onKeyDown(int r4, android.view.KeyEvent r5) {
        /*
        r3 = this;
        r0 = r3.mPaused;
        r1 = 1;
        if (r0 == 0) goto L_0x0006;
    L_0x0005:
        return r1;
    L_0x0006:
        r0 = 27;
        if (r4 == r0) goto L_0x0044;
    L_0x000a:
        r0 = 66;
        if (r4 == r0) goto L_0x0044;
    L_0x000e:
        r0 = 700; // 0x2bc float:9.81E-43 double:3.46E-321;
        if (r4 == r0) goto L_0x003c;
    L_0x0012:
        switch(r4) {
            case 23: goto L_0x0030;
            case 24: goto L_0x0019;
            case 25: goto L_0x0019;
            default: goto L_0x0015;
        };
    L_0x0015:
        switch(r4) {
            case 87: goto L_0x0019;
            case 88: goto L_0x0019;
            default: goto L_0x0018;
        };
    L_0x0018:
        goto L_0x0062;
    L_0x0019:
        r0 = 24;
        if (r4 == r0) goto L_0x0024;
    L_0x001d:
        r0 = 88;
        if (r4 != r0) goto L_0x0022;
    L_0x0021:
        goto L_0x0024;
    L_0x0022:
        r0 = 0;
        goto L_0x0025;
    L_0x0024:
        r0 = r1;
    L_0x0025:
        r2 = r5.getRepeatCount();
        r0 = r3.handleVolumeKeyEvent(r0, r1, r2);
        if (r0 == 0) goto L_0x0062;
    L_0x002f:
        return r1;
    L_0x0030:
        r0 = r5.getRepeatCount();
        if (r0 != 0) goto L_0x0062;
    L_0x0036:
        r4 = 50;
        r3.onShutterButtonClick(r4);
        return r1;
    L_0x003c:
        r0 = r3.mIsShooting;
        if (r0 == 0) goto L_0x0062;
    L_0x0040:
        r3.stopPanoramaShooting(r1);
        goto L_0x0062;
    L_0x0044:
        r0 = r5.getRepeatCount();
        if (r0 != 0) goto L_0x0062;
    L_0x004a:
        r4 = com.android.camera.Util.isFingerPrintKeyEvent(r5);
        if (r4 == 0) goto L_0x005c;
    L_0x0050:
        r4 = com.android.camera.CameraSettings.isFingerprintCaptureEnable();
        if (r4 == 0) goto L_0x0061;
    L_0x0056:
        r4 = 30;
        r3.onShutterButtonClick(r4);
        goto L_0x0061;
    L_0x005c:
        r4 = 40;
        r3.onShutterButtonClick(r4);
    L_0x0061:
        return r1;
    L_0x0062:
        r4 = super.onKeyDown(r4, r5);
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.onKeyDown(int, android.view.KeyEvent):boolean");
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        if (i != 4) {
            if (i == 27 || i == 66) {
                return true;
            }
        } else if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public void onShutterButtonClick(int i) {
        if (!this.mPaused && getCameraState() != 0 && !isIgnoreTouchEvent()) {
            if (!isFrontCamera() || !this.mActivity.isScreenSlideOff()) {
                if (isDoingAction()) {
                    Log.w(TAG, "onShutterButtonClick return, isDoingAction");
                    return;
                }
                BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
                if (backStack != null) {
                    backStack.handleBackStackFromShutter();
                }
                setTriggerMode(i);
                if (!this.mIsShooting) {
                    this.mActivity.getScreenHint().updateHint();
                    if (Storage.isLowStorageAtLastPoint()) {
                        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingFailed();
                        return;
                    }
                    this.mPanoramaState = new PanoramaInit(this, null);
                    initAttachQueue();
                    playCameraSound(2);
                    startPanoramaShooting();
                } else if (isShootingTooShort()) {
                    Log.w(TAG, "panorama shooting is too short, ignore this click");
                } else {
                    playCameraSound(3);
                    stopPanoramaShooting(true, false);
                }
            }
        }
    }

    private boolean isShootingTooShort() {
        return SystemClock.elapsedRealtime() - this.mPanoramaShootingStartTime < 600;
    }

    public boolean onShutterButtonLongClick() {
        return false;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        onShutterButtonFocus(false, 2);
    }

    public boolean isDoingAction() {
        return isProcessingFinishTask();
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (this.mIsShooting) {
            this.mUnInterruptableReason = "shooting";
        }
        return this.mUnInterruptableReason != null;
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public boolean onBackPressed() {
        if (!this.mIsShooting) {
            return false;
        }
        if (!isProcessingFinishTask()) {
            playCameraSound(3);
            stopPanoramaShooting(true);
        }
        return true;
    }

    @OnClickAttr
    public void onThumbnailClicked(View view) {
        if (!this.mPaused && !isProcessingFinishTask() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public void onReviewDoneClicked() {
    }

    public void onReviewCancelClicked() {
    }

    private void resetUI() {
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).resetShootUI();
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.showZoomButton();
        }
        showSmallPreview(false);
    }

    private void showSmallPreview(boolean z) {
        if (this.mMorphoPanoramaGP3 == null) {
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).showSmallPreview(z);
        }
    }

    private void resetToPreview() {
        if (((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).isShown()) {
            resetUI();
        }
        if (!this.mPaused) {
            startPreview();
        }
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
        registerGravitySensorListener();
        this.mSensorThread = new HandlerThread("SensorThread");
        this.mSensorThread.start();
        Handler handler = new Handler(this.mSensorThread.getLooper());
        this.mRoundDetector = new GyroscopeRoundDetector();
        if (this.mGyroscope != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mGyroscope, 0, handler);
        }
        if (this.mGyroscopeUncalibrated != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mGyroscopeUncalibrated, 0, handler);
        }
        if (this.mRotationVector != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mRotationVector, 0, handler);
        }
        if (this.mAccelerometer != null) {
            this.mSensorManager.registerListener(this.mSensorFusion, this.mAccelerometer, 0, handler);
        }
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(2);
            this.mActivity.loadCameraSound(3);
        }
    }

    public void onPause() {
        super.onPause();
        unregisterGravitySensorListener();
        this.mSensorManager.unregisterListener(this.mSensorFusion);
        this.mSensorManager.unregisterListener(this.mRoundDetector);
        if (this.mSensorThread != null) {
            this.mSensorThread.quit();
            this.mSensorThread = null;
        }
        this.mMainHandler.removeCallbacksAndMessages(null);
        final PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        this.mMainHandler.post(new Runnable() {
            public void run() {
                if (Panorama3Module.this.mIsShooting) {
                    Panorama3Module.this.playCameraSound(3);
                    Panorama3Module.this.stopPanoramaShooting(true, true);
                }
                if (panoramaProtocol != null) {
                    Log.d(Panorama3Module.TAG, "onPause setDisplayPreviewBitmap null");
                    panoramaProtocol.setDisplayPreviewBitmap(null);
                }
                synchronized (Panorama3Module.mPreviewImageLock) {
                    if (Panorama3Module.this.mPreviewImage != null) {
                        Panorama3Module.this.mPreviewImage.recycle();
                        Panorama3Module.this.mPreviewImage = null;
                    }
                    if (Panorama3Module.this.mDispPreviewImage != null) {
                        String access$100 = Panorama3Module.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onPause recycle bitmap ");
                        stringBuilder.append(Panorama3Module.this.mDispPreviewImage);
                        Log.d(access$100, stringBuilder.toString());
                        Panorama3Module.this.mDispPreviewImage.recycle();
                        Panorama3Module.this.mDispPreviewImage = null;
                    }
                }
            }
        });
        closeCamera();
        resetScreenOn();
    }

    public void onStop() {
        super.onStop();
    }

    public void onDestroy() {
        super.onDestroy();
        this.mMainHandler.sendEmptyMessage(45);
    }

    public void startSession() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "startPreview: camera has been closed");
            return;
        }
        this.mCamera2Device.setDualCamWaterMarkEnable(false);
        this.mCamera2Device.setErrorCallback(this.mErrorCallback);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        this.mCamera2Device.setPictureSize(this.mPictureSize);
        this.mCamera2Device.setPictureMaxImages(3);
        this.mCamera2Device.setPictureFormat(35);
        this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
        this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), true, false, getOperatingMode(), this);
    }

    public void startPreview() {
        synchronized (this.mDeviceLock) {
            if (this.mCamera2Device == null) {
                Log.e(TAG, "startPreview: camera has been closed");
                return;
            }
            checkDisplayOrientation();
            this.mCamera2Device.setDisplayOrientation(this.mCameraDisplayOrientation);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            this.mCamera2Device.resumePreview();
            setCameraState(1);
        }
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mCamera2Device.pausePreview();
        setCameraState(0);
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mCamera2Device.resumePreview();
        setCameraState(1);
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!this.mIsShooting) {
            keepScreenOnAwhile();
        }
    }

    private void resetScreenOn() {
        this.mMainHandler.removeMessages(17);
        this.mMainHandler.removeMessages(2);
    }

    private void keepScreenOnAwhile() {
        this.mMainHandler.sendEmptyMessageDelayed(17, 1000);
    }

    protected void keepScreenOn() {
        this.mMainHandler.removeMessages(17);
        this.mMainHandler.removeMessages(2);
        getWindow().addFlags(128);
    }

    public void startPanoramaShooting() {
        if (isProcessingFinishTask()) {
            Log.e(TAG, "previous save task is on going");
            return;
        }
        Log.v(TAG, "startPanoramaShooting");
        this.mCaptureOrientationDecided = false;
        this.mDirection = this.mInitParam.direction;
        this.mTimeTaken = System.currentTimeMillis();
        this.mDeviceOrientationAtCapture = this.mOrientationCompensation;
        this.mIsShooting = true;
        this.mCanSavePanorama = false;
        this.mRequestStop = false;
        this.mShutterStartTime = createDateStringForAppSeg(System.currentTimeMillis());
        this.mShutterEndTime = "";
        synchronized (this.mDeviceLock) {
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(true);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(true);
            }
            this.mLocation = LocationManager.instance().getCurrentLocation();
            this.mCamera2Device.setGpsLocation(this.mLocation);
            this.mCamera2Device.setFocusMode(this.mSnapshotFocusMode);
            this.mCamera2Device.setJpegQuality(BaseModule.getJpegQuality(false));
            this.mCamera2Device.setJpegThumbnailSize(getJpegThumbnailSize());
            this.mCamera2Device.setEnableZsl(true);
            this.mCamera2Device.setNeedPausePreview(false);
            this.mCamera2Device.captureBurstPictures(100, new PictureCallbackWrapper() {
                public boolean onPictureTakenImageConsumed(Image image) {
                    String access$100 = Panorama3Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onPictureTaken>>image=");
                    stringBuilder.append(image);
                    Log.v(access$100, stringBuilder.toString());
                    if (Panorama3Module.this.mCamera2Device == null) {
                        image.close();
                        return true;
                    }
                    if (!Panorama3Module.this.mPanoramaState.onSaveImage(new Camera2Image(image))) {
                        Panorama3Module.this.mPanoramaState = new PanoramaState();
                    }
                    return true;
                }

                public void onPictureTakenFinished(boolean z) {
                    String access$100 = Panorama3Module.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onPictureBurstFinished success = ");
                    stringBuilder.append(z);
                    Log.d(access$100, stringBuilder.toString());
                }
            }, null);
        }
        setShootUI();
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).processingStart();
        this.mPanoramaShootingStartTime = SystemClock.elapsedRealtime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
    }

    private void setShootUI() {
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).setShootUI();
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideZoomButton();
        }
        keepScreenOnAwhile();
    }

    private boolean initializeEngine(MorphoPanoramaGP3 morphoPanoramaGP3, InitParam initParam) {
        Log.d(TAG, "initializeEngine start");
        if (morphoPanoramaGP3.createNativeOutputInfo() != 0) {
            Log.e(TAG, String.format(Locale.US, "createNativeOutputInfo error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (morphoPanoramaGP3.initialize(initParam) != 0) {
            Log.e(TAG, String.format(Locale.US, "initialize error ret:0x%08X", new Object[]{Integer.valueOf(r8)}));
            return false;
        }
        Log.e(TAG, "initializeEngine end");
        return true;
    }

    private boolean createEngine() {
        if (this.mMorphoPanoramaGP3 != null) {
            return false;
        }
        this.mMorphoPanoramaGP3 = new MorphoPanoramaGP3();
        if (PanoramaGP3ImageFormat.YUV420_PLANAR.equals(this.mImageFormat)) {
            this.mInitParam.input_format = this.mImageFormat;
            this.mInitParam.output_format = PanoramaGP3ImageFormat.YUV420_SEMIPLANAR;
        } else {
            this.mInitParam.input_format = this.mImageFormat;
            this.mInitParam.output_format = this.mImageFormat;
        }
        this.mInitParam.input_width = this.mPictureWidth;
        this.mInitParam.input_height = this.mPictureHeight;
        this.mInitParam.aovx = (double) this.mViewAngleH;
        this.mInitParam.aovy = (double) this.mViewAngleV;
        this.mInitParam.direction = CameraSettings.getPanoramaMoveDirection();
        int displayRotation = Util.getDisplayRotation(this.mActivity);
        if (this.mOrientation == -1) {
            this.mInitParam.output_rotation = ((this.mCameraOrientation + displayRotation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        } else {
            this.mInitParam.output_rotation = (((this.mCameraOrientation + displayRotation) + this.mOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        String cameraZoomMode = CameraSettings.getCameraZoomMode(166);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("zoomMode ");
        stringBuilder.append(cameraZoomMode);
        Log.d(str, stringBuilder.toString());
        if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraZoomMode)) {
            this.mInitParam.goal_angle = (double) this.mGoalAngle;
        } else if (Build.DEVICE.equals("cepheus")) {
            this.mInitParam.goal_angle = 152.18d;
        } else {
            this.mInitParam.goal_angle = ((double) this.mGoalAngle) * 0.6265d;
        }
        displayRotation = this.mCameraOrientation;
        displayRotation = displayRotation != 90 ? displayRotation != 180 ? displayRotation != 270 ? 0 : 3 : 2 : 1;
        if (this.mSensorFusion.setRotation(displayRotation) != 0) {
            Log.e(TAG, String.format(Locale.US, "SensorFusion.setRotation error ret:0x%08X", new Object[]{Integer.valueOf(this.mSensorFusion.setRotation(displayRotation))}));
        }
        initializeEngine(this.mMorphoPanoramaGP3, this.mInitParam);
        return true;
    }

    private boolean configMorphoPanoramaGP3() {
        Log.d(TAG, "configMorphoPanoramaGP3 start");
        this.mMorphoPanoramaGP3.setAttachEnabled(true);
        this.mMorphoPanoramaGP3.disableSaveInputImages();
        if (this.mMorphoPanoramaGP3.setShrinkRatio((double) this.mPanoramaSetting.getShrink_ratio()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setShrinkRatio error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setCalcseamPixnum(this.mPanoramaSetting.getCalcseam_pixnum()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setCalcseamPixnum error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setUseDeform(this.mPanoramaSetting.isUse_deform()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setUseDeform error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setUseLuminanceCorrection(this.mPanoramaSetting.isUse_luminance_correction()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setUseLuminanceCorrection error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setSeamsearchRatio(this.mPanoramaSetting.getSeamsearch_ratio()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setSeamsearchRatio error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setZrotationCoeff(this.mPanoramaSetting.getZrotation_coeff()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setZrotationCoeff error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setDrawThreshold(this.mPanoramaSetting.getDraw_threshold()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setDrawThreshold error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setAovGain(this.mPanoramaSetting.getAov_gain()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setAovGain error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setDistortionCorrectionParam(this.mPanoramaSetting.getDistortion_k1(), this.mPanoramaSetting.getDistortion_k2(), this.mPanoramaSetting.getDistortion_k3(), this.mPanoramaSetting.getDistortion_k4()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setDistortionCorrectionParam error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setRotationRatio(this.mPanoramaSetting.getRotation_ratio()) != 0) {
            Log.e(TAG, String.format(Locale.US, "setRotationRatio error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setSensorUseMode(0) != 0) {
            Log.e(TAG, String.format(Locale.US, "setSensorUseMode error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setProjectionMode(0) != 0) {
            Log.e(TAG, String.format(Locale.US, "setProjectionMode error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        if (this.mMorphoPanoramaGP3.setMotionDetectionMode(0) != 0) {
            Log.e(TAG, String.format(Locale.US, "setMotionDetectionMode error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
        }
        Log.d(TAG, "configMorphoPanoramaGP3 end");
        return true;
    }

    private void stopPanoramaShooting(boolean z) {
        stopPanoramaShooting(z, false);
    }

    private void stopPanoramaShooting(boolean z, boolean z2) {
        if (this.mIsShooting) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("stopPanoramaShooting: saveImage=");
            stringBuilder.append(z);
            stringBuilder.append(", isRelease=");
            stringBuilder.append(z2);
            Log.v(str, stringBuilder.toString());
            requestStopShoot();
            keepScreenOnAwhile();
            this.mRoundDetector.stop();
            synchronized (this.mDeviceLock) {
                if (this.mCamera2Device != null) {
                    if (!z2) {
                        this.mCamera2Device.captureAbortBurst();
                    }
                    this.mCamera2Device.stopPreviewCallback(z2);
                }
            }
            if (z && this.mCanSavePanorama) {
                z = true;
            } else {
                z = false;
            }
            this.mShutterEndTime = createDateStringForAppSeg(System.currentTimeMillis());
            this.mSaveOutputImageTask = new SaveOutputImageTask(z);
            this.mSaveOutputImageTask.execute(new Void[0]);
            onStopShooting(z);
            return;
        }
        Log.w(TAG, "stopPanoramaShooting while not shooting");
    }

    private void onStopShooting(boolean z) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (z) {
            actionProcessing.processingFinish();
        } else {
            actionProcessing.processingFailed();
        }
        this.mMainHandler.sendEmptyMessage(53);
    }

    public void requestRender() {
        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
        if (panoramaProtocol != null) {
            panoramaProtocol.requestRender();
        }
    }

    private boolean isProcessingFinishTask() {
        if (this.mSaveOutputImageTask == null || this.mSaveOutputImageTask.getStatus() == Status.FINISHED) {
            return false;
        }
        return true;
    }

    private void finishEngine() {
        if (this.mMorphoPanoramaGP3 != null) {
            Log.d(TAG, "finishEngine start");
            this.mMorphoPanoramaGP3.deleteNativeOutputInfo();
            if (this.mMorphoPanoramaGP3.finish(true) != 0) {
                Log.e(TAG, String.format(Locale.US, "finish error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
            }
            Log.d(TAG, "finishEngine end");
            this.mMorphoPanoramaGP3 = null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x0083  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0079  */
    private boolean savePanoramaFile(java.lang.String r17, int r18, int r19) {
        /*
        r16 = this;
        r0 = r16;
        r3 = r17;
        r13 = new com.android.camera.panorama.MorphoPanoramaGP3$GalleryInfoData;
        r13.<init>();
        r1 = com.android.camera.storage.Storage.isUseDocumentMode();
        r14 = 1;
        if (r1 == 0) goto L_0x0065;
    L_0x0011:
        r1 = -1;
        r2 = com.android.camera.FileCompat.getParcelFileDescriptor(r3, r14);	 Catch:{ Exception -> 0x004c }
        r15 = 0;
        r4 = r0.mMorphoPanoramaGP3;	 Catch:{ Throwable -> 0x0037 }
        r7 = r2.getFileDescriptor();	 Catch:{ Throwable -> 0x0037 }
        r8 = r0.mShutterStartTime;	 Catch:{ Throwable -> 0x0037 }
        r9 = r0.mShutterEndTime;	 Catch:{ Throwable -> 0x0037 }
        r10 = 0;
        r12 = 0;
        r5 = r18;
        r6 = r19;
        r11 = r13;
        r4 = r4.savePanorama360(r5, r6, r7, r8, r9, r10, r11, r12);	 Catch:{ Throwable -> 0x0037 }
        if (r2 == 0) goto L_0x0064;
    L_0x002e:
        r2.close();	 Catch:{ Exception -> 0x0032 }
        goto L_0x0064;
    L_0x0032:
        r0 = move-exception;
        goto L_0x004e;
    L_0x0034:
        r0 = move-exception;
        r4 = r0;
        goto L_0x003a;
    L_0x0037:
        r0 = move-exception;
        r15 = r0;
        throw r15;	 Catch:{ all -> 0x0034 }
    L_0x003a:
        if (r2 == 0) goto L_0x004b;
    L_0x003c:
        if (r15 == 0) goto L_0x0048;
    L_0x003e:
        r2.close();	 Catch:{ Throwable -> 0x0042 }
        goto L_0x004b;
    L_0x0042:
        r0 = move-exception;
        r2 = r0;
        r15.addSuppressed(r2);	 Catch:{ Exception -> 0x004c }
        goto L_0x004b;
    L_0x0048:
        r2.close();	 Catch:{ Exception -> 0x004c }
    L_0x004b:
        throw r4;	 Catch:{ Exception -> 0x004c }
    L_0x004c:
        r0 = move-exception;
        r4 = r1;
    L_0x004e:
        r1 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r5 = "open file failed, filePath ";
        r2.append(r5);
        r2.append(r3);
        r2 = r2.toString();
        com.android.camera.log.Log.e(r1, r2, r0);
    L_0x0064:
        goto L_0x0077;
    L_0x0065:
        r1 = r0.mMorphoPanoramaGP3;
        r4 = r0.mShutterStartTime;
        r5 = r0.mShutterEndTime;
        r6 = 0;
        r8 = 0;
        r0 = r1;
        r1 = r18;
        r2 = r19;
        r7 = r13;
        r4 = r0.savePanorama360(r1, r2, r3, r4, r5, r6, r7, r8);
    L_0x0077:
        if (r4 != 0) goto L_0x0083;
    L_0x0079:
        r0 = TAG;
        r1 = r13.toString();
        com.android.camera.log.Log.d(r0, r1);
        return r14;
    L_0x0083:
        r0 = TAG;
        r1 = "savePanorama360() -> 0x%x";
        r2 = new java.lang.Object[r14];
        r3 = java.lang.Integer.valueOf(r4);
        r4 = 0;
        r2[r4] = r3;
        r1 = java.lang.String.format(r1, r2);
        com.android.camera.log.Log.e(r0, r1);
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.Panorama3Module.savePanoramaFile(java.lang.String, int, int):boolean");
    }

    private int calibrateRotation(int i) {
        if (!(i == 0 || i == 90 || i == 180 || i == 270)) {
            i = 0;
        }
        return (i + this.mDeviceOrientationAtCapture) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
    }

    private void addImageAsApplication(String str, int i, int i2, int i3) {
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        ExifHelper.writeExif(str, i3, currentLocation, this.mTimeTaken);
        boolean z = currentLocation != null;
        Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(CameraAppImpl.getAndroidContext(), str, i3, this.mTimeTaken, this.mLocation, i, i2);
        if (addImageForGroupOrPanorama == null) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("insert MediaProvider failed, attempt to find uri by path, ");
            stringBuilder.append(str);
            Log.w(str2, stringBuilder.toString());
            addImageForGroupOrPanorama = MediaProviderUtil.getContentUriFromPath(this.mActivity, str);
        }
        String str3 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("addImageAsApplication uri = ");
        stringBuilder2.append(addImageForGroupOrPanorama);
        stringBuilder2.append(", path = ");
        stringBuilder2.append(str);
        Log.d(str3, stringBuilder2.toString());
        trackGeneralInfo(1, false);
        trackPictureTaken(1, false, z);
        Context context = this.mActivity;
        if (isCreated() && context != null) {
            context.getScreenHint().updateHint();
            if (addImageForGroupOrPanorama != null) {
                context.addSecureUri(addImageForGroupOrPanorama);
                Thumbnail createThumbnailFromUri = Thumbnail.createThumbnailFromUri(context.getContentResolver(), addImageForGroupOrPanorama, false);
                Util.broadcastNewPicture(context, addImageForGroupOrPanorama);
                context.getThumbnailUpdater().setThumbnail(createThumbnailFromUri, false, false);
            }
        }
    }

    protected void trackModeCustomInfo(int i) {
        CameraStatUtil.trackPictureTakenInPanorama(i);
    }

    private String createNameString(long j) {
        return DateFormat.format(getString(R.string.pano_file_name_format), j).toString();
    }

    private void onCaptureOrientationDecided() {
        Log.d(TAG, "onCaptureOrientationDecided");
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onCaptureOrientationDecided(this.mDirection, this.mAttachPosOffsetX, this.mAttachPosOffsetY);
        this.mCaptureOrientationDecided = true;
    }

    private void onPreviewMoving() {
        ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).onPreviewMoving();
    }

    private boolean isZslMode() {
        return true;
    }

    protected void sendOpenFailMessage() {
        this.mMainHandler.sendEmptyMessage(10);
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        if (this.mIsSensorAverage) {
            float[] fArr = this.mGravities;
            fArr[0] = fArr[0] + sensorEvent.values[0];
            fArr = this.mGravities;
            fArr[1] = fArr[1] + sensorEvent.values[1];
            fArr = this.mGravities;
            fArr[2] = fArr[2] + sensorEvent.values[2];
            this.mSensorCnt++;
            return;
        }
        this.mGravities[0] = sensorEvent.values[0];
        this.mGravities[1] = sensorEvent.values[1];
        this.mGravities[2] = sensorEvent.values[2];
        this.mSensorCnt = 1;
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    private void registerGravitySensorListener() {
        if (!this.mIsRegisterGravitySensor) {
            Log.d(TAG, "registerGravitySensorListener");
            this.mIsSensorAverage = false;
            this.mSensorCnt = 0;
            this.mGravities = new float[3];
            if (this.mSensorManager != null) {
                List sensorList = this.mSensorManager.getSensorList(9);
                if (sensorList.size() > 0) {
                    this.mSensorManager.registerListener(this, (Sensor) sensorList.get(0), 2);
                }
            }
            this.mIsRegisterGravitySensor = true;
        }
    }

    private void unregisterGravitySensorListener() {
        if (this.mIsRegisterGravitySensor) {
            Log.d(TAG, "unregisterGravitySensorListener");
            if (this.mSensorManager != null) {
                this.mSensorManager.unregisterListener(this);
            }
            this.mIsRegisterGravitySensor = false;
        }
    }

    private void setInitialRotationByGravity() {
        if (this.mMorphoPanoramaGP3 != null && this.mSensorCnt > 0) {
            float f = this.mGravities[0] / ((float) this.mSensorCnt);
            float f2 = this.mGravities[1] / ((float) this.mSensorCnt);
            float f3 = this.mGravities[2] / ((float) this.mSensorCnt);
            Log.d(TAG, String.format(Locale.US, "Gravity Sensor Value X=%f Y=%f Z=%f cnt=%d", new Object[]{Float.valueOf(f), Float.valueOf(f2), Float.valueOf(f3), Integer.valueOf(this.mSensorCnt)}));
            if (this.mMorphoPanoramaGP3.setInitialRotationByGravity((double) f, (double) f2, (double) f3) != 0) {
                Log.e(TAG, String.format(Locale.US, "MorphoPanoramaGP3.setInitialRotationByGravity error ret:0x%08X", new Object[]{Integer.valueOf(r0)}));
            }
        }
    }

    private void setSensorFusionValue(CaptureImage captureImage) {
        if (this.mMorphoPanoramaGP3 != null && this.mSensorFusion != null) {
            int size;
            SensorInfoManager sensorInfoManager;
            int[] iArr = new int[4];
            if (this.mSensorFusion.getSensorMatrix(null, null, null, iArr) != 0) {
                Log.e(TAG, String.format(Locale.US, "SensorFusion.getSensorMatrix error ret:0x%08X", new Object[]{Integer.valueOf(r2)}));
            }
            ArrayList stockData = this.mSensorFusion.getStockData();
            SensorInfoManager sensorInfoManager2 = new SensorInfoManager(4);
            sensorInfoManager2.g_ix = iArr[0];
            sensorInfoManager2.r_ix = iArr[3];
            sensorInfoManager2.a_ix = iArr[1];
            sensorInfoManager2.img_ix = this.mMorphoPanoramaGP3.getAttachCount();
            sensorInfoManager2.timeMillis = System.currentTimeMillis();
            sensorInfoManager2.imageTimeStamp = captureImage.getTimestamp();
            sensorInfoManager2.sensitivity = captureImage.getSensitivity();
            sensorInfoManager2.exposureTime = captureImage.getExposureTime();
            sensorInfoManager2.rollingShutterSkew = captureImage.getRollingShutterSkew();
            sensorInfoManager2.sensorTimeStamp = captureImage.getSensorTimeStamp();
            sensorInfoManager2.sensorData[0] = (ArrayList) ((ArrayList) stockData.get(0)).clone();
            sensorInfoManager2.sensorData[3] = (ArrayList) ((ArrayList) stockData.get(3)).clone();
            sensorInfoManager2.sensorData[1] = (ArrayList) ((ArrayList) stockData.get(1)).clone();
            if (sensorInfoManager2.sensorData[0].isEmpty()) {
                size = this.mSensorInfoManagerList.size();
                if (size > 0) {
                    sensorInfoManager = (SensorInfoManager) this.mSensorInfoManagerList.get(size - 1);
                    sensorInfoManager2.g_ix = sensorInfoManager.g_ix;
                    sensorInfoManager2.sensorData[0] = sensorInfoManager.sensorData[0];
                }
            }
            if (sensorInfoManager2.sensorData[3].isEmpty()) {
                size = this.mSensorInfoManagerList.size();
                if (size > 0) {
                    sensorInfoManager = (SensorInfoManager) this.mSensorInfoManagerList.get(size - 1);
                    sensorInfoManager2.r_ix = sensorInfoManager.r_ix;
                    sensorInfoManager2.sensorData[3] = sensorInfoManager.sensorData[3];
                }
            }
            if (sensorInfoManager2.sensorData[1].isEmpty()) {
                size = this.mSensorInfoManagerList.size();
                if (size > 0) {
                    sensorInfoManager = (SensorInfoManager) this.mSensorInfoManagerList.get(size - 1);
                    sensorInfoManager2.a_ix = sensorInfoManager.a_ix;
                    sensorInfoManager2.sensorData[1] = sensorInfoManager.sensorData[1];
                }
            }
            this.mCurrentSensorInfoManager = sensorInfoManager2;
            this.mSensorInfoManagerList.add(sensorInfoManager2);
            long attachCount = this.mMorphoPanoramaGP3.getAttachCount();
            size = ((ArrayList) stockData.get(0)).size();
            if (size > 0 && attachCount > 0 && this.mMorphoPanoramaGP3.setGyroscopeData((SensorData[]) ((ArrayList) stockData.get(0)).toArray(new SensorData[size])) != 0) {
                Log.e(TAG, String.format(Locale.US, "setGyroscopeData error ret:0x%08X", new Object[]{Integer.valueOf(size)}));
            }
            this.mSensorFusion.clearStockData();
        }
    }

    public static String createDateStringForAppSeg(long j) {
        Date date = new Date(j);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        return simpleDateFormat.format(date);
    }

    public void setNullDirectionFunction() {
        this.mDirectionFunction = new DirectionFunction(this.mPictureWidth, this.mPictureHeight, 1, 1, 1, 0);
    }

    protected int getOperatingMode() {
        return 32776;
    }
}
