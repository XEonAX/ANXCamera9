.class public Lcom/android/camera/parallel/AlgoConnector;
.super Ljava/lang/Object;
.source "AlgoConnector.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static ourInstance:Lcom/android/camera/parallel/AlgoConnector;


# instance fields
.field public mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

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

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Lcom/android/camera/parallel/AlgoConnector$1;

    invoke-direct {v0, p0}, Lcom/android/camera/parallel/AlgoConnector$1;-><init>(Lcom/android/camera/parallel/AlgoConnector;)V

    iput-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 37
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 16
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static getInstance()Lcom/android/camera/parallel/AlgoConnector;
    .locals 1

    .line 40
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/android/camera/parallel/AlgoConnector;

    invoke-direct {v0}, Lcom/android/camera/parallel/AlgoConnector;-><init>()V

    sput-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    .line 43
    :cond_0
    sget-object v0, Lcom/android/camera/parallel/AlgoConnector;->ourInstance:Lcom/android/camera/parallel/AlgoConnector;

    return-object v0
.end method


# virtual methods
.method public getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    return-object v0
.end method

.method public setServiceStatusListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V
    .locals 1

    .line 47
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    invoke-virtual {v0, p1}, Lcom/android/camera/LocalParallelService$LocalBinder;->setOnPictureTakenListener(Lcom/android/camera/LocalParallelService$ServiceStatusListener;)V

    .line 50
    :cond_0
    return-void
.end method

.method public startService(Landroid/content/Context;)V
    .locals 3

    .line 53
    iget-object v0, p0, Lcom/android/camera/parallel/AlgoConnector;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    if-eqz v0, :cond_0

    .line 54
    return-void

    .line 56
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/camera/LocalParallelService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 57
    iget-object v1, p0, Lcom/android/camera/parallel/AlgoConnector;->mServiceConnection:Landroid/content/ServiceConnection;

    const v2, 0x4000041

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 59
    return-void
.end method
