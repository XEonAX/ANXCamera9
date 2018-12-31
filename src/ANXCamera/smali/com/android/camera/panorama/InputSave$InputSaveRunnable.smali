.class Lcom/android/camera/panorama/InputSave$InputSaveRunnable;
.super Ljava/lang/Object;
.source "InputSave.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/panorama/InputSave;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InputSaveRunnable"
.end annotation


# instance fields
.field final imageFormat:Ljava/lang/String;

.field srcImage:Lcom/android/camera/panorama/CaptureImage;

.field final synthetic this$0:Lcom/android/camera/panorama/InputSave;


# direct methods
.method public constructor <init>(Lcom/android/camera/panorama/InputSave;Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->this$0:Lcom/android/camera/panorama/InputSave;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p3, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    .line 91
    iput-object p2, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    .line 92
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 96
    iget-object v0, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->image()Landroid/media/Image;

    move-result-object v0

    .line 97
    if-nez v0, :cond_0

    .line 98
    const-string v0, "InputSave"

    const-string v1, "save failed, image is null"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void

    .line 102
    :cond_0
    const-string v1, "InputSave"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "X"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", imageFormat = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const-string v1, "YUV420_PLANAR"

    iget-object v2, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 106
    new-instance v1, Lcom/android/camera/panorama/ConvertFromYuv420Planar;

    invoke-direct {v1}, Lcom/android/camera/panorama/ConvertFromYuv420Planar;-><init>()V

    invoke-virtual {v1, v0}, Lcom/android/camera/panorama/ConvertFromYuv420Planar;->image2bytes(Landroid/media/Image;)[B

    move-result-object v0

    goto :goto_0

    .line 107
    :cond_1
    const-string v1, "YUV420_SEMIPLANAR"

    iget-object v2, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 108
    new-instance v1, Lcom/android/camera/panorama/ConvertFromYuv420SemiPlanar;

    invoke-direct {v1}, Lcom/android/camera/panorama/ConvertFromYuv420SemiPlanar;-><init>()V

    invoke-virtual {v1, v0}, Lcom/android/camera/panorama/ConvertFromYuv420SemiPlanar;->image2bytes(Landroid/media/Image;)[B

    move-result-object v0

    goto :goto_0

    .line 109
    :cond_2
    const-string v1, "YVU420_SEMIPLANAR"

    iget-object v2, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 110
    new-instance v1, Lcom/android/camera/panorama/ConvertFromYvu420SemiPlanar;

    invoke-direct {v1}, Lcom/android/camera/panorama/ConvertFromYvu420SemiPlanar;-><init>()V

    invoke-virtual {v1, v0}, Lcom/android/camera/panorama/ConvertFromYvu420SemiPlanar;->image2bytes(Landroid/media/Image;)[B

    move-result-object v0

    .line 116
    :goto_0
    iget-object v1, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    invoke-virtual {v1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 118
    iget-object v1, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->this$0:Lcom/android/camera/panorama/InputSave;

    iget-object v2, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->imageFormat:Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/android/camera/panorama/InputSave;->access$000(Lcom/android/camera/panorama/InputSave;[BLjava/lang/String;)V

    .line 119
    return-void

    .line 112
    :cond_3
    const-string v0, "InputSave"

    const-string v1, "Image format error."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-object v0, p0, Lcom/android/camera/panorama/InputSave$InputSaveRunnable;->srcImage:Lcom/android/camera/panorama/CaptureImage;

    invoke-virtual {v0}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 114
    return-void
.end method
