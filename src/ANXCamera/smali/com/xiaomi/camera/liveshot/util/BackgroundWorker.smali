.class public Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;
.super Ljava/lang/Object;
.source "BackgroundWorker.java"


# static fields
.field private static final SHUTDOWN_TIMEOUT_MILLISECONDS:I = 0x7d0


# instance fields
.field private final mExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mLock:Ljava/lang/Object;

.field private mLooper:Landroid/os/Looper;

.field private volatile mReady:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mReady:Z

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mExecutor:Ljava/util/concurrent/ExecutorService;

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker$1;-><init>(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$002(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Landroid/os/Looper;)Landroid/os/Looper;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLooper:Landroid/os/Looper;

    return-object p1
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$202(Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mReady:Z

    return p1
.end method

.method private waitUntilReady()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v1

    :goto_1
    goto :goto_0

    :cond_0
    :try_start_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method


# virtual methods
.method public getLooper()Landroid/os/Looper;
    .locals 1

    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->waitUntilReady()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLooper:Landroid/os/Looper;

    return-object v0
.end method

.method public quit()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->waitUntilReady()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quitSafely()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/BackgroundWorker;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method
