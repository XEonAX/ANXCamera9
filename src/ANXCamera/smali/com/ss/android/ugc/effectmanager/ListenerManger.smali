.class public Lcom/ss/android/ugc/effectmanager/ListenerManger;
.super Ljava/lang/Object;
.source "ListenerManger.java"


# instance fields
.field private checkChannelListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;",
            ">;"
        }
    .end annotation
.end field

.field private fetchEffectChannelListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;",
            ">;"
        }
    .end annotation
.end field

.field private fetchEffectListListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;",
            ">;"
        }
    .end annotation
.end field

.field private fetchEffectListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;",
            ">;"
        }
    .end annotation
.end field

.field private mFetchFavoriteListMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;",
            ">;"
        }
    .end annotation
.end field

.field private mModFavoriteListMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;",
            ">;"
        }
    .end annotation
.end field

.field private mReadUpdateTagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;",
            ">;"
        }
    .end annotation
.end field

.field private mWriteUpdateTagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    .line 38
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 4

    .line 157
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 158
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    goto :goto_0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 161
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    goto :goto_1

    .line 163
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 164
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    goto :goto_2

    .line 166
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 167
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    goto :goto_3

    .line 170
    :cond_3
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 171
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    goto :goto_4

    .line 174
    :cond_4
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 175
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    goto :goto_5

    .line 178
    :cond_5
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 179
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    goto :goto_6

    .line 182
    :cond_6
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 183
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    goto :goto_7

    .line 185
    :cond_7
    return-void
.end method

.method public getCheckChannelListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;

    return-object p1
.end method

.method public getFetchEffectChannelListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    return-object p1
.end method

.method public getFetchEffectLisListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    return-object p1
.end method

.method public getFetchEffectListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;

    return-object p1
.end method

.method public getFetchFavoriteListListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 135
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;

    return-object p1
.end method

.method public getModFavoriteListListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;

    return-object p1
.end method

.method public getReadUpdateTagistener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;

    return-object p1
.end method

.method public getWriteUpdateTagListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;

    return-object p1
.end method

.method public setCheckChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;)V
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->checkChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public setFetchEffectChannelListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectChannelListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    return-void
.end method

.method public setFetchEffectListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;)V
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-void
.end method

.method public setFetchEffectListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->fetchEffectListenerMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    return-void
.end method

.method public setFetchFavoriteListListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchFavoriteList;)V
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mFetchFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    return-void
.end method

.method public setModFavoriteListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IModFavoriteList;)V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mModFavoriteListMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    return-void
.end method

.method public setReadUpdateTagListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IReadUpdateTagListener;)V
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mReadUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    return-void
.end method

.method public setWriteUpdateTagListener(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/listener/IWriteUpdateTagListener;)V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/ListenerManger;->mWriteUpdateTagMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method
