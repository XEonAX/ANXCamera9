.class public Lcom/ss/android/medialib/AVCEncoder;
.super Ljava/lang/Object;
.source "AVCEncoder.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/AVCEncoder$Status;
    }
.end annotation


# static fields
.field private static final BITRATE_MODES:[Ljava/lang/String;

.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "AVCEncoder"

.field private static TIMEOUT_USEC:I

.field static mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;


# instance fields
.field private codec_config:[B

.field fileWriter:Ljava/io/BufferedOutputStream;

.field inputBuffers:[Ljava/nio/ByteBuffer;

.field mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private mCodecName:Ljava/lang/String;

.field private mDrawCount:I

.field private mEncodeCount:I

.field private mFlag:Z

.field mFrameRate:I

.field private mHeight:I

.field private mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecInfo:Landroid/media/MediaCodecInfo;

.field private mPTSQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mProfile:I

.field private mSurface:Landroid/view/Surface;

.field private mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

.field private mWidth:I

.field outputBuffers:[Ljava/nio/ByteBuffer;

.field status:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 43
    const-string v0, "BITRATE_MODE_CQ"

    const-string v1, "BITRATE_MODE_VBR"

    const-string v2, "BITRATE_MODE_CBR"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/medialib/AVCEncoder;->BITRATE_MODES:[Ljava/lang/String;

    .line 47
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    .line 48
    const/16 v0, 0x1388

    sput v0, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    .line 71
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/ss/android/medialib/AVCEncoder$1;

    invoke-direct {v1}, Lcom/ss/android/medialib/AVCEncoder$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 77
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 78
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 52
    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 53
    const-string v1, "video/avc"

    iput-object v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    .line 63
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mFlag:Z

    .line 65
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/ss/android/medialib/AVCEncoder;->mPTSQueue:Ljava/util/Queue;

    .line 66
    iput v1, p0, Lcom/ss/android/medialib/AVCEncoder;->status:I

    .line 67
    const/16 v2, 0x1e

    iput v2, p0, Lcom/ss/android/medialib/AVCEncoder;->mFrameRate:I

    .line 68
    const/4 v2, 0x1

    iput v2, p0, Lcom/ss/android/medialib/AVCEncoder;->mProfile:I

    .line 510
    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->fileWriter:Ljava/io/BufferedOutputStream;

    .line 511
    iput v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mDrawCount:I

    .line 512
    iput v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mEncodeCount:I

    .line 90
    return-void
.end method

.method private getMediaCodecInfo()Landroid/media/MediaCodecInfo;
    .locals 8

    .line 99
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    .line 100
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_4

    .line 101
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v3

    .line 102
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v4

    if-nez v4, :cond_0

    .line 103
    goto :goto_2

    .line 105
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v4

    .line 106
    const-string v5, "OMX.google."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "OMX.Nvidia."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "OMX.TI.DUCATI1.VIDEO.H264E"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 108
    goto :goto_2

    .line 110
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v4

    .line 111
    move v5, v1

    :goto_1
    array-length v6, v4

    if-ge v5, v6, :cond_3

    .line 112
    aget-object v6, v4, v5

    iget-object v7, p0, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 113
    return-object v3

    .line 111
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 100
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 117
    :cond_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private getMediaCodecInfo21()Landroid/media/MediaCodecInfo;
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 122
    new-instance v0, Landroid/media/MediaCodecList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 123
    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v0

    .line 124
    const/4 v1, 0x0

    if-eqz v0, :cond_6

    array-length v2, v0

    if-nez v2, :cond_0

    goto :goto_3

    .line 125
    :cond_0
    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_5

    aget-object v5, v0, v4

    .line 126
    if-eqz v5, :cond_4

    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v6

    if-nez v6, :cond_1

    .line 127
    goto :goto_2

    .line 129
    :cond_1
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v6

    .line 130
    const-string v7, "OMX.google."

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v7, "OMX.Nvidia."

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v7, "OMX.TI.DUCATI1.VIDEO.H264E"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 132
    goto :goto_2

    .line 134
    :cond_2
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v6

    .line 135
    move v7, v3

    :goto_1
    array-length v8, v6

    if-ge v7, v8, :cond_4

    .line 136
    aget-object v8, v6, v7

    iget-object v9, p0, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 137
    return-object v5

    .line 135
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 125
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 141
    :cond_5
    return-object v1

    .line 124
    :cond_6
    :goto_3
    return-object v1
.end method

.method private getOneColorFormat()I
    .locals 5

    .line 177
    invoke-virtual {p0}, Lcom/ss/android/medialib/AVCEncoder;->getColorFormats()[I

    move-result-object v0

    .line 178
    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 179
    return v1

    .line 182
    :cond_0
    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 183
    aget v3, v0, v2

    const v4, 0x7f000789

    if-ne v3, v4, :cond_1

    .line 184
    const-string v1, "AVCEncoder"

    const-string v3, "====== colorFormat support COLOR_FormatSurface ======"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    aget v0, v0, v2

    return v0

    .line 182
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 189
    :cond_2
    return v1
.end method

.method public static setDrainWaitTimeout(I)V
    .locals 0

    .line 81
    sput p0, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    .line 82
    return-void
.end method

.method private testCode(Z)V
    .locals 9

    .line 469
    iget v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    iget v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 470
    iget v4, p0, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    iget v5, p0, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/16 v6, 0x1908

    const/16 v7, 0x1401

    move-object v8, v0

    invoke-static/range {v2 .. v8}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 473
    :try_start_0
    iget-object v1, p0, Lcom/ss/android/medialib/AVCEncoder;->fileWriter:Ljava/io/BufferedOutputStream;

    if-nez v1, :cond_0

    .line 474
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    const-string v3, "/storage/emulated/0/xzw/rgbaBig.rgba"

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lcom/ss/android/medialib/AVCEncoder;->fileWriter:Ljava/io/BufferedOutputStream;

    .line 476
    :cond_0
    iget-object v1, p0, Lcom/ss/android/medialib/AVCEncoder;->fileWriter:Ljava/io/BufferedOutputStream;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 479
    goto :goto_0

    .line 477
    :catch_0
    move-exception v1

    .line 478
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 481
    :goto_0
    iget v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    iget v2, p0, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 482
    invoke-virtual {v1, v0}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 484
    if-eqz p1, :cond_1

    .line 485
    const-string p1, "/sdcard/aweme/picture/record_e.jpeg"

    invoke-virtual {p0, v1, p1}, Lcom/ss/android/medialib/AVCEncoder;->saveBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    goto :goto_1

    .line 487
    :cond_1
    const-string p1, "/sdcard/aweme/picture/record_s.jpeg"

    invoke-virtual {p0, v1, p1}, Lcom/ss/android/medialib/AVCEncoder;->saveBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 489
    :goto_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 490
    return-void
.end method


# virtual methods
.method public encode(IIIZ)I
    .locals 18

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    .line 514
    move/from16 v3, p4

    const-string v4, "AVCEncoder"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "encodeTexture::texID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " pts: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " duration:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "  isEndStream = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    monitor-enter p0

    .line 517
    :try_start_0
    iget v4, v1, Lcom/ss/android/medialib/AVCEncoder;->status:I

    const/4 v5, 0x2

    const/4 v7, -0x1

    if-ne v4, v5, :cond_15

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-nez v4, :cond_0

    goto/16 :goto_7

    .line 522
    :cond_0
    if-lez v0, :cond_14

    if-gez v2, :cond_1

    goto/16 :goto_6

    .line 526
    :cond_1
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    if-nez v4, :cond_2

    .line 527
    invoke-virtual/range {p0 .. p0}, Lcom/ss/android/medialib/AVCEncoder;->initEGLCtx()Z

    move-result v4

    if-nez v4, :cond_2

    .line 528
    monitor-exit p0

    return v7

    .line 533
    :cond_2
    nop

    .line 534
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mPTSQueue:Ljava/util/Queue;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 535
    iget v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    iget v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    const/4 v6, 0x0

    invoke-static {v6, v6, v2, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 536
    const-string v2, "AVCEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "encode: width = "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " height = "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, v1, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    invoke-virtual {v2, v0}, Lcom/ss/android/medialib/common/TextureDrawer;->drawTexture(I)V

    .line 538
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 539
    iget v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mDrawCount:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    iput v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mDrawCount:I

    .line 541
    sget-object v0, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v0}, Lcom/ss/android/medialib/AVCEncoderInterface;->onSwapGlBuffers()V

    .line 543
    iget-boolean v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mFlag:Z

    if-eqz v0, :cond_3

    .line 544
    invoke-direct {v1, v3}, Lcom/ss/android/medialib/AVCEncoder;->testCode(Z)V

    .line 545
    iput-boolean v6, v1, Lcom/ss/android/medialib/AVCEncoder;->mFlag:Z

    .line 549
    :cond_3
    if-eqz v3, :cond_4

    .line 550
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 556
    :cond_4
    move v0, v6

    :goto_0
    add-int/2addr v0, v2

    .line 558
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-ge v4, v8, :cond_5

    .line 559
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 562
    :cond_5
    const/4 v4, -0x2

    :try_start_1
    iget-object v9, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v10, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    sget v11, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    int-to-long v11, v11

    invoke-virtual {v9, v10, v11, v12}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v9
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 565
    nop

    .line 566
    :try_start_2
    const-string v10, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "outputBufferIndex = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    const-string v10, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mBufferInfo.flags = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v12, v12, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    if-ne v9, v7, :cond_7

    .line 570
    if-eqz v3, :cond_6

    sget v4, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    const/16 v8, 0x1388

    if-ge v4, v8, :cond_6

    .line 571
    const/16 v4, 0x2710

    sput v4, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    .line 573
    :cond_6
    if-eqz v3, :cond_a

    iget v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mDrawCount:I

    iget v8, v1, Lcom/ss/android/medialib/AVCEncoder;->mEncodeCount:I

    if-eq v4, v8, :cond_a

    const/16 v4, 0xa

    if-ge v0, v4, :cond_a

    .line 574
    goto :goto_0

    .line 577
    :cond_7
    const/4 v10, -0x3

    if-ne v9, v10, :cond_8

    .line 578
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    goto/16 :goto_5

    .line 579
    :cond_8
    if-ne v9, v4, :cond_9

    .line 580
    const-string v4, "AVCEncoder"

    const-string v8, "encode: output format change!"

    invoke-static {v4, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .line 581
    :cond_9
    if-gez v9, :cond_c

    .line 582
    const-string v0, "AVCEncoder"

    const-string v2, "encode: error."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 583
    nop

    .line 713
    :cond_a
    if-eqz v3, :cond_b

    .line 714
    invoke-virtual/range {p0 .. p0}, Lcom/ss/android/medialib/AVCEncoder;->releaseEGLCtx()V

    .line 716
    :cond_b
    monitor-exit p0

    .line 718
    return v6

    .line 585
    :cond_c
    nop

    .line 587
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v8, :cond_d

    .line 588
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, v9}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 592
    :goto_1
    move-object v11, v0

    goto :goto_2

    .line 590
    :cond_d
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, v9

    goto :goto_1

    .line 592
    :goto_2
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v11, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 593
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v0, v4

    invoke-virtual {v11, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 594
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v0, v5

    if-eqz v0, :cond_f

    .line 600
    const-string v0, "AVCEncoder"

    const-string v4, "mEncoderCaller.onSetCodecConfig"

    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    sget-object v0, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v0, :cond_e

    .line 602
    sget-object v0, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v0, v11}, Lcom/ss/android/medialib/AVCEncoderInterface;->onSetCodecConfig(Ljava/nio/ByteBuffer;)V

    .line 604
    :cond_e
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iput v6, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    goto/16 :goto_4

    .line 609
    :cond_f
    nop

    .line 610
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v0, v2

    if-eqz v0, :cond_10

    .line 611
    nop

    .line 620
    move/from16 v17, v2

    goto :goto_3

    :cond_10
    move/from16 v17, v6

    :goto_3
    const-string v0, "AVCEncoder"

    const-string v4, "mEncoderCaller.onWriteFile"

    invoke-static {v0, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    sget-object v0, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v0, :cond_13

    .line 622
    const-string v0, "AVCEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "encode: pts queue size = "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v1, Lcom/ss/android/medialib/AVCEncoder;->mPTSQueue:Ljava/util/Queue;

    invoke-interface {v8}, Ljava/util/Queue;->size()I

    move-result v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mPTSQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    if-lez v0, :cond_12

    .line 624
    iget v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mEncodeCount:I

    add-int/2addr v0, v2

    iput v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mEncodeCount:I

    .line 625
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mPTSQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 626
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v12, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    const-wide/16 v14, 0x0

    cmp-long v4, v12, v14

    if-lez v4, :cond_11

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v14, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    nop

    .line 627
    :cond_11
    sget-object v10, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    const-wide/16 v12, 0x3e8

    div-long v12, v14, v12

    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v14, v4

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v16

    invoke-interface/range {v10 .. v17}, Lcom/ss/android/medialib/AVCEncoderInterface;->onWriteFile(Ljava/nio/ByteBuffer;JJII)V

    .line 629
    goto :goto_4

    .line 630
    :cond_12
    const-string v0, "AVCEncoder"

    const-string v4, "encode: no available pts!!!"

    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 633
    :cond_13
    const-string v0, "AVCEncoder"

    const-string v4, "encode: no output."

    invoke-static {v0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    :goto_4
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, v9, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 639
    move v0, v6

    :goto_5
    goto/16 :goto_0

    .line 563
    :catch_0
    move-exception v0

    .line 564
    monitor-exit p0

    return v4

    .line 523
    :cond_14
    :goto_6
    const-string v3, "AVCEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "encode: invalidate params: texID = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", pts = "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    monitor-exit p0

    return v7

    .line 518
    :cond_15
    :goto_7
    const-string v0, "AVCEncoder"

    const-string v2, "encode: codec is not reayd."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    monitor-exit p0

    return v7

    .line 716
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public encode([BIZ)I
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p2

    .line 723
    move/from16 v3, p3

    monitor-enter p0

    .line 724
    :try_start_0
    iget v4, v1, Lcom/ss/android/medialib/AVCEncoder;->status:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_12

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-nez v4, :cond_0

    goto/16 :goto_a

    .line 727
    :cond_0
    const-string v4, "AVCEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "encodeBuffer pts: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "  isEndStream = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 729
    nop

    .line 731
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    const-wide/16 v7, 0x0

    const/4 v9, 0x4

    const-wide/16 v10, -0x1

    const/4 v12, 0x1

    const/4 v13, 0x0

    if-lt v4, v6, :cond_8

    .line 733
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v4, v10, v11}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v15

    .line 734
    if-ltz v15, :cond_2

    .line 735
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v4, v15}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 736
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 737
    array-length v6, v0

    invoke-virtual {v4, v0, v13, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 738
    iget-object v14, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/16 v16, 0x0

    array-length v0, v0

    int-to-long v10, v2

    if-ne v3, v12, :cond_1

    move/from16 v20, v9

    goto :goto_0

    :cond_1
    move/from16 v20, v13

    :goto_0
    move/from16 v17, v0

    move-wide/from16 v18, v10

    invoke-virtual/range {v14 .. v20}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 741
    :cond_2
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    sget v3, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    int-to-long v3, v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 742
    const-string v2, "AVCEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "outputBufferIndex = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 743
    const-string v2, "AVCEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mBufferInfo.flags = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    :goto_1
    if-ltz v0, :cond_7

    .line 746
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2, v0}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 747
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 748
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 750
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v3, v5

    if-eqz v3, :cond_4

    .line 756
    const-string v3, "AVCEncoder"

    const-string v4, "mEncoderCaller.onSetCodecConfig"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 757
    sget-object v3, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v3, :cond_3

    .line 758
    sget-object v3, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v3, v2}, Lcom/ss/android/medialib/AVCEncoderInterface;->onSetCodecConfig(Ljava/nio/ByteBuffer;)V

    .line 760
    :cond_3
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iput v13, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    goto :goto_3

    .line 763
    :cond_4
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v3, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    long-to-int v3, v3

    .line 765
    nop

    .line 766
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v4, v12

    if-eqz v4, :cond_5

    .line 767
    nop

    .line 776
    move v4, v12

    goto :goto_2

    :cond_5
    move v4, v13

    :goto_2
    const-string v6, "AVCEncoder"

    const-string v9, "mEncoderCaller.onWriteFile"

    invoke-static {v6, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    sget-object v6, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v6, :cond_6

    .line 778
    sget-object v6, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v6, v2, v3, v13, v4}, Lcom/ss/android/medialib/AVCEncoderInterface;->onWriteFile(Ljava/nio/ByteBuffer;III)V

    .line 783
    :cond_6
    :goto_3
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2, v0, v13}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 785
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v0, v2, v7, v8}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 786
    goto :goto_1

    .line 787
    :cond_7
    goto/16 :goto_9

    .line 789
    :cond_8
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v4, v10, v11}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v15

    .line 790
    if-ltz v15, :cond_a

    .line 791
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v4, v4, v15

    .line 792
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 793
    array-length v6, v0

    invoke-virtual {v4, v0, v13, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 794
    iget-object v14, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/16 v16, 0x0

    array-length v0, v0

    int-to-long v10, v2

    if-ne v3, v12, :cond_9

    move/from16 v20, v9

    goto :goto_4

    :cond_9
    move/from16 v20, v13

    :goto_4
    move/from16 v17, v0

    move-wide/from16 v18, v10

    invoke-virtual/range {v14 .. v20}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 797
    :cond_a
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    sget v3, Lcom/ss/android/medialib/AVCEncoder;->TIMEOUT_USEC:I

    int-to-long v3, v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    .line 798
    :goto_5
    if-ltz v0, :cond_11

    .line 799
    const/4 v2, -0x3

    if-ne v0, v2, :cond_b

    .line 800
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    goto :goto_8

    .line 801
    :cond_b
    const/4 v2, -0x2

    if-eq v0, v2, :cond_10

    .line 803
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v2, v2, v0

    .line 804
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 805
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 807
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v3, v5

    if-eqz v3, :cond_d

    .line 814
    const-string v3, "AVCEncoder"

    const-string v4, "mEncoderCaller.onSetCodecConfig"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 815
    sget-object v3, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v3, :cond_c

    .line 816
    sget-object v3, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v3, v2}, Lcom/ss/android/medialib/AVCEncoderInterface;->onSetCodecConfig(Ljava/nio/ByteBuffer;)V

    .line 818
    :cond_c
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iput v13, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    goto :goto_7

    .line 821
    :cond_d
    iget-object v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v3, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    long-to-int v3, v3

    .line 823
    nop

    .line 824
    iget-object v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v4, v12

    if-eqz v4, :cond_e

    .line 825
    nop

    .line 834
    move v4, v12

    goto :goto_6

    :cond_e
    move v4, v13

    :goto_6
    const-string v6, "AVCEncoder"

    const-string v9, "mEncoderCaller.onWriteFile"

    invoke-static {v6, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    sget-object v6, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v6, :cond_f

    .line 836
    sget-object v6, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v6, v2, v3, v13, v4}, Lcom/ss/android/medialib/AVCEncoderInterface;->onWriteFile(Ljava/nio/ByteBuffer;III)V

    .line 840
    :cond_f
    :goto_7
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2, v0, v13}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 843
    :cond_10
    :goto_8
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v0, v2, v7, v8}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    goto :goto_5

    .line 846
    :cond_11
    :goto_9
    monitor-exit p0

    .line 848
    return v13

    .line 725
    :cond_12
    :goto_a
    const/4 v0, -0x1

    monitor-exit p0

    return v0

    .line 846
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getColorFormats()[I
    .locals 5

    .line 146
    const-string v0, "AVCEncoder"

    const-string v1, "start == "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    invoke-direct {p0}, Lcom/ss/android/medialib/AVCEncoder;->getMediaCodecInfo21()Landroid/media/MediaCodecInfo;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/ss/android/medialib/AVCEncoder;->getMediaCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    .line 149
    const-string v0, "AVCEncoder"

    const-string v1, "end == "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    .line 153
    :cond_1
    const-string v0, "AVCEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mMediaCodecInfo name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    iget-object v1, p0, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    .line 156
    iget-object v1, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    array-length v1, v1

    .line 157
    new-array v2, v1, [I

    .line 158
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    .line 159
    iget-object v4, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    aget v4, v4, v3

    aput v4, v2, v3

    .line 158
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 162
    :cond_2
    return-object v2
.end method

.method public getProfile()I
    .locals 1

    .line 166
    iget v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mProfile:I

    return v0
.end method

.method public initAVCEncoder(IIII)Landroid/view/Surface;
    .locals 8

    .line 193
    const/4 v4, 0x1

    const/16 v5, 0x8

    const/4 v7, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object p1

    return-object p1
.end method

.method public initAVCEncoder(IIIIIIZ)Landroid/view/Surface;
    .locals 17

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    .line 206
    move/from16 v5, p7

    const/4 v6, 0x0

    if-nez v5, :cond_0

    .line 207
    return-object v6

    .line 210
    :cond_0
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x12

    if-ge v7, v8, :cond_1

    .line 211
    return-object v6

    .line 213
    :cond_1
    const/4 v7, 0x0

    iput v7, v1, Lcom/ss/android/medialib/AVCEncoder;->mDrawCount:I

    .line 214
    iput v7, v1, Lcom/ss/android/medialib/AVCEncoder;->mEncodeCount:I

    .line 215
    const-string v8, "AVCEncoder"

    const-string v9, "initAVCEncoder == enter"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ltz v3, :cond_2

    if-le v3, v8, :cond_3

    .line 217
    :cond_2
    const-string v10, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Do not support bitrate mode "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", set VBR mode"

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v10, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    nop

    .line 221
    move v3, v9

    :cond_3
    if-lt v4, v9, :cond_4

    const/16 v10, 0x40

    if-le v4, v10, :cond_5

    .line 222
    :cond_4
    const-string v10, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Do not support profile "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", use baseline"

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v10, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    nop

    .line 226
    move v4, v9

    :cond_5
    const v10, 0xb71b00

    move/from16 v11, p3

    if-le v11, v10, :cond_6

    goto :goto_0

    .line 228
    :cond_6
    move v10, v11

    :goto_0
    const-string v11, "AVCEncoder"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "width + "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "\theight = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "\tbitrate = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "\tuseTextureInput = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v11, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    if-lez v0, :cond_19

    if-gtz v2, :cond_7

    goto/16 :goto_a

    .line 237
    :cond_7
    iput v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mWidth:I

    .line 238
    iput v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mHeight:I

    .line 240
    monitor-enter p0

    .line 243
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/ss/android/medialib/AVCEncoder;->getOneColorFormat()I

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 244
    if-gez v5, :cond_8

    .line 245
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v6

    .line 248
    :cond_8
    :try_start_2
    sget-object v11, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    if-eqz v11, :cond_9

    .line 249
    sget-object v11, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    invoke-interface {v11, v5}, Lcom/ss/android/medialib/AVCEncoderInterface;->setColorFormat(I)V

    .line 251
    :cond_9
    iget-object v11, v1, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-static {v11}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v11

    iput-object v11, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 252
    iget-object v11, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v11}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v11

    .line 253
    invoke-virtual {v11}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "OMX.google."

    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v12, :cond_a

    .line 254
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-object v6

    .line 256
    :cond_a
    :try_start_4
    invoke-virtual {v11}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v12

    .line 257
    const-string v13, "AVCEncoder"

    const-string v14, "CodecNames: "

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    array-length v13, v12

    move v14, v7

    :goto_1
    if-ge v14, v13, :cond_b

    aget-object v15, v12, v14

    .line 259
    const-string v7, "AVCEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Codec: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    add-int/lit8 v14, v14, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    goto :goto_1

    .line 261
    :cond_b
    iput v9, v1, Lcom/ss/android/medialib/AVCEncoder;->status:I

    .line 264
    iget-object v6, v1, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-static {v6, v0, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    .line 267
    nop

    .line 268
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mCodecName:Ljava/lang/String;

    invoke-virtual {v11, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v2

    .line 269
    iget-object v6, v2, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v7, v6

    const/4 v8, 0x0

    const/4 v11, 0x0

    :goto_2
    if-ge v8, v7, :cond_10

    aget-object v13, v6, v8

    .line 270
    const-string v14, "AVCEncoder"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Profile = "

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", Level = "

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v14, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-ne v12, v9, :cond_c

    .line 272
    const-string v11, "AVCEncoder"

    const-string v12, "Support Baseline Profile!"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    goto :goto_3

    .line 274
    :cond_c
    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/4 v14, 0x2

    if-ne v12, v14, :cond_d

    .line 275
    const-string v12, "AVCEncoder"

    const-string v14, "Support Main Profile!"

    invoke-static {v12, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    iget v12, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/4 v14, 0x2

    if-ge v12, v14, :cond_e

    .line 277
    goto :goto_3

    .line 279
    :cond_d
    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/16 v14, 0x8

    if-ne v12, v14, :cond_e

    .line 280
    const-string v12, "AVCEncoder"

    const-string v14, "Support High Profile!"

    invoke-static {v12, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    iget v12, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/16 v14, 0x8

    if-ge v12, v14, :cond_e

    .line 282
    nop

    .line 286
    :goto_3
    move-object v11, v13

    :cond_e
    iget v12, v13, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-ne v12, v4, :cond_f

    .line 287
    goto :goto_4

    .line 269
    :cond_f
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 291
    :cond_10
    :goto_4
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v7, 0x3

    const/16 v8, 0x15

    if-lt v6, v8, :cond_11

    .line 292
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    move-result-object v6

    .line 293
    const/4 v12, 0x0

    :goto_5
    if-ge v12, v7, :cond_11

    .line 294
    const-string v13, "AVCEncoder"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v15, Lcom/ss/android/medialib/AVCEncoder;->BITRATE_MODES:[Ljava/lang/String;

    aget-object v15, v15, v12

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, ": "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 300
    :cond_11
    nop

    .line 301
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x18

    if-lt v6, v12, :cond_14

    if-eqz v11, :cond_14

    .line 302
    const-string v4, "AVCEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Set Profile: "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", Level = "

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    iget v4, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    iput v4, v1, Lcom/ss/android/medialib/AVCEncoder;->mProfile:I

    .line 304
    const-string v4, "profile"

    iget v6, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 305
    const-string v4, "level"

    iget v6, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 306
    iget v4, v11, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    const/4 v6, 0x2

    if-eq v4, v6, :cond_13

    const/16 v6, 0x8

    if-eq v4, v6, :cond_12

    .line 314
    move v4, v10

    goto :goto_6

    .line 308
    :cond_12
    const-string v4, "AVCEncoder"

    const-string v6, "Set High Profile"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    int-to-float v4, v10

    const v6, 0x3f147ae1    # 0.58f

    mul-float/2addr v4, v6

    float-to-int v4, v4

    .line 310
    goto :goto_6

    .line 312
    :cond_13
    const-string v4, "AVCEncoder"

    const-string v6, "Set Main Profile"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    int-to-float v4, v10

    const v6, 0x3f2b851f    # 0.67f

    mul-float/2addr v4, v6

    float-to-int v4, v4

    .line 314
    :goto_6
    goto :goto_7

    .line 317
    :cond_14
    const-string v6, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Do not support profile "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", use baseline"

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    move v4, v10

    :goto_7
    const-string v6, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "bitrate = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-float v12, v4

    const/high16 v13, 0x3f800000    # 1.0f

    mul-float/2addr v12, v13

    const v13, 0x49742400    # 1000000.0f

    div-float/2addr v12, v13

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v12, "Mb/s"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v6, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    const-string v6, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "speed = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v12, p6

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v6, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    const-string v6, "bitrate"

    invoke-virtual {v0, v6, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 325
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v8, :cond_16

    .line 326
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    move-result-object v2

    .line 327
    const/4 v4, 0x0

    :goto_8
    if-ge v4, v7, :cond_15

    .line 328
    const-string v6, "AVCEncoder"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/ss/android/medialib/AVCEncoder;->BITRATE_MODES:[Ljava/lang/String;

    aget-object v12, v12, v4

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, ": "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v6, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    add-int/lit8 v4, v4, 0x1

    goto :goto_8

    .line 330
    :cond_15
    const-string v4, "bitrate-mode"

    invoke-virtual {v0, v4, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 331
    const-string v4, "AVCEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Bitrate mode = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    const-string v3, "max-bitrate"

    invoke-virtual {v0, v3, v10}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 333
    const-string v3, "AVCEncoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Encoder ComplexityRange: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->getComplexityRange()Landroid/util/Range;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Range;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    :cond_16
    const-string v2, "color-format"

    invoke-virtual {v0, v2, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 361
    const-string v2, "frame-rate"

    iget v3, v1, Lcom/ss/android/medialib/AVCEncoder;->mFrameRate:I

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 362
    const-string v2, "i-frame-interval"

    invoke-virtual {v0, v2, v9}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 363
    const-string v2, "AVCEncoder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initAVCEncoder: format = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    iget-object v2, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v3, v9}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 367
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    .line 368
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 369
    const/4 v0, 0x2

    iput v0, v1, Lcom/ss/android/medialib/AVCEncoder;->status:I

    .line 371
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v0, v8, :cond_17

    .line 372
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->inputBuffers:[Ljava/nio/ByteBuffer;

    .line 373
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->outputBuffers:[Ljava/nio/ByteBuffer;

    .line 376
    :cond_17
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 380
    nop

    .line 382
    :try_start_5
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_18

    .line 383
    monitor-exit p0

    const/4 v1, 0x0

    return-object v1

    .line 385
    :cond_18
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 387
    const-string v0, "AVCEncoder"

    const-string v2, "initAVCEncoder == exit"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    iget-object v0, v1, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    return-object v0

    .line 385
    :catchall_0
    move-exception v0

    goto :goto_9

    .line 377
    :catch_0
    move-exception v0

    .line 378
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 379
    monitor-exit p0

    const/4 v1, 0x0

    return-object v1

    .line 385
    :goto_9
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0

    .line 234
    :cond_19
    :goto_a
    const/4 v1, 0x0

    return-object v1
.end method

.method public initAVCEncoder(IIIIZ)Landroid/view/Surface;
    .locals 8

    .line 197
    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object p1

    return-object p1
.end method

.method public initEGLCtx()Z
    .locals 3

    .line 393
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    .line 394
    const-string v0, "AVCEncoder"

    const-string v1, "initEGLCtx: MediaCodec should initialized ahead."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    const/4 v0, 0x0

    return v0

    .line 408
    :cond_0
    invoke-static {}, Lcom/ss/android/medialib/common/TextureDrawer;->create()Lcom/ss/android/medialib/common/TextureDrawer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    .line 409
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/common/TextureDrawer;->setRotation(F)V

    .line 410
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/medialib/common/TextureDrawer;->setFlipScale(FF)V

    .line 413
    const/4 v0, 0x1

    return v0
.end method

.method public releaseEGLCtx()V
    .locals 1

    .line 417
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    if-eqz v0, :cond_0

    .line 418
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/medialib/common/TextureDrawer;->release()V

    .line 419
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mTextureDrawer:Lcom/ss/android/medialib/common/TextureDrawer;

    .line 421
    :cond_0
    return-void
.end method

.method public saveBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 3

    .line 493
    const-string v0, "AVCEncoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saving Bitmap : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 497
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 498
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {p1, v0, v2, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 499
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 500
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 505
    nop

    .line 507
    const-string p1, "AVCEncoder"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bitmap "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " saved!"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    return-void

    .line 501
    :catch_0
    move-exception p1

    .line 502
    const-string p2, "AVCEncoder"

    const-string v0, "Err when saving bitmap..."

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 504
    return-void
.end method

.method public setBitrateMode(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 171
    const-string v0, "bitrate-mode"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 173
    return-object p1
.end method

.method public setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V
    .locals 0

    .line 93
    sput-object p1, Lcom/ss/android/medialib/AVCEncoder;->mEncoderCaller:Lcom/ss/android/medialib/AVCEncoderInterface;

    .line 94
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 86
    iput p1, p0, Lcom/ss/android/medialib/AVCEncoder;->mFrameRate:I

    .line 87
    return-void
.end method

.method public uninitAVCEncoder()V
    .locals 2

    .line 425
    const-string v0, "AVCEncoder"

    const-string v1, "uninitAVCEncoder == enter"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    monitor-enter p0

    .line 429
    :try_start_0
    iget v0, p0, Lcom/ss/android/medialib/AVCEncoder;->status:I

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    if-nez v0, :cond_0

    goto :goto_2

    .line 431
    :cond_0
    iget v0, p0, Lcom/ss/android/medialib/AVCEncoder;->status:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 433
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 436
    goto :goto_0

    .line 434
    :catch_0
    move-exception v0

    .line 435
    :try_start_2
    const-string v0, "AVCEncoder"

    const-string v1, "MediaCodec Exception"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 440
    :cond_1
    :goto_0
    :try_start_3
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 443
    goto :goto_1

    .line 441
    :catch_1
    move-exception v0

    .line 445
    :goto_1
    const/4 v0, 0x0

    :try_start_4
    iput-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    .line 457
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_2

    .line 458
    iget-object v0, p0, Lcom/ss/android/medialib/AVCEncoder;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 461
    :cond_2
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 463
    const-string v0, "AVCEncoder"

    const-string v1, "uninitAVCEncoder == exit"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    return-void

    .line 429
    :cond_3
    :goto_2
    :try_start_5
    monitor-exit p0

    return-void

    .line 461
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0
.end method
