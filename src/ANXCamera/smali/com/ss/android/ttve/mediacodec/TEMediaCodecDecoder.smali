.class public Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;
.super Ljava/lang/Object;
.source "TEMediaCodecDecoder.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;
    }
.end annotation


# static fields
.field private static final ERROR_EOF:I = -0x1

.field private static final ERROR_FAIL:I = -0x2

.field private static final ERROR_OK:I = 0x0

.field private static final ERROR_UNUSUAL:I = -0x3

.field private static final TAG:Ljava/lang/String; = "MediaCodecDecoder"

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final m_verbose:Z = false


# instance fields
.field private final MAX_DELAY_COUNT:I

.field private final MAX_SLEEP_MS:J

.field private m_bIsNeedReconfigure:Z

.field private m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private m_decoder:Landroid/media/MediaCodec;

.field private m_decoderStarted:Z

.field private m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

.field private m_extraDataBuf:Ljava/nio/ByteBuffer;

.field private m_format:Landroid/media/MediaFormat;

.field private m_frameAvailable:Z

.field private final m_frameSyncObject:Ljava/lang/Object;

.field private m_iCurCount:I

.field private m_iHeight:I

.field private m_iWidth:I

.field private m_inputBufferQueued:Z

.field private m_pendingInputFrameCount:I

.field private m_ppsBuf:Ljava/nio/ByteBuffer;

.field private m_sawInputEOS:Z

.field private m_sawOutputEOS:Z

.field private m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

.field private m_spsBuf:Ljava/nio/ByteBuffer;

.field private m_surface:Landroid/view/Surface;

.field private m_surfaceTexID:[I

.field private m_surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

.field private m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

.field private m_timestampOfCurTexFrame:J

.field private m_timestampOfLastDecodedFrame:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    .line 52
    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    .line 53
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_extraDataBuf:Ljava/nio/ByteBuffer;

    .line 54
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    .line 55
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    .line 56
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    .line 58
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    .line 60
    const/4 v2, 0x1

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    .line 61
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 62
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    .line 64
    new-instance v2, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v2}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 66
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    .line 67
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    .line 69
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    .line 70
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    .line 72
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    .line 73
    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    .line 74
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    .line 75
    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    .line 76
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    .line 77
    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    .line 79
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    .line 81
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 82
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    .line 83
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    .line 88
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->MAX_SLEEP_MS:J

    .line 89
    const/16 v1, 0xa

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->MAX_DELAY_COUNT:I

    .line 90
    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    .line 93
    return-void
.end method

