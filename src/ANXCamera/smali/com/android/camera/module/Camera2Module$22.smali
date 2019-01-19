.class Lcom/android/camera/module/Camera2Module$22;
.super Ljava/lang/Object;
.source "Camera2Module.java"

# interfaces
.implements Lcom/android/camera/SensorStateManager$SensorStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 4605
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isWorking()Z
    .locals 1

    .line 4622
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notifyDevicePostureChanged()V
    .locals 0

    .line 4670
    return-void
.end method

.method public onDeviceBecomeStable()V
    .locals 0

    .line 4618
    return-void
.end method

.method public onDeviceBeginMoving()V
    .locals 1

    .line 4636
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4637
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getEdgeShutterView()Lcom/android/camera/ui/V9EdgeShutterView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/V9EdgeShutterView;->onDeviceMoving()V

    .line 4639
    :cond_0
    return-void
.end method

.method public onDeviceKeepMoving(D)V
    .locals 2

    .line 4627
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1300(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 4628
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v1, 0x1

    .line 4629
    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isEvAdjusted(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4630
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1300(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onDeviceKeepMoving(D)V

    .line 4632
    :cond_0
    return-void
.end method

.method public onDeviceKeepStable()V
    .locals 0

    .line 4644
    return-void
.end method

.method public onDeviceOrientationChanged(FZ)V
    .locals 3

    .line 4648
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iput p1, p2, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    .line 4650
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p2}, Lcom/android/camera/module/Camera2Module;->getCameraState()I

    move-result p2

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    .line 4651
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    .line 4652
    invoke-virtual {v0}, Lcom/android/camera/Camera;->getSensorStateManager()Lcom/android/camera/SensorStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isDeviceLying()Z

    move-result v0

    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v1, v1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v2, v2, Lcom/android/camera/module/Camera2Module;->mDeviceRotation:F

    .line 4653
    invoke-static {v1, v2}, Lcom/android/camera/Util;->getShootRotation(Landroid/app/Activity;F)F

    move-result v1

    .line 4651
    invoke-virtual {p2, v0, v1}, Lcom/android/camera/effect/EffectController;->setDeviceRotation(ZF)V

    .line 4655
    :cond_0
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$3400(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object p2

    const/16 v0, 0x21

    invoke-virtual {p2, v0}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 4656
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean p2, p2, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez p2, :cond_1

    .line 4658
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget p2, p2, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    invoke-static {p1, p2}, Lcom/android/camera/Util;->roundOrientation(II)I

    move-result p1

    .line 4659
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p2}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p2

    .line 4660
    add-int/2addr p2, p1

    rem-int/lit16 p2, p2, 0x168

    .line 4662
    iget-object v1, p0, Lcom/android/camera/module/Camera2Module$22;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v1}, Lcom/android/camera/module/Camera2Module;->access$3400(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object v1

    invoke-virtual {v1, v0, p1, p2}, Lcom/android/camera/module/Camera2Module$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 4664
    :cond_1
    return-void
.end method

.method public onDeviceRotationChanged([F)V
    .locals 0

    .line 4675
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 0

    .line 4680
    return-void
.end method
