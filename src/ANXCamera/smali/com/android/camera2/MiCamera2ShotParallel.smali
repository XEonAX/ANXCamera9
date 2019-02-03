.class public abstract Lcom/android/camera2/MiCamera2ShotParallel;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotParallel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/camera2/MiCamera2Shot<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ShotParallelBase"


# instance fields
.field mCapturedImageSize:Lcom/android/camera/CameraSize;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 32
    return-void
.end method

.method private hasDualCamera()Z
    .locals 2

    .line 61
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMuxFrontCameraId()I

    move-result v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 62
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 63
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMuxCameraId()I

    move-result v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 64
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehCameraId()I

    move-result v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 61
    :goto_1
    return v0
.end method


# virtual methods
.method configParallelSession(Landroid/util/Size;)V
    .locals 6

    .line 41
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 42
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotParallel;->hasDualCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    .line 43
    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "ShotParallelBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "configParallelSession: inputStreamNum = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    new-instance v2, Lcom/xiaomi/engine/GraphDescriptorBean;

    const v3, 0x8002

    iget-object v4, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 45
    invoke-virtual {v4}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v4

    invoke-static {v4}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCameraCombinationMode(I)I

    move-result v4

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/xiaomi/engine/GraphDescriptorBean;-><init>(IIZI)V

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    new-instance v2, Lcom/xiaomi/engine/GraphDescriptorBean;

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 48
    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v3

    invoke-static {v3}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCameraCombinationMode(I)I

    move-result v3

    invoke-direct {v2, v0, v1, v1, v3}, Lcom/xiaomi/engine/GraphDescriptorBean;-><init>(IIZI)V

    .line 51
    :goto_1
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 52
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 53
    const-string v3, "ShotParallelBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[QCFA] configParallelSession: pictureSize = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v3, Lcom/xiaomi/engine/BufferFormat;

    const/16 v4, 0x23

    invoke-direct {v3, v0, v1, v4, v2}, Lcom/xiaomi/engine/BufferFormat;-><init>(IIILcom/xiaomi/engine/GraphDescriptorBean;)V

    .line 55
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/LocalParallelService$LocalBinder;->configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V

    .line 57
    new-instance v0, Lcom/android/camera/CameraSize;

    invoke-direct {v0, p1}, Lcom/android/camera/CameraSize;-><init>(Landroid/util/Size;)V

    iput-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallel;->mCapturedImageSize:Lcom/android/camera/CameraSize;

    .line 58
    return-void
.end method

.method protected notifyResultData(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 75
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    .line 70
    return-void
.end method
