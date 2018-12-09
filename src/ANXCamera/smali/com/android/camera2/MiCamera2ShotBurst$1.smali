.class Lcom/android/camera2/MiCamera2ShotBurst$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotBurst.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotBurst;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotBurst;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotBurst;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 3
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

    .line 64
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 65
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    sget-object p2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "captureBurst onCaptureFailed %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 66
    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    const/4 v2, 0x0

    aput-object p3, v1, v2

    .line 65
    invoke-static {p2, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 88
    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    .line 89
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    const-string p2, "captureBurst onCaptureSequenceAborted"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 92
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 93
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    .line 94
    if-eqz p1, :cond_0

    .line 95
    invoke-interface {p1, p2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 97
    :cond_0
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 74
    sget-object p1, Lcom/android/camera2/MiCamera2Shot;->TAG:Ljava/lang/String;

    const-string p2, "captureBurst onCaptureSequenceCompleted"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 77
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    .line 79
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    .line 80
    if-eqz p1, :cond_0

    .line 81
    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 83
    :cond_0
    return-void
.end method
