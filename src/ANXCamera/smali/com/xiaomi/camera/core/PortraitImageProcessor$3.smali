.class Lcom/xiaomi/camera/core/PortraitImageProcessor$3;
.super Ljava/lang/Object;
.source "PortraitImageProcessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/PortraitImageProcessor;->configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/PortraitImageProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/PortraitImageProcessor;)V
    .locals 0

    .line 185
    iput-object p1, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor$3;->this$0:Lcom/xiaomi/camera/core/PortraitImageProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4

    .line 189
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    .line 190
    const-string v0, "[  EFFECT]"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    .line 191
    invoke-static {}, Lcom/xiaomi/camera/core/PortraitImageProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onImageAvailable: effectImage received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor$3;->this$0:Lcom/xiaomi/camera/core/PortraitImageProcessor;

    iget-object v0, v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/xiaomi/camera/core/PortraitImageProcessor$3;->this$0:Lcom/xiaomi/camera/core/PortraitImageProcessor;

    iget-object v0, v0, Lcom/xiaomi/camera/core/PortraitImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-interface {v0, p1, v1}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->onImageProcessed(Landroid/media/Image;I)V

    .line 195
    :cond_0
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 196
    return-void
.end method
