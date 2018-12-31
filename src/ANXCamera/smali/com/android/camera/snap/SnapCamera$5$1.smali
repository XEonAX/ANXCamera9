.class Lcom/android/camera/snap/SnapCamera$5$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/snap/SnapCamera$5;->onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/snap/SnapCamera$5;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera$5;)V
    .locals 0

    .line 633
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$5$1;->this$1:Lcom/android/camera/snap/SnapCamera$5;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 0

    .line 636
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$5$1;->this$1:Lcom/android/camera/snap/SnapCamera$5;

    iget-object p1, p1, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$900(Lcom/android/camera/snap/SnapCamera;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 638
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$5$1;->this$1:Lcom/android/camera/snap/SnapCamera$5;

    iget-object p1, p1, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$1000(Lcom/android/camera/snap/SnapCamera;)Landroid/media/MediaRecorder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaRecorder;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 643
    goto :goto_0

    .line 639
    :catch_0
    move-exception p1

    .line 640
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->access$100()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "failed to start media recorder: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 641
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 642
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$5$1;->this$1:Lcom/android/camera/snap/SnapCamera$5;

    iget-object p1, p1, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$1100(Lcom/android/camera/snap/SnapCamera;)V

    .line 644
    :goto_0
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$5$1;->this$1:Lcom/android/camera/snap/SnapCamera$5;

    iget-object p1, p1, Lcom/android/camera/snap/SnapCamera$5;->this$0:Lcom/android/camera/snap/SnapCamera;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/android/camera/snap/SnapCamera;->access$902(Lcom/android/camera/snap/SnapCamera;Z)Z

    .line 646
    :cond_0
    return-void
.end method
