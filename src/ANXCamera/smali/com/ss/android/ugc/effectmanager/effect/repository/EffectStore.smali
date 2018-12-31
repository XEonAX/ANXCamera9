.class public Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;
.super Ljava/lang/Object;
.source "EffectStore.java"


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mCurDownloadingEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private mEffectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/EffectConfiguration;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    .line 37
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 38
    return-void
.end method


# virtual methods
.method public getCurrentDownloadingEffectList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    return-object v0
.end method

.method public getCurrentEffectChannel()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mEffectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    invoke-direct {v0}, Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;-><init>()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mEffectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    :goto_0
    return-object v0
.end method

.method public isDownloaded(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 1

    .line 54
    invoke-virtual {p0, p1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->isDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 55
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getUnzipPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/ss/android/ugc/effectmanager/common/utils/FileUtils;->checkFileExists(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public isDownloading(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)Z
    .locals 4

    .line 59
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 60
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 61
    invoke-virtual {v2}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 62
    const/4 p1, 0x1

    return p1

    .line 64
    :cond_1
    goto :goto_0

    .line 65
    :cond_2
    return v0
.end method

.method public updateEffectChannel(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 0

    .line 73
    packed-switch p3, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 86
    :pswitch_1
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p2}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectChannelListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    move-result-object p1

    .line 87
    if-eqz p1, :cond_0

    .line 88
    invoke-interface {p1, p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    goto :goto_0

    .line 84
    :pswitch_2
    goto :goto_0

    .line 75
    :pswitch_3
    goto :goto_0

    .line 77
    :pswitch_4
    iput-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mEffectChannels:Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    .line 78
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectChannelListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;

    move-result-object p1

    .line 79
    if-eqz p1, :cond_0

    .line 80
    invoke-interface {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectChannelListener;->onSuccess(Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;)V

    .line 93
    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x17
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public updateEffectDownloadStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1

    .line 97
    const/16 v0, 0x1a

    if-eq p3, v0, :cond_0

    packed-switch p3, :pswitch_data_0

    goto :goto_0

    .line 109
    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 110
    goto :goto_0

    .line 99
    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    goto :goto_0

    .line 102
    :pswitch_2
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {p3, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 103
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;

    move-result-object p1

    .line 104
    if-eqz p1, :cond_2

    .line 105
    invoke-interface {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onSuccess(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V

    goto :goto_0

    .line 112
    :cond_0
    iget-object p3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p3}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;

    move-result-object p1

    .line 113
    if-eqz p1, :cond_1

    .line 114
    invoke-interface {p1, p2, p4}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onFail(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 116
    :cond_1
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    nop

    .line 121
    :cond_2
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public updateEffectListDownloadStatus(Ljava/lang/String;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;",
            ")V"
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mCurDownloadingEffects:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 125
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectStore;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectLisListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;

    move-result-object p1

    .line 126
    if-eqz p1, :cond_1

    .line 127
    if-nez p3, :cond_0

    .line 128
    invoke-interface {p1, p2}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onSuccess(Ljava/util/List;)V

    goto :goto_0

    .line 130
    :cond_0
    invoke-interface {p1, p3}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListListener;->onFail(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 133
    :cond_1
    :goto_0
    return-void
.end method
