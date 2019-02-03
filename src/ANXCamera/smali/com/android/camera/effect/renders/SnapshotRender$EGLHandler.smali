.class Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;
.super Landroid/os/Handler;
.source "SnapshotRender.java"

# interfaces
.implements Lcom/android/camera/effect/renders/WatermarkRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/renders/SnapshotRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EGLHandler"
.end annotation


# static fields
.field public static final MSG_DRAW_MAIN_ASYNC:I = 0x1

.field public static final MSG_DRAW_MAIN_SYNC:I = 0x2

.field public static final MSG_INIT_EGL_SYNC:I = 0x0

.field public static final MSG_PREPARE_EFFECT_RENDER:I = 0x6

.field public static final MSG_RELEASE:I = 0x5


# instance fields
.field private mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field private mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

.field private mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

.field final synthetic this$0:Lcom/android/camera/effect/renders/SnapshotRender;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/os/Looper;)V
    .locals 0

    .line 235
    iput-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 236
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 237
    return-void
.end method

.method private applyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B
    .locals 20

    move-object/from16 v7, p0

    .line 403
    move-object/from16 v8, p1

    invoke-direct/range {p0 .. p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->getEffectRender(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Lcom/android/camera/effect/renders/PipeRender;

    move-result-object v0

    .line 405
    if-nez v0, :cond_0

    .line 406
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v0

    const-string v1, "init render failed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const/4 v0, 0x0

    return-object v0

    .line 410
    :cond_0
    invoke-direct {v7, v0, v8}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    .line 412
    iget-object v1, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    .line 413
    iget-object v2, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    .line 414
    invoke-direct {v7, v1, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkFrameBuffer(II)V

    .line 416
    iget-object v3, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v4, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v3, v4}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 418
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 419
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 420
    iget-object v5, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v5}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/android/camera/effect/renders/PipeRender;->setParentFrameBufferId(I)V

    .line 421
    invoke-virtual {v0, v8}, Lcom/android/camera/effect/renders/PipeRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 422
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "drawTime="

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v3

    invoke-virtual {v6, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 423
    invoke-virtual {v0}, Lcom/android/camera/effect/renders/PipeRender;->deleteBuffer()V

    .line 424
    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    iput-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    .line 425
    nop

    .line 426
    nop

    .line 427
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    const/4 v9, 0x2

    const/4 v10, 0x0

    if-eqz v0, :cond_2

    .line 428
    if-le v1, v2, :cond_1

    .line 429
    sub-int/2addr v1, v2

    div-int/2addr v1, v9

    .line 430
    nop

    .line 437
    move v3, v2

    move v4, v3

    move v2, v10

    goto :goto_0

    .line 432
    :cond_1
    sub-int/2addr v2, v1

    div-int/2addr v2, v9

    .line 433
    nop

    .line 437
    move v3, v1

    move v4, v3

    move v1, v10

    goto :goto_0

    :cond_2
    move v3, v1

    move v4, v2

    move v1, v10

    move v2, v1

    :goto_0
    iget-boolean v0, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-eqz v0, :cond_3

    .line 438
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 439
    iget v5, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    iget-object v6, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTimeWatermark:Ljava/lang/String;

    move-object v0, v7

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(IIIIILjava/lang/String;)V

    .line 440
    iget-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    iget-object v1, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    iget v2, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    iget-object v3, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mWaterInfos:Ljava/util/List;

    invoke-virtual {v7, v0, v1, v2, v3}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawFaceWaterMarkInfos(Landroid/util/Size;Landroid/util/Size;ILjava/util/List;)V

    .line 442
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "watermarkTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v11

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    iget-object v0, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    .line 451
    iget-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-direct {v7, v0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->checkWatermarkFrameBuffer(Landroid/util/Size;)V

    .line 452
    iget-object v0, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    iget-object v1, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/SnapshotCanvas;->beginBindFrameBuffer(Lcom/android/camera/effect/FrameBuffer;)V

    .line 453
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 454
    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    invoke-direct {v7, v2}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/android/camera/effect/renders/RgbToYuvRender;

    .line 455
    invoke-direct {v7, v11, v8}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V

    .line 456
    iget-object v2, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v2}, Lcom/android/camera/effect/FrameBuffer;->getId()I

    move-result v2

    invoke-virtual {v11, v2}, Lcom/android/camera/effect/renders/RgbToYuvRender;->setParentFrameBufferId(I)V

    .line 457
    iget-object v2, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    invoke-virtual {v2}, Lcom/android/camera/effect/FrameBuffer;->getTexture()Lcom/android/gallery3d/ui/RawTexture;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/RawTexture;->getId()I

    move-result v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    iget-object v2, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    .line 458
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-float v15, v2

    iget-object v2, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/16 v17, 0x1

    .line 457
    move/from16 v16, v2

    invoke-virtual/range {v11 .. v17}, Lcom/android/camera/effect/renders/RgbToYuvRender;->drawTexture(IFFFFZ)V

    .line 459
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rgb2YuvTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    :cond_3
    const/16 v0, 0xd05

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 465
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 466
    iget-object v0, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 467
    iget-object v4, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOriginalSize:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    .line 474
    int-to-double v5, v0

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    div-double/2addr v5, v11

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v5, v5

    .line 475
    int-to-double v11, v4

    const-wide/high16 v13, 0x4008000000000000L    # 3.0

    mul-double/2addr v11, v13

    const-wide/high16 v13, 0x4010000000000000L    # 4.0

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v6, v11

    .line 477
    mul-int v11, v5, v6

    const/4 v15, 0x4

    mul-int/2addr v11, v15

    invoke-static {v11}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v14

    .line 478
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x1908

    const/16 v17, 0x1401

    move v13, v5

    move-object/from16 v18, v14

    move v14, v6

    move v9, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move-object/from16 v17, v18

    invoke-static/range {v11 .. v17}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 479
    move-object/from16 v11, v18

    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 480
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v14, "readSize=%dx%d imageSize=%dx%d"

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v10

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v9, v1

    const/4 v0, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v9, v0

    invoke-static {v13, v14, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "readTime="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 500
    iget-object v2, v8, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mImage:Landroid/media/Image;

    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-static {v2, v3}, Lcom/xiaomi/camera/base/ImageUtil;->updateYuvImage(Landroid/media/Image;[B)V

    .line 501
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateImageTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 503
    iget-object v0, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->endBindFrameBuffer()V

    .line 504
    iget-object v0, v7, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 505
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method private checkFrameBuffer(II)V
    .locals 3

    .line 574
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 575
    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    if-lt v0, p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 576
    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_1

    .line 577
    :cond_0
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 579
    :cond_1
    return-void
.end method

.method private checkWatermarkFrameBuffer(Landroid/util/Size;)V
    .locals 4

    .line 582
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 583
    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 584
    invoke-virtual {v0}, Lcom/android/camera/effect/FrameBuffer;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 585
    :cond_0
    new-instance v0, Lcom/android/camera/effect/FrameBuffer;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, p1, v3}, Lcom/android/camera/effect/FrameBuffer;-><init>(Lcom/android/gallery3d/ui/GLCanvas;III)V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 587
    :cond_1
    return-void
.end method

.method private drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z
    .locals 3

    .line 568
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->applyEffect(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)[B

    move-result-object p1

    .line 569
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mainLen="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string p1, "null"

    goto :goto_0

    :cond_0
    array-length p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    const/4 p1, 0x1

    return p1
.end method

.method private drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V
    .locals 7

    .line 314
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState;->pushState()V

    .line 315
    if-eqz p4, :cond_0

    .line 316
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v1

    add-int/2addr v1, p2

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v2

    add-int/2addr v2, p3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    .line 317
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object v0

    neg-int p4, p4

    int-to-float p4, p4

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, p4, v2, v2, v1}, Lcom/android/camera/effect/GLCanvasState;->rotate(FFFF)V

    .line 318
    iget-object p4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p4}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p4

    neg-int v0, p2

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterX()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    neg-int v1, p3

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getCenterY()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p4, v0, v1}, Lcom/android/camera/effect/GLCanvasState;->translate(FF)V

    .line 320
    :cond_0
    iget-object p4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p4}, Lcom/android/camera/effect/SnapshotCanvas;->getBasicRender()Lcom/android/camera/effect/renders/BasicRender;

    move-result-object p4

    new-instance v6, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object v1

    .line 321
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getLeft()I

    move-result v0

    add-int v2, p2, v0

    .line 322
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTop()I

    move-result p2

    add-int v3, p3, p2

    .line 323
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getWidth()I

    move-result v4

    .line 324
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getHeight()I

    move-result v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    .line 320
    invoke-virtual {p4, v6}, Lcom/android/camera/effect/renders/BasicRender;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)Z

    .line 325
    iget-object p2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p2}, Lcom/android/camera/effect/SnapshotCanvas;->getState()Lcom/android/camera/effect/GLCanvasState;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/effect/GLCanvasState;->popState()V

    .line 327
    invoke-virtual {p1}, Lcom/android/camera/effect/renders/WaterMark;->getTexture()Lcom/android/gallery3d/ui/BasicTexture;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/gallery3d/ui/BasicTexture;->getId()I

    move-result p1

    .line 328
    iget-object p2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->deleteTexture(I)Z

    .line 330
    return-void
