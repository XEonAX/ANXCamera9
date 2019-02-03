.class public Lcom/android/camera2/CameraCapabilities;
.super Ljava/lang/Object;
.source "CameraCapabilities.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/CameraCapabilities$OperationMode;
    }
.end annotation


# static fields
.field public static final CAMERA_ILLEGALSTATE_EXCEPTION:I = 0x100

.field private static final DEFAULT_VIEW_ANGLE:F = 51.5f

.field private static final HAL_PIXEL_FORMAT_BLOB:I = 0x21

.field private static final LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private static final QCFA_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private static final QCFA_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field public static final SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH:I = 0x9000

.field public static final SESSION_OPERATION_MODE_ALGO_UP_QCFA:I = 0x9001

.field public static final SESSION_OPERATION_MODE_ALGO_UP_SAT:I = 0x9002

.field public static final SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH:I = 0x9003

.field public static final SESSION_OPERATION_MODE_AUTO_ZOOM:I = 0x80f4

.field public static final SESSION_OPERATION_MODE_FOVC:I = 0xf010

.field public static final SESSION_OPERATION_MODE_FRONT_PORTRAIT:I = 0x80f1

.field public static final SESSION_OPERATION_MODE_HFR_120:I = 0x8078

.field public static final SESSION_OPERATION_MODE_HSR_60:I = 0x803c

.field public static final SESSION_OPERATION_MODE_MANUAL:I = 0x8003

.field public static final SESSION_OPERATION_MODE_MCTF:I = 0x8030

.field public static final SESSION_OPERATION_MODE_MIUI_BACK:I = 0x8001

.field public static final SESSION_OPERATION_MODE_MIUI_FRONT:I = 0x8005

.field public static final SESSION_OPERATION_MODE_NORMAL:I = 0x0

.field public static final SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY:I = 0x80f3

.field public static final SESSION_OPERATION_MODE_PANORMA:I = 0x8008

.field public static final SESSION_OPERATION_MODE_PORTRAIT:I = 0x8002

.field public static final SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY:I = 0x80f5

.field public static final SESSION_OPERATION_MODE_QCFA:I = 0x8007

.field public static final SESSION_OPERATION_MODE_SUPER_NIGHT:I = 0x800a

.field public static final SESSION_OPERATION_MODE_VIDEO:I = 0x8004

.field public static final SESSION_OPERATION_MODE_VIDEO_BEAUTY:I = 0x8009

.field private static final TAG:Ljava/lang/String;

.field public static final ULTRA_PIXEL_32M:I = 0x1ec7b00

.field public static final ULTRA_PIXEL_48M:I = 0x2dc6c00

.field public static final ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private static final ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "[",
            "Landroid/hardware/camera2/params/StreamConfiguration;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final mCameraId:I

.field private final mCaptureRequestVendorKeys:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

.field private mOperatingMode:I

.field private mStreamConfigurationMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/hardware/camera2/params/StreamConfigurationMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 107
    const-class v0, Lcom/android/camera2/CameraCapabilities;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    .line 110
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.codeaurora.qcamera3.quadra_cfa.activeArraySize"

    const-class v2, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->QCFA_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 112
    new-instance v0, Landroid/hardware/camera2/CameraCharacteristics$Key;

    const-string v1, "org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations"

    const-class v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-direct {v0, v1, v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->QCFA_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 115
    sget-object v0, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 118
    new-instance v0, Lcom/android/camera2/CameraCapabilities$1;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/android/camera2/CameraCapabilities$1;-><init>(I)V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;

    .line 131
    new-instance v0, Lcom/android/camera2/CameraCapabilities$2;

    invoke-direct {v0}, Lcom/android/camera2/CameraCapabilities$2;-><init>()V

    sput-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/hardware/camera2/CameraCharacteristics;I)V
    .locals 1

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    if-eqz p1, :cond_2

    .line 149
    iput-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    .line 150
    iput p2, p0, Lcom/android/camera2/CameraCapabilities;->mCameraId:I

    .line 151
    iget-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object p2, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 152
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_0

    .line 153
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    goto :goto_1

    .line 156
    :cond_0
    iget-object p1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCharacteristics;->getNativeCopy()Landroid/hardware/camera2/impl/CameraMetadataNative;

    move-result-object p1

    const-class p2, Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p1, p2}, Landroid/hardware/camera2/impl/CameraMetadataNative;->getAllVendorKeys(Ljava/lang/Class;)Ljava/util/ArrayList;

    move-result-object p1

    .line 157
    new-instance p2, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p2, v0}, Ljava/util/HashSet;-><init>(I)V

    iput-object p2, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    .line 158
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 159
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 160
    goto :goto_0

    .line 162
    :cond_1
    :goto_1
    return-void

    .line 147
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null CameraCharacteristics"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000()Landroid/hardware/camera2/CameraCharacteristics$Key;
    .locals 1

    .line 46
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->QCFA_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    return-object v0
.end method

