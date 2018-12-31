.class public Lcom/ss/android/ugc/effectmanager/EffectManager;
.super Ljava/lang/Object;
.source "EffectManager.java"


# static fields
.field private static final SDK_TAG:Ljava/lang/String; = "EffectManager"


# instance fields
.field private mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

.field private mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

.field private mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

.field private mInited:Z

.field private mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

.field private mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;)Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/EffectManager;)Lcom/ss/android/ugc/effectmanager/common/listener/ICache;
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getNeedDownloadEffectList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->divideEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->downloadEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    return-void
.end method

.method private checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    .line 113
    nop

    .line 116
    if-nez p1, :cond_0

    .line 117
    const-string p1, "EffectManager"

    const-string v0, "Not set configuration"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    goto/16 :goto_2

    .line 120
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 121
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 126
    :cond_1
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    .line 127
    const-string p1, "EffectManager"

    const-string v0, "Not set net context"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    goto :goto_2

    .line 131
    :cond_2
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v0

    if-nez v0, :cond_3

    .line 132
    const-string p1, "EffectManager"

    const-string v0, "Not set json convert"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    goto :goto_2

    .line 136
    :cond_3
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v0

    if-nez v0, :cond_4

    .line 137
    const-string p1, "EffectManager"

    const-string v0, "Not set net worker"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    goto :goto_2

    .line 141
    :cond_4
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectDir()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    .line 146
    :cond_5
    const/4 p1, 0x1

    goto :goto_3

    .line 142
    :cond_6
    :goto_0
    const-string p1, "EffectManager"

    const-string v0, "Cache directory error"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    goto :goto_2

    .line 122
    :cond_7
    :goto_1
    const-string p1, "EffectManager"

    const-string v0, "Not set host !!!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    nop

    .line 149
    :goto_2
    const/4 p1, 0x0

    :goto_3
    return p1
.end method

.method private divideEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;"
        }
    .end annotation

    .line 563
    invoke-virtual {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setAllCategoryEffects(Ljava/util/List;)V

    .line 564
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->getCategoryResponseList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;

    .line 566
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 567
    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->getTotalEffects()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 568
    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 569
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 571
    :cond_0
    goto :goto_1

    .line 572
    :cond_1
    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTotalEffects(Ljava/util/List;)V

    .line 573
    goto :goto_0

    .line 574
    :cond_2
    return-object p1
.end method

.method private downloadEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    .line 536
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 542
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 543
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 544
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectList(Ljava/util/List;Ljava/lang/String;)V

    .line 545
    return-void

    .line 537
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 538
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 540
    :cond_2
    return-void
.end method

.method private getCurrentTaskID()Ljava/lang/String;
    .locals 1

    .line 581
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    .line 582
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getNeedDownloadEffectList(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 548
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 549
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentDownloadingEffectList()Ljava/util/List;

    move-result-object v1

    .line 550
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 551
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 552
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 554
    :cond_0
    goto :goto_0

    .line 555
    :cond_1
    return-object v0
.end method

.method private initCache()V
    .locals 2

    .line 76
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 78
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setCache(Lcom/ss/android/ugc/effectmanager/common/listener/ICache;)V

    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 82
    :goto_0
    return-void
.end method

.method private initRepository()V
    .locals 2

    .line 153
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    .line 154
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    .line 155
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    .line 156
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    .line 158
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$1;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$1;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->setOnEffectListListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;)V

    .line 164
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$2;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$2;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->setListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;)V

    .line 175
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    .line 176
    return-void
.end method

