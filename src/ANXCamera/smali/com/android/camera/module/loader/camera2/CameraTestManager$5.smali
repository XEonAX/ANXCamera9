.class Lcom/android/camera/module/loader/camera2/CameraTestManager$5;
.super Ljava/lang/Object;
.source "CameraTestManager.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


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

    .line 278
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$5;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 2

    .line 282
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 283
    if-nez p1, :cond_0

    .line 284
    return-void

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$5;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$700(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$5;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v1, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$1000(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/media/Image;)[B

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;->onPreviewFrameAvailable([B)V

    .line 288
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 289
    return-void
.end method
