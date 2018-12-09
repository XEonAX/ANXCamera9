.class Lcom/android/camera2/MiCamera2ShotParallelSequence$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotParallelSequence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotParallelSequence;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotParallelSequence;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

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

    .line 156
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "captureBurst onCaptureCompleted: mBurstNum:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$100(Lcom/android/camera2/MiCamera2ShotParallelSequence;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", result:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    if-nez p3, :cond_0

    const-string v0, "null"

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 156
    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    invoke-static {p3}, Lcom/xiaomi/camera/base/CameraDeviceUtil;->getCustomCaptureResult(Landroid/hardware/camera2/CaptureResult;)Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 159
    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/LocalParallelService$LocalBinder;->onCaptureCompleted(Ljava/util/List;)V

    .line 160
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$110(Lcom/android/camera2/MiCamera2ShotParallelSequence;)I

    .line 161
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$100(Lcom/android/camera2/MiCamera2ShotParallelSequence;)I

    move-result p1

    if-nez p1, :cond_1

    .line 162
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 164
    :cond_1
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

    .line 170
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 171
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "captureBurst failed "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 173
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 139
    sget-object v0, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "captureBurst onCaptureStarted mFirstNum:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    invoke-static {v2}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$000(Lcom/android/camera2/MiCamera2ShotParallelSequence;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 141
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$000(Lcom/android/camera2/MiCamera2ShotParallelSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 142
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    .line 143
    if-eqz p1, :cond_0

    .line 144
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object p2, p2, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 145
    invoke-virtual {p2}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result p2

    iget-object p5, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    iget-object p5, p5, Lcom/android/camera2/MiCamera2ShotParallelSequence;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 146
    invoke-virtual {p5}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object p5

    invoke-virtual {p5}, Lcom/android/camera2/CameraConfigs;->getShotPath()Ljava/lang/String;

    move-result-object p5

    .line 144
    invoke-interface {p1, p3, p4, p2, p5}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onCaptureStart(JILjava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 148
    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotParallelSequence$1;->this$0:Lcom/android/camera2/MiCamera2ShotParallelSequence;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/android/camera2/MiCamera2ShotParallelSequence;->access$002(Lcom/android/camera2/MiCamera2ShotParallelSequence;Z)Z

    .line 150
    :cond_1
    return-void
.end method
