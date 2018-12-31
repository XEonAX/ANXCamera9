.class Lcom/android/camera/module/loader/camera2/CameraTestManager$2;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "CameraTestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V
    .locals 0

    .line 229
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$602(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 240
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$700(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 241
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 1

    .line 232
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$602(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    .line 233
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 234
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$2;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$700(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 235
    return-void
.end method
