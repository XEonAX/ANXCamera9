.class public Lcom/xiaomi/camera/liveshot/util/HandlerHelper;
.super Ljava/lang/Object;
.source "HandlerHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;,
        Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mPendingMessageQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingMessageQueueLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    const-class v0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueue:Ljava/util/List;

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueueLock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public release()V
    .locals 5

    .line 56
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueueLock:Ljava/lang/Object;

    monitor-enter v0

    .line 57
    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;

    .line 58
    invoke-static {v2}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;->access$100(Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 59
    const/4 v4, 0x1

    :try_start_1
    iput-boolean v4, v2, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;->releaseRequested:Z

    .line 60
    invoke-static {v2}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;->access$100(Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 61
    monitor-exit v3

    .line 62
    goto :goto_0

    .line 61
    :catchall_0
    move-exception v1

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1

    .line 63
    :cond_0
    monitor-exit v0

    .line 64
    return-void

    .line 63
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method public sendMessageAndAwaitResponse(Landroid/os/Message;)Ljava/lang/Object;
    .locals 7

    .line 18
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ResponseReceiverThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 19
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 22
    new-instance v2, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v1, v4}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;-><init>(Landroid/os/Looper;Ljava/lang/Object;Lcom/xiaomi/camera/liveshot/util/HandlerHelper$1;)V

    .line 23
    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueueLock:Ljava/lang/Object;

    monitor-enter v3

    .line 24
    :try_start_0
    iget-object v5, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueue:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 27
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v3, :cond_0

    .line 28
    new-instance v3, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;

    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-direct {v3, v5, v2}, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ObjectX;-><init>(Ljava/lang/Object;Landroid/os/Handler;)V

    iput-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    goto :goto_0

    .line 30
    :cond_0
    iput-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 32
    :goto_0
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 34
    nop

    .line 35
    monitor-enter v1

    .line 36
    :goto_1
    if-nez v4, :cond_1

    :try_start_1
    iget-boolean p1, v2, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;->releaseRequested:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez p1, :cond_1

    .line 38
    const-wide/16 v5, 0xa

    :try_start_2
    invoke-virtual {v1, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 39
    iget-object p1, v2, Lcom/xiaomi/camera/liveshot/util/HandlerHelper$ResponseReceiverHandler;->reply:Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    nop

    .line 36
    move-object v4, p1

    goto :goto_1

    .line 40
    :catch_0
    move-exception p1

    .line 41
    :try_start_3
    sget-object v3, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Interrupted: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    goto :goto_1

    .line 44
    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_1
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 48
    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueueLock:Ljava/lang/Object;

    monitor-enter p1

    .line 49
    :try_start_4
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/util/HandlerHelper;->mPendingMessageQueue:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 50
    monitor-exit p1

    .line 52
    return-object v4

    .line 50
    :catchall_1
    move-exception v0

    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    .line 44
    :goto_2
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw p1

    .line 25
    :catchall_2
    move-exception p1

    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1
.end method
