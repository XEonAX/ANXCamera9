.class public Lcom/android/camera2/MiCamera2;
.super Lcom/android/camera2/Camera2Proxy;
.source "MiCamera2.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/MiCamera2$PictureCaptureCallback;,
        Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;,
        Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;
    }
.end annotation


# static fields
.field private static final MAX_IMAGE_BUFFER_SIZE:I = 0x5

.field private static final MAX_REALTIME_EXPOSURE_TIME:J = 0x7735940L

.field private static final MSG_WAITING_AF_LOCK_TIMEOUT:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field public static final ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;


# instance fields
.field private mCameraDevice:Landroid/hardware/camera2/CameraDevice;

.field private mCameraHandler:Landroid/os/Handler;

.field private mCameraMainThreadHandler:Landroid/os/Handler;

.field private mCapabilities:Lcom/android/camera2/CameraCapabilities;

.field private mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

.field private mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

.field private mConfigs:Lcom/android/camera2/CameraConfigs;

.field private mDepthReader:Landroid/media/ImageReader;

.field private mDisplayOrientation:I

.field private mHelperHandler:Landroid/os/Handler;

.field private mHighSpeedFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsPreviewCallbackEnabled:Z

.field private mIsPreviewCallbackStarted:Z

.field private mLockRequestHashCode:I

.field private mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

.field private mParalleCaptureSurfaceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mPendingNotifyVideoEnd:Z

.field private mPhotoImageReader:Landroid/media/ImageReader;

.field private mPortraitRawImageReader:Landroid/media/ImageReader;

.field private mPrecaptureRequestHashCode:I

.field private mPreviewImageReader:Landroid/media/ImageReader;

.field private mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

.field private mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

.field private mPreviewSurface:Landroid/view/Surface;

.field private mPreviewTotalResult:Landroid/hardware/camera2/TotalCaptureResult;

.field private mRawImageReader:Landroid/media/ImageReader;

.field private mRecordSurface:Landroid/view/Surface;

.field private mScreenLightColorTemperature:I

.field private mSessionId:I

.field private mToTele:Z

.field private mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

.field private mVideoSessionId:I

