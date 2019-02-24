.class Lcom/android/camera/parallel/AlgoConnector$1;
.super Ljava/lang/Object;
.source "AlgoConnector.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/parallel/AlgoConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/parallel/AlgoConnector;


# direct methods
.method constructor <init>(Lcom/android/camera/parallel/AlgoConnector;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    .line 24
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceConnected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$100()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p1

    monitor-enter p1

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    check-cast p2, Lcom/android/camera/LocalParallelService$LocalBinder;

    invoke-static {v0, p2}, Lcom/android/camera/parallel/AlgoConnector;->access$202(Lcom/android/camera/parallel/AlgoConnector;Lcom/android/camera/LocalParallelService$LocalBinder;)Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 27
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$100()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->notify()V

    .line 28
    monitor-exit p1

    .line 29
    return-void

    .line 28
    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    .line 33
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onServiceDisconnected"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$100()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p1

    monitor-enter p1

    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector$1;->this$0:Lcom/android/camera/parallel/AlgoConnector;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/parallel/AlgoConnector;->access$202(Lcom/android/camera/parallel/AlgoConnector;Lcom/android/camera/LocalParallelService$LocalBinder;)Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 36
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->access$100()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 37
    monitor-exit p1

    .line 38
    return-void

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
