.class Lcom/android/camera/module/loader/camera2/CameraTestManager$1;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "CameraTestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/CameraTestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/CameraTestManager;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 209
    const-string v0, "mCameraOpenCallback"

    const-string v1, "close"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$002(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 211
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$500(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;->onCameraClosed(Landroid/hardware/camera2/CameraDevice;)V

    .line 212
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1, v1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$502(Lcom/android/camera/module/loader/camera2/CameraTestManager;Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;)Lcom/android/camera/module/loader/camera2/CameraTestManager$CameraCloseCallBack;

    .line 213
    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 218
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 222
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$400(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    const/4 v0, 0x3

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2Result;->create(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object v0

    .line 223
    invoke-static {p2}, Lcom/android/camera/constant/ExceptionConstant;->transFromCamera2Error(I)I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/android/camera/module/loader/camera2/Camera2Result;->setCameraError(I)Lcom/android/camera/module/loader/camera2/Camera2Result;

    move-result-object p2

    .line 222
    invoke-interface {p1, p2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 224
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$400(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 225
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 194
    const-string v0, "mCameraOpenCallback"

    const-string v1, "open"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0, p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$002(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 197
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$300(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Landroid/hardware/camera2/CameraManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {v1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$200(Lcom/android/camera/module/loader/camera2/CameraTestManager;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$102(Lcom/android/camera/module/loader/camera2/CameraTestManager;Landroid/hardware/camera2/CameraCharacteristics;)Landroid/hardware/camera2/CameraCharacteristics;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    goto :goto_0

    .line 198
    :catch_0
    move-exception p1

    .line 199
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 203
    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$400(Lcom/android/camera/module/loader/camera2/CameraTestManager;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 204
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/CameraTestManager$1;->this$0:Lcom/android/camera/module/loader/camera2/CameraTestManager;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/android/camera/module/loader/camera2/CameraTestManager;->access$402(Lcom/android/camera/module/loader/camera2/CameraTestManager;Lio/reactivex/ObservableEmitter;)Lio/reactivex/ObservableEmitter;

    .line 205
    return-void
.end method
