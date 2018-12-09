.class final Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;
.super Ljava/lang/Object;
.source "CircularMediaRecorder.java"

# interfaces
.implements Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$Cancellable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "VideoClipSavingRequest"
.end annotation


# instance fields
.field private final mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

.field private final mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mOrientationHint:I

.field private final mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

.field private final mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;


# direct methods
.method private static synthetic $closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    .locals 0

    .line 424
    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/AutoCloseable;->close()V

    :goto_0
    return-void
.end method

.method private constructor <init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;)V
    .locals 1

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 207
    if-nez p2, :cond_1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 208
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "At least one non-null snapshot should be provided"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 211
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    .line 212
    iput-object p2, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    .line 214
    iput p3, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mOrientationHint:I

    .line 215
    iput-object p4, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    .line 216
    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$1;)V
    .locals 0

    .line 195
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;-><init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;)V

    return-void
.end method

.method private isCancelled()Z
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method private static readFully(Ljava/lang/String;)[B
    .locals 6

    .line 412
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 413
    const/4 p0, 0x0

    :try_start_1
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 412
    nop

    .line 414
    const/16 v3, 0x800

    :try_start_2
    new-array v3, v3, [B

    .line 416
    :goto_0
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 417
    if-gez v4, :cond_0

    .line 418
    nop

    .line 423
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 424
    :try_start_3
    invoke-static {p0, v2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    invoke-static {p0, v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 423
    return-object v3

    .line 420
    :cond_0
    :try_start_5
    invoke-virtual {v2, v3, v0, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 422
    goto :goto_0

    .line 424
    :catchall_0
    move-exception v3

    move-object v4, p0

    goto :goto_1

    .line 412
    :catch_0
    move-exception v3

    :try_start_6
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 424
    :catchall_1
    move-exception v4

    move-object v5, v4

    move-object v4, v3

    move-object v3, v5

    :goto_1
    :try_start_7
    invoke-static {v4, v2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v3
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception v2

    goto :goto_2

    .line 412
    :catch_1
    move-exception p0

    :try_start_8
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 424
    :goto_2
    :try_start_9
    invoke-static {p0, v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->$closeResource(Ljava/lang/Throwable;Ljava/lang/AutoCloseable;)V

    throw v2
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    :catch_2
    move-exception p0

    .line 425
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to read the mp4 file content into memory: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    new-array p0, v0, [B

    return-object p0
.end method

.method private static writeAudioSamples(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;IJ)J
    .locals 18

    move-object/from16 v1, p1

    .line 362
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SAVE AUDIO: E"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    const-wide/16 v2, -0x1

    cmp-long v0, p3, v2

    if-nez v0, :cond_0

    const-wide/32 v4, 0x2dc6c0

    goto :goto_0

    .line 364
    :cond_0
    move-wide/from16 v4, p3

    :goto_0
    iget-wide v6, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    sub-long/2addr v6, v4

    const-wide/16 v4, 0x0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 365
    iget-wide v8, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->tail:J

    .line 367
    nop

    .line 368
    nop

    .line 369
    nop

    .line 370
    nop

    .line 372
    move-wide v11, v4

    const/4 v5, 0x0

    move-wide v3, v2

    const/4 v2, 0x0

    :goto_1
    if-nez v2, :cond_6

    .line 373
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v13, "AUDIO PACKET WAITING: E"

    invoke-static {v0, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    :try_start_0
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    nop

    .line 381
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v13, "AUDIO PACKET WAITING: X"

    invoke-static {v2, v13}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    iget-object v2, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    .line 385
    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 386
    iget-wide v13, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v13, v13, v6

    if-ltz v13, :cond_3

    iget-wide v14, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v14, v11

    cmp-long v13, v3, v14

    if-gez v13, :cond_3

    .line 387
    if-nez v5, :cond_1

    .line 388
    nop

    .line 389
    iget-wide v11, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 391
    const/4 v5, 0x1

    :cond_1
    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v3, v11

    iput-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 393
    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v3, v3, v8

    if-ltz v3, :cond_2

    .line 394
    const/4 v3, 0x4

    iput v3, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 396
    :cond_2
    move-object/from16 v13, p0

    move/from16 v14, p2

    invoke-virtual {v13, v14, v2, v0}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 397
    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 399
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v15

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WRITE AUDIO PACKET: time = "

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-wide/from16 v16, v3

    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v10, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", size = "

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", offset = "

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", capacity = "

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 399
    invoke-static {v15, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    move-wide/from16 v3, v16

    goto :goto_2

    :cond_3
    move-object/from16 v13, p0

    move/from16 v14, p2

    :goto_2
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    if-eqz v1, :cond_5

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v1, 0x4

    and-int/2addr v0, v1

    if-eqz v0, :cond_4

    goto :goto_3

    .line 406
    :cond_4
    const/4 v2, 0x0

    goto :goto_4

    .line 405
    :cond_5
    :goto_3
    nop

    .line 406
    const/4 v2, 0x1

    :goto_4
    goto :goto_5

    .line 377
    :catch_0
    move-exception v0

    move-object/from16 v13, p0

    move/from16 v14, p2

    .line 378
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v10, "AUDIO PACKET INTERRUPTED"

    invoke-static {v1, v10, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 379
    nop

    .line 372
    :goto_5
    move-object/from16 v1, p1

    goto/16 :goto_1

    .line 407
    :cond_6
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SAVE AUDIO: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    return-wide v3
.end method

.method private static writeVideoSamples(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;I)J
    .locals 17

    move-object/from16 v1, p1

    .line 311
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SAVE VIDEO: E"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    nop

    .line 313
    nop

    .line 314
    nop

    .line 315
    nop

    .line 317
    const-wide/16 v2, 0x0

    const-wide/16 v5, -0x1

    move-wide v8, v5

    const/4 v5, 0x0

    const/4 v10, 0x0

    move-wide v6, v2

    :goto_0
    if-nez v5, :cond_5

    .line 318
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v11, "VIDEO PACKET WAITING: E"

    invoke-static {v0, v11}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    :try_start_0
    iget-object v0, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->samples:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    nop

    .line 326
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v11

    const-string v12, "VIDEO PACKET WAITING: X"

    invoke-static {v11, v12}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    iget-object v11, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->data:Ljava/nio/ByteBuffer;

    .line 330
    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Sample;->info:Landroid/media/MediaCodec$BufferInfo;

    .line 331
    iget v12, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v13, 0x1

    and-int/2addr v12, v13

    if-nez v12, :cond_0

    if-nez v10, :cond_0

    .line 332
    nop

    .line 317
    move-object/from16 v12, p0

    goto :goto_0

    .line 335
    :cond_0
    iget-wide v14, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v14, v6

    cmp-long v5, v8, v14

    if-gez v5, :cond_2

    .line 336
    if-nez v10, :cond_1

    .line 337
    nop

    .line 338
    iget-wide v6, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 340
    move v10, v13

    :cond_1
    iget-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    sub-long/2addr v8, v6

    iput-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 341
    move-object/from16 v12, p0

    move/from16 v14, p2

    invoke-virtual {v12, v14, v11, v0}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 342
    iget-wide v8, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 344
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v5

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WRITE VIDEO PACKET: time = "

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v13, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v15, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, ", size = "

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", offset = "

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", capacity = "

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 344
    invoke-static {v5, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 350
    :cond_2
    move-object/from16 v12, p0

    :goto_1
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    if-eqz v4, :cond_4

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_3

    goto :goto_2

    .line 351
    :cond_3
    const/4 v5, 0x0

    goto :goto_3

    .line 350
    :cond_4
    :goto_2
    nop

    .line 351
    const/4 v5, 0x1

    :goto_3
    goto/16 :goto_0

    .line 322
    :catch_0
    move-exception v0

    move-object/from16 v12, p0

    .line 323
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v4

    const-string v11, "VIDEO PACKET WAITING INTERRUPTED"

    invoke-static {v4, v11, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 324
    goto/16 :goto_0

    .line 353
    :cond_5
    iget-wide v4, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->curr:J

    sub-long/2addr v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->curr:J

    .line 355
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VIDEO COVER FRAME TIMESTAMP: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, v1, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->curr:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SAVE VIDEO: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    return-wide v8
.end method


# virtual methods
.method public final cancel()V
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mCancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 220
    return-void
.end method

.method public run()V
    .locals 12

    .line 228
    invoke-direct {p0}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 229
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Saving request is requested to be cancelled before executing"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    invoke-interface {v0}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;->onVideoClipSavingCancelled()V

    .line 233
    :cond_0
    return-void

    .line 236
    :cond_1
    nop

    .line 237
    nop

    .line 240
    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$200()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 241
    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    const-string v3, "microvideo.mp4"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0

    .line 243
    :cond_2
    const-string v1, "microvideo"

    const-string v2, ".mp4"

    invoke-static {v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 247
    :goto_0
    :try_start_1
    new-instance v2, Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    :try_start_2
    iget v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mOrientationHint:I

    invoke-virtual {v2, v0}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 251
    nop

    .line 252
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    const/4 v3, -0x1

    if-eqz v0, :cond_3

    .line 253
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v0, v0, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->format:Landroid/media/MediaFormat;

    invoke-virtual {v2, v0}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    goto :goto_1

    .line 257
    :cond_3
    move v0, v3

    .line 258
    :goto_1
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    if-eqz v4, :cond_4

    .line 259
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-object v4, v4, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->format:Landroid/media/MediaFormat;

    invoke-virtual {v2, v4}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v4

    goto :goto_2

    .line 263
    :cond_4
    move v4, v3

    :goto_2
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->start()V

    .line 266
    nop

    .line 267
    iget-object v5, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    const-wide/16 v6, -0x1

    if-eqz v5, :cond_5

    if-eq v0, v3, :cond_5

    .line 268
    iget-object v5, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    invoke-static {v2, v5, v0}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->writeVideoSamples(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;I)J

    move-result-wide v8

    .line 269
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "VIDEO DURATION: "

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, " Usec"

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 273
    :cond_5
    move-wide v8, v6

    .line 274
    :goto_3
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    if-eqz v0, :cond_6

    if-eq v4, v3, :cond_6

    .line 275
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mAudioSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    invoke-static {v2, v0, v4, v8, v9}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->writeAudioSamples(Landroid/media/MediaMuxer;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;IJ)J

    move-result-wide v3

    .line 276
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AUDIO DURATION: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " Usec"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    :cond_6
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->stop()V

    .line 282
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    if-eqz v0, :cond_8

    .line 283
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->readFully(Ljava/lang/String;)[B

    move-result-object v0

    .line 284
    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    .line 285
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    if-nez v4, :cond_7

    goto :goto_4

    :cond_7
    iget-object v4, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoSnapshot:Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    iget-wide v6, v4, Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;->curr:J

    .line 284
    :goto_4
    invoke-interface {v3, v0, v6, v7}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;->onVideoClipSavingCompleted([BJ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 294
    :cond_8
    nop

    .line 296
    :try_start_3
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 299
    goto :goto_5

    .line 297
    :catch_0
    move-exception v0

    .line 298
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to release the media muxer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :goto_5
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$200()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 303
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    goto/16 :goto_8

    .line 304
    :cond_9
    if-eqz v1, :cond_d

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_d

    .line 305
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    goto/16 :goto_9

    .line 287
    :catch_1
    move-exception v0

    goto :goto_6

    .line 294
    :catchall_0
    move-exception v2

    move-object v11, v2

    move-object v2, v0

    move-object v0, v11

    goto/16 :goto_b

    .line 287
    :catch_2
    move-exception v2

    move-object v11, v2

    move-object v2, v0

    move-object v0, v11

    goto :goto_6

    .line 294
    :catchall_1
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    goto/16 :goto_b

    .line 287
    :catch_3
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    .line 288
    :goto_6
    :try_start_4
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to save the videoclip as an mp4 file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    if-eqz v3, :cond_a

    .line 290
    iget-object v3, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingRequest;->mVideoClipSavingCallback:Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;

    invoke-interface {v3, v0}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;->onVideoClipSavingException(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 294
    :cond_a
    if-eqz v2, :cond_b

    .line 296
    :try_start_5
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->release()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 299
    goto :goto_7

    .line 297
    :catch_4
    move-exception v0

    .line 298
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to release the media muxer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :cond_b
    :goto_7
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$200()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 303
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_8
    const-string v3, "Ignore deleting the temporary mp4 file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 304
    :cond_c
    if-eqz v1, :cond_d

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_d

    .line 305
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_9
    const-string v3, "Failed to delete the temporary mp4 file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    :cond_d
    :goto_a
    return-void

    .line 294
    :catchall_2
    move-exception v0

    :goto_b
    if-eqz v2, :cond_e

    .line 296
    :try_start_6
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->release()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 299
    goto :goto_c

    .line 297
    :catch_5
    move-exception v3

    .line 298
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to release the media muxer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    :cond_e
    :goto_c
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$200()Z

    move-result v2

    if-nez v2, :cond_f

    .line 304
    if-eqz v1, :cond_10

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_10

    .line 305
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to delete the temporary mp4 file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 303
    :cond_f
    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Ignore deleting the temporary mp4 file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    :cond_10
    :goto_d
    throw v0
.end method
