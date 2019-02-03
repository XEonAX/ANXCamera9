.class Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;
.super Landroid/os/CountDownTimer;
.source "LiveConfigChangeTTImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->updateRecordingTime()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;JJ)V
    .locals 0

    .line 569
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 577
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$1100(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    .line 578
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 579
    return-void
.end method

.method public onTick(J)V
    .locals 1

    .line 572
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0, p1, p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$1000(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;J)V

    .line 573
    return-void
.end method
