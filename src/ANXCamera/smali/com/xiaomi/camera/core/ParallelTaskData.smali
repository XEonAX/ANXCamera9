.class public Lcom/xiaomi/camera/core/ParallelTaskData;
.super Ljava/lang/Object;
.source "ParallelTaskData.java"


# static fields
.field private static final GROUPSHOT_ORIGINAL_SUFFIX:Ljava/lang/String; = "_ORG"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isNeedThumbnail:Z

.field private mAlgoType:I

.field private mBurstNum:I

.field private mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field private mCoverFrameTimestamp:J

.field private mDataParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

.field private mDeparted:Z

.field private mJpegImageData:[B

.field private mParallelType:I

.field private mPortraitDepthData:[B

.field private mPortraitRawData:[B

.field private mSavePath:Ljava/lang/String;

.field private mTimestamp:J

.field private mVideoRawData:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const-class v0, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(JILjava/lang/String;)V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 66
    iput-wide p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimestamp:J

    .line 67
    iput p3, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    .line 68
    iput-object p4, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 2

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 75
    iget v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    iput v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    .line 76
    iget-wide v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimestamp:J

    iput-wide v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimestamp:J

    .line 77
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 78
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 79
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    .line 80
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    .line 81
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    .line 82
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z

    .line 83
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mDataParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDataParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 84
    iget-boolean v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail:Z

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail:Z

    .line 85
    iget-object v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 86
    iget-wide v0, p1, Lcom/xiaomi/camera/core/ParallelTaskData;->mCoverFrameTimestamp:J

    iput-wide v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCoverFrameTimestamp:J

    .line 87
    return-void
.end method


# virtual methods
.method public checkThread()V
    .locals 0

    .line 98
    return-void
.end method

.method public cloneTaskData(I)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 6

    .line 203
    new-instance v0, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-direct {v0, p0}, Lcom/xiaomi/camera/core/ParallelTaskData;-><init>(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    .line 204
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSavePath()Ljava/lang/String;

    move-result-object v1

    .line 206
    const-string v2, "_ORG"

    .line 207
    if-lez p1, :cond_0

    .line 208
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 210
    :cond_0
    const-string p1, "."

    invoke-virtual {v1, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result p1

    .line 211
    const/4 v3, 0x0

    if-lez p1, :cond_1

    .line 212
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 214
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 216
    :goto_0
    sget-object v1, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[1] cloneTaskData: path="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->setSavePath(Ljava/lang/String;)V

    .line 218
    invoke-virtual {v0, v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    .line 219
    new-instance p1, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;-><init>(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    .line 220
    invoke-virtual {p1, v3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    .line 221
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    .line 222
    invoke-virtual {p1, v3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    .line 223
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    .line 225
    return-object v0
.end method

.method public declared-synchronized fillJpegData([BI)V
    .locals 3

    monitor-enter p0

    .line 118
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->checkThread()V

    .line 120
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 136
    :pswitch_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    if-nez v0, :cond_0

    .line 139
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    .line 140
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_0

    .line 137
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: depth already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 129
    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    if-nez v0, :cond_1

    .line 132
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    .line 133
    goto :goto_0

    .line 130
    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: raw already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 122
    :pswitch_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-nez v0, :cond_2

    .line 125
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 126
    goto :goto_0

    .line 123
    :cond_2
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "algo fillJpegData: jpeg already set"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 143
    :goto_0
    sget-object v0, Lcom/xiaomi/camera/core/ParallelTaskData;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fillJpegData: jpegData="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "; imageType="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    monitor-exit p0

    return-void

    .line 117
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized fillMp4Data([BJ)V
    .locals 3

    monitor-enter p0

    .line 101
    :try_start_0
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ParallelTaskData;->checkThread()V

    .line 102
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-nez v0, :cond_0

    .line 105
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    .line 106
    iput-wide p2, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCoverFrameTimestamp:J

    .line 107
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

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    .line 103
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "algo fillMp4Data: microvideo already set"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDataParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 193
    return-void
.end method

.method public getAlgoType()I
    .locals 1

    .line 279
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAlgoType:I

    return v0
.end method

.method public getBurstNum()I
    .locals 1

    .line 283
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mBurstNum:I

    return v0
.end method

.method public getCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    return-object v0
.end method

.method public declared-synchronized getCoverFrameTimestamp()J
    .locals 2

    monitor-enter p0

    .line 238
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

.method public getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;
    .locals 1

    .line 271
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDataParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    return-object v0
.end method

.method public getJpegImageData()[B
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    return-object v0
.end method

.method public declared-synchronized getMicroVideoData()[B
    .locals 2

    monitor-enter p0

    .line 231
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 232
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "algo fillMp4Data: microvideo not set yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getParallelType()I
    .locals 1

    .line 263
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    return v0
.end method

.method public getPortraitDepthData()[B
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    return-object v0
.end method

.method public getPortraitRawData()[B
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    return-object v0
.end method

.method public getSavePath()Ljava/lang/String;
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .line 246
    iget-wide v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimestamp:J

    return-wide v0
.end method

.method public declared-synchronized isJpegDataReady()Z
    .locals 4

    monitor-enter p0

    .line 147
    nop

    .line 148
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 149
    monitor-exit p0

    return v1

    .line 152
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mParallelType:I

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_2

    .line 163
    :pswitch_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mVideoRawData:[B

    if-eqz v0, :cond_1

    .line 164
    move v1, v2

    goto :goto_0

    .line 163
    :cond_1
    nop

    .line 164
    :goto_0
    goto :goto_2

    .line 159
    :pswitch_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_2

    .line 160
    move v1, v2

    goto :goto_1

    .line 159
    :cond_2
    nop

    .line 160
    :goto_1
    goto :goto_2

    .line 170
    :pswitch_3
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    if-eqz v0, :cond_3

    .line 173
    move v1, v2

    goto :goto_2

    .line 170
    :cond_3
    nop

    .line 173
    :goto_2
    if-eqz v1, :cond_4

    .line 174
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

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 176
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

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 185
    :goto_3
    monitor-exit p0

    return v1

    .line 146
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public isNeedThumbnail()Z
    .locals 1

    .line 275
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail:Z

    return v0
.end method

.method public refillJpegData([B)V
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 115
    return-void
.end method

.method public setAlgoType(I)V
    .locals 0

    .line 300
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mAlgoType:I

    .line 301
    return-void
.end method

.method public setBurstNum(I)V
    .locals 0

    .line 304
    iput p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mBurstNum:I

    .line 305
    return-void
.end method

.method public setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;)V
    .locals 0

    .line 90
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mCaptureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    .line 91
    return-void
.end method

.method public setDeparted()V
    .locals 1

    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mDeparted:Z

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mJpegImageData:[B

    .line 198
    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitRawData:[B

    .line 199
    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mPortraitDepthData:[B

    .line 200
    return-void
.end method

.method public setNeedThumbnail(Z)V
    .locals 0

    .line 296
    iput-boolean p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->isNeedThumbnail:Z

    .line 297
    return-void
.end method

.method public setSavePath(Ljava/lang/String;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mSavePath:Ljava/lang/String;

    .line 289
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 292
    iput-wide p1, p0, Lcom/xiaomi/camera/core/ParallelTaskData;->mTimestamp:J

    .line 293
    return-void
.end method
