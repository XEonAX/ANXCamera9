.class public final Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
.super Ljava/lang/Object;
.source "CircularMediaEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Sample"
.end annotation


# static fields
.field public static final EOS_SAMPLE_ENTRY:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;


# instance fields
.field public final data:Ljava/nio/ByteBuffer;

.field public final info:Landroid/media/MediaCodec$BufferInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 325
    new-instance v6, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v6}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 326
    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x4

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 327
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0, v6}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->create(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->EOS_SAMPLE_ENTRY:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    .line 328
    return-void
.end method

.method private constructor <init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 6

    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 338
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    .line 339
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 340
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v2, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    iget-wide v3, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v5, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 341
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 342
    return-void
.end method

.method public static create(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
    .locals 1

    .line 334
    new-instance v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;

    invoke-direct {v0, p0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;-><init>(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    return-object v0
.end method
