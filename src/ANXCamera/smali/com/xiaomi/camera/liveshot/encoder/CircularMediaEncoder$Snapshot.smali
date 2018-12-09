.class public final Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;
.super Ljava/lang/Object;
.source "CircularMediaEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Snapshot"
.end annotation


# static fields
.field public static final NOT_STARTED:I = -0x1


# instance fields
.field public curr:J

.field private forceEos:Z

.field public final format:Landroid/media/MediaFormat;

.field public final head:J

.field public position:J

.field public volatile samples:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;",
            ">;"
        }
    .end annotation
.end field

.field public final tail:J


# direct methods
.method public constructor <init>(JJJLandroid/media/MediaFormat;)V
    .locals 0

    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 592
    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->head:J

    .line 593
    iput-wide p3, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    .line 594
    iput-wide p5, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->curr:J

    .line 595
    iput-object p7, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->format:Landroid/media/MediaFormat;

    .line 596
    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    .line 597
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->position:J

    .line 598
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->forceEos:Z

    .line 599
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 620
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 621
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    .line 622
    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 623
    goto :goto_0

    .line 624
    :cond_0
    return-void
.end method

.method public eos()Z
    .locals 4

    .line 627
    iget-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->forceEos:Z

    if-nez v0, :cond_1

    iget-wide v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->position:J

    iget-wide v2, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public put(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 602
    invoke-virtual {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->eos()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    return-void

    .line 606
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-static {p1, p2}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->create(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 607
    iget-wide p1, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->position:J

    .line 609
    invoke-virtual {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->eos()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 610
    invoke-virtual {p0}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->putEos()V

    .line 612
    :cond_1
    return-void
.end method

.method public putEos()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 615
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    sget-object v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->EOS_SAMPLE_ENTRY:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 616
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->forceEos:Z

    .line 617
    return-void
.end method
