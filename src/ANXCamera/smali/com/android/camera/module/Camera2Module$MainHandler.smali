.class Lcom/android/camera/module/Camera2Module$MainHandler;
.super Landroid/os/Handler;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method public constructor <init>(Lcom/android/camera/module/Camera2Module;Landroid/os/Looper;)V
    .locals 0

    .line 2099
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 2100
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2101
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 2105
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2106
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 2107
    return-void

    .line 2110
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-nez v0, :cond_1

    .line 2111
    return-void

    .line 2114
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x80

    const/4 v3, 0x2

    if-eq v0, v3, :cond_b

    const/4 v4, 0x4

    if-eq v0, v4, :cond_a

    const/16 v5, 0x11

    if-eq v0, v5, :cond_9

    const/16 v2, 0x1f

    if-eq v0, v2, :cond_8

    const/16 v2, 0x21

    if-eq v0, v2, :cond_7

    const/16 v2, 0x23

    const/4 v3, 0x0

    const/4 v5, 0x1

    if-eq v0, v2, :cond_4

    const/16 v2, 0x38

    if-eq v0, v2, :cond_3

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    .line 2117
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no consumer for this message: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2200
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getTriggerMode()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/module/Camera2Module;->onShutterButtonClick(I)V

    .line 2201
    goto/16 :goto_1

    .line 2170
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_c

    .line 2171
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean v5, p1, Lcom/android/camera/module/Camera2Module;->mOpenCameraFail:Z

    .line 2172
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->onCameraException()V

    goto/16 :goto_1

    .line 2194
    :pswitch_2
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1400()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Oops, capture timeout later release timeout!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2196
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1, v3}, Lcom/android/camera/module/Camera2Module;->onPictureTakenFinished(Z)V

    .line 2197
    goto/16 :goto_1

    .line 2186
    :pswitch_3
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->isAlive()Z

    move-result p1

    if-nez p1, :cond_2

    .line 2187
    return-void

    .line 2189
    :cond_2
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    .line 2190
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 2191
    goto/16 :goto_1

    .line 2182
    :pswitch_4
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1, v5}, Lcom/android/camera/module/Camera2Module;->setCameraState(I)V

    .line 2183
    goto/16 :goto_1

    .line 2166
    :pswitch_5
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Camera2Module;->setActivity(Lcom/android/camera/Camera;)V

    .line 2167
    goto/16 :goto_1

    .line 2204
    :pswitch_6
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->restartModule()V

    .line 2205
    goto/16 :goto_1

    .line 2126
    :pswitch_7
    goto/16 :goto_1

    .line 2177
    :pswitch_8
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iput-boolean v5, p1, Lcom/android/camera/module/Camera2Module;->mOpenCameraFail:Z

    .line 2178
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->onCameraException()V

    .line 2179
    goto/16 :goto_1

    .line 2120
    :pswitch_9
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->initializeFocusView(Lcom/android/camera/ui/FocusView$ExposureViewListener;)V

    .line 2121
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setObjectViewListener(Lcom/android/camera/ui/ObjectView$ObjectViewListener;)V

    .line 2123
    goto/16 :goto_1

    .line 2208
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 2209
    invoke-interface {p1, v5}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFaceExists(I)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 2210
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->isFocusViewVisible()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mCamera2Device:Lcom/android/camera2/Camera2Proxy;

    .line 2212
    invoke-virtual {p1}, Lcom/android/camera2/Camera2Proxy;->getFocusMode()I

    move-result p1

    if-ne v4, p1, :cond_c

    .line 2213
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->clearFocusView(I)V

    goto/16 :goto_1

    .line 2151
    :cond_4
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-lez v1, :cond_5

    move v1, v5

    goto :goto_0

    :cond_5
    move v1, v3

    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    if-lez p1, :cond_6

    move v3, v5

    nop

    :cond_6
    invoke-static {v0, v1, v3}, Lcom/android/camera/module/Camera2Module;->access$3900(Lcom/android/camera/module/Camera2Module;ZZ)V

    .line 2152
    goto :goto_1

    .line 2143
    :cond_7
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v1, p1}, Lcom/android/camera/module/Camera2Module;->access$3700(Lcom/android/camera/module/Camera2Module;II)V

    .line 2144
    goto :goto_1

    .line 2147
    :cond_8
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3800(Lcom/android/camera/module/Camera2Module;)V

    .line 2148
    goto :goto_1

    .line 2159
    :cond_9
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3600(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object p1

    invoke-virtual {p1, v5}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 2160
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3600(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/android/camera/module/Camera2Module$MainHandler;->removeMessages(I)V

    .line 2161
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 2162
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3600(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->getScreenDelay()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v3, v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 2163
    goto :goto_1

    .line 2134
    :cond_a
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->checkActivityOrientation()V

    .line 2137
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3500(Lcom/android/camera/module/Camera2Module;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long p1, v0, v2

    if-gez p1, :cond_c

    .line 2138
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$3600(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/Camera2Module$MainHandler;

    move-result-object p1

    const-wide/16 v0, 0x64

    invoke-virtual {p1, v4, v0, v1}, Lcom/android/camera/module/Camera2Module$MainHandler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1

    .line 2155
    :cond_b
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$MainHandler;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Camera2Module;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 2156
    nop

    .line 2217
    :cond_c
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2c
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x30
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
