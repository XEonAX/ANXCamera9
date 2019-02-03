.class public Lcom/android/camera/LocalParallelService;
.super Landroid/app/Service;
.source "LocalParallelService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/LocalParallelService$ServiceStatusListener;,
        Lcom/android/camera/LocalParallelService$LocalBinder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

.field private mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

.field private mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    const-class v0, Lcom/android/camera/LocalParallelService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 31
    new-instance v0, Lcom/android/camera/LocalParallelService$1;

    invoke-direct {v0, p0}, Lcom/android/camera/LocalParallelService$1;-><init>(Lcom/android/camera/LocalParallelService;)V

    iput-object v0, p0, Lcom/android/camera/LocalParallelService;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/LocalParallelService;)Lcom/android/camera/LocalParallelService$ServiceStatusListener;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/android/camera/LocalParallelService;->mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera/LocalParallelService;Lcom/android/camera/LocalParallelService$ServiceStatusListener;)Lcom/android/camera/LocalParallelService$ServiceStatusListener;
    .locals 0

    .line 25
    iput-object p1, p0, Lcom/android/camera/LocalParallelService;->mServiceStatusListener:Lcom/android/camera/LocalParallelService$ServiceStatusListener;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/camera/LocalParallelService;)Lcom/android/camera/LocalParallelService$LocalBinder;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/android/camera/LocalParallelService;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    return-object p0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 25
    sget-object v0, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/camera/LocalParallelService;)Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/android/camera/LocalParallelService;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    return-object p0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    .line 49
    sget-object p1, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    const-string v0, "onBind: start"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    iget-object p1, p0, Lcom/android/camera/LocalParallelService;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    .line 60
    sget-object v0, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    const-string v1, "onCreate: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    new-instance v0, Lcom/android/camera/LocalParallelService$LocalBinder;

    invoke-direct {v0, p0}, Lcom/android/camera/LocalParallelService$LocalBinder;-><init>(Lcom/android/camera/LocalParallelService;)V

    iput-object v0, p0, Lcom/android/camera/LocalParallelService;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 62
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 63
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 73
    sget-object v0, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object v0, p0, Lcom/android/camera/LocalParallelService;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    invoke-virtual {v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->onServiceDestroy()V

    .line 75
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/LocalParallelService;->mLocalBinder:Lcom/android/camera/LocalParallelService$LocalBinder;

    .line 76
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 77
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    .line 67
    sget-object v0, Lcom/android/camera/LocalParallelService;->TAG:Ljava/lang/String;

    const-string v1, "onStartCommand: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p1

    return p1
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 0

    .line 55
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result p1

    return p1
.end method
