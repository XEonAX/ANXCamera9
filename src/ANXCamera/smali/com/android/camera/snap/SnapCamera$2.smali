.class Lcom/android/camera/snap/SnapCamera$2;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "SnapCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/snap/SnapCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/snap/SnapCamera;


# direct methods
.method constructor <init>(Lcom/android/camera/snap/SnapCamera;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 1
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 173
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onDisconnected"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {p1}, Lcom/android/camera/snap/SnapCamera;->release()V

    .line 176
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 180
    invoke-static {}, Lcom/android/camera/snap/SnapCamera;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-virtual {p1}, Lcom/android/camera/snap/SnapCamera;->release()V

    .line 183
    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 163
    iget-object v0, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    monitor-enter v0

    .line 164
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {v1, p1}, Lcom/android/camera/snap/SnapCamera;->access$002(Lcom/android/camera/snap/SnapCamera;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    .line 165
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$500(Lcom/android/camera/snap/SnapCamera;)Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 167
    iget-object p1, p0, Lcom/android/camera/snap/SnapCamera$2;->this$0:Lcom/android/camera/snap/SnapCamera;

    invoke-static {p1}, Lcom/android/camera/snap/SnapCamera;->access$500(Lcom/android/camera/snap/SnapCamera;)Lcom/android/camera/snap/SnapCamera$SnapStatusListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/snap/SnapCamera$SnapStatusListener;->onCameraOpened()V

    .line 169
    :cond_0
    return-void

    .line 165
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
