.class public Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;
.super Ljava/lang/Object;
.source "EffectRepository.java"

# interfaces
.implements Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;
    }
.end annotation


# instance fields
.field private mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

.field private mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

.field private mHandler:Landroid/os/Handler;

.field private mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

.field private mTaskMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            "Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    .line 43
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    .line 44
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/context/EffectContext;->getEffectConfiguration()Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    .line 45
    new-instance p1, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;

    invoke-direct {p1, p0}, Lcom/ss/android/ugc/effectmanager/common/WeakHandler;-><init>(Lcom/ss/android/ugc/effectmanager/common/WeakHandler$IHandler;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    .line 46
    return-void
.end method


# virtual methods
.method public cancelDownloadEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V
    .locals 4

    .line 83
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 84
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;

    invoke-interface {v0}, Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;->cancel()V

    .line 86
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    if-eqz v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    const-string v2, ""

    const/16 v3, 0x16

    invoke-interface {v0, v2, p1, v3, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 96
    :cond_1
    return-void
.end method

.method public fetchEffect(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Ljava/lang/String;)V
    .locals 4

    .line 49
    new-instance v0, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;

    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p1, v1, p2, v2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectTask;-><init>(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/lang/String;Landroid/os/Handler;)V

    .line 50
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    const-string v1, ""

    const/16 v2, 0x15

    const/4 v3, 0x0

    invoke-interface {p2, v1, p1, v2, v3}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 51
    iget-object p2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    iget-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 53
    return-void
.end method

.method public fetchEffectList(Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ugc/effectmanager/effect/model/Effect;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 75
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    .line 76
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    const-string v3, ""

    const/16 v4, 0x15

    const/4 v5, 0x0

    invoke-interface {v2, v3, v1, v4, v5}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListTask;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, v2, p1, p2, v3}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/util/List;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 79
    return-void
.end method

.method public fetchEffectListById(Ljava/util/List;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    new-instance v1, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListByIdsTask;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, v2, p1, v3, p2}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListByIdsTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/util/List;Landroid/os/Handler;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 63
    return-void
.end method

.method public fetchEffectListById(Ljava/util/List;Ljava/lang/String;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getTaskManager()Lcom/ss/android/ugc/effectmanager/common/TaskManager;

    move-result-object v0

    new-instance v7, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListByIdsTask;

    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mEffectContext:Lcom/ss/android/ugc/effectmanager/context/EffectContext;

    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mHandler:Landroid/os/Handler;

    move-object v1, v7

    move-object v3, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/ss/android/ugc/effectmanager/effect/task/task/DownloadEffectListByIdsTask;-><init>(Lcom/ss/android/ugc/effectmanager/context/EffectContext;Ljava/util/List;Landroid/os/Handler;Ljava/lang/String;I)V

    invoke-virtual {v0, v7}, Lcom/ss/android/ugc/effectmanager/common/TaskManager;->commit(Lcom/ss/android/ugc/effectmanager/common/task/BaseTask;)V

    .line 68
    return-void
.end method

.method public handleMsg(Landroid/os/Message;)V
    .locals 6

    .line 104
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    if-nez v0, :cond_0

    .line 105
    return-void

    .line 108
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xf

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 109
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    if-eqz v0, :cond_2

    .line 110
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    .line 111
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    move-result-object v1

    .line 113
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v3

    .line 115
    if-nez v3, :cond_1

    .line 116
    iget-object v3, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0x14

    invoke-interface {v3, v0, v1, v4, v2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    goto :goto_0

    .line 118
    :cond_1
    iget-object v4, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v0

    const/16 v5, 0x1a

    invoke-interface {v4, v0, v1, v5, v3}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectStatus(Ljava/lang/String;Lcom/ss/android/ugc/effectmanager/effect/model/Effect;ILcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 121
    :goto_0
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mTaskMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x11

    if-ne v0, v1, :cond_4

    .line 126
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;

    if-eqz v0, :cond_4

    .line 127
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;

    .line 128
    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->getException()Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;

    move-result-object v1

    .line 129
    if-nez v1, :cond_3

    .line 130
    iget-object v1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->getEffectList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v3, v0, v2}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectListStatus(Ljava/lang/String;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    goto :goto_1

    .line 132
    :cond_3
    iget-object v2, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectListTaskResult;->getEffectList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v3, v0, v1}, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;->updateEffectListStatus(Ljava/lang/String;Ljava/util/List;Lcom/ss/android/ugc/effectmanager/common/task/ExceptionResult;)V

    .line 137
    :cond_4
    :goto_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x2a

    if-ne v0, v1, :cond_5

    .line 138
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    if-eqz v0, :cond_5

    .line 139
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;

    .line 140
    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mConfiguration:Lcom/ss/android/ugc/effectmanager/EffectConfiguration;

    invoke-virtual {v0}, Lcom/ss/android/ugc/effectmanager/EffectConfiguration;->getListenerManger()Lcom/ss/android/ugc/effectmanager/ListenerManger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getTaskID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ugc/effectmanager/ListenerManger;->getFetchEffectListener(Ljava/lang/String;)Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;

    move-result-object v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/effect/task/result/EffectTaskResult;->getEffect()Lcom/ss/android/ugc/effectmanager/effect/model/Effect;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ss/android/ugc/effectmanager/effect/listener/IFetchEffectListener;->onStart(Lcom/ss/android/ugc/effectmanager/effect/model/Effect;)V

    .line 146
    :cond_5
    return-void
.end method

.method public setListener(Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;)V
    .locals 0

    .line 99
    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository;->mListener:Lcom/ss/android/ugc/effectmanager/effect/repository/EffectRepository$EffectListener;

    .line 100
    return-void
.end method
