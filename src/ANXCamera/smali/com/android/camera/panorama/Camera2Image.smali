.class public Lcom/android/camera/panorama/Camera2Image;
.super Lcom/android/camera/panorama/CaptureImage;
.source "Camera2Image.java"


# direct methods
.method public constructor <init>(Landroid/media/Image;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lcom/android/camera/panorama/CaptureImage;-><init>(Landroid/media/Image;)V

    .line 7
    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/android/camera/panorama/Camera2Image;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v0

    return v0
.end method

.method public getImageFormat()Ljava/lang/String;
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/android/camera/panorama/Camera2Image;->mImage:Landroid/media/Image;

    invoke-static {v0}, Lcom/android/camera/panorama/PanoramaGP3ImageFormat;->getImageFormat(Landroid/media/Image;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/android/camera/panorama/Camera2Image;->mImage:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v0

    return v0
.end method
