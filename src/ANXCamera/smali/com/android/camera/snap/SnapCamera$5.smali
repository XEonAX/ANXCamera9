.class Lcom/android/camera/snap/SnapCamera$5;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/snap/SnapCamera;->startCamcorder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapCamera;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0

    .line 628
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 655
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "videoSessionCb::onConfigureFailed"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$1100(Lcom/android/camera/snap/SnapCamera;)V

    .line 657
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 632
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v0}, Lcom/android/camera/snap/SnapCamera;->access$800(Lcom/android/camera/snap/SnapCamera;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    new-instance v1, Lcom/android/camera/snap/SnapCamera$5$1;

    invoke-direct {v1, p0}, Lcom/android/camera/snap/SnapCamera$5$1;-><init>(Lcom/android/camera/snap/SnapCamera$5;)V

    iget-object v2, p0, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    .line 647
    invoke-static {v2}, Lcom/android/camera/snap/SnapCamera;->access$1200(Lcom/android/camera/snap/SnapCamera;)Landroid/os/Handler;

    move-result-object v2

    .line 632
    invoke-virtual {p1, v0, v1, v2}, Landroid/hardware/camera2/CameraCaptureSession;->setRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 650
    goto :goto_0

    .line 648
    :catch_0
    move-exception p1

    .line 649
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "videoSessionCb::onConfigured: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 651
    :goto_0
    return-void
.end method
