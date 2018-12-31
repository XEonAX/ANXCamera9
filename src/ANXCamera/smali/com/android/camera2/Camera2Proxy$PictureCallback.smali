.class public interface abstract Lcom/android/camera2/Camera2Proxy$PictureCallback;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/Camera2Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PictureCallback"
.end annotation


# virtual methods
.method public abstract onCaptureStart(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/android/camera/CameraSize;)Lcom/xiaomi/camera/core/ParallelTaskData;
.end method

.method public abstract onPictureTaken([B)V
.end method

.method public abstract onPictureTakenFinished(Z)V
.end method

.method public abstract onPictureTakenImageConsumed(Landroid/media/Image;)Z
.end method
