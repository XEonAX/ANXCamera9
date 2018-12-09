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

    .line 115
    iput-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    .line 116
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 117
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 122
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_3

    const/16 v0, 0x9

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1f

    if-eq p1, v0, :cond_1

    const/16 v0, 0x33

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 142
    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_4

    .line 143
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/android/camera/module/LiveModule;->mOpenCameraFail:Z

    .line 144
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->onCameraException()V

    goto :goto_0

    .line 138
    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$200(Lcom/android/camera/module/LiveModule;)V

    .line 139
    goto :goto_0

    .line 149
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    iget-object p1, p1, Lcom/android/camera/module/LiveModule;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    goto :goto_0

    .line 129
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-virtual {p1}, Lcom/android/camera/module/LiveModule;->checkActivityOrientation()V

    .line 132
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$000(Lcom/android/camera/module/LiveModule;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1388

    cmp-long p1, v1, v3

    if-gez p1, :cond_4

    .line 133
    iget-object p1, p0, Lcom/android/camera/module/LiveModule$MainHandler;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {p1}, Lcom/android/camera/module/LiveModule;->access$100(Lcom/android/camera/module/LiveModule;)Lcom/android/camera/module/LiveModule$MainHandler;

    move-result-object p1

    const-wide/16 v1, 0x64

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/camera/module/LiveModule$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 152
    :cond_4
    :goto_0
    return-void
.end method
