.class public Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;
.super Ljava/lang/Object;
.source "SurfaceCreatedOnSubScribe.java"

# interfaces
.implements Lcom/android/camera/module/loader/SurfaceCreatedCallback;
.implements Lio/reactivex/SingleOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/camera/module/loader/SurfaceCreatedCallback;",
        "Lio/reactivex/SingleOnSubscribe<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mSingleEmitter:Lio/reactivex/SingleEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleEmitter<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;

    .line 29
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;)Lio/reactivex/SingleEmitter;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    return-object p0
.end method

.method private onSurfaceCreated(Lio/reactivex/SingleEmitter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 51
    iput-object p1, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 52
    invoke-direct {p0}, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->openCamera2()V

    .line 53
    return-void
.end method

.method private openCamera2()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 59
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "camera"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 61
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    .line 63
    :try_start_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 64
    :try_start_1
    aget-object v2, v3, v1

    new-instance v4, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe$1;

    invoke-direct {v4, p0}, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe$1;-><init>(Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;)V

    .line 79
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraHandler()Landroid/os/Handler;

    move-result-object v5

    .line 64
    invoke-virtual {v0, v2, v4, v5}, Landroid/hardware/camera2/CameraManager;->openCamera(Ljava/lang/String;Landroid/hardware/camera2/CameraDevice$StateCallback;Landroid/os/Handler;)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 82
    goto :goto_1

    .line 80
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v3, v2

    .line 81
    :goto_0
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 83
    :goto_1
    array-length v0, v3

    :goto_2
    if-ge v1, v0, :cond_0

    aget-object v2, v3, v1

    .line 84
    const-string v4, "ids:"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 86
    :cond_0
    return-void
.end method


# virtual methods
.method public onGlSurfaceCreated()V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    invoke-interface {v0}, Lio/reactivex/SingleEmitter;->isDisposed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    invoke-direct {p0, v0}, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->onSurfaceCreated(Lio/reactivex/SingleEmitter;)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 48
    return-void

    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public subscribe(Lio/reactivex/SingleEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSurfaceStateListener:Lcom/android/camera/module/loader/SurfaceStateListener;

    invoke-interface {v0}, Lcom/android/camera/module/loader/SurfaceStateListener;->hasSurface()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 35
    invoke-direct {p0, p1}, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->onSurfaceCreated(Lio/reactivex/SingleEmitter;)V

    goto :goto_0

    .line 37
    :cond_0
    iput-object p1, p0, Lcom/android/camera/module/loader/SurfaceCreatedOnSubScribe;->mSingleEmitter:Lio/reactivex/SingleEmitter;

    .line 39
    :goto_0
    return-void
.end method
