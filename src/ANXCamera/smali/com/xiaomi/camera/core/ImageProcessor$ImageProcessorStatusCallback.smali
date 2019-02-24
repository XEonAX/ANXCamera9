.class public interface abstract Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;
.super Ljava/lang/Object;
.source "ImageProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/ImageProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ImageProcessorStatusCallback"
.end annotation


# virtual methods
.method public abstract onImageProcessFailed(Landroid/media/Image;Ljava/lang/String;)V
.end method

.method public abstract onImageProcessStart(J)V
.end method

.method public abstract onImageProcessed(Landroid/media/Image;I)V
.end method

.method public abstract onOriginalImageClosed(Landroid/media/Image;)V
.end method
