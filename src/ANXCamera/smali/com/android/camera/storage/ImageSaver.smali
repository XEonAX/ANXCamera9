.class public Lcom/android/camera/storage/ImageSaver;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Lcom/android/camera/storage/SaverCallback;
.implements Lcom/xiaomi/camera/core/ParallelCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;
    }
.end annotation


# static fields
.field private static final CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

.field private static final HOST_STATE_DESTROY:I = 0x2

.field private static final HOST_STATE_PAUSE:I = 0x1

.field private static final HOST_STATE_RESUME:I = 0x0

.field private static final QUEUE_BUSY_SIZE:I = 0x28

.field private static final TAG:Ljava/lang/String; = "ImageSaver"

.field private static final mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static final sThreadFactory:Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;

.field private mContext:Landroid/content/Context;

.field private mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

.field private mHandler:Landroid/os/Handler;

.field private mHostState:I

.field private volatile mIsBusy:Z

.field private mIsCaptureIntent:Z

.field private mLastImageUri:Landroid/net/Uri;

.field private mMemoryManager:Lcom/android/camera/storage/MemoryManager;

.field private mPendingThumbnail:Lcom/android/camera/Thumbnail;

.field private mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

.field private mUpdateThumbnailLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 83
    new-instance v0, Lcom/android/camera/storage/ImageSaver$1;

    invoke-direct {v0}, Lcom/android/camera/storage/ImageSaver$1;-><init>()V

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 92
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    .line 99
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v8, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v9, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    const/4 v3, 0x4

    const/4 v4, 0x4

    const-wide/16 v5, 0xa

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 102
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 103
    sput-object v0, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 104
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    .line 665
    new-instance v0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-direct {v0, p0}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    .line 108
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    .line 109
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    .line 110
    iput-boolean p3, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 111
    new-instance p2, Lcom/android/camera/storage/MemoryManager;

    invoke-direct {p2}, Lcom/android/camera/storage/MemoryManager;-><init>()V

    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    .line 112
    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {p2}, Lcom/android/camera/storage/MemoryManager;->initMemory()V

    .line 114
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    .line 115
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;
    .locals 0

    .line 57
    iget-object p0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/storage/ImageSaver;Z)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->updateThumbnail(Z)V

    return-void
.end method

