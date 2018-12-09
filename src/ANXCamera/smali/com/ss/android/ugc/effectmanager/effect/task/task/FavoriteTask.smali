.class public Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;
.super Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;
.source "FavoriteTask.java"


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mCurCnt:I

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mEffectIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsFavorite:Z

.field private mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

.field private mPanel:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Ljava/lang/String;Z)V
    .locals 1

    .line 60
    const-string v0, "NETWORK"

    invoke-direct {p0, p4, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    .line 61
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 62
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 63
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 64
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 65
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    invoke-interface {p1, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    iput-boolean p6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mIsFavorite:Z

    .line 67
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mPanel:Ljava/lang/String;

    .line 68
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRetryCount()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mCurCnt:I

    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ss/android/ugc/effectmanager/context/EffectContext;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/Handler;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 48
    const-string v0, "NETWORK"

    invoke-direct {p0, p4, p3, v0}, Lcom/ss/android/ugc/effectmanager/common/task/NormalTask;-><init>(Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    .line 49
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 50
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 51
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getJsonConverter()Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    .line 52
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 53
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    invoke-interface {p1, p5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 54
    iput-boolean p6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mIsFavorite:Z

    .line 55
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mPanel:Ljava/lang/String;

    .line 56
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRetryCount()I

    move-result p1

    iput p1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mCurCnt:I

    .line 57
    return-void
.end method

.method private buildRequest(Ljava/util/List;Z)Lcom/ss/android/ugc/effectmanager/common/EffectRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/ss/android/ugc/effectmanager/common/EffectRequest;"
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 94
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    const-string v1, "access_key"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAccessKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 99
    const-string v1, "device_id"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_1
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 103
    const-string v1, "device_type"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getDeviceType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    :cond_2
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 107
    const-string v1, "device_platform"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getPlatform()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    :cond_3
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 111
    const-string v1, "region"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getRegion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    :cond_4
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 115
    const-string v1, "sdk_version"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSdkVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    :cond_5
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 119
    const-string v1, "app_version"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_6
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 123
    const-string v1, "channel"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getChannel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    :cond_7
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 127
    const-string v1, "aid"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_8
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 130
    const-string v1, "app_language"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getAppLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    :cond_9
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 133
    const-string v1, "language"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getSysLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    :cond_a
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mPanel:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 136
    const-string v1, "panel"

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mPanel:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_b
    const-string v1, "effect_ids"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 141
    const-string p2, "type"

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    const-string p2, "POST"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 144
    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getLinkSelector()Lcom/ss/android/ugc/effectmanager/link/LinkSelector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/link/LinkSelector;->getBestHostUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getApiAdress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/v3/effect/favorite"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, p2, v1}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->setBodyParams(Ljava/util/Map;)V

    .line 146
    const-string p2, "application/json"

    invoke-virtual {p1, p2}, Lcom/ss/android/ugc/effectmanager/common/EffectRequest;->setContentType(Ljava/lang/String;)V

    .line 147
    return-object p1
.end method


# virtual methods
.method public execute()V
    .locals 8

    .line 74
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mCurCnt:I

    if-ge v1, v2, :cond_2

    .line 75
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    iget-boolean v3, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mIsFavorite:Z

    invoke-direct {p0, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->buildRequest(Ljava/util/List;Z)Lcom/ss/android/ugc/effectmanager/common/EffectRequest;

    move-result-object v2

    .line 77
    const/16 v3, 0x28

    const/4 v4, 0x1

    :try_start_0
    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v5}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getEffectNetWorker()Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;

    move-result-object v5

    iget-object v6, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mJsonConverter:Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;

    const-class v7, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;

    invoke-virtual {v5, v2, v6, v7}, Lcom/ss/android/ugc/effectmanager/network/EffectNetWorkerWrapper;->execute(Lcom/ss/android/ugc/effectmanager/common/EffectRequest;Lcom/ss/android/ugc/effectmanager/common/listener/IJsonConverter;Ljava/lang/Class;)Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;

    .line 78
    new-instance v2, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;

    iget-object v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    const/4 v6, 0x0

    invoke-direct {v2, v4, v5, v6}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;-><init>(ZLjava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v3, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    goto :goto_2

    .line 80
    :catch_0
    move-exception v2

    .line 81
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 83
    iget v5, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mCurCnt:I

    sub-int/2addr v5, v4

    if-eq v1, v5, :cond_1

    instance-of v4, v2, Lcom/ss/android/ugc/effectmanager/common/exception/StatusCodeException;

    if-eqz v4, :cond_0

    goto :goto_1

    .line 74
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 84
    :cond_1
    :goto_1
    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->mEffectIds:Ljava/util/List;

    new-instance v5, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    invoke-direct {v5, v2}, Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;-><init>(Ljava/lang/Exception;)V

    invoke-direct {v1, v0, v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/task/result/FavoriteTaskResult;-><init>(ZLjava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    invoke-virtual {p0, v3, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FavoriteTask;->sendMessage(ILcom/ss/android/ugc/effectmanager/common/task/BaseTaskResult;)V

    .line 85
    nop

    .line 89
    :cond_2
    :goto_2
    return-void
.end method