.method private AwaitNewImage()Z
    .locals 6

    .line 528
    nop

    .line 530
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    monitor-enter v0

    .line 531
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 535
    :try_start_1
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 536
    iget-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    if-nez v1, :cond_0

    .line 538
    const-string v1, "MediaCodecDecoder"

    const-string v3, "Frame wait timed out!"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 539
    :try_start_2
    monitor-exit v0

    return v2

    .line 546
    :cond_0
    goto :goto_0

    .line 541
    :catch_0
    move-exception v1

    .line 543
    const-string v3, "MediaCodecDecoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 545
    monitor-exit v0

    return v2

    .line 549
    :cond_1
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    .line 550
    monitor-exit v0

    .line 565
    const/4 v0, 0x1

    return v0

    .line 550
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private DecodeFrame2Surface([BIJ)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move/from16 v5, p2

    .line 570
    nop

    .line 571
    nop

    .line 572
    nop

    .line 573
    nop

    .line 575
    iget-boolean v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-nez v0, :cond_4

    .line 577
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v0

    .line 578
    nop

    .line 579
    move v4, v9

    :cond_0
    if-gez v0, :cond_1

    .line 581
    const-wide/16 v6, 0x5

    :try_start_0
    invoke-static {v6, v7, v9}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 584
    goto :goto_0

    .line 582
    :catch_0
    move-exception v0

    .line 583
    move-object v6, v0

    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 585
    :goto_0
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v0

    .line 586
    add-int/2addr v4, v10

    .line 587
    const/16 v6, 0x14

    if-lt v4, v6, :cond_0

    .line 588
    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "try dequeueInputBuffer timeout -- "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    nop

    .line 594
    :cond_1
    move v12, v0

    if-ltz v12, :cond_3

    .line 595
    invoke-direct {v1, v12}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->getInputBufferByIdx(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 597
    if-nez v5, :cond_2

    .line 599
    iget-object v11, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-wide/16 v15, 0x0

    const/16 v17, 0x4

    invoke-virtual/range {v11 .. v17}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 600
    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    goto :goto_1

    .line 604
    :cond_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 605
    move-object/from16 v2, p1

    invoke-virtual {v0, v2, v9, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 607
    iget-object v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v4, 0x0

    const/4 v8, 0x0

    move v3, v12

    move-wide/from16 v6, p3

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 612
    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    .line 613
    iget v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    add-int/2addr v0, v10

    iput v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    .line 617
    :goto_1
    goto :goto_2

    .line 618
    :cond_3
    nop

    .line 619
    const-string v0, "MediaCodecDecoder"

    const-string v2, "Input buffer not available"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    move v0, v10

    goto :goto_3

    :cond_4
    :goto_2
    move v0, v9

    :goto_3
    iget-boolean v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-eqz v2, :cond_5

    .line 628
    const v2, 0x927c0

    goto :goto_4

    .line 629
    :cond_5
    iget v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    const/4 v3, 0x2

    if-le v2, v3, :cond_6

    .line 630
    const/16 v2, 0x7530

    goto :goto_4

    .line 634
    :cond_6
    nop

    .line 638
    move v2, v9

    .line 641
    :goto_4
    iget-object v3, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iget-object v4, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    int-to-long v5, v2

    invoke-virtual {v3, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v3

    .line 642
    const/4 v4, -0x3

    if-ne v3, v4, :cond_7

    goto :goto_4

    .line 646
    :cond_7
    const/4 v5, -0x2

    if-ne v3, v5, :cond_8

    .line 647
    iget-object v3, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 650
    goto :goto_4

    .line 656
    :cond_8
    const/4 v2, -0x1

    if-ne v3, v2, :cond_a

    .line 742
    if-eqz v0, :cond_9

    .line 743
    return v4

    .line 745
    :cond_9
    return v5

    .line 660
    :cond_a
    if-gez v3, :cond_b

    .line 661
    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected result from decoder.dequeueOutputBuffer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    return v5

    .line 669
    :cond_b
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    .line 672
    iput-boolean v10, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    .line 676
    :cond_c
    nop

    .line 702
    iget-boolean v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-nez v0, :cond_d

    .line 704
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v6, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    .line 705
    iget v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    sub-int/2addr v0, v10

    iput v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    .line 709
    goto :goto_5

    .line 716
    :cond_d
    move v10, v9

    :goto_5
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v3, v10}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 717
    if-eqz v10, :cond_10

    .line 721
    invoke-direct/range {p0 .. p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->AwaitNewImage()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 723
    iget-object v0, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v2, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v2, v1, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    .line 726
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-nez v0, :cond_e

    .line 733
    return v9

    .line 727
    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ": glError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MediaCodecDecoder"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 735
    :cond_f
    const-string v0, "MediaCodecDecoder"

    const-string v1, "Render decoded frame to surface texture failed!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    return v5

    .line 739
    :cond_10
    return v2
.end method

.method public static IsInAndriodHardwareBlacklist()Z
    .locals 4

    .line 750
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 751
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 754
    const-string v2, "Meizu"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    const-string v2, "m2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 755
    return v3

    .line 757
    :cond_0
    const-string v2, "Xiaomi"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MI 4W"

    invoke-virtual {v1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 758
    return v3

    .line 760
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static IsInAndriodHardwareWhitelist()Z
    .locals 4

    .line 764
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 765
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 767
    const-string v2, "samsung"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    const-string v2, "GT-I9152"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 768
    return v3

    .line 770
    :cond_0
    const-string v2, "HUAWEI"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "HUAWEI P6-C00"

    invoke-virtual {v1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 771
    return v3

    .line 773
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private IsValid()Z
    .locals 1

    .line 461
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private SetupDecoder(Ljava/lang/String;)Z
    .locals 4

    .line 470
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    .line 471
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 472
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 473
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    .line 474
    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    nop

    .line 483
    return p1

    .line 476
    :catch_0
    move-exception p1

    .line 477
    const-string v1, "MediaCodecDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 479
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    .line 480
    return v0
.end method

.method private createTexture()I
    .locals 4

    .line 334
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 336
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    if-gtz v0, :cond_0

    .line 337
    const-string v0, "MediaCodecDecoder"

    const-string v2, "createTexture failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    return v1

    .line 341
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    const v2, 0x8d65

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 343
    const/16 v0, 0x2801

    const/high16 v3, 0x46180000    # 9728.0f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 345
    const/16 v0, 0x2800

    const v3, 0x46180400    # 9729.0f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 347
    const/16 v0, 0x2802

    const v3, 0x812f

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 349
    const/16 v0, 0x2803

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 352
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v1

    return v0
.end method

.method private deleteTexture()V
    .locals 3

    .line 356
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-eqz v0, :cond_0

    .line 357
    const/4 v0, 0x1

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 358
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aput v1, v0, v1

    .line 360
    :cond_0
    return-void
.end method

.method private getInputBufferByIdx(I)Ljava/nio/ByteBuffer;
    .locals 2

    .line 518
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 519
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1

    .line 521
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 522
    aget-object p1, v0, p1

    return-object p1
.end method

.method private reconfigureMediaFormat()I
    .locals 4

    .line 305
    nop

    .line 307
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "video/avc"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    invoke-static {v1, v2, v3}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v1

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    .line 309
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_0

    .line 310
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "csd-0"

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 313
    :cond_0
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_1

    .line 314
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "csd-1"

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 317
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_2

    .line 321
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_format:Landroid/media/MediaFormat;

    const-string v2, "max-input-size"

    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    :cond_2
    nop

    .line 328
    goto :goto_0

    .line 326
    :catch_0
    move-exception v0

    .line 327
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 330
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method private restartDecoder()I
    .locals 1

    .line 444
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    .line 445
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->startDecoder()I

    move-result v0

    return v0
.end method

.method private startDecoder()I
    .locals 6

    .line 377
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->IsValid()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    .line 378
    const-string v0, "MediaCodecDecoder"

    const-string v2, "You can\'t call startDecoder() twice!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    return v1

    .line 382
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    const/4 v2, 0x0

    aget v0, v0, v2

    .line 383
    if-nez v0, :cond_1

    .line 384
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->createTexture()I

    move-result v0

    .line 387
    :cond_1
    if-nez v0, :cond_2

    .line 388
    return v1

    .line 395
    :cond_2
    :try_start_0
    new-instance v3, Landroid/graphics/SurfaceTexture;

    invoke-direct {v3, v0}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 396
    const-string v3, "MediaCodecDecoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Surface texture with texture (id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ") has been created."

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 398
    new-instance v0, Landroid/view/Surface;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    nop

    .line 406
    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v3}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    .line 407
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    invoke-virtual {v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->surfaceCreated()V

    .line 409
    const-string v0, "video/avc"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->SetupDecoder(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 410
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    .line 411
    return v1

    .line 414
    :cond_3
    return v2

    .line 399
    :catch_0
    move-exception v0

    .line 400
    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 402
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    .line 403
    return v1
.end method

.method private stopDecoder()I
    .locals 2

    .line 419
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    .line 421
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    invoke-virtual {v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->release()V

    .line 423
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    .line 426
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    .line 427
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 428
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surface:Landroid/view/Surface;

    .line 431
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_2

    .line 434
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 435
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 436
    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 439
    :cond_2
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public CleanupDecoder()V
    .locals 5

    .line 487
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 488
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    if-eqz v0, :cond_1

    .line 490
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    if-eqz v0, :cond_0

    .line 491
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 492
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    goto :goto_0

    .line 496
    :catch_0
    move-exception v0

    .line 497
    const-string v2, "MediaCodecDecoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 500
    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoderStarted:Z

    .line 502
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 503
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    .line 506
    :cond_2
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    .line 507
    iput-wide v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    .line 508
    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    .line 509
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    .line 510
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    .line 514
    return-void
.end method

.method public closeEncoder()I
    .locals 1

    .line 168
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->stopDecoder()I

    .line 170
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 172
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 175
    :cond_0
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->deleteTexture()V

    .line 182
    const/4 v0, 0x0

    return v0
.end method

.method public decodeFrame([BIJI)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez v0, :cond_0

    .line 199
    new-instance v0, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    .line 200
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    .line 204
    :cond_0
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v1}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/opengl/EGLContext;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    .line 205
    const-string v0, "MediaCodecDecoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "eglGetCurrentContext = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " getSavedEGLContext = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v3}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    .line 209
    :cond_1
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 210
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->restartDecoder()I

    .line 211
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    .line 212
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    .line 215
    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    if-nez v0, :cond_3

    .line 216
    const/4 p1, -0x2

    return p1

    .line 219
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 220
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->DecodeFrame2Surface([BIJ)I

    move-result p1

    .line 221
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    .line 222
    sub-long/2addr p2, v3

    const-wide/16 v3, 0x0

    sub-long p2, v3, p2

    .line 223
    iget p4, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    const/16 v0, 0xa

    if-ge p4, v0, :cond_4

    cmp-long p4, p2, v3

    if-lez p4, :cond_4

    .line 225
    :try_start_0
    invoke-static {p2, p3, v2}, Ljava/lang/Thread;->sleep(JI)V

    .line 226
    const-string p4, "MediaCodecDecoder"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Sleep "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, "ms for delay output!!!"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p4, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    goto :goto_0

    .line 227
    :catch_0
    move-exception p2

    .line 228
    invoke-virtual {p2}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 230
    :goto_0
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    add-int/2addr p2, v1

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iCurCount:I

    .line 233
    :cond_4
    if-nez p1, :cond_5

    .line 234
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p2}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 235
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    if-eqz p2, :cond_5

    if-lez p5, :cond_5

    .line 236
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureRender:Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;

    iget p3, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    iget p4, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_surfaceTexID:[I

    aget v0, v0, v2

    invoke-virtual {p2, p3, p4, v0, p5}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder$SOES2DTextureRender;->drawFrame(IIII)V

    .line 240
    :cond_5
    return p1
.end method

.method public flushDecoder()I
    .locals 3

    .line 269
    nop

    .line 270
    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "flushDecoder m_decoder = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, -0x3

    if-eqz v0, :cond_4

    .line 273
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawInputEOS:Z

    const/4 v2, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_sawOutputEOS:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 284
    :cond_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    if-eqz v0, :cond_3

    .line 287
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 288
    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_inputBufferQueued:Z

    .line 289
    iput v2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_pendingInputFrameCount:I

    .line 293
    goto :goto_1

    .line 274
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->CleanupDecoder()V

    .line 275
    const-string v0, "video/avc"

    invoke-direct {p0, v0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->SetupDecoder(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_2

    .line 276
    const/4 v0, -0x2

    .line 299
    move v1, v0

    goto :goto_2

    .line 280
    :cond_2
    nop

    .line 299
    :goto_1
    move v1, v2

    :cond_3
    :goto_2
    goto :goto_3

    .line 297
    :catch_0
    move-exception v0

    .line 298
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 301
    :cond_4
    :goto_3
    return v1
.end method

.method public getInfoByFlag([II)I
    .locals 8

    .line 251
    nop

    .line 255
    const/16 v0, 0x20

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    if-ne p2, v2, :cond_0

    .line 256
    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    and-long/2addr v6, v4

    long-to-int p2, v6

    aput p2, p1, v3

    .line 257
    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfLastDecodedFrame:J

    shr-long/2addr v6, v0

    and-long v3, v6, v4

    long-to-int p2, v3

    aput p2, p1, v2

    .line 258
    goto :goto_0

    .line 259
    :cond_0
    if-ne p2, v1, :cond_1

    .line 260
    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    and-long/2addr v6, v4

    long-to-int p2, v6

    aput p2, p1, v3

    .line 261
    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_timestampOfCurTexFrame:J

    shr-long/2addr v6, v0

    and-long v3, v6, v4

    long-to-int p2, v3

    aput p2, p1, v2

    .line 262
    goto :goto_0

    .line 265
    :cond_1
    move v1, v3

    :goto_0
    return v1
.end method

.method public initDecoder(II[BI[BI)I
    .locals 3

    .line 111
    const-string v0, "MediaCodecDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual/range {p0 .. p6}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->setEncoder(II[BI[BI)I

    move-result p1

    .line 114
    iget-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    if-eqz p2, :cond_0

    .line 115
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->reconfigureMediaFormat()I

    move-result p1

    .line 118
    :cond_0
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez p2, :cond_1

    .line 119
    new-instance p2, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {p2}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    .line 120
    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {p2}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    .line 123
    :cond_1
    iget-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    if-eqz p2, :cond_2

    .line 124
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->restartDecoder()I

    .line 125
    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    .line 128
    :cond_2
    return p1
.end method

.method public initTextureDrawer()Z
    .locals 3

    .line 363
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    .line 365
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 367
    :cond_0
    invoke-static {}, Lcom/ss/android/ttve/common/TETextureDrawer;->create()Lcom/ss/android/ttve/common/TETextureDrawer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    .line 368
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_1

    .line 369
    const/4 v0, 0x0

    return v0

    .line 371
    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/common/TETextureDrawer;->setRotation(F)V

    .line 372
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttve/common/TETextureDrawer;->setFlipScale(FF)V

    .line 373
    const/4 v0, 0x1

    return v0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 451
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    monitor-enter p1

    .line 452
    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    if-eqz v0, :cond_0

    .line 453
    const-string v0, "MediaCodecDecoder"

    const-string v1, "m_frameAvailable already set, frame could be dropped!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameAvailable:Z

    .line 456
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_frameSyncObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 457
    monitor-exit p1

    .line 458
    return-void

    .line 457
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setEncoder(II[BI[BI)I
    .locals 0

    .line 144
    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iWidth:I

    .line 145
    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_iHeight:I

    .line 146
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    .line 147
    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    .line 148
    const/4 p1, 0x0

    if-lez p4, :cond_0

    .line 149
    invoke-static {p3, p1, p4}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_spsBuf:Ljava/nio/ByteBuffer;

    .line 152
    :cond_0
    if-lez p6, :cond_1

    .line 153
    invoke-static {p5, p1, p6}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_ppsBuf:Ljava/nio/ByteBuffer;

    .line 156
    :cond_1
    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/ss/android/ttve/mediacodec/TEMediaCodecDecoder;->m_bIsNeedReconfigure:Z

    .line 157
    return p1
.end method
