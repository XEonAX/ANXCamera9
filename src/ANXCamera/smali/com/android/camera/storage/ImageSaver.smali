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

.field private static final TAG:Ljava/lang/String;

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

.field private volatile mPendingSave:Z

.field private mPendingThumbnail:Lcom/android/camera/Thumbnail;

.field private mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

.field private final mUpdateThumbnailLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 73
    const-class v0, Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    .line 98
    new-instance v0, Lcom/android/camera/storage/ImageSaver$1;

    invoke-direct {v0}, Lcom/android/camera/storage/ImageSaver$1;-><init>()V

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    .line 107
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    sput-object v0, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    .line 113
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v8, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    sget-object v9, Lcom/android/camera/storage/ImageSaver;->sThreadFactory:Ljava/util/concurrent/ThreadFactory;

    const/4 v3, 0x4

    const/4 v4, 0x4

    const-wide/16 v5, 0xa

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 116
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 117
    sput-object v0, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 118
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;Landroid/os/Handler;Z)V
    .locals 1

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    .line 808
    new-instance v0, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-direct {v0, p0}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    .line 122
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    .line 123
    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    .line 124
    iput-boolean p3, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 125
    new-instance p2, Lcom/android/camera/storage/MemoryManager;

    invoke-direct {p2}, Lcom/android/camera/storage/MemoryManager;-><init>()V

    iput-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    .line 126
    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {p2}, Lcom/android/camera/storage/MemoryManager;->initMemory()V

    .line 128
    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    .line 129
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/storage/ImageSaver;)Lcom/android/camera/ActivityBase;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/storage/ImageSaver;Z)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->updateThumbnail(Z)V

    return-void
.end method

