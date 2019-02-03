.class Lcom/android/camera/module/LiveModule$MainHandler;
.super Landroid/os/Handler;
.source "LiveModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/LiveModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/LiveModule;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/LiveModule;Landroid/os/Looper;)V
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    .line 146
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 147
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 152
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x80

    const/4 v2, 0x2

    if-eq v0, v2, :cond_8

    const/4 v3, 0x4

    if-eq v0, v3, :cond_7

    const/16 v3, 0x9

    if-eq v0, v3, :cond_6

    const/16 v3, 0x11

    if-eq v0, v3, :cond_5

    const/16 v1, 0x1f

    if-eq v0, v1, :cond_4

    const/16 v1, 0x23

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    const/16 p1, 0x33

    if-eq v0, p1, :cond_0

    goto/16 :goto_2

    .line 176
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_9

    .line 177
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iput-boolean v2, p1, Lcom/android/camera/module/LiveModule;->mOpenCameraFail:Z

    .line 178
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onCameraException()V

    goto/16 :goto_2

    .line 172
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iget v1, p1, Landroid/os/Message;->arg1:I

    const/4 v3, 0x0

    if-lez v1, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move v1, v3

    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    if-lez p1, :cond_3

    goto :goto_1

    :cond_3
    move v2, v3

    :goto_1
    invoke-static {v0, v1, v2}, Lcom/android/camera/module/LiveModule;->access$300(Lcom/android/camera/module/LiveModule;ZZ)V

    .line 173
    goto :goto_2

    .line 168
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$200(Lcom/android/camera/module/LiveModule;)V

    .line 169
    goto :goto_2

    .line 191
    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 192
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/android/camera/module/LiveModule$MainHandler;->removeMessages(I)V

    .line 193
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->addFlags(I)V

    .line 194
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0}, Lcom/android/camera/module/LiveModule;->getScreenDelay()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v2, v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_2

    .line 183
    :cond_6
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 184
    goto :goto_2

    .line 159
    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->checkActivityOrientation()V

    .line 162
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$000(Lcom/android/camera/module/LiveModule;)J

    move-result-wide v4

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x1388

    cmp-long p1, v0, v4

    if-gez p1, :cond_9

    .line 163
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;

    move-result-object p1

    const-wide/16 v0, 0x64

    invoke-virtual {p1, v3, v0, v1}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_2

    .line 187
    :cond_8
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 188
    nop

    .line 197
    :cond_9
    :goto_2
    return-void
.end method
