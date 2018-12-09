.class public Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;
.super Ljava/lang/Object;
.source "TEAvcEncoder.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final MASK_BIT_RATE:I = 0x1

.field private static final MASK_FORCE_RESTART:I = 0x4

.field private static final MASK_FRAME_RATE:I = 0x2

.field private static MAX_FRAME_RATE:I = 0x0

.field private static MIN_FRAME_RATE:I = 0x0

.field private static final TAG:Ljava/lang/String;

.field private static final TIMEOUT_USEC:I = 0x0

.field private static final TIMEOUT_USEC_EOS:I = 0x2710

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static avcqueuesize:I

.field private static c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;


# instance fields
.field public AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;",
            ">;"
        }
    .end annotation
.end field

.field public configbyte:[B

.field private mBufferIndex:I

.field private mEndOfStream:Z

.field private mFirstFrame:Z

.field private mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

.field private m_bNeedSingalEnd:Z

.field private m_bSignalEndOfStream:Z

.field private m_bSuccessInit:Z

.field private m_bitRate:I

.field private m_codecFormat:Landroid/media/MediaFormat;

.field private m_colorFormat:I

.field private m_configStatus:I

.field private m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

.field private m_encodeStartTime:J

.field private m_frameRate:I

.field private m_getnerateIndex:J

.field private m_height:I

.field private m_iFrameInternal:I

.field private m_isNeedReconfigure:Z

.field private m_mediaCodec:Landroid/media/MediaCodec;

.field private m_profile:I

.field private m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

.field private m_surface:Landroid/view/Surface;

.field private m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

.field private m_useInputSurface:Z

.field private m_width:I

.field private pps:[B

.field private sps:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const-class v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    .line 44
    const/4 v0, 0x7

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    .line 45
    const/16 v0, 0x7d0

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    .line 46
    const/4 v0, 0x0

    sput-boolean v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->DEBUG:Z

    .line 48
    const/16 v0, 0x19

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->avcqueuesize:I

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    sget v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->avcqueuesize:I

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    .line 51
    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    .line 52
    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    .line 53
    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    .line 57
    const/4 v1, 0x0

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    .line 58
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    .line 59
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    .line 60
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    .line 61
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    .line 62
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    .line 63
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_profile:I

    .line 64
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    .line 65
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    .line 69
    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    .line 71
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    .line 72
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 73
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    .line 74
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    .line 76
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    .line 78
    const-wide/16 v3, -0x1

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    .line 293
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    .line 294
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    .line 295
    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    return-void
.end method

.method private addOutputData([BJI)V
    .locals 1

    .line 485
    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    invoke-direct {v0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;-><init>()V

    .line 486
    iput-object p1, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    .line 487
    iput-wide p2, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    .line 488
    iput p4, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->flag:I

    .line 490
    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    goto :goto_0

    .line 491
    :catch_0
    move-exception p1

    .line 492
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 494
    :goto_0
    return-void
.end method

.method private computePresentationTime(J)J
    .locals 4

    .line 573
    iget-wide v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    const-wide/32 v2, 0x3b9aca00

    mul-long/2addr p1, v2

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    int-to-long v2, v2

    div-long/2addr p1, v2

    add-long/2addr v0, p1

    .line 574
    return-wide v0
.end method

.method private configEncode()I
    .locals 4

    .line 87
    :try_start_0
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->reconfigureMediaFormat()I

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    const/4 v0, -0x1

    return v0

    .line 90
    :cond_0
    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    .line 91
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 93
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_1

    .line 94
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :cond_1
    nop

    .line 100
    const/4 v0, 0x0

    return v0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 98
    const/4 v0, -0x2

    return v0
.end method

.method public static createEncoderObject()Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;
    .locals 1

    .line 81
    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    invoke-direct {v0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    .line 82
    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    return-object v0
.end method

.method private drainOutputBuffer(J)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 499
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 501
    const/4 v1, -0x1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    .line 503
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 507
    goto :goto_0

    .line 505
    :catch_0
    move-exception v1

    .line 506
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 509
    :goto_0
    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    const/4 v2, 0x0

    if-ltz v1, :cond_5

    .line 512
    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    invoke-direct {p0, v1}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->getOutputBufferByIdx(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 513
    iget v3, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v3, v3, [B

    .line 514
    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 515
    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v4, v5

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 517
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 518
    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_0

    .line 519
    iput-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    goto :goto_2

    .line 520
    :cond_0
    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x1

    const/4 v5, 0x4

    if-ne v1, v4, :cond_3

    .line 521
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v1, :cond_1

    .line 523
    aget-byte v1, v3, v5

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    aget-byte v4, v4, v5

    if-ne v1, v4, :cond_2

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v1, v1

    add-int/2addr v1, v5

    aget-byte v1, v3, v1

    and-int/lit8 v1, v1, 0x1f

    const/4 v4, 0x5

    if-ne v1, v4, :cond_2

    .line 524
    array-length v1, v3

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v4, v4

    sub-int/2addr v1, v4

    new-array v1, v1, [B

    .line 525
    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v4, v4

    array-length v5, v1

    invoke-static {v3, v4, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 526
    nop

    .line 527
    goto :goto_1

    .line 531
    :cond_1
    sget-object v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v4, "I can\'t find configbyte!!!! NEED extract from I frame!!!"

    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    :cond_2
    move-object v1, v3

    :goto_1
    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-direct {p0, v1, v3, v4, v5}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->addOutputData([BJI)V

    goto :goto_2

    .line 536
    :cond_3
    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    if-ne v1, v5, :cond_4

    .line 537
    iput-boolean v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    .line 538
    goto :goto_3

    .line 540
    :cond_4
    iget-wide v4, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-direct {p0, v3, v4, v5, v1}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->addOutputData([BJI)V

    .line 543
    :goto_2
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    invoke-virtual {v1, v3, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 544
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    .line 545
    goto/16 :goto_0

    .line 547
    :cond_5
    :goto_3
    iget p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    const/4 p2, -0x2

    if-ne p1, p2, :cond_6

    .line 548
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object p1

    .line 549
    const-string p2, "csd-0"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object p2

    .line 550
    const-string v0, "csd-1"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 551
    if-eqz p2, :cond_6

    if-eqz p1, :cond_6

    .line 552
    nop

    .line 553
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-virtual {p2}, [B->clone()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [B

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    .line 554
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    .line 555
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length p1, p1

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    array-length p2, p2

    add-int/2addr p1, p2

    .line 556
    new-array p1, p1, [B

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    .line 557
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length v0, v0

    invoke-static {p1, v2, p2, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 558
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length v0, v0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    array-length v1, v1

    invoke-static {p1, v2, p2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 561
    :cond_6
    return-void
.end method

.method private getOutputBufferByIdx(I)Ljava/nio/ByteBuffer;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 476
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 477
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1

    .line 479
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 480
    aget-object p1, v0, p1

    return-object p1
.end method

.method private reconfigureMediaFormat()I
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 459
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 460
    const/4 v0, -0x1

    return v0

    .line 463
    :cond_0
    const-string v0, "video/avc"

    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    .line 464
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "color-format"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 465
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "bitrate"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 466
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "frame-rate"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 467
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "i-frame-interval"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 469
    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v1, "width:[%d] height:[%d] frameRate:[%d] iFrameInternal:[%d] bitRate:[%d] colorFormat:[%d]"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x2

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x3

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x4

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x5

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    return v4
.end method


# virtual methods
.method public encodeVideoFromTexture(I)I
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 300
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 301
    return v1

    .line 304
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez v0, :cond_1

    .line 305
    new-instance v0, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    .line 306
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    .line 309
    :cond_1
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    const/4 v2, 0x1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_4

    .line 310
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    if-ne v0, v2, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v0, v3, :cond_3

    .line 312
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 313
    const-string v3, "video-bitrate"

    iget v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 314
    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v3, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 315
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    .line 316
    goto :goto_0

    .line 317
    :cond_3
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->restartEncoder()I

    .line 320
    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 322
    :cond_4
    iget-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    const-wide/16 v5, -0x1

    cmp-long v0, v3, v5

    if-nez v0, :cond_5

    .line 323
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    .line 326
    :cond_5
    const-wide/16 v3, 0x0

    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    .line 328
    and-int/lit8 p1, p1, -0x1

    .line 329
    const/16 v0, 0x1e

    if-eqz p1, :cond_c

    .line 331
    :try_start_0
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v5, :cond_b

    .line 332
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v5}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    .line 333
    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 334
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v5, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    .line 336
    iget-boolean v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    if-eqz v5, :cond_7

    .line 337
    sget-boolean v5, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->DEBUG:Z

    if-eqz v5, :cond_6

    .line 338
    const v5, 0x384000

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 339
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 340
    invoke-virtual {v5, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 341
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0x500

    const/16 v9, 0x2d0

    const/16 v10, 0x1908

    const/16 v11, 0x1401

    move-object v12, v5

    invoke-static/range {v6 .. v12}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 343
    new-instance v6, Ljava/io/FileOutputStream;

    const-string v7, "/mnt/sdcard/ttt.rgba"

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 345
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 346
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 348
    :cond_6
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    .line 351
    :cond_7
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v6, v7}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    .line 352
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v5}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z

    .line 353
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    .line 356
    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    .line 357
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-nez v5, :cond_b

    .line 358
    nop

    .line 360
    move v5, v1

    :cond_8
    iget v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v6, v7}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 361
    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v6, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    .line 362
    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v7, v8}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    .line 363
    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v6}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z

    .line 364
    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    .line 365
    add-int/2addr v5, v2

    .line 366
    if-le v5, v0, :cond_9

    .line 367
    goto :goto_1

    .line 369
    :cond_9
    const-wide/16 v6, 0xa

    invoke-static {v6, v7, v1}, Ljava/lang/Thread;->sleep(JI)V

    .line 372
    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v6, :cond_8

    .line 374
    :goto_1
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-nez v2, :cond_a

    .line 375
    sget-object v2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Generate configData failed!!!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 377
    :cond_a
    sget-object v2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Generate configData succeed!!!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    :goto_2
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    .line 382
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->restartEncoder()I

    .line 383
    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    .line 384
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v2}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    .line 385
    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v2, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 386
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v2, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    .line 387
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v5, v6}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v5

    invoke-virtual {p1, v5, v6}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    .line 388
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    :cond_b
    goto :goto_3

    .line 393
    :catch_0
    move-exception p1

    .line 395
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 397
    :goto_3
    iget-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    goto :goto_4

    .line 399
    :cond_c
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz p1, :cond_d

    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    if-nez p1, :cond_d

    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    if-eqz p1, :cond_d

    .line 401
    :try_start_1
    sget-object p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v5, "m_mediaCodec.flush()"

    invoke-static {p1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    .line 403
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    .line 404
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->signalEndOfInputStream()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 407
    goto :goto_4

    .line 405
    :catch_1
    move-exception p1

    .line 406
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 411
    :cond_d
    :goto_4
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEEglStateSaver;->makeSavedStateCurrent()V

    .line 413
    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    if-eqz p1, :cond_11

    .line 414
    nop

    .line 415
    :cond_e
    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    if-nez p1, :cond_10

    .line 416
    const-wide/16 v2, 0x2710

    invoke-direct {p0, v2, v3}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    .line 417
    iget p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    if-ltz p1, :cond_f

    .line 418
    goto :goto_5

    .line 419
    :cond_f
    add-int/lit8 v0, v0, -0x1

    .line 420
    if-gtz v0, :cond_e

    .line 422
    :cond_10
    :goto_5
    goto :goto_6

    .line 423
    :cond_11
    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    .line 426
    :goto_6
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    .line 427
    nop

    .line 428
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    if-eqz p1, :cond_12

    .line 429
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-object p1, p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    array-length v1, p1

    .line 432
    :cond_12
    return v1
.end method

.method public getCodecData(I)[B
    .locals 0

    .line 437
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    if-eqz p1, :cond_0

    .line 438
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-object p1, p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    return-object p1

    .line 440
    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getExtraData()[B
    .locals 1

    .line 565
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v0, :cond_0

    .line 566
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    return-object v0

    .line 568
    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0
.end method

.method public getInfoByFlag([II)I
    .locals 5

    .line 445
    nop

    .line 447
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 448
    const/4 p2, 0x0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-wide v1, v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    const-wide/16 v3, -0x1

    and-long/2addr v1, v3

    long-to-int v1, v1

    aput v1, p1, p2

    .line 449
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-wide v1, p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    const/16 p2, 0x20

    shr-long/2addr v1, p2

    and-long/2addr v1, v3

    long-to-int p2, v1

    aput p2, p1, v0

    .line 450
    const/4 p1, 0x2

    goto :goto_0

    .line 453
    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    return-object v0
.end method

.method public initEncoder(IIIIIIIZ)I
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    move-object v8, p0

    .line 107
    move/from16 v0, p8

    if-eqz v0, :cond_0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-ge v1, v2, :cond_0

    .line 108
    const/4 v0, -0x1

    return v0

    .line 110
    :cond_0
    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    .line 111
    iget-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_1

    .line 112
    const v0, 0x7f000789

    iput v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    goto :goto_0

    .line 114
    :cond_1
    move v0, p4

    iput v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    .line 116
    :goto_0
    iget v6, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    move-object v0, v8

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p6

    move v5, p5

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->setEncoder(IIIIIII)I

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 118
    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    .line 120
    invoke-direct {v8}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configEncode()I

    move-result v0

    return v0
.end method

.method public initTextureDrawer()Z
    .locals 3

    .line 194
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 198
    :cond_0
    invoke-static {}, Lcom/ss/android/ttve/common/TETextureDrawer;->create()Lcom/ss/android/ttve/common/TETextureDrawer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 199
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_1

    .line 200
    const/4 v0, 0x0

    return v0

    .line 202
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/common/TETextureDrawer;->setRotation(F)V

    .line 203
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttve/common/TETextureDrawer;->setFlipScale(FF)V

    .line 204
    const/4 v0, 0x1

    return v0
.end method

.method public releaseEncoder()V
    .locals 2

    .line 124
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->stopEncoder()V

    .line 125
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 127
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 132
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    .line 134
    :cond_1
    sput-object v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    .line 135
    return-void
.end method

.method public releaseTextureDrawer()V
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_0

    .line 210
    return-void

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 214
    return-void
.end method

.method public restartEncoder()I
    .locals 1

    .line 285
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    .line 286
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->stopEncoder()V

    .line 287
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configEncode()I

    move-result v0

    .line 288
    if-gez v0, :cond_0

    .line 289
    return v0

    .line 290
    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->startEncoder()I

    move-result v0

    return v0
.end method

.method public setEncoder(IIIIIII)I
    .locals 4

    .line 143
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    .line 144
    if-lez p1, :cond_0

    .line 145
    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    .line 148
    :cond_0
    if-lez p2, :cond_1

    .line 149
    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    .line 153
    :cond_1
    const/4 p1, 0x1

    if-lez p3, :cond_5

    .line 154
    sget p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    const/4 v1, 0x2

    if-ge p3, p2, :cond_2

    .line 155
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const-string v2, "_frameRate:[%d] is too small, change to %d"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, v0

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, p1

    invoke-static {p2, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 156
    sget-object p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    invoke-static {p3, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    .line 158
    goto :goto_0

    :cond_2
    sget p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    if-le p3, p2, :cond_3

    .line 159
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const-string v2, "_frameRate:[%d] is too large, change to %d"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, v0

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, p1

    invoke-static {p2, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 160
    sget-object p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    invoke-static {p3, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    .line 164
    :cond_3
    :goto_0
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    if-eq p2, p3, :cond_5

    .line 165
    iput p3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    .line 166
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    if-ge p3, p2, :cond_4

    .line 167
    iput p3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    .line 169
    :cond_4
    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 170
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    or-int/2addr p2, v1

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    .line 174
    :cond_5
    if-lez p4, :cond_6

    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    if-eq p2, p4, :cond_6

    .line 175
    iput p4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    .line 176
    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 177
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    or-int/2addr p1, p2

    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    .line 180
    :cond_6
    if-ltz p5, :cond_7

    .line 181
    iput p5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    .line 183
    :cond_7
    if-lez p6, :cond_8

    .line 184
    iput p6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    .line 186
    :cond_8
    if-ltz p7, :cond_9

    .line 187
    iput p7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_profile:I

    .line 189
    :cond_9
    return v0
.end method

.method public startEncoder()I
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 219
    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v1, "startEncoder..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    const/4 v2, 0x0

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_2

    .line 233
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    const/4 v1, -0x2

    const/16 v3, 0x3142

    if-nez v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    const/16 v5, 0x40

    invoke-static {v0, v5, v5, v3, v4}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    .line 235
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    if-nez v0, :cond_1

    .line 236
    return v1

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0, v2, v2, v3, v4}, Lcom/ss/android/ttve/common/TESharedContext;->updateSurface(IIILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 240
    return v1

    .line 243
    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->initTextureDrawer()Z

    move-result v0

    if-nez v0, :cond_2

    .line 244
    const/4 v0, -0x3

    return v0

    .line 248
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 249
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    .line 250
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    .line 251
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    nop

    .line 257
    return v2

    .line 252
    :catch_0
    move-exception v0

    .line 253
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 254
    const/4 v0, -0x1

    return v0
.end method

.method public stopEncoder()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 264
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    .line 268
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_1

    .line 269
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 270
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 273
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_2

    .line 274
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    :cond_2
    goto :goto_0

    .line 277
    :catch_0
    move-exception v0

    .line 278
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 281
    :goto_0
    return-void
.end method
