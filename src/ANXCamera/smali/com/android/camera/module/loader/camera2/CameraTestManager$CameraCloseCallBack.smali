.class public interface abstract Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;
.super Ljava/lang/Object;
.source "CameraTestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CameraCloseCallBack"
.end annotation


# virtual methods
.method public abstract onCameraClosed(Landroid/hardware/camera2/CameraDevice;)V
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
