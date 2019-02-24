.class public Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;
.super Ljava/lang/Object;
.source "EffectChannelRepository.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;
    }
.end annotation


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;

.field private mHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 37
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 38
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;

    invoke-direct {p1, p0}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;-><init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mHandler:Landroid/os/Handler;

    .line 39
    return-void
.end method


# virtual methods
.method public checkUpdate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 60
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, p2, v2, p1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/CheckUpdateTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Landroid/os/Handler;Ljava/lang/String;)V

    .line 61
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 62
    return-void
.end method

.method public fetchExistEffectList(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 51
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchExistEffectListTask;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p1, p2, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchExistEffectListTask;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 52
    return-void
.end method

.method public fetchList(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    .line 45
    if-eqz p3, :cond_0

    new-instance p3, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x0

    move-object v0, p3

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelCacheTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;Z)V

    goto :goto_0

    :cond_0
    new-instance p3, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {p3, v0, p1, p2, v1}, Lcom/ss/android/ugc/effectmanager/effect/task/task/FetchEffectChannelTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Ljava/lang/String;Landroid/os/Handler;)V

    .line 47
    :goto_0
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 48
    return-void
.end method

.method public handleMsg(Landroid/os/Message;)V
    .locals 5

    .line 66
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;

    if-nez v0, :cond_0

    .line 67
    return-void

    .line 69
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xe

    if-ne v0, v1, :cond_2

    .line 70
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    if-eqz v0, :cond_2

    .line 71
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;

    .line 73
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v1

    .line 75
    if-nez v1, :cond_1

    .line 76
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->getEffectChannels()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    const/16 v3, 0x17

    const/4 v4, 0x0

    invoke-interface {v1, v2, v0, v3, v4}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;->updateEffectChannel(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    goto :goto_0

    .line 78
    :cond_1
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectChannelTaskResult;->getEffectChannels()Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;

    move-result-object v0

    const/16 v4, 0x1b

    invoke-interface {v2, v3, v0, v4, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;->updateEffectChannel(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/EffectChannelResponse;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 83
    :cond_2
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_4

    .line 84
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    if-eqz v0, :cond_4

    .line 85
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;

    .line 86
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v0

    .line 87
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v1

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->getTaskID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getCheckChannelListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;

    move-result-object v1

    .line 88
    if-eqz v1, :cond_4

    .line 89
    if-nez v0, :cond_3

    .line 90
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectCheckUpdateResult;->isUpdate()Z

    move-result p1

    invoke-interface {v1, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;->checkChannelSuccess(Z)V

    goto :goto_1

    .line 92
    :cond_3
    invoke-interface {v1, v0}, Lcom/ss/android/ugc/effectmanager/effect/listener/ICheckChannelListener;->checkChannelFailed(Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 97
    :cond_4
    :goto_1
    return-void
.end method

.method public setOnEffectListListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository;->mEffectListListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectChannelRepository$EffectListListener;

    .line 101
    return-void
.end method
