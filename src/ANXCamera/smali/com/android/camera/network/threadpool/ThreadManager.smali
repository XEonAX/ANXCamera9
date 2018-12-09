.class public Lcom/android/camera/network/threadpool/ThreadManager;
.super Ljava/lang/Object;
.source "ThreadManager.java"


# static fields
.field private static final sRequestLock:Ljava/lang/Object;

.field private static sRequestThread:Landroid/os/HandlerThread;

.field private static sRequestThreadHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 11
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRequestThreadHandler()Landroid/os/Handler;
    .locals 3

    .line 14
    sget-object v0, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestLock:Ljava/lang/Object;

    monitor-enter v0

    .line 15
    :try_start_0
    sget-object v1, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThreadHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 16
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "request_thread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    .line 17
    sget-object v1, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 18
    new-instance v1, Landroid/os/Handler;

    sget-object v2, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThreadHandler:Landroid/os/Handler;

    .line 20
    :cond_0
    sget-object v1, Lcom/android/camera/network/threadpool/ThreadManager;->sRequestThreadHandler:Landroid/os/Handler;

    monitor-exit v0

    return-object v1

    .line 21
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getRequestThreadLooper()Landroid/os/Looper;
    .locals 1

    .line 25
    invoke-static {}, Lcom/android/camera/network/threadpool/ThreadManager;->getRequestThreadHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method
