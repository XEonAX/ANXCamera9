.class public Lcom/android/camera/module/Panorama3Module;
.super Lcom/android/camera/module/BaseModule;
.source "Panorama3Module.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Panorama3Module$PanoramaPreview;,
        Lcom/android/camera/module/Panorama3Module$DecideDirection;,
        Lcom/android/camera/module/Panorama3Module$PanoramaFirst;,
        Lcom/android/camera/module/Panorama3Module$PanoramaInit;,
        Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;,
        Lcom/android/camera/module/Panorama3Module$MainHandler;
    }
.end annotation


# static fields
.field private static final MIN_SHOOTING_TIME:I = 0x258

.field private static final PREVIEW_SKIP_COUNT:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field public static final mEngineLock:Ljava/lang/Object;

.field private static final mPreviewImageLock:Ljava/lang/Object;

.field private static final sAttachExit:Lcom/android/camera/panorama/CaptureImage;


# instance fields
.field private mAccelerometer:Landroid/hardware/Sensor;

.field private final mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/android/camera/panorama/CaptureImage;",
            ">;"
        }
    .end annotation
.end field

.field private mAttachPosOffsetX:I

.field private mAttachPosOffsetY:I

.field private mCameraOrientation:I

.field private volatile mCanSavePanorama:Z

.field private mCaptureOrientationDecided:Z

.field private mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

.field private final mDeviceLock:Ljava/lang/Object;

.field private mDeviceOrientationAtCapture:I

.field private mDirection:I

.field private mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

.field private mDispPreviewImage:Landroid/graphics/Bitmap;

.field private mDispPreviewImageCanvas:Landroid/graphics/Canvas;

.field private mDispPreviewImagePaint:Landroid/graphics/Paint;

.field private final mExecutor:Ljava/util/concurrent/ExecutorService;

.field private mGoalAngle:I

.field private mGravities:[F

.field private mGyroscope:Landroid/hardware/Sensor;

.field private mGyroscopeUncalibrated:Landroid/hardware/Sensor;

.field private mImageFormat:Ljava/lang/String;

.field private mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

.field private volatile mIsRegisterGravitySensor:Z

.field private mIsSensorAverage:Z

.field private volatile mIsShooting:Z

.field private mLocation:Landroid/location/Location;

.field private mLongSideCropRatio:F

.field private mMagnetic:Landroid/hardware/Sensor;

.field protected final mMainHandler:Landroid/os/Handler;

.field private mMaxHeight:I

.field private mMaxWidth:I

.field private mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

.field private mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

.field private mPanoramaShootingStartTime:J

.field private mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

.field private mPictureHeight:I

.field private mPictureWidth:I

.field private mPreviewImage:Landroid/graphics/Bitmap;

.field private mPreviewRefY:I

.field private volatile mRequestStop:Z

.field private mRotationVector:Landroid/hardware/Sensor;

.field private mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

.field private mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

.field private mSensorCnt:I

.field private mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

.field private mSensorFusionMode:I

.field private mSensorInfoManagerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/panorama/SensorInfoManager;",
            ">;"
        }
    .end annotation
.end field

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSensorThread:Landroid/os/HandlerThread;

.field private mShutterEndTime:Ljava/lang/String;

.field private mShutterStartTime:Ljava/lang/String;

.field private mSmallPreviewHeight:I

.field private mSnapshotFocusMode:I

.field private mTargetFocusMode:I

.field private mTimeTaken:J

.field private mViewAngleH:F

