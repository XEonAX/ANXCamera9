.class Lcom/android/camera/module/loader/camera2/CameraTestManager$4;
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

    .line 260
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 5

    .line 264
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 265
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object v1

    .line 266
    if-eqz v1, :cond_0

    .line 267
    iget-object v2, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v2}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$900(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    .line 268
    invoke-static {v3}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$800(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/media/ImageReader;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/ImageReader;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$4;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    .line 269
    invoke-static {v4}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$800(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/media/ImageReader;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/ImageReader;->getHeight()I

    move-result v4

    .line 267
    invoke-interface {v2, v1, v3, v4}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCaptureCallback;->onPictureTaken([BII)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 271
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 272
    :cond_1
    return-void

    .line 271
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 264
    :catch_0
    move-exception v0

    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    :goto_0
    if-eqz p1, :cond_3

    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {p1}, Landroid/media/Image;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    :cond_3
    :goto_1
    throw v1
.end method
