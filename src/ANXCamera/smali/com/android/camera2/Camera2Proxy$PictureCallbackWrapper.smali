.class public Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;
.super Ljava/lang/Object;
.source "Camera2Proxy.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/Camera2Proxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PictureCallbackWrapper"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 495
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureShutter()V
    .locals 0

    .line 518
    return-void
.end method

.method public onCaptureStart(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/android/camera/CameraSize;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    .line 497
    const/4 p1, 0x0

    return-object p1
.end method

.method public onPictureTaken([B)V
    .locals 0

    .line 508
    return-void
.end method

.method public onPictureTakenFinished(Z)V
    .locals 0

    .line 513
    return-void
.end method

.method public onPictureTakenImageConsumed(Landroid/media/Image;)Z
    .locals 0

    .line 502
    const/4 p1, 0x0

    return p1
.end method