.method private initTaskManager()V
    .locals 5

    .line 62
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;-><init>()V

    .line 63
    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    invoke-direct {v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;-><init>()V

    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;

    const-string v3, "EffectManager"

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;-><init>(Ljava/lang/String;Z)V

    .line 64
    invoke-static {v2}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 65
    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setEffectContext(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->init(Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;)V

    .line 67
    new-instance v1, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {v1, v2}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;-><init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    .line 68
    invoke-virtual {v1, v4}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;->enable(Z)V

    .line 69
    const-string v2, "LINK_SELECTOR"

    invoke-virtual {v0, v2, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->addInterception(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;)V

    .line 70
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setTaskManager(Lcom/ss/android/ugc/effectmanager/common/TaskManager;)V

    .line 72
    return-void
.end method

.method private linkSelectorStart()V
    .locals 1

    .line 619
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->startOptHosts()V

    .line 620
    return-void
.end method


# virtual methods
.method public checkedEffectListUpdate(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V
    .locals 2

    .line 503
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 509
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 510
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setCheckChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V

    .line 511
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->checkUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    return-void

    .line 504
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 505
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;->checkChannelFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 507
    :cond_2
    return-void
.end method

.method public clearCache(Ljava/lang/String;)V
    .locals 3

    .line 481
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 482
    return-void
.end method

.method public clearEffects()V
    .locals 1

    .line 474
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->clear()V

    .line 475
    return-void
.end method

.method public deleteEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 2

    .line 461
    if-nez p1, :cond_0

    .line 462
    return-void

    .line 464
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 465
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 466
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 518
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    if-eqz v0, :cond_1

    .line 519
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    .line 520
    return-void

    .line 522
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->destroy()V

    .line 523
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->destroy()V

    .line 524
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->destory()V

    .line 525
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    .line 527
    :cond_1
    return-void
.end method

.method public fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    .line 293
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 299
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 300
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    .line 301
    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->isEffectDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 302
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Ljava/lang/String;)V

    .line 303
    :cond_1
    return-void

    .line 294
    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 295
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 297
    :cond_3
    return-void
.end method

.method public fetchEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    .line 313
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    .line 314
    if-eqz p2, :cond_0

    .line 315
    const/4 p1, 0x0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 317
    :cond_0
    return-void

    .line 319
    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$4;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$4;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    .line 334
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 335
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    invoke-virtual {p0, p2, v0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 337
    return-void
.end method

.method public fetchEffectList(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 194
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$3;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 233
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 234
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 235
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 v0, 0x0

    if-nez p3, :cond_1

    .line 236
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p3, p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 238
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p3, "default"

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 240
    :goto_0
    return-void

    .line 189
    :cond_2
    :goto_1
    if-eqz p3, :cond_3

    .line 190
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 192
    :cond_3
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;ILcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    .line 414
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 421
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;

    invoke-direct {v0, p0, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$7;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 432
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p3

    .line 433
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p3, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 434
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p3, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;I)V

    .line 435
    return-void

    .line 415
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 416
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 418
    :cond_2
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    .line 347
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 354
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$5;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$5;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 365
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 366
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 368
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    .line 369
    return-void

    .line 348
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 349
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 351
    :cond_2
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ")V"
        }
    .end annotation

    .line 380
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 387
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$6;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 402
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 403
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 405
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p3, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    .line 406
    return-void

    .line 381
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 382
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 384
    :cond_2
    return-void
.end method

.method public fetchEffectListFromCache(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    .line 249
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 255
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 256
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 257
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v1, 0x1

    if-nez p2, :cond_1

    .line 258
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 260
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 262
    :goto_0
    return-void

    .line 250
    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 251
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 253
    :cond_3
    return-void
.end method

.method public fetchExistEffectList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    .line 271
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 277
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 278
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 279
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 280
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 282
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    :goto_0
    return-void

    .line 272
    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 273
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 275
    :cond_3
    return-void
.end method

.method public fetchFavoriteList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V
    .locals 2

    .line 694
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 700
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 701
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchFavoriteListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V

    .line 702
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->fetchFavoriteList(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    return-void

    .line 695
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 696
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;->onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 698
    :cond_2
    return-void
.end method

.method public getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 1

    .line 490
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-nez v0, :cond_0

    .line 491
    const/4 v0, 0x0

    return-object v0

    .line 493
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    return-object v0
.end method

.method public init(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    .line 95
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    const/4 p1, 0x0

    return p1

    .line 99
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 100
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    .line 101
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initTaskManager()V

    .line 102
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initRepository()V

    .line 103
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initCache()V

    .line 104
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->setLinkSelector(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    .line 105
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    .line 106
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLazy()Z

    move-result v0

    if-nez v0, :cond_1

    .line 107
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->linkSelectorStart()V

    .line 109
    :cond_1
    return p1
.end method

.method public isEffectDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    .line 443
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isEffectValid(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->isDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isEffectDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    .line 452
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->isEffectValid(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->isDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isTagUpdated(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V
    .locals 2

    .line 607
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_0

    .line 608
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedNotUpdate()V

    .line 609
    return-void

    .line 611
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 612
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->isTagUpdated(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    .line 613
    return-void
.end method

.method public modifyFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 2

    .line 672
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 678
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 679
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    .line 680
    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 681
    return-void

    .line 673
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 674
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 676
    :cond_2
    return-void
.end method

.method public modifyFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;",
            ")V"
        }
    .end annotation

    .line 649
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 655
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 656
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    .line 657
    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 658
    return-void

    .line 650
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 651
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 653
    :cond_2
    return-void
.end method

.method public updateDeviceId(Ljava/lang/String;)V
    .locals 1

    .line 710
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setDeviceId(Ljava/lang/String;)V

    .line 711
    return-void
.end method

.method public updateHosts(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/link/model/host/Host;",
            ">;Z)V"
        }
    .end annotation

    .line 630
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    if-eqz v0, :cond_0

    .line 631
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateHosts(Ljava/util/List;Z)V

    .line 633
    :cond_0
    return-void
.end method

.method public updateTag(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 2

    .line 589
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_1

    .line 590
    if-eqz p3, :cond_0

    .line 591
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    .line 593
    :cond_0
    return-void

    .line 595
    :cond_1
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 596
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->updateTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    .line 597
    return-void
.end method