.method private addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V
    .locals 2

    .line 489
    monitor-enter p0

    .line 490
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 491
    const-string p1, "ImageSaver"

    const-string v0, "addSaveRequest: host is being destroyed."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    monitor-exit p0

    return-void

    .line 494
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 495
    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 498
    :cond_1
    invoke-interface {p1}, Lcom/android/camera/storage/SaveRequest;->getSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addUsedMemory(I)V

    .line 499
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0, p0}, Lcom/android/camera/storage/SaveRequest;->setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 501
    :try_start_1
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 505
    goto :goto_0

    .line 502
    :catch_0
    move-exception p1

    .line 503
    :try_start_2
    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 504
    const-string p1, "ImageSaver"

    const-string v0, "stop snapshot due to thread pool is full"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    :goto_0
    monitor-exit p0

    .line 507
    return-void

    .line 506
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method private getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BIIZII",
            "Landroid/location/Location;",
            "Ljava/lang/String;",
            "IIF",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;Z",
            "Lcom/xiaomi/camera/core/PictureInfo;",
            ")",
            "Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;"
        }
    .end annotation

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v0, p7

    .line 827
    new-instance v24, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .line 830
    if-le v5, v6, :cond_0

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 832
    :goto_0
    move v3, v1

    goto :goto_1

    .line 831
    :cond_0
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_0

    .line 832
    :goto_1
    if-le v6, v5, :cond_1

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 836
    :goto_2
    move v4, v1

    goto :goto_3

    .line 833
    :cond_1
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_2

    .line 836
    :goto_3
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result v7

    .line 837
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v8

    .line 838
    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 840
    move-object v9, v1

    goto :goto_4

    .line 838
    :cond_2
    new-instance v2, Landroid/location/Location;

    invoke-direct {v2, v0}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    .line 840
    move-object v9, v2

    :goto_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 844
    invoke-virtual/range {p16 .. p16}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontMirror()Z

    move-result v16

    .line 850
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v21

    .line 851
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v22, v0

    goto :goto_5

    :cond_3
    move-object/from16 v22, v1

    :goto_5
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move/from16 v2, p4

    move-object/from16 v10, p8

    move/from16 v13, p9

    move/from16 v14, p10

    move/from16 v15, p11

    move-object/from16 v17, p12

    move/from16 v18, p13

    move-object/from16 v19, p16

    move-object/from16 v20, p14

    move/from16 v23, p15

    invoke-direct/range {v0 .. v23}, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;-><init>([BZIIIIILcom/android/camera/effect/EffectController$EffectRectAttribute;Landroid/location/Location;Ljava/lang/String;JIIFZLjava/lang/String;ZLcom/xiaomi/camera/core/PictureInfo;Ljava/util/List;ZLjava/lang/String;Z)V

    .line 827
    return-object v24
.end method

.method private insertLiveShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 27

    move-object/from16 v15, p0

    .line 266
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    .line 267
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 268
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getMicroVideoData()[B

    move-result-object v17

    .line 269
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getCoverFrameTimestamp()J

    move-result-wide v18

    .line 271
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v20

    .line 272
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v21

    .line 273
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v22

    .line 274
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v2

    .line 278
    add-int v2, v2, v22

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 279
    nop

    .line 280
    nop

    .line 285
    move/from16 v5, v20

    move/from16 v6, v21

    goto :goto_0

    .line 282
    :cond_0
    nop

    .line 283
    nop

    .line 285
    move/from16 v6, v20

    move/from16 v5, v21

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 286
    invoke-static {}, Lcom/android/camera/Util;->createGooglePhotosCompatibleLiveShot()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 287
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MV"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 290
    :cond_1
    move-object v14, v2

    if-eqz v0, :cond_2

    .line 291
    nop

    .line 292
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewHeight()I

    move-result v3

    .line 293
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v4

    .line 295
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v7

    .line 296
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootOrientation()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootRotation()F

    move-result v11

    .line 297
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    .line 298
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v16

    const/16 v23, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v24

    .line 291
    move-object v0, v15

    move-object v8, v14

    move/from16 v10, v22

    move-object/from16 v25, v14

    move-object/from16 v14, v16

    move/from16 v15, v23

    move-object/from16 v16, v24

    invoke-direct/range {v0 .. v16}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 300
    move-object/from16 v11, p0

    iget-object v1, v11, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 301
    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 302
    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 303
    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 306
    move v13, v0

    move v12, v2

    goto :goto_1

    :cond_2
    move-object/from16 v25, v14

    move-object v11, v15

    move v12, v5

    move v13, v6

    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_5

    .line 307
    iget-object v2, v11, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    .line 309
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isHasDualWaterMark()Z

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v10

    .line 307
    move-object v3, v1

    move/from16 v4, v20

    move/from16 v5, v21

    move-object/from16 v6, v17

    move-wide/from16 v7, v18

    invoke-static/range {v2 .. v10}, Lcom/android/camera/Util;->composeLiveShotPicture(Landroid/content/Context;[BII[BJZLjava/lang/String;)[B

    move-result-object v2

    .line 310
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    array-length v0, v2

    array-length v1, v1

    if-ge v0, v1, :cond_3

    goto :goto_2

    .line 314
    :cond_3
    nop

    .line 315
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v3

    const/4 v4, 0x0

    .line 316
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 318
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v21

    .line 314
    move-object v0, v11

    move-object v1, v2

    move v2, v3

    move-object/from16 v3, v25

    move v9, v12

    move v10, v13

    move-object v11, v14

    move/from16 v12, v22

    move v13, v15

    move/from16 v14, v16

    move/from16 v15, v17

    move/from16 v16, v18

    move/from16 v17, v19

    move-object/from16 v18, v20

    move-object/from16 v19, v21

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 319
    nop

    .line 322
    return-void

    .line 311
    :cond_4
    :goto_2
    const-string v0, "ImageSaver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to save LiveShot photo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v2, v25

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    return-void

    .line 320
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Only supported LiveShot capture processing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private insertNormalDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 28

    move-object/from16 v15, p0

    .line 325
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    .line 326
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera2/ArcsoftDepthMap;->isDepthMapData([B)Z

    move-result v17

    .line 327
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 328
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitRawData()[B

    move-result-object v18

    .line 329
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v19

    .line 331
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v2

    .line 332
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v3

    .line 333
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v20

    .line 334
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v4

    .line 338
    add-int v4, v4, v20

    rem-int/lit16 v4, v4, 0xb4

    if-nez v4, :cond_0

    .line 339
    nop

    .line 340
    nop

    .line 345
    move/from16 v21, v2

    move/from16 v22, v3

    goto :goto_0

    .line 342
    :cond_0
    nop

    .line 343
    nop

    .line 345
    move/from16 v22, v2

    move/from16 v21, v3

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 347
    if-eqz v0, :cond_2

    .line 349
    nop

    .line 350
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewHeight()I

    move-result v3

    .line 351
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v4

    .line 353
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v7

    .line 354
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootOrientation()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootRotation()F

    move-result v11

    .line 355
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    .line 356
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v14

    const/16 v16, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v24

    .line 349
    move-object v0, v15

    move/from16 v5, v21

    move/from16 v6, v22

    move-object/from16 v8, v23

    move/from16 v10, v20

    move/from16 v15, v16

    move-object/from16 v16, v24

    invoke-direct/range {v0 .. v16}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 358
    move-object/from16 v15, p0

    iget-object v1, v15, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v14, 0x0

    invoke-virtual {v1, v0, v14}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 359
    iget-object v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 362
    if-eqz v17, :cond_1

    .line 364
    nop

    .line 365
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewHeight()I

    move-result v3

    .line 366
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v4

    .line 368
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v7

    .line 369
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootOrientation()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootRotation()F

    move-result v11

    .line 370
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x0

    .line 371
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v18

    const/16 v24, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v25

    .line 364
    move-object v0, v15

    move-object v1, v13

    move/from16 v5, v21

    move/from16 v6, v22

    move-object/from16 v8, v23

    move/from16 v10, v20

    move-object/from16 v26, v13

    move/from16 v13, v16

    move-object/from16 v14, v18

    move/from16 v15, v24

    move-object/from16 v16, v25

    invoke-direct/range {v0 .. v16}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 372
    move-object/from16 v12, p0

    iget-object v1, v12, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 373
    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 377
    move-object v4, v0

    goto :goto_1

    :cond_1
    move-object/from16 v26, v13

    move-object v12, v15

    move-object/from16 v4, v18

    :goto_1
    move-object/from16 v2, v26

    goto :goto_2

    :cond_2
    move-object v12, v15

    move-object v2, v1

    move-object/from16 v4, v18

    :goto_2
    if-eqz v17, :cond_3

    .line 378
    nop

    .line 382
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isHasDualWaterMark()Z

    move-result v5

    .line 383
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLightingPattern()I

    move-result v6

    .line 384
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v7

    .line 385
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputWidth()I

    move-result v8

    .line 386
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputHeight()I

    move-result v9

    .line 387
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isMirror()Z

    move-result v10

    .line 388
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isBokehFrontCamera()Z

    move-result v11

    .line 378
    move-object/from16 v3, v19

    invoke-static/range {v2 .. v11}, Lcom/android/camera/Util;->composeDepthMapPicture([B[B[BZILjava/lang/String;IIZZ)[B

    move-result-object v0

    .line 391
    move-object v1, v0

    goto :goto_3

    :cond_3
    move-object v1, v2

    .line 392
    :goto_3
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v2

    const/4 v4, 0x0

    .line 393
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    .line 395
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v19

    .line 391
    move-object v0, v12

    move-object/from16 v3, v23

    move/from16 v9, v21

    move/from16 v10, v22

    move/from16 v12, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 396
    return-void
.end method

.method private insertParallelDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 11

    .line 399
    const-string v0, "ImageSaver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addParallel: path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getProcessUsedMemorySize()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/storage/ImageSaver;->reduceUsedMemory(I)V

    .line 402
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->isDepthMapData([B)Z

    move-result v0

    .line 403
    if-eqz v0, :cond_0

    .line 404
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 405
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v2

    .line 406
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitRawData()[B

    move-result-object v3

    .line 407
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isHasDualWaterMark()Z

    move-result v4

    .line 408
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLightingPattern()I

    move-result v5

    .line 409
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v6

    .line 410
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputWidth()I

    move-result v7

    .line 411
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputHeight()I

    move-result v8

    .line 412
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isMirror()Z

    move-result v9

    .line 413
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isBokehFrontCamera()Z

    move-result v10

    .line 404
    invoke-static/range {v1 .. v10}, Lcom/android/camera/Util;->composeDepthMapPicture([B[B[BZILjava/lang/String;IIZZ)[B

    move-result-object v0

    .line 417
    :goto_0
    move-object v2, v0

    goto :goto_1

    .line 415
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v0

    goto :goto_0

    .line 417
    :goto_1
    new-instance v0, Lcom/android/camera/storage/ParallelSaveRequest;

    .line 418
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeStamp()J

    move-result-wide v3

    .line 419
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v5

    .line 420
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v6

    .line 421
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v7

    .line 422
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputWidth()I

    move-result v8

    .line 423
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputHeight()I

    move-result v9

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lcom/android/camera/storage/ParallelSaveRequest;-><init>([BJLandroid/location/Location;ILjava/lang/String;II)V

    .line 424
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 425
    return-void
.end method

.method private insertPreviewShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 20

    .line 203
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 205
    nop

    .line 206
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputWidth()I

    move-result v9

    .line 207
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getOutputHeight()I

    move-result v10

    .line 209
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 210
    nop

    .line 212
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v8

    .line 214
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v19

    .line 210
    const/4 v12, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x1

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 216
    return-void
.end method

.method private insertSingTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 23

    move-object/from16 v15, p0

    .line 219
    move-object/from16 v14, p1

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    .line 220
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 221
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v2

    .line 222
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v3

    .line 223
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v13

    .line 224
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v4

    .line 228
    add-int/2addr v4, v13

    rem-int/lit16 v4, v4, 0xb4

    if-nez v4, :cond_0

    .line 229
    nop

    .line 230
    nop

    .line 235
    move v5, v2

    move v6, v3

    goto :goto_0

    .line 232
    :cond_0
    nop

    .line 233
    nop

    .line 235
    move v6, v2

    move v5, v3

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 237
    if-eqz v0, :cond_1

    .line 238
    nop

    .line 239
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewHeight()I

    move-result v3

    .line 240
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v4

    .line 242
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v7

    .line 243
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootOrientation()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootRotation()F

    move-result v11

    .line 244
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x1

    .line 245
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v18

    const/16 v19, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 238
    move-object v0, v15

    move-object/from16 v8, v17

    move v10, v13

    move/from16 v21, v13

    move/from16 v13, v16

    move-object/from16 v14, v18

    move/from16 v15, v19

    move-object/from16 v16, v20

    invoke-direct/range {v0 .. v16}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 247
    move-object/from16 v2, p0

    iget-object v1, v2, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 248
    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 249
    iget v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 250
    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 253
    move v10, v0

    move v9, v3

    goto :goto_1

    :cond_1
    move/from16 v21, v13

    move-object v2, v15

    move v9, v5

    move v10, v6

    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v3, -0x2

    if-ne v0, v3, :cond_2

    .line 254
    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->refillJpegData([B)V

    .line 255
    move/from16 v12, v21

    invoke-direct {v2, v0, v9, v12}, Lcom/android/camera/storage/ImageSaver;->storeJpegData(Lcom/xiaomi/camera/core/ParallelTaskData;II)V

    goto :goto_2

    .line 257
    :cond_2
    move-object/from16 v0, p1

    move/from16 v12, v21

    .line 258
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v3

    const/4 v4, 0x0

    .line 259
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v18, 0x0

    .line 261
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 257
    move-object v0, v2

    move v2, v3

    move-object/from16 v3, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 263
    :goto_2
    return-void
.end method

.method private isLastImageForThumbnail()Z
    .locals 1

    .line 773
    const/4 v0, 0x1

    return v0
.end method

.method private releaseResourcesIfQueueEmpty()V
    .locals 2

    .line 630
    iget v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 631
    return-void

    .line 634
    :cond_0
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 635
    return-void

    .line 638
    :cond_1
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 639
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->releaseIfNeeded()V

    .line 640
    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 642
    :cond_2
    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 643
    return-void
.end method

.method private storeJpegData(Lcom/xiaomi/camera/core/ParallelTaskData;II)V
    .locals 4

    .line 159
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 160
    int-to-double v0, p2

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPreviewWidth()I

    move-result p2

    int-to-double v2, p2

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int p2, v0

    .line 161
    invoke-static {p2}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p2

    .line 163
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getShootOrientation()I

    move-result v0

    rsub-int v0, v0, 0x168

    .line 165
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v1

    .line 166
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object p1

    add-int/2addr p3, v0

    add-int/2addr p3, v1

    const/4 v0, 0x0

    invoke-static {p1, p3, v0, p2}, Lcom/android/camera/Thumbnail;->createBitmap([BIZI)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 170
    if-eqz p1, :cond_0

    .line 171
    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/CameraScreenNail;->renderBitmapToCanvas(Landroid/graphics/Bitmap;)V

    .line 173
    :cond_0
    return-void
.end method

.method private updateThumbnail(Z)V
    .locals 3

    .line 672
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 673
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 674
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 675
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 676
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 678
    if-eqz v1, :cond_0

    .line 679
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 680
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 681
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->saveThumbnailToFile()V

    .line 684
    :cond_0
    return-void

    .line 676
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method public addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V
    .locals 25

    move-object/from16 v0, p0

    .line 142
    const-string v2, "ImageSaver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isParallelProcess: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v4, p17

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " uri="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    if-nez p7, :cond_0

    const-string v5, "null"

    goto :goto_0

    :cond_0
    move-object/from16 v5, p7

    :goto_0
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " algo="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v15, p18

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 142
    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    if-eqz p4, :cond_1

    if-nez p7, :cond_1

    .line 146
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    .line 149
    move-object v12, v1

    goto :goto_1

    :cond_1
    move-object/from16 v12, p7

    :goto_1
    const/4 v1, 0x0

    move-object/from16 v3, p1

    invoke-static {v3, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackImageSaver(Ljava/lang/Object;I)V

    .line 151
    new-instance v1, Lcom/android/camera/storage/ImageSaveRequest;

    move-object v5, v1

    move-object v6, v3

    move/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-wide/from16 v10, p5

    move-object/from16 v13, p8

    move/from16 v14, p9

    move/from16 v15, p10

    move-object/from16 v16, p11

    move/from16 v17, p12

    move/from16 v18, p13

    move/from16 v19, p14

    move/from16 v20, p15

    move/from16 v21, p16

    move/from16 v22, v4

    move-object/from16 v23, p18

    move-object/from16 v24, p19

    invoke-direct/range {v5 .. v24}, Lcom/android/camera/storage/ImageSaveRequest;-><init>([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 154
    invoke-direct {v0, v1}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 155
    return-void
.end method

.method public declared-synchronized addUsedMemory(I)V
    .locals 1

    monitor-enter p0

    .line 481
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/storage/MemoryManager;->addUsedMemory(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 482
    monitor-exit p0

    return-void

    .line 480
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V
    .locals 2

    .line 510
    monitor-enter p0

    .line 511
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 512
    const-string p1, "ImageSaver"

    const-string p2, "addVideo: host is being destroyed."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    monitor-exit p0

    return-void

    .line 515
    :cond_0
    new-instance v0, Lcom/android/camera/storage/VideoSaveRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/camera/storage/VideoSaveRequest;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 516
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 517
    monitor-exit p0

    .line 518
    return-void

    .line 517
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;
    .locals 2

    .line 521
    monitor-enter p0

    .line 522
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 523
    const-string p1, "ImageSaver"

    const-string p2, "addVideo: host is being destroyed."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    .line 526
    :cond_0
    new-instance v0, Lcom/android/camera/storage/VideoSaveRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/camera/storage/VideoSaveRequest;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 527
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1, p0}, Lcom/android/camera/storage/VideoSaveRequest;->setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V

    .line 528
    invoke-virtual {v0}, Lcom/android/camera/storage/VideoSaveRequest;->save()V

    .line 529
    iget-object p1, v0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    monitor-exit p0

    return-object p1

    .line 530
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getBurstDelay()I
    .locals 1

    .line 458
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->getBurstDelay()I

    move-result v0

    return v0
.end method

.method public getStoredJpegData()[B
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v0

    return-object v0
.end method

.method public getSuitableBurstShotSpeed()F
    .locals 1

    .line 476
    const v0, 0x3f28f5c3    # 0.66f

    return v0
.end method

.method public isBusy()Z
    .locals 1

    .line 535
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    return v0
.end method

.method public isNeedSlowDown()Z
    .locals 1

    .line 472
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isNeedSlowDown()Z

    move-result v0

    return v0
.end method

.method public isNeedStopCapture()Z
    .locals 1

    .line 462
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isNeedStopCapture()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isSaveQueueFull()Z
    .locals 2

    monitor-enter p0

    .line 466
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isSaveQueueFull()Z

    move-result v0

    .line 467
    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    or-int/2addr v1, v0

    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 468
    monitor-exit p0

    return v0

    .line 465
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public needThumbnail(Z)Z
    .locals 0

    .line 688
    monitor-enter p0

    .line 693
    if-eqz p1, :cond_0

    .line 695
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->isLastImageForThumbnail()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    .line 697
    :catchall_0
    move-exception p1

    goto :goto_1

    .line 695
    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    .line 693
    return p1

    .line 697
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public notifyNewImage(Landroid/net/Uri;Z)V
    .locals 1

    .line 737
    monitor-enter p0

    .line 738
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez v0, :cond_0

    .line 739
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 740
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    .line 741
    if-eqz p2, :cond_0

    .line 742
    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p2, p1}, Lcom/android/camera/ActivityBase;->addSecureUri(Landroid/net/Uri;)V

    .line 745
    :cond_0
    monitor-exit p0

    .line 746
    return-void

    .line 745
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public notifyNewVideo(Landroid/net/Uri;)V
    .locals 3

    .line 761
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez v0, :cond_0

    .line 762
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.hardware.action.NEW_VIDEO"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 763
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0, p1}, Lcom/android/camera/ActivityBase;->addSecureUri(Landroid/net/Uri;)V

    .line 765
    :cond_0
    return-void
.end method

.method public onHostDestroy()V
    .locals 3

    .line 616
    monitor-enter p0

    .line 617
    const/4 v0, 0x2

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 620
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->releaseResourcesIfQueueEmpty()V

    .line 621
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 622
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 623
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 624
    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 625
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 626
    const-string v0, "ImageSaver"

    const-string v1, "onHostDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    return-void

    .line 625
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 621
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public onHostPause()V
    .locals 3

    .line 594
    monitor-enter p0

    .line 595
    const/4 v0, 0x1

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 596
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 598
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 599
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 600
    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 601
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 606
    const-string v0, "ImageSaver"

    const-string v1, "onHostPause"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    return-void

    .line 601
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 596
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public onHostResume(Z)V
    .locals 2

    .line 581
    monitor-enter p0

    .line 582
    :try_start_0
    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 583
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 584
    const-string p1, "ImageSaver"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onHostResume: isCapture="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    monitor-exit p0

    .line 586
    return-void

    .line 585
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 4

    .line 778
    const-string v0, "algo finish"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimeStamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 779
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-nez v0, :cond_0

    .line 780
    new-instance v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    iget-boolean v2, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    invoke-direct {v0, v1, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;-><init>(Lcom/android/camera/ActivityBase;Z)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 781
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0, p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 782
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getJpegQuality(Z)Ljava/lang/String;

    move-result-object v0

    .line 783
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setQuality(I)V

    .line 785
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    .line 806
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "need fill logic"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 795
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertNormalDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 796
    goto :goto_0

    .line 802
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertLiveShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 803
    goto :goto_0

    .line 787
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertPreviewShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 788
    goto :goto_0

    .line 791
    :pswitch_3
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertSingTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 792
    goto :goto_0

    .line 798
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertParallelDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 799
    nop

    .line 809
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onSaveFinish(I)V
    .locals 1

    .line 750
    monitor-enter p0

    .line 751
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/camera/storage/ImageSaver;->reduceUsedMemory(I)V

    .line 752
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p1}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result p1

    const/16 v0, 0x28

    if-ge p1, v0, :cond_0

    .line 753
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 755
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->releaseResourcesIfQueueEmpty()V

    .line 756
    monitor-exit p0

    .line 757
    return-void

    .line 756
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public postHideThumbnailProgressing()V
    .locals 3

    .line 720
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 721
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/storage/ImageSaver$2;

    invoke-direct {v2, p0}, Lcom/android/camera/storage/ImageSaver$2;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 732
    monitor-exit v0

    .line 733
    return-void

    .line 732
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 1

    .line 702
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 705
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 706
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {p1, p2}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->setNeedAnimation(Z)V

    .line 707
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 708
    monitor-exit v0

    .line 709
    return-void

    .line 708
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public declared-synchronized reduceUsedMemory(I)V
    .locals 1

    monitor-enter p0

    .line 485
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/storage/MemoryManager;->reduceUsedMemory(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    monitor-exit p0

    return-void

    .line 484
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public saveStoredData()V
    .locals 21

    .line 176
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    .line 178
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v2

    .line 179
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v4

    .line 180
    iget-object v5, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v5

    invoke-static {v5}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v12

    .line 181
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v5

    .line 183
    add-int/2addr v5, v12

    rem-int/lit16 v5, v5, 0xb4

    if-nez v5, :cond_0

    .line 184
    nop

    .line 185
    nop

    .line 190
    move v9, v2

    move v10, v4

    goto :goto_0

    .line 187
    :cond_0
    nop

    .line 188
    nop

    .line 190
    move v10, v2

    move v9, v4

    :goto_0
    iget-object v2, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v2

    .line 191
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedCrateThumbnail()Z

    move-result v4

    const/4 v5, 0x0

    .line 192
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v11

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    .line 194
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getAlgorithmName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 190
    move-object v1, v2

    move v2, v4

    move-object v4, v5

    move-wide v5, v6

    move-object v7, v8

    move-object v8, v11

    move-object v11, v13

    move v13, v14

    move v14, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 195
    return-void
.end method

.method public updateImage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 430
    new-instance v0, Lcom/android/camera/storage/ImageSaveRequest;

    invoke-direct {v0}, Lcom/android/camera/storage/ImageSaveRequest;-><init>()V

    .line 431
    iput-object p1, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    .line 432
    iput-object p2, v0, Lcom/android/camera/storage/ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 433
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 434
    return-void
.end method

.method public updatePreviewThumbnailUri(Landroid/net/Uri;)V
    .locals 2

    .line 713
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 714
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/ThumbnailUpdater;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    .line 715
    monitor-exit v0

    .line 716
    return-void

    .line 715
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
