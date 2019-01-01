.class public Lmiui/hardware/display/DisplayFeatureManager;
.super Ljava/lang/Object;
.source "DisplayFeatureManager.java"


# static fields
.field private static final CONFIG_SERVICENAME_RESOURCEID:I

.field public static final DEFALUT_GAMUT_MODE:I = 0x0

.field public static final DEFALUT_SCREEN_COLOR:I = 0x2

.field private static final DISPLAY_FEATURE_SERVICE:Ljava/lang/String; = "DisplayFeatureControl"

.field public static final EXT_COLOR_PROC_STATE:I = 0xf

.field private static final HIDL_SERVICENAME_DEFAULT:Ljava/lang/String; = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

.field public static final PROPERTY_ASSERTIVE_DISPLAY:Ljava/lang/String; = "persist.sys.ltm_enable"

.field public static final PROPERTY_GAMUT_MODE:Ljava/lang/String; = "persist.sys.gamut_mode"

.field public static final PROPERTY_SCREEN_COLOR:Ljava/lang/String; = "persist.sys.display_prefer"

.field public static final PROPERTY_SCREEN_SATURATION:Ljava/lang/String; = "persist.sys.display_ce"

.field public static final SCREEN_ADAPT:I = 0x0

.field public static final SCREEN_ENHANCE:I = 0x1

.field public static final SCREEN_EYECARE:I = 0x3

.field public static final SCREEN_HIGHLIGHT:I = 0xb

.field public static final SCREEN_MONOCHROME:I = 0x4

.field public static final SCREEN_NIGHTLIGHT:I = 0x9

.field public static final SCREEN_STANDARD:I = 0x2

.field public static final SCREEN_SUNLIGHT:I = 0x8

.field private static final SUPPORT_SET_FEATURE:Z

.field private static TAG:Ljava/lang/String;

.field private static volatile sInstance:Lmiui/hardware/display/DisplayFeatureManager;


# instance fields
.field private mBinderDeathHandler:Landroid/os/IBinder$DeathRecipient;

.field private mHwBinderDeathHandler:Landroid/os/IHwBinder$DeathRecipient;

.field private mLock:Ljava/lang/Object;

.field private mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 20
    const-string v0, "DisplayFeatureManager"

    sput-object v0, Lmiui/hardware/display/DisplayFeatureManager;->TAG:Ljava/lang/String;

    .line 47
    const-string v0, "support_screen_effect"

    .line 48
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmiui/util/FeatureParser;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lmiui/hardware/display/DisplayFeatureManager;->SUPPORT_SET_FEATURE:Z

    .line 52
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "config_displayFeatureHidlServiceName"

    const-string v2, "string"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    sput v0, Lmiui/hardware/display/DisplayFeatureManager;->CONFIG_SERVICENAME_RESOURCEID:I

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mLock:Ljava/lang/Object;

    .line 73
    invoke-direct {p0}, Lmiui/hardware/display/DisplayFeatureManager;->initServiceDeathRecipient()V

    .line 74
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 75
    :try_start_0
    invoke-direct {p0}, Lmiui/hardware/display/DisplayFeatureManager;->initProxyLocked()V

    .line 76
    monitor-exit v0

    .line 77
    return-void

    .line 76
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static synthetic access$000(Lmiui/hardware/display/DisplayFeatureManager;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lmiui/hardware/display/DisplayFeatureManager;

    .line 19
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 19
    sget-object v0, Lmiui/hardware/display/DisplayFeatureManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lmiui/hardware/display/DisplayFeatureManager;Lmiui/hardware/display/DisplayFeatureServiceProxy;)Lmiui/hardware/display/DisplayFeatureServiceProxy;
    .locals 0
    .param p0, "x0"    # Lmiui/hardware/display/DisplayFeatureManager;
    .param p1, "x1"    # Lmiui/hardware/display/DisplayFeatureServiceProxy;

    .line 19
    iput-object p1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;

    return-object p1
.end method

.method public static getInstance()Lmiui/hardware/display/DisplayFeatureManager;
    .locals 2

    .line 62
    sget-object v0, Lmiui/hardware/display/DisplayFeatureManager;->sInstance:Lmiui/hardware/display/DisplayFeatureManager;

    if-nez v0, :cond_1

    .line 63
    const-class v0, Lmiui/hardware/display/DisplayFeatureManager;

    monitor-enter v0

    .line 64
    :try_start_0
    sget-object v1, Lmiui/hardware/display/DisplayFeatureManager;->sInstance:Lmiui/hardware/display/DisplayFeatureManager;

    if-nez v1, :cond_0

    .line 65
    new-instance v1, Lmiui/hardware/display/DisplayFeatureManager;

    invoke-direct {v1}, Lmiui/hardware/display/DisplayFeatureManager;-><init>()V

    sput-object v1, Lmiui/hardware/display/DisplayFeatureManager;->sInstance:Lmiui/hardware/display/DisplayFeatureManager;

    .line 67
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 69
    :cond_1
    :goto_0
    sget-object v0, Lmiui/hardware/display/DisplayFeatureManager;->sInstance:Lmiui/hardware/display/DisplayFeatureManager;

    return-object v0
.end method

