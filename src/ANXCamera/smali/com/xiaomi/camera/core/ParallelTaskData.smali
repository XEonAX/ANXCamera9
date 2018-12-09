.class public Lcom/xiaomi/camera/core/ParallelTaskData;
.super Ljava/lang/Object;
.source "ParallelTaskData.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAgeGenderAndMagicMirrorWater:Z

.field private mAlgorithmName:Ljava/lang/String;

.field private mBokehFrontCamera:Z

.field private mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field private mCoverFrameTimestamp:J

.field private mDeparted:Z

.field private mFaceWaterMarkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field

.field private mFilterId:I

.field private mHasDualWaterMark:Z

.field private mIsFrontCamera:Z

.field private mJpegImageData:[B

.field private mJpegRotation:I

.field private mLightingPattern:I

.field private mLocation:Landroid/location/Location;

.field private mMirror:Z

.field private mNeedCrateThumbnail:Z

.field private mOrientation:I

.field private mOutputHeight:I

.field private mOutputWidth:I

.field private mParallelType:I

.field private mPictureHeight:I

.field private mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

.field private mPictureWidth:I

.field private mPortraitDepthData:[B

.field private mPortraitRawData:[B

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mResultFrameDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/xiaomi/engine/FrameData;",
            ">;"
        }
    .end annotation
.end field

.field private mSavePath:Ljava/lang/String;

.field private mShootOrientation:I

.field private mShootRotation:F

.field private mSuffix:Ljava/lang/String;

.field private mTimeStamp:J

.field private mTimeWaterMarkString:Ljava/lang/String;

.field private mVideoRawData:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-class v0, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(JILjava/lang/String;)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 70
    iput-wide p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimeStamp:J

    .line 71
    iput p3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    .line 72
    iput-object p4, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    .line 74
    new-instance p1, Ljava/util/ArrayList;

    const/4 p2, 0x2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    .line 75
    return-void
.end method


# virtual methods
.method public checkThread()V
    .locals 0

    .line 104
    return-void
.end method

.method public copyParameter(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 0

    .line 310
    return-void
.end method

.method public declared-synchronized fillFrameData(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/protocol/ICustomCaptureResult;)V
    .locals 1

    monitor-enter p0

    .line 153
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->checkThread()V

    .line 154
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    iput-object p2, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    monitor-exit p0

    return-void

    .line 152
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized fillJpegData([BI)V
    .locals 3

    monitor-enter p0

    .line 124
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->checkThread()V

    .line 126
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 142
    :pswitch_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    if-nez v0, :cond_0

    .line 145
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    .line 146
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_0

    .line 143
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: depth already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 135
    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    if-nez v0, :cond_1

    .line 138
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    .line 139
    goto :goto_0

    .line 136
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: raw already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 128
    :pswitch_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-nez v0, :cond_2

    .line 131
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 132
    goto :goto_0

    .line 129
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: jpeg already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :goto_0
    sget-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fillJpegData: jpegData"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "; result = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    monitor-exit p0

    return-void

    .line 123
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized fillMp4Data([BJ)V
    .locals 3

    monitor-enter p0

    .line 107
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->checkThread()V

    .line 108
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-nez v0, :cond_0

    .line 111
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 112
    iput-wide p2, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCoverFrameTimestamp:J

    .line 113
    sget-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fillMp4Data: video = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "; timestamp = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    monitor-exit p0

    return-void

    .line 109
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "algo fillMp4Data: microvideo already set"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public fillParameter(ZZIIIIIIIIFILandroid/location/Location;Ljava/lang/String;Ljava/util/List;ZZIIZLjava/lang/String;Lcom/xiaomi/camera/core/PictureInfo;Ljava/lang/String;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZIIIIIIIIFI",
            "Landroid/location/Location;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;ZZIIZ",
            "Ljava/lang/String;",
            "Lcom/xiaomi/camera/core/PictureInfo;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    move-object v0, p0

    .line 253
    move v1, p1

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mHasDualWaterMark:Z

    .line 254
    move v1, p2

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mMirror:Z

    .line 255
    move v1, p3

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mLightingPattern:I

    .line 256
    move v1, p4

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPreviewWidth:I

    .line 257
    move v1, p5

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPreviewHeight:I

    .line 258
    move v1, p6

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureWidth:I

    .line 259
    move v1, p7

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureHeight:I

    .line 260
    move v1, p8

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mFilterId:I

    .line 261
    move v1, p9

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOrientation:I

    .line 262
    move v1, p10

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegRotation:I

    .line 263
    move v1, p11

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mShootRotation:F

    .line 264
    move v1, p12

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mShootOrientation:I

    .line 265
    move-object v1, p13

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mLocation:Landroid/location/Location;

    .line 266
    move-object/from16 v1, p14

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimeWaterMarkString:Ljava/lang/String;

    .line 267
    move-object/from16 v1, p15

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mFaceWaterMarkList:Ljava/util/List;

    .line 268
    move/from16 v1, p16

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAgeGenderAndMagicMirrorWater:Z

    .line 269
    move/from16 v1, p17

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mIsFrontCamera:Z

    .line 270
    move/from16 v1, p18

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOutputWidth:I

    .line 271
    move/from16 v1, p19

    iput v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOutputHeight:I

    .line 272
    move/from16 v1, p20

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mBokehFrontCamera:Z

    .line 273
    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAlgorithmName:Ljava/lang/String;

    .line 274
    move-object/from16 v1, p22

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    .line 275
    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSuffix:Ljava/lang/String;

    .line 276
    move/from16 v1, p24

    iput-boolean v1, v0, Lcom/xiaomi/camera/core/ParallelTaskData;->mNeedCrateThumbnail:Z

    .line 277
    return-void
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 1

    .line 438
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAlgorithmName:Ljava/lang/String;

    return-object v0
.end method

.method public getCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;
    .locals 1

    .line 345
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    return-object v0
.end method

.method public declared-synchronized getCoverFrameTimestamp()J
    .locals 2

    monitor-enter p0

    .line 321
    :try_start_0
    iget-wide v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCoverFrameTimestamp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFaceWaterMarkList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation

    .line 422
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mFaceWaterMarkList:Ljava/util/List;

    return-object v0
.end method

.method public getFilterId()I
    .locals 1

    .line 394
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mFilterId:I

    return v0
.end method

.method public getJpegImageData()[B
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    return-object v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 386
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegRotation:I

    return v0
.end method

.method public getLightingPattern()I
    .locals 1

    .line 353
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mLightingPattern:I

    return v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 1

    .line 382
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mLocation:Landroid/location/Location;

    return-object v0
.end method

.method public declared-synchronized getMicroVideoData()[B
    .locals 2

    monitor-enter p0

    .line 314
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 315
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "algo fillMp4Data: microvideo not set yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 313
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getOrientation()I
    .locals 1

    .line 414
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOrientation:I

    return v0
.end method

.method public getOutputHeight()I
    .locals 1

    .line 434
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOutputHeight:I

    return v0
.end method

.method public getOutputWidth()I
    .locals 1

    .line 430
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mOutputWidth:I

    return v0
.end method

.method public getParallelType()I
    .locals 1

    .line 362
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    return v0
.end method

.method public getPictureHeight()I
    .locals 1

    .line 378
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureHeight:I

    return v0
.end method

.method public getPictureInfo()Lcom/xiaomi/camera/core/PictureInfo;
    .locals 1

    .line 442
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureInfo:Lcom/xiaomi/camera/core/PictureInfo;

    return-object v0
.end method

.method public getPictureWidth()I
    .locals 1

    .line 374
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPictureWidth:I

    return v0
.end method

.method public getPortraitDepthData()[B
    .locals 1

    .line 337
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    return-object v0
.end method

.method public getPortraitRawData()[B
    .locals 1

    .line 333
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    return-object v0
.end method

.method public getPreviewHeight()I
    .locals 1

    .line 370
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPreviewHeight:I

    return v0
.end method

.method public getPreviewWidth()I
    .locals 1

    .line 366
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPreviewWidth:I

    return v0
.end method

.method public getProcessUsedMemorySize()I
    .locals 2

    .line 298
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    .line 300
    const v0, 0xba0c00

    return v0

    .line 302
    :cond_0
    const v0, 0x1741800

    return v0
.end method

.method public getResultFrameDataList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/xiaomi/engine/FrameData;",
            ">;"
        }
    .end annotation

    .line 341
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    return-object v0
.end method

.method public getSavePath()Ljava/lang/String;
    .locals 1

    .line 390
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    return-object v0
.end method

.method public getShootOrientation()I
    .locals 1

    .line 410
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mShootOrientation:I

    return v0
.end method

.method public getShootRotation()F
    .locals 1

    .line 406
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mShootRotation:F

    return v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .line 446
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSuffix:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeStamp()J
    .locals 2

    .line 329
    iget-wide v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimeStamp:J

    return-wide v0
.end method

.method public getTimeWaterMarkString()Ljava/lang/String;
    .locals 1

    .line 357
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimeWaterMarkString:Ljava/lang/String;

    return-object v0
.end method

.method public isAgeGenderAndMagicMirrorWater()Z
    .locals 1

    .line 418
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAgeGenderAndMagicMirrorWater:Z

    return v0
.end method

.method public isBokehFrontCamera()Z
    .locals 1

    .line 402
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mBokehFrontCamera:Z

    return v0
.end method

.method public declared-synchronized isFrameDataReady()Z
    .locals 4

    monitor-enter p0

    .line 198
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 199
    monitor-exit p0

    return v1

    .line 201
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    .line 208
    monitor-exit p0

    return v1

    .line 203
    :pswitch_0
    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    move v1, v2

    nop

    :cond_1
    monitor-exit p0

    return v1

    .line 205
    :pswitch_1
    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-ne v0, v2, :cond_2

    move v1, v2

    nop

    :cond_2
    monitor-exit p0

    return v1

    .line 197
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isFrontCamera()Z
    .locals 1

    .line 426
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mIsFrontCamera:Z

    return v0
.end method

.method public isHasDualWaterMark()Z
    .locals 1

    .line 349
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mHasDualWaterMark:Z

    return v0
.end method

.method public declared-synchronized isJpegDataReady()Z
    .locals 4

    monitor-enter p0

    .line 160
    nop

    .line 161
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 162
    monitor-exit p0

    return v1

    .line 165
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_2

    .line 179
    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    if-eqz v0, :cond_1

    .line 182
    move v1, v2

    goto :goto_2

    .line 179
    :cond_1
    goto :goto_2

    .line 174
    :pswitch_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-eqz v0, :cond_2

    .line 175
    move v1, v2

    goto :goto_0

    .line 174
    :cond_2
    nop

    .line 175
    :goto_0
    goto :goto_2

    .line 170
    :pswitch_3
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_3

    .line 171
    move v1, v2

    goto :goto_1

    .line 170
    :cond_3
    nop

    .line 171
    :goto_1
    nop

    .line 182
    :goto_2
    if-eqz v1, :cond_4

    .line 183
    sget-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isJpegDataReady: object = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; mParallelType = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 185
    :cond_4
    sget-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isJpegDataReady: object = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; mParallelType = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "; mJpegImageData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; mPortraitRawData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; mPortraitDepthData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; mVideoRawData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; result = false"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 194
    :goto_3
    monitor-exit p0

    return v1

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public isMirror()Z
    .locals 1

    .line 398
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mMirror:Z

    return v0
.end method

.method public isNeedCrateThumbnail()Z
    .locals 1

    .line 458
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mNeedCrateThumbnail:Z

    return v0
.end method

.method public refillJpegData([B)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 121
    return-void
.end method

.method public setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 80
    return-void
.end method

.method public setDeparted()V
    .locals 2

    .line 280
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z

    .line 281
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 282
    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    .line 283
    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    .line 284
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 285
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/engine/FrameData;

    .line 286
    invoke-virtual {v1}, Lcom/xiaomi/engine/FrameData;->getBufferImage()Landroid/media/Image;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 287
    goto :goto_0

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mResultFrameDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 290
    :cond_1
    return-void
.end method

.method public setNeedCreateThumbnail(Z)V
    .locals 0

    .line 454
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mNeedCrateThumbnail:Z

    .line 455
    return-void
.end method
