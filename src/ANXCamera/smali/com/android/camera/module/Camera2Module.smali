.class public Lcom/android/camera/module/Camera2Module;
.super Lcom/android/camera/module/BaseModule;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraAction;
.implements Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;
.implements Lcom/android/camera/protocol/ModeProtocol$FaceBeautyProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$FilterProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$TopConfigProtocol;
.implements Lcom/android/camera/ui/ObjectView$ObjectViewListener;
.implements Lcom/android/camera2/Camera2Proxy$BeautyBodySlimCountCallback;
.implements Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;
.implements Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
.implements Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.implements Lcom/android/camera2/Camera2Proxy$FocusCallback;
.implements Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;
.implements Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;
.implements Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Camera2Module$MainHandler;,
        Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;,
        Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;
    }
.end annotation


# static fields
.field private static final BURST_SHOOTING_DELAY:I = 0x0

.field private static final CAPTURE_DURATION_THRESHOLD:J = 0x1f40L

.field private static final REQUEST_CROP:I = 0x3e8

.field private static final TAG:Ljava/lang/String;

.field private static mIsBeautyFrontOn:Z = false

.field private static final sTempCropFilename:Ljava/lang/String; = "crop-temp"


# instance fields
.field private volatile isDetectedInHDR:Z

.field private volatile isResetFromMutex:Z

.field private isSilhouette:Z

.field private m3ALocked:Z

.field private mAFEndLogTimes:I

.field private mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

.field private mAiSceneEnabled:Z

.field private mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mAlgorithmName:Ljava/lang/String;

.field private mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

.field private mBroadcastIntent:Landroid/content/Intent;

.field private mBurstDisposable:Lio/reactivex/disposables/Disposable;

.field private mBurstEmitter:Lio/reactivex/ObservableEmitter;

.field private mBurstNextDelayTime:J

.field private mBurstStartTime:J

.field private mCaptureStartTime:J

.field private mCaptureWaterMarkStr:Ljava/lang/String;

.field private mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

.field private final mCircularMediaRecorderStateLock:Ljava/lang/Object;

.field private mCountdownDisposable:Lio/reactivex/disposables/Disposable;

.field private mCropValue:Ljava/lang/String;

.field private mCurrentAiScene:I

.field private mCurrentAsdScene:I

.field private mCurrentDetectedScene:I

.field private mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

.field private mEnableParallelSession:Z

.field private mEnabledPreviewThumbnail:Z

.field private mEnteringMoonMode:Z

.field private mFaceDetectionEnabled:Z

.field private mFaceDetectionStarted:Z

.field private mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

.field private mFunctionParseAiScene:Lcom/android/camera/module/loader/FunctionParseAiScene;

.field private mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

.field private mHasAiSceneFilterEffect:Z

.field private mHdrCheckEnabled:Z

.field private mIsBeautyBodySlimOn:Z

.field private mIsCurrentTaskIsParallel:Z

.field private mIsGenderAgeOn:Z

.field private mIsGradienterOn:Z

.field private mIsImageCaptureIntent:Z

.field private mIsLensServiceBound:Z

.field private mIsMagicMirrorOn:Z

.field private mIsMicrophoneEnabled:Z

.field private mIsMoonMode:Z

.field private mIsPortraitLightingOn:Z

.field private mIsSaveCaptureImage:Z

.field private mJpegRotation:I

.field private mKeepBitmapTexture:Z

.field private mLastCaptureTime:J

.field private mLastChangeSceneTime:J

.field private mLastFlashMode:Ljava/lang/String;

.field private mLensApi:Lcom/google/lens/sdk/LensApi;

.field private mLensStatus:I

.field private mLocation:Landroid/location/Location;

.field private mLongPressedAutoFocus:Z

.field private mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

.field private mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/FlowableEmitter<",
            "Landroid/hardware/camera2/CaptureResult;",
            ">;"
        }
    .end annotation
.end field

.field private mMultiSnapStatus:Z

.field private mMultiSnapStopRequest:Z

.field private mNeedAutoFocus:Z

.field private mOnResumeTime:J

.field private mOperatingMode:I

.field private mPendingMultiCapture:Z

.field private mQuickCapture:Z

.field private mReceivedJpegCallbackNum:I

.field private mSaveUri:Landroid/net/Uri;

.field private mSceneMode:Ljava/lang/String;

.field private mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

.field private mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

.field private mShootOrientation:I

.field private mShootRotation:F

.field private mShouldDoMFNR:Z

.field private mShutterCallbackTime:J

.field private mShutterLag:J

.field private mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

.field private mTotalJpegCallbackNum:I

.field private mUpdateImageTitle:Z

.field private mVideoSize:Lcom/android/camera/CameraSize;

.field private mVolumeLongPress:Z

.field private mWaitingSuperNightResult:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 200
    const-class v0, Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/BaseModule;-><init>()V

    .line 239
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 240
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 241
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 242
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 245
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/camera/module/Camera2Module;->mBurstNextDelayTime:J

    .line 247
    const/4 v3, 0x1

    iput v3, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 248
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 268
    const/4 v4, -0x1

    iput v4, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    .line 299
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsLensServiceBound:Z

    .line 300
    iput v3, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    .line 322
    new-instance v4, Ljava/lang/Object;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorderStateLock:Ljava/lang/Object;

    .line 323
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    .line 324
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mIsMicrophoneEnabled:Z

    .line 4686
    new-instance v3, Lcom/android/camera/module/Camera2Module$23;

    invoke-direct {v3, p0}, Lcom/android/camera/module/Camera2Module$23;-><init>(Lcom/android/camera/module/Camera2Module;)V

    iput-object v3, p0, Lcom/android/camera/module/Camera2Module;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    .line 5294
    iput-wide v1, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    .line 5310
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isResetFromMutex:Z

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mBurstEmitter:Lio/reactivex/ObservableEmitter;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/module/Camera2Module;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic access$1000(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/module/Camera2Module;J)J
    .locals 0

    .line 180
    iput-wide p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstStartTime:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    return p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->is3ALocked()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    return-object p0
.end method

.method static synthetic access$1400()Ljava/lang/String;
    .locals 1

    .line 180
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getDualWaterMarkParam()Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600()Ljava/lang/String;
    .locals 1

    .line 180
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->getTiltShiftMode()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mIsGradienterOn:Z

    return p0
.end method

.method static synthetic access$1800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getSuffix()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1900(Lcom/android/camera/module/Camera2Module;)Lcom/xiaomi/camera/core/PictureInfo;
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mAlgorithmName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/android/camera/module/Camera2Module;)I
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    return p0
.end method

.method static synthetic access$2300(Lcom/android/camera/module/Camera2Module;)F
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    return p0
.end method

.method static synthetic access$2400(Lcom/android/camera/module/Camera2Module;)I
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    return p0
.end method

