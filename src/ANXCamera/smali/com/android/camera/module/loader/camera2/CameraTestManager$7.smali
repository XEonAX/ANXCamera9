.class Lcom/android/camera/module/loader/camera2/CameraTestManager$7;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
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

    .line 580
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method

.method private process(Landroid/hardware/camera2/CaptureResult;)V
    .locals 3

    .line 582
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    .line 583
    if-nez p1, :cond_0

    .line 584
    return-void

    .line 587
    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v0, v1, :cond_1

    const/4 v0, 0x5

    .line 588
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne v0, p1, :cond_2

    .line 589
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$1100(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 590
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->stopPreview()V

    .line 591
    const-string p1, "af:"

    const-string v0, "finish 0"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$1100(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 595
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$1100(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object p1

    sget-object v0, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 596
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 598
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$700(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onAutoFocusFinish(Z)V

    .line 600
    :cond_2
    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0
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

    .line 613
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 614
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 606
    invoke-direct {p0, p3}, Lcom/android/camera/module/loader/camera2/CameraTestManager$7;->process(Landroid/hardware/camera2/CaptureResult;)V

    .line 607
    return-void
.end method
