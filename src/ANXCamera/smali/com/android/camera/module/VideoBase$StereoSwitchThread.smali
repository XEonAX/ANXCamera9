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

    .line 1237
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    .line 1242
    return-void
.end method

.method public run()V
    .locals 2

    .line 1246
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->closeCamera()V

    .line 1247
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_0

    .line 1248
    return-void

    .line 1251
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->openCamera()V

    .line 1253
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->hasCameraException()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1254
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraException()V

    .line 1255
    return-void

    .line 1257
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_2

    .line 1258
    return-void

    .line 1261
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetZoom()V

    .line 1262
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetExposure()V

    .line 1263
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onCameraOpened()V

    .line 1264
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->readVideoPreferences()V

    .line 1265
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->resizeForPreviewAspectRatio()V

    .line 1266
    iget-boolean v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->mCancelled:Z

    if-eqz v0, :cond_3

    .line 1267
    return-void

    .line 1269
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->startPreview()V

    .line 1270
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-virtual {v0}, Lcom/android/camera/module/VideoBase;->onPreviewStart()V

    .line 1271
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$StereoSwitchThread;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1272
    return-void
.end method
