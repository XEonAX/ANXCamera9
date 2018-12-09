.class public Lcom/android/camera/constant/MiCameraCharacteristics;
.super Ljava/lang/Object;
.source "MiCameraCharacteristics.java"


# static fields
.field public static final BEAUTY_MAKEUP:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final CAM_CALIBRATION_DATA:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[B>;"
        }
    .end annotation
.end field

.field public static final CUSTOM_HFR_FPS_TABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[I>;"
        }
    .end annotation
.end field

.field public static final EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[I>;"
        }
    .end annotation
.end field

.field public static final EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field public static final SCALER_AVAILABLE_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_BEAUTY:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 11
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor"

    const-class v2, Ljava/lang/Byte;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 14
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "com.xiaomi.camera.supportedfeatures.videoBeauty"

    const-class v2, Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->VIDEO_BEAUTY:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 17
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "com.xiaomi.camera.supportedfeatures.beautyMakeup"

    const-class v2, Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->BEAUTY_MAKEUP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 23
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size"

    const-class v2, [I

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 26
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number"

    const-class v2, Ljava/lang/Integer;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 30
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.quic.camera2.customhfrfps.info.CustomHFRFpsTable"

    const-class v2, [I

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->CUSTOM_HFR_FPS_TABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 33
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "xiaomi.scaler.availableStreamConfigurations"

    const-class v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 37
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "xiaomi.scaler.availableLimitStreamConfigurations"

    const-class v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 44
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "com.xiaomi.camera.algoup.dualCalibrationData"

    const-class v2, [B

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->CAM_CALIBRATION_DATA:Landroid/hardware/camera2/CameraCharacteristics$Key;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
