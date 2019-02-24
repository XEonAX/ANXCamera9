.class public interface abstract Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraPreviewCallback;
.super Ljava/lang/Object;
.source "CameraTestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CameraPreviewCallback"
.end annotation


# virtual methods
.method public abstract onAutoFocusFinish(Z)V
.end method

.method public abstract onPreviewFrameAvailable([B)V
.end method

.method public abstract onPreviewSessionFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
.end method

.method public abstract onPreviewSessionSuccess(Landroid/hardware/camera2/CameraCaptureSession;)V
.end method
