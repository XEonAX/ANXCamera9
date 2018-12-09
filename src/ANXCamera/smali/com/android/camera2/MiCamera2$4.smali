.class Lcom/android/camera2/MiCamera2$4;
.super Ljava/lang/Object;
.source "MiCamera2.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->prepareRawImageReader(Lcom/android/camera/CameraSize;)V
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

    .line 293
    iput-object p1, p0, Lcom/android/camera2/MiCamera2$4;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 2

    .line 296
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 297
    iget-object v0, p0, Lcom/android/camera2/MiCamera2$4;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, v0, Lcom/android/camera2/MiCamera2;->mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    if-eqz v0, :cond_0

    .line 298
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object v0

    .line 299
    if-eqz v0, :cond_0

    .line 300
    iget-object v1, p0, Lcom/android/camera2/MiCamera2$4;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v1, v1, Lcom/android/camera2/MiCamera2;->mRawCallBack:Lcom/android/camera2/Camera2Proxy$PictureCallback;

    invoke-interface {v1, v0}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTaken([B)V

    .line 303
    :cond_0
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 304
    return-void
.end method
