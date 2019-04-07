.class Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;
.super Ljava/lang/Object;
.source "BackgroundTaskScheduler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackgroundTaskContainer"
.end annotation


# instance fields
.field private final mTask:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;

.field final synthetic this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;


# direct methods
.method private constructor <init>(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->mTask:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;

    .line 76
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$1;)V
    .locals 0

    .line 71
    invoke-direct {p0, p1, p2}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;-><init>(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;)V

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;)V
    .locals 0

    .line 71
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->cancel()V

    return-void
.end method

.method private cancel()V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->mTask:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;->setCancelled()V

    .line 80
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 84
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->access$200(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;)Ljava/util/List;

    move-result-object v0

    monitor-enter v0

    .line 85
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-static {v1}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->access$200(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 86
    invoke-static {}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->access$300()Ljava/lang/String;

    move-result-object v1

    const-string v2, "This task does not exist in task list."

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$BackgroundTaskContainer;->mTask:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;->run()V

    .line 91
    return-void

    .line 88
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