.method private addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V
    .locals 2

    .line 629
    monitor-enter p0

    .line 630
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 631
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v1, "addSaveRequest: host is being destroyed."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 634
    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 637
    :cond_1
    invoke-interface {p1}, Lcom/android/camera/storage/SaveRequest;->getSize()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addUsedMemory(I)V

    .line 638
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-interface {p1, v0, p0}, Lcom/android/camera/storage/SaveRequest;->setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 640
    :try_start_1
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->CAMERA_SAVER_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 645
    goto :goto_0

    .line 641
    :catch_0
    move-exception p1

    .line 643
    :try_start_2
    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 644
    sget-object p1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v0, "stop snapshot due to thread pool is full"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    :goto_0
    monitor-exit p0

    .line 647
    return-void

    .line 646
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method private getDrawJPEGAttribute([BIIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BIIIZII",
            "Landroid/location/Location;",
            "Ljava/lang/String;",
            "IIF",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;Z",
            "Lcom/xiaomi/camera/core/PictureInfo;",
            ")",
            "Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;"
        }
    .end annotation

    move/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v0, p8

    .line 1010
    new-instance v24, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    .line 1013
    if-le v5, v6, :cond_0

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1014
    :goto_0
    move v3, v1

    goto :goto_1

    .line 1013
    :cond_0
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_0

    .line 1014
    :goto_1
    if-le v6, v5, :cond_1

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 1018
    :goto_2
    move v4, v1

    goto :goto_3

    .line 1014
    :cond_1
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_2

    .line 1018
    :goto_3
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/effect/EffectController;->copyEffectRectAttribute()Lcom/android/camera/effect/EffectController$EffectRectAttribute;

    move-result-object v8

    .line 1019
    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 1021
    move-object v9, v1

    goto :goto_4

    .line 1019
    :cond_2
    new-instance v2, Landroid/location/Location;

    invoke-direct {v2, v0}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    .line 1021
    move-object v9, v2

    :goto_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 1025
    invoke-virtual/range {p18 .. p18}, Lcom/xiaomi/camera/core/PictureInfo;->isFrontMirror()Z

    move-result v16

    .line 1031
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result v21

    .line 1032
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_3

    move-object/from16 v22, p15

    goto :goto_5

    :cond_3
    move-object/from16 v22, v1

    :goto_5
    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move/from16 v2, p5

    move/from16 v7, p4

    move-object/from16 v10, p9

    move/from16 v13, p10

    move/from16 v14, p11

    move/from16 v15, p12

    move-object/from16 v17, p13

    move/from16 v18, p14

    move-object/from16 v19, p18

    move-object/from16 v20, p16

    move/from16 v23, p17

    invoke-direct/range {v0 .. v23}, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;-><init>([BZIIIIILcom/android/camera/effect/EffectController$EffectRectAttribute;Landroid/location/Location;Ljava/lang/String;JIIFZLjava/lang/String;ZLcom/xiaomi/camera/core/PictureInfo;Ljava/util/List;ZLjava/lang/String;Z)V

    .line 1010
    return-object v24
.end method

.method private getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BIIZII",
            "Landroid/location/Location;",
            "Ljava/lang/String;",
            "IIF",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;Z",
            "Lcom/xiaomi/camera/core/PictureInfo;",
            ")",
            "Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;"
        }
    .end annotation

    .line 984
    nop

    .line 985
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result v6

    .line 984
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move/from16 v14, p11

    move-object/from16 v15, p12

    move/from16 v16, p13

    move-object/from16 v17, p14

    move-object/from16 v18, p15

    move/from16 v19, p16

    move-object/from16 v20, p17

    invoke-direct/range {v2 .. v20}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    return-object v0
.end method

.method private insertLiveShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 30

    move-object/from16 v15, p0

    .line 313
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v14

    .line 314
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    .line 315
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 316
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getMicroVideoData()[B

    move-result-object v18

    .line 317
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getCoverFrameTimestamp()J

    move-result-wide v19

    .line 319
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v21

    .line 320
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v22

    .line 321
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v23

    .line 322
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v2

    .line 326
    add-int v2, v2, v23

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_0

    .line 327
    nop

    .line 328
    nop

    .line 333
    move/from16 v5, v21

    move/from16 v6, v22

    goto :goto_0

    .line 330
    :cond_0
    nop

    .line 331
    nop

    .line 333
    move/from16 v6, v21

    move/from16 v5, v22

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 334
    invoke-static {}, Lcom/android/camera/Util;->createGooglePhotosCompatibleLiveShot()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 335
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MV"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 338
    :cond_1
    move-object v13, v2

    if-eqz v0, :cond_3

    .line 339
    iget-object v0, v15, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-eqz v0, :cond_2

    .line 340
    nop

    .line 342
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 343
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 344
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v4

    .line 347
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v7

    .line 349
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootOrientation()I

    move-result v9

    .line 351
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootRotation()F

    move-result v11

    .line 352
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    const/16 v16, 0x1

    .line 354
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v17

    .line 355
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v24

    const/16 v25, 0x0

    .line 357
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v26

    .line 340
    move-object v0, v15

    move-object v8, v13

    move/from16 v10, v23

    move-object/from16 v27, v13

    move/from16 v13, v16

    move-object/from16 v28, v14

    move-object/from16 v14, v17

    move-object/from16 v15, v24

    move/from16 v16, v25

    move-object/from16 v17, v26

    invoke-direct/range {v0 .. v17}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 359
    move-object/from16 v10, p0

    iget-object v1, v10, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 360
    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 361
    iget v2, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 362
    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 363
    nop

    .line 368
    move v12, v0

    move v11, v2

    goto :goto_2

    .line 364
    :cond_2
    move-object/from16 v27, v13

    move-object/from16 v28, v14

    move-object v10, v15

    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v2, "insertLiveShotTask(): mEffectProcessor is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 368
    :cond_3
    move-object/from16 v27, v13

    move-object/from16 v28, v14

    move-object v10, v15

    :goto_1
    move v11, v5

    move v12, v6

    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_6

    .line 369
    nop

    .line 371
    move-object/from16 v0, v28

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isHasDualWaterMark()Z

    move-result v8

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v9

    .line 369
    move-object v2, v1

    move/from16 v3, v21

    move/from16 v4, v22

    move-object/from16 v5, v18

    move-wide/from16 v6, v19

    invoke-static/range {v2 .. v9}, Lcom/android/camera/Util;->composeLiveShotPicture([BII[BJZLjava/lang/String;)[B

    move-result-object v2

    .line 372
    if-eqz v2, :cond_5

    if-eqz v1, :cond_5

    array-length v3, v2

    array-length v1, v1

    if-ge v3, v1, :cond_4

    goto :goto_3

    .line 376
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v3

    const/4 v4, 0x0

    .line 377
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    .line 380
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 376
    move-object v0, v10

    move-object v1, v2

    move v2, v3

    move-object/from16 v3, v27

    move v9, v11

    move v10, v12

    move-object v11, v13

    move/from16 v12, v23

    move v13, v14

    move v14, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 381
    nop

    .line 384
    return-void

    .line 373
    :cond_5
    :goto_3
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to save LiveShot photo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v2, v27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    return-void

    .line 382
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Only supported LiveShot capture processing"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private insertNormalDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 35

    move-object/from16 v15, p0

    .line 390
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera2/ArcsoftDepthMap;->isDepthMapData([B)Z

    move-result v19

    .line 391
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 392
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitRawData()[B

    move-result-object v20

    .line 393
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v21

    .line 394
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v14

    .line 395
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFilterId()I

    move-result v13

    .line 396
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    const/4 v12, 0x0

    if-nez v0, :cond_1

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v13, v0, :cond_0

    goto :goto_0

    .line 398
    :cond_0
    move v0, v12

    goto :goto_1

    .line 396
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 398
    :goto_1
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 399
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 400
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v22

    .line 401
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v4

    .line 405
    add-int v4, v4, v22

    rem-int/lit16 v4, v4, 0xb4

    if-nez v4, :cond_2

    .line 406
    nop

    .line 407
    nop

    .line 412
    move/from16 v23, v2

    move/from16 v24, v3

    goto :goto_2

    .line 409
    :cond_2
    nop

    .line 410
    nop

    .line 412
    move/from16 v24, v2

    move/from16 v23, v3

    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    .line 414
    if-eqz v0, :cond_5

    .line 415
    iget-object v0, v15, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-eqz v0, :cond_4

    .line 417
    nop

    .line 419
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 420
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 422
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v5

    .line 425
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    .line 427
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootOrientation()I

    move-result v10

    .line 429
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootRotation()F

    move-result v16

    .line 430
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x1

    .line 432
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v26

    .line 433
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v27

    const/16 v28, 0x0

    .line 435
    invoke-virtual {v14}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v29

    .line 417
    move-object v0, v15

    move v4, v13

    move/from16 v6, v23

    move/from16 v7, v24

    move-object/from16 v9, v25

    move/from16 v11, v22

    move/from16 v12, v16

    move/from16 v31, v13

    move-object/from16 v13, v17

    move-object/from16 v32, v14

    move/from16 v14, v18

    move-object/from16 v15, v26

    move-object/from16 v16, v27

    move/from16 v17, v28

    move-object/from16 v18, v29

    invoke-direct/range {v0 .. v18}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 437
    move-object/from16 v15, p0

    iget-object v1, v15, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v14, 0x0

    invoke-virtual {v1, v0, v14}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 438
    iget-object v13, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 441
    if-eqz v19, :cond_3

    .line 443
    nop

    .line 445
    move-object/from16 v12, v32

    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 446
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 448
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v5

    .line 451
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    .line 453
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootOrientation()I

    move-result v10

    .line 455
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootRotation()F

    move-result v16

    .line 456
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    .line 458
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v26

    .line 459
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v27

    const/16 v28, 0x1

    .line 461
    invoke-virtual {v12}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v29

    .line 443
    move-object v0, v15

    move-object/from16 v1, v20

    move/from16 v4, v31

    move/from16 v6, v23

    move/from16 v7, v24

    move-object/from16 v9, v25

    move/from16 v11, v22

    move-object/from16 v33, v12

    move/from16 v12, v16

    move-object/from16 v30, v13

    move-object/from16 v13, v17

    move/from16 v14, v18

    move-object/from16 v15, v26

    move-object/from16 v16, v27

    move/from16 v17, v28

    move-object/from16 v18, v29

    invoke-direct/range {v0 .. v18}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 462
    move-object/from16 v13, p0

    iget-object v1, v13, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 463
    iget-object v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 465
    move-object/from16 v20, v0

    goto :goto_3

    :cond_3
    move-object/from16 v30, v13

    move-object v13, v15

    move-object/from16 v33, v32

    .line 470
    :goto_3
    move-object/from16 v4, v20

    move-object/from16 v2, v30

    goto :goto_5

    .line 466
    :cond_4
    move-object/from16 v33, v14

    move-object v13, v15

    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v2, "insertNormalDualTask(): mEffectProcessor is null"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 470
    :cond_5
    move-object/from16 v33, v14

    move-object v13, v15

    :goto_4
    move-object v2, v1

    move-object/from16 v4, v20

    :goto_5
    if-eqz v19, :cond_6

    .line 471
    nop

    .line 475
    move-object/from16 v0, v33

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isHasDualWaterMark()Z

    move-result v5

    .line 476
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLightingPattern()I

    move-result v6

    .line 477
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v7

    .line 478
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v8

    .line 479
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v9

    .line 480
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isMirror()Z

    move-result v10

    .line 481
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isBokehFrontCamera()Z

    move-result v11

    .line 482
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v12

    .line 471
    move-object/from16 v3, v21

    invoke-static/range {v2 .. v12}, Lcom/android/camera/Util;->composeDepthMapPicture([B[B[BZILjava/lang/String;IIZZLcom/xiaomi/camera/core/PictureInfo;)[B

    move-result-object v1

    goto :goto_6

    .line 485
    :cond_6
    move-object/from16 v0, v33

    move-object v1, v2

    :goto_6
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v2

    const/4 v4, 0x0

    .line 486
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    .line 489
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 485
    move-object v0, v13

    move-object/from16 v3, v25

    move/from16 v9, v23

    move/from16 v10, v24

    move/from16 v12, v22

    move v13, v14

    move v14, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    move-object/from16 v19, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 490
    return-void
.end method

.method private insertParallelBurstTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 23

    .line 536
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    .line 537
    sget-object v1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insertParallelBurstTask: path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v4

    .line 539
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    .line 540
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    .line 541
    invoke-static {v4}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v15

    .line 543
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v3

    .line 544
    sget-object v5, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "insertParallelBurstTask: %d x %d, %d : %d"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    .line 545
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v8, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x1

    aput-object v9, v8, v10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x2

    aput-object v9, v8, v10

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x3

    aput-object v9, v8, v10

    .line 544
    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    add-int/2addr v3, v15

    rem-int/lit16 v3, v3, 0xb4

    if-nez v3, :cond_0

    .line 549
    nop

    .line 550
    nop

    .line 555
    move v12, v1

    move v13, v2

    goto :goto_0

    .line 552
    :cond_0
    nop

    .line 553
    nop

    .line 555
    move v13, v1

    move v12, v2

    :goto_0
    sget-object v1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insertParallelBurstTask: result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 557
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 558
    sget-object v1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insertParallelBurstTask: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 560
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v18

    .line 561
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v5

    const/4 v7, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v10, 0x0

    .line 562
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v11

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x1

    .line 565
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v22

    .line 561
    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v22}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 566
    return-void
.end method

.method private insertParallelDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 14

    .line 496
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    .line 497
    sget-object v1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addParallel: path="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 500
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v1

    const/4 v2, 0x6

    if-eq v2, v1, :cond_0

    const/16 v1, 0x8

    .line 501
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v2

    if-eq v1, v2, :cond_0

    const/4 v1, 0x7

    .line 502
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 503
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera2/ArcsoftDepthMap;->isDepthMapData([B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 504
    nop

    .line 505
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v2

    .line 506
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitDepthData()[B

    move-result-object v3

    .line 507
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPortraitRawData()[B

    move-result-object v4

    .line 508
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isHasDualWaterMark()Z

    move-result v5

    .line 509
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLightingPattern()I

    move-result v6

    .line 510
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v7

    .line 511
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v8

    .line 512
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v9

    .line 513
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isMirror()Z

    move-result v10

    .line 514
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isBokehFrontCamera()Z

    move-result v11

    .line 515
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v12

    .line 504
    invoke-static/range {v2 .. v12}, Lcom/android/camera/Util;->composeDepthMapPicture([B[B[BZILjava/lang/String;IIZZLcom/xiaomi/camera/core/PictureInfo;)[B

    move-result-object v1

    .line 519
    :goto_0
    move-object v3, v1

    goto :goto_1

    .line 517
    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    goto :goto_0

    .line 519
    :goto_1
    new-instance v1, Lcom/android/camera/storage/ParallelSaveRequest;

    .line 520
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v4

    .line 521
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v6

    .line 522
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v7

    .line 523
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v8

    .line 524
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v9

    .line 525
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v10

    .line 526
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v11

    .line 527
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v12

    .line 528
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v13

    move-object v2, v1

    invoke-direct/range {v2 .. v13}, Lcom/android/camera/storage/ParallelSaveRequest;-><init>([BJLandroid/location/Location;ILjava/lang/String;IIZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 529
    invoke-direct {p0, v1}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 530
    return-void
.end method

.method private insertPreviewShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 20

    .line 218
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 219
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    .line 221
    nop

    .line 222
    nop

    .line 223
    nop

    .line 224
    nop

    .line 225
    nop

    .line 226
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 227
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 228
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 229
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v4

    .line 230
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v5

    .line 231
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    .line 234
    move-object/from16 v19, v0

    move v9, v2

    move v10, v3

    move-object v8, v4

    move-object/from16 v18, v5

    goto :goto_0

    :cond_0
    move v9, v2

    move v10, v9

    move-object v8, v3

    move-object/from16 v18, v8

    move-object/from16 v19, v18

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->getFileTitleFromPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 235
    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x1

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 240
    return-void
.end method

.method private insertSingleTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 27

    move-object/from16 v15, p0

    .line 246
    move-object/from16 v14, p1

    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v13

    .line 247
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFilterId()I

    move-result v4

    .line 248
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/effect/EffectController;->hasEffect()Z

    move-result v0

    const/4 v12, 0x0

    if-nez v0, :cond_1

    sget v0, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    if-eq v4, v0, :cond_0

    goto :goto_0

    .line 249
    :cond_0
    move v0, v12

    goto :goto_1

    .line 248
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 249
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v1

    .line 250
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 251
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 252
    invoke-static {v1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v11

    .line 253
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v5

    .line 257
    add-int/2addr v5, v11

    rem-int/lit16 v5, v5, 0xb4

    if-nez v5, :cond_2

    .line 258
    nop

    .line 259
    nop

    .line 264
    move v6, v2

    move v7, v3

    goto :goto_2

    .line 261
    :cond_2
    nop

    .line 262
    nop

    .line 264
    move v7, v2

    move v6, v3

    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getSuffix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 266
    if-eqz v0, :cond_4

    .line 267
    iget-object v0, v15, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    if-eqz v0, :cond_3

    .line 268
    nop

    .line 270
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 271
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 273
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v5

    .line 276
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    .line 278
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootOrientation()I

    move-result v10

    .line 280
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootRotation()F

    move-result v16

    .line 281
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x1

    .line 283
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getTimeWaterMarkString()Ljava/lang/String;

    move-result-object v20

    .line 284
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getFaceWaterMarkList()Ljava/util/List;

    move-result-object v21

    const/16 v22, 0x0

    .line 286
    invoke-virtual {v13}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v23

    .line 268
    move-object v0, v15

    move-object/from16 v9, v19

    move/from16 v24, v11

    move/from16 v12, v16

    move-object/from16 v25, v13

    move-object/from16 v13, v17

    move/from16 v14, v18

    move-object/from16 v15, v20

    move-object/from16 v16, v21

    move/from16 v17, v22

    move-object/from16 v18, v23

    invoke-direct/range {v0 .. v18}, Lcom/android/camera/storage/ImageSaver;->getDrawJPEGAttribute([BIIIZIILandroid/location/Location;Ljava/lang/String;IIFLjava/lang/String;ZLjava/lang/String;Ljava/util/List;ZLcom/xiaomi/camera/core/PictureInfo;)Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;

    move-result-object v0

    .line 288
    move-object/from16 v2, p0

    iget-object v1, v2, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->processorJpegSync(Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;Z)V

    .line 289
    iget-object v1, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mData:[B

    .line 290
    iget v3, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mWidth:I

    .line 291
    iget v0, v0, Lcom/android/camera/effect/draw_mode/DrawJPEGAttribute;->mHeight:I

    .line 292
    nop

    .line 297
    move v10, v0

    move v9, v3

    goto :goto_4

    .line 293
    :cond_3
    move/from16 v24, v11

    move-object/from16 v25, v13

    move-object v2, v15

    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v3, "insertSingleTask(): mEffectProcessor is null"

    invoke-static {v0, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 297
    :cond_4
    move/from16 v24, v11

    move-object/from16 v25, v13

    move-object v2, v15

    :goto_3
    move v9, v6

    move v10, v7

    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v3, -0x2

    if-eq v0, v3, :cond_6

    .line 298
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    const/4 v3, -0x3

    if-ne v0, v3, :cond_5

    goto :goto_5

    .line 302
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v3

    const/4 v4, 0x0

    .line 303
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v8

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    .line 305
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v20

    .line 302
    move-object v0, v2

    move v2, v3

    move-object/from16 v3, v19

    move/from16 v12, v24

    move-object/from16 v19, v20

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    goto :goto_6

    .line 299
    :cond_6
    :goto_5
    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->refillJpegData([B)V

    .line 300
    move/from16 v1, v24

    invoke-direct {v2, v0, v9, v1}, Lcom/android/camera/storage/ImageSaver;->storeJpegData(Lcom/xiaomi/camera/core/ParallelTaskData;II)V

    .line 307
    :goto_6
    return-void
.end method

.method private isLastImageForThumbnail()Z
    .locals 1

    .line 918
    const/4 v0, 0x1

    return v0
.end method

.method private releaseResourcesIfQueueEmpty()V
    .locals 2

    .line 768
    iget v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 769
    return-void

    .line 772
    :cond_0
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 773
    return-void

    .line 777
    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mPendingSave:Z

    if-eqz v0, :cond_2

    .line 778
    return-void

    .line 781
    :cond_2
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 782
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->releaseIfNeeded()V

    .line 783
    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 785
    :cond_3
    iput-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 786
    return-void
.end method

.method private storeJpegData(Lcom/xiaomi/camera/core/ParallelTaskData;II)V
    .locals 5

    .line 171
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    .line 172
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 173
    int-to-double v1, p2

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPreviewSize()Landroid/util/Size;

    move-result-object p2

    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result p2

    int-to-double v3, p2

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int p2, v1

    .line 174
    invoke-static {p2}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p2

    .line 176
    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getShootOrientation()I

    move-result v0

    rsub-int v0, v0, 0x168

    .line 178
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRotation(Landroid/app/Activity;)I

    move-result v1

    .line 179
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object p1

    add-int/2addr p3, v0

    add-int/2addr p3, v1

    const/4 v0, 0x0

    invoke-static {p1, p3, v0, p2}, Lcom/android/camera/Thumbnail;->createBitmap([BIZI)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 183
    if-eqz p1, :cond_0

    .line 184
    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/CameraScreenNail;->renderBitmapToCanvas(Landroid/graphics/Bitmap;)V

    .line 186
    :cond_0
    return-void
.end method

.method private updateThumbnail(Z)V
    .locals 3

    .line 815
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 816
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 817
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 818
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 819
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 821
    if-eqz v1, :cond_0

    .line 822
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p1}, Lcom/android/camera/ThumbnailUpdater;->setThumbnail(Lcom/android/camera/Thumbnail;ZZ)V

    .line 823
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->isActivityPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 824
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->saveThumbnailToFile()V

    .line 827
    :cond_0
    return-void

    .line 819
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

    move-object/from16 v1, p7

    .line 156
    sget-object v2, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isParallelProcess: parallel="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v4, p17

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " uri="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " algo="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v15, p18

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    if-eqz p4, :cond_0

    if-nez v1, :cond_0

    .line 159
    iget-object v1, v0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    .line 162
    :cond_0
    move-object v12, v1

    const/4 v1, 0x0

    move-object/from16 v3, p1

    invoke-static {v3, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackImageSaver(Ljava/lang/Object;I)V

    .line 164
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

    .line 167
    invoke-direct {v0, v1}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 168
    return-void
.end method

.method public declared-synchronized addUsedMemory(I)V
    .locals 1

    monitor-enter p0

    .line 621
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/storage/MemoryManager;->addUsedMemory(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 622
    monitor-exit p0

    return-void

    .line 620
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V
    .locals 2

    .line 650
    monitor-enter p0

    .line 651
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 652
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v1, "addVideo: host is being destroyed."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    :cond_0
    new-instance v0, Lcom/android/camera/storage/VideoSaveRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/camera/storage/VideoSaveRequest;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 655
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 656
    monitor-exit p0

    .line 657
    return-void

    .line 656
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public addVideoSync(Ljava/lang/String;Landroid/content/ContentValues;Z)Landroid/net/Uri;
    .locals 2

    .line 660
    monitor-enter p0

    .line 661
    const/4 v0, 0x2

    :try_start_0
    iget v1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    if-ne v0, v1, :cond_0

    .line 662
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v1, "addVideo: host is being destroyed."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    :cond_0
    new-instance v0, Lcom/android/camera/storage/VideoSaveRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/camera/storage/VideoSaveRequest;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    .line 665
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1, p0}, Lcom/android/camera/storage/VideoSaveRequest;->setContextAndCallback(Landroid/content/Context;Lcom/android/camera/storage/SaverCallback;)V

    .line 666
    invoke-virtual {v0}, Lcom/android/camera/storage/VideoSaveRequest;->save()V

    .line 667
    iget-object p1, v0, Lcom/android/camera/storage/VideoSaveRequest;->mUri:Landroid/net/Uri;

    monitor-exit p0

    return-object p1

    .line 668
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getBurstDelay()I
    .locals 1

    .line 598
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->getBurstDelay()I

    move-result v0

    return v0
.end method

.method public getStoredJpegData()[B
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v0

    return-object v0
.end method

.method public getSuitableBurstShotSpeed()F
    .locals 1

    .line 616
    const v0, 0x3f28f5c3    # 0.66f

    return v0
.end method

.method public isBusy()Z
    .locals 1

    .line 673
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    return v0
.end method

.method public isNeedSlowDown()Z
    .locals 1

    .line 612
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isNeedSlowDown()Z

    move-result v0

    return v0
.end method

.method public isNeedStopCapture()Z
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isNeedStopCapture()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isSaveQueueFull()Z
    .locals 2

    monitor-enter p0

    .line 606
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0}, Lcom/android/camera/storage/MemoryManager;->isSaveQueueFull()Z

    move-result v0

    .line 607
    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    or-int/2addr v1, v0

    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 608
    monitor-exit p0

    return v0

    .line 605
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public needThumbnail(Z)Z
    .locals 0

    .line 831
    monitor-enter p0

    .line 836
    if-eqz p1, :cond_0

    .line 838
    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->isLastImageForThumbnail()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    .line 840
    :catchall_0
    move-exception p1

    goto :goto_1

    .line 838
    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    .line 836
    return p1

    .line 840
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public notifyNewMediaData(Landroid/net/Uri;Ljava/lang/String;I)V
    .locals 2

    .line 891
    iget-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    if-eqz v0, :cond_0

    .line 892
    return-void

    .line 895
    :cond_0
    monitor-enter p0

    .line 896
    const/16 v0, 0x15

    if-eq p3, v0, :cond_2

    const/16 v0, 0x1f

    if-eq p3, v0, :cond_1

    goto :goto_0

    .line 903
    :cond_1
    :try_start_0
    iget-object p3, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    invoke-static {p3, p1}, Lcom/android/camera/Util;->broadcastNewPicture(Landroid/content/Context;Landroid/net/Uri;)V

    .line 904
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mLastImageUri:Landroid/net/Uri;

    .line 905
    iget-object p3, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ActivityBase;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    goto :goto_0

    .line 898
    :cond_2
    iget-object p3, p0, Lcom/android/camera/storage/ImageSaver;->mContext:Landroid/content/Context;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.hardware.action.NEW_VIDEO"

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p3, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 899
    iget-object p3, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p3, p1, p2}, Lcom/android/camera/ActivityBase;->onNewUriArrived(Landroid/net/Uri;Ljava/lang/String;)V

    .line 900
    nop

    .line 909
    :goto_0
    monitor-exit p0

    .line 910
    return-void

    .line 909
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onHostDestroy()V
    .locals 3

    .line 754
    monitor-enter p0

    .line 755
    const/4 v0, 0x2

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 758
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->releaseResourcesIfQueueEmpty()V

    .line 759
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 760
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 761
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 762
    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 763
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 764
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v1, "onHostDestroy"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 765
    return-void

    .line 763
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 759
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

    .line 732
    monitor-enter p0

    .line 733
    const/4 v0, 0x1

    :try_start_0
    iput v0, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 734
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 736
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 737
    :try_start_1
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 738
    iput-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 739
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 744
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    const-string v1, "onHostPause"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 745
    return-void

    .line 739
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 734
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

    .line 719
    monitor-enter p0

    .line 720
    :try_start_0
    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    .line 721
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/storage/ImageSaver;->mHostState:I

    .line 722
    sget-object p1, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onHostResume: isCapture="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    monitor-exit p0

    .line 724
    return-void

    .line 723
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 4

    .line 923
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/storage/ImageSaver;->mPendingSave:Z

    .line 924
    sget-object v0, Lcom/android/camera/storage/ImageSaver;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "algo finish: path: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 926
    new-instance v0, Lcom/android/camera/effect/renders/SnapshotEffectRender;

    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    iget-boolean v3, p0, Lcom/android/camera/storage/ImageSaver;->mIsCaptureIntent:Z

    invoke-direct {v0, v2, v3}, Lcom/android/camera/effect/renders/SnapshotEffectRender;-><init>(Lcom/android/camera/ActivityBase;Z)V

    iput-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    .line 927
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-virtual {v0, p0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setImageSaver(Lcom/android/camera/storage/ImageSaver;)V

    .line 928
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getJpegQuality(Z)Ljava/lang/String;

    move-result-object v0

    .line 929
    iget-object v2, p0, Lcom/android/camera/storage/ImageSaver;->mEffectProcessor:Lcom/android/camera/effect/renders/SnapshotEffectRender;

    invoke-static {v0}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/android/camera/effect/renders/SnapshotEffectRender;->setQuality(I)V

    .line 931
    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getParallelType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 961
    :pswitch_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "need fill logic"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 957
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertParallelBurstTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 958
    goto :goto_0

    .line 949
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertParallelDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 950
    goto :goto_0

    .line 942
    :pswitch_3
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertNormalDualTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 943
    goto :goto_0

    .line 953
    :pswitch_4
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertLiveShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 954
    goto :goto_0

    .line 933
    :pswitch_5
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertPreviewShotTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 934
    goto :goto_0

    .line 938
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/android/camera/storage/ImageSaver;->insertSingleTask(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 939
    nop

    .line 964
    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingSave:Z

    .line 965
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onSaveFinish(I)V
    .locals 1

    .line 880
    monitor-enter p0

    .line 881
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/camera/storage/ImageSaver;->reduceUsedMemory(I)V

    .line 882
    invoke-virtual {p0}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/storage/ImageSaver;->mSaveRequestQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {p1}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result p1

    const/16 v0, 0x28

    if-ge p1, v0, :cond_0

    .line 883
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/storage/ImageSaver;->mIsBusy:Z

    .line 885
    :cond_0
    invoke-direct {p0}, Lcom/android/camera/storage/ImageSaver;->releaseResourcesIfQueueEmpty()V

    .line 886
    monitor-exit p0

    .line 887
    return-void

    .line 886
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public postHideThumbnailProgressing()V
    .locals 3

    .line 863
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 864
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/storage/ImageSaver$2;

    invoke-direct {v2, p0}, Lcom/android/camera/storage/ImageSaver$2;-><init>(Lcom/android/camera/storage/ImageSaver;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 875
    monitor-exit v0

    .line 876
    return-void

    .line 875
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public postUpdateThumbnail(Lcom/android/camera/Thumbnail;Z)V
    .locals 1

    .line 845
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 848
    :try_start_0
    iput-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mPendingThumbnail:Lcom/android/camera/Thumbnail;

    .line 849
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {p1, p2}, Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;->setNeedAnimation(Z)V

    .line 850
    iget-object p1, p0, Lcom/android/camera/storage/ImageSaver;->mHandler:Landroid/os/Handler;

    iget-object p2, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnail:Lcom/android/camera/storage/ImageSaver$ThumbnailUpdater;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 851
    monitor-exit v0

    .line 852
    return-void

    .line 851
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

    .line 625
    :try_start_0
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mMemoryManager:Lcom/android/camera/storage/MemoryManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/storage/MemoryManager;->reduceUsedMemory(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 626
    monitor-exit p0

    return-void

    .line 624
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public saveStoredData()V
    .locals 22

    .line 189
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 190
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v2

    .line 191
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v3

    .line 192
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v4

    .line 193
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v5

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v5

    .line 194
    iget-object v6, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v6}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v6

    invoke-static {v6}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v12

    .line 195
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v6

    .line 197
    add-int/2addr v6, v12

    rem-int/lit16 v6, v6, 0xb4

    if-nez v6, :cond_0

    .line 198
    nop

    .line 199
    nop

    .line 204
    move v9, v4

    move v10, v5

    goto :goto_0

    .line 201
    :cond_0
    nop

    .line 202
    nop

    .line 204
    move v10, v4

    move v9, v5

    :goto_0
    iget-object v4, v0, Lcom/android/camera/storage/ImageSaver;->mStoredTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegImageData()[B

    move-result-object v4

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail()Z

    move-result v5

    const/4 v6, 0x0

    .line 205
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const/4 v11, 0x0

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 207
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getAlgorithmName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v21

    .line 204
    move-object v1, v4

    move v2, v5

    move-object v4, v6

    move-wide v5, v7

    move-object v7, v11

    move-object v8, v13

    move-object v11, v14

    move v13, v15

    move/from16 v14, v16

    move/from16 v15, v17

    move/from16 v16, v18

    move/from16 v17, v19

    move-object/from16 v18, v20

    move-object/from16 v19, v21

    invoke-virtual/range {v0 .. v19}, Lcom/android/camera/storage/ImageSaver;->addImage([BZLjava/lang/String;Ljava/lang/String;JLandroid/net/Uri;Landroid/location/Location;IILcom/android/gallery3d/exif/ExifInterface;IZZZZZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;)V

    .line 208
    return-void
.end method

.method public updateImage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 570
    new-instance v0, Lcom/android/camera/storage/ImageSaveRequest;

    invoke-direct {v0}, Lcom/android/camera/storage/ImageSaveRequest;-><init>()V

    .line 571
    iput-object p1, v0, Lcom/android/camera/storage/ImageSaveRequest;->title:Ljava/lang/String;

    .line 572
    iput-object p2, v0, Lcom/android/camera/storage/ImageSaveRequest;->oldTitle:Ljava/lang/String;

    .line 573
    invoke-direct {p0, v0}, Lcom/android/camera/storage/ImageSaver;->addSaveRequest(Lcom/android/camera/storage/SaveRequest;)V

    .line 574
    return-void
.end method

.method public updatePreviewThumbnailUri(Landroid/net/Uri;)V
    .locals 2

    .line 856
    iget-object v0, p0, Lcom/android/camera/storage/ImageSaver;->mUpdateThumbnailLock:Ljava/lang/Object;

    monitor-enter v0

    .line 857
    :try_start_0
    iget-object v1, p0, Lcom/android/camera/storage/ImageSaver;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/camera/ThumbnailUpdater;->updatePreviewThumbnailUri(Landroid/net/Uri;)V

    .line 858
    monitor-exit v0

    .line 859
    return-void

    .line 858
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
