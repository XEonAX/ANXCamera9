.class Lcom/android/camera/module/VideoBase$4;
.super Ljava/lang/Object;
.source "VideoBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/VideoBase;->exitSavePowerMode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/VideoBase;


# direct methods
.method constructor <init>(Lcom/android/camera/module/VideoBase;)V
    .locals 0

    .line 496
    iput-object p1, p0, Lcom/android/camera/module/VideoBase$4;->this$0:Lcom/android/camera/module/VideoBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 499
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$4;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    if-eqz v0, :cond_0

    .line 500
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$4;->this$0:Lcom/android/camera/module/VideoBase;

    iget-object v0, v0, Lcom/android/camera/module/VideoBase;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->restoreWindowBrightness()V

    .line 501
    iget-object v0, p0, Lcom/android/camera/module/VideoBase$4;->this$0:Lcom/android/camera/module/VideoBase;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/camera/module/VideoBase;->mSavePowerMode:Z

    .line 503
    :cond_0
    return-void
.end method
