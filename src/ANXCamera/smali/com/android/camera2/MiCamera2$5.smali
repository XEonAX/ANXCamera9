.class Lcom/android/camera2/MiCamera2$5;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->prepareVideoSnapshotImageReader(Lcom/android/camera/CameraSize;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    .line 366
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 2

    .line 369
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 370
    if-nez p1, :cond_0

    .line 371
    return-void

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$500(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2Shot;

    move-result-object v0

    if-nez v0, :cond_1

    .line 374
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onImageAvailable: NO video image processor!"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 376
    return-void

    .line 378
    :cond_1
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$5;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$500(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2Shot;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/android/camera2/MiCamera2Shot;->onImageReceived(Landroid/media/Image;I)V

    .line 379
    return-void
.end method
