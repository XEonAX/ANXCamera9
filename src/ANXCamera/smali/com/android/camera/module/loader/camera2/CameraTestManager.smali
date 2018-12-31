.class public Lcom/android/camera/module/loader/camera2/CameraTestManager;
.super Ljava/lang/Object;
.source "CameraTestManager.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "MissingPermission"
    }
.end annotation

.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;,
        Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;,
        Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static mAuxBackCameraId:I

.field private static mFrontCameraId:I

.field private static mMainBackCameraId:I

.field private static mMuxCameraId:I

.field private static final sInstance:Lcom/android/camera/module/loader/camera2/CameraTestManager;


# instance fields
.field protected final FOCUS_AREA_HEIGHT:I

.field protected final FOCUS_AREA_WIDTH:I

.field private cameraOpenEmitter:Lio/reactivex/ObservableEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableEmitter<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private connectableObservable:Lio/reactivex/observables/ConnectableObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/observables/ConnectableObservable<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;"
        }
    .end annotation
.end field

.field private mAfCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private mCamera2Device:Landroid/hardware/camera2/CameraDevice;

.field private mCamera2Service:Landroid/hardware/camera2/CameraManager;

.field private mCameraCaptureCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;

.field private mCameraCloseCallBack:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

.field private mCameraHandler:Landroid/os/Handler;

.field private final mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field private mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

.field private final mCameraPreviewContinuousCallBack:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

.field private final mCameraPreviewSessionCallBack:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

.field private mCameraPreviewSurface:Landroid/view/Surface;

.field private mCapabilities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera2/CameraCapabilities;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureImageReader:Landroid/media/ImageReader;

.field private mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

.field private mCurrentActualCameraId:I

.field private final mOnFrameAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private final mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

.field private mPreviewFrameImageReader:Landroid/media/ImageReader;

.field private mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