.field private mVideoSnapshotImageReader:Landroid/media/ImageReader;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 77
    const-class v0, Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    .line 79
    const/4 v0, 0x1

    new-array v0, v0, [Landroid/hardware/camera2/params/MeteringRectangle;

    new-instance v7, Landroid/hardware/camera2/params/MeteringRectangle;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Landroid/hardware/camera2/params/MeteringRectangle;-><init>(IIIII)V

    const/4 v1, 0x0

    aput-object v7, v0, v1

    sput-object v0, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-void
.end method

.method public constructor <init>(Landroid/hardware/camera2/CameraDevice;ILcom/android/camera2/CameraCapabilities;Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 0
    .param p4    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 141
    invoke-direct {p0, p2}, Lcom/android/camera2/Camera2Proxy;-><init>(I)V

    .line 142
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 143
    iput-object p3, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 144
    new-instance p1, Lcom/android/camera2/CameraConfigs;

    invoke-direct {p1}, Lcom/android/camera2/CameraConfigs;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 145
    iput-object p4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    .line 146
    iput-object p5, p0, Lcom/android/camera2/MiCamera2;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 148
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->initHelperHandler(Landroid/os/Looper;)V

    .line 150
    new-instance p1, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-direct {p1, p0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;-><init>(Lcom/android/camera2/MiCamera2;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    .line 152
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 75
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->runCaptureSequence()V

    return-void
.end method

.method static synthetic access$1002(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/TotalCaptureResult;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewTotalResult:Landroid/hardware/camera2/TotalCaptureResult;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/android/camera2/MiCamera2;Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/android/camera2/MiCamera2;)Z
    .locals 0

    .line 75
    iget-boolean p0, p0, Lcom/android/camera2/MiCamera2;->mToTele:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera2/MiCamera2;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    return p0
.end method

.method static synthetic access$1302(Lcom/android/camera2/MiCamera2;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    return p1
.end method

.method static synthetic access$1400(Lcom/android/camera2/MiCamera2;)Landroid/os/Handler;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/android/camera2/MiCamera2;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    return p0
.end method

.method static synthetic access$1502(Lcom/android/camera2/MiCamera2;I)I
    .locals 0

    .line 75
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    return p1
.end method

.method static synthetic access$1600(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerPrecapture()V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->captureStillPicture()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2Shot;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera2/MiCamera2;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 75
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera2/MiCamera2;)Z
    .locals 0

    .line 75
    iget-boolean p0, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    return p0
.end method

.method static synthetic access$502(Lcom/android/camera2/MiCamera2;Z)Z
    .locals 0

    .line 75
    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera2/MiCamera2;)I
    .locals 0

    .line 75
    iget p0, p0, Lcom/android/camera2/MiCamera2;->mVideoSessionId:I

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera2/MiCamera2;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 75
    iget-object p0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 0

    .line 75
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    return-void
.end method

.method private addFocusCaptureKeysToRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 1193
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1194
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1195
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1196
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1197
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1198
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1199
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1200
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1201
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1202
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1203
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1205
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1206
    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1207
    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1209
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1210
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1212
    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1214
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1215
    return-void
.end method

.method private applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3

    .line 2207
    if-nez p1, :cond_0

    .line 2208
    return-void

    .line 2210
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyAELock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2211
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2212
    return-void
.end method

.method private applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2233
    if-nez p1, :cond_0

    .line 2234
    return-void

    .line 2236
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    .line 2237
    if-eqz v0, :cond_1

    .line 2238
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 2240
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v1, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2242
    :goto_0
    return-void
.end method

.method private applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2245
    if-nez p1, :cond_0

    .line 2246
    return-void

    .line 2248
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;

    move-result-object v0

    .line 2249
    if-eqz v0, :cond_1

    .line 2250
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 2252
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    sget-object v1, Lcom/android/camera2/MiCamera2;->ZERO_WEIGHT_3A_REGION:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2254
    :goto_0
    return-void
.end method

.method private applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 1

    .line 2215
    if-nez p1, :cond_0

    .line 2216
    return-void

    .line 2218
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2219
    return-void
.end method

.method private applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2222
    if-nez p1, :cond_0

    .line 2223
    return-void

    .line 2225
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAWBMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2226
    return-void
.end method

.method private applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2556
    if-nez p1, :cond_0

    .line 2557
    return-void

    .line 2559
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAiSceneDetectEnabled()Z

    move-result v0

    .line 2560
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyASDEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2561
    return-void
.end method

.method private applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2564
    if-nez p1, :cond_0

    .line 2565
    return-void

    .line 2568
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getAiSceneDetectPeriod()I

    move-result v0

    .line 2569
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyAiScenePeriod(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2570
    return-void
.end method

.method private applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2257
    if-nez p1, :cond_0

    .line 2258
    return-void

    .line 2261
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_ANTIBANDING_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getAntiBanding()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2262
    return-void
.end method

.method private applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7

    .line 2615
    if-nez p1, :cond_0

    .line 2616
    return-void

    .line 2619
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    .line 2620
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isOISEnabled()Z

    move-result v1

    .line 2621
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isDebugOsBuild()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 2622
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "EIS&OIS are both on"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2624
    :cond_2
    :goto_0
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EIS: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_3

    const-string v4, "on"

    goto :goto_1

    :cond_3
    const-string v4, "off"

    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2625
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2626
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_4

    .line 2627
    nop

    .line 2626
    move v5, v4

    goto :goto_2

    .line 2628
    :cond_4
    nop

    .line 2626
    move v5, v3

    :goto_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 2625
    invoke-virtual {p1, v2, v5}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2629
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2630
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "OIS: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v0, :cond_5

    if-eqz v1, :cond_5

    const-string v6, "on"

    goto :goto_3

    :cond_5
    const-string v6, "off"

    :goto_3
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2631
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->LENS_OPTICAL_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2632
    if-nez v0, :cond_6

    if-eqz v1, :cond_6

    .line 2633
    nop

    .line 2632
    move v3, v4

    goto :goto_4

    .line 2634
    :cond_6
    nop

    .line 2632
    :goto_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2631
    invoke-virtual {p1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2636
    :cond_7
    return-void
.end method

.method private applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 3083
    if-nez p1, :cond_0

    .line 3084
    return-void

    .line 3086
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBeauty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3087
    return-void

    .line 3089
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3090
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportVideoBeauty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 3091
    return-void

    .line 3094
    :cond_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object v0

    if-nez v0, :cond_4

    .line 3095
    return-void

    .line 3097
    :cond_4
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyBeautyParameter(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 3098
    return-void
.end method

.method private applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 2724
    if-nez p1, :cond_0

    .line 2725
    return-void

    .line 2728
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportBokeh()Z

    move-result p2

    if-nez p2, :cond_1

    .line 2729
    return-void

    .line 2732
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isBokehEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyBokehEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2733
    return-void
.end method

.method private applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2533
    if-nez p1, :cond_0

    .line 2534
    return-void

    .line 2536
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportCameraAi30()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2537
    return-void

    .line 2539
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isCameraAi30Enabled()Z

    move-result v0

    .line 2540
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2541
    return-void
.end method

.method private applyColorEffect(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2265
    if-nez p1, :cond_0

    .line 2266
    return-void

    .line 2268
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getColorEffect()I

    move-result v0

    .line 2269
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_EFFECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2270
    return-void
.end method

.method private applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2

    .line 2876
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2877
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2878
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2879
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2880
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2881
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2884
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2885
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2886
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2887
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2888
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2889
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2891
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2892
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2894
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2895
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2896
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2897
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2898
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2899
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2900
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2901
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2903
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2904
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2906
    :cond_1
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2907
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2908
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2909
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2910
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2911
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2912
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2913
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2914
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2915
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2916
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2918
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2920
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2921
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2924
    :cond_3
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 2926
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2927
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2928
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2930
    :cond_5
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPanoramaModule()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2931
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2935
    :cond_6
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 2936
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2937
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2938
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2939
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2940
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2943
    :cond_7
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2944
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2945
    return-void
.end method

.method private applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2496
    if-nez p1, :cond_0

    .line 2497
    return-void

    .line 2500
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportContrast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2501
    return-void

    .line 2504
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getContrastLevel()I

    move-result v0

    .line 2505
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2506
    return-void
.end method

.method private applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2229
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getAwbCustomValue()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2230
    return-void
.end method

.method private applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V
    .locals 3

    .line 2544
    if-nez p1, :cond_0

    .line 2545
    return-void

    .line 2547
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyDepurpleEnable: isSupport = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v2}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", enadled = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2549
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportDepurple()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2550
    return-void

    .line 2552
    :cond_1
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2553
    return-void
.end method

.method private applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 2853
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportDeviceOrientation()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2856
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyDeviceOrientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2857
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2858
    return-void

    .line 2854
    :cond_1
    :goto_0
    return-void
.end method

.method private applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 5

    .line 2274
    if-nez p1, :cond_0

    .line 2275
    return-void

    .line 2277
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureCompensationIndex()I

    move-result v0

    .line 2278
    invoke-static {}, Lcom/mi/config/b;->hD()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2279
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 2281
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result p2

    if-nez p2, :cond_1

    .line 2282
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p2, v1, v3

    if-lez p2, :cond_1

    .line 2283
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    long-to-double v0, v0

    const-wide v2, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v0, v2

    double-to-float p2, v0

    .line 2284
    float-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    .line 2285
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyExposureCompensation: EV = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2286
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRational()Landroid/util/Rational;

    move-result-object p2

    .line 2287
    invoke-virtual {p2}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    int-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-virtual {p2}, Landroid/util/Rational;->getNumerator()I

    move-result p2

    int-to-double v2, p2

    div-double/2addr v0, v2

    double-to-int p2, v0

    .line 2288
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxExposureCompensation()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 2291
    :cond_1
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyExposureCompensation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2292
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2293
    return-void
.end method

.method private applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2525
    if-nez p1, :cond_0

    .line 2526
    return-void

    .line 2528
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureMeteringMode()I

    move-result v0

    .line 2529
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2530
    return-void
.end method

.method private applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 4

    .line 2480
    if-nez p1, :cond_0

    .line 2481
    return-void

    .line 2484
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    .line 2486
    invoke-static {}, Lcom/mi/config/b;->hD()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    if-ne p2, v2, :cond_1

    .line 2487
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    const-wide/32 v2, 0x7735940

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 2489
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->hD()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x3

    if-ne p2, v2, :cond_3

    .line 2490
    :cond_2
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyExposureTime: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2491
    invoke-static {p1, v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;J)V

    .line 2493
    :cond_3
    return-void
.end method

.method private applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 3116
    if-nez p1, :cond_0

    .line 3117
    return-void

    .line 3119
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportEyeLight()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3120
    return-void

    .line 3122
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fq()Z

    move-result v0

    if-nez v0, :cond_2

    .line 3123
    return-void

    .line 3125
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getEyeLightType()I

    move-result v0

    .line 3126
    if-gez v0, :cond_3

    .line 3127
    const/4 v0, 0x0

    invoke-static {p1, v0, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    goto :goto_0

    .line 3129
    :cond_3
    const/16 v1, 0x64

    invoke-static {p1, v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;II)V

    .line 3131
    :goto_0
    return-void
.end method

.method private applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 3101
    if-nez p1, :cond_0

    .line 3102
    return-void

    .line 3104
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBokehAdjust()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3105
    sget-object p1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v0, "set f number on unsupported devices"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3106
    return-void

    .line 3108
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 3109
    return-void

    .line 3112
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFNumber()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 3113
    return-void
.end method

.method private applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 2766
    if-nez p1, :cond_0

    .line 2767
    return-void

    .line 2770
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceAgeAnalyze()Z

    move-result p2

    if-nez p2, :cond_1

    .line 2771
    return-void

    .line 2774
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceAgeAnalyzeEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceAgeAnalyzeEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2775
    return-void
.end method

.method private applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2296
    if-nez p1, :cond_0

    .line 2297
    return-void

    .line 2299
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isFaceDetectionEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2300
    const/4 v0, 0x2

    goto :goto_0

    .line 2301
    :cond_1
    const/4 v0, 0x0

    .line 2302
    :goto_0
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->STATISTICS_FACE_DETECT_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2303
    return-void
.end method

.method private applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 2780
    if-nez p1, :cond_0

    .line 2781
    return-void

    .line 2784
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportFaceScore()Z

    move-result p2

    if-nez p2, :cond_1

    .line 2785
    return-void

    .line 2788
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFaceScoreEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceScoreEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2789
    return-void
.end method

.method private applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 10

    .line 2307
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyFlashMode: request = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", applyType = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2308
    if-nez p1, :cond_0

    .line 2309
    return-void

    .line 2312
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    .line 2313
    nop

    .line 2315
    const/4 v1, 0x6

    const/4 v2, 0x2

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq p2, v3, :cond_3

    if-eq p2, v1, :cond_1

    goto :goto_2

    .line 2318
    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2319
    nop

    .line 2320
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2321
    nop

    .line 2344
    :goto_0
    move v0, v2

    move v6, v5

    goto :goto_3

    :cond_2
    move v0, v2

    goto :goto_2

    .line 2327
    :cond_3
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 2328
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-lez v0, :cond_4

    .line 2329
    nop

    .line 2344
    :goto_1
    move v0, v4

    move v6, v0

    goto :goto_3

    .line 2331
    :cond_4
    nop

    .line 2332
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2333
    goto :goto_0

    .line 2336
    :cond_5
    if-ne v0, v3, :cond_6

    .line 2337
    goto :goto_1

    .line 2344
    :cond_6
    :goto_2
    move v6, v4

    :goto_3
    sget-object v7, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "applyFlashMode: flashMode = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", mScreenLightCallback = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2345
    const/16 v7, 0x65

    if-eq v0, v7, :cond_9

    const/16 v1, 0x67

    if-eq v0, v1, :cond_8

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_6

    .line 2375
    :pswitch_0
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x4

    .line 2376
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2375
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2377
    goto/16 :goto_6

    .line 2369
    :pswitch_1
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2370
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2369
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2371
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2372
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2371
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2373
    goto/16 :goto_6

    .line 2359
    :pswitch_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportSnapShotTorch()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 2360
    invoke-static {p1, v6}, Lcom/android/camera2/compat/MiCameraCompat;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2363
    :cond_7
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2364
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2363
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2365
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2366
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2365
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2367
    goto/16 :goto_6

    .line 2353
    :pswitch_3
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2354
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2353
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2355
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2356
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2355
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2357
    goto/16 :goto_6

    .line 2347
    :pswitch_4
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2348
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2347
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2349
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2350
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2349
    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2351
    goto/16 :goto_6

    .line 2409
    :cond_8
    sget-object p1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_AUTO applyType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2410
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    if-eqz p1, :cond_e

    .line 2411
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {p1}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    goto/16 :goto_6

    .line 2379
    :cond_9
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    if-eqz p1, :cond_e

    .line 2380
    if-ne p2, v1, :cond_a

    .line 2381
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getCurrentColorTemperature()I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightColorTemperature:I

    .line 2383
    :cond_a
    const-string p1, "camera_screen_light_wb"

    iget v0, p0, Lcom/android/camera2/MiCamera2;->mScreenLightColorTemperature:I

    invoke-static {p1, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 2384
    invoke-static {p1}, Lcom/android/camera/Util;->getScreenLightColor(I)I

    move-result p1

    .line 2386
    const-string v0, "camera_screen_light_brightness"

    const/16 v2, 0xb4

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2387
    const-string v2, "camera_screen_light_delay"

    invoke-static {v2, v4}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 2388
    sget-object v4, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "applyFlashMode: FLASH_MODE_SCREEN_LIGHT_ON color = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", brightness = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", delay = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", mCameraHandler = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2391
    if-eq p2, v1, :cond_d

    if-ne p2, v3, :cond_b

    goto :goto_4

    .line 2395
    :cond_b
    if-nez v2, :cond_c

    .line 2396
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {p1}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->stopScreenLight()V

    goto :goto_5

    .line 2398
    :cond_c
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    new-instance p2, Lcom/android/camera2/MiCamera2$8;

    invoke-direct {p2, p0}, Lcom/android/camera2/MiCamera2$8;-><init>(Lcom/android/camera2/MiCamera2;)V

    int-to-long v0, v2

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_5

    .line 2393
    :cond_d
    :goto_4
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    invoke-interface {p2, p1, v0}, Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;->startScreenLight(II)V

    .line 2406
    :goto_5
    nop

    .line 2415
    :cond_e
    :goto_6
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2427
    if-nez p1, :cond_0

    .line 2428
    return-void

    .line 2430
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getFocusMode()I

    move-result v0

    if-eqz v0, :cond_1

    .line 2431
    return-void

    .line 2433
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->LENS_FOCUS_DISTANCE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFocusDistance()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2434
    return-void
.end method

.method private applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2418
    if-nez p1, :cond_0

    .line 2419
    return-void

    .line 2421
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2422
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2423
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2424
    return-void
.end method

.method private applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4

    .line 2437
    if-nez p1, :cond_0

    .line 2438
    return-void

    .line 2440
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewFpsRange()Landroid/util/Range;

    move-result-object v0

    .line 2441
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyFpsRange: fpsRange = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2442
    if-nez v0, :cond_1

    .line 2443
    return-void

    .line 2446
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2447
    return-void
.end method

.method private applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2861
    if-nez p1, :cond_0

    .line 2862
    return-void

    .line 2864
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportFrontMirror()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2865
    return-void

    .line 2867
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2868
    return-void

    .line 2871
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isFrontMirror()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2872
    return-void
.end method

.method private applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2655
    if-nez p1, :cond_0

    .line 2656
    return-void

    .line 2659
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportHdr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2660
    return-void

    .line 2663
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2665
    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2666
    return-void

    .line 2669
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2670
    return-void
.end method

.method private applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ZI)V
    .locals 0

    .line 2674
    if-eqz p1, :cond_1

    const/4 p2, 0x1

    if-ne p3, p2, :cond_1

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 2676
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportAutoHdr()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 2679
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isHDRCheckerEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2680
    return-void

    .line 2677
    :cond_1
    :goto_0
    return-void
.end method

.method private applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2639
    if-nez p1, :cond_0

    .line 2640
    return-void

    .line 2643
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2644
    return-void

    .line 2647
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportHHT()Z

    move-result p2

    if-nez p2, :cond_2

    .line 2648
    return-void

    .line 2651
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isHHTEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2652
    return-void
.end method

.method private applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 5

    .line 2463
    if-nez p1, :cond_0

    .line 2464
    return-void

    .line 2466
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getISO()I

    move-result v0

    .line 2467
    invoke-static {}, Lcom/mi/config/b;->hD()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 2468
    if-lez v0, :cond_1

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    const-wide/32 v3, 0x7735940

    cmp-long p2, v1, v3

    if-lez p2, :cond_1

    .line 2469
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x419dcd6500000000L    # 1.25E8

    div-double/2addr v1, v3

    double-to-float p2, v1

    .line 2470
    int-to-float v0, v0

    mul-float/2addr v0, p2

    float-to-int p2, v0

    .line 2471
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getMaxIso()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 2474
    :cond_1
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyIso: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2475
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyISO(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2476
    return-void
.end method

.method private applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 2737
    if-nez p1, :cond_0

    .line 2738
    return-void

    .line 2741
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportLensDirtyDetect()Z

    move-result p2

    if-nez p2, :cond_1

    .line 2742
    return-void

    .line 2745
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isLensDirtyDetectEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2746
    return-void
.end method

.method private applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2

    .line 2683
    if-nez p1, :cond_0

    .line 2684
    return-void

    .line 2687
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportMfnr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2688
    return-void

    .line 2691
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2694
    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2695
    return-void

    .line 2698
    :cond_2
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applyMfnrEnable: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2699
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2700
    return-void
.end method

.method private applyNoiseReduction(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 3063
    if-nez p1, :cond_0

    .line 3064
    return-void

    .line 3066
    :cond_0
    const/4 v0, 0x2

    .line 3067
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3068
    return-void
.end method

.method private applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 3134
    if-nez p1, :cond_0

    .line 3135
    return-void

    .line 3137
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportNormalWideLDC()Z

    move-result v0

    if-nez v0, :cond_1

    .line 3138
    return-void

    .line 3141
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getNormalWideLDCEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    if-eq p2, v0, :cond_2

    const/4 p2, 0x1

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    .line 3142
    :goto_0
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 3143
    return-void
.end method

.method private applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2749
    if-nez p1, :cond_0

    .line 2750
    return-void

    .line 2753
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2754
    return-void

    .line 2757
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportPortraitLighting()Z

    move-result p2

    if-nez p2, :cond_2

    .line 2758
    return-void

    .line 2760
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getPortraitLightingPattern()I

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2761
    return-void
.end method

.method private applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2509
    if-nez p1, :cond_0

    .line 2510
    return-void

    .line 2512
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getSaturationLevel()I

    move-result v0

    .line 2513
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2514
    return-void
.end method

.method private applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2574
    if-nez p1, :cond_0

    .line 2575
    return-void

    .line 2577
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getSceneMode()I

    move-result v0

    .line 2578
    if-eqz v0, :cond_1

    .line 2579
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_SCENE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2580
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 2582
    :cond_1
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2584
    :goto_0
    return-void
.end method

.method private applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4

    .line 2975
    if-nez p1, :cond_0

    .line 2976
    return-void

    .line 2978
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getGpsLocation()Landroid/location/Location;

    move-result-object v0

    .line 2979
    if-eqz v0, :cond_1

    .line 2981
    new-instance v1, Landroid/location/Location;

    invoke-direct {v1, v0}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    .line 2984
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->JPEG_GPS_LOCATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2986
    :cond_1
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "jpegRotation="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getJpegRotation()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2987
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getJpegRotation()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2988
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getThumbnailSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 2989
    if-eqz v0, :cond_2

    .line 2990
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_SIZE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v2, Landroid/util/Size;

    .line 2991
    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v0

    invoke-direct {v2, v3, v0}, Landroid/util/Size;-><init>(II)V

    .line 2990
    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2993
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getJpegQuality()I

    move-result v0

    int-to-byte v0, v0

    .line 2994
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_THUMBNAIL_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2995
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2996
    return-void
.end method

.method private applySettingsForLockFocus(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 2130
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2131
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2132
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2133
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2135
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2136
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needScreenLight()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2137
    :cond_0
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2139
    :cond_1
    return-void
.end method

.method private applySettingsForPrecapture(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 2

    .line 2028
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2029
    const/4 v1, 0x6

    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2030
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2031
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2030
    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2032
    return-void
.end method

.method private applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 2960
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applySettingsForPreview: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2961
    if-nez p1, :cond_0

    .line 2962
    return-void

    .line 2964
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2966
    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2967
    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2968
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2969
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAWBLocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2970
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2971
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2972
    return-void
.end method

.method private applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 3035
    if-nez p1, :cond_0

    .line 3036
    return-void

    .line 3039
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3040
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3041
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3042
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3043
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3044
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3045
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3046
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3047
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3048
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3049
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 3050
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3051
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3053
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyVideoFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3054
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3055
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3060
    return-void
.end method

.method private applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2517
    if-nez p1, :cond_0

    .line 2518
    return-void

    .line 2520
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getSharpnessLevel()I

    move-result v0

    .line 2521
    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2522
    return-void
.end method

.method private applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2949
    if-nez p1, :cond_0

    .line 2950
    return-void

    .line 2953
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2954
    return-void

    .line 2956
    :cond_1
    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperNightScene(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2957
    return-void
.end method

.method private applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 2811
    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportSuperResolution()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2815
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2817
    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2818
    return-void

    .line 2822
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2823
    return-void

    .line 2812
    :cond_2
    :goto_0
    return-void
.end method

.method private applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 2

    .line 2703
    if-nez p1, :cond_0

    .line 2704
    return-void

    .line 2707
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportSwMfnr()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2708
    return-void

    .line 2711
    :cond_1
    const/4 v0, 0x3

    if-eq p2, v0, :cond_2

    .line 2714
    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2715
    return-void

    .line 2718
    :cond_2
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "applySwMfnrEnable: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2719
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applySwMfnrEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2720
    return-void
.end method

.method private applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 0

    .line 3146
    if-nez p1, :cond_0

    .line 3147
    return-void

    .line 3149
    :cond_0
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportUltraWideLDC()Z

    move-result p2

    if-nez p2, :cond_1

    .line 3150
    return-void

    .line 3153
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getUltraWideLDCEnabled()Z

    move-result p2

    .line 3154
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 3155
    return-void
.end method

.method private applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3

    .line 3071
    if-nez p1, :cond_0

    .line 3072
    return-void

    .line 3074
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v2, v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    .line 3075
    :cond_1
    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    .line 3076
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 3078
    :cond_2
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3080
    :goto_1
    return-void
.end method

.method private applyVideoFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 4

    .line 2450
    if-nez p1, :cond_0

    .line 2451
    return-void

    .line 2453
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getVideoFpsRange()Landroid/util/Range;

    move-result-object v0

    .line 2454
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyVideoFpsRange: fpsRange = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2455
    if-nez v0, :cond_1

    .line 2456
    return-void

    .line 2458
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2459
    return-void
.end method

.method private applyWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 3

    .line 2827
    if-nez p1, :cond_0

    .line 2828
    return-void

    .line 2831
    :cond_0
    const/4 v0, 0x3

    if-eq p2, v0, :cond_1

    .line 2832
    return-void

    .line 2835
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->isSupportWatermark()Z

    move-result p2

    if-nez p2, :cond_2

    .line 2836
    return-void

    .line 2839
    :cond_2
    const-string p2, ","

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getWaterMarkAppliedList()Ljava/util/List;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/Util;->join(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object p2

    .line 2840
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyWaterMark appliedList:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2841
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4

    .line 2842
    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyWaterMarkAppliedList(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2843
    const-string v0, "watermark"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2844
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getTimeWaterMarkValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera2/compat/MiCameraCompat;->applyTimeWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2846
    :cond_3
    const-string v0, "beautify"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 2847
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getFaceWaterMarkFormat()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera2/compat/MiCameraCompat;->applyFaceWaterMark(Landroid/hardware/camera2/CaptureRequest$Builder;Ljava/lang/String;)V

    .line 2850
    :cond_4
    return-void
.end method

.method private applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 7

    .line 2587
    if-nez p1, :cond_0

    .line 2588
    return-void

    .line 2590
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getZoomRatio()F

    move-result v0

    .line 2591
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v1}, Lcom/android/camera2/CameraCapabilities;->getActiveArraySize()Landroid/graphics/Rect;

    move-result-object v1

    .line 2592
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applyZoomRatio: ActiveArraySize="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2594
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 2595
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    .line 2596
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    .line 2597
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v6, v0

    div-float/2addr v5, v6

    float-to-int v0, v5

    .line 2598
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v6

    float-to-int v1, v1

    .line 2600
    sub-int v5, v3, v0

    sub-int v6, v4, v1

    add-int/2addr v3, v0

    add-int/2addr v4, v1

    invoke-virtual {v2, v5, v6, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 2602
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "applyZoomRatio: cropRegion="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2604
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2605
    return-void
.end method

.method private applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 1

    .line 2608
    if-nez p1, :cond_0

    .line 2609
    return-void

    .line 2611
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isZslEnabled()Z

    move-result v0

    invoke-static {p1, v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setZsl(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2612
    return-void
.end method

.method private cancelSession()V
    .locals 3

    .line 808
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cancelSession: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 810
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 811
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 812
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 813
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V

    .line 814
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 815
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 820
    :catch_0
    move-exception v0

    .line 821
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to stop repeating, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 822
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 817
    :catch_1
    move-exception v0

    .line 818
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to stop repeating session"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 819
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 823
    :cond_0
    :goto_0
    nop

    .line 824
    :goto_1
    return-void
.end method

.method private capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 2195
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v0, v0, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    if-eqz v0, :cond_0

    .line 2199
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object p1

    .line 2200
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result p1

    return p1

    .line 2202
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result p1

    return p1
.end method

.method private captureStillPicture()V
    .locals 2

    .line 2048
    const-string v0, "capture"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2049
    return-void

    .line 2051
    :cond_0
    const/4 v0, 0x0

    .line 2052
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 2065
    :pswitch_1
    new-instance v0, Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getCurrentCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera2/MiCamera2ShotParallelSequence;-><init>(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureResult;)V

    goto :goto_0

    .line 2062
    :pswitch_2
    new-instance v0, Lcom/android/camera2/MiCamera2ShotParallelDual;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotParallelDual;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 2063
    goto :goto_0

    .line 2059
    :pswitch_3
    new-instance v0, Lcom/android/camera2/MiCamera2ShotLive;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotLive;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 2060
    goto :goto_0

    .line 2056
    :pswitch_4
    new-instance v0, Lcom/android/camera2/MiCamera2ShotNormal;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotNormal;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 2057
    nop

    .line 2068
    :goto_0
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    .line 2069
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2Shot;->startShot()V

    .line 2070
    return-void

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private checkCameraDevice(Ljava/lang/String;)Z
    .locals 2

    .line 3170
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    .line 3178
    const/4 p1, 0x1

    return p1

    .line 3171
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "camera "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " is closed when "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3172
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkCaptureSession(Ljava/lang/String;)Z
    .locals 2

    .line 3158
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 3166
    const/4 p1, 0x1

    return p1

    .line 3159
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "session for camera "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " is closed when "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3160
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CaptureRequest;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 3621
    if-eqz p1, :cond_5

    .line 3624
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getTargets()Ljava/util/Collection;

    move-result-object v0

    .line 3625
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Range;

    .line 3626
    sget-object v2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createHighSpeedRequestList() fpsRange = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3631
    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    div-int/lit8 v1, v1, 0x1e

    .line 3632
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3636
    new-instance v3, Landroid/hardware/camera2/impl/CameraMetadataNative;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/hardware/camera2/impl/CameraMetadataNative;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;)V

    .line 3639
    nop

    .line 3640
    const/4 v4, -0x1

    const/4 v5, 0x0

    invoke-static {v3, v5, v4, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v3

    .line 3645
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 3646
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    .line 3647
    nop

    .line 3648
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v8

    const/4 v9, 0x3

    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    invoke-static {v7}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 3649
    sget-object v8, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3650
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 3649
    invoke-virtual {v3, v8, v11}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 3653
    :cond_0
    sget-object v8, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3654
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 3653
    invoke-virtual {v3, v8, v11}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3656
    :goto_0
    invoke-virtual {v3, v10}, Landroid/hardware/camera2/CaptureRequest$Builder;->setPartOfCHSRequestList(Z)V

    .line 3659
    const/4 v8, 0x0

    .line 3660
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v11, 0x2

    if-ne v0, v11, :cond_2

    .line 3663
    new-instance v0, Landroid/hardware/camera2/impl/CameraMetadataNative;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object v8

    invoke-direct {v0, v8}, Landroid/hardware/camera2/impl/CameraMetadataNative;-><init>(Landroid/hardware/camera2/impl/CameraMetadataNative;)V

    .line 3664
    invoke-static {v0, v5, v4, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->constructCaptureRequestBuilder(Landroid/hardware/camera2/impl/CameraMetadataNative;ZILandroid/hardware/camera2/CaptureRequest;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v8

    .line 3667
    sget-object p1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 3668
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 3667
    invoke-virtual {v8, p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3669
    invoke-virtual {v8, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3670
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/Surface;

    .line 3671
    invoke-virtual {v8, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3672
    invoke-virtual {v8, v10}, Landroid/hardware/camera2/CaptureRequest$Builder;->setPartOfCHSRequestList(Z)V

    .line 3675
    nop

    .line 3676
    invoke-static {v7}, Landroid/hardware/camera2/utils/SurfaceUtils;->isSurfaceForHwVideoEncoder(Landroid/view/Surface;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 3677
    goto :goto_1

    .line 3679
    :cond_1
    move-object p1, v7

    :goto_1
    invoke-virtual {v3, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3680
    goto :goto_2

    .line 3682
    :cond_2
    invoke-virtual {v3, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 3686
    :goto_2
    if-ge v5, v1, :cond_4

    .line 3687
    if-nez v5, :cond_3

    if-eqz v8, :cond_3

    .line 3689
    invoke-virtual {v8}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 3691
    :cond_3
    invoke-virtual {v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3686
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 3695
    :cond_4
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 3622
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Input capture request must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private genSessionId()I
    .locals 3

    .line 1666
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    .line 1667
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 1669
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "generateSessionId: id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1670
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    return v0
.end method

.method private getExposureTime()J
    .locals 2

    .line 1721
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    return-wide v0
.end method

.method private initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 1120
    nop

    .line 1122
    packed-switch p1, :pswitch_data_0

    .line 1142
    :pswitch_0
    const/4 p1, 0x0

    goto :goto_0

    .line 1138
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    goto :goto_0

    .line 1130
    :pswitch_2
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    .line 1131
    nop

    .line 1142
    :goto_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1143
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v0, v0, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    if-eqz v0, :cond_0

    .line 1144
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 1145
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1147
    :cond_0
    return-object p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private initHelperHandler(Landroid/os/Looper;)V
    .locals 1

    .line 155
    new-instance v0, Lcom/android/camera2/MiCamera2$1;

    invoke-direct {v0, p0, p1}, Lcom/android/camera2/MiCamera2$1;-><init>(Lcom/android/camera2/MiCamera2;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    .line 167
    return-void
.end method

.method private lockFocus()V
    .locals 4

    .line 2100
    const-string v0, "lockFocus"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2101
    return-void

    .line 2103
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "lockFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2106
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 2107
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 2109
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForLockFocus(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2110
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 2111
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v2

    iput v2, p0, Lcom/android/camera2/MiCamera2;->mLockRequestHashCode:I

    .line 2112
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2113
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->showAutoFocusStart()V

    .line 2114
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v0, v2, v3}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 2115
    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->setAFModeToPreview(I)V

    .line 2116
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 2117
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 2119
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2126
    :cond_1
    goto :goto_0

    .line 2123
    :catch_0
    move-exception v0

    .line 2124
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 2125
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 2127
    :goto_0
    return-void
.end method

.method private needOptimizedFlash()Z
    .locals 6

    .line 2148
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 2149
    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    .line 2150
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 2148
    :goto_0
    return v1
.end method

.method private needScreenLight()Z
    .locals 2

    .line 2155
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private prepareDepthImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4

    .line 333
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 336
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$6;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$6;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 347
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    const/4 v2, 0x2

    div-int/2addr v1, v2

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    div-int/2addr p1, v2

    const v3, 0x20363159

    invoke-static {v1, p1, v3, v2}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    .line 349
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 350
    return-void
.end method

.method private preparePhotoImageReader()V
    .locals 3

    .line 254
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 255
    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoFormat()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 256
    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getPhotoMaxImages()I

    move-result v2

    .line 254
    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader(Lcom/android/camera/CameraSize;II)V

    .line 257
    return-void
.end method

.method private preparePhotoImageReader(Lcom/android/camera/CameraSize;II)V
    .locals 1
    .param p1    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 231
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 235
    :cond_0
    nop

    .line 237
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    invoke-static {v0, p1, p2, p3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    .line 239
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/android/camera2/MiCamera2$2;

    invoke-direct {p2, p0}, Lcom/android/camera2/MiCamera2$2;-><init>(Lcom/android/camera2/MiCamera2;)V

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, p3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 251
    return-void
.end method

.method private preparePortraitRawImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4

    .line 353
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 356
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$7;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$7;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 366
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    const/16 v2, 0x100

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    .line 367
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 368
    return-void
.end method

.method private preparePreviewImageReader()V
    .locals 4

    .line 260
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 261
    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPreviewFormat()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 262
    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getPreviewMaxImages()I

    move-result v2

    .line 260
    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader(Lcom/android/camera/CameraSize;IILandroid/os/Handler;)V

    .line 263
    return-void
.end method

.method private preparePreviewImageReader(Lcom/android/camera/CameraSize;IILandroid/os/Handler;)V
    .locals 1
    .param p1    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 266
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 267
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 269
    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    invoke-static {v0, p1, p2, p3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    .line 271
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/android/camera2/MiCamera2$3;

    invoke-direct {p2, p0}, Lcom/android/camera2/MiCamera2$3;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 285
    if-eqz p4, :cond_1

    goto :goto_0

    :cond_1
    iget-object p4, p0, Lcom/android/camera2/MiCamera2;->mCameraMainThreadHandler:Landroid/os/Handler;

    .line 271
    :goto_0
    invoke-virtual {p1, p2, p4}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 286
    return-void
.end method

.method private prepareRawImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4
    .param p1    # Lcom/android/camera/CameraSize;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 289
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 293
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$4;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$4;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 306
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    const/16 v2, 0x25

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    .line 308
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 309
    return-void
.end method

.method private prepareRemoteImageReader()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 427
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 428
    new-instance v7, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 429
    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v2

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 430
    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v3

    const/16 v4, 0x23

    const/4 v5, 0x5

    const/4 v6, 0x1

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/protocol/IImageReaderParameterSets;-><init>(IIIII)V

    .line 434
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    .line 437
    new-instance v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 438
    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getSubPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v4

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 439
    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getSubPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v5

    const/16 v6, 0x23

    const/4 v7, 0x5

    const/4 v8, 0x0

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/xiaomi/protocol/IImageReaderParameterSets;-><init>(IIIII)V

    .line 443
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 445
    :cond_0
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v1

    .line 447
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->configCaptureOutputBuffer(Ljava/util/List;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 448
    return-object v0

    .line 449
    :catch_0
    move-exception v0

    .line 450
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 452
    const/4 v0, 0x0

    return-object v0
.end method

.method private prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V
    .locals 4

    .line 312
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_0

    .line 313
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 316
    :cond_0
    new-instance v0, Lcom/android/camera2/MiCamera2$5;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2$5;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 327
    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result p1

    const/16 v2, 0x100

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    .line 329
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 330
    return-void
.end method

.method private reset()V
    .locals 2

    .line 410
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "E: reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 412
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 413
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 414
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 415
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 416
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    .line 417
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    .line 418
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    .line 419
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    .line 420
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    .line 421
    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    .line 422
    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 423
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "X: reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    return-void
.end method

.method private runCaptureSequence()V
    .locals 4

    .line 1997
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->showAutoFocusFinish(Z)V

    .line 1998
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->getExposureTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1999
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->waitFlashClosed()V

    goto :goto_0

    .line 2001
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2002
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->captureStillPicture()V

    .line 2004
    :goto_0
    return-void
.end method

.method private runPrecaptureSequence()V
    .locals 3

    .line 2011
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "runPrecaptureSequence"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2014
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 2015
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 2016
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForPrecapture(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2017
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 2018
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest;->hashCode()I

    move-result v1

    iput v1, p0, Lcom/android/camera2/MiCamera2;->mPrecaptureRequestHashCode:I

    .line 2019
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2020
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2024
    goto :goto_0

    .line 2021
    :catch_0
    move-exception v0

    .line 2022
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 2023
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 2025
    :goto_0
    return-void
.end method

.method private setAFModeToPreview(I)V
    .locals 3

    .line 1083
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAFModeToPreview: focusMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1084
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1085
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1086
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1085
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1087
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1088
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1089
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1090
    return-void
.end method

.method private setVideoRecordControl(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 741
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setVideoRecordControl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 742
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    .line 743
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 744
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 745
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 746
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 747
    sget-object v1, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 748
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 749
    return-void
.end method

.method private triggerCapture()V
    .locals 5

    .line 1886
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->isNeedFlashOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 1887
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 1888
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needOptimizedFlash()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1889
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1890
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1889
    invoke-virtual {v0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1891
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v4, 0x2

    .line 1892
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1891
    invoke-virtual {v0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1894
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1895
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportSnapShotTorch()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1896
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-static {v0, v2}, Lcom/android/camera2/compat/MiCameraCompat;->applySnapshotTorch(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1898
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1899
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    goto :goto_0

    .line 1900
    :cond_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->needScreenLight()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1901
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 1902
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1901
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1903
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1904
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerPrecapture()V

    goto :goto_0

    .line 1906
    :cond_2
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerPrecapture()V

    goto :goto_0

    .line 1909
    :cond_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 1910
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->captureStillPicture()V

    .line 1912
    :goto_0
    return-void
.end method

.method private triggerPrecapture()V
    .locals 1

    .line 1915
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isAutoFocusSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 1916
    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1917
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->lockFocus()V

    goto :goto_0

    .line 1919
    :cond_0
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->runPrecaptureSequence()V

    .line 1921
    :goto_0
    return-void
.end method

.method private unlockFocus()V
    .locals 4

    .line 2163
    const-string v0, "unlockFocus"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2164
    return-void

    .line 2166
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "unlockFocus"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2168
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x2

    .line 2169
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 2168
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2170
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 2173
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2174
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 2175
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isAELocked()Z

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 2176
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2177
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2176
    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2178
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2179
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2178
    invoke-virtual {v0, v1, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2181
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v0, v2}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2182
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2187
    :catch_0
    move-exception v0

    .line 2188
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to unlock focus, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2189
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 2183
    :catch_1
    move-exception v0

    .line 2184
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 2185
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unlockFocus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2186
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 2190
    :goto_0
    nop

    .line 2191
    :goto_1
    return-void
.end method

.method private waitFlashClosed()V
    .locals 3

    .line 2036
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2037
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 2036
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2038
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 2039
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 2038
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 2040
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 2041
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2042
    return-void
.end method


# virtual methods
.method protected applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 3

    .line 3000
    if-nez p1, :cond_0

    .line 3001
    return-void

    .line 3004
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 3005
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3006
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyCommonSettings(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3007
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3008
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3009
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3011
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3012
    const/4 v0, 0x4

    if-eq p2, v0, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyDepurpleEnable(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 3013
    return-void
.end method

.method protected applySettingsForVideoShot(Landroid/hardware/camera2/CaptureRequest$Builder;I)V
    .locals 1

    .line 3018
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForJpeg(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3019
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyVideoFlash(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3020
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3021
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3022
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3023
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3024
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3026
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyFrontMirror(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 3031
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 3032
    return-void
.end method

.method public cancelContinuousShot()V
    .locals 0

    .line 1817
    return-void
.end method

.method public cancelFocus(I)V
    .locals 3

    .line 1029
    const-string v0, "cancelFocus"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1030
    return-void

    .line 1033
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_1

    .line 1034
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1038
    :cond_1
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    .line 1039
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1040
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x2

    .line 1041
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1040
    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1043
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1044
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1045
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1046
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1047
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1048
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1049
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1050
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1051
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1052
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1054
    :cond_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1055
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1056
    invoke-direct {p0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1059
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1060
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    .line 1061
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1069
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera2/CameraConfigs;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    .line 1070
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1, v0}, Lcom/android/camera2/CameraConfigs;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    .line 1071
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->setAFModeToPreview(I)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1076
    :catch_0
    move-exception p1

    .line 1077
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "Failed to cancel focus, IllegalState"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1078
    const/16 p1, 0x100

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 1072
    :catch_1
    move-exception p1

    .line 1073
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1074
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cancelFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1075
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 1079
    :goto_0
    nop

    .line 1080
    :goto_1
    return-void
.end method

.method public captureAbortBurst()V
    .locals 3

    .line 1013
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "captureAbortBurst"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1016
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1021
    :catch_0
    move-exception v0

    .line 1022
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to abort burst, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1023
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 1018
    :catch_1
    move-exception v0

    .line 1019
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1020
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 1024
    :goto_0
    nop

    .line 1025
    :goto_1
    return-void
.end method

.method public captureBurstPictures(ILcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V
    .locals 0
    .param p2    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 1005
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 1006
    invoke-virtual {p0, p3}, Lcom/android/camera2/MiCamera2;->setParallelCallback(Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 1007
    new-instance p2, Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-direct {p2, p0, p1}, Lcom/android/camera2/MiCamera2ShotBurst;-><init>(Lcom/android/camera2/MiCamera2;I)V

    iput-object p2, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    .line 1008
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2Shot;->startShot()V

    .line 1009
    return-void
.end method

.method public captureGroupShotPictures(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;ILcom/android/camera/groupshot/GroupShot;)V
    .locals 0
    .param p1    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 997
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 998
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setParallelCallback(Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 999
    new-instance p1, Lcom/android/camera2/MiCamera2ShotGroup;

    invoke-direct {p1, p0, p3, p4}, Lcom/android/camera2/MiCamera2ShotGroup;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera/groupshot/GroupShot;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    .line 1000
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2Shot;->startShot()V

    .line 1001
    return-void
.end method

.method public captureVideoSnapshot(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V
    .locals 0

    .line 2091
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 2092
    new-instance p1, Lcom/android/camera2/MiCamera2ShotVideo;

    invoke-direct {p1, p0}, Lcom/android/camera2/MiCamera2ShotVideo;-><init>(Lcom/android/camera2/MiCamera2;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    .line 2093
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2Shot;->startShot()V

    .line 2094
    return-void
.end method

.method public close()V
    .locals 3

    .line 376
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "E: close: cameraId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_2

    .line 378
    sget-boolean v0, Lcom/mi/config/b;->qT:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qP:Z

    if-eqz v0, :cond_1

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    check-cast v0, Landroid/hardware/camera2/impl/CameraDeviceImpl;

    .line 381
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/impl/CameraDeviceImpl;->flush()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    goto :goto_0

    .line 382
    :catch_0
    move-exception v0

    .line 383
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 386
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 388
    :cond_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_3

    .line 389
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 392
    :cond_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_4

    .line 393
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 395
    :cond_4
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_5

    .line 396
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 398
    :cond_5
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_6

    .line 399
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 401
    :cond_6
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    if-eqz v0, :cond_7

    .line 402
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2Shot;->makeClobber()V

    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mMiCamera2Shot:Lcom/android/camera2/MiCamera2Shot;

    .line 405
    :cond_7
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->reset()V

    .line 406
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "X: close: cameraId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    return-void
.end method

.method protected getCameraConfigs()Lcom/android/camera2/CameraConfigs;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    return-object v0
.end method

.method protected getCameraDevice()Landroid/hardware/camera2/CameraDevice;
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    return-object v0
.end method

.method public getCameraHandler()Landroid/os/Handler;
    .locals 1

    .line 1314
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCapabilities()Lcom/android/camera2/CameraCapabilities;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    return-object v0
.end method

.method protected getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object v0
.end method

.method protected getDepthImageReader()Landroid/media/ImageReader;
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    return-object v0
.end method

.method public getExposureCompensation()I
    .locals 1

    .line 1706
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureCompensationIndex()I

    move-result v0

    return v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 1871
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .line 1835
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFocusMode()I

    move-result v0

    return v0
.end method

.method protected getPhotoImageReader()Landroid/media/ImageReader;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    return-object v0
.end method

.method public getPictureFormat()I
    .locals 1

    .line 1318
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoFormat()I

    move-result v0

    return v0
.end method

.method public getPictureMaxImages()I
    .locals 1

    .line 1332
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoMaxImages()I

    move-result v0

    return v0
.end method

.method public getPictureSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 1293
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method protected getPortraitRawImageReader()Landroid/media/ImageReader;
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    return-object v0
.end method

.method public getPreviewFormat()I
    .locals 1

    .line 1257
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewFormat()I

    move-result v0

    return v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    .line 1273
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewMaxImages()I

    move-result v0

    return v0
.end method

.method protected getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    return-object v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 1241
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    return-object v0
.end method

.method protected getPreviewSurface()Landroid/view/Surface;
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    return-object v0
.end method

.method protected getRecordSurface()Landroid/view/Surface;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    return-object v0
.end method

.method protected getRemoteSurfaceList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 225
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mParalleCaptureSurfaceList:Ljava/util/List;

    return-object v0
.end method

.method public getSceneMode()I
    .locals 1

    .line 1474
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getSceneMode()I

    move-result v0

    return v0
.end method

.method public getShotSavePath()Ljava/lang/String;
    .locals 1

    .line 983
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getShotPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getVideoSnapshotImageReader()Landroid/media/ImageReader;
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 1372
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getZoomRatio()F

    move-result v0

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .line 1586
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isBokehEnabled()Z

    move-result v0

    return v0
.end method

.method public isFacingFront()Z
    .locals 1

    .line 1397
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isFrontBeautyOn()Z
    .locals 5

    .line 3599
    iget v0, p0, Lcom/android/camera2/MiCamera2;->mCameraId:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_3

    .line 3600
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;

    move-result-object v0

    .line 3601
    if-nez v0, :cond_0

    .line 3602
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Assume front beauty is off in case beautyValues is unavailable."

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3603
    return v1

    .line 3605
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hp()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3606
    sget-object v3, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    if-gtz v3, :cond_1

    iget v3, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    if-gtz v3, :cond_1

    iget v0, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    if-lez v0, :cond_3

    .line 3610
    :cond_1
    return v2

    .line 3612
    :cond_2
    sget-object v3, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 3613
    return v2

    .line 3616
    :cond_3
    return v1
.end method

.method public isNeedFlashOn()Z
    .locals 4

    .line 1925
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1926
    return v1

    .line 1929
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/16 v2, 0x65

    if-ne v0, v2, :cond_1

    .line 1930
    return v1

    .line 1933
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getFlashMode()I

    move-result v0

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-ne v0, v2, :cond_3

    .line 1934
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->getCurrentAEState()Ljava/lang/Integer;

    move-result-object v0

    .line 1935
    if-eqz v0, :cond_2

    .line 1936
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x4

    if-ne v0, v2, :cond_2

    goto :goto_0

    .line 1935
    :cond_2
    move v1, v3

    :goto_0
    return v1

    .line 1939
    :cond_3
    return v3
.end method

.method public isNeedPreviewThumbnail()Z
    .locals 1

    .line 1944
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isHDREnabled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 1945
    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isMfnrEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 1946
    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isSwMfnrEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 1947
    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isSuperResolutionEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1944
    :goto_0
    return v0
.end method

.method public isSessionReady()Z
    .locals 1

    .line 1219
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lockExposure(Z)V
    .locals 2

    .line 1988
    const-string v0, "lockExposure"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1989
    return-void

    .line 1991
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    if-eqz p1, :cond_1

    const/4 v1, 0x3

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1992
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1993
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1994
    return-void
.end method

.method public notifyVideoStreamEnd()V
    .locals 4

    .line 663
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_0

    .line 664
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "notifyVideoStreamEnd: session is not ready"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mPendingNotifyVideoEnd:Z

    .line 666
    return-void

    .line 670
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 672
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    .line 673
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 674
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 675
    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 676
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyVideoStreamState(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 677
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v0

    .line 678
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyVideoStreamEnd: requestId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 682
    goto :goto_0

    .line 679
    :catch_0
    move-exception v0

    .line 680
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 681
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 683
    :goto_0
    return-void
.end method

.method protected onCapturePictureFinished(Z)V
    .locals 3

    .line 2073
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isNeedFlash()Z

    move-result v0

    .line 2074
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera2/CameraConfigs;->setNeedFlash(Z)Z

    .line 2076
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v1, v2}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 2078
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v1}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 2080
    if-eqz v0, :cond_0

    .line 2081
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 2083
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 2084
    if-nez p1, :cond_1

    if-eqz v0, :cond_1

    .line 2085
    invoke-interface {v0, v2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 2087
    :cond_1
    return-void
.end method

.method public pausePreview()V
    .locals 3

    .line 862
    const-string v0, "pausePreview"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 863
    return-void

    .line 865
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pausePreview: cameraId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 867
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 872
    :catch_0
    move-exception v0

    .line 873
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to pause preview, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 874
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 868
    :catch_1
    move-exception v0

    .line 869
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 870
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to pause preview"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 871
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 875
    :goto_0
    nop

    .line 876
    :goto_1
    return-void
.end method

.method public releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 1
    .param p1    # Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 934
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    if-eqz v0, :cond_0

    .line 935
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    invoke-virtual {v0, p1}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;->setClientCb(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 937
    :cond_0
    return-void
.end method

.method public releasePictureCallback()V
    .locals 1

    .line 941
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 942
    return-void
.end method

.method public releasePreview()V
    .locals 3

    .line 880
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-nez v0, :cond_0

    .line 881
    return-void

    .line 884
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 885
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 886
    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mHelperHandler:Landroid/os/Handler;

    .line 890
    :cond_1
    :try_start_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "E: releasePreview"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 892
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V

    .line 893
    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 894
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "X: releasePreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 899
    :catch_0
    move-exception v0

    .line 900
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to release preview, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 901
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 895
    :catch_1
    move-exception v0

    .line 896
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 897
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to release preview"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 898
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 902
    :goto_0
    nop

    .line 903
    :goto_1
    return-void
.end method

.method public resetConfigs()V
    .locals 2

    .line 907
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "E: resetConfigs"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    if-eqz v0, :cond_0

    .line 909
    new-instance v0, Lcom/android/camera2/CameraConfigs;

    invoke-direct {v0}, Lcom/android/camera2/CameraConfigs;-><init>()V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 911
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 912
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->releaseCameraPreviewCallback(Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    .line 913
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "X: resetConfigs"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 914
    return-void
.end method

.method public resumePreview()V
    .locals 4

    .line 828
    const-string v0, "resumePreview"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 829
    return-void

    .line 831
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    instance-of v0, v0, Landroid/hardware/camera2/CameraConstrainedHighSpeedCaptureSession;

    .line 832
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resumePreview: cameraId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " highSpeed="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    if-eqz v0, :cond_1

    .line 835
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 839
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v0

    .line 840
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 841
    goto :goto_2

    .line 854
    :catch_0
    move-exception v0

    goto :goto_0

    .line 851
    :catch_1
    move-exception v0

    goto :goto_1

    .line 842
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 843
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    move-result v0

    .line 844
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "repeating sequenceId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 854
    :goto_0
    nop

    .line 855
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to resume preview, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 856
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_3

    .line 851
    :goto_1
    nop

    .line 852
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to resume preview"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 853
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 857
    :goto_2
    nop

    .line 858
    :goto_3
    return-void
.end method

.method public setAELock(Z)V
    .locals 3

    .line 1769
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAELock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1770
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAELock(Z)Z

    move-result v0

    .line 1771
    if-eqz v0, :cond_0

    .line 1772
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/MiCamera2;->applyAELock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1774
    :cond_0
    return-void
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 2

    .line 1751
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "setAERegions"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1752
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    move-result p1

    .line 1753
    if-eqz p1, :cond_0

    .line 1754
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAERegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1756
    :cond_0
    return-void
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 2

    .line 1760
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "setAFRegions"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1761
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z

    move-result p1

    .line 1762
    if-eqz p1, :cond_0

    .line 1763
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAFRegions(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1765
    :cond_0
    return-void
.end method

.method public setASD(Z)V
    .locals 1

    .line 1507
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAiSceneDetectEnable(Z)Z

    move-result p1

    .line 1508
    if-eqz p1, :cond_0

    .line 1509
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAiSceneDetectEnable(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1511
    :cond_0
    return-void
.end method

.method public setASDPeriod(I)V
    .locals 1

    .line 1522
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAiSceneDetectPeriod(I)Z

    move-result p1

    .line 1523
    if-eqz p1, :cond_0

    .line 1524
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAiSceneDetectPeriod(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1526
    :cond_0
    return-void
.end method

.method public setAWBLock(Z)V
    .locals 3

    .line 1778
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAWBLock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1779
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAWBLock(Z)Z

    move-result v0

    .line 1780
    if-eqz v0, :cond_0

    .line 1781
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBLock(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1783
    :cond_0
    return-void
.end method

.method public setAWBMode(I)V
    .locals 3

    .line 1787
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAWBMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1788
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAWBMode(I)Z

    move-result p1

    .line 1789
    if-eqz p1, :cond_0

    .line 1790
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAWBMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1792
    :cond_0
    return-void
.end method

.method public setAntiBanding(I)V
    .locals 3

    .line 1479
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAntiBanding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1480
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setAntiBanding(I)Z

    move-result p1

    .line 1481
    if-eqz p1, :cond_0

    .line 1482
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiBanding(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1484
    :cond_0
    return-void
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 1

    .line 1952
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 1953
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyBeautyValues(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1954
    return-void
.end method

.method public setBokeh(Z)V
    .locals 1

    .line 1578
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setBokehEnabled(Z)Z

    move-result p1

    .line 1579
    if-eqz p1, :cond_0

    .line 1580
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyBokeh(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1582
    :cond_0
    return-void
.end method

.method public setBurstShotSpeed(I)V
    .locals 0

    .line 1822
    return-void
.end method

.method public setCameraAI30(Z)V
    .locals 1

    .line 1515
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setCameraAi30Enable(Z)Z

    move-result p1

    .line 1516
    if-eqz p1, :cond_0

    .line 1517
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCameraAi30Enable(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1519
    :cond_0
    return-void
.end method

.method public setColorEffect(I)V
    .locals 3

    .line 1402
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setColorEffect: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1403
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setColorEffect(I)Z

    move-result p1

    .line 1404
    if-eqz p1, :cond_0

    .line 1405
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyColorEffect(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1407
    :cond_0
    return-void
.end method

.method public setContrast(I)V
    .locals 3

    .line 1438
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setContrast: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1439
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setContrastLevel(I)Z

    move-result p1

    .line 1440
    if-eqz p1, :cond_0

    .line 1441
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyContrast(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1443
    :cond_0
    return-void
.end method

.method public setCustomAWB(I)V
    .locals 3

    .line 1796
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setCustomAWB: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1797
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setCustomAWB(I)Z

    move-result p1

    .line 1798
    if-eqz p1, :cond_0

    .line 1799
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyCustomAWB(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1801
    :cond_0
    return-void
.end method

.method public setDeviceOrientation(I)V
    .locals 3

    .line 1681
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDeviceOrientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1682
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setDeviceOrientation(I)Z

    move-result p1

    .line 1683
    if-eqz p1, :cond_0

    .line 1684
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyDeviceOrientation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1686
    :cond_0
    return-void
.end method

.method public setDisplayOrientation(I)V
    .locals 3

    .line 1675
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayOrientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1676
    iput p1, p0, Lcom/android/camera2/MiCamera2;->mDisplayOrientation:I

    .line 1677
    return-void
.end method

.method public setDualCamWaterMarkEnable(Z)V
    .locals 1

    .line 1623
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setDualCamWaterMarkEnable(Z)Z

    .line 1624
    return-void
.end method

.method public setEnableEIS(Z)V
    .locals 3

    .line 1498
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setEnableEIS: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1499
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEnableEIS(Z)Z

    move-result p1

    .line 1500
    if-eqz p1, :cond_0

    .line 1501
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1503
    :cond_0
    return-void
.end method

.method public setEnableOIS(Z)V
    .locals 3

    .line 1384
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportOIS()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1385
    return-void

    .line 1387
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setEnableOIS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1388
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEnableOIS(Z)V

    .line 1389
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyAntiShake(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1390
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 3

    .line 1377
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setEnableZsl "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1378
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEnableZsl(Z)V

    .line 1379
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZsl(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1380
    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 3

    .line 1697
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setExposureCompensation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1698
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setExposureCompensationIndex(I)Z

    move-result p1

    .line 1699
    if-eqz p1, :cond_0

    .line 1700
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1702
    :cond_0
    return-void
.end method

.method public setExposureMeteringMode(I)V
    .locals 3

    .line 1465
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setExposureMeteringMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1466
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setExposureMeteringMode(I)Z

    move-result p1

    .line 1467
    if-eqz p1, :cond_0

    .line 1468
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyExposureMeteringMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1470
    :cond_0
    return-void
.end method

.method public setExposureTime(J)V
    .locals 1

    .line 1711
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1, p2}, Lcom/android/camera2/CameraConfigs;->setExposureTime(J)Z

    move-result p1

    .line 1712
    if-eqz p1, :cond_0

    .line 1713
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1714
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1715
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1716
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1, p2}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1718
    :cond_0
    return-void
.end method

.method public setEyeLight(I)V
    .locals 1

    .line 1958
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setEyeLight(I)Z

    move-result p1

    .line 1959
    if-eqz p1, :cond_0

    .line 1960
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyEyeLight(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1962
    :cond_0
    return-void
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 3

    .line 1976
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFNumber "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1977
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFNumber(Ljava/lang/String;)V

    .line 1978
    invoke-static {}, Lcom/android/camera/Util;->UI_DEBUG()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1979
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFNumber(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1981
    :cond_0
    return-void
.end method

.method public setFaceAgeAnalyze(Z)V
    .locals 1

    .line 1607
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceAgeAnalyzeEnabled(Z)Z

    move-result p1

    .line 1608
    if-eqz p1, :cond_0

    .line 1609
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFaceAgeAnalyze(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1611
    :cond_0
    return-void
.end method

.method public setFaceScore(Z)V
    .locals 1

    .line 1615
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceScoreEnabled(Z)Z

    move-result p1

    .line 1616
    if-eqz p1, :cond_0

    .line 1617
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFaceScore(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1619
    :cond_0
    return-void
.end method

.method public setFaceWaterMarkEnable(Z)V
    .locals 1

    .line 1638
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceWaterMarkEnable(Z)Z

    .line 1639
    return-void
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 1

    .line 1643
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFaceWaterMarkFormat(Ljava/lang/String;)V

    .line 1644
    return-void
.end method

.method public setFlashMode(I)V
    .locals 3

    .line 1849
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFlashMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1857
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFlashMode(I)Z

    move-result p1

    .line 1858
    if-eqz p1, :cond_0

    .line 1859
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyFlashMode(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1861
    :cond_0
    return-void
.end method

.method public setFocusCallback(Lcom/android/camera2/Camera2Proxy$FocusCallback;)V
    .locals 1

    .line 1731
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1732
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mFocusCallback:Lcom/android/camera2/Camera2Proxy$FocusCallback;

    .line 1733
    monitor-exit v0

    .line 1734
    return-void

    .line 1733
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setFocusDistance(F)V
    .locals 3

    .line 1840
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFocusDistance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1841
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFocusDistance(F)Z

    move-result p1

    .line 1842
    if-eqz p1, :cond_0

    .line 1843
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusDistance(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1845
    :cond_0
    return-void
.end method

.method public setFocusMode(I)V
    .locals 3

    .line 1826
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFocusMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1827
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFocusMode(I)Z

    move-result p1

    .line 1828
    if-eqz p1, :cond_0

    .line 1829
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFocusMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1831
    :cond_0
    return-void
.end method

.method public setFpsRange(Landroid/util/Range;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1648
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFpsRange: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1649
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewFpsRange(Landroid/util/Range;)Z

    .line 1651
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1653
    return-void
.end method

.method public setFrontMirror(Z)V
    .locals 1

    .line 1971
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setFrontMirror(Z)V

    .line 1972
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 1

    .line 1726
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setGpsLocation(Landroid/location/Location;)V

    .line 1727
    return-void
.end method

.method public setHDR(Z)V
    .locals 1

    .line 1538
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setHDREnabled(Z)Z

    move-result p1

    .line 1539
    if-eqz p1, :cond_0

    .line 1540
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyHDR(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1542
    :cond_0
    return-void
.end method

.method public setHDRCheckerEnable(Z)V
    .locals 2

    .line 1546
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setHDRCheckerEnabled(Z)Z

    move-result v0

    .line 1547
    if-eqz v0, :cond_0

    .line 1548
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/android/camera2/MiCamera2;->applyHDRCheckerEnable(Landroid/hardware/camera2/CaptureRequest$Builder;ZI)V

    .line 1550
    :cond_0
    return-void
.end method

.method public setHHT(Z)V
    .locals 1

    .line 1530
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setHHTEnabled(Z)Z

    move-result p1

    .line 1531
    if-eqz p1, :cond_0

    .line 1532
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyHHT(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1534
    :cond_0
    return-void
.end method

.method public setISO(I)V
    .locals 3

    .line 1805
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setISO: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1806
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setISO(I)Z

    move-result p1

    .line 1807
    if-eqz p1, :cond_0

    .line 1808
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyExposureCompensation(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1809
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyIso(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1810
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyExposureTime(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1812
    :cond_0
    return-void
.end method

.method public setJpegQuality(I)V
    .locals 1

    .line 1350
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setJpegQuality(I)Z

    .line 1351
    return-void
.end method

.method public setJpegRotation(I)V
    .locals 1

    .line 1355
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setJpegRotation(I)Z

    .line 1356
    return-void
.end method

.method public setJpegThumbnailSize(Lcom/android/camera/CameraSize;)V
    .locals 1

    .line 1340
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setThumbnailSize(Lcom/android/camera/CameraSize;)Z

    .line 1341
    return-void
.end method

.method public setLensDirtyDetect(Z)V
    .locals 1

    .line 1591
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setLensDirtyDetectEnabled(Z)Z

    move-result p1

    .line 1592
    if-eqz p1, :cond_0

    .line 1593
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyLensDirtyDetect(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1595
    :cond_0
    return-void
.end method

.method public setMetaDataCallback(Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;)V
    .locals 0

    .line 1738
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mMetadataCallback:Lcom/android/camera2/Camera2Proxy$CameraMetaDataCallback;

    .line 1739
    return-void
.end method

.method public setMfnr(Z)V
    .locals 1

    .line 1562
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setMfnrEnabled(Z)Z

    move-result p1

    .line 1563
    if-eqz p1, :cond_0

    .line 1564
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1566
    :cond_0
    return-void
.end method

.method public setNeedPausePreview(Z)V
    .locals 1

    .line 1966
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPausePreview(Z)Z

    .line 1967
    return-void
.end method

.method public setNormalWideLDC(Z)V
    .locals 3

    .line 1420
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setNormalWideLDC: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1421
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setNormalWideLDCEnabled(Z)Z

    move-result p1

    .line 1422
    if-eqz p1, :cond_0

    .line 1423
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyNormalWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1425
    :cond_0
    return-void
.end method

.method public setOpticalZoomToTele(Z)V
    .locals 3

    .line 1488
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fn()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCapabilities:Lcom/android/camera2/CameraCapabilities;

    .line 1489
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportFastZoomIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1490
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setOpticalZoomToTele: toTele = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1491
    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mToTele:Z

    .line 1493
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-static {v0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->applyStFastZoomIn(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 1494
    return-void
.end method

.method public setOptimizedFlash(Z)V
    .locals 1

    .line 1865
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setOptimizedFlash(Z)Z

    .line 1866
    return-void
.end method

.method public setPictureFormat(I)V
    .locals 1

    .line 1305
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoFormat()I

    move-result v0

    .line 1306
    if-eq v0, p1, :cond_0

    .line 1307
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPhotoFormat(I)Z

    .line 1308
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader()V

    .line 1310
    :cond_0
    return-void
.end method

.method public setPictureMaxImages(I)V
    .locals 1

    .line 1323
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoMaxImages()I

    move-result v0

    .line 1324
    if-le p1, v0, :cond_0

    .line 1325
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPhotoMaxImages(I)V

    .line 1326
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader()V

    .line 1328
    :cond_0
    return-void
.end method

.method public setPictureSize(Lcom/android/camera/CameraSize;)V
    .locals 1

    .line 1281
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1282
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1283
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPhotoSize(Lcom/android/camera/CameraSize;)Z

    .line 1284
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader()V

    .line 1286
    :cond_0
    return-void
.end method

.method public setPortraitLighting(I)V
    .locals 1

    .line 1599
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPortraitLightingPattern(I)Z

    move-result p1

    .line 1600
    if-eqz p1, :cond_0

    .line 1601
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyPortraitLighting(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1603
    :cond_0
    return-void
.end method

.method public setPreviewFormat(I)V
    .locals 1

    .line 1246
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewFormat()I

    move-result v0

    .line 1247
    if-eq p1, v0, :cond_0

    .line 1248
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewFormat(I)Z

    .line 1249
    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz p1, :cond_0

    .line 1250
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader()V

    .line 1253
    :cond_0
    return-void
.end method

.method public setPreviewMaxImages(I)V
    .locals 1

    .line 1262
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewMaxImages()I

    move-result v0

    .line 1263
    if-le p1, v0, :cond_0

    .line 1264
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewMaxImages(I)V

    .line 1265
    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz p1, :cond_0

    .line 1266
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader()V

    .line 1269
    :cond_0
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)V
    .locals 1

    .line 1227
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1228
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1229
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setPreviewSize(Lcom/android/camera/CameraSize;)Z

    .line 1230
    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz p1, :cond_0

    .line 1231
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader()V

    .line 1234
    :cond_0
    return-void
.end method

.method public setSaturation(I)V
    .locals 3

    .line 1447
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSaturation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1448
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSaturationLevel(I)Z

    move-result p1

    .line 1449
    if-eqz p1, :cond_0

    .line 1450
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySaturation(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1452
    :cond_0
    return-void
.end method

.method public setSceneMode(I)V
    .locals 3

    .line 1411
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSceneMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1412
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSceneMode(I)Z

    move-result p1

    .line 1413
    if-eqz p1, :cond_0

    .line 1414
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySceneMode(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1416
    :cond_0
    return-void
.end method

.method public setScreenLightCallback(Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;)V
    .locals 1

    .line 1744
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1745
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mScreenLightCallback:Lcom/android/camera2/Camera2Proxy$ScreenLightCallback;

    .line 1746
    monitor-exit v0

    .line 1747
    return-void

    .line 1746
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setSharpness(I)V
    .locals 3

    .line 1456
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSharpness: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1457
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSharpnessLevel(I)Z

    move-result p1

    .line 1458
    if-eqz p1, :cond_0

    .line 1459
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySharpness(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1461
    :cond_0
    return-void
.end method

.method public setShotSavePath(Ljava/lang/String;)V
    .locals 1

    .line 977
    const-string v0, "algo setParallelPath: "

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 978
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setShotPath(Ljava/lang/String;)V

    .line 979
    return-void
.end method

.method public setShotType(I)V
    .locals 3

    .line 966
    const-string v0, "algo setShotType: "

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 967
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setShotType(I)Z

    .line 973
    return-void
.end method

.method public setSubPictureSize(Lcom/android/camera/CameraSize;)V
    .locals 1

    .line 1298
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getSubPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v0

    .line 1299
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1300
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSubPhotoSize(Lcom/android/camera/CameraSize;)Z

    .line 1302
    :cond_0
    return-void
.end method

.method public setSuperResolution(Z)V
    .locals 1

    .line 1554
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSuperResolutionEnabled(Z)Z

    move-result p1

    .line 1555
    if-eqz p1, :cond_0

    .line 1556
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applySuperResolution(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1558
    :cond_0
    return-void
.end method

.method public setSwMfnr(Z)V
    .locals 1

    .line 1570
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setSwMfnrEnabled(Z)Z

    move-result p1

    .line 1571
    if-eqz p1, :cond_0

    .line 1572
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applySwMfnr(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1574
    :cond_0
    return-void
.end method

.method public setTimeWaterMarkEnable(Z)V
    .locals 1

    .line 1628
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setTimeWaterMarkEnable(Z)Z

    .line 1629
    return-void
.end method

.method public setTimeWatermarkValue(Ljava/lang/String;)V
    .locals 1

    .line 1633
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setTimeWaterMarkValue(Ljava/lang/String;)V

    .line 1634
    return-void
.end method

.method public setUltraWideLDC(Z)V
    .locals 3

    .line 1429
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUltraWideLDC: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1430
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setUltraWideLDCEnabled(Z)Z

    move-result p1

    .line 1431
    if-eqz p1, :cond_0

    .line 1432
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera2/MiCamera2;->applyUltraWideLDC(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 1434
    :cond_0
    return-void
.end method

.method public setVendorSetting(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1690
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz v0, :cond_0

    .line 1691
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1693
    :cond_0
    return-void
.end method

.method public setVideoFpsRange(Landroid/util/Range;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1657
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setVideoFpsRange: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1658
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setVideoFpsRange(Landroid/util/Range;)Z

    move-result p1

    .line 1659
    if-eqz p1, :cond_0

    .line 1660
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyVideoFpsRange(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1663
    :cond_0
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 1

    .line 1345
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V

    .line 1346
    return-void
.end method

.method public setZoomRatio(F)V
    .locals 3

    .line 1363
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setZoomRatio "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1364
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0, p1}, Lcom/android/camera2/CameraConfigs;->setZoomRatio(F)Z

    move-result p1

    .line 1365
    if-eqz p1, :cond_0

    .line 1366
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applyZoomRatio(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1368
    :cond_0
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .line 1094
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "startFaceDetection"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1095
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraConfigs;->setFaceDetectionEnabled(Z)Z

    .line 1096
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1097
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1098
    return-void
.end method

.method public startFocus(Lcom/android/camera/module/loader/camera2/FocusTask;I)V
    .locals 3

    .line 1152
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startFocus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1154
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    invoke-virtual {v0, p1}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setFocusTask(Lcom/android/camera/module/loader/camera2/FocusTask;)V

    .line 1155
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera2/MiCamera2$PictureCaptureCallback;->setState(I)V

    .line 1157
    invoke-direct {p0, p2}, Lcom/android/camera2/MiCamera2;->initFocusRequestBuilder(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    .line 1158
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1159
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->addFocusCaptureKeysToRequest(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1160
    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1161
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    .line 1166
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCaptureCallback:Lcom/android/camera2/MiCamera2$PictureCaptureCallback;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-direct {p0, p1, p2, v1}, Lcom/android/camera2/MiCamera2;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    .line 1173
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1, v0}, Lcom/android/camera2/CameraConfigs;->setFocusMode(I)Z

    .line 1174
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 1175
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1176
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFastMotionModule()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1177
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSlowMotionModule()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1178
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result p1

    if-nez p1, :cond_1

    .line 1179
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoNewSlowMotion()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 1182
    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForPreview(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    goto :goto_1

    .line 1180
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1184
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1189
    goto :goto_2

    .line 1185
    :catch_0
    move-exception p1

    .line 1186
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 1187
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v0, "Failed to start focus"

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1188
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 1190
    :goto_2
    return-void
.end method

.method public startHighSpeedRecordPreview()V
    .locals 2

    .line 797
    const-string v0, "startHighSpeedRecordPreview"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 798
    return-void

    .line 801
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "startHighSpeedRecordPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 802
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 803
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 804
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 805
    return-void
.end method

.method public startHighSpeedRecordSession(Landroid/view/Surface;Landroid/view/Surface;Landroid/util/Range;Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 6
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Surface;",
            "Landroid/view/Surface;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/camera2/Camera2Proxy$CameraPreviewCallback;",
            ")V"
        }
    .end annotation

    .line 620
    const-string v0, "startHighSpeedRecordSession"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 621
    return-void

    .line 624
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startHighSpeedRecordSession: previewSurface="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " recordSurface="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 627
    iput-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 628
    iput-object p3, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    .line 629
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 632
    :try_start_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 633
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 634
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 635
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    invoke-virtual {p1, p2, p3}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 638
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 639
    const/4 p1, 0x2

    new-array p1, p1, [Landroid/view/Surface;

    const/4 p2, 0x0

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    aput-object p3, p1, p2

    const/4 p2, 0x1

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    aput-object p3, p1, p2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 640
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mHighSpeedFpsRange:Landroid/util/Range;

    invoke-virtual {p2}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/16 p3, 0x78

    if-ne p2, p3, :cond_2

    .line 641
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 642
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/Surface;

    .line 643
    new-instance p3, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {p3, p2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 644
    goto :goto_0

    .line 645
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x0

    const v3, 0x8078

    new-instance v4, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;

    iget p1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {v4, p0, p1, p4}, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual/range {v0 .. v5}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V

    .line 650
    goto :goto_1

    .line 651
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    new-instance p3, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;

    iget v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {p3, p0, v0, p4}, Lcom/android/camera2/MiCamera2$HighSpeedCaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iget-object p4, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1, p3, p4}, Landroid/hardware/camera2/CameraDevice;->createConstrainedHighSpeedCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 659
    :goto_1
    goto :goto_2

    .line 655
    :catch_0
    move-exception p1

    .line 656
    const/4 p2, -0x1

    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 657
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start high speed record session"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 658
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->close()V

    .line 660
    :goto_2
    return-void
.end method

.method public startHighSpeedRecording()V
    .locals 2

    .line 753
    const-string v0, "startHighSpeedRecording"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 754
    return-void

    .line 757
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "startHighSpeedRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 758
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera2/compat/MiCameraCompat;->applyIsHfrPreview(Landroid/hardware/camera2/CaptureRequest$Builder;Z)V

    .line 759
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 760
    return-void
.end method

.method public startObjectTrack(Landroid/graphics/RectF;)V
    .locals 0

    .line 1111
    return-void
.end method

.method public startPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V
    .locals 2
    .param p1    # Lcom/android/camera2/Camera2Proxy$PreviewCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 918
    const-string v0, "startPreviewCallback"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 919
    return-void

    .line 921
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "startPreviewCallback"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 922
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz v0, :cond_1

    .line 923
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 924
    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    if-nez p1, :cond_1

    .line 925
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    .line 926
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 927
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 930
    :cond_1
    return-void
.end method

.method public startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 7
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 464
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera2/MiCamera2;->startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;Landroid/os/Handler;)V

    .line 466
    return-void
.end method

.method public startPreviewSession(Landroid/view/Surface;ZZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;Landroid/os/Handler;)V
    .locals 8
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 475
    const-string v0, "startPreviewSession"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 476
    return-void

    .line 479
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "startPreviewSession: opMode=0x%x %b %b"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 480
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v3, v4

    .line 479
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 483
    iput-boolean p2, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    .line 484
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 485
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 486
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 489
    const/16 v1, 0x100

    :try_start_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result v2

    invoke-static {v2}, Lcom/xiaomi/camera/core/ShotConstant;->isParallelEnabled(I)Z

    move-result v2

    if-nez v2, :cond_2

    .line 490
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->preparePhotoImageReader()V

    .line 492
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPhotoImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 494
    invoke-static {}, Lcom/android/camera/CameraSettings;->needDepth()Z

    move-result v2

    .line 495
    if-eqz v2, :cond_1

    .line 496
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->prepareDepthImageReader(Lcom/android/camera/CameraSize;)V

    .line 497
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mDepthReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/camera2/MiCamera2;->preparePortraitRawImageReader(Lcom/android/camera/CameraSize;)V

    .line 499
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPortraitRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    :cond_1
    goto :goto_0

    .line 503
    :cond_2
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->prepareRemoteImageReader()Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mParalleCaptureSurfaceList:Ljava/util/List;

    .line 504
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mParalleCaptureSurfaceList:Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 507
    :goto_0
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v2, v5}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 508
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v2, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 510
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 512
    if-eqz p2, :cond_3

    .line 513
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 514
    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getPreviewFormat()I

    move-result p2

    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    .line 515
    invoke-virtual {v2}, Lcom/android/camera2/CameraConfigs;->getPreviewMaxImages()I

    move-result v2

    .line 513
    invoke-direct {p0, p1, p2, v2, p6}, Lcom/android/camera2/MiCamera2;->preparePreviewImageReader(Lcom/android/camera/CameraSize;IILandroid/os/Handler;)V

    .line 516
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {p1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 519
    :cond_3
    if-eqz p3, :cond_4

    .line 520
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getPhotoSize()Lcom/android/camera/CameraSize;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->prepareRawImageReader(Lcom/android/camera/CameraSize;)V

    .line 521
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mRawImageReader:Landroid/media/ImageReader;

    invoke-virtual {p1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 524
    :cond_4
    new-instance p1, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    iget p2, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {p1, p0, p2, p5}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    .line 526
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-direct {v4, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 527
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/Surface;

    .line 528
    new-instance p3, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {p3, p2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v4, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    goto :goto_1

    .line 531
    :cond_5
    sget-object p1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "startPreviewSession: operatingMode = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    iget-object v2, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v3, 0x0

    iget-object v6, p0, Lcom/android/camera2/MiCamera2;->mCaptureSessionStateCallback:Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    iget-object v7, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    move v5, p4

    invoke-virtual/range {v2 .. v7}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 545
    :catch_0
    move-exception p1

    .line 557
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start preview session, IllegalArgument"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 558
    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_3

    .line 542
    :catch_1
    move-exception p1

    .line 543
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start preview session, IllegalState"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 544
    invoke-virtual {p0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_2

    .line 539
    :catch_2
    move-exception p1

    .line 540
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start preview session"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 541
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 559
    :goto_2
    nop

    .line 560
    :goto_3
    return-void
.end method

.method public startRecordPreview()V
    .locals 3

    .line 767
    const-string v0, "startRecordPreview"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 768
    return-void

    .line 771
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "startRecordPreview"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 773
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    .line 774
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 776
    :try_start_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 777
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 778
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 779
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 781
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 782
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 786
    :catch_0
    move-exception v0

    .line 787
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to start record preview, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 788
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 783
    :catch_1
    move-exception v0

    .line 784
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to start record preview"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 785
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 789
    :goto_0
    nop

    .line 790
    :goto_1
    return-void

    .line 774
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public startRecordSession(Landroid/view/Surface;Landroid/view/Surface;ZILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V
    .locals 6
    .param p1    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 568
    const-string v0, "startRecordSession"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCameraDevice(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 569
    return-void

    .line 572
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startRecordSession: previewSurface="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " recordSurface="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 574
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    .line 575
    iput-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    .line 576
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->genSessionId()I

    move-result p1

    iput p1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    .line 577
    iget p1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    iput p1, p0, Lcom/android/camera2/MiCamera2;->mVideoSessionId:I

    .line 580
    :try_start_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 581
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 582
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 583
    iget-object p1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Lcom/android/camera/constant/MiCaptureRequest;->VIDEO_RECORD_CONTROL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 586
    :cond_1
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mCaptureSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 588
    const/4 p1, 0x2

    const/4 v1, 0x1

    if-eqz p3, :cond_2

    .line 589
    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {p3}, Lcom/android/camera2/CameraConfigs;->getVideoSnapshotSize()Lcom/android/camera/CameraSize;

    move-result-object p3

    invoke-direct {p0, p3}, Lcom/android/camera2/MiCamera2;->prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V

    .line 590
    new-array p2, p2, [Landroid/view/Surface;

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    aput-object p3, p2, v0

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    aput-object p3, p2, v1

    iget-object p3, p0, Lcom/android/camera2/MiCamera2;->mVideoSnapshotImageReader:Landroid/media/ImageReader;

    .line 591
    invoke-virtual {p3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p3

    aput-object p3, p2, p1

    .line 590
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    .line 593
    :cond_2
    new-array p1, p1, [Landroid/view/Surface;

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    aput-object p2, p1, v0

    iget-object p2, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    aput-object p2, p1, v1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 596
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 597
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/Surface;

    .line 598
    new-instance p3, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {p3, p2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 599
    goto :goto_1

    .line 600
    :cond_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x0

    new-instance v4, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;

    iget p1, p0, Lcom/android/camera2/MiCamera2;->mSessionId:I

    invoke-direct {v4, p0, p1, p5}, Lcom/android/camera2/MiCamera2$CaptureSessionStateCallback;-><init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera2/Camera2Proxy$CameraPreviewCallback;)V

    iget-object v5, p0, Lcom/android/camera2/MiCamera2;->mCameraHandler:Landroid/os/Handler;

    move v3, p4

    invoke-virtual/range {v0 .. v5}, Landroid/hardware/camera2/CameraDevice;->createCustomCaptureSession(Landroid/hardware/camera2/params/InputConfiguration;Ljava/util/List;ILandroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 609
    :catch_0
    move-exception p1

    .line 610
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start recording session, IllegalState"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 611
    const/16 p1, 0x100

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_3

    .line 606
    :catch_1
    move-exception p1

    .line 607
    sget-object p2, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string p3, "Failed to start recording session"

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 608
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 612
    :goto_2
    nop

    .line 613
    :goto_3
    return-void
.end method

.method public startRecording()V
    .locals 3

    .line 687
    const-string v0, "startRecording"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 688
    return-void

    .line 692
    :cond_0
    :try_start_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "E: startRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 694
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->setVideoRecordControl(I)V

    .line 697
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCameraDevice:Landroid/hardware/camera2/CameraDevice;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 698
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 699
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mRecordSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 703
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applySettingsForVideo(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 704
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 705
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "X: startRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 709
    :catch_0
    move-exception v0

    .line 710
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to start recording, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 711
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 706
    :catch_1
    move-exception v0

    .line 707
    sget-object v1, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v2, "Failed to start recording"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 708
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 712
    :goto_0
    nop

    .line 713
    :goto_1
    return-void
.end method

.method public stopFaceDetection()V
    .locals 2

    .line 1102
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "stopFaceDetection"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera2/CameraConfigs;->setFaceDetectionEnabled(Z)Z

    .line 1104
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->applyFaceDetection(Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 1105
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 1106
    return-void
.end method

.method public stopObjectTrack()V
    .locals 0

    .line 1116
    return-void
.end method

.method public stopPreviewCallback(Z)V
    .locals 3

    .line 947
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopPreviewCallback(): isRelease = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 948
    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackEnabled:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    .line 949
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera2/MiCamera2;->mIsPreviewCallbackStarted:Z

    .line 950
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera2/MiCamera2;->setPreviewCallback(Lcom/android/camera2/Camera2Proxy$PreviewCallback;)V

    .line 951
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mPreviewImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 952
    iget-object v1, p0, Lcom/android/camera2/MiCamera2;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 953
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 955
    if-nez p1, :cond_1

    .line 956
    const-string p1, "stopPreviewCallback"

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 957
    return-void

    .line 959
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 962
    :cond_1
    return-void
.end method

.method public stopRecording(Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;)V
    .locals 2

    .line 717
    const-string v0, "stopRecording"

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2;->checkCaptureSession(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 718
    return-void

    .line 721
    :cond_0
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "stopRecording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 722
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mConfigs:Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->isEISEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 723
    iget-object v0, p0, Lcom/android/camera2/MiCamera2;->mCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 724
    :try_start_0
    iput-object p1, p0, Lcom/android/camera2/MiCamera2;->mVideoRecordStateCallback:Lcom/android/camera2/Camera2Proxy$VideoRecordStateCallback;

    .line 725
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 727
    const/4 p1, 0x2

    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2;->setVideoRecordControl(I)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 735
    :goto_0
    goto :goto_1

    .line 732
    :catch_0
    move-exception p1

    .line 733
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "Failed to stop recording, IllegalState"

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 734
    const/16 p1, 0x100

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 728
    :catch_1
    move-exception p1

    .line 729
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 730
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "Failed to stop recording"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    .line 725
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 737
    :cond_1
    :goto_1
    return-void
.end method

.method public takePicture(Lcom/android/camera2/Camera2Proxy$PictureCallback;Lcom/xiaomi/camera/core/ParallelCallback;)V
    .locals 2
    .param p1    # Lcom/android/camera2/Camera2Proxy$PictureCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/xiaomi/camera/core/ParallelCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 988
    sget-object v0, Lcom/android/camera2/MiCamera2;->TAG:Ljava/lang/String;

    const-string v1, "takePicture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 989
    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2;->setPictureCallback(Lcom/android/camera2/Camera2Proxy$PictureCallback;)V

    .line 990
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2;->setParallelCallback(Lcom/xiaomi/camera/core/ParallelCallback;)V

    .line 991
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2;->triggerCapture()V

    .line 992
    return-void
.end method
