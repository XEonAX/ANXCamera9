.class Lcom/android/camera2/MiCamera2ShotStill$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotStill.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotStill;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotStill;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotStill;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

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

    .line 106
    invoke-static {}, Lcom/android/camera2/MiCamera2ShotStill;->access$100()Ljava/lang/String;

    move-result-object p1

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

    .line 107
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 108
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 110
    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 111
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

    .line 117
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 118
    invoke-static {}, Lcom/android/camera2/MiCamera2ShotStill;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureFailed: reason="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 120
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 122
    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(Z)V

    .line 123
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

    .line 96
    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 97
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotStill;->access$000(Lcom/android/camera2/MiCamera2ShotStill;)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide p1

    const-wide/16 p5, 0x0

    cmp-long p1, p5, p1

    if-nez p1, :cond_0

    .line 98
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill$1;->this$0:Lcom/android/camera2/MiCamera2ShotStill;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotStill;->access$000(Lcom/android/camera2/MiCamera2ShotStill;)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Lcom/xiaomi/camera/core/ParallelTaskData;->setTimestamp(J)V

    .line 100
    :cond_0
    return-void
.end method
