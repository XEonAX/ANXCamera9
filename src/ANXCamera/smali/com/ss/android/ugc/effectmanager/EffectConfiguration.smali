.class public Lcom/ss/android/ugc/effectmanager/EffectConfiguration;
.super Ljava/lang/Object;
.source "EffectConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    }
.end annotation


# static fields
.field private static final API_ADDRESS:Ljava/lang/String; = "/effect/api"

.field public static final KEY_ACCESS_KEY:Ljava/lang/String; = "access_key"

.field public static final KEY_APP_ID:Ljava/lang/String; = "aid"

.field public static final KEY_APP_LANGUAGE:Ljava/lang/String; = "app_language"

.field public static final KEY_APP_VERSION:Ljava/lang/String; = "app_version"

.field public static final KEY_CHANNEL:Ljava/lang/String; = "channel"

.field public static final KEY_DEVICE_ID:Ljava/lang/String; = "device_id"

.field public static final KEY_DEVICE_PLATFORM:Ljava/lang/String; = "device_platform"

.field public static final KEY_DEVICE_TYPE:Ljava/lang/String; = "device_type"

.field public static final KEY_EFFECT_IDS:Ljava/lang/String; = "effect_ids"

.field public static final KEY_PANEL:Ljava/lang/String; = "panel"

.field public static final KEY_REGION:Ljava/lang/String; = "region"

.field public static final KEY_SDK_VERSION:Ljava/lang/String; = "sdk_version"

.field public static final KEY_SYS_LANGUAGE:Ljava/lang/String; = "language"

.field public static final KEY_TYPE:Ljava/lang/String; = "type"

.field public static final KEY_VERSION:Ljava/lang/String; = "version"


# instance fields
.field private jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private listenerManger:Lcom/ss/android/ugc/effectmanager/ListenerManger;

.field private mAccessKey:Ljava/lang/String;

.field private mApiAddress:Ljava/lang/String;

.field private mAppID:Ljava/lang/String;

.field private mAppLanguage:Ljava/lang/String;

.field private mAppVersion:Ljava/lang/String;

.field private mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mChannel:Ljava/lang/String;

.field private mDeviceId:Ljava/lang/String;

.field private mDeviceType:Ljava/lang/String;

.field private mEffectDir:Ljava/io/File;

.field private mEffectNetWorker:Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

.field private mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

.field private mPlatform:Ljava/lang/String;

.field private mRegion:Ljava/lang/String;

.field private mRetryCount:I

.field private mSdkVersion:Ljava/lang/String;

.field private mSysLanguage:Ljava/lang/String;

.field private mTaskManager:Lcom/ss/android/ugc/effectmanager/common/TaskManager;


# direct methods
.method private constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-string v0, "default"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mChannel:Ljava/lang/String;

    .line 56
    const/4 v0, 0x3

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mRetryCount:I

    .line 69
    const-string v0, "/effect/api"

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mApiAddress:Ljava/lang/String;

    .line 70
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$000(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAccessKey:Ljava/lang/String;

    .line 71
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$100(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mSdkVersion:Ljava/lang/String;

    .line 72
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$200(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppVersion:Ljava/lang/String;

    .line 73
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$300(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mDeviceId:Ljava/lang/String;

    .line 74
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$400(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mChannel:Ljava/lang/String;

    .line 75
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$500(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mPlatform:Ljava/lang/String;

    .line 76
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$600(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mDeviceType:Ljava/lang/String;

    .line 77
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$700(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectDir:Ljava/io/File;

    .line 78
    new-instance v0, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$800(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;-><init>(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectNetWorker:Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    .line 79
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$900(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mRegion:Ljava/lang/String;

    .line 80
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1000(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 81
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1100(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)I

    move-result v0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mRetryCount:I

    .line 82
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1200(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 83
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1300(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppID:Ljava/lang/String;

    .line 84
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1400(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppLanguage:Ljava/lang/String;

    .line 85
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1500(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mSysLanguage:Ljava/lang/String;

    .line 86
    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->access$1600(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    .line 87
    new-instance p1, Lcom/ss/android/ugc/effectmanager/ListenerManger;

    invoke-direct {p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;-><init>()V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->listenerManger:Lcom/ss/android/ugc/effectmanager/ListenerManger;

    .line 89
    return-void
.end method

.method synthetic constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;Lcom/ss/android/ugc/effectmanager/EffectConfiguration$1;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)V

    return-void
.end method


# virtual methods
.method public getAccessKey()Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAccessKey:Ljava/lang/String;

    return-object v0
.end method

.method public getApiAdress()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mApiAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getAppID()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppID:Ljava/lang/String;

    return-object v0
.end method

.method public getAppLanguage()Ljava/lang/String;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mAppVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    return-object v0
.end method

.method public getChannel()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mChannel:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mDeviceType:Ljava/lang/String;

    return-object v0
.end method

.method public getEffectDir()Ljava/io/File;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectDir:Ljava/io/File;

    return-object v0
.end method

.method public getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectNetWorker:Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    return-object v0
.end method

.method public getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    return-object v0
.end method

.method public getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    return-object v0
.end method

.method public getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->listenerManger:Lcom/ss/android/ugc/effectmanager/ListenerManger;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mPlatform:Ljava/lang/String;

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mRegion:Ljava/lang/String;

    return-object v0
.end method

.method public getRetryCount()I
    .locals 1

    .line 129
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mRetryCount:I

    return v0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mSdkVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getSysLanguage()Ljava/lang/String;
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mSysLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mTaskManager:Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    return-object v0
.end method

.method public setCache(Lcom/ss/android/ugc/effectmanager/common/listener/ICache;)V
    .locals 0

    .line 185
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 186
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0

    .line 173
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mDeviceId:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public setEffectDir(Ljava/io/File;)V
    .locals 0

    .line 189
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectDir:Ljava/io/File;

    .line 190
    return-void
.end method

.method public setEffectNetWorker(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mEffectNetWorker:Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->setIEffectNetWorker(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)V

    .line 170
    return-void
.end method

.method public setTaskManager(Lcom/ss/android/ugc/effectmanager/common/TaskManager;)V
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->mTaskManager:Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    .line 182
    return-void
.end method
