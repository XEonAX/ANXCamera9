.class public interface abstract Lcom/android/camera2/Camera2Proxy$FaceDetectionCallback;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/Camera2Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FaceDetectionCallback"
.end annotation


# virtual methods
.method public abstract isFaceDetectStarted()Z
.end method

.method public abstract isUseFaceInfo()Z
.end method

.method public abstract onFaceDetected([Lcom/android/camera2/CameraHardwareFace;Lcom/android/camera/effect/FaceAnalyzeInfo;)V
.end method
