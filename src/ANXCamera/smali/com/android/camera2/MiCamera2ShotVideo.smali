.class public Lcom/android/camera2/MiCamera2ShotVideo;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotVideo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "[B>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 21
    return-void
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 48
    new-instance v0, Lcom/android/camera2/MiCamera2ShotVideo$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotVideo$1;-><init>(Lcom/android/camera2/MiCamera2ShotVideo;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 64
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedHardwareLevel()I

    move-result v0

    const/4 v1, 0x2

    if-ne v1, v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 66
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    goto :goto_0

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 69
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 72
    :goto_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getVideoSnapshotImageReader()Landroid/media/ImageReader;

    move-result-object v1

    .line 73
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 74
    sget-object v2, Lcom/android/camera2/MiCamera2ShotVideo;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "captureVideoSnapshot: size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 74
    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 80
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 82
    :cond_1
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getRecordSurface()Landroid/view/Surface;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 83
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getRecordSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 86
    :cond_2
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForVideoShot(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 87
    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 17
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotVideo;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 100
    if-nez v0, :cond_0

    .line 101
    return-void

    .line 103
    :cond_0
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([B)V

    .line 104
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    .line 92
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p2

    .line 93
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 94
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2ShotVideo;->notifyResultData([B)V

    .line 95
    return-void
.end method

.method protected prepare()V
    .locals 0

    .line 26
    return-void
.end method

.method protected startShot()V
    .locals 4

    .line 31
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotVideo;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 32
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotVideo;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v1

    .line 33
    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v2

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0, v1, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 39
    :catch_0
    move-exception v0

    .line 40
    sget-object v1, Lcom/android/camera2/MiCamera2ShotVideo;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture a video snapshot, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 35
    :catch_1
    move-exception v0

    .line 36
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 37
    sget-object v1, Lcom/android/camera2/MiCamera2ShotVideo;->TAG:Ljava/lang/String;

    const-string v2, "cannot capture a video snapshot"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotVideo;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 42
    :goto_0
    nop

    .line 44
    :goto_1
    return-void
.end method
