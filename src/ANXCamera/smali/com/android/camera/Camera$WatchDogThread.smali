.class Lcom/android/camera/Camera$WatchDogThread;
.super Ljava/lang/Thread;
.source "Camera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WatchDogThread"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WatchDogThread"

.field private static final TIMEOUT_INTERVAL:I = 0x1388


# instance fields
.field final synthetic this$0:Lcom/android/camera/Camera;


# direct methods
.method private constructor <init>(Lcom/android/camera/Camera;)V
    .locals 0

    .line 1275
    iput-object p1, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$1;)V
    .locals 0

    .line 1275
    invoke-direct {p0, p1}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1281
    const-string v0, "ANR-WatchDog"

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera$WatchDogThread;->setName(Ljava/lang/String;)V

    .line 1284
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera$WatchDogThread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_3

    .line 1285
    const-string v0, "WatchDogThread"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "watch dog run "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1286
    iget-object v0, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Camera;->access$000(Lcom/android/camera/Camera;)I

    move-result v0

    .line 1287
    iget-object v1, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    iget-object v1, v1, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v2}, Lcom/android/camera/Camera;->access$1000(Lcom/android/camera/Camera;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1289
    const-wide/16 v1, 0x1388

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1293
    nop

    .line 1296
    iget-object v1, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v1}, Lcom/android/camera/Camera;->access$000(Lcom/android/camera/Camera;)I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 1297
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1298
    iget-object v0, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    .line 1300
    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    const/4 v2, -0x1

    invoke-static {v0, v2}, Lcom/android/camera/Camera;->access$1100(Lcom/android/camera/Camera;I)V

    .line 1301
    iget-object v0, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0, v1}, Lcom/android/camera/Camera;->access$1200(Lcom/android/camera/Camera;Z)V

    .line 1302
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fW()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1303
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getBroadcastKillServiceTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 1304
    const-wide/32 v2, 0xea60

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 1305
    iget-object v0, p0, Lcom/android/camera/Camera$WatchDogThread;->this$0:Lcom/android/camera/Camera;

    invoke-static {v0}, Lcom/android/camera/Util;->broadcastKillService(Landroid/content/Context;)V

    .line 1308
    :cond_2
    return-void

    .line 1290
    :catch_0
    move-exception v0

    .line 1291
    const-string v0, "WatchDogThread"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "watch dog InterruptedException "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1292
    return-void

    .line 1311
    :cond_3
    return-void
.end method