.field private mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    const-class v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->TAG:Ljava/lang/String;

    .line 61
    const/4 v0, -0x1

    sput v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMainBackCameraId:I

    .line 62
    sput v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAuxBackCameraId:I

    .line 63
    sput v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mFrontCameraId:I

    .line 64
    sput v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMuxCameraId:I

    .line 66
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;-><init>()V

    sput-object v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->sInstance:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCurrentActualCameraId:I

    .line 190
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 229
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSessionCallBack:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 245
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$3;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$3;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewContinuousCallBack:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 260
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 278
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$5;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$5;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mOnFrameAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    .line 549
    nop

    .line 550
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090008

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->FOCUS_AREA_WIDTH:I

    .line 551
    nop

    .line 552
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090009

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->FOCUS_AREA_HEIGHT:I

    .line 580
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAfCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 87
    invoke-direct {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->initData()V

    .line 88
    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    return-object p1
.end method

.method static synthetic access$1000(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/media/Image;)[B
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->convertYUV420888ToNV21(Landroid/media/Image;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraCharacteristics;)Landroid/hardware/camera2/CameraCharacteristics;
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/loader/camera2/CameraTestManager;)I
    .locals 0

    .line 56
    iget p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCurrentActualCameraId:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CameraManager;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->cameraOpenEmitter:Lio/reactivex/ObservableEmitter;

    return-object p0
.end method

.method static synthetic access$402(Lcom/android/camera/module/loader/camera2/CameraTestManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->cameraOpenEmitter:Lio/reactivex/ObservableEmitter;

    return-object p1
.end method

.method static synthetic access$500(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraCloseCallBack:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/module/loader/camera2/CameraTestManager;Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraCloseCallBack:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

    return-object p1
.end method

.method static synthetic access$602(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    return-object p1
.end method

.method static synthetic access$700(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/media/ImageReader;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;
    .locals 0

    .line 56
    iget-object p0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraCaptureCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;

    return-object p0
.end method

.method private convertYUV420888ToNV21(Landroid/media/Image;)[B
    .locals 5

    .line 460
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 461
    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    const/4 v2, 0x2

    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 462
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 463
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 464
    add-int v4, v2, v3

    new-array v4, v4, [B

    .line 465
    invoke-virtual {v0, v4, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 466
    invoke-virtual {p1, v4, v2, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 467
    return-object v4
.end method

.method public static getActualOpenCameraId(II)I
    .locals 1

    .line 734
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedOpticalZoom()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 736
    :goto_1
    nop

    .line 737
    if-eqz v0, :cond_5

    if-nez p0, :cond_5

    .line 739
    const/16 v0, 0xa3

    if-eq p1, v0, :cond_4

    const/16 v0, 0xab

    if-eq p1, v0, :cond_4

    packed-switch p1, :pswitch_data_0

    goto :goto_3

    .line 749
    :pswitch_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSwitchCameraZoomMode()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 750
    invoke-static {p1}, Lcom/android/camera/CameraSettings;->getCameraZoomMode(I)Ljava/lang/String;

    move-result-object p1

    .line 751
    const-string v0, "wide"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 752
    sget p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMainBackCameraId:I

    goto :goto_2

    .line 753
    :cond_2
    const-string v0, "tele"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 754
    sget p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAuxBackCameraId:I

    .line 756
    :cond_3
    :goto_2
    goto :goto_3

    .line 744
    :cond_4
    :pswitch_1
    sget p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMuxCameraId:I

    .line 745
    nop

    .line 763
    :cond_5
    :goto_3
    return p0

    nop

    :pswitch_data_0
    .packed-switch 0xa5
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getInstance()Lcom/android/camera/module/loader/camera2/CameraTestManager;
    .locals 1

    .line 136
    sget-object v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->sInstance:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    return-object v0
.end method

.method private initData()V
    .locals 9

    .line 91
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "Camera Handler Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 92
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 93
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCapabilities:Ljava/util/List;

    .line 96
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 97
    const-string v1, "camera"

    .line 98
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    .line 101
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

    .line 102
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 103
    nop

    .line 105
    :try_start_1
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 109
    nop

    .line 110
    :try_start_2
    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    .line 111
    invoke-virtual {v5, v3}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v3

    .line 112
    sget-object v5, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3, v5}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 113
    if-eqz v5, :cond_3

    .line 114
    sget v6, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMainBackCameraId:I

    const/4 v7, 0x1

    const/4 v8, -0x1

    if-ne v6, v8, :cond_0

    .line 115
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_0

    .line 116
    sput v4, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMainBackCameraId:I

    goto :goto_1

    .line 117
    :cond_0
    sget v6, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mFrontCameraId:I

    if-ne v6, v8, :cond_1

    .line 118
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_1

    .line 119
    sput v4, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mFrontCameraId:I

    goto :goto_1

    .line 120
    :cond_1
    sget v6, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAuxBackCameraId:I

    if-ne v6, v8, :cond_2

    .line 121
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_2

    .line 122
    sput v4, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAuxBackCameraId:I

    goto :goto_1

    .line 123
    :cond_2
    sget v6, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMuxCameraId:I

    if-ne v6, v8, :cond_3

    .line 124
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, v7, :cond_3

    .line 125
    sput v4, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMuxCameraId:I

    .line 128
    :cond_3
    :goto_1
    iget-object v5, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCapabilities:Ljava/util/List;

    new-instance v6, Lcom/android/camera2/CameraCapabilities;

    invoke-direct {v6, v3}, Lcom/android/camera2/CameraCapabilities;-><init>(Landroid/hardware/camera2/CameraCharacteristics;)V

    invoke-interface {v5, v4, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 106
    :catch_0
    move-exception v4

    .line 107
    sget-object v4, Lcom/android/camera/module/loader/camera2/CameraTestManager;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "non-integer camera id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_2 .. :try_end_2} :catch_1

    .line 108
    nop

    .line 102
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 132
    :cond_4
    goto :goto_3

    .line 130
    :catch_1
    move-exception v0

    .line 131
    sget-object v1, Lcom/android/camera/module/loader/camera2/CameraTestManager;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 133
    :goto_3
    return-void
.end method


# virtual methods
.method public acquireFrameCallback(Landroid/hardware/camera2/CameraDevice;)V
    .locals 1

    .line 442
    const-string p1, "previewFrame:"

    const-string v0, "acquireFrameCallback"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 443
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->stopPreview()V

    .line 444
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 445
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 446
    return-void
.end method

.method public applyZoom(Landroid/graphics/Rect;)V
    .locals 2

    .line 683
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 684
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 685
    return-void
.end method

.method public captureStillPicture(Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;I)V
    .locals 3

    .line 622
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraCaptureCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;

    .line 624
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    const/4 v0, 0x2

    .line 625
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    .line 626
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 627
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 628
    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 627
    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 655
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 656
    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 657
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    .line 656
    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 660
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {p2}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 661
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$8;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$8;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v0, v1}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 675
    goto :goto_0

    .line 673
    :catch_0
    move-exception p1

    .line 676
    :goto_0
    return-void
.end method

.method public closeCurrentCamera(Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;)V
    .locals 2

    .line 339
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraCloseCallBack:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

    .line 341
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 342
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    .line 343
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 346
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    if-eqz p1, :cond_1

    .line 347
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    .line 348
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    .line 351
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->releasePreview()V

    .line 353
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    if-eqz p1, :cond_2

    .line 354
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 355
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 358
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    if-eqz p1, :cond_3

    .line 359
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 360
    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    .line 362
    :cond_3
    return-void
.end method

.method public getCameraHandler()Landroid/os/Handler;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getCapabilities(I)Lcom/android/camera2/CameraCapabilities;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCapabilities:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera2/CameraCapabilities;

    return-object p1
.end method

.method public getCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    return-object v0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 2

    .line 679
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0
.end method

.method public getCurrentActualCameraId()I
    .locals 1

    .line 185
    iget v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCurrentActualCameraId:I

    return v0
.end method

.method public getCurrentCamera2Device()Landroid/hardware/camera2/CameraDevice;
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Device:Landroid/hardware/camera2/CameraDevice;

    return-object v0
.end method

.method public getFrontCameraId()I
    .locals 1

    .line 148
    sget v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mFrontCameraId:I

    return v0
.end method

.method public getMainBackCameraId()I
    .locals 1

    .line 144
    sget v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMainBackCameraId:I

    return v0
.end method

.method public getPictureSize()Lcom/android/camera/CameraSize;
    .locals 3

    .line 546
    new-instance v0, Lcom/android/camera/CameraSize;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/android/camera/CameraSize;-><init>(II)V

    return-object v0
.end method

.method public hasMuxCamera()Z
    .locals 1

    .line 152
    sget v0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mMuxCameraId:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lockAe(Z)V
    .locals 2

    .line 772
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 774
    return-void
.end method

.method public openCamera(IILio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lio/reactivex/Observer<",
            "Lcom/android/camera/module/loader/camera2/Camera2Result;",
            ">;)V"
        }
    .end annotation

    .line 300
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->cameraOpenEmitter:Lio/reactivex/ObservableEmitter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->cameraOpenEmitter:Lio/reactivex/ObservableEmitter;

    invoke-interface {v0}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 319
    :cond_0
    const-string p1, "rx emmitter:"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "return | "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " | "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->connectableObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {p1, p3}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V

    .line 321
    return-void

    .line 301
    :cond_1
    :goto_0
    new-instance v0, Lcom/android/camera/module/loader/camera2/CameraTestManager$6;

    invoke-direct {v0, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$6;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    .line 308
    invoke-virtual {v0}, Lio/reactivex/Observable;->publish()Lio/reactivex/observables/ConnectableObservable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->connectableObservable:Lio/reactivex/observables/ConnectableObservable;

    .line 309
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->connectableObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v0, p3}, Lio/reactivex/observables/ConnectableObservable;->subscribe(Lio/reactivex/Observer;)V

    .line 310
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->connectableObservable:Lio/reactivex/observables/ConnectableObservable;

    invoke-virtual {v0}, Lio/reactivex/observables/ConnectableObservable;->connect()Lio/reactivex/disposables/Disposable;

    .line 312
    const-string v0, "rx emmitter:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "connect | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

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

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    nop

    .line 325
    invoke-static {p1, p2}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->getActualOpenCameraId(II)I

    move-result p1

    .line 327
    const-string p2, "openCamera: "

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "start | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " | "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    iput p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCurrentActualCameraId:I

    .line 332
    :try_start_0
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCamera2Service:Landroid/hardware/camera2/CameraManager;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraOpenCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1, p3, v0}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    goto :goto_1

    .line 333
    :catch_0
    move-exception p1

    .line 334
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 336
    :goto_1
    return-void
.end method

.method public release(Z)V
    .locals 0

    .line 722
    new-instance p1, Lcom/android/camera/module/loader/camera2/CameraTestManager$9;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager$9;-><init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->closeCurrentCamera(Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;)V

    .line 728
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    .line 729
    return-void
.end method

.method public releasePreview()V
    .locals 1

    .line 698
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 700
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 701
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->close()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 704
    goto :goto_0

    .line 702
    :catch_0
    move-exception v0

    .line 703
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 705
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    .line 707
    :cond_0
    return-void
.end method

.method public resumePreview()V
    .locals 4

    .line 710
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 712
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 713
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewContinuousCallBack:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 717
    goto :goto_0

    .line 715
    :catch_0
    move-exception v0

    .line 716
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 719
    :cond_0
    :goto_0
    return-void
.end method

.method public setAe(I)V
    .locals 2

    .line 767
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 768
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 769
    return-void
.end method

.method public setFocusArea([Landroid/hardware/camera2/params/MeteringRectangle;[Landroid/hardware/camera2/params/MeteringRectangle;)V
    .locals 2

    .line 562
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->stopPreview()V

    .line 565
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v1, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 566
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_REGIONS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, v0, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 567
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 568
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 569
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object p2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 571
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    .line 573
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequest:Landroid/hardware/camera2/CaptureRequest;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mAfCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0, v1}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 576
    goto :goto_0

    .line 574
    :catch_0
    move-exception p1

    .line 575
    const-string p2, "error"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setRepeatingRequest failed, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 578
    :goto_0
    return-void
.end method

.method public setFocusMode(Ljava/lang/String;)V
    .locals 4

    .line 516
    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 517
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 518
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 519
    :cond_0
    const-string v0, "3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x2

    if-eqz v0, :cond_1

    .line 520
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 521
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 522
    :cond_1
    const-string v0, "1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 523
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 524
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 525
    :cond_2
    const-string v0, "2"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 526
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 527
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 530
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 531
    return-void
.end method

.method public setPictureSize(Lcom/android/camera/CameraSize;)V
    .locals 3

    .line 534
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 535
    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    move-result v0

    iget v1, p1, Lcom/android/camera/CameraSize;->width:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 536
    invoke-virtual {v0}, Landroid/media/ImageReader;->getHeight()I

    move-result v0

    iget v1, p1, Lcom/android/camera/CameraSize;->height:I

    if-eq v0, v1, :cond_1

    .line 537
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 540
    :cond_1
    iget v0, p1, Lcom/android/camera/CameraSize;->width:I

    iget p1, p1, Lcom/android/camera/CameraSize;->height:I

    const/16 v1, 0x100

    const/4 v2, 0x2

    invoke-static {v0, p1, v1, v2}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 542
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 543
    return-void
.end method

.method public startPreviewSession(Landroid/hardware/camera2/CameraDevice;Landroid/graphics/SurfaceTexture;Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;Lcom/android/camera/CameraSize;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 368
    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    .line 370
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    if-eqz p3, :cond_0

    .line 371
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 374
    :cond_0
    new-instance p3, Landroid/view/Surface;

    invoke-direct {p3, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    .line 377
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 378
    invoke-virtual {p2}, Landroid/media/ImageReader;->getWidth()I

    move-result p2

    iget p3, p4, Lcom/android/camera/CameraSize;->width:I

    if-ne p2, p3, :cond_1

    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 379
    invoke-virtual {p2}, Landroid/media/ImageReader;->getHeight()I

    move-result p2

    iget p3, p4, Lcom/android/camera/CameraSize;->height:I

    if-eq p2, p3, :cond_2

    .line 380
    :cond_1
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    invoke-virtual {p2}, Landroid/media/ImageReader;->close()V

    .line 383
    :cond_2
    iget p2, p4, Lcom/android/camera/CameraSize;->width:I

    iget p3, p4, Lcom/android/camera/CameraSize;->height:I

    const/16 p4, 0x100

    const/4 v0, 0x2

    invoke-static {p2, p3, p4, v0}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 385
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mOnImageAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p2, p3, p4}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 389
    const/4 p2, 0x1

    :try_start_0
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p3

    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 390
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p3, p4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 392
    new-array p3, v0, [Landroid/view/Surface;

    const/4 p4, 0x0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    aput-object v0, p3, p4

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCaptureImageReader:Landroid/media/ImageReader;

    .line 393
    invoke-virtual {p4}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p4

    aput-object p4, p3, p2

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSessionCallBack:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    .line 392
    invoke-virtual {p1, p2, p3, p4}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    goto :goto_0

    .line 396
    :catch_0
    move-exception p1

    .line 397
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 398
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 400
    :goto_0
    return-void
.end method

.method public startPreviewSessionWithFrameCallback(Landroid/hardware/camera2/CameraDevice;Landroid/graphics/SurfaceTexture;Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;Lcom/android/camera/CameraSize;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 408
    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    .line 410
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    if-eqz p3, :cond_0

    .line 411
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p3, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 414
    :cond_0
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    .line 415
    invoke-virtual {p3}, Landroid/media/ImageReader;->getWidth()I

    move-result p3

    iget v0, p4, Lcom/android/camera/CameraSize;->width:I

    if-ne p3, v0, :cond_1

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    .line 416
    invoke-virtual {p3}, Landroid/media/ImageReader;->getHeight()I

    move-result p3

    iget v0, p4, Lcom/android/camera/CameraSize;->height:I

    if-eq p3, v0, :cond_2

    .line 417
    :cond_1
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    invoke-virtual {p3}, Landroid/media/ImageReader;->close()V

    .line 420
    :cond_2
    iget p3, p4, Lcom/android/camera/CameraSize;->width:I

    iget p4, p4, Lcom/android/camera/CameraSize;->height:I

    const/16 v0, 0x23

    const/4 v1, 0x1

    invoke-static {p3, p4, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p3

    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    .line 422
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mOnFrameAvailableListener:Landroid/media/ImageReader$OnImageAvailableListener;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {p3, p4, v0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 425
    new-instance p3, Landroid/view/Surface;

    invoke-direct {p3, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    .line 428
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 429
    iget-object p2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p2, p3}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 431
    const/4 p2, 0x2

    new-array p2, p2, [Landroid/view/Surface;

    const/4 p3, 0x0

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    aput-object p4, p2, p3

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    .line 432
    invoke-virtual {p3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p3

    aput-object p3, p2, v1

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSessionCallBack:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    .line 431
    invoke-virtual {p1, p2, p3, p4}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 438
    goto :goto_0

    .line 435
    :catch_0
    move-exception p1

    .line 436
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 437
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 439
    :goto_0
    return-void
.end method

.method public startVideoRecording(Landroid/hardware/camera2/CameraDevice;Landroid/graphics/SurfaceTexture;Landroid/media/MediaRecorder;Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 478
    iput-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    .line 480
    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    if-eqz p4, :cond_0

    .line 481
    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p4, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 484
    :cond_0
    new-instance p4, Landroid/view/Surface;

    invoke-direct {p4, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    .line 486
    invoke-virtual {p3}, Landroid/media/MediaRecorder;->getSurface()Landroid/view/Surface;

    move-result-object p2

    .line 489
    const/4 p3, 0x3

    :try_start_0
    invoke-virtual {p1, p3}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p3

    iput-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 490
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    invoke-virtual {p3, p4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 491
    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {p3, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 493
    const/4 p3, 0x2

    new-array p3, p3, [Landroid/view/Surface;

    const/4 p4, 0x0

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSurface:Landroid/view/Surface;

    aput-object v0, p3, p4

    const/4 p4, 0x1

    aput-object p2, p3, p4

    .line 494
    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSessionCallBack:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    iget-object p4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraHandler:Landroid/os/Handler;

    .line 493
    invoke-virtual {p1, p2, p3, p4}, Landroid/hardware/camera2/CameraDevice;->createCaptureSession(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 500
    goto :goto_0

    .line 497
    :catch_0
    move-exception p1

    .line 498
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 499
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewCallback:Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 501
    :goto_0
    return-void
.end method

.method public stopFrameCallback()V
    .locals 2

    .line 449
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->stopPreview()V

    .line 450
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewFrameImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 451
    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mPreviewRequestBuilder:Landroid/hardware/camera2/CaptureRequest$Builder;

    invoke-virtual {v1, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->removeTarget(Landroid/view/Surface;)V

    .line 452
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 453
    invoke-virtual {p0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 454
    return-void
.end method

.method public stopPreview()V
    .locals 1

    .line 688
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    if-eqz v0, :cond_0

    .line 690
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 693
    goto :goto_0

    .line 691
    :catch_0
    move-exception v0

    .line 692
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 695
    :cond_0
    :goto_0
    return-void
.end method

.method public stopRecordingVideo()V
    .locals 1

    .line 506
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->stopRepeating()V

    .line 507
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager;->mCameraPreviewSession:Landroid/hardware/camera2/CameraCaptureSession;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraCaptureSession;->abortCaptures()V
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 510
    goto :goto_0

    .line 508
    :catch_0
    move-exception v0

    .line 509
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 511
    :goto_0
    return-void
.end method