.field private mViewAngleV:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 132
    const-class v0, Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    .line 202
    new-instance v0, Lcom/android/camera/panorama/Camera1Image;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v1}, Lcom/android/camera/panorama/Camera1Image;-><init>([BII)V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    .line 203
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->mEngineLock:Ljava/lang/Object;

    .line 204
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/module/Panorama3Module;->mPreviewImageLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 135
    const/16 v0, 0x118

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    .line 140
    const v0, 0x3f6068dc    # 0.8766f

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    .line 145
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    .line 146
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    .line 147
    new-instance v1, Lcom/android/camera/module/Panorama3Module$MainHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/Panorama3Module$MainHandler;-><init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/module/Panorama3Module$1;)V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    .line 151
    const/4 v1, 0x4

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    .line 152
    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mSnapshotFocusMode:I

    .line 159
    new-instance v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    invoke-direct {v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    .line 160
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    .line 165
    const-string v1, "YVU420_SEMIPLANAR"

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    .line 177
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    .line 183
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    .line 184
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    .line 185
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    .line 186
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    .line 189
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    .line 190
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    .line 194
    const v1, 0x428e7684

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    .line 195
    const v1, 0x4261fa7e

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    .line 196
    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    .line 200
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 201
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 215
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    .line 216
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 128
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImage:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/PanoramaState;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/PanoramaState;)Lcom/android/camera/panorama/PanoramaState;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/RoundDetector;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/Panorama3Module;)J
    .locals 2

    .line 128
    iget-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    return-wide v0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/Panorama3Module;J)Ljava/lang/String;
    .locals 0

    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Panorama3Module;->createNameString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;II)Z
    .locals 0

    .line 128
    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/Panorama3Module;->savePanoramaFile(Ljava/lang/String;II)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->finishEngine()V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->calibrateRotation(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1900(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;III)V
    .locals 0

    .line 128
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/camera/module/Panorama3Module;->addImageAsApplication(Ljava/lang/String;III)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->registerGravitySensorListener()V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    return p0
.end method

.method static synthetic access$2100(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->resetToPreview()V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/camera/module/Panorama3Module;)Ljava/lang/String;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2202(Lcom/android/camera/module/Panorama3Module;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2300(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->createEngine()Z

    move-result p0

    return p0
.end method

.method static synthetic access$2500(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    .line 128
    iget-boolean p0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    return p0
.end method

.method static synthetic access$2600(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->configMorphoPanoramaGP3()Z

    move-result p0

    return p0
.end method

.method static synthetic access$2700(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    return p0
.end method

.method static synthetic access$2800(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initPreviewLayout()V

    return-void
.end method

.method static synthetic access$3000(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mMaxHeight:I

    return p0
.end method

.method static synthetic access$3002(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mMaxHeight:I

    return p1
.end method

.method static synthetic access$3100(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mSmallPreviewHeight:I

    return p0
.end method

.method static synthetic access$3200(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    return p0
.end method

.method static synthetic access$3300(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    return-object p0
.end method

.method static synthetic access$3400()Lcom/android/camera/panorama/CaptureImage;
    .locals 1

    .line 128
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->setInitialRotationByGravity()V

    return-void
.end method

.method static synthetic access$3602(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    .line 128
    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    return p1
.end method

.method static synthetic access$3700(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V
    .locals 0

    .line 128
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setSensorFusionValue(Lcom/android/camera/panorama/CaptureImage;)V

    return-void
.end method

.method static synthetic access$3800(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/SensorInfoManager;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

    return-object p0
.end method

.method static synthetic access$3900(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->resetUI()V

    return-void
.end method

.method static synthetic access$4000(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mMaxWidth:I

    return p0
.end method

.method static synthetic access$4002(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mMaxWidth:I

    return p1
.end method

.method static synthetic access$4100(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    return p0
.end method

.method static synthetic access$4102(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    return p1
.end method

.method static synthetic access$4200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/DirectionFunction;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    return-object p0
.end method

.method static synthetic access$4202(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/DirectionFunction;)Lcom/android/camera/panorama/DirectionFunction;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    return-object p1
.end method

.method static synthetic access$4400(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    return p0
.end method

.method static synthetic access$4500(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->unregisterGravitySensorListener()V

    return-void
.end method

.method static synthetic access$4600(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V
    .locals 0

    .line 128
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V

    return-void
.end method

.method static synthetic access$4800(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic access$5000(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    return p0
.end method

.method static synthetic access$5100(Lcom/android/camera/module/Panorama3Module;)F
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    return p0
.end method

.method static synthetic access$5200(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    return p0
.end method

.method static synthetic access$5202(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    return p1
.end method

.method static synthetic access$5300(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Canvas;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImageCanvas:Landroid/graphics/Canvas;

    return-object p0
.end method

.method static synthetic access$5302(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Canvas;)Landroid/graphics/Canvas;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImageCanvas:Landroid/graphics/Canvas;

    return-object p1
.end method

.method static synthetic access$5400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Paint;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImagePaint:Landroid/graphics/Paint;

    return-object p0
.end method

.method static synthetic access$5402(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mDispPreviewImagePaint:Landroid/graphics/Paint;

    return-object p1
.end method

.method static synthetic access$5600(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initAttachQueue()V

    return-void
.end method

.method static synthetic access$5700(Lcom/android/camera/module/Panorama3Module;Z)V
    .locals 0

    .line 128
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    return-void
.end method

.method static synthetic access$5902(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    .line 128
    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    .line 128
    iget-boolean p0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/module/Panorama3Module;Z)Z
    .locals 0

    .line 128
    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    return p1
.end method

.method static synthetic access$6100(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->onPreviewMoving()V

    return-void
.end method

.method static synthetic access$6200(Lcom/android/camera/module/Panorama3Module;)Z
    .locals 0

    .line 128
    iget-boolean p0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    return p0
.end method

.method static synthetic access$6300(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->onCaptureOrientationDecided()V

    return-void
.end method

.method static synthetic access$6600(Lcom/android/camera/module/Panorama3Module;)I
    .locals 0

    .line 128
    iget p0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewRefY:I

    return p0
.end method

.method static synthetic access$6602(Lcom/android/camera/module/Panorama3Module;I)I
    .locals 0

    .line 128
    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewRefY:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/module/Panorama3Module;ZZ)V
    .locals 0

    .line 128
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    return-void
.end method

.method static synthetic access$800()Ljava/lang/Object;
    .locals 1

    .line 128
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->mPreviewImageLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;
    .locals 0

    .line 128
    iget-object p0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$902(Lcom/android/camera/module/Panorama3Module;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewImage:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method private addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V
    .locals 4

    .line 230
    if-nez p1, :cond_0

    .line 231
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "addAttachQueue failed due to image is null"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    return-void

    .line 235
    :cond_0
    const/4 v0, 0x0

    .line 237
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    if-eqz v1, :cond_1

    .line 238
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "addAttachQueue failed due to request stop"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 251
    nop

    .line 252
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 239
    return-void

    .line 242
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 244
    :goto_0
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_3

    .line 245
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/panorama/CaptureImage;

    .line 246
    if-eqz v0, :cond_2

    .line 247
    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    :cond_2
    goto :goto_0

    .line 251
    :cond_3
    if-nez v1, :cond_4

    .line 252
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 255
    :cond_4
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "addAttachQueue"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    return-void

    .line 251
    :catchall_0
    move-exception v0

    goto :goto_1

    :catchall_1
    move-exception v1

    move-object v3, v1

    move v1, v0

    move-object v0, v3

    :goto_1
    if-nez v1, :cond_5

    .line 252
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    :cond_5
    throw v0
.end method

.method private addImageAsApplication(Ljava/lang/String;III)V
    .locals 11

    .line 1549
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v0

    .line 1550
    iget-wide v1, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    invoke-static {p1, p4, v0, v1, v2}, Lcom/android/camera/ExifHelper;->writeExif(Ljava/lang/String;ILandroid/location/Location;J)V

    .line 1551
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 1552
    move v0, v1

    goto :goto_0

    .line 1551
    :cond_0
    nop

    .line 1552
    move v0, v2

    :goto_0
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    iget-wide v6, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    iget-object v8, p0, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    move-object v4, p1

    move v5, p4

    move v9, p2

    move v10, p3

    invoke-static/range {v3 .. v10}, Lcom/android/camera/storage/Storage;->addImageForGroupOrPanorama(Landroid/content/Context;Ljava/lang/String;IJLandroid/location/Location;II)Landroid/net/Uri;

    move-result-object p2

    .line 1554
    if-nez p2, :cond_1

    .line 1559
    sget-object p2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "insert MediaProvider failed, attempt to find uri by path, "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1560
    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2, p1}, Lcom/android/camera/storage/MediaProviderUtil;->getContentUriFromPath(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 1562
    :cond_1
    sget-object p3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addImageAsApplication uri = "

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", path = "

    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1564
    invoke-virtual {p0, v1, v2}, Lcom/android/camera/module/Panorama3Module;->trackGeneralInfo(IZ)V

    .line 1565
    invoke-virtual {p0, v1, v2, v0}, Lcom/android/camera/module/Panorama3Module;->trackPictureTaken(IZZ)V

    .line 1566
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    .line 1567
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isCreated()Z

    move-result p3

    if-eqz p3, :cond_2

    if-eqz p1, :cond_2

    .line 1568
    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p3

    invoke-virtual {p3}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1570
    if-eqz p2, :cond_2

    .line 1571
    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->addSecureUri(Landroid/net/Uri;)V

    .line 1572
    invoke-virtual {p1}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-static {p3, p2, v2}, Lcom/android/camera/Thumbnail;->createThumbnailFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Lcom/android/camera/Thumbnail;

    move-result-object p3

    .line 1574
    invoke-static {p1, p2}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 1575
    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1, p3, v2, v2}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 1578
    :cond_2
    return-void
.end method

.method private calibrateRotation(I)I
    .locals 1

    .line 1540
    if-eqz p1, :cond_0

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_0

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x10e

    if-eq p1, v0, :cond_0

    .line 1543
    const/4 p1, 0x0

    .line 1545
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceOrientationAtCapture:I

    add-int/2addr p1, v0

    rem-int/lit16 p1, p1, 0x168

    return p1
.end method

.method private configMorphoPanoramaGP3()Z
    .locals 13

    .line 1178
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "configMorphoPanoramaGP3 start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1180
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setAttachEnabled(Z)V

    .line 1181
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->disableSaveInputImages()V

    .line 1184
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v2}, Lcom/android/camera/panorama/PanoramaSetting;->getShrink_ratio()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setShrinkRatio(D)I

    move-result v0

    .line 1185
    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 1186
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setShrinkRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1189
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getCalcseam_pixnum()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setCalcseamPixnum(I)I

    move-result v0

    .line 1190
    if-eqz v0, :cond_1

    .line 1191
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setCalcseamPixnum error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1194
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->isUse_deform()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setUseDeform(Z)I

    move-result v0

    .line 1195
    if-eqz v0, :cond_2

    .line 1196
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setUseDeform error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1199
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->isUse_luminance_correction()Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setUseLuminanceCorrection(Z)I

    move-result v0

    .line 1200
    if-eqz v0, :cond_3

    .line 1201
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setUseLuminanceCorrection error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1204
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getSeamsearch_ratio()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setSeamsearchRatio(D)I

    move-result v0

    .line 1205
    if-eqz v0, :cond_4

    .line 1206
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setSeamsearchRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1209
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getZrotation_coeff()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setZrotationCoeff(D)I

    move-result v0

    .line 1210
    if-eqz v0, :cond_5

    .line 1211
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setZrotationCoeff error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1214
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getDraw_threshold()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setDrawThreshold(D)I

    move-result v0

    .line 1215
    if-eqz v0, :cond_6

    .line 1216
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setDrawThreshold error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1219
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getAov_gain()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setAovGain(D)I

    move-result v0

    .line 1220
    if-eqz v0, :cond_7

    .line 1221
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setAovGain error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1224
    :cond_7
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k1()D

    move-result-wide v5

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    .line 1225
    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k2()D

    move-result-wide v7

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k3()D

    move-result-wide v9

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    .line 1226
    invoke-virtual {v0}, Lcom/android/camera/panorama/PanoramaSetting;->getDistortion_k4()D

    move-result-wide v11

    .line 1224
    invoke-virtual/range {v4 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setDistortionCorrectionParam(DDDD)I

    move-result v0

    .line 1228
    if-eqz v0, :cond_8

    .line 1229
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setDistortionCorrectionParam error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1232
    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    invoke-virtual {v3}, Lcom/android/camera/panorama/PanoramaSetting;->getRotation_ratio()D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setRotationRatio(D)I

    move-result v0

    .line 1233
    if-eqz v0, :cond_9

    .line 1234
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setRotationRatio error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1237
    :cond_9
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setSensorUseMode(I)I

    move-result v0

    .line 1238
    if-eqz v0, :cond_a

    .line 1239
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setSensorUseMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1242
    :cond_a
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setProjectionMode(I)I

    move-result v0

    .line 1243
    if-eqz v0, :cond_b

    .line 1244
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setProjectionMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1247
    :cond_b
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setMotionDetectionMode(I)I

    move-result v0

    .line 1248
    if-eqz v0, :cond_c

    .line 1249
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "setMotionDetectionMode error ret:0x%08X"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1252
    :cond_c
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "configMorphoPanoramaGP3 end"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1254
    return v1
.end method

.method public static createDateStringForAppSeg(J)Ljava/lang/String;
    .locals 1

    .line 2364
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 2365
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string p1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {p0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 2366
    const-string p1, "GMT"

    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 2367
    invoke-virtual {p0, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private createEngine()Z
    .locals 7

    .line 1113
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1114
    return v1

    .line 1117
    :cond_0
    new-instance v0, Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-direct {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    .line 1118
    const-string v0, "YUV420_PLANAR"

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1119
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_format:Ljava/lang/String;

    .line 1120
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    const-string v2, "YUV420_SEMIPLANAR"

    iput-object v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_format:Ljava/lang/String;

    goto :goto_0

    .line 1122
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_format:Ljava/lang/String;

    .line 1123
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mImageFormat:Ljava/lang/String;

    iput-object v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_format:Ljava/lang/String;

    .line 1126
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    iput v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_width:I

    .line 1127
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    iput v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->input_height:I

    .line 1129
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->aovx:D

    .line 1130
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    float-to-double v2, v2

    iput-wide v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->aovy:D

    .line 1132
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getPanoramaMoveDirection()I

    move-result v2

    iput v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    .line 1133
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v0

    .line 1134
    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mOrientation:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_2

    .line 1135
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    add-int/2addr v3, v0

    add-int/lit16 v3, v3, 0x168

    rem-int/lit16 v3, v3, 0x168

    iput v3, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    goto :goto_1

    .line 1137
    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    add-int/2addr v3, v0

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mOrientation:I

    add-int/2addr v3, v0

    add-int/lit16 v3, v3, 0x168

    rem-int/lit16 v3, v3, 0x168

    iput v3, v2, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    .line 1140
    :goto_1
    const/16 v0, 0xa6

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object v0

    .line 1141
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "zoomMode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1142
    const-string v2, "wide"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1143
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    int-to-double v2, v2

    iput-wide v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    goto :goto_2

    .line 1145
    :cond_3
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v2, "cepheus"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1146
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    const-wide v2, 0x406305c28f5c28f6L    # 152.18

    iput-wide v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    goto :goto_2

    .line 1148
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    int-to-double v2, v2

    const-wide v4, 0x3fe40c49ba5e353fL    # 0.6265

    mul-double/2addr v2, v4

    iput-wide v2, v0, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->goal_angle:D

    .line 1153
    :goto_2
    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    const/16 v2, 0x5a

    const/4 v3, 0x1

    if-eq v0, v2, :cond_7

    const/16 v2, 0xb4

    if-eq v0, v2, :cond_6

    const/16 v2, 0x10e

    if-eq v0, v2, :cond_5

    .line 1155
    nop

    .line 1156
    nop

    .line 1167
    move v0, v1

    goto :goto_3

    .line 1164
    :cond_5
    const/4 v0, 0x3

    goto :goto_3

    .line 1161
    :cond_6
    const/4 v0, 0x2

    .line 1162
    goto :goto_3

    .line 1158
    :cond_7
    nop

    .line 1159
    nop

    .line 1167
    move v0, v3

    :goto_3
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v2, v0}, Lcom/android/camera/panorama/SensorFusion;->setRotation(I)I

    move-result v0

    .line 1168
    if-eqz v0, :cond_8

    .line 1169
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "SensorFusion.setRotation error ret:0x%08X"

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v1

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1172
    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Panorama3Module;->initializeEngine(Lcom/android/camera/panorama/MorphoPanoramaGP3;Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)Z

    .line 1174
    return v3
.end method

.method private createNameString(J)Ljava/lang/String;
    .locals 1

    .line 1586
    const v0, 0x7f0b00c5

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object p1

    .line 1587
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1588
    return-object p1
.end method

.method private finishEngine()V
    .locals 6

    .line 1497
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-nez v0, :cond_0

    .line 1498
    return-void

    .line 1500
    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "finishEngine start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1501
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v0}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->deleteNativeOutputInfo()I

    .line 1502
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->finish(Z)I

    move-result v0

    .line 1503
    if-eqz v0, :cond_1

    .line 1504
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "finish error ret:0x%08X"

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v5

    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1506
    :cond_1
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "finishEngine end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1507
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    .line 1508
    return-void
.end method

.method private initAttachQueue()V
    .locals 2

    .line 219
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 220
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAttachImageQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/panorama/CaptureImage;

    .line 221
    if-eqz v0, :cond_0

    .line 222
    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 224
    :cond_0
    goto :goto_0

    .line 226
    :cond_1
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "initAttachQueue"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    return-void
.end method

.method private initPreviewLayout()V
    .locals 5

    .line 568
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 569
    return-void

    .line 571
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/CameraScreenNail;->setPreviewSize(II)V

    .line 572
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    .line 573
    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getWidth()I

    move-result v1

    .line 574
    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getHeight()I

    move-result v0

    .line 575
    int-to-float v0, v0

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    .line 576
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f09000b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 577
    mul-int/2addr v1, v2

    div-int/2addr v1, v0

    .line 580
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v3, 0xb0

    .line 581
    invoke-virtual {v0, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 582
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->initPreviewLayout(IIII)V

    .line 583
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->isAnimationRunning()Z

    move-result v1

    if-nez v1, :cond_1

    .line 584
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->showSmallPreview(Z)V

    .line 586
    :cond_1
    return-void
.end method

.method private initializeEngine(Lcom/android/camera/panorama/MorphoPanoramaGP3;Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)Z
    .locals 7

    .line 1095
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "initializeEngine start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1098
    invoke-virtual {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->createNativeOutputInfo()I

    move-result v0

    .line 1099
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 1100
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "createNativeOutputInfo error ret:0x%08X"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v6, v1

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->initialize(Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;)I

    move-result p1

    .line 1103
    if-eqz p1, :cond_1

    .line 1104
    sget-object p2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "initialize error ret:0x%08X"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-static {v0, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1105
    return v1

    .line 1107
    :cond_1
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string p2, "initializeEngine end"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1109
    return v2
.end method

.method private isProcessingFinishTask()Z
    .locals 2

    .line 1317
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    .line 1318
    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 1319
    const/4 v0, 0x1

    return v0

    .line 1321
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private isShootingTooShort()Z
    .locals 4

    .line 715
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaShootingStartTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x258

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isZslMode()Z
    .locals 1

    .line 1609
    const/4 v0, 0x1

    return v0
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    .line 992
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 994
    return-void
.end method

.method private onCaptureOrientationDecided()V
    .locals 4

    .line 1592
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "onCaptureOrientationDecided"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1594
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1595
    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1596
    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetX:I

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mAttachPosOffsetY:I

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onCaptureOrientationDecided(III)V

    .line 1597
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    .line 1598
    return-void
.end method

.method private onPreviewMoving()V
    .locals 2

    .line 1602
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1603
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->onPreviewMoving()V

    .line 1604
    return-void
.end method

.method private onStopShooting(Z)V
    .locals 2

    .line 1296
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1297
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1298
    if-eqz p1, :cond_0

    .line 1299
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFinish()V

    goto :goto_0

    .line 1301
    :cond_0
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 1303
    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v0, 0x35

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1304
    return-void
.end method

.method private registerGravitySensorListener()V
    .locals 3

    .line 1638
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    if-eqz v0, :cond_0

    .line 1639
    return-void

    .line 1641
    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "registerGravitySensorListener"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1642
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    .line 1643
    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    .line 1644
    const/4 v1, 0x3

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    .line 1645
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v1, :cond_1

    .line 1646
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v1

    .line 1647
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 1648
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    .line 1649
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x2

    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 1652
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    .line 1653
    return-void
.end method

.method private requestStopShoot()V
    .locals 1

    .line 259
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->sAttachExit:Lcom/android/camera/panorama/CaptureImage;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Panorama3Module;->addAttachQueue(Lcom/android/camera/panorama/CaptureImage;)V

    .line 260
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    .line 261
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    .line 987
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 988
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 989
    return-void
.end method

.method private resetToPreview()V
    .locals 2

    .line 807
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 808
    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 809
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 810
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->resetUI()V

    .line 812
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez v0, :cond_1

    .line 813
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startPreview()V

    .line 815
    :cond_1
    return-void
.end method

.method private resetUI()V
    .locals 2

    .line 782
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 783
    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 784
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->resetShootUI()V

    .line 787
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 788
    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 789
    if-eqz v0, :cond_0

    .line 790
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->showZoomButton()V

    .line 792
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Panorama3Module;->showSmallPreview(Z)V

    .line 793
    return-void
.end method

.method private savePanoramaFile(Ljava/lang/String;II)Z
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    .line 1511
    new-instance v13, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;

    invoke-direct {v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;-><init>()V

    .line 1512
    nop

    .line 1514
    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    const/4 v14, 0x1

    if-eqz v1, :cond_3

    .line 1516
    const/4 v1, -0x1

    :try_start_0
    invoke-static {v3, v14}, Lcom/android/camera/FileCompat;->getParcelFileDescriptor(Ljava/lang/String;Z)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 1515
    const/4 v15, 0x0

    .line 1519
    :try_start_1
    iget-object v4, v0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v7

    iget-object v8, v0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    iget-object v9, v0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v12, 0x0

    move/from16 v5, p2

    move/from16 v6, p3

    move-object v11, v13

    invoke-virtual/range {v4 .. v12}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->savePanorama360(IILjava/io/FileDescriptor;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v4
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1521
    if-eqz v2, :cond_2

    :try_start_2
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v4, v0

    goto :goto_0

    .line 1515
    :catch_1
    move-exception v0

    move-object v15, v0

    :try_start_3
    throw v15
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1521
    :goto_0
    if-eqz v2, :cond_1

    if-eqz v15, :cond_0

    :try_start_4
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    :catch_2
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v15, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_1
    :goto_1
    throw v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    move-exception v0

    move v4, v1

    .line 1523
    :goto_2
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "open file failed, filePath "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1524
    :cond_2
    :goto_3
    goto :goto_4

    .line 1526
    :cond_3
    iget-object v1, v0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    iget-object v4, v0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    iget-object v5, v0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v0, v1

    move/from16 v1, p2

    move/from16 v2, p3

    move-object v7, v13

    invoke-virtual/range {v0 .. v8}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->savePanorama360(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;Z)I

    move-result v4

    .line 1530
    :goto_4
    if-nez v4, :cond_4

    .line 1531
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    invoke-virtual {v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3$GalleryInfoData;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1532
    return v14

    .line 1534
    :cond_4
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "savePanorama360() -> 0x%x"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1535
    return v4
.end method

.method private setInitialRotationByGravity()V
    .locals 14

    .line 1669
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    if-lez v0, :cond_0

    .line 1671
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    .line 1672
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget v4, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v4, v4

    div-float/2addr v2, v4

    .line 1673
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    const/4 v5, 0x2

    aget v4, v4, v5

    iget v6, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    int-to-float v6, v6

    div-float/2addr v4, v6

    .line 1674
    sget-object v6, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "Gravity Sensor Value X=%f Y=%f Z=%f cnt=%d"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v3

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v5

    const/4 v5, 0x3

    iget v10, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v5

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1675
    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    float-to-double v8, v0

    float-to-double v10, v2

    float-to-double v12, v4

    invoke-virtual/range {v7 .. v13}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setInitialRotationByGravity(DDD)I

    move-result v0

    .line 1676
    if-eqz v0, :cond_0

    .line 1677
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "MorphoPanoramaGP3.setInitialRotationByGravity error ret:0x%08X"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-static {v4, v5, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1680
    :cond_0
    return-void
.end method

.method private setSensorFusionValue(Lcom/android/camera/panorama/CaptureImage;)V
    .locals 9

    .line 1683
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    if-eqz v0, :cond_5

    .line 1684
    const/4 v0, 0x4

    new-array v1, v0, [I

    .line 1685
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, v3, v1}, Lcom/android/camera/panorama/SensorFusion;->getSensorMatrix([D[D[D[I)I

    move-result v2

    .line 1686
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    .line 1687
    sget-object v5, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "SensorFusion.getSensorMatrix error ret:0x%08X"

    new-array v8, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v3

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1689
    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v2}, Lcom/android/camera/panorama/SensorFusion;->getStockData()Ljava/util/ArrayList;

    move-result-object v2

    .line 1691
    new-instance v5, Lcom/android/camera/panorama/SensorInfoManager;

    invoke-direct {v5, v0}, Lcom/android/camera/panorama/SensorInfoManager;-><init>(I)V

    .line 1692
    aget v0, v1, v3

    iput v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    .line 1693
    const/4 v0, 0x3

    aget v6, v1, v0

    iput v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    .line 1694
    aget v1, v1, v4

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    .line 1695
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getAttachCount()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->img_ix:J

    .line 1696
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->timeMillis:J

    .line 1697
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getTimestamp()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->imageTimeStamp:J

    .line 1698
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getSensitivity()I

    move-result v1

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensitivity:I

    .line 1699
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getExposureTime()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->exposureTime:J

    .line 1700
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getRollingShutterSkew()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->rollingShutterSkew:J

    .line 1701
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->getSensorTimeStamp()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorTimeStamp:J

    .line 1702
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    .line 1703
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v3

    .line 1704
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    .line 1705
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v0

    .line 1706
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    .line 1707
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    aput-object v1, p1, v4

    .line 1708
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v3

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1709
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 1710
    if-lez p1, :cond_1

    .line 1711
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    .line 1712
    iget v1, p1, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->g_ix:I

    .line 1713
    iget-object v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v3

    aput-object p1, v1, v3

    .line 1716
    :cond_1
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1717
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 1718
    if-lez p1, :cond_2

    .line 1719
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    .line 1720
    iget v1, p1, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    iput v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->r_ix:I

    .line 1721
    iget-object v1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v0

    aput-object p1, v1, v0

    .line 1725
    :cond_2
    iget-object p1, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v4

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 1726
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 1727
    if-lez p1, :cond_3

    .line 1728
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    sub-int/2addr p1, v4

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/panorama/SensorInfoManager;

    .line 1729
    iget v0, p1, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    iput v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->a_ix:I

    .line 1730
    iget-object v0, v5, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/android/camera/panorama/SensorInfoManager;->sensorData:[Ljava/util/ArrayList;

    aget-object p1, p1, v4

    aput-object p1, v0, v4

    .line 1734
    :cond_3
    iput-object v5, p0, Lcom/android/camera/module/Panorama3Module;->mCurrentSensorInfoManager:Lcom/android/camera/panorama/SensorInfoManager;

    .line 1735
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1737
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->getAttachCount()J

    move-result-wide v0

    .line 1738
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 1739
    if-lez p1, :cond_4

    const-wide/16 v5, 0x0

    cmp-long v0, v0, v5

    if-lez v0, :cond_4

    .line 1740
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    new-array p1, p1, [Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    .line 1741
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;

    .line 1740
    invoke-virtual {v0, p1}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->setGyroscopeData([Lcom/android/camera/panorama/MorphoSensorFusion$SensorData;)I

    move-result p1

    .line 1743
    if-eqz p1, :cond_4

    .line 1744
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "setGyroscopeData error ret:0x%08X"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v3

    invoke-static {v1, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1747
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1}, Lcom/android/camera/panorama/SensorFusion;->clearStockData()V

    .line 1749
    :cond_5
    return-void
.end method

.method private setShootUI()V
    .locals 2

    .line 1082
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1083
    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1084
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->setShootUI()V

    .line 1086
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1087
    const/16 v1, 0xb6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$DualController;

    .line 1088
    if-eqz v0, :cond_0

    .line 1089
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$DualController;->hideZoomButton()V

    .line 1091
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    .line 1092
    return-void
.end method

.method private setupCaptureParams()V
    .locals 5

    .line 484
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 485
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "camera device is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    return-void

    .line 489
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 490
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setZoomRatio(F)V

    .line 491
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFlashMode(I)V

    .line 493
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v0

    .line 494
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAntiBanding(I)V

    .line 495
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "antiBanding="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 498
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    .line 499
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 500
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 501
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceWaterMarkEnable(Z)V

    .line 502
    return-void
.end method

.method private showSmallPreview(Z)V
    .locals 2

    .line 796
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMorphoPanoramaGP3:Lcom/android/camera/panorama/MorphoPanoramaGP3;

    if-eqz v0, :cond_0

    .line 797
    return-void

    .line 800
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    .line 801
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 802
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->showSmallPreview(Z)V

    .line 803
    return-void
.end method

.method private stopPanoramaShooting(Z)V
    .locals 1

    .line 1258
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    .line 1259
    return-void
.end method

.method private stopPanoramaShooting(ZZ)V
    .locals 3

    .line 1262
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez v0, :cond_0

    .line 1263
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string p2, "stopPanoramaShooting while not shooting"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1264
    return-void

    .line 1267
    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopPanoramaShooting: saveImage="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isRelease="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1270
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->requestStopShoot()V

    .line 1272
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    .line 1273
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    invoke-virtual {v0}, Lcom/android/camera/panorama/RoundDetector;->stop()V

    .line 1275
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1276
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_2

    .line 1277
    if-nez p2, :cond_1

    .line 1278
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->captureAbortBurst()V

    .line 1280
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, p2}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 1282
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1284
    const/4 p2, 0x0

    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    if-eqz p1, :cond_3

    const/4 p1, 0x1

    goto :goto_0

    .line 1286
    :cond_3
    move p1, p2

    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/android/camera/module/Panorama3Module;->createDateStringForAppSeg(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    .line 1288
    new-instance v0, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;-><init>(Lcom/android/camera/module/Panorama3Module;Z)V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    .line 1289
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSaveOutputImageTask:Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {v0, p2}, Lcom/android/camera/module/Panorama3Module$SaveOutputImageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1291
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onStopShooting(Z)V

    .line 1292
    return-void

    .line 1282
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private unregisterGravitySensorListener()V
    .locals 2

    .line 1656
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    if-nez v0, :cond_0

    .line 1657
    return-void

    .line 1660
    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "unregisterGravitySensorListener"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1661
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_1

    .line 1662
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 1665
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsRegisterGravitySensor:Z

    .line 1666
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 6

    .line 542
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 543
    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v0

    .line 544
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 546
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v2, Landroid/graphics/SurfaceTexture;

    .line 547
    invoke-virtual {v1, v2}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    .line 548
    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mModuleIndex:I

    iget v3, p0, Lcom/android/camera/module/Panorama3Module;->mBogusCameraId:I

    iget v4, v0, Lcom/android/camera/CameraSize;->width:I

    iget v5, v0, Lcom/android/camera/CameraSize;->height:I

    .line 549
    invoke-static {v4, v5}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v4

    float-to-double v4, v4

    .line 548
    invoke-static {v2, v3, v1, v4, v5}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v1

    .line 551
    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 552
    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 553
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    iput v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    .line 554
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    iput v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    .line 555
    sget-object v2, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pictureSize= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "X"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " previewSize="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "X"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/Panorama3Module;->updateCameraScreenNailSize(II)V

    .line 559
    return-void
.end method


# virtual methods
.method public closeCamera()V
    .locals 4

    .line 470
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "closeCamera: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 473
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    .line 474
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_0

    .line 475
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 476
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 477
    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 479
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 480
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "closeCamera: end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    return-void

    .line 479
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public varargs consumePreference([I)V
    .locals 6
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .line 511
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    aget v2, p1, v1

    .line 512
    const/4 v3, 0x1

    if-eq v2, v3, :cond_3

    const/16 v3, 0x18

    if-eq v2, v3, :cond_2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_1

    .line 526
    sget-boolean v3, Lcom/android/camera/module/Panorama3Module;->DEBUG:Z

    if-nez v3, :cond_0

    .line 529
    sget-object v3, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no consumer for this updateType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 527
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "no consumer for this updateType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 522
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->setupCaptureParams()V

    .line 523
    goto :goto_1

    .line 518
    :cond_2
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Panorama3Module;->setZoomRatio(F)V

    .line 519
    goto :goto_1

    .line 514
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->updatePictureAndPreviewSize()V

    .line 515
    nop

    .line 511
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 534
    :cond_4
    return-void
.end method

.method protected getBestPanoPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;)",
            "Lcom/android/camera/CameraSize;"
        }
    .end annotation

    .line 562
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;I)V

    .line 563
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPanoPictureSize()Lcom/android/camera/CameraSize;

    move-result-object p1

    return-object p1
.end method

.method protected getOperatingMode()I
    .locals 1

    .line 2376
    const v0, 0x8008

    return v0
.end method

.method public isDoingAction()Z
    .locals 1

    .line 730
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    return v0
.end method

.method public isPanoramaDoing()Z
    .locals 1

    .line 313
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 1

    .line 735
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    .line 736
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_0

    .line 737
    const-string v0, "shooting"

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    .line 739
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 1

    .line 538
    const/4 v0, 0x0

    return v0
.end method

.method protected keepScreenOn()V
    .locals 2

    .line 997
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 998
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 999
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 1000
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    .line 1635
    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    .line 750
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_1

    .line 751
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 752
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    .line 753
    invoke-direct {p0, v1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    .line 755
    :cond_0
    return v1

    .line 758
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method protected onCameraOpened()V
    .locals 2

    .line 436
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 439
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->checkDisplayOrientation()V

    .line 440
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->updatePreferenceTrampoline([I)V

    .line 442
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startSession()V

    .line 443
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 444
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "SetupCameraThread done"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getViewAngle(Z)F

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleH:F

    .line 447
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getViewAngle(Z)F

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mViewAngleV:F

    .line 448
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSensorOrientation()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mCameraOrientation:I

    .line 449
    return-void
.end method

.method public onCreate(II)V
    .locals 5

    .line 385
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 386
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    sget p2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 387
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->onCameraOpened()V

    .line 389
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fz()I

    move-result p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mGoalAngle:I

    .line 390
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fA()F

    move-result p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mLongSideCropRatio:F

    .line 392
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f09000b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mSmallPreviewHeight:I

    .line 394
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object p1

    const-string p2, "sensor"

    invoke-virtual {p1, p2}, Lcom/android/camera/Camera;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    .line 395
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object p1

    .line 396
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/hardware/Sensor;

    .line 397
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 398
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    .line 400
    :cond_0
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1

    .line 401
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    .line 403
    :cond_1
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    if-ne v1, v0, :cond_2

    .line 404
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    .line 406
    :cond_2
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 407
    iput-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mMagnetic:Landroid/hardware/Sensor;

    .line 409
    :cond_3
    invoke-virtual {p2}, Landroid/hardware/Sensor;->getType()I

    move-result p2

    const/16 v0, 0xf

    if-ne p2, v0, :cond_4

    .line 410
    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {p2, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    .line 412
    :cond_4
    goto :goto_0

    .line 414
    :cond_5
    new-instance p1, Lcom/android/camera/panorama/RoundDetector;

    invoke-direct {p1}, Lcom/android/camera/panorama/RoundDetector;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    .line 415
    new-instance p1, Lcom/android/camera/panorama/PanoramaSetting;

    iget-object p2, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/android/camera/panorama/PanoramaSetting;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaSetting:Lcom/android/camera/panorama/PanoramaSetting;

    .line 417
    new-instance p1, Lcom/android/camera/panorama/SensorFusion;

    invoke-direct {p1, v0}, Lcom/android/camera/panorama/SensorFusion;-><init>(Z)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    .line 418
    iput v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusionMode:I

    .line 419
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget p2, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusionMode:I

    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/SensorFusion;->setMode(I)I

    move-result p1

    .line 420
    const/4 p2, 0x0

    if-eqz p1, :cond_6

    .line 421
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setMode error ret:0x%08X"

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, p2

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    :cond_6
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1, p2}, Lcom/android/camera/panorama/SensorFusion;->setOffsetMode(I)I

    move-result p1

    .line 424
    if-eqz p1, :cond_7

    .line 425
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setOffsetMode error ret:0x%08X"

    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, p2

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {p1, v0}, Lcom/android/camera/panorama/SensorFusion;->setAppState(I)I

    move-result p1

    .line 428
    if-eqz p1, :cond_8

    .line 429
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "SensorFusion.setAppState error ret:0x%08X"

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p2

    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorInfoManagerList:Ljava/util/ArrayList;

    .line 432
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 916
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 917
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 918
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 599
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 600
    return v1

    .line 602
    :cond_0
    const/16 v0, 0x1b

    if-eq p1, v0, :cond_4

    const/16 v0, 0x42

    if-eq p1, v0, :cond_4

    const/16 v0, 0x2bc

    if-eq p1, v0, :cond_3

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto :goto_3

    .line 626
    :pswitch_0
    const/16 v0, 0x18

    if-eq p1, v0, :cond_2

    const/16 v0, 0x58

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v1

    .line 629
    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    .line 626
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/module/Panorama3Module;->handleVolumeKeyEvent(ZZI)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 630
    return v1

    .line 617
    :pswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_7

    .line 618
    const/16 p1, 0x32

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    .line 619
    return v1

    .line 634
    :cond_3
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-eqz v0, :cond_7

    .line 635
    invoke-direct {p0, v1}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(Z)V

    goto :goto_3

    .line 605
    :cond_4
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_7

    .line 606
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 607
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 608
    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    goto :goto_2

    .line 611
    :cond_5
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    .line 613
    :cond_6
    :goto_2
    return v1

    .line 639
    :cond_7
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x57
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 644
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 645
    return v1

    .line 647
    :cond_0
    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x42

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 650
    :cond_1
    return v1

    .line 654
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xab

    .line 655
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 656
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 657
    return v1

    .line 660
    :cond_3
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onPause()V
    .locals 3

    .line 857
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 859
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->unregisterGravitySensorListener()V

    .line 861
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 862
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 863
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 864
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 865
    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    .line 869
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 872
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 873
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/Panorama3Module$1;

    invoke-direct {v2, p0, v0}, Lcom/android/camera/module/Panorama3Module$1;-><init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 904
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->closeCamera()V

    .line 906
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->resetScreenOn()V

    .line 907
    return-void
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 282
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 309
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 303
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 304
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0

    .line 291
    if-nez p1, :cond_0

    .line 292
    return-void

    .line 294
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    .line 295
    return-void

    .line 297
    :cond_1
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    .line 298
    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->PANORAMA_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->updatePreferenceInWorkThread([I)V

    .line 299
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 0

    .line 287
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 819
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 820
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    .line 821
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->registerGravitySensorListener()V

    .line 823
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "SensorThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    .line 824
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 825
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 827
    new-instance v1, Lcom/android/camera/panorama/GyroscopeRoundDetector;

    invoke-direct {v1}, Lcom/android/camera/panorama/GyroscopeRoundDetector;-><init>()V

    iput-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRoundDetector:Lcom/android/camera/panorama/RoundDetector;

    .line 828
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 829
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscope:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 831
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    if-eqz v1, :cond_1

    .line 832
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mGyroscopeUncalibrated:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 834
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    if-eqz v1, :cond_2

    .line 835
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mRotationVector:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 837
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    if-eqz v1, :cond_3

    .line 838
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorFusion:Lcom/android/camera/panorama/SensorFusion;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mAccelerometer:Landroid/hardware/Sensor;

    invoke-virtual {v1, v3, v4, v2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 840
    :cond_3
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 0

    .line 778
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 0

    .line 773
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 1619
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsSensorAverage:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 1620
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v4, v0, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    add-float/2addr v4, v5

    aput v4, v0, v2

    .line 1621
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v2, v0, v3

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v3

    add-float/2addr v2, v4

    aput v2, v0, v3

    .line 1622
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    aget v2, v0, v1

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    .line 1623
    iget p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    goto :goto_0

    .line 1625
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v4, v4, v2

    aput v4, v0, v2

    .line 1626
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v2, v2, v3

    aput v2, v0, v3

    .line 1627
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mGravities:[F

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget p1, p1, v1

    aput p1, v0, v1

    .line 1628
    iput v3, p0, Lcom/android/camera/module/Panorama3Module;->mSensorCnt:I

    .line 1630
    :goto_0
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 2

    .line 667
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_7

    .line 668
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 672
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 673
    return-void

    .line 676
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 677
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "onShutterButtonClick return, isDoingAction"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    return-void

    .line 681
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 682
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 683
    if-eqz v0, :cond_3

    .line 684
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()Z

    .line 687
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->setTriggerMode(I)V

    .line 689
    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez p1, :cond_5

    .line 690
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 691
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 693
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa2

    .line 694
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 695
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingFailed()V

    .line 696
    return-void

    .line 699
    :cond_4
    new-instance p1, Lcom/android/camera/module/Panorama3Module$PanoramaInit;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/module/Panorama3Module$PanoramaInit;-><init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/module/Panorama3Module$1;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaState:Lcom/android/camera/panorama/PanoramaState;

    .line 700
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->initAttachQueue()V

    .line 702
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    .line 703
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->startPanoramaShooting()V

    goto :goto_0

    .line 705
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isShootingTooShort()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 706
    sget-object p1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v0, "panorama shooting is too short, ignore this click"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    return-void

    .line 709
    :cond_6
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->playCameraSound(I)V

    .line 710
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->stopPanoramaShooting(ZZ)V

    .line 712
    :goto_0
    return-void

    .line 669
    :cond_7
    :goto_1
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 745
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 1

    .line 720
    const/4 v0, 0x0

    return v0
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 1

    .line 725
    const/4 p1, 0x0

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonFocus(ZI)V

    .line 726
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 911
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 912
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0
    .annotation runtime Lcom/android/camera/OnClickAttr;
    .end annotation

    .line 763
    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module;->mPaused:Z

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    .line 764
    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 767
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 768
    return-void

    .line 765
    :cond_1
    :goto_0
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    .line 980
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onUserInteraction()V

    .line 981
    iget-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    if-nez v0, :cond_0

    .line 982
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOnAwhile()V

    .line 984
    :cond_0
    return-void
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 453
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 454
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 455
    const-string v1, "from_where"

    const/16 v2, 0xa6

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 457
    const-string v1, ":miui:starting_window_label"

    .line 458
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0044

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 457
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 459
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 460
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 462
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 463
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 465
    iget v0, p0, Lcom/android/camera/module/Panorama3Module;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 466
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .line 966
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 967
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 968
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    .line 969
    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 0

    .line 590
    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    .line 591
    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Panorama3Module;->onShutterButtonClick(I)V

    .line 593
    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 3

    .line 265
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 266
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 267
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 270
    return-void

    :array_0
    .array-data 4
        0xae
        0xa4
    .end array-data
.end method

.method public requestRender()V
    .locals 2

    .line 1309
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 1310
    const/16 v1, 0xb0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;

    .line 1311
    if-eqz v0, :cond_0

    .line 1312
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$PanoramaProtocol;->requestRender()V

    .line 1314
    :cond_0
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .line 973
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 974
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 975
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    .line 976
    return-void
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .line 1614
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1615
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1

    .line 844
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 846
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 848
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 849
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 851
    :cond_0
    return-void
.end method

.method public setNullDirectionFunction()V
    .locals 8

    .line 2371
    new-instance v7, Lcom/android/camera/panorama/DirectionFunction;

    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureWidth:I

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mPictureHeight:I

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/android/camera/panorama/DirectionFunction;-><init>(IIIIII)V

    iput-object v7, p0, Lcom/android/camera/module/Panorama3Module;->mDirectionFunction:Lcom/android/camera/panorama/DirectionFunction;

    .line 2372
    return-void
.end method

.method public startPanoramaShooting()V
    .locals 5

    .line 1003
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->isProcessingFinishTask()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1004
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "previous save task is on going"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1005
    return-void

    .line 1008
    :cond_0
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "startPanoramaShooting"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1011
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCaptureOrientationDecided:Z

    .line 1012
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mInitParam:Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->direction:I

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mDirection:I

    .line 1013
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/module/Panorama3Module;->mTimeTaken:J

    .line 1014
    iget v1, p0, Lcom/android/camera/module/Panorama3Module;->mOrientationCompensation:I

    iput v1, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceOrientationAtCapture:I

    .line 1015
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mIsShooting:Z

    .line 1016
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mCanSavePanorama:Z

    .line 1017
    iput-boolean v0, p0, Lcom/android/camera/module/Panorama3Module;->mRequestStop:Z

    .line 1019
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/module/Panorama3Module;->createDateStringForAppSeg(J)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mShutterStartTime:Ljava/lang/String;

    .line 1020
    const-string v2, ""

    iput-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mShutterEndTime:Ljava/lang/String;

    .line 1022
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1024
    :try_start_0
    iget-boolean v3, p0, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    if-eqz v3, :cond_1

    .line 1025
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 1027
    :cond_1
    iget-boolean v3, p0, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz v3, :cond_2

    .line 1028
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 1030
    :cond_2
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    .line 1031
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mLocation:Landroid/location/Location;

    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 1032
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v4, p0, Lcom/android/camera/module/Panorama3Module;->mSnapshotFocusMode:I

    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 1035
    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->getJpegQuality(Z)I

    move-result v3

    .line 1036
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v3}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 1037
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getJpegThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 1038
    iget-object v4, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v3}, Lcom/android/camera2/Camera2Proxy;->setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V

    .line 1039
    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 1040
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setNeedPausePreview(Z)V

    .line 1042
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x64

    new-instance v3, Lcom/android/camera/module/Panorama3Module$2;

    invoke-direct {v3, p0}, Lcom/android/camera/module/Panorama3Module$2;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v3, v4}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 1066
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1069
    invoke-direct {p0}, Lcom/android/camera/module/Panorama3Module;->setShootUI()V

    .line 1071
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    .line 1072
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 1073
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->processingStart()V

    .line 1075
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mPanoramaShootingStartTime:J

    .line 1076
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->keepScreenOn()V

    .line 1077
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    .line 1078
    return-void

    .line 1066
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public startPreview()V
    .locals 3

    .line 943
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mDeviceLock:Ljava/lang/Object;

    monitor-enter v0

    .line 944
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v1, :cond_0

    .line 945
    sget-object v1, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v2, "startPreview: camera has been closed"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 946
    monitor-exit v0

    return-void

    .line 949
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->checkDisplayOrientation()V

    .line 950
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mCameraDisplayOrientation:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setDisplayOrientation(I)V

    .line 952
    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mAeLockSupported:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 953
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAELock(Z)V

    .line 955
    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/module/Panorama3Module;->mAwbLockSupported:Z

    if-eqz v1, :cond_2

    .line 956
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setAWBLock(Z)V

    .line 958
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/Panorama3Module;->mTargetFocusMode:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 959
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 960
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Panorama3Module;->setCameraState(I)V

    .line 961
    monitor-exit v0

    .line 962
    return-void

    .line 961
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public startSession()V
    .locals 8

    .line 921
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 922
    sget-object v0, Lcom/android/camera/module/Panorama3Module;->TAG:Ljava/lang/String;

    const-string v1, "startPreview: camera has been closed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 923
    return-void

    .line 926
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 927
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 928
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 929
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 930
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureMaxImages(I)V

    .line 931
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureFormat(I)V

    .line 932
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Panorama3Module;->mSurfaceCreatedTimestamp:J

    .line 933
    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v3, Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    .line 934
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 937
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getOperatingMode()I

    move-result v6

    .line 933
    move-object v7, p0

    invoke-virtual/range {v2 .. v7}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 939
    return-void
.end method

.method protected trackModeCustomInfo(I)V
    .locals 0

    .line 1582
    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInPanorama(I)V

    .line 1583
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 274
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 275
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 276
    invoke-virtual {p0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 277
    return-void
.end method
