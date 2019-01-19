.class public Lcom/xiaomi/engine/TaskSession;
.super Ljava/lang/Object;
.source "TaskSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/engine/TaskSession$FrameCallback;,
        Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mHasDestroyed:Z

.field private mHasFlushed:Z

.field private final mMaxTaskNumber:I

.field private final mObjLock:Ljava/lang/Object;

.field private mRunningTaskNumber:I

.field private final mSessionHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-class v0, Lcom/xiaomi/engine/TaskSession;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(JI)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    .line 30
    iput-wide p1, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    .line 31
    iput p3, p0, Lcom/xiaomi/engine/TaskSession;->mMaxTaskNumber:I

    .line 32
    return-void
.end method

.method private destroy()V
    .locals 2

    .line 148
    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasDestroyed:Z

    if-eqz v0, :cond_0

    .line 149
    return-void

    .line 151
    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->destroySession(J)I

    move-result v0

    .line 152
    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 153
    if-nez v0, :cond_1

    .line 154
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasDestroyed:Z

    .line 156
    :cond_1
    return-void
.end method

.method private flush()V
    .locals 2

    .line 159
    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasFlushed:Z

    if-eqz v0, :cond_0

    .line 160
    return-void

    .line 162
    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->flush(J)I

    move-result v0

    .line 163
    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 164
    if-nez v0, :cond_1

    .line 165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->mHasFlushed:Z

    .line 167
    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 59
    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->flush()V

    .line 60
    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->destroy()V

    .line 61
    sget-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close: session has closed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 143
    invoke-virtual {p0}, Lcom/xiaomi/engine/TaskSession;->close()V

    .line 144
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 145
    return-void
.end method

.method public isBusy()Z
    .locals 3

    .line 65
    iget-object v0, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 66
    :try_start_0
    iget v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    iget v2, p0, Lcom/xiaomi/engine/TaskSession;->mMaxTaskNumber:I

    if-lt v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 67
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onTaskFinish(I)V
    .locals 3

    .line 105
    iget-object v0, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 106
    :try_start_0
    iget v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    sub-int/2addr v1, p1

    iput v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    .line 107
    iget p1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    if-gez p1, :cond_0

    .line 108
    const/4 p1, 0x0

    iput p1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    .line 110
    :cond_0
    sget-object p1, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTaskFinish: taskNum="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget-object p1, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 112
    monitor-exit v0

    .line 113
    return-void

    .line 112
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onTaskStart(I)V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 94
    :try_start_0
    iget v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    .line 95
    sget-object p1, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTaskStart: taskNum="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    monitor-exit v0

    .line 97
    return-void

    .line 96
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V
    .locals 3
    .param p1    # Lcom/xiaomi/engine/FrameData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 43
    sget-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processFrame: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/engine/FrameData;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1, p1, p2}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->processFrame(JLcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)I

    move-result p1

    .line 48
    if-nez p1, :cond_0

    .line 49
    const-string v0, "onProcessStarted"

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/xiaomi/engine/TaskSession$FrameCallback;->onFrameProcessed(ILjava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 51
    :cond_0
    invoke-static {p1}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 53
    :goto_0
    return-void
.end method

.method public waitIfBusy()V
    .locals 4

    .line 74
    iget-object v0, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    monitor-enter v0

    .line 75
    :goto_0
    :try_start_0
    iget v1, p0, Lcom/xiaomi/engine/TaskSession;->mRunningTaskNumber:I

    iget v2, p0, Lcom/xiaomi/engine/TaskSession;->mMaxTaskNumber:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v1, v2, :cond_0

    .line 77
    :try_start_1
    sget-object v1, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    const-string v2, "waitIfBusy: start"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v1, p0, Lcom/xiaomi/engine/TaskSession;->mObjLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 79
    sget-object v1, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    const-string v2, "waitIfBusy: end"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 80
    :catch_0
    move-exception v1

    .line 81
    :try_start_2
    sget-object v2, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 82
    :goto_1
    goto :goto_0

    .line 84
    :cond_0
    monitor-exit v0

    .line 85
    return-void

    .line 84
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
