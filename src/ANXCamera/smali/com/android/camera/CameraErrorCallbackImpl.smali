.class public Lcom/android/camera/CameraErrorCallbackImpl;
.super Ljava/lang/Object;
.source "CameraErrorCallbackImpl.java"

# interfaces
.implements Lcom/android/camera2/Camera2Proxy$CameraErrorCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraErrorCallback"


# instance fields
.field private mWeakActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/ActivityBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mWeakActivity:Ljava/lang/ref/WeakReference;

    .line 33
    return-void
.end method


# virtual methods
.method public onCameraError(Lcom/android/camera2/Camera2Proxy;I)V
    .locals 2

    .line 37
    const/4 p1, 0x5

    if-ne p2, p1, :cond_0

    .line 38
    const-string p1, "CameraErrorCallback"

    const-string v0, "onCameraError: camera service error"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 39
    :cond_0
    const/4 p1, 0x4

    if-ne p2, p1, :cond_1

    .line 40
    const-string p1, "CameraErrorCallback"

    const-string v0, "onCameraError: camera device error"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 41
    :cond_1
    const/4 p1, 0x3

    if-ne p2, p1, :cond_2

    .line 42
    const-string p1, "CameraErrorCallback"

    const-string v0, "onCameraError: camera disabled"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 43
    :cond_2
    const/4 p1, 0x2

    if-ne p2, p1, :cond_3

    .line 44
    const-string p1, "CameraErrorCallback"

    const-string v0, "onCameraError: max camera in use"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 45
    :cond_3
    const/4 p1, 0x1

    if-ne p2, p1, :cond_4

    .line 46
    const-string p1, "CameraErrorCallback"

    const-string v0, "onCameraError: camera in use"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 48
    :cond_4
    const-string p1, "CameraErrorCallback"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCameraError: other error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraError(Ljava/lang/String;)V

    .line 51
    iget-object p1, p0, Lcom/android/camera/CameraErrorCallbackImpl;->mWeakActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ActivityBase;

    .line 52
    if-eqz p1, :cond_6

    .line 53
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p1

    .line 54
    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 55
    invoke-interface {p1}, Lcom/android/camera/module/Module;->notifyError()V

    .line 57
    :cond_5
    goto :goto_1

    .line 58
    :cond_6
    const-string p1, "CameraErrorCallback"

    const-string p2, "mActivity has been collected."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :goto_1
    return-void
.end method