.method static synthetic access$100()Landroid/hardware/camera2/CameraCharacteristics$Key;
    .locals 1

    .line 46
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    return-object v0
.end method

.method private convertToPictureSize([Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    .line 301
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 302
    if-eqz p1, :cond_0

    .line 303
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    .line 304
    new-instance v4, Lcom/android/camera/CameraSize;

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v4, v5, v3}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 307
    :cond_0
    return-object v0
.end method

.method public static getBurstShootCount()I
    .locals 1

    .line 577
    invoke-static {}, Lcom/mi/config/b;->getBurstShootCount()I

    move-result v0

    return v0
.end method

.method private getExtraHighSpeedVideoConfiguration()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiHighSpeedVideoConfiguration;",
            ">;"
        }
    .end annotation

    .line 582
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_NUMBER:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 583
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lez v1, :cond_0

    .line 584
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 585
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v1, v0}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->unmarshal([II)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 589
    :cond_0
    goto :goto_0

    .line 587
    :catch_0
    move-exception v0

    .line 588
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;
    .locals 14

    .line 330
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 331
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_8

    .line 334
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 335
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 336
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v2

    .line 335
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 337
    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v3, Lcom/android/camera/constant/MiCameraCharacteristics;->XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 338
    invoke-virtual {v3}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v3

    .line 337
    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    .line 339
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographyMode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 340
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 341
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getStreamConfigurationMap: sr stream configs size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 342
    :cond_1
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v3, Lcom/android/camera2/CameraCapabilities;->QCFA_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 343
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isQcfaMode()Z

    move-result v2

    if-nez v2, :cond_3

    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedAndroidScalerStream()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographyMode()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 344
    :cond_3
    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Lcom/android/camera2/CameraCapabilities;->QCFA_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 345
    if-eqz v1, :cond_4

    .line 346
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 348
    :cond_4
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 350
    :goto_0
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getStreamConfigurationMap: qcfa stream configs size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 351
    :cond_5
    if-eqz v1, :cond_6

    .line 352
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/hardware/camera2/params/StreamConfiguration;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 353
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getStreamConfigurationMap: limit stream configs size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    :cond_6
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_7

    .line 356
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    iget-object v2, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    .line 358
    :cond_7
    iget-object v1, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v2, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    new-instance v13, Landroid/hardware/camera2/params/StreamConfigurationMap;

    const/4 v3, 0x0

    new-array v3, v3, [Landroid/hardware/camera2/params/StreamConfiguration;

    .line 359
    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, [Landroid/hardware/camera2/params/StreamConfiguration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_MIN_FRAME_DURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 360
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, [Landroid/hardware/camera2/params/StreamConfigurationDuration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STALL_DURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 361
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, [Landroid/hardware/camera2/params/StreamConfigurationDuration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->DEPTH_AVAILABLE_DEPTH_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 362
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [Landroid/hardware/camera2/params/StreamConfiguration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->DEPTH_AVAILABLE_DEPTH_MIN_FRAME_DURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 363
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Landroid/hardware/camera2/params/StreamConfigurationDuration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->DEPTH_AVAILABLE_DEPTH_STALL_DURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 364
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, [Landroid/hardware/camera2/params/StreamConfigurationDuration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_HIGH_SPEED_VIDEO_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 365
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, [Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v3, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_INPUT_OUTPUT_FORMATS_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 366
    invoke-virtual {v0, v3}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Landroid/hardware/camera2/params/ReprocessFormatsMap;

    const/4 v12, 0x1

    move-object v3, v13

    invoke-direct/range {v3 .. v12}, Landroid/hardware/camera2/params/StreamConfigurationMap;-><init>([Landroid/hardware/camera2/params/StreamConfiguration;[Landroid/hardware/camera2/params/StreamConfigurationDuration;[Landroid/hardware/camera2/params/StreamConfigurationDuration;[Landroid/hardware/camera2/params/StreamConfiguration;[Landroid/hardware/camera2/params/StreamConfigurationDuration;[Landroid/hardware/camera2/params/StreamConfigurationDuration;[Landroid/hardware/camera2/params/HighSpeedVideoConfiguration;Landroid/hardware/camera2/params/ReprocessFormatsMap;Z)V

    .line 358
    invoke-virtual {v1, v2, v13}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 371
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mStreamConfigurationMap:Landroid/util/SparseArray;

    iget v1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    return-object v0
.end method

.method private isQcfaMode()Z
    .locals 2

    .line 320
    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x8007

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x9001

    if-ne v0, v1, :cond_0

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

.method private isSupportedAndroidScalerStream()Z
    .locals 2

    .line 316
    const-string v0, "grus"

    sget-object v1, Lcom/mi/config/b;->pE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getFacing()I

    move-result v0

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isUltraPixelPhotographyMode()Z
    .locals 2

    .line 325
    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x80f3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    const v1, 0x80f5

    if-ne v0, v1, :cond_0

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


# virtual methods
.method public getActiveArraySize()Landroid/graphics/Rect;
    .locals 2

    .line 188
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/CameraCapabilities;->QCFA_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 189
    invoke-virtual {v1}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera2/CameraCapabilities;->QCFA_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    return-object v0
.end method

.method public getCameraCalibrationData()[B
    .locals 2

    .line 378
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera/constant/MiCameraCharacteristics;->CAM_CALIBRATION_DATA:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getCameraCharacteristic(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 560
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getCameraId()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mCameraId:I

    return v0
.end method

.method public getExposureCompensationRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 497
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getExposureCompensationRational()Landroid/util/Rational;
    .locals 2

    .line 516
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_STEP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Rational;

    return-object v0
.end method

.method public getExposureCompensationStep()F
    .locals 2

    .line 511
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_COMPENSATION_STEP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Rational;

    .line 512
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public getExposureTimeRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 520
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_EXPOSURE_TIME_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getFacing()I
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 179
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public getIsoRange()Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 196
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_SENSITIVITY_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getMaxExposureCompensation()I
    .locals 1

    .line 501
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getExposureCompensationRange()Landroid/util/Range;

    move-result-object v0

    .line 503
    if-nez v0, :cond_0

    .line 504
    const/4 v0, 0x0

    return v0

    .line 506
    :cond_0
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getMaxFaceCount()I
    .locals 2

    .line 282
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->STATISTICS_INFO_MAX_FACE_COUNT:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 283
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getMaxIso()I
    .locals 1

    .line 200
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getIsoRange()Landroid/util/Range;

    move-result-object v0

    .line 202
    if-nez v0, :cond_0

    .line 203
    const/4 v0, 0x0

    return v0

    .line 205
    :cond_0
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getMaxZoomRatio()F
    .locals 2

    .line 210
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_MAX_DIGITAL_ZOOM:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 211
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public getMinimumFocusDistance()F
    .locals 2

    .line 259
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 260
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 261
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getOperatingMode()I
    .locals 1

    .line 170
    iget v0, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    return v0
.end method

.method public getSensorInfoTimestampSource()I
    .locals 2

    .line 556
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_TIMESTAMP_SOURCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getSensorOrientation()I
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 184
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getSupportedAWBModes()[I
    .locals 2

    .line 473
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedAntiBandingModes()[I
    .locals 2

    .line 489
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_ANTIBANDING_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedColorEffects()[I
    .locals 2

    .line 485
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_EFFECTS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedCustomFpsRange()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera2/MiCustomFpsRange;",
            ">;"
        }
    .end annotation

    .line 292
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Lcom/android/camera/constant/MiCameraCharacteristics;->CUSTOM_HFR_FPS_TABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 293
    invoke-static {v0}, Lcom/android/camera2/MiCustomFpsRange;->unmarshal([I)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 294
    :catch_0
    move-exception v0

    .line 295
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportedFlashModes()[I
    .locals 2

    .line 477
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedFocusModes()[I
    .locals 2

    .line 481
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AF_AVAILABLE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedFpsRange()[Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 287
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Range;

    return-object v0
.end method

.method public getSupportedHFRVideoFPSList(Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 462
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 463
    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    .line 464
    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 465
    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 463
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 469
    :cond_1
    return-object v0
.end method

.method public getSupportedHardwareLevel()I
    .locals 2

    .line 552
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            ")[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 432
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 433
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 434
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighSpeedVideoFpsRangesFor(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v0

    .line 435
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportExtraHighSpeedVideoConfiguration()Z

    move-result v1

    if-nez v1, :cond_0

    .line 436
    return-object v0

    .line 439
    :cond_0
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getExtraHighSpeedVideoConfiguration()Ljava/util/List;

    move-result-object v1

    .line 440
    if-nez v1, :cond_1

    .line 441
    return-object v0

    .line 444
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 445
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    .line 446
    if-eqz p1, :cond_2

    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 447
    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getFpsRange()Landroid/util/Range;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    :cond_2
    goto :goto_0

    .line 451
    :cond_3
    if-eqz v0, :cond_4

    .line 452
    array-length p1, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_4

    aget-object v3, v0, v1

    .line 453
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 452
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 457
    :cond_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Landroid/util/Range;

    .line 458
    invoke-interface {v2, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/util/Range;

    return-object p1
.end method

.method public getSupportedHighSpeedVideoSize()[Landroid/util/Size;
    .locals 7

    .line 400
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 401
    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 402
    invoke-virtual {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getHighSpeedVideoSizes()[Landroid/util/Size;

    move-result-object v0

    .line 403
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportExtraHighSpeedVideoConfiguration()Z

    move-result v1

    if-nez v1, :cond_0

    .line 404
    return-object v0

    .line 407
    :cond_0
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getExtraHighSpeedVideoConfiguration()Ljava/util/List;

    move-result-object v1

    .line 408
    if-nez v1, :cond_1

    .line 409
    return-object v0

    .line 412
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 413
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera2/MiHighSpeedVideoConfiguration;

    .line 414
    invoke-virtual {v3}, Lcom/android/camera2/MiHighSpeedVideoConfiguration;->getSize()Landroid/util/Size;

    move-result-object v3

    .line 415
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 416
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    :cond_2
    goto :goto_0

    .line 420
    :cond_3
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 421
    array-length v3, v0

    move v4, v1

    :goto_1
    if-ge v4, v3, :cond_5

    aget-object v5, v0, v4

    .line 422
    invoke-interface {v2, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 423
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 421
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 428
    :cond_5
    new-array v0, v1, [Landroid/util/Size;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Size;

    return-object v0
.end method

.method public getSupportedOutputSize(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    .line 382
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 383
    if-eqz v0, :cond_0

    .line 384
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object p1

    .line 385
    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 387
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p1
.end method

.method public getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    .line 391
    invoke-direct {p0}, Lcom/android/camera2/CameraCapabilities;->getStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 392
    if-eqz v0, :cond_0

    .line 393
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object p1

    .line 394
    invoke-direct {p0, p1}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 396
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p1
.end method

.method public getSupportedSceneModes()[I
    .locals 2

    .line 493
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AVAILABLE_SCENE_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public getSupportedThumbnailSizes()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/CameraSize;",
            ">;"
        }
    .end annotation

    .line 311
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->JPEG_AVAILABLE_THUMBNAIL_SIZES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Size;

    .line 312
    invoke-direct {p0, v0}, Lcom/android/camera2/CameraCapabilities;->convertToPictureSize([Landroid/util/Size;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getViewAngle(Z)F
    .locals 9

    .line 530
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_FOCAL_LENGTHS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    .line 531
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    array-length v3, v0

    if-lez v3, :cond_2

    .line 532
    aget v0, v0, v2

    .line 533
    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v4, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PHYSICAL_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/SizeF;

    .line 534
    if-eqz v3, :cond_2

    .line 535
    if-eqz p1, :cond_0

    invoke-virtual {v3}, Landroid/util/SizeF;->getHeight()F

    move-result v4

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Landroid/util/SizeF;->getWidth()F

    move-result v4

    .line 536
    :goto_0
    const/4 v5, 0x0

    cmpl-float v5, v4, v5

    if-lez v5, :cond_2

    .line 537
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    float-to-double v7, v4

    mul-double/2addr v5, v7

    float-to-double v7, v0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->atan(D)D

    move-result-wide v4

    .line 538
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v4

    mul-double/2addr v6, v4

    double-to-float v4, v6

    .line 539
    sget-object v5, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%s view angle: %.2f, size = %s, focalLength = %.4f"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    .line 540
    if-eqz p1, :cond_1

    const-string p1, "vertical"

    goto :goto_1

    :cond_1
    const-string p1, "horizontal"

    :goto_1
    aput-object p1, v8, v2

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v8, v1

    const/4 p1, 0x2

    aput-object v3, v8, p1

    const/4 p1, 0x3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v8, p1

    .line 539
    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 541
    return v4

    .line 546
    :cond_2
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "failed to get %s view angle"

    new-array v1, v1, [Ljava/lang/Object;

    .line 547
    if-eqz p1, :cond_3

    const-string p1, "vertical"

    goto :goto_2

    :cond_3
    const-string p1, "horizontal"

    :goto_2
    aput-object p1, v1, v2

    .line 546
    invoke-static {v3, v4, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    const/high16 p1, 0x424e0000    # 51.5f

    return p1
.end method

.method public getZoomRatioTeleReal()I
    .locals 1

    .line 662
    sget-boolean v0, Lcom/mi/config/b;->qT:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x11

    goto :goto_0

    :cond_0
    const/16 v0, 0x14

    :goto_0
    return v0
.end method

.method public isAELockSupported()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 244
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 245
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAERegionSupported()Z
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_MAX_REGIONS_AE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 225
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAFRegionSupported()Z
    .locals 2

    .line 229
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_MINIMUM_FOCUS_DISTANCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 230
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAWBLockSupported()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 250
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AWB_LOCK_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 251
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isAutoFocusSupported()Z
    .locals 2

    .line 255
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFocusModes()[I

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcom/android/camera/Util;->isSupported(I[I)Z

    move-result v0

    return v0
.end method

.method public isBackwardCaptureSupported()Z
    .locals 2

    .line 794
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->XIAOMI_BACKWARD_CAPTURE_HINT:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 795
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    .line 794
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isEISPreviewSupported()Z
    .locals 5

    .line 779
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->EIS_PREVIEW_SUPPORTED:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 780
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v2

    .line 779
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 781
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->EIS_PREVIEW_SUPPORTED:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    .line 782
    sget-object v2, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isEISPreviewSupported: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v2, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    .line 785
    :cond_1
    return v1
.end method

.method public isFaceDetectionSupported()Z
    .locals 6

    .line 269
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->STATISTICS_INFO_AVAILABLE_FACE_DETECT_MODES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 271
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 272
    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 273
    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 274
    return v5

    .line 272
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 278
    :cond_1
    return v1
.end method

.method public isFixedFocus()Z
    .locals 2

    .line 265
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getMinimumFocusDistance()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlashSupported()Z
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 220
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPartialMetadataSupported()Z
    .locals 2

    .line 789
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_PARTIAL_RESULT_COUNT:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 790
    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isSupportAutoHdr()Z
    .locals 2

    .line 600
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->HDR_CHECKER_ENABLE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportBeauty()Z
    .locals 2

    .line 640
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->BEAUTY_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportBeautyMakeup()Z
    .locals 3

    .line 653
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->BEAUTY_MAKEUP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 654
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 655
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->BEAUTY_MAKEUP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 656
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 658
    :cond_1
    return v1
.end method

.method public isSupportBeautyType(Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z
    .locals 1

    .line 707
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-static {v0, p1}, Lcom/android/camera2/compat/MiCameraCompat;->supportBeautyType(Ljava/util/HashSet;Lcom/android/camera/fragment/beauty/BeautyParameters$Type;)Z

    move-result p1

    return p1
.end method

.method public isSupportBokeh()Z
    .locals 2

    .line 624
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->MFNR_BOKEH:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportBokehAdjust()Z
    .locals 2

    .line 775
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->BOKEH_F_NUMBER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportBurstFps()Z
    .locals 2

    .line 682
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->BURST_SHOOT_FPS:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportBurstHint()Z
    .locals 2

    .line 678
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->BURST_CAPTURE_HINT:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportCameraAi30()Z
    .locals 2

    .line 690
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->CAMERA_AI_30:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportContrast()Z
    .locals 1

    .line 699
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-static {v0}, Lcom/android/camera2/compat/MiCameraCompat;->supportContrast(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public isSupportDepurple()Z
    .locals 2

    .line 694
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->DEPURPLE_TAG:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportDeviceOrientation()Z
    .locals 2

    .line 636
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->DEVICE_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportExtraHighSpeedVideoConfiguration()Z
    .locals 1

    .line 711
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-static {v0}, Lcom/android/camera2/compat/MiCameraCompat;->supportExtraHighSpeedVideoConfiguration(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public isSupportEyeLight()Z
    .locals 1

    .line 715
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-static {v0}, Lcom/android/camera2/compat/MiCameraCompat;->supportEyeLight(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public isSupportFaceAgeAnalyze()Z
    .locals 2

    .line 628
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->FACE_AGE_ANALYZE_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportFaceScore()Z
    .locals 2

    .line 632
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->FACE_SCORE_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportFastZoomIn()Z
    .locals 2

    .line 719
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/CaptureResultParser;->FAST_ZOOM_RESULT:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureResult$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportFrontMirror()Z
    .locals 2

    .line 674
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->FRONT_MIRROR:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportHHT()Z
    .locals 2

    .line 604
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->HHT_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportHdr()Z
    .locals 2

    .line 596
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->HDR_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportLensDirtyDetect()Z
    .locals 1

    .line 703
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-static {v0}, Lcom/android/camera2/compat/MiCameraCompat;->supportLensDirtyDetect(Ljava/util/HashSet;)Z

    move-result v0

    return v0
.end method

.method public isSupportMfnr()Z
    .locals 2

    .line 616
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->MFNR_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportNormalWideLDC()Z
    .locals 2

    .line 755
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 756
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    .line 755
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 757
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportNormalWideLDC: true"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 758
    const/4 v0, 0x1

    return v0

    .line 760
    :cond_0
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportNormalWideLDC: false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportOIS()Z
    .locals 4

    .line 564
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->LENS_INFO_AVAILABLE_OPTICAL_STABILIZATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 565
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    array-length v2, v0

    if-nez v2, :cond_0

    goto :goto_0

    .line 569
    :cond_0
    array-length v2, v0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    aget v0, v0, v1

    if-nez v0, :cond_1

    .line 570
    return v1

    .line 573
    :cond_1
    return v3

    .line 566
    :cond_2
    :goto_0
    return v1
.end method

.method public isSupportParallel()Z
    .locals 2

    .line 612
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->PARALLEL_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportPortraitLighting()Z
    .locals 2

    .line 686
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->PORTRAIT_LIGHTING:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportSnapShotTorch()Z
    .locals 2

    .line 666
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->SNAP_SHOT_TORCH:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportSuperResolution()Z
    .locals 2

    .line 608
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->SUPER_RESOLUTION_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportSwMfnr()Z
    .locals 2

    .line 620
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->SW_MFNR_ENABLED:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportUltraWideLDC()Z
    .locals 2

    .line 765
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 766
    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    .line 765
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 767
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportUltraWideLDC: true"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 768
    const/4 v0, 0x1

    return v0

    .line 770
    :cond_0
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->TAG:Ljava/lang/String;

    const-string v1, "isSupportUltraWideLDC: false"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportVideoBeauty()Z
    .locals 3

    .line 644
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->VIDEO_BEAUTY:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 645
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 646
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->VIDEO_BEAUTY:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 647
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    .line 649
    :cond_1
    return v1
.end method

.method public isSupportWatermark()Z
    .locals 2

    .line 670
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v1, Lcom/android/camera2/compat/MiCameraCompatBaseImpl;->WATERMARK_APPLIEDTYPE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isSupportedQcfa()Z
    .locals 3

    .line 234
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 235
    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 236
    iget-object v0, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    sget-object v2, Lcom/android/camera/constant/MiCameraCharacteristics;->IS_QCFA_SENSOR:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Byte;

    .line 237
    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    if-ne v0, v2, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    .line 239
    :cond_1
    return v1
.end method

.method public isUltraPixelPhotographySupported(I)Z
    .locals 8

    .line 723
    sget-object v0, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_SIZE_LIST:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/util/Size;

    .line 724
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 725
    return v0

    .line 728
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->isSupportedQcfa()Z

    move-result v1

    if-nez v1, :cond_1

    .line 729
    return v0

    .line 732
    :cond_1
    sget-object v1, Lcom/android/camera2/CameraCapabilities;->ULTRA_PIXEL_STREAM_CONFIGURATIONS_VENDOR_KEYS:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 733
    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCaptureRequestVendorKeys:Ljava/util/HashSet;

    invoke-virtual {v2}, Landroid/hardware/camera2/CameraCharacteristics$Key;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 734
    goto :goto_0

    .line 737
    :cond_3
    iget-object v3, p0, Lcom/android/camera2/CameraCapabilities;->mCharacteristics:Landroid/hardware/camera2/CameraCharacteristics;

    invoke-virtual {v3, v2}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Landroid/hardware/camera2/params/StreamConfiguration;

    .line 738
    if-eqz v2, :cond_2

    array-length v3, v2

    if-gtz v3, :cond_4

    .line 739
    goto :goto_0

    .line 742
    :cond_4
    array-length v3, v2

    move v4, v0

    :goto_1
    if-ge v4, v3, :cond_6

    aget-object v5, v2, v4

    .line 743
    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getFormat()I

    move-result v6

    const/16 v7, 0x21

    if-ne v6, v7, :cond_5

    .line 744
    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v7

    if-ne v6, v7, :cond_5

    .line 745
    invoke-virtual {v5}, Landroid/hardware/camera2/params/StreamConfiguration;->getHeight()I

    move-result v5

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v6

    if-ne v5, v6, :cond_5

    .line 746
    const/4 p1, 0x1

    return p1

    .line 742
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 749
    :cond_6
    goto :goto_0

    .line 751
    :cond_7
    return v0
.end method

.method public isZoomSupported()Z
    .locals 2

    .line 215
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getMaxZoomRatio()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setOperatingMode(I)V
    .locals 0

    .line 165
    iput p1, p0, Lcom/android/camera2/CameraCapabilities;->mOperatingMode:I

    .line 166
    return-void
.end method
