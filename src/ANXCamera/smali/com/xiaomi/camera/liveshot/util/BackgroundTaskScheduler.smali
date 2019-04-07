.class public Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;
.super Ljava/lang/Object;
.source "BackgroundTaskScheduler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;,
        Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mTaskList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 13
    const-class v0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 20
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    .line 21
    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;)Ljava/util/List;
    .locals 0

    .line 12
    iget-object p0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 12
    sget-object v0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public abortRemainingTasks()V
    .locals 3

    .line 52
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    monitor-enter v0

    .line 53
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;

    .line 54
    invoke-static {v2}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;)V

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    monitor-exit v0

    .line 57
    return-void

    .line 56
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public execute(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;)V
    .locals 3

    .line 24
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    monitor-enter v0

    .line 25
    :try_start_0
    new-instance v1, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;-><init>(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$1;)V

    .line 26
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 28
    monitor-exit v0

    .line 29
    return-void

    .line 28
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getRemainingTaskCount()I
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    monitor-enter v0

    .line 47
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 48
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public shutdown()V
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 43
    return-void
.end method

.method public submit(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;)Ljava/util/concurrent/Future;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;",
            ")",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    monitor-enter v0

    .line 34
    :try_start_0
    new-instance v1, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;-><init>(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$1;)V

    .line 35
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mTaskList:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 37
    monitor-exit v0

    .line 38
    return-object p1

    .line 37
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
