.class public abstract Lcom/arcsoft/avatar/c/b;
.super Ljava/lang/Object;
.source "BaseEncoder.java"


# static fields
.field private static final bX:I = 0xf4240

.field private static final dW:I = 0xf4240

.field private static final dy:Ljava/lang/String; = "Arc_BaseEncoder"

.field private static final w:I = 0xc584

.field private static final x:J = 0x4e20L


# instance fields
.field protected a:Z

.field protected b:Z

.field protected bP:Z

.field private cg:J

.field protected dM:Z

.field protected dN:Z

.field protected dO:Ljava/lang/Object;

.field protected volatile dP:J

.field protected dQ:Lcom/arcsoft/avatar/c/f;

.field protected dR:Landroid/media/MediaCodec;

.field protected dS:I

.field protected dT:J

.field protected dU:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field protected dV:Lcom/arcsoft/avatar/c/g;

.field protected dX:J

.field protected dY:Ljava/util/concurrent/locks/Lock;

.field protected dZ:Ljava/util/concurrent/locks/Condition;

.field protected volatile e:Z

.field protected ea:Lcom/arcsoft/avatar/c/d;

.field private eb:J

.field private ec:J

.field private ed:J

.field protected j:I

.field private y:J

.field private z:J


# direct methods
.method public constructor <init>(Lcom/arcsoft/avatar/c/f;Ljava/lang/Object;Lcom/arcsoft/avatar/c/g;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->dX:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->y:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->z:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->eb:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->ec:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->ed:J

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->cg:J

    iput-object p3, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    iput-object p1, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->dM:Z

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    const/4 p3, 0x1

    iput-boolean p3, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->dN:Z

    const/4 p3, -0x1

    iput p3, p0, Lcom/arcsoft/avatar/c/b;->dS:I

    iput p3, p0, Lcom/arcsoft/avatar/c/b;->j:I

    iput-object p2, p0, Lcom/arcsoft/avatar/c/b;->dO:Ljava/lang/Object;

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->dP:J

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->bP:Z

    iput-wide v0, p0, Lcom/arcsoft/avatar/c/b;->dT:J

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/arcsoft/avatar/c/b;->dU:Ljava/util/Queue;

    const-string p1, "Arc_BaseEncoder"

    const-string p2, "BaseEncoder constructor out"

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected a()J
    .locals 10

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/arcsoft/avatar/c/b;->dP:J

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dU:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->size()I

    move-result v4

    if-eqz v4, :cond_0

    iget-object v2, p0, Lcom/arcsoft/avatar/c/b;->dU:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    :cond_0
    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    const-string v6, "Arc_BaseEncoder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getPTSUs TotalPauseTime="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p0, Lcom/arcsoft/avatar/c/b;->dP:J

    div-long/2addr v8, v4

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "Arc_BaseEncoder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getPTSUs preTime="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, p0, Lcom/arcsoft/avatar/c/b;->z:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v8, " ,currentTime="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long/2addr v0, v4

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " , result="

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/arcsoft/avatar/c/b;->z:J

    cmp-long v0, v2, v0

    const-wide/16 v4, 0x4e20

    if-gez v0, :cond_2

    iget-wide v0, p0, Lcom/arcsoft/avatar/c/b;->z:J

    sub-long/2addr v0, v2

    cmp-long v2, v0, v4

    if-gez v2, :cond_1

    iget-wide v2, p0, Lcom/arcsoft/avatar/c/b;->z:J

    add-long/2addr v2, v4

    sub-long/2addr v2, v0

    goto :goto_0

    :cond_1
    iget-wide v0, p0, Lcom/arcsoft/avatar/c/b;->z:J

    add-long/2addr v0, v4

    move-wide v2, v0

    :goto_0
    goto :goto_1

    :cond_2
    const-wide/16 v0, 0x0

    iget-wide v6, p0, Lcom/arcsoft/avatar/c/b;->z:J

    cmp-long v0, v0, v6

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/arcsoft/avatar/c/b;->z:J

    sub-long v0, v2, v0

    cmp-long v6, v0, v4

    if-gez v6, :cond_3

    add-long/2addr v2, v4

    sub-long/2addr v2, v0

    :cond_3
    :goto_1
    return-wide v2
.end method

.method public a(Lcom/arcsoft/avatar/c/d;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/c/b;->ea:Lcom/arcsoft/avatar/c/d;

    return-void
.end method

.method public a(Ljava/nio/ByteBuffer;J)V
    .locals 11

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    if-nez v0, :cond_0

    const-string p1, "Arc_BaseEncoder"

    const-string p2, "encode()->Encoder is not ready."

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "Arc_BaseEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "encode()->Encoder one frame. threadName in="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    nop

    const/4 v0, 0x0

    nop

    iget-boolean v1, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    if-nez v1, :cond_1

    return-void

    :cond_1
    :goto_0
    iget-boolean v1, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    if-eqz v1, :cond_6

    iget-boolean v1, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v5

    const/4 v1, -0x1

    if-ne v1, v5, :cond_3

    const/4 v1, 0x3

    if-ge v0, v1, :cond_2

    add-int/lit8 v0, v0, 0x1

    const-string v1, "Arc_BaseEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "encode()->Encoder is busy, wait ... waitCount = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string p1, "Arc_BaseEncoder"

    const-string p2, "encode()->Encoder is busy, wait time out."

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    if-ltz v5, :cond_5

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v0, v5}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    if-nez p1, :cond_4

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x4

    move-wide v8, p2

    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    const-string p1, "Arc_BaseEncoder"

    const-string p2, "encode()->Encoder meets end of stream."

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    const/4 v6, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    const/4 v10, 0x0

    move-wide v8, p2

    invoke-virtual/range {v4 .. v10}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    const-string p1, "Arc_BaseEncoder"

    const-string p2, "encode()->Encoder is fed a new frame."

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    :goto_1
    goto :goto_0

    :cond_6
    :goto_2
    return-void
.end method

.method public drain()V
    .locals 13

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    if-nez v0, :cond_0

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Encoder is not ready."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Arc_BaseEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "drain()->Encoder one frame. threadName in="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    if-nez v1, :cond_1

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Muxer is not ready."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    nop

    nop

    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    iget-boolean v4, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    if-eqz v4, :cond_f

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    iget-wide v5, p0, Lcom/arcsoft/avatar/c/b;->dX:J

    invoke-virtual {v4, v1, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v4

    const/4 v5, -0x1

    const/4 v6, 0x2

    if-ne v5, v4, :cond_3

    if-ge v3, v6, :cond_2

    add-int/lit8 v3, v3, 0x1

    const-string v4, "Arc_BaseEncoder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "drain()->Encoded frame is preparing, wait ... waitCount = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_2
    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Encoded frame is preparing, wait time out."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_3
    const/4 v5, -0x2

    const/4 v7, 0x1

    if-ne v5, v4, :cond_7

    iget-boolean v4, p0, Lcom/arcsoft/avatar/c/b;->dM:Z

    if-nez v4, :cond_6

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v4

    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v5, v4}, Lcom/arcsoft/avatar/c/f;->addTrack(Landroid/media/MediaFormat;)I

    move-result v4

    iput v4, p0, Lcom/arcsoft/avatar/c/b;->j:I

    iput-boolean v7, p0, Lcom/arcsoft/avatar/c/b;->dM:Z

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v4}, Lcom/arcsoft/avatar/c/f;->isStarted()Z

    move-result v4

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v4}, Lcom/arcsoft/avatar/c/f;->J()V

    const-string v4, "Arc_BaseEncoder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Muxer started: threadName ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    monitor-enter v4

    :goto_1
    :try_start_0
    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v5}, Lcom/arcsoft/avatar/c/f;->isStarted()Z

    move-result v5

    if-nez v5, :cond_4

    iget-boolean v5, p0, Lcom/arcsoft/avatar/c/b;->dN:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_4

    :try_start_1
    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    const-wide/16 v6, 0x64

    invoke-virtual {v5, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v5

    :try_start_2
    const-string v6, "Arc_BaseEncoder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "drain()->Wait for muxer started, but be interrupted : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->dM:Z

    nop

    :cond_4
    invoke-virtual {p0}, Lcom/arcsoft/avatar/c/b;->a()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/arcsoft/avatar/c/b;->cg:J

    iget-object v7, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {v7, v5, v6}, Lcom/arcsoft/avatar/c/f;->setStartTime(J)V

    const-string v7, "Arc_BaseEncoder"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Muxer start time ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v7, v5}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v4

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_5
    :goto_2
    goto/16 :goto_4

    :cond_6
    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Encoder format change twice."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Format only allow change once, but Encoder meet twice!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    if-gez v4, :cond_8

    const-string v5, "Arc_BaseEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "drain()->Encoder meet bufferStatus ="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_8
    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v5, v4}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    iget v8, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v6, v8

    if-eqz v6, :cond_9

    iput v2, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    const-string v6, "Arc_BaseEncoder"

    const-string v8, "drain()->Encoder meet bufferStatus : BUFFER_FLAG_CODEC_CONFIG "

    invoke-static {v6, v8}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    iget-boolean v6, p0, Lcom/arcsoft/avatar/c/b;->dM:Z

    if-nez v6, :cond_a

    const-string v6, "Arc_BaseEncoder"

    const-string v8, "drain()->Encoder muxer has not started "

    invoke-static {v6, v8}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a
    iget v6, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v6, :cond_c

    iget v6, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget v6, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v8, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v6, v8

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    const-string v6, "Arc_BaseEncoder"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "drain()->Encoder one frame. threadName="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " timestamp original buffer info ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v9, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/arcsoft/avatar/c/b;->a()J

    move-result-wide v8

    iput-wide v8, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    const-string v6, "Arc_BaseEncoder"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "time_diff _"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "= "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v9, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-wide v11, p0, Lcom/arcsoft/avatar/c/b;->y:J

    sub-long/2addr v9, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v8, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v8, p0, Lcom/arcsoft/avatar/c/b;->y:J

    iget-wide v8, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-wide v10, p0, Lcom/arcsoft/avatar/c/b;->eb:J

    sub-long/2addr v8, v10

    const-wide/32 v10, 0xf4240

    cmp-long v6, v8, v10

    if-ltz v6, :cond_b

    iget-wide v8, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v8, p0, Lcom/arcsoft/avatar/c/b;->eb:J

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    const-string v8, "request-sync"

    invoke-virtual {v6, v8, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v7, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v7, v6}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    :cond_b
    iget-object v6, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    iget v7, p0, Lcom/arcsoft/avatar/c/b;->j:I

    invoke-virtual {v6, v7, v5, v1}, Lcom/arcsoft/avatar/c/f;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    iget-wide v5, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v5, p0, Lcom/arcsoft/avatar/c/b;->z:J

    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    iget-wide v6, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v5, v6, v7}, Lcom/arcsoft/avatar/c/f;->b(J)V

    const-string v5, "Arc_BaseEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "drain()->Encoder one frame. threadName="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " timestamp="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v7, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_c
    iget-object v5, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v5, v4, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    const/4 v4, 0x4

    iget v5, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v4, v5

    if-eqz v4, :cond_e

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    if-nez v0, :cond_d

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Encoder meet unexpected end of stream."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_d
    const-string v0, "Arc_BaseEncoder"

    const-string v1, "drain()->Encoder meet end of stream."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    iput-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    goto :goto_5

    :cond_e
    :goto_4
    goto/16 :goto_0

    :cond_f
    :goto_5
    const-string v0, "Arc_BaseEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drain()->Encoder one frame. threadName out="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public abstract f(Z)V
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public lock()V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dY:Ljava/util/concurrent/locks/Lock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dY:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :cond_0
    return-void