.method private initProxyLocked()V
    .locals 5

    .line 93
    :try_start_0
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    if-eqz v0, :cond_2

    .line 95
    sget v0, Lmiui/hardware/display/DisplayFeatureManager;->CONFIG_SERVICENAME_RESOURCEID:I

    if-nez v0, :cond_0

    .line 96
    const-string v0, "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature"

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lmiui/hardware/display/DisplayFeatureManager;->CONFIG_SERVICENAME_RESOURCEID:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "hidlServiceName":Ljava/lang/String;
    :goto_0
    sget-object v1, Lmiui/hardware/display/DisplayFeatureManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initProxyLoced CONFIG_SERVICENAME_RESOURCEID = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lmiui/hardware/display/DisplayFeatureManager;->CONFIG_SERVICENAME_RESOURCEID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " hidlServiceName = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    const-string v1, "default"

    invoke-static {v0, v1}, Landroid/os/HwBinder;->getService(Ljava/lang/String;Ljava/lang/String;)Landroid/os/IHwBinder;

    move-result-object v1

    .line 100
    .local v1, "hb":Landroid/os/IHwBinder;
    if-eqz v1, :cond_1

    .line 101
    iget-object v2, p0, Lmiui/hardware/display/DisplayFeatureManager;->mHwBinderDeathHandler:Landroid/os/IHwBinder$DeathRecipient;

    const-wide/16 v3, 0x2711

    invoke-interface {v1, v2, v3, v4}, Landroid/os/IHwBinder;->linkToDeath(Landroid/os/IHwBinder$DeathRecipient;J)Z

    .line 102
    new-instance v2, Lmiui/hardware/display/DisplayFeatureServiceProxy;

    invoke-direct {v2, v1}, Lmiui/hardware/display/DisplayFeatureServiceProxy;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;

    .line 105
    .end local v0    # "hidlServiceName":Ljava/lang/String;
    .end local v1    # "hb":Landroid/os/IHwBinder;
    :cond_1
    goto :goto_1

    .line 106
    :cond_2
    const-string v0, "DisplayFeatureControl"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 107
    .local v0, "b":Landroid/os/IBinder;
    if-eqz v0, :cond_3

    .line 108
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mBinderDeathHandler:Landroid/os/IBinder$DeathRecipient;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 109
    new-instance v1, Lmiui/hardware/display/DisplayFeatureServiceProxy;

    invoke-direct {v1, v0}, Lmiui/hardware/display/DisplayFeatureServiceProxy;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .end local v0    # "b":Landroid/os/IBinder;
    :cond_3
    :goto_1
    goto :goto_2

    .line 112
    :catch_0
    move-exception v0

    .line 115
    :goto_2
    return-void
.end method

.method private initServiceDeathRecipient()V
    .locals 1

    .line 118
    sget-boolean v0, Lmiui/os/DeviceFeature;->SUPPORT_DISPLAYFEATURE_HIDL:Z

    if-eqz v0, :cond_0

    .line 119
    new-instance v0, Lmiui/hardware/display/DisplayFeatureManager$1;

    invoke-direct {v0, p0}, Lmiui/hardware/display/DisplayFeatureManager$1;-><init>(Lmiui/hardware/display/DisplayFeatureManager;)V

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mHwBinderDeathHandler:Landroid/os/IHwBinder$DeathRecipient;

    goto :goto_0

    .line 129
    :cond_0
    new-instance v0, Lmiui/hardware/display/DisplayFeatureManager$2;

    invoke-direct {v0, p0}, Lmiui/hardware/display/DisplayFeatureManager$2;-><init>(Lmiui/hardware/display/DisplayFeatureManager;)V

    iput-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mBinderDeathHandler:Landroid/os/IBinder$DeathRecipient;

    .line 139
    :goto_0
    return-void
.end method


# virtual methods
.method public getColorPrefer()I
    .locals 2

    .line 144
    const-string v0, "persist.sys.display_prefer"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getScreenGamut()I
    .locals 2

    .line 155
    const-string v0, "persist.sys.gamut_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isAdEnable()Z
    .locals 2

    .line 149
    const-string v0, "persist.sys.ltm_enable"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setScreenEffect(II)V
    .locals 4
    .param p1, "mode"    # I
    .param p2, "value"    # I

    .line 80
    iget-object v0, p0, Lmiui/hardware/display/DisplayFeatureManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 81
    :try_start_0
    sget-object v1, Lmiui/hardware/display/DisplayFeatureManager;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setScreenEffect mode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " value="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;

    if-nez v1, :cond_0

    .line 83
    invoke-direct {p0}, Lmiui/hardware/display/DisplayFeatureManager;->initProxyLocked()V

    .line 85
    :cond_0
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;

    if-eqz v1, :cond_1

    .line 86
    iget-object v1, p0, Lmiui/hardware/display/DisplayFeatureManager;->mProxy:Lmiui/hardware/display/DisplayFeatureServiceProxy;

    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-virtual {v1, v2, p1, p2, v3}, Lmiui/hardware/display/DisplayFeatureServiceProxy;->setFeature(IIII)V

    .line 88
    :cond_1
    monitor-exit v0

    .line 89
    return-void

    .line 88
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
