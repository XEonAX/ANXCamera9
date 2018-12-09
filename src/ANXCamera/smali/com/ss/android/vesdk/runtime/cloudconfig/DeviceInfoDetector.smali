.class public Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;
.super Ljava/lang/Object;
.source "DeviceInfoDetector.java"


# static fields
.field private static abi:Ljava/lang/String;

.field private static appid:Ljava/lang/String;

.field private static cpu:Ljava/lang/String;

.field private static cpu_core:Ljava/lang/String;

.field private static cpu_freq:Ljava/lang/String;

.field private static device_brand:Ljava/lang/String;

.field private static external_storage:Ljava/lang/String;

.field private static gpu:Ljava/lang/String;

.field private static gpu_ver:Ljava/lang/String;

.field private static inited:Z

.field private static locale:Ljava/lang/String;

.field private static memory:Ljava/lang/String;

.field private static model:Ljava/lang/String;

.field private static nativeInited:Z

.field private static opengl_version:Ljava/lang/String;

.field private static os_sdk_int:Ljava/lang/String;

.field public static sNumberKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static screen_height:Ljava/lang/String;

.field private static screen_width:Ljava/lang/String;

.field private static sim_operator:Ljava/lang/String;

.field private static storage:Ljava/lang/String;

.field private static ve_version:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const/4 v0, 0x0

    sput-boolean v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->inited:Z

    .line 19
    sput-boolean v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->nativeInited:Z

    .line 34
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->sNumberKeys:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 171
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->toMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method private static getCpuAbi()Ljava/lang/String;
    .locals 4

    .line 71
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    sget-object v1, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    .line 74
    if-eqz v1, :cond_1

    .line 75
    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 76
    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-eq v2, v3, :cond_0

    .line 78
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 84
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    .line 21
    sget-boolean v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->inited:Z

    if-nez v0, :cond_1

    .line 22
    const-class v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;

    monitor-enter v0

    .line 23
    :try_start_0
    sget-boolean v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->inited:Z

    if-nez v1, :cond_0

    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->initInternal(Landroid/content/Context;)V

    .line 25
    const/4 p0, 0x1

    sput-boolean p0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->inited:Z

    .line 27
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method private static initInternal(Landroid/content/Context;)V
    .locals 4

    .line 48
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 53
    :goto_0
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->model:Ljava/lang/String;

    .line 54
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->readCpuHardware()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu:Ljava/lang/String;

    .line 55
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getMaxCpuFreq()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu_freq:Ljava/lang/String;

    .line 56
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getNumOfCores()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu_core:Ljava/lang/String;

    .line 57
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getTotalMemory()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->memory:Ljava/lang/String;

    .line 58
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getInternalStorage()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->storage:Ljava/lang/String;

    .line 59
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getExternalStorage(Landroid/content/Context;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->external_storage:Ljava/lang/String;

    .line 60
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->os_sdk_int:Ljava/lang/String;

    .line 61
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getScreenWidth(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->screen_width:Ljava/lang/String;

    .line 62
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getRealScreenHeight(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->screen_height:Ljava/lang/String;

    .line 63
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->appid:Ljava/lang/String;

    .line 64
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->getCpuAbi()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->abi:Ljava/lang/String;

    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->locale:Ljava/lang/String;

    .line 66
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoUtils;->getSimOperator(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->sim_operator:Ljava/lang/String;

    .line 67
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sput-object p0, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->device_brand:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public static toMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 133
    const-string v1, "model"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->model:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v1, "cpu"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v1, "cpu_freq"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu_freq:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v1, "cpu_core"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->cpu_core:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v1, "memory"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->memory:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v1, "storage"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->storage:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v1, "external_storage"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->external_storage:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    const-string v1, "screen_width"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->screen_width:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v1, "screen_height"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->screen_height:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-string v1, "os_sdk_int"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->os_sdk_int:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const-string v1, "appid"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->appid:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const-string v1, "abi"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->abi:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const-string v1, "locale"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->locale:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-string v1, "sim_operator"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->sim_operator:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    const-string v1, "brand"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->device_brand:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    sget-boolean v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->nativeInited:Z

    if-nez v1, :cond_0

    .line 153
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getInstance()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getGPUModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;

    move-result-object v1

    .line 154
    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->getGPUSubModel()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;

    move-result-object v2

    .line 155
    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$GPUModelInfo;->getGPUModelNumber()I

    move-result v1

    .line 156
    invoke-virtual {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector$ENvGpuSubModel;->name()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->gpu:Ljava/lang/String;

    .line 157
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->gpu_ver:Ljava/lang/String;

    .line 158
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getInstance()Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/GPUModelDetector;->getGLVersion()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->opengl_version:Ljava/lang/String;

    .line 159
    const-string v1, "2.0.4.23_20181129172937_31536f2a4"

    sput-object v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->ve_version:Ljava/lang/String;

    .line 160
    const/4 v1, 0x1

    sput-boolean v1, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->nativeInited:Z

    .line 162
    :cond_0
    const-string v1, "gpu"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->gpu:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    const-string v1, "gpu_ver"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->gpu_ver:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    const-string v1, "opengl_version"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->opengl_version:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string v1, "ve_version"

    sget-object v2, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->ve_version:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    return-object v0
.end method