.end method

.method private fetchRender(I)Lcom/android/camera/effect/renders/Render;
    .locals 3

    .line 509
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v0}, Lcom/android/camera/effect/SnapshotCanvas;->getEffectRenderGroup()Lcom/android/camera/effect/renders/RenderGroup;

    move-result-object v0

    .line 510
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 511
    if-nez v1, :cond_0

    .line 512
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    .line 513
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/RenderGroup;->getRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 515
    :cond_0
    return-object v1
.end method

.method private getEffectRender(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Lcom/android/camera/effect/renders/PipeRender;
    .locals 4

    .line 519
    new-instance v0, Lcom/android/camera/effect/renders/PipeRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    .line 521
    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_YUV2RGB:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 522
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 524
    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    sget v2, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v1, v2, :cond_0

    .line 525
    iget v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mEffectIndex:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 526
    if-eqz v1, :cond_0

    .line 527
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 531
    :cond_0
    iget-boolean v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mIsGradienterOn:Z

    if-eqz v1, :cond_2

    .line 532
    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GRADIENTER:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 533
    if-eqz v1, :cond_1

    .line 534
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 536
    :cond_1
    goto :goto_1

    :cond_2
    iget-object v1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 537
    const/4 v1, 0x0

    .line 538
    const-string v2, "circle"

    iget-object v3, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 539
    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_GAUSSIAN:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    goto :goto_0

    .line 540
    :cond_3
    const-string v2, "parallel"

    iget-object v3, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mTiltShiftMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 541
    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_TILTSHIFT:I

    invoke-direct {p0, v1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object v1

    .line 543
    :cond_4
    :goto_0
    if-eqz v1, :cond_5

    .line 544
    invoke-virtual {v0, v1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 548
    :cond_5
    :goto_1
    iget-boolean p1, p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mApplyWaterMark:Z

    if-nez p1, :cond_6

    .line 550
    sget p1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_RGB2YUV:I

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->fetchRender(I)Lcom/android/camera/effect/renders/Render;

    move-result-object p1

    .line 551
    invoke-virtual {v0, p1}, Lcom/android/camera/effect/renders/PipeRender;->addRender(Lcom/android/camera/effect/renders/Render;)V

    .line 554
    :cond_6
    return-object v0
.end method

.method private initEGL()V
    .locals 10

    .line 278
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$402(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGL10;)Ljavax/microedition/khronos/egl/EGL10;

    .line 279
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v1

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$502(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 280
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v0

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eq v0, v1, :cond_4

    .line 283
    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 284
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 287
    invoke-static {}, Lcom/android/camera/effect/renders/SnapshotRender;->access$600()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EGL version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget v5, v1, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v5, 0x2e

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v5, 0x1

    aget v1, v1, v5

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    const/4 v1, 0x3

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    .line 290
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/camera/effect/renders/SnapshotRender;->access$800(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$702(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    .line 291
    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v7}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v7

    iget-object v8, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v8}, Lcom/android/camera/effect/renders/SnapshotRender;->access$700(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v8

    sget-object v9, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v6, v7, v8, v9, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$902(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    .line 294
    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v2

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq v2, v3, :cond_2

    .line 298
    const/4 v2, 0x5

    new-array v2, v2, [I

    const/16 v3, 0x3057

    aput v3, v2, v4

    sget v3, Lcom/android/camera/Util;->sWindowWidth:I

    aput v3, v2, v5

    const/16 v3, 0x3056

    aput v3, v2, v0

    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    aput v0, v2, v1

    const/4 v0, 0x4

    const/16 v1, 0x3038

    aput v1, v2, v0

    .line 303
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotRender;->access$700(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v4

    invoke-interface {v1, v3, v4, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1002(Lcom/android/camera/effect/renders/SnapshotRender;Ljavax/microedition/khronos/egl/EGLSurface;)Ljavax/microedition/khronos/egl/EGLSurface;

    .line 304
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v0

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_1

    .line 308
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$400(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGL10;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$500(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v3}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1000(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v4}, Lcom/android/camera/effect/renders/SnapshotRender;->access$900(Lcom/android/camera/effect/renders/SnapshotRender;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v4

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 311
    return-void

    .line 309
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "failed to eglMakeCurrent"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 305
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "failed to createWindowSurface"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 295
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "failed to createContext"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglInitialize failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglGetDisplay failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :array_0
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private release()V
    .locals 2

    .line 590
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 591
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mWatermarkFrameBuffer:Lcom/android/camera/effect/FrameBuffer;

    .line 592
    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {v1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 593
    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    .line 594
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1700(Lcom/android/camera/effect/renders/SnapshotRender;)V

    .line 595
    return-void
.end method

.method private updateRenderParameters(Lcom/android/camera/effect/renders/Render;Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)V
    .locals 3

    .line 389
    instance-of v0, p1, Lcom/android/camera/effect/renders/PipeRender;

    if-eqz v0, :cond_0

    .line 390
    move-object v0, p1

    check-cast v0, Lcom/android/camera/effect/renders/PipeRender;

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/effect/renders/PipeRender;->setFrameBufferSize(II)V

    .line 392
    :cond_0
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setViewportSize(II)V

    .line 393
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPreviewSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setPreviewSize(II)V

    .line 394
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mAttribute:Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setEffectRangeAttribute(Lcom/android/camera/effect/EffectController$EffectRectAttribute;)V

    .line 395
    iget-boolean v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mMirror:Z

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setMirror(Z)V

    .line 396
    iget-object v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mPictureSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/effect/renders/Render;->setSnapshotSize(II)V

    .line 397
    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mOrientation:I

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setOrientation(I)V

    .line 398
    iget v0, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mShootRotation:F

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/renders/Render;->setShootRotation(F)V

    .line 399
    iget p2, p2, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;->mJpegRotation:I

    invoke-virtual {p1, p2}, Lcom/android/camera/effect/renders/Render;->setJpegOrientation(I)V

    .line 400
    return-void
.end method


# virtual methods
.method public drawFaceWaterMarkInfos(Landroid/util/Size;Landroid/util/Size;ILjava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroid/util/Size;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;)V"
        }
    .end annotation

    .line 370
    if-eqz p4, :cond_3

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 373
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 374
    new-instance v0, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-direct {v0, p4}, Lcom/android/camera/watermark/WaterMarkBitmap;-><init>(Ljava/util/List;)V

    .line 375
    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->getWaterMarkData()Lcom/android/camera/watermark/WaterMarkData;

    move-result-object p4

    .line 376
    if-eqz p4, :cond_1

    .line 377
    new-instance v10, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;

    .line 378
    invoke-virtual {p4}, Lcom/android/camera/watermark/WaterMarkData;->getImage()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    .line 379
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v6

    .line 380
    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v1, v10

    move v5, p3

    invoke-direct/range {v1 .. v9}, Lcom/android/camera/effect/renders/AgeGenderAndMagicMirrorWaterMark;-><init>(Landroid/graphics/Bitmap;IIIIIFF)V

    .line 381
    invoke-virtual {p4}, Lcom/android/camera/watermark/WaterMarkData;->getOrientation()I

    move-result p1

    sub-int/2addr p3, p1

    const/4 p1, 0x0

    invoke-direct {p0, v10, p1, p1, p3}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    .line 383
    :cond_1
    invoke-virtual {v0}, Lcom/android/camera/watermark/WaterMarkBitmap;->releaseBitmap()V

    .line 384
    const-class p1, Lcom/android/camera/watermark/WaterMarkBitmap;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Draw age_gender_and_magic_mirror water mark"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 386
    :cond_2
    return-void

    .line 371
    :cond_3
    :goto_0
    return-void
.end method

.method public drawWaterMark(IIIIILjava/lang/String;)V
    .locals 8

    .line 334
    if-eqz p6, :cond_0

    .line 335
    new-instance v0, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;

    invoke-direct {v0, p6, p3, p4, p5}, Lcom/android/camera/effect/renders/NewStyleTextWaterMark;-><init>(Ljava/lang/String;III)V

    .line 336
    invoke-direct {p0, v0, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    .line 338
    :cond_0
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    if-eqz p6, :cond_6

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object p6

    invoke-virtual {p6}, Lcom/android/camera/effect/renders/DualWatermarkParam;->isDualWatermarkEnable()Z

    move-result p6

    if-eqz p6, :cond_6

    .line 339
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;

    move-result-object p6

    if-eqz p6, :cond_1

    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1300(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/String;

    move-result-object p6

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-nez p6, :cond_1

    .line 340
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v0

    invoke-static {p6, v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1302(Lcom/android/camera/effect/renders/SnapshotRender;Ljava/lang/String;)Ljava/lang/String;

    .line 341
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1400(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p6, v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1102(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 343
    :cond_1
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1100(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    .line 344
    invoke-static {}, Lcom/android/camera/CameraSettings;->getDefaultWatermarkStr()Ljava/lang/String;

    move-result-object v0

    .line 345
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCustomWatermark()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 346
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v1, 0x1

    .line 347
    :goto_1
    if-eqz v1, :cond_5

    if-eqz v0, :cond_5

    .line 349
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_4

    .line 350
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    iget-object v1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1600(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1502(Lcom/android/camera/effect/renders/SnapshotRender;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 352
    :cond_4
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 353
    iget-object p6, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p6}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1500(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/graphics/Bitmap;

    move-result-object p6

    .line 356
    :cond_5
    move-object v1, p6

    new-instance p6, Lcom/android/camera/effect/renders/ImageWaterMark;

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 358
    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DualWatermarkParam;->getSize()F

    move-result v5

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 359
    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DualWatermarkParam;->getPaddingX()F

    move-result v6

    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    .line 360
    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$1200(Lcom/android/camera/effect/renders/SnapshotRender;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/DualWatermarkParam;->getPaddingY()F

    move-result v7

    move-object v0, p6

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-direct/range {v0 .. v7}, Lcom/android/camera/effect/renders/ImageWaterMark;-><init>(Landroid/graphics/Bitmap;IIIFFF)V

    .line 361
    invoke-direct {p0, p6, p1, p2, p5}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawWaterMark(Lcom/android/camera/effect/renders/WaterMark;III)V

    .line 363
    :cond_6
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 242
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 270
    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    const/4 v1, 0x0

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/SnapshotCanvas;->prepareEffectRenders(ZI)V

    goto :goto_0

    .line 267
    :pswitch_2
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->release()V

    .line 268
    goto :goto_0

    .line 261
    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    .line 262
    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z

    .line 263
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 264
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    .line 265
    goto :goto_0

    .line 251
    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->drawImage(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;)Z

    .line 252
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Lcom/android/camera/effect/SnapshotCanvas;->recycledResources()V

    .line 253
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$100(Lcom/android/camera/effect/renders/SnapshotRender;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->hasMessages(I)Z

    move-result p1

    if-nez p1, :cond_0

    .line 254
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->release()V

    .line 256
    :cond_0
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$200(Lcom/android/camera/effect/renders/SnapshotRender;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 257
    :try_start_0
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$310(Lcom/android/camera/effect/renders/SnapshotRender;)I

    .line 258
    monitor-exit v0

    .line 259
    goto :goto_0

    .line 258
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 244
    :pswitch_5
    invoke-direct {p0}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->initEGL()V

    .line 245
    new-instance v0, Lcom/android/camera/effect/SnapshotCanvas;

    invoke-direct {v0}, Lcom/android/camera/effect/SnapshotCanvas;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    .line 246
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/util/Size;

    .line 247
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->mGLCanvas:Lcom/android/camera/effect/SnapshotCanvas;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/android/camera/effect/SnapshotCanvas;->setSize(II)V

    .line 248
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    .line 249
    nop

    .line 274
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public sendMessageSync(Landroid/os/Message;)V
    .locals 1

    .line 599
    iget-object v0, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {v0}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 600
    invoke-virtual {p0, p1}, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->sendMessage(Landroid/os/Message;)Z

    .line 601
    iget-object p1, p0, Lcom/android/camera/effect/renders/SnapshotRender$EGLHandler;->this$0:Lcom/android/camera/effect/renders/SnapshotRender;

    invoke-static {p1}, Lcom/android/camera/effect/renders/SnapshotRender;->access$000(Lcom/android/camera/effect/renders/SnapshotRender;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->block()V

    .line 602
    return-void
.end method
