.class Lcom/android/camera/Camera$LogThread;
.super Ljava/lang/Thread;
.source "Camera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LogThread"
.end annotation


# instance fields
.field private volatile mRunFlag:Z

.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0

    .line 1327
    iput-object p1, p0, Lcom/android/camera/Camera$LogThread;->this$0:Lcom/android/camera/Camera;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1328
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/Camera$LogThread;->mRunFlag:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1336
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera/Camera$LogThread;->mRunFlag:Z

    if-eqz v0, :cond_1

    .line 1338
    const-wide/16 v0, 0xa

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 1339
    iget-object v0, p0, Lcom/android/camera/Camera$LogThread;->this$0:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1340
    iget-object v0, p0, Lcom/android/camera/Camera$LogThread;->this$0:Lcom/android/camera/Camera;

    iget-object v0, v0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-static {}, Lcom/android/camera/Util;->getDebugInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1341
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1346
    :cond_0
    goto :goto_0

    .line 1343
    :catch_0
    move-exception v0

    .line 1344
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1345
    nop

    .line 1348
    :cond_1
    return-void
.end method

.method public setRunFlag(Z)V
    .locals 0

    .line 1331
    iput-boolean p1, p0, Lcom/android/camera/Camera$LogThread;->mRunFlag:Z

    .line 1332
    return-void
.end method