.end method

.method public pauseRecording()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    const-string v0, "Arc_BaseEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Log_mIsRequestPause_Vaule_pauseRecording ->mIsRequestPause="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public release(Z)V
    .locals 5

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    :try_start_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v3, 0x234

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v3, 0x224

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_1
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v0, 0x235

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v0, v3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dV:Lcom/arcsoft/avatar/c/g;

    const/16 v0, 0x225

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p1, v0, v3}, Lcom/arcsoft/avatar/c/g;->onRecordingListener(ILjava/lang/Object;)V

    :cond_3
    :goto_1
    iput-object v1, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    :cond_4
    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/c/f;->K()V

    iput-object v1, p0, Lcom/arcsoft/avatar/c/b;->dQ:Lcom/arcsoft/avatar/c/f;

    :cond_5
    iput-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    iput-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    iput-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->dN:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    iput-object v1, p0, Lcom/arcsoft/avatar/c/b;->dO:Ljava/lang/Object;

    iput-object v1, p0, Lcom/arcsoft/avatar/c/b;->dY:Ljava/util/concurrent/locks/Lock;

    iput-object v1, p0, Lcom/arcsoft/avatar/c/b;->dZ:Ljava/util/concurrent/locks/Condition;

    return-void
.end method

.method public resumeRecording()V
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    const-string v0, "Arc_BaseEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Log_mIsRequestPause_Vaule_resumeRecording ->mIsRequestPause="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/arcsoft/avatar/c/b;->e:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public startRecording()V
    .locals 2

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    if-eqz v0, :cond_0

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "startRecording()-> encoder is started, you can not start it again"

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->b:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->dN:Z

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->a:Z

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "startRecording()-> encoder is started."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public stopRecording()V
    .locals 2

    iget-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->dN:Z

    if-eqz v0, :cond_0

    const-string v0, "Arc_BaseEncoder"

    const-string v1, "stopRecording()-> stop encoder request command is received,you can not send stop command again."

    invoke-static {v0, v1}, Lcom/arcsoft/avatar/d/f;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/arcsoft/avatar/c/b;->dN:Z

    return-void
.end method

.method public abstract t()V
.end method

.method public u()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dR:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "google"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Software Encoder"

    return-object v0

    :cond_0
    const-string v0, "Hardware Encoder"

    return-object v0

    :cond_1
    const-string v0, "No Encoder"

    return-object v0
.end method

.method public v()V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dY:Ljava/util/concurrent/locks/Lock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dY:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    :cond_0
    return-void
.end method

.method public w()V
    .locals 1

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dZ:Ljava/util/concurrent/locks/Condition;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arcsoft/avatar/c/b;->dZ:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    :cond_0
    return-void
.end method

.method public x()Lcom/arcsoft/avatar/c/d;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
