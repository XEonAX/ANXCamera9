.class public Lcom/facebook/rebound/SynchronousLooper;
.super Lcom/facebook/rebound/SpringLooper;
.source "SynchronousLooper.java"


# static fields
.field public static SIXTY_FPS:D


# instance fields
.field private mRunning:Z

.field private mTimeStep:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 14
    const-wide v0, 0x4030aaacd9e83e42L    # 16.6667

    sput-wide v0, Lcom/facebook/rebound/SynchronousLooper;->SIXTY_FPS:D

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 18
    invoke-direct {p0}, Lcom/facebook/rebound/SpringLooper;-><init>()V

    .line 19
    sget-wide v0, Lcom/facebook/rebound/SynchronousLooper;->SIXTY_FPS:D

    iput-wide v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mTimeStep:D

    .line 20
    return-void
.end method


# virtual methods
.method public getTimeStep()D
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mTimeStep:D

    return-wide v0
.end method

.method public setTimeStep(D)V
    .locals 0

    .line 27
    iput-wide p1, p0, Lcom/facebook/rebound/SynchronousLooper;->mTimeStep:D

    .line 28
    return-void
.end method

.method public start()V
    .locals 3

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mRunning:Z

    .line 33
    :goto_0
    iget-object v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    invoke-virtual {v0}, Lcom/facebook/rebound/BaseSpringSystem;->getIsIdle()Z

    move-result v0

    if-nez v0, :cond_1

    .line 34
    iget-boolean v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mRunning:Z

    if-nez v0, :cond_0

    .line 35
    goto :goto_1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mSpringSystem:Lcom/facebook/rebound/BaseSpringSystem;

    iget-wide v1, p0, Lcom/facebook/rebound/SynchronousLooper;->mTimeStep:D

    invoke-virtual {v0, v1, v2}, Lcom/facebook/rebound/BaseSpringSystem;->loop(D)V

    goto :goto_0

    .line 39
    :cond_1
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 1

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/rebound/SynchronousLooper;->mRunning:Z

    .line 44
    return-void
.end method
