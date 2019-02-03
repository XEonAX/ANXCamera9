.class public interface abstract Lcom/xiaomi/camera/core/CaptureDataListener;
.super Ljava/lang/Object;
.source "CaptureDataListener.java"


# virtual methods
.method public abstract onCaptureDataAvailable(Lcom/xiaomi/camera/core/CaptureData;)V
    .param p1    # Lcom/xiaomi/camera/core/CaptureData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onOriginalImageClosed(Landroid/media/Image;)V
.end method
