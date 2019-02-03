.class public Lcom/android/camera/parallel/AlgoConnector;
.super Ljava/lang/Object;
.source "AlgoConnector.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final ourInstance:Lcom/android/camera/parallel/AlgoConnector;


# instance fields
.field private mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

.field private final mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/android/camera/parallel/AlgoConnector;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/parallel/AlgoConnector;->TAG:Ljava/lang/String;

    .line 18
    new-instance v0, Lcom/android/camera/parallel/AlgoConnector;

    invoke-direct {v0}, Lcom/android/camera/parallel/AlgoConnector;-><init>()V

    sput-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Lcom/android/camera/parallel/AlgoConnector$1;

    invoke-direct {v0, p0}, Lcom/android/camera/parallel/AlgoConnector$1;-><init>(Lcom/android/camera/parallel/AlgoConnector;)V

    iput-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 43
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 16
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()Lcom/android/camera/parallel/AlgoConnector;
    .locals 1

    .line 16
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    return-object v0
.end method

.method static synthetic access$202(Lcom/android/camera/parallel/AlgoConnector;Lcom/android/camera/LocalParallelService$LocalBinder;)Lcom/android/camera/LocalParallelService$LocalBinder;
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    return-object p1
.end method

.method public static getInstance()Lcom/android/camera/parallel/AlgoConnector;
    .locals 1

    .line 46
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    return-object v0
.end method


# virtual methods
.method public getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;
    .locals 1

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder(Z)Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    return-object v0
.end method

.method public getLocalBinder(Z)Lcom/android/camera/LocalParallelService$LocalBinder;
    .locals 4

    .line 69
    if-eqz p1, :cond_1

    .line 70
    const/4 p1, 0x0

    .line 71
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    monitor-enter v0

    .line 72
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    const/16 v1, 0x32

    if-ge p1, v1, :cond_0

    .line 74
    :try_start_1
    sget-object v1, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 75
    add-int/lit8 p1, p1, 0x1

    .line 76
    sget-object v1, Lcom/android/camera/parallel/AlgoConnector;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "waiting service..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 77
    :catch_0
    move-exception v1

    .line 78
    :try_start_2
    sget-object v2, Lcom/android/camera/parallel/AlgoConnector;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    :goto_1
    goto :goto_0

    .line 81
    :cond_0
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 84
    :cond_1
    :goto_2
    iget-object p1, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    return-object p1
.end method

.method public setServiceStatusListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V
    .locals 1

    .line 50
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    invoke-virtual {v0, p1}, Lcom/android/camera/LocalParallelService$LocalBinder;->setOnPictureTakenListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V

    .line 53
    :cond_0
    return-void
.end method

.method public startService(Landroid/content/Context;)V
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    if-eqz v0, :cond_0

    .line 57
    return-void

    .line 59
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/camera/LocalParallelService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 60
    iget-object v1, p0, Lcom/android/camera/parallel/AlgoConnector;->mServiceConnection:Landroid/content/ServiceConnection;

    const v2, 0x4000041

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 62
    return-void
.end method
