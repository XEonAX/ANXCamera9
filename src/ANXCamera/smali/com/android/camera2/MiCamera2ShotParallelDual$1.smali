.class Lcom/android/camera2/MiCamera2ShotParallelDual$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotParallelDual.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotParallelDual;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotParallelDual;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 85
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureCompleted: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelDual;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 88
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    invoke-static {p1, p3}, Lcom/android/camera2/MiCamera2ShotParallelDual;->access$002(Lcom/android/camera2/MiCamera2ShotParallelDual;Landroid/hardware/camera2/CaptureResult;)Landroid/hardware/camera2/CaptureResult;

    .line 89
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotParallelDual;->access$000(Lcom/android/camera2/MiCamera2ShotParallelDual;)Landroid/hardware/camera2/CaptureResult;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCustomCaptureResult(Landroid/hardware/camera2/CaptureResult;)Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object p1

    .line 90
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 91
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/LocalParallelService$LocalBinder;->onCaptureCompleted(Ljava/util/List;)V

    .line 93
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 99
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 100
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Capture a still picture failed "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelDual;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 102
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 72
    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 73
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelDual;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    .line 74
    if-eqz p1, :cond_0

    .line 75
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    iget-object p2, p2, Lcom/android/camera2/MiCamera2ShotParallelDual;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 76
    invoke-virtual {p2}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result p2

    iget-object p5, p0, Lcom/android/camera2/MiCamera2ShotParallelDual$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelDual;

    iget-object p5, p5, Lcom/android/camera2/MiCamera2ShotParallelDual;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 77
    invoke-virtual {p5}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera2/CameraConfigs;->getShotPath()Ljava/lang/String;

    move-result-object p5

    .line 75
    invoke-interface {p1, p3, p4, p2, p5}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onCaptureStart(JILjava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 79
    :cond_0
    return-void
.end method
