.class Lcom/xiaomi/camera/core/DualCameraProcessor$4;
.super Ljava/lang/Object;
.source "DualCameraProcessor.java"

# interfaces
.implements Lcom/xiaomi/engine/FrameData$FrameStatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/DualCameraProcessor;->processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/DualCameraProcessor;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$4;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFrameImageClosed(Landroid/media/Image;)V
    .locals 3

    .line 144
    invoke-static {}, Lcom/xiaomi/camera/core/DualCameraProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onFrameImageClosed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    iget-object v0, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$4;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    iget-object v0, v0, Lcom/xiaomi/camera/core/DualCameraProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$4;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    iget-object v0, v0, Lcom/xiaomi/camera/core/DualCameraProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-interface {v0, p1}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->onOriginalImageClosed(Landroid/media/Image;)V

    .line 148
    :cond_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->releaseImage(Landroid/media/Image;)V

    .line 149
    return-void
.end method
