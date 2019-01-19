.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "FetchEffectChannelCacheTask.java"


# instance fields
.field private mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private panel:Ljava/lang/String;

.field private whileDownload:Z


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Z)V
    .locals 1

    .line 42
    const-string v0, "NETWORK"

    invoke-direct {p0, p4, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    .line 44
    iput-boolean p5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->whileDownload:Z

    .line 45
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 46
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getCache()Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    .line 47
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 48
    return-void
.end method

.method private buildChannelResponse(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 7

    .line 72
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>()V

    .line 73
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setVersion(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setAllCategoryEffects(Ljava/util/List;)V

    .line 75
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getCategory()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;

    .line 78
    new-instance v4, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;

    invoke-direct {v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;-><init>()V

    .line 79
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->checkValued()Z

    .line 80
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setName(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setId(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    .line 83
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setIcon_normal_url(Ljava/lang/String;)V

    .line 85
    :cond_0
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon_selected()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 86
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getIcon_selected()Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryIconsModel;->getUrl_list()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setIcon_selected_url(Ljava/lang/String;)V

    .line 88
    :cond_1
    invoke-direct {p0, v3, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->getCategoryAllEffects(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTotalEffects(Ljava/util/List;)V

    .line 90
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getTagsUpdated()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTagsUpdateTime(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getTags()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setTags(Ljava/util/List;)V

    .line 92
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryResponse;->setKey(Ljava/lang/String;)V

    .line 93
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    goto/16 :goto_0

    .line 95
    :cond_2
    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setCategoryResponseList(Ljava/util/List;)V

    .line 97
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setPanel(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getPanel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;->setPanelModel(Lcom/ss/android/ugc/effectmanager/effect/model/EffectPanelModel;)V

    .line 100
    iget-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->whileDownload:Z

    if-eqz v1, :cond_3

    .line 101
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->downloadEffect(Ljava/util/List;)V

    .line 103
    :cond_3
    return-object v0
.end method

.method private downloadEffect(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;)V"
        }
    .end annotation

    .line 122
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 123
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 125
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/ss/android/ugc/effectmanager/common/utils/EffectUtils;->downloadEffect(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    goto :goto_1

    .line 126
    :catch_0
    move-exception v0

    .line 128
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 131
    :cond_0
    :goto_1
    goto :goto_0

    .line 132
    :cond_1
    return-void
.end method

.method private getCategoryAllEffects(Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;",
            "Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 111
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectCategoryModel;->getEffects()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 112
    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->getEffects()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 113
    invoke-virtual {v3}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getEffectId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 114
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :cond_0
    goto :goto_1

    .line 117
    :cond_1
    goto :goto_0

    .line 118
    :cond_2
    return-object v0
.end method


# virtual methods
.method public execute()V
    .locals 5

    .line 52
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mCache:Lcom/ss/android/ugc/effectmanager/common/listener/ICache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effectchannel"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/listener/ICache;->queryToStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 53
    const/16 v1, 0x2714

    const/16 v2, 0xe

    if-nez v0, :cond_0

    .line 54
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    new-instance v4, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v4, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_0

    .line 56
    :cond_0
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    const-class v4, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    invoke-interface {v3, v0, v4}, Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;->convertJsonToObj(Ljava/io/InputStream;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;

    .line 57
    if-nez v0, :cond_1

    .line 58
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    new-instance v4, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v4, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;->checkValued()Z

    move-result v3

    if-nez v3, :cond_2

    .line 60
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    new-instance v3, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->panel:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>(Ljava/lang/String;)V

    new-instance v4, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v4, v1}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(I)V

    invoke-direct {v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    goto :goto_0

    .line 62
    :cond_2
    invoke-direct {p0, v0}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->buildChannelResponse(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelModel;)Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    .line 63
    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v2, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 66
    :goto_0
    return-void
.end method
