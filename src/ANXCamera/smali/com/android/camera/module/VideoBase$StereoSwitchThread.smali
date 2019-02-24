.class public Lcom/android/camera/module/VideoBase$StereoSwitchThread;
.super Ljava/lang/Thread;
.source "VideoBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/VideoBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "StereoSwitchThread"
.end annotation


# instance fields
.field private volatile mCancelled:Z

.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method protected constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0

    .line 1250
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1254
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    .line 1255
    return-void
.end method

.method public run()V
    .locals 2

    .line 1259
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->closeCamera()V

    .line 1260
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_0

    .line 1261
    return-void

    .line 1264
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->openCamera()V

    .line 1266
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->hasCameraException()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1267
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    .line 1268
    return-void

    .line 1270
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_2

    .line 1271
    return-void

    .line 1274
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetZoom()V

    .line 1275
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetExposure()V

    .line 1276
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 1277
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->readVideoPreferences()V

    .line 1278
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->resizeForPreviewAspectRatio()V

    .line 1279
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_3

    .line 1280
    return-void

    .line 1282
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 1283
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    .line 1284
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1285
    return-void
.end method
