.class public interface abstract Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;
.super Ljava/lang/Object;
.source "ReprocessData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/ReprocessData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnDataAvailableListener"
.end annotation


# virtual methods
.method public abstract onError(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onJpegAvailable([BLjava/lang/String;)V
.end method

.method public abstract onYuvAvailable(Landroid/media/Image;Ljava/lang/String;)V
.end method
