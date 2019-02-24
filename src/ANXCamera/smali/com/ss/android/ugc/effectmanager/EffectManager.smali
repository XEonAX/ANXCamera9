.class public Lcom/ss/android/ugc/effectmanager/EffectManager;
.super Ljava/lang/Object;
.source "EffectManager.java"


# static fields
.field private static final SDK_TAG:Ljava/lang/String; = "EffectManager"


# instance fields
.field mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

.field mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

.field mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

.field mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

.field mInited:Z

.field mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

.field mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    return-void
.end method

.method static synthetic access$000(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getNeedDownloadEffectList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->divideEffectList(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Ljava/util/List;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/ss/android/ugc/effectmanager/EffectManager;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager;->downloadEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    return-void
.end method

.method private checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    .line 126
    nop

    .line 129
    if-nez p1, :cond_0

    .line 130
    const-string p1, "EffectManager"

    const-string v0, "Not set configuration"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    goto/16 :goto_2

    .line 133
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 134
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 139
    :cond_1
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    .line 140
    const-string p1, "EffectManager"

    const-string v0, "Not set net context"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    goto :goto_2

    .line 144
    :cond_2
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object v0

    if-nez v0, :cond_3

    .line 145
    const-string p1, "EffectManager"

    const-string v0, "Not set json convert"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    goto :goto_2

    .line 149
    :cond_3
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v0

    if-nez v0, :cond_4

    .line 150
    const-string p1, "EffectManager"

    const-string v0, "Not set net worker"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    goto :goto_2

    .line 154
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

    .line 159
    :cond_5
    const/4 p1, 0x1

    goto :goto_3

    .line 155
    :cond_6
    :goto_0
    const-string p1, "EffectManager"

    const-string v0, "Cache directory error"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    goto :goto_2

    .line 135
    :cond_7
    :goto_1
    const-string p1, "EffectManager"

    const-string v0, "Not set host !!!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    nop

    .line 162
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

    .line 576
    invoke-virtual {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setAllCategoryEffects(Ljava/util/List;)V

    .line 577
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

    .line 579
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 580
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

    .line 581
    invoke-interface {p2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 582
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 584
    :cond_0
    goto :goto_1

    .line 585
    :cond_1
    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTotalEffects(Ljava/util/List;)V

    .line 586
    goto :goto_0

    .line 587
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

    .line 549
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 555
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 556
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 557
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectList(Ljava/util/List;Ljava/lang/String;)V

    .line 558
    return-void

    .line 550
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 551
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 553
    :cond_2
    return-void
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

    .line 561
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 562
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentDownloadingEffectList()Ljava/util/List;

    move-result-object v1

    .line 563
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 564
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 565
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 567
    :cond_0
    goto :goto_0

    .line 568
    :cond_1
    return-object v0
.end method

.method private initCache()V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    if-nez v0, :cond_0

    .line 79
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/cache/FileCache;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 80
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setCache(Lcom/ss/android/ugc/effectmanager/common/listener/ICache;)V

    goto :goto_0

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 84
    :goto_0
    return-void
.end method

.method private initRepository()V
    .locals 2

    .line 166
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    .line 167
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    .line 168
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    .line 169
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    .line 171
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$1;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$1;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->setOnEffectListListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;)V

    .line 177
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    new-instance v1, Lcom/ss/android/ugc/effectmanager/EffectManager$2;

    invoke-direct {v1, p0}, Lcom/ss/android/ugc/effectmanager/EffectManager$2;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->setListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;)V

    .line 188
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    .line 189
    return-void
.end method

.method private initTaskManager()V
    .locals 5

    .line 64
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;-><init>()V

    .line 65
    new-instance v1, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    invoke-direct {v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;-><init>()V

    new-instance v2, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;

    const-string v3, "EffectManager"

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/ss/android/ugc/effectmanager/common/SimpleThreadFactory;-><init>(Ljava/lang/String;Z)V

    .line 66
    invoke-static {v2}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setExecutor(Ljava/util/concurrent/ExecutorService;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 67
    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;->setEffectContext(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;

    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->init(Lcom/ss/android/ugc/effectmanager/common/TaskManager$TaskManagerConfig;)V

    .line 69
    new-instance v1, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-direct {v1, v2}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;-><init>(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    .line 70
    invoke-virtual {v1, v4}, Lcom/ss/android/ugc/effectmanager/network/interceptor/LinkSelectorInterceptor;->enable(Z)V

    .line 71
    const-string v2, "LINK_SELECTOR"

    invoke-virtual {v0, v2, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->addInterception(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/network/interceptor/BaseInterceptor;)V

    .line 72
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setTaskManager(Lcom/ss/android/ugc/effectmanager/common/TaskManager;)V

    .line 74
    return-void
.end method

.method private linkSelectorStart()V
    .locals 1

    .line 632
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->startOptHosts()V

    .line 633
    return-void
.end method

.method private needLinkSelector(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 3

    .line 117
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 118
    return v0

    .line 120
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getLinkSelectorConfiguration()Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;

    move-result-object p1

    .line 121
    const/4 v1, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->getOriginHosts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v1, :cond_1

    .line 122
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/configuration/LinkSelectorConfiguration;->isNetworkChangeMonitor()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 121
    move v0, v1

    goto :goto_0

    .line 122
    :cond_1
    nop

    .line 121
    :goto_0
    return v0
.end method


# virtual methods
.method public checkedEffectListUpdate(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V
    .locals 2

    .line 516
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 522
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 523
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setCheckChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V

    .line 524
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->checkUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    return-void

    .line 517
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 518
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;->checkChannelFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 520
    :cond_2
    return-void
.end method

.method public clearCache(Ljava/lang/String;)V
    .locals 3

    .line 494
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 495
    return-void
.end method

.method public clearEffects()V
    .locals 1

    .line 487
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->clear()V

    .line 488
    return-void
.end method

.method public deleteEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 2

    .line 474
    if-nez p1, :cond_0

    .line 475
    return-void

    .line 477
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->remove(Ljava/lang/String;)Z

    .line 478
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

    .line 479
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 531
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    if-eqz v0, :cond_1

    .line 532
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    .line 533
    return-void

    .line 535
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->destroy()V

    .line 536
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->destroy()V

    .line 537
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->destroy()V

    .line 538
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    .line 540
    :cond_1
    return-void
.end method

.method public fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    .line 306
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 312
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 313
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    .line 314
    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->isEffectDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 315
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Ljava/lang/String;)V

    .line 316
    :cond_1
    return-void

    .line 307
    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 308
    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 310
    :cond_3
    return-void
.end method

.method public fetchEffect(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 3

    .line 326
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_1

    .line 327
    if-eqz p2, :cond_0

    .line 328
    const/4 p1, 0x0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 330
    :cond_0
    return-void

    .line 332
    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$4;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$4;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V

    .line 347
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 348
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 349
    invoke-virtual {p0, p2, v0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->fetchEffectList(Ljava/util/List;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 350
    return-void
.end method

.method public fetchEffectList(Ljava/lang/String;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 207
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$3;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$3;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 246
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 247
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 248
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const/4 v0, 0x0

    if-nez p3, :cond_1

    .line 249
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p3, p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 251
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p3, "default"

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 253
    :goto_0
    return-void

    .line 202
    :cond_2
    :goto_1
    if-eqz p3, :cond_3

    .line 203
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 205
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

    .line 427
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 434
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$7;

    invoke-direct {v0, p0, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$7;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 445
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p3

    .line 446
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p3, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 447
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p3, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;I)V

    .line 448
    return-void

    .line 428
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 429
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 431
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

    .line 360
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 367
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$5;

    invoke-direct {v0, p0, p2}, Lcom/ss/android/ugc/effectmanager/EffectManager$5;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 378
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 379
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 381
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    .line 382
    return-void

    .line 361
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 362
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 364
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

    .line 393
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 400
    :cond_0
    new-instance v0, Lcom/ss/android/ugc/effectmanager/EffectManager$6;

    invoke-direct {v0, p0, p2, p3}, Lcom/ss/android/ugc/effectmanager/EffectManager$6;-><init>(Lcom/ss/android/ugc/effectmanager/EffectManager;ZLcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 415
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object p2

    .line 416
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p3

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p2, v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V

    .line 418
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;

    invoke-virtual {p3, p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V

    .line 419
    return-void

    .line 394
    :cond_1
    :goto_0
    if-eqz p3, :cond_2

    .line 395
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string v0, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p3, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 397
    :cond_2
    return-void
.end method

.method public fetchEffectListFromCache(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 268
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 270
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v1, 0x1

    if-nez p2, :cond_1

    .line 271
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 273
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchList(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 275
    :goto_0
    return-void

    .line 263
    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 264
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 266
    :cond_3
    return-void
.end method

.method public fetchExistEffectList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    if-nez v0, :cond_0

    goto :goto_1

    .line 290
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 291
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V

    .line 292
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 293
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 295
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectChannelRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;

    const-string p2, "default"

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    :goto_0
    return-void

    .line 285
    :cond_2
    :goto_1
    if-eqz p2, :cond_3

    .line 286
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 288
    :cond_3
    return-void
.end method

.method public fetchFavoriteList(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V
    .locals 2

    .line 707
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 713
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 714
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setFetchFavoriteListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V

    .line 715
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->fetchFavoriteList(Ljava/lang/String;Ljava/lang/String;)V

    .line 716
    return-void

    .line 708
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 709
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p2, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;->onFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 711
    :cond_2
    return-void
.end method

.method public getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 1

    .line 503
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    if-nez v0, :cond_0

    .line 504
    const/4 v0, 0x0

    return-object v0

    .line 506
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectStore:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    return-object v0
.end method

.method getCurrentTaskID()Ljava/lang/String;
    .locals 1

    .line 594
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    .line 595
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z
    .locals 1

    .line 96
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->needLinkSelector(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-static {}, Lcom/ss/android/ugc/effectmanager/common/Preconditions;->checkUiThread()V

    .line 99
    :cond_0
    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/EffectManager;->checkConfiguration(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 100
    const/4 p1, 0x0

    return p1

    .line 103
    :cond_1
    new-instance v0, Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-direct {v0, p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;-><init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 104
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    .line 105
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initTaskManager()V

    .line 106
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initRepository()V

    .line 107
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->initCache()V

    .line 108
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->setLinkSelector(Lcom/ss/android/ugc/effectmanager/link/LinkSelector;)V

    .line 109
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mInited:Z

    .line 110
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->isLazy()Z

    move-result v0

    if-nez v0, :cond_2

    .line 111
    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->linkSelectorStart()V

    .line 113
    :cond_2
    return p1
.end method

.method public isEffectDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    .line 456
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

    .line 465
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

    .line 620
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_0

    .line 621
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;->onTagNeedNotUpdate()V

    .line 622
    return-void

    .line 624
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 625
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->isTagUpdated(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IIsTagNeedUpdatedListener;)V

    .line 626
    return-void
.end method

.method public modifyFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 2

    .line 685
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 691
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 692
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    .line 693
    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 694
    return-void

    .line 686
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 687
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 689
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

    .line 662
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    if-nez v0, :cond_0

    goto :goto_0

    .line 668
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 669
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {v1, v0, p4}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V

    .line 670
    iget-object p4, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mFavoriteRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;

    invoke-virtual {p4, p1, p2, p3, v0}, Lcom/ss/android/ugc/effectmanager/effect/repository/FavoriteRepository;->modFavoriteList(Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 671
    return-void

    .line 663
    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    .line 664
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    new-instance p2, Ljava/lang/IllegalStateException;

    const-string p3, "\u8bf7\u5148\u521d\u59cb\u5316"

    invoke-direct {p2, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p4, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 666
    :cond_2
    return-void
.end method

.method public removeListener()V
    .locals 1

    .line 730
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    if-nez v0, :cond_0

    .line 731
    return-void

    .line 733
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->destroy()V

    .line 734
    return-void
.end method

.method public updateDeviceId(Ljava/lang/String;)V
    .locals 1

    .line 723
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->setDeviceId(Ljava/lang/String;)V

    .line 724
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

    .line 643
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    if-eqz v0, :cond_0

    .line 644
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mLinkSelector:Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->updateHosts(Ljava/util/List;Z)V

    .line 646
    :cond_0
    return-void
.end method

.method public updateTag(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V
    .locals 2

    .line 602
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    if-nez v0, :cond_1

    .line 603
    if-eqz p3, :cond_0

    .line 604
    invoke-interface {p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;->onFinally()V

    .line 606
    :cond_0
    return-void

    .line 608
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/EffectManager;->getCurrentTaskID()Ljava/lang/String;

    move-result-object v0

    .line 609
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/EffectManager;->mUpdateTagRepository:Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/ss/android/ugc/effectmanager/effect/repository/UpdateTagRepository;->updateTag(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IUpdateTagListener;)V

    .line 610
    return-void
.end method
