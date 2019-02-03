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

    .line 1247
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    .line 1252
    return-void
.end method

.method public run()V
    .locals 2

    .line 1256
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->closeCamera()V

    .line 1257
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_0

    .line 1258
    return-void

    .line 1261
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->openCamera()V

    .line 1263
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->hasCameraException()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1264
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    .line 1265
    return-void

    .line 1267
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_2

    .line 1268
    return-void

    .line 1271
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetZoom()V

    .line 1272
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetExposure()V

    .line 1273
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 1274
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->readVideoPreferences()V

    .line 1275
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->resizeForPreviewAspectRatio()V

    .line 1276
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_3

    .line 1277
    return-void

    .line 1279
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 1280
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    .line 1281
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1282
    return-void
.end method
