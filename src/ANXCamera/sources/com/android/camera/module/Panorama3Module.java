package com.android.camera.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
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
import android.os.ParcelFileDescriptor;
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
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.OnClickAttr;
import com.android.camera.PictureSizeManager;
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
import com.android.camera.panorama.MorphoPanoramaGP3.GalleryInfoData;
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
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.PanoramaProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.MediaProviderUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.mi.config.b;
import com.oneplus.camera.R;
import java.io.FileDescriptor;
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
    public static final boolean DUMP_YUV = SystemProperties.getBoolean("camera.debug.panorama", false);
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
            com.android.camera.module.Panorama3Module.access$3602(r1.this$1.this$0, r0);
            createDirection(r0);
     */
            /* JADX WARNING: Missing block: B:54:0x01d5, code:
            if (com.android.camera.module.Panorama3Module.access$3700(r1.this$1.this$0).enabled() == false) goto L_0x01d8;
     */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void run() {
                while (true) {
                    try {
                        CaptureImage captureImage = (CaptureImage) Panorama3Module.this.mAttachImageQueue.take();
                        if (captureImage == Panorama3Module.sAttachExit) {
                            break;
                        }
                        try {
                            setImage(captureImage);
                            synchronized (Panorama3Module.mEngineLock) {
                                if (Panorama3Module.this.mMorphoPanoramaGP3.getAttachCount() % 5 == 0) {
                                    Panorama3Module.this.setInitialRotationByGravity();
                                    Panorama3Module.this.mIsSensorAverage = true;
                                }
                                Panorama3Module.this.setSensorFusionValue(captureImage);
                                if (Panorama3Module.this.mRequestStop) {
                                    Log.e(Panorama3Module.TAG, "DecideDirectionAttach request stop");
                                    closeSrc();
                                    return;
                                }
                                Log.d(Panorama3Module.TAG, "DecideDirectionAttach attach start");
                                int attach = Panorama3Module.this.mMorphoPanoramaGP3.attach(this.byteBuffer[0], this.byteBuffer[1], this.byteBuffer[2], this.rowStride[0], this.rowStride[1], this.rowStride[2], this.pixelStride[0], this.pixelStride[1], this.pixelStride[2], Panorama3Module.this.mCurrentSensorInfoManager, null, Panorama3Module.this.getActivity().getApplicationContext());
                                Log.d(Panorama3Module.TAG, "DecideDirectionAttach attach end");
                                boolean z = attach == MorphoPanoramaGP3.ERROR_INVALID_DIR;
                                if (attach != 0) {
                                    break;
                                }
                                if (isUnDecideDirection(Panorama3Module.this.mInitParam.direction)) {
                                    attach = Panorama3Module.this.mMorphoPanoramaGP3.getDirection();
                                    if (attach == Panorama3Module.this.mInitParam.direction) {
                                    }
                                } else {
                                    attach = Panorama3Module.this.mInitParam.direction;
                                }
                                String access$100 = Panorama3Module.TAG;
                                StringBuilder stringBuilder = new StringBuilder();
                                stringBuilder.append("getDirection = ");
                                stringBuilder.append(attach);
                                Log.d(access$100, stringBuilder.toString());
                                int[] iArr = new int[2];
                                if (Panorama3Module.this.mMorphoPanoramaGP3.getOutputImageSize(iArr) != 0) {
                                    Log.e(Panorama3Module.TAG, String.format(Locale.US, "getOutputImageSize error ret:0x%08X", new Object[]{Integer.valueOf(Panorama3Module.this.mMorphoPanoramaGP3.getOutputImageSize(iArr))}));
                                    closeSrc();
                                    return;
                                }
                                Panorama3Module.this.mMaxWidth = iArr[0];
                                Panorama3Module.this.mMaxHeight = iArr[1];
                                String access$1002 = Panorama3Module.TAG;
                                StringBuilder stringBuilder2 = new StringBuilder();
                                stringBuilder2.append("mMaxWidth = ");
                                stringBuilder2.append(Panorama3Module.this.mMaxWidth);
                                stringBuilder2.append(", mMaxHeight = ");
                                stringBuilder2.append(Panorama3Module.this.mMaxHeight);
                                Log.d(access$1002, stringBuilder2.toString());
                            }
                        } catch (Throwable th) {
                            closeSrc();
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                while (true) {
                }
                Panorama3Module.this.getActivity().runOnUiThread(new DecideRunnable(this, null));
                Log.d(Panorama3Module.TAG, "DecideDirectionAttach end");
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
            if (message.what == 45) {
                Log.d(Panorama3Module.TAG, "onMessage MSG_ABANDON_HANDLER setActivity null");
                Panorama3Module.this.setActivity(null);
            }
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
                    } else if (i != 51) {
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
                                if (!BaseModule.DEBUG) {
                                    String access$100 = Panorama3Module.TAG;
                                    StringBuilder stringBuilder = new StringBuilder();
                                    stringBuilder.append("no consumer for this message: ");
                                    stringBuilder.append(message.what);
                                    Log.e(access$100, stringBuilder.toString());
                                    break;
                                }
                                StringBuilder stringBuilder2 = new StringBuilder();
                                stringBuilder2.append("no consumer for this message: ");
                                stringBuilder2.append(message.what);
                                throw new RuntimeException(stringBuilder2.toString());
                        }
                    } else if (!(Panorama3Module.this.mActivity == null || Panorama3Module.this.mActivity.isActivityPaused())) {
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
                    if (!PanoramaPreview.this.this$0.mPaused && !PanoramaPreview.this.this$0.mRequestStop) {
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
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void run() {
                int i;
                Throwable th;
                Log.d(Panorama3Module.TAG, "PreviewAttach.run start");
                int i2 = 2;
                double[] dArr = new double[2];
                while (true) {
                    try {
                        CaptureImage captureImage = (CaptureImage) PanoramaPreview.this.this$0.mAttachImageQueue.take();
                        if (captureImage == Panorama3Module.sAttachExit) {
                            break;
                        }
                        try {
                            setImage(captureImage);
                            if (Panorama3Module.DUMP_YUV) {
                                this.mInputSave.onSaveImage(captureImage, PanoramaPreview.this.this$0.mImageFormat);
                            }
                            synchronized (Panorama3Module.mEngineLock) {
                                try {
                                    if (PanoramaPreview.this.this$0.mRequestStop) {
                                        Log.w(Panorama3Module.TAG, "PreviewAttach request stop");
                                        closeSrc();
                                        return;
                                    }
                                    Log.v(Panorama3Module.TAG, "PreviewAttach attach start");
                                    PanoramaPreview.this.this$0.setSensorFusionValue(captureImage);
                                    double[] dArr2 = dArr;
                                    double[] dArr3 = dArr;
                                    i = -1;
                                    try {
                                        if (PanoramaPreview.this.this$0.mMorphoPanoramaGP3.attach(this.byteBuffer[0], this.byteBuffer[1], this.byteBuffer[i2], this.rowStride[0], this.rowStride[1], this.rowStride[i2], this.pixelStride[0], this.pixelStride[1], this.pixelStride[i2], PanoramaPreview.this.this$0.mCurrentSensorInfoManager, dArr2, PanoramaPreview.this.this$0.getActivity()) != 0) {
                                            Log.e(Panorama3Module.TAG, "PreviewAttach attach error.");
                                            this.mResultCode = i;
                                        } else {
                                            Log.v(Panorama3Module.TAG, "PreviewAttach attach end");
                                            PanoramaPreview.this.this$0.mCanSavePanorama = true;
                                            updatePreviewImage();
                                            String access$100 = Panorama3Module.TAG;
                                            StringBuilder stringBuilder = new StringBuilder();
                                            stringBuilder.append("mCenter = ");
                                            stringBuilder.append(dArr3[0]);
                                            stringBuilder.append(", ");
                                            stringBuilder.append(dArr3[1]);
                                            Log.v(access$100, stringBuilder.toString());
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        throw th;
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                    i = -1;
                                }
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            i = -1;
                            closeSrc();
                            throw th;
                        }
                        dArr = r0;
                        i2 = 2;
                    } catch (InterruptedException e) {
                        th = e;
                        i = -1;
                    }
                }
                try {
                    closeSrc();
                } catch (InterruptedException e2) {
                    th = e2;
                }
                if (PanoramaPreview.this.this$0.mRequestStop) {
                    i2 = this.mResultCode;
                    PanoramaPreview.this.this$0.getActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            PanoramaPreview.this.attachEnd(i2);
                        }
                    });
                    Log.d(Panorama3Module.TAG, "PreviewAttach exit.");
                    return;
                }
                PanoramaPreview.this.this$0.getActivity().runOnUiThread(new Runnable() {
                    public void run() {
                        PanoramaPreview.this.this$0.registerGravitySensorListener();
                    }
                });
                Log.d(Panorama3Module.TAG, "PreviewAttach exit. (request exit)");
                return;
                Log.w(Panorama3Module.TAG, "PreviewAttach interrupted", th);
                this.mResultCode = i;
                if (PanoramaPreview.this.this$0.mRequestStop) {
                }
            }

            /* JADX WARNING: Missing block: B:25:0x01fb, code:
            return;
     */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            private void updatePreviewImage() {
                synchronized (Panorama3Module.mPreviewImageLock) {
                    int updatePreviewImage = PanoramaPreview.this.this$0.mMorphoPanoramaGP3.updatePreviewImage(PanoramaPreview.this.this$0.mPreviewImage);
                    String access$100;
                    StringBuilder stringBuilder;
                    if (updatePreviewImage != 0) {
                        access$100 = Panorama3Module.TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("updatePreviewImage error ret:");
                        stringBuilder.append(updatePreviewImage);
                        Log.e(access$100, stringBuilder.toString());
                    } else if (PanoramaPreview.this.this$0.mPreviewImage == null) {
                        Log.w(Panorama3Module.TAG, "mPreviewImage is null when updatePreviewImage");
                    } else {
                        int i = 90;
                        Matrix matrix;
                        Bitmap createBitmap;
                        int width;
                        int width2;
                        int height;
                        Rect rect;
                        int height2;
                        Rect rect2;
                        if (PanoramaPreview.this.this$0.mInitParam.output_rotation % 180 == 90) {
                            if (PanoramaPreview.this.this$0.mInitParam.output_rotation == 270) {
                                matrix = new Matrix();
                                matrix.postRotate((float) 180);
                                createBitmap = Bitmap.createBitmap(PanoramaPreview.this.this$0.mPreviewImage, 0, 0, PanoramaPreview.this.this$0.mPreviewImage.getWidth(), PanoramaPreview.this.this$0.mPreviewImage.getHeight(), matrix, true);
                            } else {
                                createBitmap = PanoramaPreview.this.this$0.mPreviewImage;
                            }
                            width = createBitmap.getWidth();
                            i = Math.round(((float) createBitmap.getHeight()) * PanoramaPreview.this.this$0.mLongSideCropRatio);
                            width2 = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                            height = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                            rect = new Rect(0, 0, width2, height);
                            width2 = (int) (((float) width) / (((float) width2) / ((float) height)));
                            height2 = ((int) ((((float) createBitmap.getHeight()) * (1.0f - PanoramaPreview.this.this$0.mLongSideCropRatio)) / 2.0f)) + ((width2 - i) / 2);
                            rect2 = new Rect(0, height2, width, width2 + height2);
                            access$100 = Panorama3Module.TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("src ");
                            stringBuilder.append(rect2);
                            stringBuilder.append(", dst = ");
                            stringBuilder.append(rect);
                            Log.v(access$100, stringBuilder.toString());
                            PanoramaPreview.this.this$0.mDispPreviewImageCanvas.drawBitmap(createBitmap, rect2, rect, PanoramaPreview.this.this$0.mDispPreviewImagePaint);
                        } else {
                            if (PanoramaPreview.this.this$0.mInitParam.output_rotation == 180) {
                                i = -90;
                            }
                            matrix = new Matrix();
                            matrix.postRotate((float) i);
                            createBitmap = Bitmap.createBitmap(PanoramaPreview.this.this$0.mPreviewImage, 0, 0, PanoramaPreview.this.this$0.mPreviewImage.getWidth(), PanoramaPreview.this.this$0.mPreviewImage.getHeight(), matrix, true);
                            width = createBitmap.getWidth();
                            i = Math.round(((float) createBitmap.getHeight()) * PanoramaPreview.this.this$0.mLongSideCropRatio);
                            width2 = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                            height = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                            rect = new Rect(0, 0, width2, height);
                            width2 = (int) (((float) width) / (((float) width2) / ((float) height)));
                            height2 = ((int) ((((float) createBitmap.getHeight()) * (1.0f - PanoramaPreview.this.this$0.mLongSideCropRatio)) / 2.0f)) + ((width2 - i) / 2);
                            rect2 = new Rect(0, height2, width, width2 + height2);
                            access$100 = Panorama3Module.TAG;
                            stringBuilder = new StringBuilder();
                            stringBuilder.append("src ");
                            stringBuilder.append(rect2);
                            stringBuilder.append(", dst = ");
                            stringBuilder.append(rect);
                            Log.v(access$100, stringBuilder.toString());
                            PanoramaPreview.this.this$0.mDispPreviewImageCanvas.drawBitmap(createBitmap, rect2, rect, PanoramaPreview.this.this$0.mDispPreviewImagePaint);
                        }
                    }
                }
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
            com.android.camera.module.Panorama3Module.access$6302(r5.this$1.this$0, java.lang.Math.min(r3, r4) / 2);
            r0 = (com.android.camera.protocol.ModeProtocol.PanoramaProtocol) com.android.camera.protocol.ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
     */
            /* JADX WARNING: Missing block: B:21:0x00a1, code:
            if (r0 == null) goto L_0x00bd;
     */
            /* JADX WARNING: Missing block: B:22:0x00a3, code:
            r0.setDirectionPosition(r2, com.android.camera.module.Panorama3Module.access$6300(r5.this$1.this$0));
     */
            /* JADX WARNING: Missing block: B:23:0x00b0, code:
            if (r5.mDetectResult == 2) goto L_0x00b7;
     */
            /* JADX WARNING: Missing block: B:24:0x00b2, code:
            r0.setDirectionTooFast(false, 0);
     */
            /* JADX WARNING: Missing block: B:25:0x00b7, code:
            r0.setDirectionTooFast(true, com.android.camera.constant.DurationConstant.DURATION_LANDSCAPE_HINT);
     */
            /* JADX WARNING: Missing block: B:26:0x00bd, code:
            return;
     */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void run() {
                if (this.mDetectResult == -2 || this.mDetectResult == -1 || this.mDetectResult == 1) {
                    if (this.mDetectResult != 1) {
                        String access$100 = Panorama3Module.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("stopPanoramaShooting due to detect result ");
                        stringBuilder.append(this.mDetectResult);
                        Log.w(access$100, stringBuilder.toString());
                    }
                    PanoramaPreview.this.this$0.stopPanoramaShooting(true);
                    return;
                }
                RectF frameRect = PanoramaPreview.this.mDetector.getFrameRect();
                String access$1002 = Panorama3Module.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("frame_rect = ");
                stringBuilder2.append(frameRect);
                Log.v(access$1002, stringBuilder2.toString());
                Point point = new Point();
                if (PanoramaPreview.this.this$0.mDirection == 3) {
                    point.x = (int) frameRect.right;
                } else {
                    point.x = (int) frameRect.left;
                }
                point.y = (int) frameRect.centerY();
                synchronized (Panorama3Module.mPreviewImageLock) {
                    if (PanoramaPreview.this.this$0.mDispPreviewImage == null) {
                        Log.w(Panorama3Module.TAG, "mPreviewImage is null in UiUpdateRunnable");
                        return;
                    }
                    int width = PanoramaPreview.this.this$0.mDispPreviewImage.getWidth();
                    int height = PanoramaPreview.this.this$0.mDispPreviewImage.getHeight();
                }
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
                        int width = rect.width();
                        int height = rect.height();
                        String access$1002;
                        StringBuilder stringBuilder2;
                        if (width == 0 || height == 0) {
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
                        String access$900 = Panorama3Module.this.createNameString(Panorama3Module.this.mTimeTaken);
                        String generateFilepath = Storage.generateFilepath(access$900);
                        if (Panorama3Module.this.savePanoramaFile(generateFilepath, width, height)) {
                            Panorama3Module.this.addImageAsApplication(generateFilepath, access$900, width, height, Panorama3Module.this.calibrateRotation(1));
                            Panorama3Module.this.finishEngine();
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
        }

        protected void onPostExecute(Integer num) {
            Log.d(Panorama3Module.TAG, "PanoramaFinish done");
            Context context = Panorama3Module.this.mActivity;
            if (context != null) {
                AutoLockManager.getInstance(context).hibernateDelayed();
            }
            if (Panorama3Module.this.mPaused) {
                Panorama3Module.this.mIsShooting = false;
                Log.w(Panorama3Module.TAG, "panorama mode has been paused");
                return;
            }
            if (Panorama3Module.this.mDispPreviewImage != null) {
                Panorama3Module.this.mDispPreviewImage.eraseColor(0);
            }
            if (context != null) {
                context.getThumbnailUpdater().updateThumbnailView(true);
            }
            Panorama3Module.this.onSaveFinish();
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void addAttachQueue(CaptureImage captureImage) {
        boolean offer;
        Throwable th;
        if (captureImage == null) {
            Log.w(TAG, "addAttachQueue failed due to image is null");
            return;
        }
        try {
            if (this.mRequestStop) {
                Log.w(TAG, "addAttachQueue failed due to request stop");
                captureImage.close();
                return;
            }
            offer = this.mAttachImageQueue.offer(captureImage);
            while (this.mAttachImageQueue.size() > 1) {
                try {
                    CaptureImage captureImage2 = (CaptureImage) this.mAttachImageQueue.poll();
                    if (captureImage2 != null) {
                        captureImage2.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (!offer) {
                        captureImage.close();
                    }
                    throw th;
                }
            }
            if (!offer) {
                captureImage.close();
            }
            Log.v(TAG, "addAttachQueue");
        } catch (Throwable th3) {
            Throwable th4 = th3;
            offer = false;
            th = th4;
            if (offer) {
            }
            throw th;
        }
    }

    private void requestStopShoot() {
        addAttachQueue(sAttachExit);
        this.mRequestStop = true;
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 174, 164, 212);
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        Camera camera = this.mActivity;
        if (camera != null) {
            camera.getImplFactory().detachAdditional();
        }
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
        if (isTextureExpired() && retryOnceIfCameraError(this.mMainHandler)) {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        } else {
            this.mMainHandler.sendEmptyMessage(51);
        }
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    public boolean isPanoramaDoing() {
        return this.mIsShooting;
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        this.mGoalAngle = DataRepository.dataItemFeature().fF();
        this.mLongSideCropRatio = DataRepository.dataItemFeature().fG();
        this.mSmallPreviewHeight = (int) this.mActivity.getResources().getDimension(R.dimen.pano_preview_hint_frame_height);
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        onCameraOpened();
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
        if (b.pE.equals("lavender") && this.mViewAngleH > 50.0f) {
            this.mGoalAngle = 291;
        }
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
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), (double) CameraSettings.getPreviewAspectRatio(bestPanoPictureSize.width, bestPanoPictureSize.height));
        this.mPictureSize = bestPanoPictureSize;
        this.mPictureWidth = this.mPictureSize.width;
        this.mPictureHeight = this.mPictureSize.height;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("pictureSize= ");
        stringBuilder.append(bestPanoPictureSize.width);
        stringBuilder.append("X");
        stringBuilder.append(bestPanoPictureSize.height);
        stringBuilder.append(" previewSize=");
        stringBuilder.append(this.mPreviewSize.width);
        stringBuilder.append("X");
        stringBuilder.append(this.mPreviewSize.height);
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
            ((PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176)).initPreviewLayout((width * dimensionPixelSize) / height, dimensionPixelSize, this.mPreviewSize.width, this.mPreviewSize.height);
        }
    }

    protected void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            onShutterButtonClick(20);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0036 A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        if (i == 27 || i == 66) {
            if (keyEvent.getRepeatCount() == 0) {
                if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                    onShutterButtonClick(40);
                } else if (CameraSettings.isFingerprintCaptureEnable()) {
                    onShutterButtonClick(30);
                }
                return true;
            }
        } else if (i != Util.KEYCODE_SLIDE_ON) {
            switch (i) {
                case 23:
                    if (keyEvent.getRepeatCount() == 0) {
                        onShutterButtonClick(50);
                        return true;
                    }
                    break;
                case 24:
                case 25:
                    z = true;
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount())) {
                    }
                    break;
                default:
                    switch (i) {
                        case 87:
                        case 88:
                            break;
                    }
                    if (i == 24 || i == 88) {
                        z = true;
                    }
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount())) {
                        return true;
                    }
                    break;
            }
        } else if (this.mIsShooting) {
            stopPanoramaShooting(true);
        }
        return super.onKeyDown(i, keyEvent);
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
                setTriggerMode(i);
                if (!this.mIsShooting) {
                    this.mActivity.getScreenHint().updateHint();
                    if (Storage.isLowStorageAtLastPoint()) {
                        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFailed();
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
        if (z && CameraSettings.isCameraSoundOpen()) {
            Camera camera = this.mActivity;
            if (camera != null) {
                camera.loadCameraSound(2);
                camera.loadCameraSound(3);
            }
        }
    }

    public boolean shouldReleaseLater() {
        return isPanoramaDoing();
    }

    public void onHostStopAndNotifyActionStop() {
        playCameraSound(3);
        stopPanoramaShooting(true, true);
        synchronized (mPreviewImageLock) {
            if (this.mPreviewImage != null) {
                this.mPreviewImage.recycle();
                this.mPreviewImage = null;
            }
            if (this.mDispPreviewImage != null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onPause recycle bitmap ");
                stringBuilder.append(this.mDispPreviewImage);
                Log.d(str, stringBuilder.toString());
                this.mDispPreviewImage.recycle();
                this.mDispPreviewImage = null;
            }
        }
        doLaterReleaseIfNeed();
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
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
        this.mCamera2Device.startPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), true, false, getOperatingMode(), false, this);
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
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        recordState.onPrepare();
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
            this.mCamera2Device.setShotType(3);
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
        keepScreenOnAwhile();
        recordState.onStart();
        this.mPanoramaShootingStartTime = SystemClock.elapsedRealtime();
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
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
                    if (z2) {
                        PanoramaProtocol panoramaProtocol = (PanoramaProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(176);
                        if (panoramaProtocol != null) {
                            Log.d(TAG, "onPause setDisplayPreviewBitmap null");
                            panoramaProtocol.setDisplayPreviewBitmap(null);
                        }
                    } else {
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
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onStopShooting recordState is null, succeed = ");
            stringBuilder.append(z);
            Log.w(str, stringBuilder.toString());
            return;
        }
        if (z) {
            recordState.onPostSavingStart();
        } else {
            recordState.onFailed();
        }
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

    private void onSaveFinish() {
        if (isAlive() && this.mCamera2Device != null) {
            enableCameraControls(true);
            if (this.mAeLockSupported) {
                this.mCamera2Device.setAELock(false);
            }
            if (this.mAwbLockSupported) {
                this.mCamera2Device.setAWBLock(false);
            }
            this.mCamera2Device.setFocusMode(this.mTargetFocusMode);
            startPreview();
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean savePanoramaFile(String str, int i, int i2) {
        int i3;
        Throwable th;
        Throwable th2 = this;
        String str2 = str;
        GalleryInfoData galleryInfoData = new GalleryInfoData();
        if (Storage.isUseDocumentMode()) {
            ParcelFileDescriptor parcelFileDescriptor;
            th2 = -1;
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str2, true);
                i3 = th2.mMorphoPanoramaGP3;
                FileDescriptor fileDescriptor = parcelFileDescriptor.getFileDescriptor();
                String str3 = th2.mShutterStartTime;
                String str4 = th2.mShutterEndTime;
            } catch (Exception e) {
                th2 = e;
                String str5 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("open file failed, filePath ");
                stringBuilder.append(str2);
                Log.e(str5, stringBuilder.toString(), th2);
                if (i3 != 0) {
                }
            } catch (Throwable th3) {
                th2 = th3;
                continue;
                th.addSuppressed(parcelFileDescriptor);
            } finally {
                while (true) {
                    th2 = 
/*
Method generation error in method: com.android.camera.module.Panorama3Module.savePanoramaFile(java.lang.String, int, int):boolean, dex: classes.dex
jadx.core.utils.exceptions.CodegenException: Error generate insn: ?: MERGE  (r0_4 'th2' java.lang.Throwable) = (r0_3 'th2' java.lang.Throwable), (r18_0 'i' int) in method: com.android.camera.module.Panorama3Module.savePanoramaFile(java.lang.String, int, int):boolean, dex: classes.dex
	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:228)
	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:205)
	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:100)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:50)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:93)
	at jadx.core.codegen.RegionGen.makeLoop(RegionGen.java:173)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:61)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:93)
	at jadx.core.codegen.RegionGen.makeTryCatch(RegionGen.java:298)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:63)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:93)
	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:118)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:57)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:173)
	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:321)
	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:259)
	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:221)
	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:111)
	at jadx.core.codegen.ClassGen.makeClass(ClassGen.java:77)
	at jadx.core.codegen.CodeGen.visit(CodeGen.java:10)
	at jadx.core.ProcessClass.process(ProcessClass.java:38)
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:292)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
Caused by: jadx.core.utils.exceptions.CodegenException: MERGE can be used only in fallback mode
	at jadx.core.codegen.InsnGen.fallbackOnlyInsn(InsnGen.java:539)
	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:511)
	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:222)
	... 31 more

*/

    private int calibrateRotation(int i) {
        if (!(i == 0 || i == 90 || i == 180 || i == 270)) {
            i = 0;
        }
        return (i + this.mDeviceOrientationAtCapture) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
    }

    private void addImageAsApplication(String str, String str2, int i, int i2, int i3) {
        String str3 = str;
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        int i4 = i3;
        ExifHelper.writeExifByFilePath(str3, i4, currentLocation, this.mTimeTaken);
        boolean z = currentLocation != null;
        Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(CameraAppImpl.getAndroidContext(), str3, i4, this.mTimeTaken, this.mLocation, i, i2);
        if (addImageForGroupOrPanorama == null) {
            String str4 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("insert MediaProvider failed, attempt to find uri by path, ");
            stringBuilder.append(str3);
            Log.w(str4, stringBuilder.toString());
            addImageForGroupOrPanorama = MediaProviderUtil.getContentUriFromPath(CameraAppImpl.getAndroidContext(), str3);
        }
        String str5 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("addImageAsApplication uri = ");
        stringBuilder2.append(addImageForGroupOrPanorama);
        stringBuilder2.append(", path = ");
        stringBuilder2.append(str3);
        Log.d(str5, stringBuilder2.toString());
        trackGeneralInfo(1, false);
        trackPictureTaken(1, false, z);
        Context context = this.mActivity;
        if (isCreated() && context != null) {
            context.getScreenHint().updateHint();
            if (addImageForGroupOrPanorama != null) {
                context.onNewUriArrived(addImageForGroupOrPanorama, str2);
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
