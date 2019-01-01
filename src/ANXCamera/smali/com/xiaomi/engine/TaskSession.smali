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
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private hasDestroyed:Z

.field private hasFlushed:Z

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

.method constructor <init>(J)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-wide p1, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    .line 26
    return-void
.end method

.method private destroy()V
    .locals 2

    .line 91
    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->hasDestroyed:Z

    if-eqz v0, :cond_0

    .line 92
    return-void

    .line 94
    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->destroySession(J)I

    move-result v0

    .line 95
    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 96
    if-nez v0, :cond_1

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->hasDestroyed:Z

    .line 99
    :cond_1
    return-void
.end method

.method private flush()V
    .locals 2

    .line 102
    iget-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->hasFlushed:Z

    if-eqz v0, :cond_0

    .line 103
    return-void

    .line 105
    :cond_0
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->flush(J)I

    move-result v0

    .line 106
    invoke-static {v0}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 107
    if-nez v0, :cond_1

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/engine/TaskSession;->hasFlushed:Z

    .line 110
    :cond_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 53
    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->flush()V

    .line 54
    invoke-direct {p0}, Lcom/xiaomi/engine/TaskSession;->destroy()V

    .line 55
    sget-object v0, Lcom/xiaomi/engine/TaskSession;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close: session has closed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 86
    invoke-virtual {p0}, Lcom/xiaomi/engine/TaskSession;->close()V

    .line 87
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 88
    return-void
.end method

.method public processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V
    .locals 3
    .param p1    # Lcom/xiaomi/engine/FrameData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 37
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

    .line 41
    iget-wide v0, p0, Lcom/xiaomi/engine/TaskSession;->mSessionHandle:J

    invoke-static {v0, v1, p1, p2}, Lcom/xiaomi/engine/MiCamAlgoInterfaceJNI;->processFrame(JLcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)I

    move-result p1

    .line 42
    if-nez p1, :cond_0

    .line 43
    const-string v0, "onProcessStarted"

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Lcom/xiaomi/engine/TaskSession$FrameCallback;->onFrameProcessed(ILjava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p1}, Lcom/xiaomi/engine/Util;->assertOrNot(I)V

    .line 47
    :goto_0
    return-void
.end method
