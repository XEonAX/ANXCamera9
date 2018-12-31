.class public Lcom/facebook/rebound/SteppingLooper;
.super Lcom/facebook/rebound/SpringLooper;
.source "SteppingLooper.java"


# instance fields
.field private mLastTime:J

.field private mStarted:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/facebook/rebound/SpringLooper;-><init>()V

    return-void
.end method


# virtual methods
.method public start()V
    .locals 2

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/rebound/SteppingLooper;->mStarted:Z

    .line 20
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/facebook/rebound/SteppingLooper;->mLastTime:J

    .line 21
    return-void
.end method

.method public step(J)Z
    .locals 4

    .line 24
    iget-object v0, p0, Lcom/facebook/rebound/SteppingLooper;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/rebound/SteppingLooper;->mStarted:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 27
    :cond_0
    iget-wide v0, p0, Lcom/facebook/rebound/SteppingLooper;->mLastTime:J

    add-long/2addr v0, p1

    .line 28
    iget-object p1, p0, Lcom/facebook/rebound/SteppingLooper;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    long-to-double v2, v0

    invoke-virtual {p1, v2, v3}, Lcom/facebook/rebound/BaseSpringSystem;->loop(D)V

    .line 29
    iput-wide v0, p0, Lcom/facebook/rebound/SteppingLooper;->mLastTime:J

    .line 30
    iget-object p1, p0, Lcom/facebook/rebound/SteppingLooper;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {p1}, Lcom/facebook/rebound/BaseSpringSystem;->getIsIdle()Z

    move-result p1

    return p1

    .line 25
    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public stop()V
    .locals 1

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/rebound/SteppingLooper;->mStarted:Z

    .line 36
    return-void
.end method
