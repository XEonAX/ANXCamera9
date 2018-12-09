.class Lcom/android/camera/module/Panorama3Module$MainHandler;
.super Landroid/os/Handler;
.source "Panorama3Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/Panorama3Module;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module;)V
    .locals 0

    .line 316
    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    .line 316
    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$MainHandler;-><init>(Lcom/android/camera/module/Panorama3Module;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 319
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->isCreated()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 320
    invoke-virtual {p0, v1}, Lcom/android/camera/module/Panorama3Module$MainHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 321
    return-void

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    if-nez v0, :cond_1

    .line 325
    return-void

    .line 328
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0x80

    const/4 v3, 0x2

    if-eq v0, v3, :cond_8

    const/16 v4, 0x11

    if-eq v0, v4, :cond_7

    const/16 v3, 0x2d

    if-eq v0, v3, :cond_6

    const/16 v1, 0x33

    const/4 v3, 0x1

    if-eq v0, v1, :cond_5

    const/16 v1, 0x35

    if-eq v0, v1, :cond_4

    packed-switch v0, :pswitch_data_0

    .line 330
    sget-boolean v0, Lcom/android/camera/module/BaseModule;->DEBUG:Z

    if-nez v0, :cond_2

    .line 333
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "no consumer for this message: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 331
    :cond_2
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

    .line 351
    :pswitch_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iput-boolean v3, p1, Lcom/android/camera/module/Panorama3Module;->mOpenCameraFail:Z

    .line 352
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Panorama3Module;->onCameraException()V

    .line 353
    goto/16 :goto_1

    .line 363
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget p1, p1, Lcom/android/camera/CameraSize;->width:I

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    iget v0, v0, Lcom/android/camera/CameraSize;->height:I

    invoke-static {p1, v0}, Lcom/android/camera/CameraSettings;->getUIStyleByPreview(II)I

    move-result p1

    .line 364
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget v0, v0, Lcom/android/camera/module/Panorama3Module;->mUIStyle:I

    if-eq p1, v0, :cond_3

    .line 365
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iput p1, v0, Lcom/android/camera/module/Panorama3Module;->mUIStyle:I

    .line 367
    :cond_3
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$200(Lcom/android/camera/module/Panorama3Module;)V

    .line 368
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$300(Lcom/android/camera/module/Panorama3Module;)V

    .line 369
    goto :goto_1

    .line 377
    :cond_4
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {p1}, Lcom/android/camera/module/Panorama3Module;->access$400(Lcom/android/camera/module/Panorama3Module;)V

    goto :goto_1

    .line 356
    :cond_5
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_9

    .line 357
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iput-boolean v3, p1, Lcom/android/camera/module/Panorama3Module;->mOpenCameraFail:Z

    .line 358
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Panorama3Module;->onCameraException()V

    goto :goto_1

    .line 372
    :cond_6
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1, v1}, Lcom/android/camera/module/Panorama3Module;->setActivity(Lcom/android/camera/Camera;)V

    .line 373
    goto :goto_1

    .line 342
    :cond_7
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {p1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 343
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 344
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Panorama3Module;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 345
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module;->mMainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    .line 346
    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getScreenDelay()I

    move-result v0

    int-to-long v0, v0

    .line 345
    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 347
    goto :goto_1

    .line 337
    :cond_8
    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$MainHandler;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Panorama3Module;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 338
    nop

    .line 380
    :cond_9
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
