.class public Lcom/android/camera2/MiCamera2ShotBurst;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotBurst.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "[B>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBurstNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    const-class v0, Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2ShotBurst;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera2/MiCamera2;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 23
    iput p2, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mBurstNum:I

    .line 24
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/android/camera2/MiCamera2ShotBurst;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 56
    new-instance v0, Lcom/android/camera2/MiCamera2ShotBurst$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotBurst$1;-><init>(Lcom/android/camera2/MiCamera2ShotBurst;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 103
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 104
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_CAPTURE_INTENT:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 106
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 107
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 110
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x4

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 129
    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 15
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotBurst;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 152
    if-eqz v0, :cond_0

    .line 153
    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([B)V

    .line 155
    :cond_0
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    .line 134
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p2}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p2

    .line 135
    if-nez p2, :cond_0

    .line 136
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 137
    return-void

    .line 139
    :cond_0
    invoke-interface {p2, p1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenImageConsumed(Landroid/media/Image;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 141
    return-void

    .line 144
    :cond_1
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p2

    .line 145
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 146
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2ShotBurst;->notifyResultData([B)V

    .line 147
    return-void
.end method

.method protected prepare()V
    .locals 2

    .line 29
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    .line 30
    return-void
.end method

.method protected startSessionCapture()V
    .locals 4

    .line 34
    sget-object v0, Lcom/android/camera2/MiCamera2ShotBurst;->TAG:Ljava/lang/String;

    const-string v1, "startSessionCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->pausePreview()V

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotBurst;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 40
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotBurst;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 43
    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v2

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    sget-object v1, Lcom/android/camera2/MiCamera2ShotBurst;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture burst, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 49
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 44
    :catch_1
    move-exception v0

    .line 45
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 46
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 50
    :goto_0
    nop

    .line 52
    :goto_1
    return-void
.end method
