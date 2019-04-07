.class Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;
.super Ljava/lang/Object;
.source "BackgroundWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;-><init>(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Ljava/lang/String;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 27
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 29
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$002(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Landroid/os/Looper;)Landroid/os/Looper;

    .line 31
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 32
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$202(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Z)Z

    .line 33
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-static {v1}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 34
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 36
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 38
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 39
    :try_start_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;->this$0:Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->access$202(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Z)Z

    .line 40
    monitor-exit v1

    .line 41
    return-void

    .line 40
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 34
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method