.method static synthetic access$2500(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result p0

    return p0
.end method

.method static synthetic access$2600(Lcom/android/camera/module/Camera2Module;Lcom/xiaomi/camera/core/ParallelTaskData;Z)V
    .locals 0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->beginParallelProcess(Lcom/xiaomi/camera/core/ParallelTaskData;Z)V

    return-void
.end method

.method static synthetic access$2700(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->stopMultiSnap()V

    return-void
.end method

.method static synthetic access$2800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getCurrentAiSceneName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2900(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    return p0
.end method

.method static synthetic access$3000(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    return p0
.end method

.method static synthetic access$3102(Lcom/android/camera/module/Camera2Module;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0

    .line 180
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->startNormalCapture(I)V

    return-void
.end method

.method static synthetic access$3300(Lcom/android/camera/module/Camera2Module;)Lcom/google/lens/sdk/LensApi;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mIsLensServiceBound:Z

    return p0
.end method

.method static synthetic access$3402(Lcom/android/camera/module/Camera2Module;Z)Z
    .locals 0

    .line 180
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsLensServiceBound:Z

    return p1
.end method

.method static synthetic access$3500(Lcom/android/camera/module/Camera2Module;)J
    .locals 2

    .line 180
    iget-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mOnResumeTime:J

    return-wide v0
.end method

.method static synthetic access$3600(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;
    .locals 0

    .line 180
    iget-object p0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    return-object p0
.end method

.method static synthetic access$3700(Lcom/android/camera/module/Camera2Module;II)V
    .locals 0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->setOrientation(II)V

    return-void
.end method

.method static synthetic access$3800(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setOrientationParameter()V

    return-void
.end method

.method static synthetic access$3900(Lcom/android/camera/module/Camera2Module;ZZ)V
    .locals 0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->handleUpdateFaceView(ZZ)V

    return-void
.end method

.method static synthetic access$4000(Lcom/android/camera/module/Camera2Module;)I
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    return p0
.end method

.method static synthetic access$4002(Lcom/android/camera/module/Camera2Module;I)I
    .locals 0

    .line 180
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    return p1
.end method

.method static synthetic access$402(Lcom/android/camera/module/Camera2Module;Z)Z
    .locals 0

    .line 180
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mWaitingSuperNightResult:Z

    return p1
.end method

.method static synthetic access$4100(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSceneModeUI()V

    return-void
.end method

.method static synthetic access$4200(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->startLensActivity()V

    return-void
.end method

.method static synthetic access$4300(Lcom/android/camera/module/Camera2Module;I)V
    .locals 0

    .line 180
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->consumeAsdSceneResult(I)V

    return-void
.end method

.method static synthetic access$4402(Lcom/android/camera/module/Camera2Module;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$4500(Lcom/android/camera/module/Camera2Module;IZ)V
    .locals 0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->consumeAiSceneResult(IZ)V

    return-void
.end method

.method static synthetic access$4602(Lcom/android/camera/module/Camera2Module;Lio/reactivex/FlowableEmitter;)Lio/reactivex/FlowableEmitter;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-object p1
.end method

.method static synthetic access$4702(Lcom/android/camera/module/Camera2Module;Z)Z
    .locals 0

    .line 180
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->isResetFromMutex:Z

    return p1
.end method

.method static synthetic access$4800(Lcom/android/camera/module/Camera2Module;II)V
    .locals 0

    .line 180
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/module/Camera2Module;)I
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    return p0
.end method

.method static synthetic access$704(Lcom/android/camera/module/Camera2Module;)I
    .locals 1

    .line 180
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    return v0
.end method

.method static synthetic access$800(Lcom/android/camera/module/Camera2Module;)Z
    .locals 0

    .line 180
    iget-boolean p0, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    return p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/Camera2Module;)I
    .locals 0

    .line 180
    iget p0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    return p0
.end method

.method private animateCapture()V
    .locals 2

    .line 1584
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_0

    .line 1585
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraRotation()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    .line 1587
    :cond_0
    return-void
.end method

.method private applyBacklightEffect()V
    .locals 2

    .line 5672
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0x17

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 5673
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 5675
    const-string v0, "normal"

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    .line 5676
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetEvValue()V

    .line 5677
    return-void
.end method

.method private beginParallelProcess(Lcom/xiaomi/camera/core/ParallelTaskData;Z)V
    .locals 3

    .line 2699
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "algo begin: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2701
    if-eqz p2, :cond_0

    .line 2703
    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/android/camera/db/item/DbItemSaveTask;->generateItem(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/db/element/SaveTask;

    .line 2704
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/android/camera/db/element/SaveTask;->setPath(Ljava/lang/String;)V

    .line 2705
    invoke-static {}, Lcom/android/camera/db/DbRepository;->dbItemSaveTask()Lcom/android/camera/db/item/DbItemSaveTask;

    move-result-object p1

    const-wide/16 v0, 0x0

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/camera/db/item/DbItemSaveTask;->endItemAndInsert(Ljava/lang/Object;J)J

    .line 2708
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    if-nez p1, :cond_1

    .line 2709
    new-instance p1, Lcom/android/camera/module/Camera2Module$16;

    invoke-direct {p1, p0}, Lcom/android/camera/module/Camera2Module$16;-><init>(Lcom/android/camera/module/Camera2Module;)V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    .line 2720
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/parallel/AlgoConnector;->setServiceStatusListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V

    .line 2722
    :cond_1
    return-void
.end method

.method private calculateTimeout(I)J
    .locals 6

    .line 1167
    const-wide/16 v0, 0x1f40

    const/16 v2, 0xa7

    if-ne p1, v2, :cond_1

    .line 1168
    const-string p1, "pref_qc_camera_exposuretime_key"

    const v2, 0x7f090136

    .line 1169
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1168
    invoke-direct {p0, p1, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1170
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 1171
    const-wide/32 v4, 0xf4240

    div-long/2addr v2, v4

    .line 1172
    cmp-long p1, v2, v0

    if-lez p1, :cond_0

    add-long/2addr v0, v2

    nop

    :cond_0
    return-wide v0

    .line 1174
    :cond_1
    const/16 v2, 0xad

    if-ne p1, v2, :cond_2

    const-wide/16 v0, 0x3e80

    nop

    :cond_2
    return-wide v0
.end method

.method private checkCloseMoonMode(II)V
    .locals 2

    .line 5525
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    if-nez v0, :cond_0

    .line 5527
    return-void

    .line 5530
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0xa

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0x23

    if-eq v0, v1, :cond_1

    .line 5533
    return-void

    .line 5536
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    if-ne p1, v0, :cond_2

    .line 5538
    return-void

    .line 5540
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xac

    .line 5541
    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 5542
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 5543
    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMoonModeSelector(I)V

    .line 5544
    if-eqz p2, :cond_3

    .line 5545
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    .line 5548
    :cond_3
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateMoon(Z)V

    .line 5549
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p1}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 5550
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    .line 5552
    :cond_4
    return-void
.end method

.method private checkShutterCondition()Z
    .locals 2

    .line 1054
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1057
    :cond_0
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1058
    return v1

    .line 1060
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1061
    return v1

    .line 1064
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 1065
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1066
    if-eqz v0, :cond_3

    .line 1067
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()V

    .line 1070
    :cond_3
    const/4 v0, 0x1

    return v0

    .line 1055
    :cond_4
    :goto_0
    return v1
.end method

.method private configParallelSession()V
    .locals 6

    .line 2402
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 2403
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualFrontCamera()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2404
    :cond_0
    move v0, v1

    goto :goto_1

    .line 2403
    :cond_1
    :goto_0
    const/4 v0, 0x2

    .line 2404
    :goto_1
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "configParallelSession: inputStreamNum = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2405
    new-instance v2, Lcom/xiaomi/engine/GraphDescriptorBean;

    const v3, 0x8002

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mActualCameraId:I

    .line 2406
    invoke-static {v4}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCameraCombinationMode(I)I

    move-result v4

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/xiaomi/engine/GraphDescriptorBean;-><init>(IIZI)V

    .line 2407
    goto :goto_2

    .line 2408
    :cond_2
    new-instance v2, Lcom/xiaomi/engine/GraphDescriptorBean;

    const/4 v0, 0x0

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mActualCameraId:I

    .line 2409
    invoke-static {v3}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCameraCombinationMode(I)I

    move-result v3

    invoke-direct {v2, v0, v1, v1, v3}, Lcom/xiaomi/engine/GraphDescriptorBean;-><init>(IIZI)V

    .line 2412
    :goto_2
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[QCFA] configParallelSession: mPictureSize = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2413
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[QCFA] configParallelSession: mOutPutSize = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2414
    new-instance v0, Lcom/xiaomi/engine/BufferFormat;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    const/16 v5, 0x23

    invoke-direct {v0, v3, v4, v5, v2}, Lcom/xiaomi/engine/BufferFormat;-><init>(IIILcom/xiaomi/engine/GraphDescriptorBean;)V

    .line 2416
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder(Z)Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v1

    .line 2417
    invoke-virtual {v1, v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V

    .line 2418
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 2419
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/LocalParallelService$LocalBinder;->setJpegOutputSize(II)V

    .line 2420
    return-void
.end method

.method private consumeAiSceneResult(IZ)V
    .locals 9

    .line 5342
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    if-ne v0, p1, :cond_0

    .line 5343
    return-void

    .line 5346
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 5350
    :cond_1
    if-eqz p2, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isResetFromMutex:Z

    if-eqz v0, :cond_2

    .line 5351
    return-void

    .line 5354
    :cond_2
    const/4 v0, 0x0

    if-nez p2, :cond_3

    .line 5355
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isResetFromMutex:Z

    .line 5357
    :cond_3
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "consumeAiSceneResult: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; isReset: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5358
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    .line 5359
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 5361
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xa4

    .line 5362
    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 5363
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    const/16 v4, 0x19

    const/4 v5, 0x1

    if-nez v3, :cond_5

    .line 5364
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-ne p1, v4, :cond_4

    move v6, v5

    goto :goto_0

    :cond_4
    move v6, v0

    :goto_0
    invoke-virtual {v3, v6}, Lcom/android/camera2/Camera2Proxy;->setCameraAI30(Z)V

    .line 5367
    :cond_5
    const/16 v3, 0x8

    invoke-direct {p0, p1, v3}, Lcom/android/camera/module/Camera2Module;->checkCloseMoonMode(II)V

    .line 5368
    nop

    .line 5369
    const/4 v6, -0x1

    const/16 v7, 0xc1

    if-eq p1, v6, :cond_10

    const/4 v6, 0x6

    if-eq p1, v5, :cond_b

    const/4 v8, 0x4

    if-eq p1, v8, :cond_a

    const/16 v8, 0xa

    if-eq p1, v8, :cond_9

    const/16 v7, 0xf

    if-eq p1, v7, :cond_7

    const/16 v7, 0x13

    if-eq p1, v7, :cond_7

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    packed-switch p1, :pswitch_data_2

    .line 5481
    const-string v0, "e"

    invoke-interface {v2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5482
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto/16 :goto_1

    .line 5445
    :pswitch_0
    nop

    .line 5446
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->showMoonMode()Z

    move-result v2

    .line 5447
    if-eqz v2, :cond_d

    .line 5448
    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 5449
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p2, v5}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 5450
    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, p2, p1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 5451
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5452
    return-void

    .line 5457
    :pswitch_1
    nop

    .line 5458
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5459
    goto/16 :goto_2

    .line 5467
    :pswitch_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mi/config/a;->eT()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 5468
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5469
    const-string v0, "e"

    invoke-interface {v2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 5472
    :cond_6
    nop

    .line 5473
    const-string p1, "e"

    invoke-interface {v2, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5474
    sget-object p1, Lcom/android/camera/constant/UpdateConstant;->AI_SCENE_CONFIG:[I

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 5477
    nop

    .line 5486
    move p1, v0

    goto/16 :goto_1

    .line 5387
    :pswitch_3
    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, p2, v4}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 5388
    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 5389
    invoke-interface {v1, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(I)V

    .line 5390
    invoke-direct {p0, v4}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 5391
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5392
    const-string p1, "e"

    invoke-interface {v2, p1}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5394
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 5395
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5396
    return-void

    .line 5440
    :pswitch_4
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5441
    const-string v0, "e"

    invoke-interface {v2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5443
    goto :goto_1

    .line 5430
    :cond_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 5431
    if-ge v0, v6, :cond_8

    .line 5432
    add-int/lit8 v0, v0, 0x1

    .line 5434
    :cond_8
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v0}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    .line 5435
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5436
    const-string v0, "e"

    invoke-interface {v2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5437
    goto :goto_1

    .line 5399
    :cond_9
    const-string v4, "e"

    new-array v6, v5, [I

    aput v7, v6, v0

    invoke-interface {v2, v4, v6}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 5408
    const-string v0, "0"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setFlashMode(Ljava/lang/String;)V

    .line 5409
    invoke-direct {p0, v5}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 5410
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOIS()V

    .line 5411
    goto :goto_1

    .line 5422
    :cond_a
    invoke-static {}, Lcom/android/camera/CameraSettings;->getContrast()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 5423
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4, v0}, Lcom/android/camera2/Camera2Proxy;->setContrast(I)V

    .line 5424
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5425
    const-string v0, "e"

    invoke-interface {v2, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5426
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    .line 5427
    goto :goto_1

    .line 5413
    :cond_b
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 5414
    if-ge v0, v6, :cond_c

    .line 5415
    add-int/lit8 v0, v0, 0x1

    .line 5417
    :cond_c
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5418
    const-string v4, "e"

    invoke-interface {v2, v4}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreAllMutexElement(Ljava/lang/String;)V

    .line 5419
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    .line 5420
    nop

    .line 5486
    :goto_1
    move v0, v5

    :cond_d
    :goto_2
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, v2, p1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 5487
    invoke-interface {v1, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 5488
    invoke-interface {v1, v3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(I)V

    .line 5489
    if-eqz v0, :cond_e

    .line 5490
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 5492
    :cond_e
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v5}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 5493
    if-nez p2, :cond_f

    .line 5494
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5496
    :cond_f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 5497
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5498
    return-void

    .line 5371
    :cond_10
    const-string p2, "e"

    new-array v4, v5, [I

    aput v7, v4, v0

    invoke-interface {v2, p2, v4}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 5378
    const/16 p2, 0x17

    invoke-interface {v1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->setAiSceneImageLevel(I)V

    .line 5379
    invoke-interface {v1, v3, v0, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertHDR(IZZ)V

    .line 5380
    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(I)V

    .line 5381
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->applyBacklightEffect()V

    .line 5382
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p2, v0}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 5383
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5384
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5385
    return-void

    .line 5347
    :cond_11
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_4
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x19
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x22
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private consumeAsdSceneResult(I)V
    .locals 1

    .line 5179
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    if-ne v0, p1, :cond_0

    .line 5180
    return-void

    .line 5183
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 5187
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->exitAsdScene(I)V

    .line 5188
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->enterAsdScene(I)V

    .line 5189
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    .line 5190
    return-void

    .line 5184
    :cond_2
    :goto_0
    return-void
.end method

.method private doAttach()V
    .locals 6

    .line 3128
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v0, :cond_0

    .line 3129
    return-void

    .line 3131
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->getStoredJpegData()[B

    move-result-object v0

    .line 3132
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsSaveCaptureImage:Z

    if-eqz v1, :cond_1

    .line 3133
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/storage/ImageSaver;->saveStoredData()V

    .line 3135
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_3

    .line 3140
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    const/4 v3, -0x1

    if-eqz v1, :cond_2

    .line 3141
    nop

    .line 3143
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    invoke-virtual {v1, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3144
    :try_start_1
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 3145
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 3147
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, v3}, Lcom/android/camera/Camera;->setResult(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3152
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    .line 3153
    invoke-static {v1}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1

    .line 3152
    :catchall_0
    move-exception v0

    move-object v2, v1

    goto :goto_2

    .line 3148
    :catch_0
    move-exception v0

    move-object v2, v1

    goto :goto_0

    .line 3152
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 3148
    :catch_1
    move-exception v0

    .line 3150
    :goto_0
    :try_start_2
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v3, "Exception when doAttach: "

    invoke-static {v1, v3, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 3152
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    .line 3153
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 3154
    :goto_1
    nop

    .line 3155
    goto/16 :goto_4

    .line 3152
    :goto_2
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->finish()V

    .line 3153
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    .line 3156
    :cond_2
    const v1, 0xc800

    invoke-static {v0, v1}, Lcom/android/camera/Util;->makeBitmap([BI)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 3157
    invoke-static {v0}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v0

    .line 3158
    invoke-static {v1, v0}, Lcom/android/camera/Util;->rotate(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 3159
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v2, Landroid/content/Intent;

    const-string v4, "inline-data"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "data"

    .line 3160
    invoke-virtual {v2, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    .line 3159
    invoke-virtual {v1, v3, v0}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 3161
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    .line 3162
    goto :goto_4

    .line 3165
    :cond_3
    nop

    .line 3166
    nop

    .line 3168
    const/4 v1, 0x0

    :try_start_3
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-string v4, "crop-temp"

    invoke-virtual {v3, v4}, Lcom/android/camera/Camera;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 3169
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 3170
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-string v5, "crop-temp"

    invoke-virtual {v4, v5, v1}, Lcom/android/camera/Camera;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 3171
    :try_start_4
    invoke-virtual {v4, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 3172
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 3173
    nop

    .line 3174
    :try_start_5
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 3184
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 3185
    nop

    .line 3186
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 3187
    const-string v2, "circle"

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3188
    const-string v2, "circleCrop"

    const-string v3, "true"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 3190
    :cond_4
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    if-eqz v2, :cond_5

    .line 3191
    const-string v2, "output"

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_3

    .line 3193
    :cond_5
    const-string v2, "return-data"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 3196
    :goto_3
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.camera.action.CROP"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3198
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 3199
    invoke-virtual {v2, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 3201
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/Camera;->startActivityForResult(Landroid/content/Intent;I)V

    .line 3203
    :goto_4
    return-void

    .line 3184
    :catchall_2
    move-exception v0

    move-object v2, v4

    goto :goto_7

    .line 3179
    :catch_2
    move-exception v0

    move-object v2, v4

    goto :goto_5

    .line 3175
    :catch_3
    move-exception v0

    move-object v2, v4

    goto :goto_6

    .line 3184
    :catchall_3
    move-exception v0

    goto :goto_7

    .line 3179
    :catch_4
    move-exception v0

    .line 3180
    :goto_5
    :try_start_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setResult(I)V

    .line 3181
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 3184
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 3182
    return-void

    .line 3175
    :catch_5
    move-exception v0

    .line 3176
    :goto_6
    :try_start_7
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setResult(I)V

    .line 3177
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 3184
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 3178
    return-void

    .line 3184
    :goto_7
    invoke-static {v2}, Lcom/android/camera/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method

.method private doLaterReleaseIfNeed()V
    .locals 4

    .line 2049
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-nez v0, :cond_0

    .line 2050
    return-void

    .line 2053
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_1

    .line 2054
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 2057
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2058
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2059
    move v0, v1

    goto :goto_0

    .line 2058
    :cond_2
    const/4 v0, 0x0

    .line 2059
    :goto_0
    if-eqz v0, :cond_3

    .line 2060
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v3, "doLaterRelease"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2062
    :cond_3
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v3, "doLaterRelease but session is closed"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2064
    :goto_1
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2, v1, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    .line 2065
    return-void

    .line 2068
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2069
    return-void

    .line 2072
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$13;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$13;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 2079
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isTextureExpired()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2081
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "surfaceTexture expired, restartModule"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2082
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$14;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$14;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 2088
    return-void

    .line 2091
    :cond_6
    return-void
.end method

.method private enablePreviewAsThumbnail()Z
    .locals 4

    .line 2743
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2744
    return v1

    .line 2748
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 2749
    return v2

    .line 2753
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsPortraitLightingOn:Z

    if-eqz v0, :cond_2

    .line 2754
    return v1

    .line 2757
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2758
    return v2

    .line 2762
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2763
    return v1

    .line 2767
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2768
    return v2

    .line 2771
    :cond_5
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0xa7

    if-ne v0, v3, :cond_6

    .line 2772
    return v1

    .line 2775
    :cond_6
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v3, 0xad

    if-ne v0, v3, :cond_7

    .line 2776
    return v1

    .line 2780
    :cond_7
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_0

    .line 2785
    :cond_8
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2786
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2787
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 2788
    return v1

    .line 2792
    :cond_9
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 2793
    return v1

    .line 2797
    :cond_a
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isNeedPreviewThumbnail()Z

    move-result v0

    if-eqz v0, :cond_b

    move v1, v2

    nop

    :cond_b
    return v1

    .line 2781
    :cond_c
    :goto_0
    return v1
.end method

.method private enterAsdScene(I)V
    .locals 5

    .line 5230
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5231
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 5232
    const/4 v1, 0x0

    if-eqz p1, :cond_2

    const/16 v2, 0x9

    if-eq p1, v2, :cond_0

    const/4 v0, 0x4

    const/4 v2, 0x6

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 5246
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5247
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setPortraitSuccessHintVisible(I)V

    goto :goto_0

    .line 5265
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5266
    const p1, 0x7f09019c

    invoke-virtual {p0, v2, p1, v0}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 5258
    :pswitch_2
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5259
    const p1, 0x7f09019e

    invoke-virtual {p0, v2, p1, v0}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 5251
    :pswitch_3
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5252
    const p1, 0x7f09019d

    invoke-virtual {p0, v2, p1, v0}, Lcom/android/camera/module/Camera2Module;->updateTipMessage(III)V

    goto :goto_0

    .line 5237
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {p1, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 5238
    const-string v2, "3"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/16 v3, 0xa

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    .line 5239
    new-array p1, v4, [I

    aput v3, p1, v1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 5240
    :cond_1
    const-string v2, "103"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 5241
    invoke-interface {v0, v1, v1, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 5242
    new-array p1, v4, [I

    aput v3, p1, v1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 5234
    :cond_2
    invoke-interface {v0, v1, v1, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 5235
    nop

    .line 5272
    :cond_3
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private exitAsdScene(I)V
    .locals 5

    .line 5194
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5195
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 5196
    const/16 v1, 0x8

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    const/16 v3, 0x9

    if-eq p1, v3, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 5220
    :pswitch_0
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5221
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setPortraitSuccessHintVisible(I)V

    goto :goto_0

    .line 5215
    :pswitch_1
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez p1, :cond_3

    .line 5216
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->hideTipMessage(I)V

    goto :goto_0

    .line 5206
    :cond_0
    const-string p1, "103"

    .line 5207
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v3, v4}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v3

    .line 5206
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 5208
    invoke-interface {v0, v1, v2, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 5210
    :cond_1
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/16 v0, 0xa

    aput v0, p1, v2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 5211
    goto :goto_0

    .line 5199
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object p1

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {p1, v3}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 5200
    const-string v3, "1"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "101"

    .line 5201
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 5202
    invoke-interface {v0, v1, v2, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertFlash(IZZ)V

    .line 5226
    :cond_3
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getCalibrationDataFileName(I)Ljava/lang/String;
    .locals 1

    .line 3264
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3265
    const-string p1, "front_dual_camera_caldata.bin"

    return-object p1

    .line 3267
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideBokehCameraId()I

    move-result v0

    if-ne p1, v0, :cond_1

    .line 3268
    const-string p1, "back_dual_camera_caldata_wu.bin"

    return-object p1

    .line 3270
    :cond_1
    const-string p1, "back_dual_camera_caldata.bin"

    return-object p1
.end method

.method private getCountDownTimes(I)I
    .locals 3

    .line 1025
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 1026
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    goto :goto_0

    .line 1028
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getTimerDurationSeconds()I

    move-result v0

    .line 1030
    :goto_0
    const/4 v1, -0x1

    const/4 v2, 0x3

    if-eq v0, v1, :cond_4

    .line 1032
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    if-eqz p1, :cond_1

    .line 1033
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    const-string v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_1

    .line 1035
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 1037
    :goto_1
    if-eqz v0, :cond_3

    const/4 p1, 0x5

    if-eq v0, p1, :cond_2

    .line 1043
    return v2

    .line 1041
    :cond_2
    return p1

    .line 1039
    :cond_3
    const/4 p1, 0x0

    return p1

    .line 1045
    :cond_4
    const/16 v0, 0x64

    if-ne p1, v0, :cond_6

    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 1046
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCountDownTimes()I

    move-result p1

    .line 1047
    if-eqz p1, :cond_5

    goto :goto_2

    :cond_5
    move p1, v2

    :goto_2
    return p1

    .line 1049
    :cond_6
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCountDownTimes()I

    move-result p1

    return p1
.end method

.method private getCurrentAiSceneName()Ljava/lang/String;
    .locals 4

    .line 5795
    nop

    .line 5796
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5797
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa3

    if-eq v1, v2, :cond_1

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa7

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 5811
    :cond_0
    const/4 v0, 0x0

    goto :goto_3

    .line 5798
    :cond_1
    :goto_0
    const-string v1, "off"

    .line 5799
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 5800
    const-string v1, "\u672a\u77e5"

    .line 5801
    const/4 v2, -0x1

    if-ne v0, v2, :cond_3

    .line 5802
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isSilhouette:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x18

    goto :goto_1

    :cond_2
    const/16 v0, 0x17

    .line 5804
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f0e0000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 5805
    if-ltz v0, :cond_4

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 5806
    invoke-virtual {v2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 5808
    :cond_4
    move-object v0, v1

    :goto_2
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_3

    .line 5811
    :cond_5
    move-object v0, v1

    :goto_3
    return-object v0
.end method

.method private getDualWaterMarkParam()Lcom/android/camera/effect/renders/DualWatermarkParam;
    .locals 7

    .line 1427
    new-instance v6, Lcom/android/camera/effect/renders/DualWatermarkParam;

    .line 1428
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v1

    .line 1429
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;

    move-result-object v2

    .line 1430
    const/4 v0, 0x0

    const v3, 0x7f0a00ad

    invoke-static {v3, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v3

    .line 1431
    const v4, 0x7f0a00ae

    invoke-static {v4, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v4

    .line 1432
    const v5, 0x7f0a00af

    invoke-static {v5, v0}, Lcom/android/camera/CameraSettings;->getResourceFloat(IF)F

    move-result v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/renders/DualWatermarkParam;-><init>(ZLjava/lang/String;FFF)V

    .line 1427
    return-object v6
.end method

.method private getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 4894
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    .line 4895
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4896
    invoke-virtual {v0, p1, p2}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 4895
    :cond_0
    return-object p2
.end method

.method private getMaxPictureSize(II)Lcom/android/camera/CameraSize;
    .locals 1

    .line 3644
    nop

    .line 3645
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p1

    .line 3646
    if-eqz p1, :cond_0

    .line 3647
    invoke-virtual {p1, p2}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object p1

    .line 3648
    invoke-static {p1}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object p1

    goto :goto_0

    .line 3650
    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;
    .locals 2

    .line 5781
    new-instance v0, Lcom/xiaomi/camera/core/PictureInfo;

    invoke-direct {v0}, Lcom/xiaomi/camera/core/PictureInfo;-><init>()V

    .line 5782
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setFrontMirror(Z)Lcom/xiaomi/camera/core/PictureInfo;

    .line 5783
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setSensorType(Z)Lcom/xiaomi/camera/core/PictureInfo;

    .line 5784
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/PictureInfo;

    .line 5786
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5787
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setAiEnabled(Z)Lcom/xiaomi/camera/core/PictureInfo;

    .line 5788
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/PictureInfo;->setAiType(I)Lcom/xiaomi/camera/core/PictureInfo;

    .line 5790
    :cond_0
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/PictureInfo;->end()V

    .line 5791
    return-object v0
.end method

.method private getRequestFlashMode()Ljava/lang/String;
    .locals 3

    .line 4440
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportSceneMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4441
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4442
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 4443
    return-object v0

    .line 4447
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSupportedFlashOn()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSupportedTorch()Z

    move-result v0

    if-nez v0, :cond_1

    .line 4448
    const-string v0, "0"

    return-object v0

    .line 4450
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 4451
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/16 v2, 0x9

    if-ne v1, v2, :cond_3

    .line 4452
    const-string v1, "3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4453
    const-string v0, "2"

    return-object v0

    .line 4454
    :cond_2
    const-string v1, "103"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 4455
    const-string v0, "101"

    return-object v0

    .line 4458
    :cond_3
    return-object v0
.end method

.method private getSubPictureSize(IZ)Lcom/android/camera/CameraSize;
    .locals 2

    .line 3636
    if-eqz p2, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getAuxFrontCameraId()I

    move-result v0

    goto :goto_0

    .line 3637
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getAuxCameraId()I

    move-result v0

    .line 3638
    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/Camera2Module;->getMaxPictureSize(II)Lcom/android/camera/CameraSize;

    move-result-object p1

    .line 3639
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p2, :cond_1

    const-string p2, "frontSubSize: "

    goto :goto_1

    :cond_1
    const-string p2, "backSubSize: "

    :goto_1
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3640
    return-object p1
.end method

.method private getSuffix()Ljava/lang/String;
    .locals 1

    .line 4432
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4433
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->getSuffix()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 4435
    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method private static getTiltShiftMode()Ljava/lang/String;
    .locals 2

    .line 1436
    nop

    .line 1437
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1439
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTiltValue()Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;

    move-result-object v0

    .line 1440
    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningTiltValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1442
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private handleUpdateFaceView(ZZ)V
    .locals 6

    .line 969
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    .line 970
    if-eqz p1, :cond_1

    .line 972
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFaceBeautyMode()Z

    move-result p2

    if-eqz p2, :cond_2

    :cond_0
    const/4 p2, 0x1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 973
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    if-eq p2, v0, :cond_2

    .line 974
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x1

    const/4 v4, 0x1

    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    move v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    goto :goto_0

    .line 978
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v4, 0x0

    const/4 v5, -0x1

    move v1, p1

    move v2, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateFaceView(ZZZZI)V

    .line 980
    :cond_2
    :goto_0
    return-void
.end method

.method private hidePostCaptureAlert()V
    .locals 2

    .line 3111
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 3112
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3113
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resumePreview()V

    goto :goto_0

    .line 3115
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startPreview()V

    .line 3117
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEffectViewVisible(Z)V

    .line 3121
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 3123
    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 3125
    return-void
.end method

.method private hideSceneSelector()V
    .locals 2

    .line 798
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    sget-object v1, Lcom/android/camera/module/-$$Lambda$Camera2Module$6MhBAG8t9gKD6JetAb6jENHe1rY;->INSTANCE:Lcom/android/camera/module/-$$Lambda$Camera2Module$6MhBAG8t9gKD6JetAb6jENHe1rY;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 805
    return-void
.end method

.method private initAiSceneParser()V
    .locals 2

    .line 5317
    new-instance v0, Lcom/android/camera/module/loader/FunctionParseAiScene;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {v0, v1}, Lcom/android/camera/module/loader/FunctionParseAiScene;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFunctionParseAiScene:Lcom/android/camera/module/loader/FunctionParseAiScene;

    .line 5318
    new-instance v0, Lcom/android/camera/module/Camera2Module$28;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$28;-><init>(Lcom/android/camera/module/Camera2Module;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 5319
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 5326
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFunctionParseAiScene:Lcom/android/camera/module/loader/FunctionParseAiScene;

    .line 5329
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/PredicateFilterAiScene;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/PredicateFilterAiScene;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 5330
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 5331
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$27;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$27;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 5332
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    .line 5338
    return-void
.end method

.method private initFlashAutoStateForTrack(Z)V
    .locals 2

    .line 5767
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    .line 5768
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 5769
    const-string v1, "3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "103"

    .line 5770
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 5771
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    if-eqz p1, :cond_1

    goto :goto_0

    .line 5775
    :cond_1
    const-string p1, "auto-off"

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    goto :goto_1

    .line 5773
    :cond_2
    :goto_0
    const-string p1, "auto-on"

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFlashAutoModeState:Ljava/lang/String;

    .line 5778
    :cond_3
    :goto_1
    return-void
.end method

.method private initMetaParser()V
    .locals 4

    .line 5133
    new-instance v0, Lcom/android/camera/module/Camera2Module$26;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$26;-><init>(Lcom/android/camera/module/Camera2Module;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    .line 5134
    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 5140
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdFace;

    .line 5142
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/camera/module/loader/FunctionParseAsdFace;-><init>(Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdHdr;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/FunctionParseAsdHdr;-><init>(Lcom/android/camera2/Camera2Proxy$HDRCheckerCallback;)V

    .line 5144
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/FunctionParseAsdUltraWide;-><init>(Lcom/android/camera2/Camera2Proxy$UltraWideCheckCallback;)V

    .line 5146
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 5150
    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v2, v3, v1}, Lio/reactivex/Flowable;->sample(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Flowable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    .line 5151
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/loader/FunctionParseAsdScene;

    invoke-direct {v1, p0}, Lcom/android/camera/module/loader/FunctionParseAsdScene;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 5166
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 5168
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    .line 5169
    invoke-virtual {v0}, Lio/reactivex/Flowable;->onTerminateDetach()Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$25;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$25;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 5170
    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    .line 5176
    return-void
.end method

.method private initializeFocusManager()V
    .locals 4

    .line 3288
    new-instance v0, Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 3291
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 3292
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v0, v1, p0, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;-><init>(Lcom/android/camera2/CameraCapabilities;Lcom/android/camera/module/loader/camera2/FocusManager2$Listener;ZLandroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 3295
    nop

    .line 3296
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3297
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderRect()Landroid/graphics/Rect;

    move-result-object v0

    goto :goto_0

    .line 3299
    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-lez v1, :cond_1

    .line 3300
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 3301
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v3

    .line 3300
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 3302
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    goto :goto_1

    .line 3307
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 3308
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 3310
    :goto_1
    return-void
.end method

.method private is3ALocked()Z
    .locals 1

    .line 4657
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    return v0
.end method

.method private isEnableQcfa()Z
    .locals 2

    .line 2440
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2441
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2442
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xa5

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 2440
    :goto_0
    return v0
.end method

.method private isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z
    .locals 3

    .line 5743
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 5744
    return v0

    .line 5747
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    .line 5748
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAdvancedBeautyOn()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 5749
    iget v1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    if-gtz v1, :cond_2

    iget v1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    if-gtz v1, :cond_2

    iget p1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    if-lez p1, :cond_1

    goto :goto_0

    :cond_1
    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    return v0

    .line 5753
    :cond_3
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/2addr p1, v2

    return p1

    .line 5756
    :cond_4
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object p1, p1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    xor-int/2addr p1, v2

    return p1
.end method

.method private isFrontMirror()Z
    .locals 1

    .line 3078
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3079
    const/4 v0, 0x0

    return v0

    .line 3083
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3084
    const/4 v0, 0x1

    return v0

    .line 3086
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMirror()Z

    move-result v0

    return v0
.end method

.method private isInCountDown()Z
    .locals 1

    .line 1780
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isLaunchedByMainIntent()Z
    .locals 2

    .line 2005
    nop

    .line 2006
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    .line 2007
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 2008
    if-eqz v0, :cond_0

    .line 2009
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2012
    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isNeedRawStream()Z
    .locals 4

    .line 2424
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEnableDNG()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2425
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const/16 v1, 0x25

    .line 2426
    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v0

    .line 2427
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/CameraSize;

    .line 2428
    iget v2, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    if-ne v2, v3, :cond_0

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    if-ne v1, v2, :cond_0

    .line 2429
    const/4 v0, 0x1

    return v0

    .line 2431
    :cond_0
    goto :goto_0

    .line 2433
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private isParallelQueueFull()Z
    .locals 3

    .line 2671
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2672
    return v1

    .line 2675
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v0

    .line 2676
    if-eqz v0, :cond_1

    .line 2677
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "isParallelQueueFull: ImageSaver queue is full"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2678
    const/4 v0, 0x1

    return v0

    .line 2681
    :cond_1
    nop

    .line 2682
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    .line 2683
    if-eqz v0, :cond_2

    .line 2684
    invoke-virtual {v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->needWaitProcess()Z

    move-result v1

    goto :goto_0

    .line 2686
    :cond_2
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v2, "isParallelQueueFull: NOTICE: CHECK WHY BINDER IS NULL!"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2689
    :goto_0
    return v1
.end method

.method private isParallelSessionEnable()Z
    .locals 2

    .line 3573
    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraParallelProcessEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3574
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xad

    if-eq v0, v1, :cond_0

    .line 3575
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 3573
    :goto_0
    return v0
.end method

.method private isPortraitSuccessHintShowing()Z
    .locals 2

    .line 5276
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5277
    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 5278
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->isPortraitHintVisible()Z

    move-result v0

    return v0
.end method

.method private isTriggerQcfaModeChange(ZZ)Z
    .locals 5

    .line 683
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 684
    return v1

    .line 686
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xab

    if-ne v0, v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 687
    return v1

    .line 690
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fQ()I

    move-result v0

    if-lez v0, :cond_2

    .line 691
    return v1

    .line 693
    :cond_2
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    .line 694
    const v2, 0x8005

    const v3, 0x8007

    const/4 v4, 0x1

    if-eqz p1, :cond_5

    .line 695
    sget-boolean p1, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    if-eq p1, v0, :cond_8

    .line 698
    if-eqz v0, :cond_3

    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    if-ne p1, v3, :cond_3

    .line 699
    return v4

    .line 701
    :cond_3
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 703
    if-nez v0, :cond_4

    const-string p2, "off"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    if-ne p1, v2, :cond_4

    .line 705
    return v4

    .line 707
    :cond_4
    goto :goto_0

    .line 708
    :cond_5
    if-eqz p2, :cond_8

    if-nez v0, :cond_8

    .line 709
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    .line 710
    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    if-ne p2, v2, :cond_6

    const-string p2, "off"

    .line 711
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    :cond_6
    iget p2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    if-ne p2, v3, :cond_8

    const-string p2, "off"

    .line 713
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 714
    :cond_7
    return v4

    .line 717
    :cond_8
    :goto_0
    return v1
.end method

.method private isUseSwMfnr()Z
    .locals 6

    .line 4172
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result v0

    .line 4173
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->eX()Z

    move-result v1

    .line 4174
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 4175
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "GroupShot is on"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4176
    return v3

    .line 4180
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isUltraWideBackCamera()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4181
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "SwMfnr force off for ultra wide camera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4182
    return v3

    .line 4184
    :cond_1
    if-nez v0, :cond_2

    .line 4185
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "Mfnr not enabled"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4186
    return v3

    .line 4188
    :cond_2
    if-nez v1, :cond_3

    .line 4189
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "SwMfnr is not supported"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4190
    return v3

    .line 4192
    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v2

    if-nez v2, :cond_4

    .line 4193
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "Mutex mode is not normal"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4194
    return v3

    .line 4197
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->eY()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v5, 0xa7

    if-eq v2, v5, :cond_5

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v5, 0xad

    if-eq v2, v5, :cond_5

    .line 4200
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "For the devices does not have hardware MFNR, use software MFNR"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4201
    return v4

    .line 4203
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 4204
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualFrontCamera()Z

    move-result v2

    if-nez v2, :cond_7

    .line 4205
    invoke-static {}, Lcom/mi/config/b;->hN()Z

    move-result v2

    if-eqz v2, :cond_7

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v5, 0x8005

    if-eq v2, v5, :cond_6

    .line 4209
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 4210
    :cond_6
    move v3, v4

    goto :goto_0

    .line 4209
    :cond_7
    nop

    .line 4210
    :goto_0
    sget-object v2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "isUseSwMfnr: supportSwMfnr = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isFrontCamera = "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4211
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isMfnrEnabled = "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", result = "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4210
    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4214
    return v3
.end method

.method private keepScreenOnAwhile()V
    .locals 4

    .line 4913
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x11

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 4914
    return-void
.end method

.method static synthetic lambda$hideSceneSelector$0()V
    .locals 2

    .line 799
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 800
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 801
    if-eqz v0, :cond_0

    .line 802
    const/16 v1, 0x8

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertAiSceneSelector(I)V

    .line 804
    :cond_0
    return-void
.end method

.method private lockAEAF()V
    .locals 2

    .line 4648
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "lockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4649
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 4650
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 4653
    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 4654
    return-void
.end method

.method private needShowThumbProgressImmediately()Z
    .locals 4

    .line 5032
    const-string v0, "pref_qc_camera_exposuretime_key"

    .line 5033
    const v1, 0x7f090136

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 5032
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/32 v2, 0xee6b280

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xad

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onBeautyParameterChanged()V
    .locals 3

    .line 721
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->isTriggerQcfaModeChange(ZZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 722
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->restartModule()V

    goto :goto_0

    .line 723
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hN()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 724
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 726
    :cond_1
    new-array v1, v1, [I

    const/16 v2, 0xd

    aput v2, v1, v0

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 728
    :goto_0
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    .line 729
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyBodySlimOn()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsBeautyBodySlimOn:Z

    .line 730
    return-void

    :array_0
    .array-data 4
        0xd
        0x22
        0x2a
    .end array-data
.end method

.method private onFilterChanged()V
    .locals 4

    .line 578
    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    const/4 v3, 0x2

    aput v3, v1, v2

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 580
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v3, 0xac

    invoke-virtual {v1, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 581
    new-array v0, v0, [I

    const/16 v3, 0xc4

    aput v3, v0, v2

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateConfigItem([I)V

    .line 582
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 583
    return-void
.end method

.method private onShutter()V
    .locals 4

    .line 2972
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    .line 2973
    return-void

    .line 2975
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterCallbackTime:J

    .line 2976
    iget-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterCallbackTime:J

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mShutterLag:J

    .line 2977
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mShutterLag = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/android/camera/module/Camera2Module;->mShutterLag:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2979
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    if-nez v0, :cond_2

    .line 2980
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->enablePreviewAsThumbnail()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2981
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    .line 2982
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestReadPixels()V

    goto :goto_0

    .line 2985
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xad

    if-eq v0, v1, :cond_2

    .line 2986
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateThumbProgress(Z)V

    .line 2987
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 2988
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 2992
    :cond_2
    :goto_0
    return-void
.end method

.method private parseIntent()V
    .locals 2

    .line 2244
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    .line 2245
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    .line 2247
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v1, :cond_0

    .line 2248
    return-void

    .line 2250
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraSavedUri()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSaveUri:Landroid/net/Uri;

    .line 2251
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraCropValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCropValue:Ljava/lang/String;

    .line 2252
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getExtraShouldSaveCapture()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsSaveCaptureImage:Z

    .line 2253
    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isQuickCapture()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mQuickCapture:Z

    .line 2254
    return-void
.end method

.method private prepareEffectProcessor(I)V
    .locals 3

    .line 3737
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-nez v0, :cond_0

    .line 3738
    new-instance v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;-><init>(Lcom/android/camera/ActivityBase;Z)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 3739
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 3740
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->prepareEffectRender(I)V

    .line 3741
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->getJpegQuality(Z)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setQuality(I)V

    .line 3743
    :cond_0
    return-void
.end method

.method private prepareMultiCapture()V
    .locals 2

    .line 1178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 1179
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 1180
    invoke-static {}, Lcom/android/camera/Util;->clearMemoryLimit()V

    .line 1181
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareNormalCapture()V

    .line 1182
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-static {}, Lcom/android/camera2/CameraCapabilities;->getBurstShootCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 1183
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1185
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->is3ALocked()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1186
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onShutter()V

    .line 1188
    :cond_0
    return-void
.end method

.method private prepareNormalCapture()V
    .locals 5

    .line 1100
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "prepareNormalCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1101
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isNeedFlashOn()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->initFlashAutoStateForTrack(Z)V

    .line 1102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    .line 1103
    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    .line 1104
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 1105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    .line 1106
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v1, v2}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackCaptureTimeStart(ZI)V

    .line 1107
    iget-wide v1, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    iput-wide v1, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    .line 1108
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 1111
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {v1, v2}, Lcom/android/camera/Util;->getJpegRotation(II)I

    move-result v1

    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    .line 1112
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "prepareNormalCapture: mOrientation = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", mJpegRotation = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1113
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setJpegRotation(I)V

    .line 1116
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v1

    .line 1117
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v2, v1}, Lcom/android/camera2/Camera2Proxy;->setGpsLocation(Landroid/location/Location;)V

    .line 1118
    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    .line 1121
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFrontMirror()V

    .line 1125
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 1127
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateShotDetermine()V

    .line 1129
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    if-eqz v1, :cond_0

    .line 1130
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1131
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1130
    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setShotSavePath(Ljava/lang/String;)V

    .line 1135
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setWaterMark()V

    .line 1136
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setPictureOrientation()V

    .line 1139
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegQuality()V

    .line 1142
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateAlgorithmName()V

    .line 1145
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->needShowThumbProgressImmediately()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1146
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateThumbProgress(Z)V

    .line 1150
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareSuperNight()V

    .line 1151
    return-void
.end method

.method private prepareSuperNight()V
    .locals 2

    .line 1191
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xad

    if-eq v0, v1, :cond_0

    .line 1192
    return-void

    .line 1195
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    .line 1196
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 1197
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPrepare()V

    .line 1198
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onStart()V

    .line 1200
    const/16 v0, 0x12c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x7d0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$7;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$7;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 1201
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->flatMap(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    .line 1207
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$6;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$6;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 1208
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    .line 1242
    return-void
.end method

.method private previewWhenSessionSuccess()V
    .locals 1

    .line 2565
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2567
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    .line 2568
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_ON_PREVIEW_SUCCESS:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2569
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2570
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_MANUALLY:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2572
    :cond_0
    return-void
.end method

.method private releaseEffectProcessor()V
    .locals 1

    .line 4925
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-eqz v0, :cond_0

    .line 4926
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->releaseIfNeeded()V

    .line 4927
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 4929
    :cond_0
    return-void
.end method

.method private resetAiSceneInHdrOrFlashOn()V
    .locals 2

    .line 5630
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isResetFromMutex:Z

    if-nez v0, :cond_3

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    if-nez v0, :cond_0

    goto :goto_0

    .line 5635
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 5640
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$29;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$29;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 5648
    :cond_2
    return-void

    .line 5632
    :cond_3
    :goto_0
    return-void
.end method

.method private resetAsdSceneInHdrOrFlashChange()V
    .locals 2

    .line 5651
    invoke-static {}, Lcom/mi/config/b;->hL()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 5656
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAsdScene:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_1

    .line 5657
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$30;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$30;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 5664
    :cond_1
    return-void

    .line 5653
    :cond_2
    :goto_0
    return-void
.end method

.method private resetGradienter()V
    .locals 2

    .line 4900
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4901
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/SensorStateManager;->setGradienterEnabled(Z)V

    .line 4903
    :cond_0
    return-void
.end method

.method private resetScreenOn()V
    .locals 2

    .line 4906
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 4907
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 4908
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 4910
    :cond_0
    return-void
.end method

.method private resumePreviewInWorkThread()V
    .locals 1

    .line 2662
    const/4 v0, 0x0

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 2663
    return-void
.end method

.method private setAiSceneEffect(I)V
    .locals 4

    .line 3672
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAiSceneEffect: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3674
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fh()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x19

    if-ne p1, v0, :cond_0

    .line 3676
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "supportAi30: AI 3.0 back camera in HUMAN SCENE not apply filter!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3677
    return-void

    .line 3679
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3680
    :cond_1
    if-eqz p1, :cond_2

    .line 3681
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "setAiSceneEffect: front camera or portrait mode nonsupport!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3682
    return-void

    .line 3683
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result v0

    if-eqz v0, :cond_3

    .line 3685
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "setAiSceneEffect: scene = 0 but portrait lighting is on..."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3686
    return-void

    .line 3691
    :cond_3
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->getFilterInfo(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 3692
    if-ltz p1, :cond_8

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le p1, v2, :cond_4

    goto :goto_1

    .line 3698
    :cond_4
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v2

    .line 3699
    invoke-static {v2}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v3

    .line 3700
    if-eq v3, v1, :cond_5

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v2, v1, :cond_5

    .line 3701
    return-void

    .line 3703
    :cond_5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/effect/FilterInfo;

    invoke-virtual {p1}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result p1

    .line 3705
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/EffectController;->setAiSceneEffect(I)V

    .line 3706
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq p1, v0, :cond_6

    const/4 v0, 0x1

    goto :goto_0

    :cond_6
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mHasAiSceneFilterEffect:Z

    .line 3708
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 3709
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 3711
    :cond_7
    return-void

    .line 3693
    :cond_8
    :goto_1
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "setAiSceneEffect: scene unknown!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3694
    return-void
.end method

.method private setEffectFilter(I)V
    .locals 3

    .line 3659
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setEffectFilter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3660
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/effect/EffectController;->setEffect(I)V

    .line 3662
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-eqz v0, :cond_0

    .line 3663
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->setFilterId(I)V

    .line 3666
    :cond_0
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3667
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 3669
    :cond_1
    return-void
.end method

.method private setLightingEffect()V
    .locals 4

    .line 3715
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 3716
    invoke-static {v0}, Lcom/android/camera/effect/FilterInfo;->getCategory(I)I

    move-result v1

    .line 3717
    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v0, v1, :cond_0

    .line 3718
    return-void

    .line 3721
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result v0

    .line 3723
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setLightingEffect: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3726
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/EffectController;->getFilterInfo(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 3728
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/FilterInfo;

    invoke-virtual {v0}, Lcom/android/camera/effect/FilterInfo;->getId()I

    move-result v0

    .line 3729
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/EffectController;->setLightingEffect(I)V

    .line 3731
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3732
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 3734
    :cond_1
    return-void
.end method

.method private setOrientation(II)V
    .locals 2

    .line 4522
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 4523
    return-void

    .line 4526
    :cond_0
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    .line 4527
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    .line 4528
    invoke-static {v0, v1}, Lcom/android/camera/Util;->getShootOrientation(Landroid/app/Activity;I)I

    move-result v0

    .line 4527
    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setOrientation(I)V

    .line 4529
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->checkActivityOrientation()V

    .line 4533
    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    if-eq p1, p2, :cond_1

    .line 4534
    iput p2, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    .line 4535
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setOrientationParameter()V

    .line 4537
    :cond_1
    return-void
.end method

.method private setOrientationParameter()V
    .locals 3

    .line 4540
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeparted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4541
    return-void

    .line 4543
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 4544
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 4545
    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x23

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    goto :goto_0

    .line 4547
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 4550
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-eqz v0, :cond_3

    .line 4551
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->setOrientationHint(I)V

    .line 4553
    :cond_3
    return-void
.end method

.method private setPictureOrientation()V
    .locals 2

    .line 4477
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isDeviceLying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    :goto_0
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    .line 4478
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    :goto_1
    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    .line 4479
    return-void
.end method

.method private setPortraitSuccessHintVisible(I)V
    .locals 2

    .line 5283
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5284
    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 5285
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->setPortraitHintVisible(I)V

    .line 5286
    return-void
.end method

.method private setSceneMode(Ljava/lang/String;)Z
    .locals 4

    .line 4422
    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 4423
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedSceneModes()[I

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4424
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sceneMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4425
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setSceneMode(I)V

    .line 4426
    const/4 p1, 0x1

    return p1

    .line 4428
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private setVideoSize(II)V
    .locals 1

    .line 657
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    .line 658
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-direct {v0, p1, p2}, Lcom/android/camera/CameraSize;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mVideoSize:Lcom/android/camera/CameraSize;

    goto :goto_0

    .line 660
    :cond_0
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-direct {v0, p2, p1}, Lcom/android/camera/CameraSize;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 662
    :goto_0
    return-void
.end method

.method private setWaterMark()V
    .locals 3

    .line 4483
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v2, 0xa5

    if-eq v0, v2, :cond_3

    .line 4485
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4486
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-ne v0, v2, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mHasAiSceneFilterEffect:Z

    if-nez v0, :cond_3

    .line 4488
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4489
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fe()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 4494
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 4495
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    goto :goto_0

    .line 4497
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 4499
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4500
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 4501
    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCaptureWaterMarkStr:Ljava/lang/String;

    .line 4502
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCaptureWaterMarkStr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWatermarkValue(Ljava/lang/String;)V

    goto :goto_1

    .line 4504
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCaptureWaterMarkStr:Ljava/lang/String;

    .line 4505
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 4507
    :goto_1
    return-void

    .line 4490
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDualCamWaterMarkEnable(Z)V

    .line 4491
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setTimeWaterMarkEnable(Z)V

    .line 4492
    return-void
.end method

.method private shouldApplyNormalWideLDC()Z
    .locals 3

    .line 4339
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldNormalWideLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4340
    return v1

    .line 4342
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 4344
    return v1

    .line 4346
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4347
    return v1

    .line 4349
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4350
    return v1

    .line 4352
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->isNormalWideLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private shouldApplyUltraWideLDC()Z
    .locals 3

    .line 4363
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->shouldUltraWideLDCBeVisibleInMode(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4364
    return v1

    .line 4366
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mActualCameraId:I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getUltraWideCameraId()I

    move-result v2

    if-eq v0, v2, :cond_1

    .line 4368
    return v1

    .line 4370
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraWideLDCEnabled()Z

    move-result v0

    return v0
.end method

.method private shouldChangeAiScene(I)Z
    .locals 6

    .line 5615
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 5620
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentDetectedScene:I

    if-eq v0, p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x12c

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    .line 5621
    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentDetectedScene:I

    .line 5622
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mLastChangeSceneTime:J

    .line 5623
    const/4 p1, 0x1

    return p1

    .line 5626
    :cond_1
    return v1

    .line 5616
    :cond_2
    :goto_0
    return v1
.end method

.method private shouldDoMultiFrameCapture()Z
    .locals 4

    .line 3580
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mShouldDoMFNR:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    .line 3582
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3583
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 3584
    :goto_1
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldDoMultiFrameCapture: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3585
    return v0
.end method

.method private showMoonMode()Z
    .locals 3

    .line 5556
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5557
    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 5558
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 5559
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    .line 5560
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMoonModeSelector(I)V

    .line 5562
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateMoonNight()V

    .line 5563
    return v2

    .line 5565
    :cond_0
    return v1
.end method

.method private showPostCaptureAlert()V
    .locals 2

    .line 3090
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 3091
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 3093
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->stopFaceDetection(Z)V

    .line 3094
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->pausePreview()V

    .line 3096
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEffectViewVisible(Z)V

    .line 3100
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 3102
    const/4 v1, 0x6

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    .line 3107
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetMetaDataManager()V

    .line 3108
    return-void
.end method

.method private startCount(II)V
    .locals 2

    .line 1725
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->checkShutterCondition()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1726
    return-void

    .line 1728
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/camera/module/Camera2Module;->setTriggerMode(I)V

    .line 1730
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1731
    sget-object p2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startCount: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1733
    const-wide/16 v0, 0x1

    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v1, p2}, Lio/reactivex/Observable;->interval(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/Observable;

    move-result-object p2

    int-to-long v0, p1

    invoke-virtual {p2, v0, v1}, Lio/reactivex/Observable;->take(J)Lio/reactivex/Observable;

    move-result-object p2

    .line 1734
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p2

    new-instance v0, Lcom/android/camera/module/Camera2Module$9;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/module/Camera2Module$9;-><init>(Lcom/android/camera/module/Camera2Module;I)V

    .line 1735
    invoke-virtual {p2, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 1777
    return-void
.end method

.method private startLensActivity()V
    .locals 3

    .line 5057
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5058
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    if-nez v0, :cond_0

    .line 5059
    return-void

    .line 5061
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mLensStatus:I

    if-eqz v0, :cond_1

    .line 5062
    return-void

    .line 5064
    :cond_1
    const/4 v0, 0x0

    .line 5065
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v2, v0}, Lcom/google/lens/sdk/LensApi;->launchLensActivity(Landroid/app/Activity;I)V

    .line 5066
    goto :goto_0

    .line 5067
    :cond_2
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "start ai lens"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5069
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 5070
    const-string v1, "android.media.action.XIAOAI_CONTROL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 5071
    const-string v1, "com.xiaomi.lens"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 5072
    const-string v1, "preview_width"

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5073
    const-string v1, "preview_height"

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 5074
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 5075
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    const/high16 v1, 0x7f050000

    const v2, 0x7f050001

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/Camera;->overridePendingTransition(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5078
    goto :goto_0

    .line 5076
    :catch_0
    move-exception v0

    .line 5077
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v2, "onClick: occur a exception"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 5080
    :goto_0
    return-void
.end method

.method private startLiveShotAnimation()V
    .locals 3

    .line 665
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorderStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 666
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v1, :cond_0

    .line 667
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v2, Lcom/android/camera/module/Camera2Module$4;

    invoke-direct {v2, p0}, Lcom/android/camera/module/Camera2Module$4;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 678
    :cond_0
    monitor-exit v0

    .line 679
    return-void

    .line 678
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private startNormalCapture(I)V
    .locals 3

    .line 1154
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startNormalCapture mode -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1155
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareNormalCapture()V

    .line 1156
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelSessionEnable()Z

    move-result p1

    if-nez p1, :cond_0

    .line 1157
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1, p0, v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->captureGroupShotPictures(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;ILandroid/content/Context;)V

    goto :goto_0

    .line 1161
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v0, 0x32

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->calculateTimeout(I)J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 1162
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/android/camera2/Camera2Proxy;->takePicture(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 1164
    :goto_0
    return-void
.end method

.method private stopMultiSnap()V
    .locals 10

    .line 553
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "stopMultiSnap: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x31

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 555
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_0

    .line 556
    return-void

    .line 558
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    .line 559
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    .line 562
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->captureAbortBurst()V

    .line 566
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mReceivedJpegCallbackNum:I

    .line 567
    move v4, v1

    goto :goto_0

    .line 566
    :cond_1
    nop

    .line 567
    move v4, v2

    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v1

    .line 568
    xor-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v4, v5}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 569
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    if-eqz v1, :cond_2

    move v6, v2

    goto :goto_1

    :cond_2
    move v6, v0

    :goto_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getCurrentAiSceneName()Ljava/lang/String;

    move-result-object v7

    iget-boolean v8, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    iget-boolean v9, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    move-object v3, p0

    invoke-virtual/range {v3 .. v9}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    .line 571
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 573
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 574
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x30

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 575
    return-void
.end method

.method private trackAISceneChanged(II)V
    .locals 1

    .line 5668
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackAISceneChanged(IILandroid/content/res/Resources;)V

    .line 5669
    return-void
.end method

.method private trackBeautyInfo(IZLcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    .line 5761
    nop

    .line 5762
    if-eqz p2, :cond_0

    const-string p2, "\u524d\u6444"

    goto :goto_0

    :cond_0
    const-string p2, "\u540e\u6444"

    .line 5761
    :goto_0
    invoke-static {p1, p2, p3}, Lcom/android/camera/statistic/CameraStatUtil;->trackBeautyInfo(ILjava/lang/String;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 5764
    return-void
.end method

.method private trackManualInfo(I)V
    .locals 4

    .line 5732
    const-string v0, "pref_camera_whitebalance_key"

    .line 5733
    const v1, 0x7f090064

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 5732
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 5734
    const-string v1, "pref_qc_camera_exposuretime_key"

    .line 5735
    const v2, 0x7f090136

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 5734
    invoke-direct {p0, v1, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 5736
    const-string v2, "pref_qc_camera_iso_key"

    .line 5737
    const v3, 0x7f0900aa

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 5736
    invoke-direct {p0, v2, v3}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 5738
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackPictureTakenInManual(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 5739
    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWideManualTaken(I)V

    .line 5740
    return-void
.end method

.method private unlockAEAF()V
    .locals 2

    .line 4637
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "unlockAEAF"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4638
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 4639
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAeLockSupported:Z

    if-eqz v1, :cond_0

    .line 4640
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->unlockExposure()V

    .line 4642
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v1, :cond_1

    .line 4643
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 4645
    :cond_1
    return-void
.end method

.method private updateAiScene()V
    .locals 3

    .line 733
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFunctionParseAiScene:Lcom/android/camera/module/loader/FunctionParseAiScene;

    if-eqz v0, :cond_0

    .line 734
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFunctionParseAiScene:Lcom/android/camera/module/loader/FunctionParseAiScene;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/FunctionParseAiScene;->resetScene()V

    .line 736
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 737
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAiSceneOpen()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    .line 738
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 739
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    .line 742
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 744
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-nez v1, :cond_4

    .line 745
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setCameraAI30(Z)V

    .line 747
    :cond_4
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 748
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v0, :cond_5

    .line 749
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x12c

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setASDPeriod(I)V

    goto :goto_0

    .line 751
    :cond_5
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->hideSceneSelector()V

    .line 752
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateHDRPreference()V

    .line 753
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateFlashPreference()V

    .line 754
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 756
    :goto_0
    return-void
.end method

.method private updateAlgorithmName()V
    .locals 1

    .line 2889
    nop

    .line 2890
    invoke-static {}, Lcom/mi/config/b;->hT()Z

    move-result v0

    if-nez v0, :cond_3

    .line 2891
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isBokehEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2892
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fM()I

    move-result v0

    .line 2893
    if-lez v0, :cond_0

    .line 2894
    const-string v0, "soft-portrait-enc"

    goto :goto_0

    .line 2896
    :cond_0
    const-string v0, "soft-portrait"

    .line 2898
    :goto_0
    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2899
    const-string v0, "portrait"

    goto :goto_1

    .line 2901
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->getAlgorithmName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 2904
    :cond_3
    const/4 v0, 0x0

    :goto_1
    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAlgorithmName:Ljava/lang/String;

    .line 2905
    return-void
.end method

.method private updateBeauty()V
    .locals 6

    .line 3972
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa5

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    .line 3975
    return-void

    .line 3978
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    if-nez v0, :cond_1

    .line 3979
    new-instance v0, Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/BeautyValues;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 3984
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3986
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    .line 3988
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->isClosed(I)Z

    move-result v0

    .line 3989
    if-nez v0, :cond_2

    .line 3990
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->initBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;Z)V

    .line 3992
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/16 v1, 0x19

    if-ne v0, v1, :cond_2

    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v1, v1, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3994
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3995
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 3996
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "Human scene mode detected, auto set beauty level from %s to %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    sget-object v5, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v5, v5, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4003
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupportBeautyBody()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4004
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->initBeautyBody(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 4007
    :cond_3
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateBeauty(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4008
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 4009
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceAgeAnalyze()V

    .line 4010
    return-void
.end method

.method private updateBokeh()V
    .locals 2

    .line 759
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 760
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 761
    invoke-static {}, Lcom/mi/config/b;->ht()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 762
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setBokeh(Z)V

    .line 763
    return-void
.end method

.method private updateContrast()V
    .locals 2

    .line 4377
    invoke-static {}, Lcom/android/camera/CameraSettings;->getContrast()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 4378
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setContrast(I)V

    .line 4379
    return-void
.end method

.method private updateDecodePreview()V
    .locals 3

    .line 4398
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->fR()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4400
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4401
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->width:I

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v2, v2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/android/zxing/PreviewDecodeManager;->setPreviewSize(II)V

    .line 4403
    :cond_1
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateDecodePreview: PreviewDecodeManager mPreviewSize = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4405
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/PreviewDecodeManager;->getPreviewCallback()Lcom/android/camera2/Camera2Proxy$PreviewCallback;

    move-result-object v0

    .line 4406
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 4407
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/PreviewDecodeManager;->startDecode()V

    .line 4409
    :cond_2
    return-void
.end method

.method private updateDeviceOrientation()V
    .locals 2

    .line 4418
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setDeviceOrientation(I)V

    .line 4419
    return-void
.end method

.method private updateExposureTime()V
    .locals 4

    .line 4286
    const-string v0, "pref_qc_camera_exposuretime_key"

    .line 4287
    const v1, 0x7f090136

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 4286
    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4288
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/android/camera2/Camera2Proxy;->setExposureTime(J)V

    .line 4289
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateManualEvAdjust()V

    .line 4290
    return-void
.end method

.method private updateEyeLight()V
    .locals 4

    .line 3843
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->ft()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3844
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getEyeLightType()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "-1"

    .line 3846
    :goto_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    .line 3847
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 3848
    if-eqz v1, :cond_2

    .line 3849
    const-string v2, "-1"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3850
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v3, Lcom/android/camera/module/Camera2Module$18;

    invoke-direct {v3, p0, v1}, Lcom/android/camera/module/Camera2Module$18;-><init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/protocol/ModeProtocol$TopAlert;)V

    invoke-virtual {v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 3857
    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v3, Lcom/android/camera/module/Camera2Module$19;

    invoke-direct {v3, p0, v1}, Lcom/android/camera/module/Camera2Module$19;-><init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/protocol/ModeProtocol$TopAlert;)V

    invoke-virtual {v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 3866
    :cond_2
    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 3867
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setEyeLight(I)V

    .line 3869
    :cond_3
    return-void
.end method

.method private updateFNumber()V
    .locals 2

    .line 3872
    invoke-static {}, Lcom/android/camera/CameraSettings;->readFNumber()Ljava/lang/String;

    move-result-object v0

    .line 3873
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFNumber(Ljava/lang/String;)V

    .line 3874
    return-void
.end method

.method private updateFace()V
    .locals 6

    .line 4079
    nop

    .line 4080
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 4082
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4083
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4084
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4085
    invoke-static {}, Lcom/android/camera/CameraSettings;->showGenderAge()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 4088
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v3, "pref_camera_facedetection_key"

    .line 4090
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0f0006

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    .line 4088
    invoke-virtual {v0, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 4091
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 4092
    :cond_2
    nop

    .line 4096
    move v3, v1

    goto :goto_2

    .line 4086
    :cond_3
    :goto_0
    nop

    .line 4096
    move v0, v2

    move v3, v0

    goto :goto_2

    .line 4081
    :cond_4
    :goto_1
    nop

    .line 4096
    move v0, v1

    :cond_5
    move v3, v2

    :goto_2
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v4, :cond_8

    .line 4097
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_7

    if-nez v3, :cond_6

    goto :goto_3

    :cond_6
    move v3, v1

    goto :goto_4

    :cond_7
    :goto_3
    move v3, v2

    :goto_4
    invoke-interface {v4, v3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setSkipDrawFace(Z)V

    .line 4099
    :cond_8
    if-eqz v0, :cond_9

    .line 4100
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-nez v0, :cond_a

    .line 4101
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    .line 4102
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startFaceDetection()V

    goto :goto_5

    .line 4105
    :cond_9
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_a

    .line 4106
    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->stopFaceDetection(Z)V

    .line 4107
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    .line 4110
    :cond_a
    :goto_5
    return-void
.end method

.method private updateFaceAgeAnalyze()V
    .locals 3

    .line 774
    nop

    .line 775
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_show_gender_age_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsGenderAgeOn:Z

    .line 776
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsGenderAgeOn:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 777
    goto :goto_0

    .line 778
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    if-eqz v0, :cond_1

    .line 779
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyCloseValue()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v2, v2, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 781
    xor-int/2addr v1, v0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceAgeAnalyze(Z)V

    .line 782
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 783
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 785
    :cond_2
    return-void
.end method

.method private updateFaceScore()V
    .locals 2

    .line 766
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMagicMirrorOn:Z

    .line 767
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsMagicMirrorOn:Z

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFaceScore(Z)V

    .line 768
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 769
    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->prepareEffectProcessor(I)V

    .line 771
    :cond_0
    return-void
.end method

.method private updateFilter()V
    .locals 1

    .line 3654
    invoke-static {}, Lcom/android/camera/CameraSettings;->getShaderEffect()I

    move-result v0

    .line 3655
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->setEffectFilter(I)V

    .line 3656
    return-void
.end method

.method private updateFocusArea()V
    .locals 4

    .line 3878
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 3899
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCropRegion()Landroid/graphics/Rect;

    move-result-object v0

    .line 3900
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 3901
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 3902
    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 3901
    :goto_0
    invoke-virtual {v2, v3}, Lcom/android/camera/SensorStateManager;->setFocusSensorEnabled(Z)V

    .line 3904
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getMeteringAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera2/Camera2Proxy;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    .line 3906
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-eqz v2, :cond_2

    .line 3907
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v3, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->getFocusAreas(Landroid/graphics/Rect;Landroid/graphics/Rect;)[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/android/camera2/Camera2Proxy;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V

    goto :goto_1

    .line 3909
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 3911
    :goto_1
    return-void

    .line 3879
    :cond_3
    :goto_2
    return-void
.end method

.method private updateFocusMode()V
    .locals 2

    .line 4018
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    if-eqz v0, :cond_0

    .line 4020
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    const-string v1, "manual"

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 4022
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4024
    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setFocusMode(Ljava/lang/String;)V

    .line 4025
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFocusModeSwitching()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4026
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFocusModeSwitching(Z)V

    .line 4027
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocusStateIfNeeded()V

    .line 4034
    :cond_1
    const-string v1, "manual"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4035
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v0

    .line 4036
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getMinimumFocusDistance()F

    move-result v1

    .line 4038
    int-to-float v0, v0

    mul-float/2addr v1, v0

    const/high16 v0, 0x447a0000    # 1000.0f

    div-float/2addr v1, v0

    .line 4040
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    if-eqz v0, :cond_2

    .line 4041
    const/4 v1, 0x0

    .line 4043
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setFocusDistance(F)V

    .line 4048
    :cond_3
    return-void
.end method

.method private updateFpsRange()V
    .locals 7

    .line 4057
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    .line 4058
    const/4 v1, 0x0

    aget-object v2, v0, v1

    .line 4059
    array-length v3, v0

    :goto_0
    if-ge v1, v3, :cond_2

    aget-object v4, v0, v1

    .line 4060
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_0

    .line 4061
    goto :goto_1

    .line 4062
    :cond_0
    invoke-virtual {v2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v5, v6, :cond_1

    .line 4063
    invoke-virtual {v2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 4064
    nop

    .line 4059
    :goto_1
    move-object v2, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4068
    :cond_2
    sget-boolean v0, Lcom/mi/config/b;->qU:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4069
    new-instance v0, Landroid/util/Range;

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 4073
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFpsRange(Landroid/util/Range;)V

    .line 4074
    return-void

    .line 4071
    :cond_3
    return-void
.end method

.method private updateFrontMirror()V
    .locals 2

    .line 789
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 790
    const/4 v0, 0x0

    goto :goto_0

    .line 792
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result v0

    .line 794
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setFrontMirror(Z)V

    .line 795
    return-void
.end method

.method private updateHDR(Ljava/lang/String;)V
    .locals 3

    .line 3814
    const-string v0, "auto"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 3816
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    .line 3818
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->getMutexHdrMode(Ljava/lang/String;)I

    move-result p1

    .line 3819
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 3821
    if-eqz p1, :cond_1

    .line 3822
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2, p1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    goto :goto_0

    .line 3823
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p1}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 3824
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetMutexModeManually()V

    .line 3828
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->isTriggerQcfaModeChange(ZZ)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 3829
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 3831
    :cond_3
    return-void
.end method

.method private updateISO()V
    .locals 3

    .line 4273
    const v0, 0x7f0900aa

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 4274
    const-string v1, "pref_qc_camera_iso_key"

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4276
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4278
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-static {v1, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->getMaxIso()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setISO(I)V

    goto :goto_0

    .line 4280
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setISO(I)V

    .line 4282
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateManualEvAdjust()V

    .line 4283
    return-void
.end method

.method private updateJpegQuality()V
    .locals 2

    .line 4113
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->getJpegQuality(Z)I

    move-result v0

    .line 4114
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegQuality(I)V

    .line 4115
    return-void
.end method

.method private updateJpegThumbnailSize()V
    .locals 4

    .line 4412
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getJpegThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 4413
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V

    .line 4414
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "thumbnailSize="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4415
    return-void
.end method

.method private updateLiveShot()V
    .locals 2

    .line 646
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_1

    .line 648
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 649
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startLiveShot()V

    goto :goto_0

    .line 651
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->stopLiveShot(Z)V

    .line 654
    :cond_1
    :goto_0
    return-void
.end method

.method private updateMfnr(Z)V
    .locals 3

    .line 4151
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/4 v1, 0x0

    const/16 v2, 0xa7

    if-eq v0, v2, :cond_3

    sget-boolean v0, Lcom/mi/config/b;->qT:Z

    if-eqz v0, :cond_0

    .line 4152
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    .line 4153
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4154
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-nez v0, :cond_3

    if-eqz p1, :cond_3

    .line 4156
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 4157
    invoke-static {}, Lcom/mi/config/b;->hN()Z

    move-result p1

    if-eqz p1, :cond_3

    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    const v0, 0x8005

    if-ne p1, v0, :cond_3

    .line 4159
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->eV()Z

    move-result p1

    if-nez p1, :cond_2

    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_2

    .line 4161
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isUltraWideBackCamera()Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const/4 p1, 0x1

    goto :goto_0

    .line 4162
    :cond_3
    move p1, v1

    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isUseSwMfnr()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4163
    nop

    .line 4165
    move p1, v1

    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_5

    .line 4166
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMfnr to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4167
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setMfnr(Z)V

    .line 4169
    :cond_5
    return-void
.end method

.method private updateMute()V
    .locals 0

    .line 4143
    return-void
.end method

.method private updateNormalWideLDC()V
    .locals 2

    .line 4335
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->shouldApplyNormalWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setNormalWideLDC(Z)V

    .line 4336
    return-void
.end method

.method private updateOIS()V
    .locals 8

    .line 4118
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v3

    if-lez v0, :cond_0

    .line 4121
    move v0, v2

    goto :goto_0

    .line 4118
    :cond_0
    nop

    .line 4121
    move v0, v1

    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v3

    .line 4122
    nop

    .line 4124
    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v5, 0xa7

    if-ne v4, v5, :cond_1

    .line 4125
    const-string v4, "pref_qc_camera_exposuretime_key"

    const v5, 0x7f090136

    .line 4126
    invoke-virtual {p0, v5}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 4125
    invoke-direct {p0, v4, v5}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 4127
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/32 v6, 0x3b9aca00

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 4128
    nop

    .line 4132
    move v4, v2

    goto :goto_1

    :cond_1
    move v4, v1

    :goto_1
    if-nez v0, :cond_3

    if-nez v3, :cond_3

    if-eqz v4, :cond_2

    goto :goto_2

    .line 4137
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    goto :goto_3

    .line 4135
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setEnableOIS(Z)V

    .line 4139
    :goto_3
    return-void
.end method

.method private updatePictureAndPreviewSize()V
    .locals 9

    .line 3590
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    const/16 v1, 0x100

    const/16 v2, 0x23

    if-eqz v0, :cond_0

    .line 3591
    nop

    .line 3596
    move v0, v2

    goto :goto_0

    .line 3593
    :cond_0
    nop

    .line 3596
    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 3597
    invoke-virtual {v3, v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v0

    .line 3598
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 3599
    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    .line 3601
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    const-class v4, Landroid/graphics/SurfaceTexture;

    .line 3602
    invoke-virtual {v3, v4}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    .line 3603
    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    iget v6, v0, Lcom/android/camera/CameraSize;->width:I

    iget v7, v0, Lcom/android/camera/CameraSize;->height:I

    .line 3604
    invoke-static {v6, v7}, Lcom/android/camera/CameraSettings;->getPreviewAspectRatio(II)F

    move-result v6

    float-to-double v6, v6

    .line 3603
    invoke-static {v4, v5, v3, v6, v7}, Lcom/android/camera/Util;->getOptimalPreviewSize(IILjava/util/List;D)Lcom/android/camera/CameraSize;

    move-result-object v3

    iput-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 3605
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v3, v4}, Lcom/android/camera2/Camera2Proxy;->setPreviewSize(Lcom/android/camera/CameraSize;)V

    .line 3606
    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v3, v2}, Lcom/android/camera2/Camera2Proxy;->setPreviewFormat(I)V

    .line 3608
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz v2, :cond_4

    .line 3610
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 3611
    invoke-virtual {v2, v1}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(I)Ljava/util/List;

    move-result-object v1

    .line 3612
    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v6, 0xa5

    if-ne v2, v6, :cond_2

    .line 3613
    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->getBestSquareSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    .line 3614
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    if-nez v1, :cond_3

    .line 3615
    iget v1, v0, Lcom/android/camera/CameraSize;->width:I

    iget v2, v0, Lcom/android/camera/CameraSize;->height:I

    if-le v1, v2, :cond_1

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    goto :goto_1

    :cond_1
    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    .line 3616
    :goto_1
    new-instance v1, Ljava/lang/RuntimeException;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    new-array v5, v5, [Ljava/lang/Object;

    .line 3617
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v3

    .line 3616
    const-string v0, "size %dx%d is not supported!"

    invoke-static {v2, v0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 3620
    :cond_2
    invoke-static {v1}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    .line 3622
    :cond_3
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "outputSize: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3625
    :cond_4
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "updateSize: %dx%d %dx%d"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    iget v8, v0, Lcom/android/camera/CameraSize;->width:I

    .line 3626
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    .line 3627
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v7, v5

    const/4 v0, 0x3

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->height:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v7, v0

    .line 3625
    invoke-static {v2, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3629
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->updateCameraScreenNailSize(II)V

    .line 3631
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->checkDisplayOrientation()V

    .line 3632
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->setVideoSize(II)V

    .line 3633
    return-void
.end method

.method private updatePortraitLighting()V
    .locals 2

    .line 3834
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 3835
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsPortraitLightingOn:Z

    .line 3836
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 3837
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setPortraitLighting(I)V

    .line 3839
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->setLightingEffect()V

    .line 3840
    return-void
.end method

.method private updateSaturation()V
    .locals 2

    .line 4385
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSaturation()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 4386
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSaturation(I)V

    .line 4387
    return-void
.end method

.method private updateScene()V
    .locals 3

    .line 3914
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 3915
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isSceneHdr()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3916
    const-string v0, "18"

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    goto :goto_0

    .line 3917
    :cond_0
    const-string v1, "pref_camera_scenemode_setting_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 3918
    const-string v0, "0"

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    goto :goto_0

    .line 3920
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningSceneValue()Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningSceneValue;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    .line 3922
    :goto_0
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sceneMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " mutexMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->getMutexMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3923
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->setSceneMode(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 3924
    const-string v0, "0"

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    .line 3926
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$20;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$20;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 3933
    const-string v0, "0"

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "18"

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 3934
    return-void

    .line 3936
    :cond_3
    return-void
.end method

.method private updateSceneModeUI()V
    .locals 7

    .line 3939
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_scenemode_setting_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 3940
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xac

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    .line 3941
    const/4 v2, 0x2

    if-eqz v0, :cond_2

    .line 3943
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    const/16 v3, 0xa3

    const-string v4, "off"

    .line 3944
    invoke-virtual {v0, v3, v4}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->setComponentValue(ILjava/lang/String;)V

    .line 3946
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSceneMode:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3948
    if-eqz v1, :cond_1

    .line 3949
    const/4 v3, 0x1

    new-array v4, v3, [I

    const/16 v5, 0xc2

    const/4 v6, 0x0

    aput v5, v4, v6

    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->disableMenuItem([I)V

    .line 3950
    const/16 v4, 0xc1

    if-eqz v0, :cond_0

    .line 3951
    new-array v0, v3, [I

    aput v4, v0, v6

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->disableMenuItem([I)V

    goto :goto_0

    .line 3953
    :cond_0
    new-array v0, v3, [I

    aput v4, v0, v6

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->enableMenuItem([I)V

    .line 3955
    :goto_0
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->hideExtraMenu()V

    .line 3957
    :cond_1
    goto :goto_1

    .line 3958
    :cond_2
    if-eqz v1, :cond_3

    .line 3959
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->enableMenuItem([I)V

    .line 3962
    :cond_3
    :goto_1
    new-array v0, v2, [I

    fill-array-data v0, :array_1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceInWorkThread([I)V

    .line 3963
    return-void

    nop

    :array_0
    .array-data 4
        0xc1
        0xc2
    .end array-data

    :array_1
    .array-data 4
        0xb
        0xa
    .end array-data
.end method

.method private updateSharpness()V
    .locals 2

    .line 4393
    invoke-static {}, Lcom/android/camera/CameraSettings;->getSharpness()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 4394
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSharpness(I)V

    .line 4395
    return-void
.end method

.method private updateShotDetermine()V
    .locals 7

    .line 3513
    nop

    .line 3514
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xab

    const/4 v2, 0x0

    if-ne v0, v1, :cond_3

    .line 3515
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3517
    invoke-static {}, Lcom/mi/config/b;->hM()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3518
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->eZ()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    goto :goto_2

    .line 3520
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fa()Z

    move-result v0

    goto :goto_2

    .line 3525
    :cond_3
    :goto_1
    move v0, v2

    :goto_2
    iget-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    const/16 v4, 0x8

    if-eqz v3, :cond_5

    .line 3526
    if-eqz v0, :cond_4

    const/4 v0, -0x3

    .line 3564
    :goto_3
    move v4, v0

    goto/16 :goto_7

    .line 3526
    :cond_4
    const/4 v0, -0x2

    goto :goto_3

    .line 3529
    :cond_5
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    .line 3531
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v5, 0xa3

    const/4 v6, 0x5

    if-eq v3, v5, :cond_e

    const/16 v5, 0xa5

    if-eq v3, v5, :cond_e

    if-eq v3, v1, :cond_6

    .line 3533
    return-void

    .line 3546
    :cond_6
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelSessionEnable()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    .line 3547
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    if-eqz v1, :cond_c

    .line 3549
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->shouldDoMultiFrameCapture()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 3550
    goto :goto_7

    .line 3552
    :cond_7
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualFrontCamera()Z

    move-result v1

    if-nez v1, :cond_a

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualCamera()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_5

    .line 3555
    :cond_8
    if-eqz v0, :cond_9

    const/4 v0, 0x7

    goto :goto_3

    .line 3564
    :cond_9
    :goto_4
    move v4, v6

    goto :goto_7

    .line 3553
    :cond_a
    :goto_5
    if-eqz v0, :cond_b

    const/4 v0, 0x6

    goto :goto_3

    :cond_b
    goto :goto_4

    .line 3559
    :cond_c
    if-eqz v0, :cond_d

    const/4 v2, 0x2

    .line 3564
    :goto_6
    move v4, v2

    goto :goto_7

    .line 3559
    :cond_d
    goto :goto_6

    .line 3537
    :cond_e
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelSessionEnable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    .line 3538
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    if-nez v0, :cond_f

    .line 3539
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v4

    goto :goto_7

    .line 3542
    :cond_f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->shouldDoMultiFrameCapture()Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_7

    .line 3544
    :cond_10
    move v4, v6

    .line 3564
    :goto_7
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enableParallel="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " shotType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3565
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v4}, Lcom/android/camera2/Camera2Proxy;->setShotType(I)V

    .line 3566
    invoke-static {v4}, Lcom/xiaomi/camera/base/Constants;->isParallelEnabled(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    .line 3567
    return-void
.end method

.method private updateSuperResolution()V
    .locals 2

    .line 4224
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4225
    return-void

    .line 4229
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xad

    if-ne v0, v1, :cond_1

    .line 4230
    return-void

    .line 4235
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isUltraWideBackCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4236
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "SR force off for ultra wide camera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4237
    return-void

    .line 4240
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSREnable()Z

    move-result v0

    if-nez v0, :cond_3

    .line 4241
    return-void

    .line 4244
    :cond_3
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_5

    .line 4245
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_super_resolution_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 4246
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4247
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    goto :goto_0

    .line 4249
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_7

    .line 4250
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 4255
    :cond_5
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 4256
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isSuperResolution()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 4257
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    goto :goto_0

    .line 4260
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 4261
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    .line 4265
    :cond_7
    :goto_0
    return-void
.end method

.method private updateSwMfnr()V
    .locals 4

    .line 4218
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isUseSwMfnr()Z

    move-result v0

    .line 4219
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setSwMfnr to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4220
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSwMfnr(Z)V

    .line 4221
    return-void
.end method

.method private updateThumbProgress(Z)V
    .locals 2

    .line 5039
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    .line 5040
    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 5041
    if-eqz v0, :cond_0

    .line 5042
    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateLoading(Z)V

    .line 5044
    :cond_0
    return-void
.end method

.method private updateUltraWideLDC()V
    .locals 2

    .line 4359
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->shouldApplyUltraWideLDC()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setUltraWideLDC(Z)V

    .line 4360
    return-void
.end method

.method private updateWhiteBalance()V
    .locals 2

    .line 4268
    const-string v0, "pref_camera_whitebalance_key"

    const-string v1, "1"

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4269
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setAWBMode(Ljava/lang/String;)V

    .line 4270
    return-void
.end method

.method private updateZsl()V
    .locals 2

    .line 4146
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 4147
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setEnableZsl(Z)V

    .line 4148
    return-void
.end method


# virtual methods
.method public cancelFocus(Z)V
    .locals 1

    .line 401
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 402
    return-void

    .line 405
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 406
    return-void

    .line 409
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_2

    .line 410
    return-void

    .line 413
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    .line 414
    if-eqz p1, :cond_3

    .line 415
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setFocusMode(I)V

    .line 417
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->cancelFocus(I)V

    .line 420
    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result p1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    .line 421
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 423
    :cond_5
    return-void
.end method

.method public checkDisplayOrientation()V
    .locals 2

    .line 4557
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isCreated()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4558
    return-void

    .line 4560
    :cond_0
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->checkDisplayOrientation()V

    .line 4561
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_1

    .line 4562
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCameraDisplayOrientation(I)V

    .line 4565
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_2

    .line 4566
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mCameraDisplayOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setDisplayOrientation(I)V

    .line 4568
    :cond_2
    return-void
.end method

.method public closeCamera()V
    .locals 4

    .line 2261
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2262
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {}, Lcom/mi/config/b;->fR()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2263
    :cond_0
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/zxing/PreviewDecodeManager;->quit()V

    .line 2265
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v1, :cond_b

    .line 2267
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v1, :cond_2

    .line 2268
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mBurstDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2271
    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v1, :cond_3

    .line 2272
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v1}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 2275
    :cond_3
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v1, :cond_4

    .line 2276
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2279
    :cond_4
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v1, :cond_5

    .line 2280
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v1}, Lio/reactivex/FlowableEmitter;->onComplete()V

    .line 2282
    :cond_5
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v1, :cond_6

    .line 2283
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2285
    :cond_6
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v1, :cond_7

    .line 2286
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 2288
    :cond_7
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V

    .line 2289
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 2292
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 2296
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 2297
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 2298
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setASD(Z)V

    .line 2299
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    .line 2300
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v1

    if-nez v1, :cond_8

    invoke-static {}, Lcom/mi/config/b;->fR()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 2301
    :cond_8
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->stopPreviewCallback(Z)V

    .line 2304
    :cond_9
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-eqz v1, :cond_a

    .line 2305
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 2328
    :cond_a
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    .line 2330
    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 2333
    :cond_b
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v1, :cond_c

    .line 2334
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setAeAwbLock(Z)V

    .line 2335
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->destroy()V

    .line 2337
    :cond_c
    return-void
.end method

.method public varargs consumePreference([I)V
    .locals 3
    .param p1    # [I
        .annotation build Lcom/android/camera/constant/UpdateConstant$UpdateType;
        .end annotation
    .end param

    .line 3322
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 3323
    packed-switch v2, :pswitch_data_0

    .line 3501
    :pswitch_0
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

    .line 3499
    :pswitch_1
    goto/16 :goto_1

    .line 3491
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateLiveShot()V

    .line 3492
    goto/16 :goto_1

    .line 3495
    :pswitch_3
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFNumber()V

    .line 3496
    goto/16 :goto_1

    .line 3439
    :pswitch_4
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateUltraWideLDC()V

    .line 3440
    goto/16 :goto_1

    .line 3435
    :pswitch_5
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateNormalWideLDC()V

    .line 3436
    goto/16 :goto_1

    .line 3487
    :pswitch_6
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateEyeLight()V

    .line 3488
    goto/16 :goto_1

    .line 3326
    :pswitch_7
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateShotDetermine()V

    .line 3327
    goto/16 :goto_1

    .line 3483
    :pswitch_8
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updatePortraitLighting()V

    .line 3484
    goto/16 :goto_1

    .line 3403
    :pswitch_9
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSwMfnr()V

    .line 3404
    goto/16 :goto_1

    .line 3479
    :pswitch_a
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFrontMirror()V

    .line 3480
    goto/16 :goto_1

    .line 3471
    :pswitch_b
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceScore()V

    .line 3472
    goto/16 :goto_1

    .line 3467
    :pswitch_c
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFaceAgeAnalyze()V

    .line 3468
    goto/16 :goto_1

    .line 3463
    :pswitch_d
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBokeh()V

    .line 3464
    goto/16 :goto_1

    .line 3459
    :pswitch_e
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateAiScene()V

    .line 3460
    goto/16 :goto_1

    .line 3455
    :pswitch_f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateDeviceOrientation()V

    .line 3456
    goto/16 :goto_1

    .line 3399
    :pswitch_10
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 3400
    goto/16 :goto_1

    .line 3407
    :pswitch_11
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    .line 3408
    goto/16 :goto_1

    .line 3451
    :pswitch_12
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateExposureMeteringMode()V

    .line 3452
    goto/16 :goto_1

    .line 3447
    :pswitch_13
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSharpness()V

    .line 3448
    goto/16 :goto_1

    .line 3443
    :pswitch_14
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSaturation()V

    .line 3444
    goto/16 :goto_1

    .line 3431
    :pswitch_15
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateContrast()V

    .line 3432
    goto/16 :goto_1

    .line 3427
    :pswitch_16
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->focusCenter()V

    .line 3428
    goto/16 :goto_1

    .line 3423
    :pswitch_17
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getZoomValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->setZoomRatio(F)V

    .line 3424
    goto/16 :goto_1

    .line 3383
    :pswitch_18
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateDecodePreview()V

    .line 3384
    goto :goto_1

    .line 3395
    :pswitch_19
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateZsl()V

    .line 3396
    goto :goto_1

    .line 3391
    :pswitch_1a
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateMute()V

    .line 3392
    goto :goto_1

    .line 3387
    :pswitch_1b
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOIS()V

    .line 3388
    goto :goto_1

    .line 3371
    :pswitch_1c
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFpsRange()V

    .line 3372
    goto :goto_1

    .line 3419
    :pswitch_1d
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateExposureTime()V

    .line 3420
    goto :goto_1

    .line 3415
    :pswitch_1e
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateISO()V

    .line 3416
    goto :goto_1

    .line 3367
    :pswitch_1f
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFocusMode()V

    .line 3368
    goto :goto_1

    .line 3362
    :pswitch_20
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateBeauty()V

    .line 3363
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateEyeLight()V

    .line 3364
    goto :goto_1

    .line 3475
    :pswitch_21
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->setEvValue()V

    .line 3476
    goto :goto_1

    .line 3350
    :pswitch_22
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateHDRPreference()V

    .line 3351
    goto :goto_1

    .line 3346
    :pswitch_23
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->updateFlashPreference()V

    .line 3347
    goto :goto_1

    .line 3379
    :pswitch_24
    invoke-static {}, Lcom/android/camera/CameraSettings;->getAntiBanding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/camera/module/Camera2Module;->updateAntiBanding(Ljava/lang/String;)V

    .line 3380
    goto :goto_1

    .line 3342
    :pswitch_25
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegThumbnailSize()V

    .line 3343
    goto :goto_1

    .line 3338
    :pswitch_26
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateJpegQuality()V

    .line 3339
    goto :goto_1

    .line 3411
    :pswitch_27
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateWhiteBalance()V

    .line 3412
    goto :goto_1

    .line 3375
    :pswitch_28
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFace()V

    .line 3376
    goto :goto_1

    .line 3359
    :pswitch_29
    goto :goto_1

    .line 3354
    :pswitch_2a
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFocusArea()V

    .line 3355
    goto :goto_1

    .line 3334
    :pswitch_2b
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFilter()V

    .line 3335
    goto :goto_1

    .line 3330
    :pswitch_2c
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updatePictureAndPreviewSize()V

    .line 3331
    nop

    .line 3322
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 3504
    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_0
        :pswitch_0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public enterMutexMode(I)V
    .locals 2

    .line 4989
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-nez v0, :cond_0

    .line 4990
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "enterMutexMode error, mCamera2Device is null"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4991
    return-void

    .line 4993
    :cond_0
    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v1, 0x3

    if-eq p1, v1, :cond_2

    const/16 v1, 0xa

    if-eq p1, v1, :cond_1

    goto :goto_0

    .line 5003
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 4999
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    .line 5000
    goto :goto_0

    .line 4995
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setHDR(Z)V

    .line 4996
    nop

    .line 5006
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 5007
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSwMfnr()V

    .line 5008
    return-void
.end method

.method public exitMutexMode(I)V
    .locals 2

    .line 5012
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 5023
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    goto :goto_0

    .line 5019
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->setHHT(Z)V

    .line 5020
    goto :goto_0

    .line 5014
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v1}, Lcom/android/camera2/Camera2Proxy;->setHDR(Z)V

    .line 5015
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSuperResolution()V

    .line 5016
    nop

    .line 5026
    :goto_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isMfnrSatEnable()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 5027
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateSwMfnr()V

    .line 5028
    return-void
.end method

.method protected focusCenter()V
    .locals 0

    .line 4053
    return-void
.end method

.method protected getBestPictureSize(Ljava/util/List;)Lcom/android/camera/CameraSize;
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

    .line 4466
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getMaxPictureSize()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera/PictureSizeManager;->initialize(Ljava/util/List;I)V

    .line 4468
    invoke-static {}, Lcom/android/camera/PictureSizeManager;->getBestPictureSize()Lcom/android/camera/CameraSize;

    move-result-object p1

    return-object p1
.end method

.method public getCircularMediaRecorder()Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;
    .locals 2

    .line 612
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorderStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 613
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    .line 614
    monitor-exit v0

    .line 615
    return-object v1

    .line 614
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected getMaxPictureSize()I
    .locals 1

    .line 4472
    const/4 v0, 0x0

    return v0
.end method

.method protected getMutexHdrMode(Ljava/lang/String;)I
    .locals 1

    .line 4945
    const-string v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4946
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/mi/config/b;->gD()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 4948
    :cond_0
    const/4 p1, 0x5

    goto :goto_1

    .line 4947
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 4946
    :goto_1
    return p1

    .line 4949
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->gv()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "live"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 4950
    const/4 p1, 0x2

    return p1

    .line 4952
    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method protected getOperatingMode()I
    .locals 7

    .line 2447
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelSessionEnable()Z

    move-result v0

    const/16 v1, 0xab

    if-eqz v0, :cond_3

    .line 2449
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isEnableQcfa()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2450
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_QCFA"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2451
    const v0, 0x9001

    return v0

    .line 2453
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    if-ne v1, v0, :cond_2

    .line 2455
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDualFrontCamera()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2456
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2457
    const v0, 0x9003

    return v0

    .line 2459
    :cond_1
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2460
    const v0, 0x9000

    return v0

    .line 2463
    :cond_2
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SAT"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2464
    const v0, 0x9002

    return v0

    .line 2470
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    const v2, 0x8001

    const/16 v3, 0xa3

    const v4, 0x8007

    const v5, 0x8002

    if-eqz v0, :cond_8

    .line 2471
    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isFaceBeautyOn()Z

    move-result v0

    sput-boolean v0, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    .line 2472
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2473
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fa()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2474
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2475
    nop

    .line 2492
    :goto_0
    move v2, v5

    goto :goto_2

    .line 2477
    :cond_4
    const v0, 0x80f1

    .line 2492
    :goto_1
    move v2, v0

    goto :goto_2

    .line 2479
    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2481
    goto :goto_0

    .line 2482
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v0

    if-eqz v0, :cond_7

    sget-boolean v0, Lcom/android/camera/module/Camera2Module;->mIsBeautyFrontOn:Z

    if-nez v0, :cond_7

    const-string v0, "off"

    .line 2483
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 2484
    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v1

    .line 2483
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2485
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fQ()I

    move-result v0

    if-gtz v0, :cond_7

    .line 2487
    nop

    .line 2492
    move v2, v4

    goto :goto_2

    .line 2489
    :cond_7
    const v0, 0x8005

    goto :goto_1

    .line 2492
    :goto_2
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    if-ne v0, v3, :cond_f

    .line 2493
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2494
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2495
    nop

    .line 2527
    move v2, v4

    goto :goto_3

    .line 2498
    :cond_8
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    .line 2499
    if-eq v0, v3, :cond_d

    const/16 v3, 0xa7

    if-eq v0, v3, :cond_b

    if-eq v0, v1, :cond_a

    const/16 v1, 0xad

    if-eq v0, v1, :cond_9

    .line 2523
    goto :goto_3

    .line 2512
    :cond_9
    const v2, 0x800a

    .line 2513
    goto :goto_3

    .line 2501
    :cond_a
    nop

    .line 2502
    nop

    .line 2527
    move v2, v5

    goto :goto_3

    .line 2504
    :cond_b
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2505
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 2506
    const v2, 0x80f5

    goto :goto_3

    .line 2508
    :cond_c
    const v2, 0x8003

    .line 2510
    goto :goto_3

    .line 2515
    :cond_d
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2516
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 2517
    const v2, 0x80f3

    goto :goto_3

    .line 2519
    :cond_e
    nop

    .line 2521
    nop

    .line 2527
    :cond_f
    :goto_3
    iput v2, p0, Lcom/android/camera/module/Camera2Module;->mOperatingMode:I

    .line 2528
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatingMode: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "operatingMode = 0x%x"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2529
    return v2
.end method

.method public initializeCapabilities()V
    .locals 2

    .line 3277
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->initializeCapabilities()V

    .line 3278
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 3280
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    .line 3278
    const/4 v1, 0x4

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mContinuousFocusSupported:Z

    .line 3281
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxFaceCount()I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mMaxFaceCount:I

    .line 3282
    return-void
.end method

.method protected isAutoRestartInNonZSL()Z
    .locals 1

    .line 2885
    const/4 v0, 0x0

    return v0
.end method

.method public isBeautyBodySlimCountDetectStarted()Z
    .locals 1

    .line 1264
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsBeautyBodySlimOn:Z

    return v0
.end method

.method protected isDetectedHHT()Z
    .locals 1

    .line 4940
    const/4 v0, 0x0

    return v0
.end method

.method public isDoingAction()Z
    .locals 2

    .line 1693
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isZooming:Z

    if-nez v0, :cond_1

    .line 1695
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_1

    .line 1697
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_1

    .line 1698
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 1699
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelQueueFull()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1700
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 1693
    :goto_1
    return v0
.end method

.method protected isFaceBeautyMode()Z
    .locals 1

    .line 983
    const/4 v0, 0x0

    return v0
.end method

.method public isFaceDetectStarted()Z
    .locals 1

    .line 952
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    return v0
.end method

.method public isHdrDetectStarted()Z
    .locals 1

    .line 855
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mHdrCheckEnabled:Z

    return v0
.end method

.method public isKeptBitmapTexture()Z
    .locals 1

    .line 1801
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    return v0
.end method

.method public isMeteringAreaOnly()Z
    .locals 3

    .line 4977
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4978
    return v1

    .line 4981
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v0

    .line 4982
    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    if-nez v2, :cond_3

    :cond_1
    const/4 v2, 0x5

    if-eq v2, v0, :cond_3

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    goto :goto_1

    :cond_3
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public isNeedMute()Z
    .locals 1

    .line 1005
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 3

    .line 1825
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1826
    return v1

    .line 1830
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa0

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    .line 1831
    if-eqz v0, :cond_1

    const v2, 0x7f0d001b

    invoke-interface {v0, v2}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v0

    const/16 v2, 0xff3

    if-ne v0, v2, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public isShowAeAfLockIndicator()Z
    .locals 1

    .line 4965
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    return v0
.end method

.method public isShowCaptureButton()Z
    .locals 1

    .line 4960
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isBurstShoot()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportFocusShoot()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSupportFocusShoot()Z
    .locals 2

    .line 4970
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_focus_shoot_key"

    .line 4971
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->isGlobalSwitchOn(Ljava/lang/String;)Z

    move-result v0

    .line 4970
    return v0
.end method

.method protected isSupportSceneMode()Z
    .locals 1

    .line 4462
    const/4 v0, 0x0

    return v0
.end method

.method public isUltraWideDetectStarted()Z
    .locals 1

    .line 5854
    const/4 v0, 0x1

    return v0
.end method

.method public isUnInterruptable()Z
    .locals 2

    .line 1705
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mUnInterruptableReason:Ljava/lang/String;

    .line 1706
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1707
    const-string v0, "bitmap cover"

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mUnInterruptableReason:Ljava/lang/String;

    goto :goto_0

    .line 1708
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 1709
    const-string v0, "snapshot"

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mUnInterruptableReason:Ljava/lang/String;

    .line 1711
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mUnInterruptableReason:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public isUseFaceInfo()Z
    .locals 1

    .line 957
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsGenderAgeOn:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMagicMirrorOn:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected isZoomEnabled()Z
    .locals 2

    .line 4870
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    .line 4871
    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4872
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4873
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4874
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4875
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4876
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 4870
    :goto_0
    return v0
.end method

.method public multiCapture()Z
    .locals 5

    .line 441
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 442
    return v1

    .line 446
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    if-nez v0, :cond_1

    .line 447
    return v1

    .line 449
    :cond_1
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 451
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 452
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 453
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not enough space or storage not ready. remaining="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    invoke-static {}, Lcom/android/camera/storage/Storage;->getLeftSpace()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 453
    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    return v1

    .line 458
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isBusy()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 459
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v2, "ImageSaver is busy, wait for a moment!"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/ui/RotateTextToast;->getInstance(Landroid/app/Activity;)Lcom/android/camera/ui/RotateTextToast;

    move-result-object v0

    const v2, 0x7f0901b5

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/ui/RotateTextToast;->show(II)V

    .line 461
    return v1

    .line 466
    :cond_3
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 467
    const-string v1, "d"

    const/4 v2, 0x6

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 475
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->prepareMultiCapture()V

    .line 477
    new-instance v0, Lcom/android/camera/module/Camera2Module$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$1;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    .line 482
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 486
    new-instance v1, Lcom/android/camera/module/Camera2Module$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$3;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/Camera2Module$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$2;-><init>(Lcom/android/camera/module/Camera2Module;)V

    .line 505
    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    .line 536
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mBurstNextDelayTime:J

    .line 537
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isParallelSessionEnable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 538
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setShotType(I)V

    .line 539
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    new-instance v2, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;-><init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/module/Camera2Module$1;)V

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 541
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v3

    .line 539
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    goto :goto_0

    .line 543
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setShotType(I)V

    .line 544
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mTotalJpegCallbackNum:I

    new-instance v2, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;

    .line 545
    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/LocationManager;->getCurrentLocation()Landroid/location/Location;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/android/camera/module/Camera2Module$JpegQuickPictureCallback;-><init>(Lcom/android/camera/module/Camera2Module;Landroid/location/Location;)V

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 546
    invoke-virtual {v3}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v3

    .line 544
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera2/Camera2Proxy;->captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 549
    :goto_0
    const/4 v0, 0x1

    return v0

    :array_0
    .array-data 4
        0xc1
        0xc2
        0xc4
        0xef
        0xc9
        0xce
    .end array-data
.end method

.method public notifyFocusAreaUpdate()V
    .locals 3

    .line 994
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 995
    return-void
.end method

.method public onBackPressed()Z
    .locals 7

    .line 1865
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1866
    return v1

    .line 1869
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1871
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1872
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonLongClickCancel(Z)V

    .line 1873
    return v2

    .line 1876
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 1877
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1878
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v4, 0xad

    if-ne v3, v4, :cond_2

    .line 1879
    iget-wide v3, p0, Lcom/android/camera/module/Camera2Module;->mLastBackPressedTime:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0xbb8

    cmp-long v3, v3, v5

    if-lez v3, :cond_3

    .line 1880
    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mLastBackPressedTime:J

    .line 1881
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const v1, 0x7f090123

    invoke-static {v0, v1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    .line 1882
    return v2

    .line 1885
    :cond_2
    iget-wide v3, p0, Lcom/android/camera/module/Camera2Module;->mLastCaptureTime:J

    sub-long/2addr v0, v3

    const-wide/16 v3, 0x1f40

    cmp-long v0, v0, v3

    if-gez v0, :cond_3

    .line 1886
    return v2

    .line 1891
    :cond_3
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onBeautyBodySlimCountChange(Z)V
    .locals 2

    .line 1246
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$8;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/Camera2Module$8;-><init>(Lcom/android/camera/module/Camera2Module;Z)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 1260
    return-void
.end method

.method public onBeautyChanged()V
    .locals 0

    .line 869
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->onBeautyParameterChanged()V

    .line 870
    return-void
.end method

.method public onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 587
    if-eqz p2, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 590
    :cond_0
    const-string v0, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 591
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "on Receive voice control broadcast action intent"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    invoke-static {p2}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->getVoiceControlAction()Ljava/lang/String;

    move-result-object v0

    .line 593
    iput-object p2, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    .line 594
    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, 0x4bbb5326    # 2.4553036E7f

    if-eq v2, v3, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "CAPTURE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    goto :goto_1

    .line 596
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 597
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBroadcastIntent:Landroid/content/Intent;

    .line 598
    nop

    .line 603
    :goto_1
    invoke-static {p2}, Lcom/android/camera/CameraIntentManager;->removeInstance(Landroid/content/Intent;)V

    .line 605
    :cond_4
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onBroadcastReceived(Landroid/content/Context;Landroid/content/Intent;)V

    .line 606
    return-void

    .line 588
    :cond_5
    :goto_2
    return-void
.end method

.method protected onCameraOpened()V
    .locals 2

    .line 3236
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onCameraOpened()V

    .line 3237
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initializeFocusManager()V

    .line 3239
    sget-object v0, Lcom/android/camera/constant/UpdateConstant;->CAMERA_TYPES_INIT:[I

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 3244
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isPortraitMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3246
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCameraCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getCameraCalibrationData()[B

    move-result-object v0

    .line 3247
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mActualCameraId:I

    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->getCalibrationDataFileName(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->saveCameraCalibrationToFile([BLjava/lang/String;)Z

    .line 3250
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3251
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->startPreview()V

    .line 3253
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initMetaParser()V

    .line 3254
    invoke-static {}, Lcom/mi/config/b;->gF()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3255
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->initAiSceneParser()V

    .line 3258
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mOnResumeTime:J

    .line 3259
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 3260
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 3261
    return-void
.end method

.method public onCaptureStart(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/android/camera/CameraSize;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 5

    .line 2909
    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveShotOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2910
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->startLiveShotAnimation()V

    .line 2913
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->onShutter()V

    .line 2915
    nop

    .line 2916
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 2917
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xa6

    .line 2918
    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 2919
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFaceWaterMarkInfos()Ljava/util/List;

    move-result-object v0

    .line 2920
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 2921
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 2924
    :cond_1
    move-object v2, v1

    :goto_0
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCaptureStart: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p2, Lcom/android/camera/CameraSize;->width:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p2, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2927
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    if-nez v0, :cond_2

    .line 2928
    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v0

    goto :goto_1

    .line 2930
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v0

    .line 2933
    :goto_1
    new-instance v3, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 2934
    invoke-virtual {v4}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object p2

    invoke-direct {v3, v4, p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    .line 2935
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result p2

    invoke-virtual {v3, p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2936
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setMirror(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2937
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLightingPattern(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2938
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2939
    const/4 v0, -0x1

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    if-ne v0, v4, :cond_3

    move v0, v3

    goto :goto_2

    :cond_3
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    :goto_2
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mJpegRotation:I

    .line 2940
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2941
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v0, v0, v4

    if-nez v0, :cond_4

    const/4 v0, 0x0

    goto :goto_3

    :cond_4
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mShootRotation:F

    :goto_3
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootRotation(F)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    .line 2942
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    .line 2943
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2944
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v1

    nop

    :cond_5
    invoke-virtual {p2, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2945
    invoke-virtual {p2, v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFaceWaterMarkList(Ljava/util/List;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2946
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAgeGenderAndMagicMirrorWater(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2947
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2948
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAlgorithmName:Ljava/lang/String;

    .line 2949
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAlgorithmName(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2950
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2951
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getSuffix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSuffix(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsGradienterOn:Z

    .line 2952
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setGradienterOn(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2953
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->getTiltShiftMode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTiltShiftMode(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2954
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSaveGroushotPrimitiveOn()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2955
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getDualWaterMarkParam()Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setDualWatermarkParam(Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2956
    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->getJpegQuality(Z)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegQuality(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 2957
    invoke-virtual {p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p2

    .line 2959
    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    .line 2960
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mEnabledPreviewThumbnail:Z

    const/4 v0, 0x1

    xor-int/2addr p2, v0

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    .line 2962
    sget-object p2, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCaptureStart: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2963
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    if-eqz p2, :cond_6

    .line 2964
    invoke-direct {p0, p1, v0}, Lcom/android/camera/module/Camera2Module;->beginParallelProcess(Lcom/xiaomi/camera/core/ParallelTaskData;Z)V

    .line 2967
    :cond_6
    return-object p1
.end method

.method public onCreate(II)V
    .locals 0

    .line 2223
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onCreate(II)V

    .line 2225
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->parseIntent()V

    .line 2227
    new-instance p1, Lcom/android/camera/module/Camera2Module$MainHandler;

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p0, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;-><init>(Lcom/android/camera/module/Camera2Module;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    .line 2228
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mSensorStateListener:Lcom/android/camera/SensorStateManager$SensorStateListener;

    invoke-virtual {p1, p2}, Lcom/android/camera/SensorStateManager;->setSensorStateListener(Lcom/android/camera/SensorStateManager$SensorStateListener;)V

    .line 2230
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onCameraOpened()V

    .line 2232
    new-instance p1, Lcom/google/lens/sdk/LensApi;

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-direct {p1, p2}, Lcom/google/lens/sdk/LensApi;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    .line 2233
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mLensApi:Lcom/google/lens/sdk/LensApi;

    new-instance p2, Lcom/android/camera/module/Camera2Module$15;

    invoke-direct {p2, p0}, Lcom/android/camera/module/Camera2Module$15;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {p1, p2}, Lcom/google/lens/sdk/LensApi;->checkLensAvailability(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V

    .line 2241
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1998
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onDestroy()V

    .line 1999
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 2000
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2002
    :cond_0
    return-void
.end method

.method public onFaceBeautySwitched(Z)V
    .locals 0

    .line 861
    if-eqz p1, :cond_0

    const-string p1, "pref_camera_face_beauty_advanced_key"

    goto :goto_0

    :cond_0
    const-string p1, "pref_camera_face_beauty_key"

    .line 860
    :goto_0
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->setFaceBeautySwitch(Ljava/lang/String;)V

    .line 862
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 863
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onBeautyChanged()V

    .line 865
    :cond_1
    return-void
.end method

.method public onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
    .locals 3

    .line 910
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/CameraScreenNail;->getFrameAvailableFlag()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_1

    .line 913
    :cond_0
    if-nez p1, :cond_1

    .line 914
    return-void

    .line 918
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->gy()Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p1

    if-lez p2, :cond_2

    const/4 p2, 0x0

    aget-object p2, p1, p2

    iget p2, p2, Lcom/android/camera2/CameraHardwareFace;->faceType:I

    const v0, 0xface

    if-ne p2, v0, :cond_2

    .line 920
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mObjectTrackingStarted:Z

    if-eqz p2, :cond_6

    .line 921
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    invoke-interface {p2, v0, p1, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    goto :goto_0

    .line 925
    :cond_2
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/4 v2, 0x1

    invoke-interface {p2, v2, p1, v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFaces(I[Lcom/android/camera2/CameraHardwareFace;Landroid/graphics/Rect;F)Z

    move-result p2

    if-nez p2, :cond_3

    .line 926
    return-void

    .line 929
    :cond_3
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mIsPortraitLightingOn:Z

    if-eqz p2, :cond_4

    .line 930
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->lightingDetectFace([Lcom/android/camera2/CameraHardwareFace;)V

    .line 939
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result p1

    const/16 p2, 0x38

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 940
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFocusViewVisible()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 941
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_6

    .line 942
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 945
    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 948
    :cond_6
    :goto_0
    return-void

    .line 911
    :cond_7
    :goto_1
    return-void
.end method

.method public onFilterChanged(II)V
    .locals 3

    .line 1858
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFilterChanged: category = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", newIndex = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1859
    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p2, 0x0

    const/4 v0, 0x2

    aput v0, p1, p2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 1860
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 1861
    return-void
.end method

.method public onFocusStateChanged(Lcom/android/camera/module/loader/camera2/FocusTask;)V
    .locals 9

    .line 2595
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2596
    return-void

    .line 2599
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 2620
    :pswitch_0
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isFocusing()Z

    move-result v0

    .line 2621
    nop

    .line 2622
    const/4 v4, 0x0

    .line 2623
    if-eqz v0, :cond_1

    .line 2624
    const-string v4, "onAutoFocusMoving start"

    .line 2625
    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    goto :goto_0

    .line 2626
    :cond_1
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    if-nez v0, :cond_2

    .line 2627
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAutoFocusMoving end. result="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2628
    nop

    .line 2629
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/module/Camera2Module;->mAFEndLogTimes:I

    .line 2631
    :cond_2
    :goto_0
    sget-boolean v0, Lcom/android/camera/Util;->sIsDumpLog:Z

    if-eqz v0, :cond_3

    if-eqz v4, :cond_3

    .line 2632
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    invoke-static {v0, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2636
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-ne v0, v2, :cond_4

    .line 2637
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getFocusTrigger()I

    move-result v0

    if-ne v0, v2, :cond_6

    .line 2638
    :cond_4
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-nez v0, :cond_6

    .line 2639
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    goto :goto_1

    .line 2601
    :pswitch_1
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "FocusTime=%1$dms focused=%2$b"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    .line 2602
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->getElapsedTime()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v6, v3

    .line 2601
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2604
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result v0

    if-nez v0, :cond_5

    .line 2605
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eq v0, v2, :cond_5

    .line 2606
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2610
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onFocusResult(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 2611
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 2613
    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusTask;->isSuccess()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-eqz p1, :cond_6

    .line 2614
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v3}, Lcom/android/camera2/Camera2Proxy;->lockExposure(Z)V

    .line 2644
    :cond_6
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onGradienterSwitched(Z)V
    .locals 1

    .line 4661
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsGradienterOn:Z

    .line 4662
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/SensorStateManager;->setGradienterEnabled(Z)V

    .line 4663
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 4664
    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x5
    .end array-data
.end method

.method public onHDRSceneChanged(Z)V
    .locals 3

    .line 809
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    if-eq v0, p1, :cond_7

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 813
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 814
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 815
    return-void

    .line 817
    :cond_1
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 818
    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 819
    return-void

    .line 825
    :cond_2
    if-eqz p1, :cond_4

    .line 826
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_3

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 828
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isNeedFlashOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 829
    :cond_3
    return-void

    .line 832
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$5;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/Camera2Module$5;-><init>(Lcom/android/camera/module/Camera2Module;Z)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 841
    if-eqz p1, :cond_5

    .line 842
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isNormal()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 843
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/MutexModeManager;->setMutexMode(I)V

    goto :goto_0

    .line 845
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isMorphoHdr()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 846
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->resetMutexMode()V

    .line 849
    :cond_6
    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->isDetectedInHDR:Z

    .line 850
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onHDRSceneChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    return-void

    .line 810
    :cond_7
    :goto_1
    return-void
.end method

.method public onHanGestureSwitched(Z)V
    .locals 2

    .line 4677
    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 4678
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object p1

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    invoke-virtual {p1, v1, v0}, Lcom/android/zxing/PreviewDecodeManager;->init(II)V

    .line 4679
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/zxing/PreviewDecodeManager;->startDecode()V

    goto :goto_0

    .line 4681
    :cond_0
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/zxing/PreviewDecodeManager;->stopDecode(I)V

    .line 4683
    :goto_0
    return-void
.end method

.method public onHostStopAndNotifyActionStop()V
    .locals 3

    .line 2032
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onHostStopAndNotifyActionStop()V

    .line 2033
    nop

    .line 2034
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2035
    const/4 v0, 0x1

    .line 2036
    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v2}, Lio/reactivex/disposables/Disposable;->dispose()V

    goto :goto_0

    .line 2038
    :cond_0
    move v0, v1

    :goto_0
    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mWaitingSuperNightResult:Z

    if-eqz v0, :cond_2

    .line 2039
    :cond_1
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mWaitingSuperNightResult:Z

    .line 2040
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    .line 2041
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    .line 2042
    if-eqz v0, :cond_2

    .line 2043
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    .line 2046
    :cond_2
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 4767
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4768
    return v1

    .line 4771
    :cond_0
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_3

    .line 4773
    :sswitch_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    if-nez p1, :cond_1

    .line 4774
    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 4776
    :cond_1
    return v0

    .line 4779
    :sswitch_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    if-nez p1, :cond_3

    .line 4780
    invoke-static {p2}, Lcom/android/camera/Util;->isFingerPrintKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 4781
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFingerprintCaptureEnable()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 4782
    const/16 p1, 0x1e

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    goto :goto_0

    .line 4785
    :cond_2
    const/16 p1, 0x28

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 4788
    :cond_3
    :goto_0
    return v0

    .line 4793
    :sswitch_2
    const/16 v2, 0x18

    if-eq p1, v2, :cond_5

    const/16 v2, 0x58

    if-ne p1, v2, :cond_4

    goto :goto_1

    :cond_4
    goto :goto_2

    :cond_5
    :goto_1
    move v1, v0

    .line 4796
    :goto_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    .line 4793
    invoke-virtual {p0, v1, v0, v2}, Lcom/android/camera/module/Camera2Module;->handleVolumeKeyEvent(ZZI)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 4797
    return v0

    .line 4802
    :cond_6
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_2
        0x19 -> :sswitch_2
        0x1b -> :sswitch_1
        0x42 -> :sswitch_1
        0x50 -> :sswitch_0
        0x57 -> :sswitch_2
        0x58 -> :sswitch_2
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4

    .line 4807
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_2

    .line 4812
    :sswitch_0
    const/16 v1, 0x18

    const/4 v2, 0x0

    if-eq p1, v1, :cond_1

    const/16 v1, 0x58

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v0

    .line 4815
    :goto_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v3

    .line 4812
    invoke-virtual {p0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module;->handleVolumeKeyEvent(ZZI)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4816
    return v0

    .line 4822
    :sswitch_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xab

    .line 4823
    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 4824
    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromKeyBack()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 4825
    return v0

    .line 4829
    :cond_2
    :goto_2
    invoke-super {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method public onLongPress(II)V
    .locals 1

    .line 1596
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->isInTapableRect(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1597
    return-void

    .line 1599
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->onSingleTapUp(II)V

    .line 1602
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAEAFLockSupport()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1603
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->lockAEAF()V

    .line 1605
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSupportFocusShoot()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->is3ALocked()Z

    move-result p1

    if-nez p1, :cond_2

    .line 1606
    const/16 p1, 0x50

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setTriggerMode(I)V

    .line 1607
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 1609
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->performHapticFeedback(I)V

    .line 1610
    return-void
.end method

.method public onObjectStable()V
    .locals 0

    .line 1016
    return-void
.end method

.method public onOrientationChanged(II)V
    .locals 1

    .line 4513
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsGradienterOn:Z

    if-nez v0, :cond_0

    .line 4514
    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->setOrientation(II)V

    .line 4516
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1940
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onPause()V

    .line 1942
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->stopLiveShot(Z)V

    .line 1948
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 1949
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->removeMessages()V

    .line 1952
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetGradienter()V

    .line 1953
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 1954
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 1957
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetScreenOn()V

    .line 1959
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->closeCamera()V

    .line 1960
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->releaseEffectProcessor()V

    .line 1962
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Lcom/android/camera/module/Camera2Module$12;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$12;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1983
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_1

    .line 1984
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1986
    :cond_1
    return-void
.end method

.method public onPictureTaken([B)V
    .locals 0

    .line 3002
    return-void
.end method

.method public onPictureTakenFinished(Z)V
    .locals 9

    .line 3007
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPictureTakenFinished: succeed = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3008
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_4

    .line 3010
    invoke-virtual {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 3011
    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mLocation:Landroid/location/Location;

    if-eqz p1, :cond_0

    move v5, v1

    goto :goto_0

    :cond_0
    move v5, v0

    :goto_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getCurrentAiSceneName()Ljava/lang/String;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/camera/module/Camera2Module;->mEnteringMoonMode:Z

    iget-boolean v8, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    .line 3013
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 3016
    iget-wide v4, p0, Lcom/android/camera/module/Camera2Module;->mCaptureStartTime:J

    sub-long/2addr v2, v4

    .line 3017
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result p1

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v2, v3, p1, v4}, Lcom/android/camera/statistic/CameraStatUtil;->trackTakePictureCost(JZI)V

    .line 3019
    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v4, 0xab

    if-ne p1, v4, :cond_1

    .line 3020
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->isSupportBokehAdjust()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 3021
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackBokehTaken()V

    .line 3024
    :cond_1
    invoke-static {}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackCaptureTimeEnd()V

    .line 3026
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "ms"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3029
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-eqz p1, :cond_3

    .line 3030
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mQuickCapture:Z

    if-nez p1, :cond_2

    .line 3031
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 3032
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 3033
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->showPostCaptureAlert()V

    goto :goto_1

    .line 3036
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->doAttach()V

    goto :goto_1

    .line 3039
    :cond_3
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    if-eqz p1, :cond_4

    .line 3040
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    .line 3041
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelLongPressedAutoFocus()V

    .line 3047
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result p1

    if-nez p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez p1, :cond_5

    .line 3048
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 3049
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 3050
    invoke-static {}, Lcom/android/camera/CameraSettings;->isHangGestureOpen()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 3051
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/zxing/PreviewDecodeManager;->reset()V

    .line 3055
    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 3057
    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xad

    if-ne p1, v1, :cond_7

    .line 3058
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mWaitingSuperNightResult:Z

    .line 3059
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result p1

    if-nez p1, :cond_6

    .line 3060
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mSuperNightDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 3062
    :cond_6
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v0, Lcom/android/camera/module/Camera2Module$17;

    invoke-direct {v0, p0}, Lcom/android/camera/module/Camera2Module$17;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 3074
    :cond_7
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->doLaterReleaseIfNeed()V

    .line 3075
    return-void
.end method

.method public onPictureTakenImageConsumed(Landroid/media/Image;)Z
    .locals 0

    .line 2996
    const/4 p1, 0x0

    return p1
.end method

.method public onPreviewLayoutChanged(Landroid/graphics/Rect;)V
    .locals 3

    .line 1839
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0, p1}, Lcom/android/camera/Camera;->onLayoutChange(Landroid/graphics/Rect;)V

    .line 1840
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1841
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraScreenNail;->getRenderWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 1842
    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v2

    .line 1841
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setRenderSize(II)V

    .line 1843
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1845
    :cond_0
    return-void
.end method

.method public onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V
    .locals 4

    .line 5112
    if-nez p1, :cond_0

    .line 5113
    return-void

    .line 5116
    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->onPreviewMetaDataUpdate(Landroid/hardware/camera2/CaptureResult;)V

    .line 5119
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->SENSOR_SENSITIVITY:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 5120
    sget-object v1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPreviewMetaDataUpdate: ISO="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 5121
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x320

    if-lt v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mShouldDoMFNR:Z

    .line 5123
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_2

    .line 5124
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMetaDataFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 5127
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_3

    .line 5128
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {v0, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 5130
    :cond_3
    return-void
.end method

.method public onPreviewPixelsRead([BII)V
    .locals 5

    .line 2806
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->animateCapture()V

    .line 2807
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 2809
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 2810
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 2812
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result p1

    const/4 p3, 0x1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isFrontMirror()Z

    move-result p1

    if-nez p1, :cond_0

    .line 2813
    move p1, p3

    goto :goto_0

    .line 2812
    :cond_0
    nop

    .line 2813
    move p1, v0

    .line 2815
    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 2816
    if-eqz p1, :cond_1

    .line 2817
    invoke-static {p2}, Lcom/android/camera/Util;->flipBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 2818
    nop

    .line 2821
    move p1, v0

    :cond_1
    invoke-static {p2}, Lcom/android/camera/Util;->getBitmapData(Landroid/graphics/Bitmap;)[B

    move-result-object v1

    goto :goto_1

    .line 2824
    :cond_2
    move-object v1, v2

    :goto_1
    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mShootOrientation:I

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mDisplayRotation:I

    sub-int/2addr v3, v4

    .line 2825
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2826
    invoke-static {}, Lcom/mi/config/b;->hC()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2828
    rem-int/lit16 v4, v3, 0xb4

    if-nez v4, :cond_3

    .line 2829
    nop

    .line 2834
    move v3, v0

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeviceAlive()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_2

    .line 2837
    :cond_4
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4}, Lcom/android/camera2/Camera2Proxy;->getShotSavePath()Ljava/lang/String;

    move-result-object v4

    .line 2838
    invoke-static {v2, p2, v3, p1}, Lcom/android/camera/Thumbnail;->createThumbnail(Landroid/net/Uri;Landroid/graphics/Bitmap;IZ)Lcom/android/camera/Thumbnail;

    move-result-object p1

    .line 2839
    invoke-virtual {p1}, Lcom/android/camera/Thumbnail;->startWaitingForUri()V

    .line 2840
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p2

    invoke-virtual {p2, p1, p3, p3}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 2843
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onPreviewPixelsRead: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, "--"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p3, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2844
    if-eqz v1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsCurrentTaskIsParallel:Z

    if-eqz p1, :cond_5

    .line 2845
    new-instance p1, Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 2846
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    const/4 v2, -0x1

    invoke-direct {p1, p2, p3, v2, v4}, Lcom/xiaomi/camera/core/ParallelTaskData;-><init>(JILjava/lang/String;)V

    .line 2847
    invoke-virtual {p1, v1, v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    .line 2848
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/storage/ImageSaver;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 2850
    :cond_5
    return-void

    .line 2835
    :cond_6
    :goto_2
    return-void
.end method

.method public onPreviewSessionClosed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 2587
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "onPreviewSessionClosed: "

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2590
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2591
    return-void
.end method

.method public onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 2578
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isTextureExpired()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->retryOnceIfCameraError(Landroid/os/Handler;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2579
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v0, "sessionFailed due to surfaceTexture expired, retry"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2580
    return-void

    .line 2582
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v0, 0x33

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2583
    return-void
.end method

.method public onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3

    .line 2534
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreviewSessionSuccess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2535
    if-nez p1, :cond_0

    .line 2536
    return-void

    .line 2538
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result p1

    if-nez p1, :cond_1

    .line 2539
    return-void

    .line 2542
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isKeptBitmapTexture()Z

    move-result p1

    if-nez p1, :cond_2

    .line 2543
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 2546
    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    if-eqz p1, :cond_3

    .line 2547
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->configParallelSession()V

    .line 2550
    :cond_3
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->previewWhenSessionSuccess()V

    .line 2551
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 2553
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isOpenOnly()Z

    move-result p1

    if-nez p1, :cond_4

    .line 2555
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.extra.CAMERA_OPEN_ONLY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 2557
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v0, 0x34

    const-wide/16 v1, 0x3e8

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 2559
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.extra.TIMER_DURATION_SECONDS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 2562
    :cond_5
    :goto_0
    return-void
.end method

.method public onPreviewSizeChanged(II)V
    .locals 1

    .line 1849
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    if-eqz v0, :cond_0

    .line 1850
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setPreviewSize(II)V

    .line 1852
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 1898
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onResume()V

    .line 1899
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x32

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 1900
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSelectingCapturedResult()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1901
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 1902
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseBitmapIfNeeded()V

    .line 1905
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->keepScreenOnAwhile()V

    .line 1907
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Lcom/android/camera/module/Camera2Module$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$11;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1923
    return-void
.end method

.method public onReviewCancelClicked()V
    .locals 3

    .line 1811
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mKeepBitmapTexture:Z

    .line 1812
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isSelectingCapturedResult()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1813
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->releaseBitmapIfNeeded()V

    .line 1814
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->hidePostCaptureAlert()V

    goto :goto_0

    .line 1818
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/Camera;->setResult(ILandroid/content/Intent;)V

    .line 1819
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->finish()V

    .line 1821
    :goto_0
    return-void
.end method

.method public onReviewDoneClicked()V
    .locals 0

    .line 1806
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->doAttach()V

    .line 1807
    return-void
.end method

.method public onScaleEnd()V
    .locals 4

    .line 4881
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onScaleEnd()V

    .line 4883
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    .line 4884
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v1

    .line 4885
    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    .line 4886
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    .line 4887
    if-eqz v0, :cond_1

    .line 4888
    const/16 v1, 0xf

    const v2, 0x7f09027e

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    .line 4891
    :cond_1
    return-void
.end method

.method public onShutterButtonClick(I)V
    .locals 2

    .line 1075
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->getCountDownTimes(I)I

    move-result v0

    .line 1076
    if-lez v0, :cond_0

    .line 1077
    invoke-direct {p0, v0, p1}, Lcom/android/camera/module/Camera2Module;->startCount(II)V

    .line 1078
    return-void

    .line 1081
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->checkShutterCondition()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1082
    return-void

    .line 1085
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setTriggerMode(I)V

    .line 1086
    sget-object p1, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onShutterButtonClick "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1092
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mNeedAutoFocus:Z

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->prepareCapture(ZI)V

    .line 1093
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->doSnap()V

    .line 1094
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusingSnapOnFinish()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 1095
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->enableCameraControls(Z)V

    .line 1097
    :cond_2
    return-void
.end method

.method public onShutterButtonFocus(ZI)V
    .locals 0

    .line 1592
    return-void
.end method

.method public onShutterButtonLongClick()Z
    .locals 4

    .line 1614
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1615
    return v1

    .line 1618
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-eqz v0, :cond_1

    .line 1619
    return v1

    .line 1622
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBurstShootingEnable()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 1623
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_4

    .line 1626
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGroupShotOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1627
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1628
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1629
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v3, "pref_camera_hand_night_key"

    invoke-virtual {v0, v3}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1630
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1631
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1632
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v3, 0x18

    .line 1634
    invoke-virtual {v0, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    if-nez v0, :cond_4

    .line 1636
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isUltraWideBackCamera()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1637
    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1640
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    .line 1641
    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 1642
    if-eqz v0, :cond_2

    .line 1643
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromShutter()V

    .line 1646
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->gM()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1647
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 1650
    :cond_3
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 1651
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->doMultiSnap(Z)V

    .line 1653
    return v2

    .line 1657
    :cond_4
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    .line 1658
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 1659
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->requestAutoFocus()V

    .line 1660
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    .line 1661
    return v1
.end method

.method public onShutterButtonLongClickCancel(Z)V
    .locals 5

    .line 1667
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "onShutterButtonLongClickCancel: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1673
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPendingMultiCapture:Z

    .line 1675
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-eqz v1, :cond_0

    .line 1676
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v2, 0x31

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 1679
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStopRequest:Z

    .line 1681
    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    if-eqz v1, :cond_2

    .line 1682
    if-eqz p1, :cond_1

    .line 1683
    const/16 p1, 0xa

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    goto :goto_0

    .line 1685
    :cond_1
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    .line 1686
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->cancelLongPressedAutoFocus()V

    .line 1689
    :cond_2
    :goto_0
    return-void
.end method

.method public onSingleTapUp(II)V
    .locals 3

    .line 4573
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSingleTapUp mPaused: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "; mCamera2Device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "; isInCountDown: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4574
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "; getCameraState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4575
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; mMultiSnapStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "; Camera2Module: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 4573
    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4579
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 4581
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isSessionReady()Z

    move-result v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 4582
    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->isPreviewReady()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 4583
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->isInTapableRect(II)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 4584
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_8

    .line 4585
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_8

    .line 4586
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_8

    .line 4587
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isInCountDown()Z

    move-result v0

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    if-eqz v0, :cond_0

    goto/16 :goto_0

    .line 4594
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 4595
    return-void

    .line 4598
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isScreenSlideOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 4599
    return-void

    .line 4603
    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BackStack;

    .line 4604
    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$BackStack;->handleBackStackFromTapDown(II)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 4605
    return-void

    .line 4608
    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->tryRemoveCountDownMessage()V

    .line 4610
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    if-nez v0, :cond_4

    .line 4611
    return-void

    .line 4615
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 4616
    return-void

    .line 4618
    :cond_5
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mObjectTrackingStarted:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    .line 4619
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 4621
    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setFocusViewType(Z)V

    .line 4623
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1, p2}, Landroid/graphics/Point;-><init>(II)V

    .line 4624
    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->mapTapCoordinate(Ljava/lang/Object;)V

    .line 4626
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->unlockAEAF()V

    .line 4627
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 4628
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    iget p2, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onSingleTapUp(II)V

    .line 4631
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-nez p1, :cond_7

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mMeteringAreaSupported:Z

    if-eqz p1, :cond_7

    .line 4632
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/SensorStateManager;->reset()V

    .line 4634
    :cond_7
    return-void

    .line 4590
    :cond_8
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 1990
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onStop()V

    .line 1991
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    .line 1992
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 1994
    :cond_0
    return-void
.end method

.method public onSurfaceTextureReleased()V
    .locals 2

    .line 2875
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceTextureReleased: no further preview frame will be available"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2881
    return-void
.end method

.method public onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 1

    .line 2863
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-eqz v0, :cond_0

    .line 2864
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    .line 2867
    :cond_0
    return-void
.end method

.method public onThumbnailClicked(Landroid/view/View;)V
    .locals 0

    .line 1716
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1717
    return-void

    .line 1719
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getThumbnail()Lcom/android/camera/Thumbnail;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1720
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->gotoGallery()V

    .line 1722
    :cond_1
    return-void
.end method

.method public onTiltShiftSwitched(Z)V
    .locals 1

    .line 4667
    if-eqz p1, :cond_0

    .line 4668
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->resetEvValue()V

    .line 4670
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initEffectCropView()V

    .line 4671
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->updatePreferenceTrampoline([I)V

    .line 4672
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateEffectViewVisible()V

    .line 4673
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setEvAdjustable(Z)V

    .line 4674
    return-void

    :array_0
    .array-data 4
        0x2
        0x5
    .end array-data
.end method

.method public onUltraWideChanged(Z)V
    .locals 2

    .line 5816
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$33;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/Camera2Module$33;-><init>(Lcom/android/camera/module/Camera2Module;Z)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 5850
    return-void
.end method

.method public onUserInteraction()V
    .locals 1

    .line 4918
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->onUserInteraction()V

    .line 4919
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4920
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->keepScreenOnAwhile()V

    .line 4922
    :cond_0
    return-void
.end method

.method public onWaitingFocusFinished()Z
    .locals 2

    .line 427
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 428
    return v1

    .line 430
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 431
    return v1

    .line 434
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->startNormalCapture(I)V

    .line 435
    const/4 v0, 0x1

    return v0
.end method

.method protected openSettingActivity()V
    .locals 4

    .line 3217
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 3218
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const-class v2, Lcom/android/camera/CameraPreferenceActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 3219
    const-string v1, "from_where"

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 3220
    const-string v1, "IsCaptureIntent"

    iget-boolean v2, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3222
    const-string v1, ":miui:starting_window_label"

    .line 3223
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090045

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 3222
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3225
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1}, Lcom/android/camera/Camera;->startFromKeyguard()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3226
    const-string v1, "StartActivityWhenLocked"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 3228
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v1, v0}, Lcom/android/camera/Camera;->startActivity(Landroid/content/Intent;)V

    .line 3229
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->setJumpFlag(I)V

    .line 3231
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackGotoSettings(I)V

    .line 3232
    return-void
.end method

.method public pausePreview()V
    .locals 2

    .line 2649
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "pausePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2650
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->pausePreview()V

    .line 2651
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2652
    return-void
.end method

.method protected performVolumeKeyClicked(Ljava/lang/String;IZ)V
    .locals 1

    .line 4834
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 4837
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_1

    .line 4838
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->restoreBottom()V

    .line 4840
    :cond_1
    const/4 v0, 0x1

    if-nez p2, :cond_4

    .line 4841
    if-eqz p3, :cond_3

    .line 4842
    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 4843
    const p2, 0x7f09011d

    invoke-virtual {p0, p2}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/16 p2, 0x14

    if-eqz p1, :cond_2

    .line 4844
    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lcom/android/camera/module/Camera2Module;->startCount(II)V

    goto :goto_0

    .line 4846
    :cond_2
    invoke-virtual {p0, p2}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    goto :goto_0

    .line 4850
    :cond_3
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonFocus(ZI)V

    .line 4851
    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    if-eqz p2, :cond_5

    .line 4852
    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 4853
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->onShutterButtonLongClickCancel(Z)V

    goto :goto_0

    .line 4857
    :cond_4
    if-eqz p3, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    if-nez p1, :cond_5

    .line 4858
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mUpdateImageTitle:Z

    .line 4859
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonLongClick()Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 4860
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    if-nez p1, :cond_5

    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mLongPressedAutoFocus:Z

    if-eqz p1, :cond_5

    .line 4861
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mVolumeLongPress:Z

    .line 4865
    :cond_5
    :goto_0
    return-void

    .line 4835
    :cond_6
    :goto_1
    return-void
.end method

.method public playFocusSound(I)V
    .locals 0

    .line 999
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 1000
    return-void
.end method

.method public registerProtocol()V
    .locals 5

    .line 332
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->registerProtocol()V

    .line 333
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 334
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 335
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 336
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 337
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 338
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 341
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 342
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 345
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getModuleIndex()I

    move-result v0

    const/16 v1, 0xad

    if-ne v0, v1, :cond_1

    .line 346
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const/16 v4, 0xd4

    aput v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/impl/ImplFactory;->initAdditional(Lcom/android/camera/ActivityBase;[I)V

    .line 349
    :cond_1
    return-void

    nop

    :array_0
    .array-data 4
        0xa4
        0xae
    .end array-data
.end method

.method protected resetMetaDataManager()V
    .locals 0

    .line 3207
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedMetadata()Z

    .line 3210
    return-void
.end method

.method public resumePreview()V
    .locals 2

    .line 2656
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "resumePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2657
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->previewWhenSessionSuccess()V

    .line 2658
    return-void
.end method

.method public scanQRCodeEnabled()Z
    .locals 2

    .line 375
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isScanQRCode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_0

    .line 378
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_0

    .line 380
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 381
    invoke-static {}, Lcom/android/camera/CameraSettings;->isPortraitModeBackOn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 375
    :goto_0
    return v0
.end method

.method protected sendOpenFailMessage()V
    .locals 2

    .line 5105
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessage(I)Z

    .line 5106
    return-void
.end method

.method public setFrameAvailable(Z)V
    .locals 1

    .line 1927
    invoke-super {p0, p1}, Lcom/android/camera/module/BaseModule;->setFrameAvailable(Z)V

    .line 1929
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraSoundOpen()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1930
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1931
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1932
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1933
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1934
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    const/4 v0, 0x7

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->loadCameraSound(I)V

    .line 1936
    :cond_0
    return-void
.end method

.method public shouldReleaseLater()Z
    .locals 3

    .line 2017
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsImageCaptureIntent:Z

    if-nez v0, :cond_2

    .line 2018
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mMultiSnapStatus:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x30

    .line 2021
    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x31

    .line 2022
    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    .line 2024
    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->isFocusing()Z

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_1

    const-string v0, "pref_qc_camera_exposuretime_key"

    .line 2027
    const v1, 0x7f090136

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2026
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2027
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 2017
    :goto_0
    return v0
.end method

.method public showQRCodeResult()V
    .locals 4

    .line 5084
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v0, :cond_0

    .line 5085
    return-void

    .line 5087
    :cond_0
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/PreviewDecodeManager;->getScanResult()Ljava/lang/String;

    move-result-object v0

    .line 5088
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 5092
    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 5093
    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->dismissKeyguard()V

    .line 5094
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.xiaomi.scanner.receiver.senderbarcodescanner"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 5095
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 5096
    const-string v3, "com.xiaomi.scanner"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 5097
    const-string v3, "result"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 5098
    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->sendBroadcast(Landroid/content/Intent;)V

    .line 5099
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Lcom/android/camera/ActivityBase;->setJumpFlag(I)V

    .line 5100
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/PreviewDecodeManager;->resetScanResult()V

    .line 5101
    return-void

    .line 5089
    :cond_2
    :goto_0
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v1, "showQRCodeResult: get a null result!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5090
    return-void
.end method

.method public startAiLens()V
    .locals 4

    .line 5048
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$24;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$24;-><init>(Lcom/android/camera/module/Camera2Module;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 5054
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .line 878
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 879
    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 882
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mMaxFaceCount:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_1

    .line 883
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 884
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 886
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1}, Lcom/android/camera2/Camera2Proxy;->startFaceDetection()V

    .line 887
    invoke-virtual {p0, v0, v0}, Lcom/android/camera/module/Camera2Module;->updateFaceView(ZZ)V

    .line 889
    :cond_1
    return-void

    .line 880
    :cond_2
    :goto_0
    return-void
.end method

.method public startFocus()V
    .locals 3

    .line 386
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDeviceAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 387
    return-void

    .line 389
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 390
    return-void

    .line 392
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFocusAreaSupported:Z

    if-eqz v0, :cond_2

    .line 393
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/FocusTask;->create(I)Lcom/android/camera/module/loader/camera2/FocusTask;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/android/camera2/Camera2Proxy;->startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V

    goto :goto_0

    .line 395
    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->resumePreview()V

    .line 397
    :goto_0
    return-void
.end method

.method public startLiveShot()V
    .locals 6

    .line 619
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorderStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 620
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-nez v1, :cond_0

    .line 621
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/Camera;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->getEGLContext14()Landroid/opengl/EGLContext;

    move-result-object v1

    .line 622
    new-instance v2, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v3, v3, Lcom/android/camera/CameraSize;->width:I

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mVideoSize:Lcom/android/camera/CameraSize;

    iget v4, v4, Lcom/android/camera/CameraSize;->height:I

    iget-boolean v5, p0, Lcom/android/camera/module/Camera2Module;->mIsMicrophoneEnabled:Z

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;-><init>(IILandroid/opengl/EGLContext;Z)V

    iput-object v2, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    .line 626
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->setFpsReduction(F)V

    .line 628
    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    iget v2, p0, Lcom/android/camera/module/Camera2Module;->mOrientationCompensation:I

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->setOrientationHint(I)V

    .line 629
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->start()V

    .line 630
    monitor-exit v0

    .line 631
    return-void

    .line 630
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public startObjectTracking()V
    .locals 0

    .line 1011
    return-void
.end method

.method public startPreview()V
    .locals 14

    .line 2356
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_9

    .line 2357
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V

    .line 2358
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V

    .line 2359
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p0}, Lcom/android/camera2/Camera2Proxy;->setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V

    .line 2360
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mErrorCallback:Lcom/android/camera/CameraErrorCallbackImpl;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setErrorCallback(Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;)V

    .line 2361
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPreview: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2362
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPictureSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setPictureSize(Lcom/android/camera/CameraSize;)V

    .line 2363
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    if-eqz v0, :cond_0

    .line 2364
    const/16 v0, 0x23

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->getSubPictureSize(IZ)Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 2365
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v1, v0}, Lcom/android/camera2/Camera2Proxy;->setSubPictureSize(Lcom/android/camera/CameraSize;)V

    .line 2367
    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isEnableQcfa()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2368
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v3, "[QCFA] startPreview: set qcfa enable"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2369
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v2}, Lcom/android/camera2/Camera2Proxy;->setQcfaEnable(Z)V

    goto :goto_0

    .line 2371
    :cond_1
    sget-object v0, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    const-string v3, "[QCFA] startPreview: set qcfa disable"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2372
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setQcfaEnable(Z)V

    .line 2375
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/camera/module/Camera2Module;->mSurfaceCreatedTimestamp:J

    .line 2377
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->scanQRCodeEnabled()Z

    move-result v0

    .line 2378
    if-eqz v0, :cond_2

    .line 2379
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v3

    iget v4, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    invoke-virtual {v3, v4, v1}, Lcom/android/zxing/PreviewDecodeManager;->init(II)V

    .line 2381
    :cond_2
    invoke-static {}, Lcom/mi/config/b;->fR()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2382
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v3

    if-eqz v3, :cond_4

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v4, 0xa3

    if-eq v3, v4, :cond_3

    iget v3, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v4, 0xab

    if-ne v3, v4, :cond_4

    .line 2384
    :cond_3
    move v3, v2

    goto :goto_1

    .line 2382
    :cond_4
    nop

    .line 2384
    move v3, v1

    :goto_1
    if-eqz v3, :cond_5

    .line 2385
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v4

    iget v5, p0, Lcom/android/camera/module/Camera2Module;->mBogusCameraId:I

    invoke-virtual {v4, v5, v2}, Lcom/android/zxing/PreviewDecodeManager;->init(II)V

    .line 2387
    :cond_5
    if-nez v0, :cond_7

    if-eqz v3, :cond_6

    goto :goto_2

    .line 2388
    :cond_6
    move v8, v1

    goto :goto_3

    .line 2387
    :cond_7
    :goto_2
    nop

    .line 2388
    move v8, v2

    :goto_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 2389
    if-eqz v0, :cond_8

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 2390
    move-object v7, v1

    goto :goto_4

    .line 2389
    :cond_8
    const/4 v0, 0x0

    .line 2390
    move-object v7, v0

    :goto_4
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 2392
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->isNeedRawStream()Z

    move-result v9

    .line 2393
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getOperatingMode()I

    move-result v10

    iget-boolean v11, p0, Lcom/android/camera/module/Camera2Module;->mEnableParallelSession:Z

    .line 2396
    invoke-static {}, Lcom/android/zxing/PreviewDecodeManager;->getInstance()Lcom/android/zxing/PreviewDecodeManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/zxing/PreviewDecodeManager;->getHandler()Landroid/os/Handler;

    move-result-object v13

    .line 2390
    move-object v12, p0

    invoke-virtual/range {v6 .. v13}, Lcom/android/camera2/Camera2Proxy;->startPreviewSession(Landroid/view/Surface;ZZIZLcom/android/camera2/Camera2Proxy$CameraPreviewCallback;Landroid/os/Handler;)V

    .line 2398
    :cond_9
    return-void
.end method

.method public startScreenLight(II)V
    .locals 2

    .line 5681
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-eqz v0, :cond_0

    .line 5682
    return-void

    .line 5684
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$31;

    invoke-direct {v1, p0, p2, p1}, Lcom/android/camera/module/Camera2Module$31;-><init>(Lcom/android/camera/module/Camera2Module;II)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 5698
    return-void
.end method

.method public stopFaceDetection(Z)V
    .locals 3

    .line 893
    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionEnabled:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 897
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 898
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    .line 899
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_2

    .line 900
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0}, Lcom/android/camera2/Camera2Proxy;->stopFaceDetection()V

    .line 902
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mFaceDetectionStarted:Z

    .line 903
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setActiveIndicator(I)V

    .line 904
    invoke-virtual {p0, v0, p1}, Lcom/android/camera/module/Camera2Module;->updateFaceView(ZZ)V

    .line 905
    return-void

    .line 894
    :cond_3
    :goto_0
    return-void
.end method

.method public stopLiveShot(Z)V
    .locals 2

    .line 634
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorderStateLock:Ljava/lang/Object;

    monitor-enter v0

    .line 635
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    if-eqz v1, :cond_0

    .line 636
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->stop()V

    .line 637
    if-eqz p1, :cond_0

    .line 638
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->release()V

    .line 639
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCircularMediaRecorder:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    .line 642
    :cond_0
    monitor-exit v0

    .line 643
    return-void

    .line 642
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public stopObjectTracking(Z)V
    .locals 0

    .line 990
    return-void
.end method

.method public stopScreenLight()V
    .locals 2

    .line 5701
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$32;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$32;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 5715
    return-void
.end method

.method protected trackModeCustomInfo(I)V
    .locals 3

    .line 5719
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_0

    .line 5720
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module;->trackManualInfo(I)V

    goto :goto_0

    .line 5721
    :cond_0
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_2

    .line 5722
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->isFaceBeautyOn(Lcom/android/camera/fragment/beauty/BeautyValues;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5723
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    new-instance v1, Lcom/android/camera/fragment/beauty/BeautyValues;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    invoke-direct {v1, v2}, Lcom/android/camera/fragment/beauty/BeautyValues;-><init>(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera/module/Camera2Module;->trackBeautyInfo(IZLcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 5725
    :cond_1
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWidePictureTaken()V

    goto :goto_0

    .line 5726
    :cond_2
    iget p1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v0, 0xa5

    if-ne p1, v0, :cond_3

    .line 5727
    invoke-static {}, Lcom/android/camera/statistic/CameraStatUtil;->trackUltraWidePictureTaken()V

    .line 5729
    :cond_3
    :goto_0
    return-void
.end method

.method public tryRemoveCountDownMessage()V
    .locals 2

    .line 1785
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1786
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 1787
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCountdownDisposable:Lio/reactivex/disposables/Disposable;

    .line 1789
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v1, Lcom/android/camera/module/Camera2Module$10;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$10;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 1797
    :cond_0
    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    .line 353
    invoke-super {p0}, Lcom/android/camera/module/BaseModule;->unRegisterProtocol()V

    .line 354
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 355
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 356
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa5

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 357
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc1

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 358
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc3

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 359
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 362
    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    .line 363
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImplFactory()Lcom/android/camera/module/impl/ImplFactory;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachAdditional()V

    .line 364
    return-void
.end method

.method public updateBacklight()V
    .locals 1

    .line 5501
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 5504
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isSilhouette:Z

    .line 5505
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->applyBacklightEffect()V

    .line 5506
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5507
    return-void

    .line 5502
    :cond_1
    :goto_0
    return-void
.end method

.method protected updateFaceView(ZZ)V
    .locals 2

    .line 961
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 962
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    invoke-virtual {v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 964
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    .line 965
    nop

    .line 964
    invoke-virtual {v0, v1, p1, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 965
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 966
    return-void
.end method

.method public updateFlashPreference()V
    .locals 4

    .line 3747
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 3749
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->getRequestFlashMode()Ljava/lang/String;

    move-result-object v1

    .line 3751
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    .line 3752
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAiSceneInHdrOrFlashOn()V

    .line 3754
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->setFlashMode(Ljava/lang/String;)V

    .line 3757
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mLastFlashMode:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 3758
    invoke-static {v0, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v3, 0x67

    if-eq v1, v3, :cond_1

    .line 3759
    invoke-static {v0, v2}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_2

    .line 3760
    :cond_1
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAsdSceneInHdrOrFlashChange()V

    .line 3763
    :cond_2
    iput-object v0, p0, Lcom/android/camera/module/Camera2Module;->mLastFlashMode:Ljava/lang/String;

    .line 3775
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->stopObjectTracking(Z)V

    .line 3776
    return-void
.end method

.method public updateHDRPreference()V
    .locals 4

    .line 3781
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentHdr()Lcom/android/camera/data/data/config/ComponentConfigHdr;

    move-result-object v0

    .line 3782
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3783
    return-void

    .line 3785
    :cond_0
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigHdr;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 3787
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    const/4 v3, 0x0

    if-lez v1, :cond_1

    .line 3788
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v1}, Lcom/android/camera/MutexModeManager;->isHdr()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3789
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->onHDRSceneChanged(Z)V

    .line 3794
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    .line 3796
    const-string v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mAiSceneEnabled:Z

    if-eqz v1, :cond_3

    :cond_2
    iget v1, p0, Lcom/android/camera/module/Camera2Module;->mZoomValue:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_4

    .line 3798
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v3}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerEnable(Z)V

    .line 3799
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mHdrCheckEnabled:Z

    goto :goto_1

    .line 3801
    :cond_4
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAiSceneInHdrOrFlashOn()V

    .line 3802
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resetAsdSceneInHdrOrFlashChange()V

    .line 3803
    const-string v1, "auto"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5

    .line 3804
    iput-boolean v1, p0, Lcom/android/camera/module/Camera2Module;->mHdrCheckEnabled:Z

    goto :goto_0

    .line 3807
    :cond_5
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module;->mHdrCheckEnabled:Z

    .line 3809
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->setHDRCheckerEnable(Z)V

    .line 3811
    :goto_1
    return-void
.end method

.method public updateManualEvAdjust()V
    .locals 8

    .line 4296
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0xa7

    if-ne v0, v1, :cond_5

    .line 4298
    const-string v0, "pref_qc_camera_exposuretime_key"

    .line 4299
    const v1, 0x7f090136

    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 4298
    invoke-direct {p0, v0, v2}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4300
    const-string v2, "pref_qc_camera_iso_key"

    .line 4301
    const v3, 0x7f0900aa

    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4300
    invoke-direct {p0, v2, v4}, Lcom/android/camera/module/Camera2Module;->getManualValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 4302
    sget-object v4, Lcom/android/camera/module/Camera2Module;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MODE_MANUAL: exposureTime = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "iso = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4303
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    .line 4304
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    goto :goto_1

    .line 4305
    :cond_0
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 4306
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 4307
    :cond_2
    :goto_0
    move v4, v5

    :goto_1
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    if-eqz v6, :cond_3

    .line 4308
    iget-object v6, p0, Lcom/android/camera/module/Camera2Module;->mHandler:Lcom/android/camera/module/Camera2Module$MainHandler;

    new-instance v7, Lcom/android/camera/module/Camera2Module$21;

    invoke-direct {v7, p0, v4}, Lcom/android/camera/module/Camera2Module$21;-><init>(Lcom/android/camera/module/Camera2Module;Z)V

    invoke-virtual {v6, v7}, Lcom/android/camera/module/Camera2Module$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 4316
    :cond_3
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v4}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result v4

    if-ne v5, v4, :cond_5

    iget-boolean v4, p0, Lcom/android/camera/module/Camera2Module;->m3ALocked:Z

    if-eqz v4, :cond_5

    .line 4318
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 4319
    invoke-virtual {p0, v3}, Lcom/android/camera/module/Camera2Module;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 4320
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    new-instance v1, Lcom/android/camera/module/Camera2Module$22;

    invoke-direct {v1, p0}, Lcom/android/camera/module/Camera2Module$22;-><init>(Lcom/android/camera/module/Camera2Module;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 4326
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->unlockAEAF()V

    .line 4329
    :cond_5
    return-void
.end method

.method public updateMoon(Z)V
    .locals 1

    .line 5592
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 5594
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    .line 5595
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setSuperResolution(Z)V

    .line 5597
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateFocusMode()V

    .line 5598
    const/16 p1, 0x23

    iput p1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5600
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    invoke-virtual {v0, p1}, Lcom/android/camera2/Camera2Proxy;->setASDScene(I)V

    .line 5601
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    goto :goto_0

    .line 5604
    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    if-eqz p1, :cond_1

    .line 5605
    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    .line 5606
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->setFocusMode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 5607
    invoke-virtual {p0, p1}, Lcom/android/camera/module/Camera2Module;->setFocusMode(Ljava/lang/String;)V

    .line 5609
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    const/16 v0, -0x23

    invoke-virtual {p1, v0}, Lcom/android/camera2/Camera2Proxy;->setASDScene(I)V

    .line 5612
    :cond_1
    :goto_0
    return-void
.end method

.method public updateMoonNight()V
    .locals 7

    .line 5569
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->mIsMoonMode:Z

    .line 5570
    const/16 v1, 0xa

    invoke-direct {p0, v1, v0}, Lcom/android/camera/module/Camera2Module;->checkCloseMoonMode(II)V

    .line 5571
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    .line 5572
    const/16 v3, 0xa4

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    .line 5574
    const-string v3, "e"

    const/4 v4, 0x1

    new-array v5, v4, [I

    const/16 v6, 0xc1

    aput v6, v5, v0

    invoke-interface {v2, v3, v5}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    .line 5583
    const-string v0, "0"

    invoke-virtual {p0, v0}, Lcom/android/camera/module/Camera2Module;->setFlashMode(Ljava/lang/String;)V

    .line 5584
    invoke-direct {p0, v4}, Lcom/android/camera/module/Camera2Module;->updateMfnr(Z)V

    .line 5585
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->updateOIS()V

    .line 5586
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 5587
    iput v1, p0, Lcom/android/camera/module/Camera2Module;->mCurrentAiScene:I

    .line 5588
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5589
    return-void
.end method

.method public updatePreviewSurface()V
    .locals 3

    .line 2341
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_0

    .line 2342
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initEffectCropView()V

    .line 2344
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->checkDisplayOrientation()V

    .line 2345
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getSurfaceCreatedTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/module/Camera2Module;->mSurfaceCreatedTimestamp:J

    .line 2346
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    if-eqz v0, :cond_1

    .line 2347
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->width:I

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v1, v1, Lcom/android/camera/CameraSize;->height:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->updateCameraScreenNailSize(II)V

    .line 2349
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    if-eqz v0, :cond_2

    .line 2350
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    new-instance v1, Landroid/view/Surface;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v2}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraScreenNail;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-virtual {v0, v1}, Lcom/android/camera2/Camera2Proxy;->updateDeferPreviewSession(Landroid/view/Surface;)Z

    .line 2352
    :cond_2
    return-void
.end method

.method public updateSilhouette()V
    .locals 2

    .line 5510
    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isDoingAction()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 5513
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/Camera2Module;->isSilhouette:Z

    .line 5514
    iget v0, p0, Lcom/android/camera/module/Camera2Module;->mModuleIndex:I

    const/16 v1, 0x18

    invoke-direct {p0, v0, v1}, Lcom/android/camera/module/Camera2Module;->trackAISceneChanged(II)V

    .line 5515
    invoke-direct {p0, v1}, Lcom/android/camera/module/Camera2Module;->setAiSceneEffect(I)V

    .line 5516
    const-string v0, "off"

    invoke-direct {p0, v0}, Lcom/android/camera/module/Camera2Module;->updateHDR(Ljava/lang/String;)V

    .line 5520
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module;->resumePreviewInWorkThread()V

    .line 5521
    return-void

    .line 5511
    :cond_1
    :goto_0
    return-void
.end method
