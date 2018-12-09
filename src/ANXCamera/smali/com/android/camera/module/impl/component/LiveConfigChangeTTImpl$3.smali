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

    .line 392
    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 407
    iget-object v0, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$600(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    .line 408
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/LiveModule;->stopVideoRecording(ZZ)V

    .line 409
    return-void
.end method

.method public onTick(J)V
    .locals 2

    .line 395
    long-to-float p1, p1

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float/2addr p1, p2

    iget-object p2, p0, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl$3;->this$0:Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;

    .line 396
    invoke-static {p2}, Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;->access$500(Lcom/android/camera/module/impl/component/LiveConfigChangeTTImpl;)F

    move-result p2

    div-float/2addr p1, p2

    float-to-long p1, p1

    const-wide/16 v0, 0x3b6

    add-long/2addr p1, v0

    const-wide/16 v0, 0x1c2

    sub-long/2addr p1, v0

    .line 395
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object p1

    .line 398
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    .line 399
    const/16 v0, 0xa2

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    .line 400
    if-eqz p2, :cond_0

    .line 401
    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->updateRecordingTime(Ljava/lang/String;)V

    .line 403
    :cond_0
    return-void
.end method
