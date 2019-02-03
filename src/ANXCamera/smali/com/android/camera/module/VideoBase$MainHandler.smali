.class Lcom/android/camera/module/VideoBase$MainHandler;
.super Landroid/os/Handler;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0

    .line 172
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/VideoBase;Lcom/android/camera/module/VideoBase$1;)V
    .locals 0

    .line 172
    invoke-direct {p0, p1}, Lcom/android/camera/module/VideoBase$MainHandler;-><init>(Lcom/android/camera/module/VideoBase;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 175
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 176
    invoke-virtual {p0, v1}, Lcom/android/camera/module/VideoBase$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 177
    return-void

    .line 180
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-nez v0, :cond_1

    .line 181
    return-void

    .line 184
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x80

    const/4 v3, 0x4

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 186
    sget-boolean v0, Lcom/android/camera/module/BaseModule;->DEBUG:Z

    if-nez v0, :cond_6

    .line 189
    sget-object v0, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no consumer for this message: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 274
    :sswitch_0
    sget-object p1, Lcom/android/camera/module/VideoBase;->TAG:Ljava/lang/String;

    const-string v0, "autoFocus timeout!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mFocusManager:Lcom/android/camera/module/loader/camera2/FocusManager2;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/FocusManager2;->resetFocused()V

    .line 276
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->onWaitingFocusFinished()Z

    goto/16 :goto_2

    .line 270
    :sswitch_1
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    const/16 v0, 0x9

    const v1, 0x7f090224

    invoke-virtual {p1, v0, v1, v3}, Lcom/android/camera/module/VideoBase;->updateTipMessage(III)V

    .line 271
    goto/16 :goto_2

    .line 204
    :sswitch_2
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->enterSavePowerMode()V

    .line 205
    goto/16 :goto_2

    .line 233
    :sswitch_3
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1, v6, v5}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 234
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_5

    .line 235
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-boolean v6, p1, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    .line 236
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    goto/16 :goto_2

    .line 266
    :sswitch_4
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->onWaitStopCallbackTimeout()V

    .line 267
    goto/16 :goto_2

    .line 262
    :sswitch_5
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1, v1}, Lcom/android/camera/module/VideoBase;->setActivity(Lcom/android/camera/Camera;)V

    .line 263
    goto/16 :goto_2

    .line 254
    :sswitch_6
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->restoreMusicSound()V

    .line 255
    goto/16 :goto_2

    .line 208
    :sswitch_7
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->updateRecordingTime()V

    .line 209
    goto/16 :goto_2

    .line 246
    :sswitch_8
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 247
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    const/4 v0, 0x6

    const v1, 0x7f090196

    invoke-virtual {p1, v0, v1, v4}, Lcom/android/camera/module/VideoBase;->updateTipMessage(III)V

    goto/16 :goto_2

    .line 258
    :sswitch_9
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-lez v1, :cond_2

    move v1, v6

    goto :goto_0

    :cond_2
    move v1, v5

    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    if-lez p1, :cond_3

    move v5, v6

    nop

    :cond_3
    invoke-static {v0, v1, v5}, Lcom/android/camera/module/VideoBase;->access$000(Lcom/android/camera/module/VideoBase;ZZ)V

    .line 259
    goto/16 :goto_2

    .line 197
    :sswitch_a
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 198
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 199
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 200
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->getScreenDelay()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 201
    goto :goto_2

    .line 227
    :sswitch_b
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1, v6, v5}, Lcom/android/camera/module/VideoBase;->stopVideoRecording(ZZ)V

    .line 228
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-boolean v6, p1, Lcom/android/camera/module/VideoBase;->mOpenCameraFail:Z

    .line 229
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    .line 230
    goto :goto_2

    .line 241
    :sswitch_c
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    .line 242
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iput-object v1, p1, Lcom/android/camera/module/VideoBase;->mStereoSwitchThread:Lcom/android/camera/module/VideoBase$StereoSwitchThread;

    .line 243
    goto :goto_2

    .line 217
    :sswitch_d
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-static {p1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget v0, v0, Lcom/android/camera/module/VideoBase;->mDisplayRotation:I

    if-eq p1, v0, :cond_4

    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-boolean p1, p1, Lcom/android/camera/module/VideoBase;->mMediaRecorderRecording:Z

    if-nez p1, :cond_4

    .line 219
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 221
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-wide v4, p1, Lcom/android/camera/module/VideoBase;->mOnResumeTime:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x1388

    cmp-long p1, v0, v4

    if-gez p1, :cond_5

    .line 222
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object p1, p1, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x64

    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_2

    .line 193
    :goto_1
    :sswitch_e
    iget-object p1, p0, Lcom/android/camera/module/VideoBase$MainHandler;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {p1}, Lcom/android/camera/module/VideoBase;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 194
    nop

    .line 279
    :cond_5
    :goto_2
    return-void

    .line 187
    :cond_6
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

    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_e
        0x4 -> :sswitch_d
        0x9 -> :sswitch_c
        0xa -> :sswitch_b
        0x11 -> :sswitch_a
        0x23 -> :sswitch_9
        0x28 -> :sswitch_8
        0x2a -> :sswitch_7
        0x2b -> :sswitch_6
        0x2d -> :sswitch_5
        0x2e -> :sswitch_4
        0x33 -> :sswitch_3
        0x34 -> :sswitch_2
        0x36 -> :sswitch_1
        0x37 -> :sswitch_0
    .end sparse-switch
.end method
