.class Lcom/android/camera/module/BaseModule$3;
.super Ljava/lang/Object;
.source "BaseModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/module/BaseModule;->showDebug(Landroid/hardware/camera2/CaptureResult;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/BaseModule;

.field final synthetic val$isShow:Z

.field final synthetic val$result:Landroid/hardware/camera2/CaptureResult;


# direct methods
.method constructor <init>(Lcom/android/camera/module/BaseModule;ZLandroid/hardware/camera2/CaptureResult;)V
    .locals 0

    .line 1247
    iput-object p1, p0, Lcom/android/camera/module/BaseModule$3;->this$0:Lcom/android/camera/module/BaseModule;

    iput-boolean p2, p0, Lcom/android/camera/module/BaseModule$3;->val$isShow:Z

    iput-object p3, p0, Lcom/android/camera/module/BaseModule$3;->val$result:Landroid/hardware/camera2/CaptureResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1250
    iget-boolean v0, p0, Lcom/android/camera/module/BaseModule$3;->val$isShow:Z

    if-eqz v0, :cond_0

    .line 1251
    iget-object v0, p0, Lcom/android/camera/module/BaseModule$3;->this$0:Lcom/android/camera/module/BaseModule;

    iget-object v0, v0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    iget-object v1, p0, Lcom/android/camera/module/BaseModule$3;->val$result:Landroid/hardware/camera2/CaptureResult;

    invoke-static {v1}, Lcom/android/camera/Util;->getDebugInformation(Landroid/hardware/camera2/CaptureResult;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->showDebugInfo(Ljava/lang/String;)V

    goto :goto_0

    .line 1253
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/BaseModule$3;->this$0:Lcom/android/camera/module/BaseModule;

    iget-object v0, v0, Lcom/android/camera/module/BaseModule;->mActivity:Lcom/android/camera/Camera;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/android/camera/Camera;->showDebugInfo(Ljava/lang/String;)V

    .line 1255
    :goto_0
    return-void
.end method
