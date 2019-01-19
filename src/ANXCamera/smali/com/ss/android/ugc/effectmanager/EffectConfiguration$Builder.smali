.class public final Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
.super Ljava/lang/Object;
.source "EffectConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ugc/effectmanager/EffectConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private accessKey:Ljava/lang/String;

.field private appVersion:Ljava/lang/String;

.field private cache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private channel:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private deviceType:Ljava/lang/String;

.field private effectDir:Ljava/io/File;

.field private effectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

.field private jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

.field private platform:Ljava/lang/String;

.field private region:Ljava/lang/String;

.field private retryCount:I

.field private sdkVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    const/4 v0, 0x3

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->retryCount:I

    .line 188
    new-instance v0, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    .line 189
    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->accessKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->sdkVersion:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/ICache;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->cache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)I
    .locals 0

    .line 169
    iget p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->retryCount:I

    return p0
.end method

.method static synthetic access$1200(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->appVersion:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->deviceId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->channel:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->platform:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->deviceType:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/io/File;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectDir:Ljava/io/File;

    return-object p0
.end method

.method static synthetic access$800(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    return-object p0
.end method

.method static synthetic access$900(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;)Ljava/lang/String;
    .locals 0

    .line 169
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->region:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public JsonConverter(Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 251
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->jsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 252
    return-object p0
.end method

.method public accessKey(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->accessKey:Ljava/lang/String;

    .line 193
    return-object p0
.end method

.method public appVersion(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->appVersion:Ljava/lang/String;

    .line 203
    return-object p0
.end method

.method public build()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;
    .locals 2

    .line 300
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;Lcom/ss/android/ugc/effectmanager/EffectConfiguration$1;)V

    return-object v0
.end method

.method public cache(Lcom/ss/android/ugc/effectmanager/common/listener/ICache;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 256
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->cache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 257
    return-object p0
.end method

.method public channel(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 212
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->channel:Ljava/lang/String;

    .line 213
    return-object p0
.end method

.method public context(Landroid/content/Context;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 273
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setContext(Landroid/content/Context;)V

    .line 274
    return-object p0
.end method

.method public deviceId(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->deviceId:Ljava/lang/String;

    .line 208
    return-object p0
.end method

.method public deviceType(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 222
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->deviceType:Ljava/lang/String;

    .line 223
    return-object p0
.end method

.method public effectDir(Ljava/io/File;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 227
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectDir:Ljava/io/File;

    .line 228
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectDir:Ljava/io/File;

    if-nez p1, :cond_0

    return-object p0

    .line 229
    :cond_0
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectDir:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_1

    .line 230
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectDir:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 232
    :cond_1
    return-object p0
.end method

.method public effectNetWorker(Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 246
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->effectNetWorker:Lcom/ss/android/ugc/effectmanager/common/listener/IEffectNetWorker;

    .line 247
    return-object p0
.end method

.method public hosts(Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;)",
            "Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;"
        }
    .end annotation

    .line 289
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setOriginHosts(Ljava/util/List;)V

    .line 290
    return-object p0
.end method

.method public lazy(Z)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setLazy(Z)V

    .line 295
    return-object p0
.end method

.method public netWorkChangeMonitor(Z)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 268
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setNetworkChangeMonitor(Z)V

    .line 269
    return-object p0
.end method

.method public platform(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 217
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->platform:Ljava/lang/String;

    .line 218
    return-object p0
.end method

.method public region(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 236
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->region:Ljava/lang/String;

    .line 237
    return-object p0
.end method

.method public repeatTime(I)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 283
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setRepeatTime(I)V

    .line 284
    return-object p0
.end method

.method public retryCount(I)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 241
    iput p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->retryCount:I

    .line 242
    return-object p0
.end method

.method public sdkVersion(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 0

    .line 197
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->sdkVersion:Ljava/lang/String;

    .line 198
    return-object p0
.end method

.method public speedApi(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setSpeedApi(Ljava/lang/String;)V

    .line 264
    return-object p0
.end method

.method public speedTimeOut(I)Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectConfiguration$Builder;->mLinkSelectorConfiguration:Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->setSpeedTimeOut(I)V

    .line 279
    return-object p0
.end method
