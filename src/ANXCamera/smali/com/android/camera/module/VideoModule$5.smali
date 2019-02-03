.class Lcom/android/camera/module/VideoModule$5;
.super Landroid/os/CountDownTimer;
.source "VideoModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/VideoModule;->countDownForVideoBokeh()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoModule;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoModule;JJ)V
    .locals 0

    .line 1478
    iput-object p1, p0, Lcom/android/camera/module/VideoModule$5;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 1490
    iget-object v0, p0, Lcom/android/camera/module/VideoModule$5;->this$0:Lcom/android/camera/module/VideoModule;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/VideoModule;->stopVideoRecording(ZZ)V

    .line 1491
    return-void
.end method

.method public onTick(J)V
    .locals 2

    .line 1481
    const-wide/16 v0, 0x3b6

    add-long/2addr p1, v0

    const-wide/16 v0, 0x1c2

    sub-long/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/android/camera/Util;->millisecondToTimeString(JZ)Ljava/lang/String;

    move-result-object p1

    .line 1483
    iget-object p2, p0, Lcom/android/camera/module/VideoModule$5;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {p2}, Lcom/android/camera/module/VideoModule;->access$200(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 1484
    iget-object p2, p0, Lcom/android/camera/module/VideoModule$5;->this$0:Lcom/android/camera/module/VideoModule;

    invoke-static {p2}, Lcom/android/camera/module/VideoModule;->access$200(Lcom/android/camera/module/VideoModule;)Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->updateRecordingTime(Ljava/lang/String;)V

    .line 1486
    :cond_0
    return-void
.end method
