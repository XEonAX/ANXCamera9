.class Lcom/android/camera/module/loader/camera2/CameraTestManager$8;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "CameraTestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;->captureStillPicture(Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;I)V
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

    .line 662
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$8;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

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

    .line 669
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$8;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->resumePreview()V

    .line 671
    return-void
.end method
