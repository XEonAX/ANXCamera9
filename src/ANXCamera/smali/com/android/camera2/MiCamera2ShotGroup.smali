.class public Lcom/android/camera2/MiCamera2ShotGroup;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotGroup.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "[B>;"
    }
.end annotation


# instance fields
.field private mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mGroupShot:Lcom/android/camera/groupshot/GroupShot;

.field private mGroupShotFolderName:Ljava/lang/String;

.field private mReceivedJpegCallbackNum:I

.field private mTotalJpegCallbackNum:I


# direct methods
.method public constructor <init>(Lcom/android/camera2/MiCamera2;ILcom/android/camera/groupshot/GroupShot;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 45
    iput p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    .line 46
    iput-object p3, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotGroup;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera2/MiCamera2ShotGroup;Lcom/xiaomi/camera/core/ParallelTaskData;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    .line 32
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p1
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 82
    new-instance v0, Lcom/android/camera2/MiCamera2ShotGroup$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotGroup$1;-><init>(Lcom/android/camera2/MiCamera2ShotGroup;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 116
    nop

    .line 118
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 119
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 122
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    .line 123
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 125
    sget-object v2, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "captureStillPicture: size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 125
    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->isInQcfaMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 131
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 134
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 135
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 134
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 137
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 139
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    .line 140
    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 32
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotGroup;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 20

    move-object/from16 v0, p0

    .line 161
    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    .line 162
    if-eqz v2, :cond_6

    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v3, :cond_0

    goto/16 :goto_2

    .line 166
    :cond_0
    iget v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    .line 168
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 169
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/ParallelTaskData;->getSuffix()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    .line 172
    :cond_1
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v3, v1}, Lcom/android/camera/groupshot/GroupShot;->attach([B)I

    move-result v3

    .line 175
    sget-boolean v5, Lcom/android/camera/Util;->sIsDumpOrigJpg:Z

    if-eqz v5, :cond_2

    .line 176
    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget-object v6, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    invoke-static {v1, v5, v6}, Lcom/android/camera/storage/Storage;->saveOriginalPic([BILjava/lang/String;)V

    .line 178
    :cond_2
    sget-object v5, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v7, "mGroupShot attach() = 0x%08x index=%d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    .line 179
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v9, 0x0

    aput-object v3, v8, v9

    iget v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v8, v4

    .line 178
    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    iget v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge v3, v5, :cond_3

    .line 182
    iget v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    if-ne v3, v4, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v3

    const-string v5, "pref_groupshot_with_primitive_picture_key"

    invoke-virtual {v3, v5, v9}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 187
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v9}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedCreateThumbnail(Z)V

    .line 188
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v1, v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    .line 189
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-interface {v2, v0}, Lcom/xiaomi/camera/core/ParallelCallback;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    goto :goto_1

    .line 192
    :cond_3
    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureWidth()I

    move-result v2

    .line 193
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->getPictureHeight()I

    move-result v3

    .line 194
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v17

    .line 195
    iget-object v1, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->getJpegRotation()I

    move-result v1

    .line 199
    add-int v1, v1, v17

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_4

    .line 200
    nop

    .line 201
    nop

    .line 207
    move v15, v2

    move/from16 v16, v3

    goto :goto_0

    .line 203
    :cond_4
    nop

    .line 204
    nop

    .line 207
    move/from16 v16, v2

    move v15, v3

    :goto_0
    new-instance v1, Lcom/android/camera/module/SaveOutputImageTask;

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 209
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/android/camera/storage/SaverCallback;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 210
    invoke-virtual {v2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getLocation()Landroid/location/Location;

    move-result-object v14

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    move-object v10, v1

    move-object/from16 v18, v2

    move-object/from16 v19, v3

    invoke-direct/range {v10 .. v19}, Lcom/android/camera/module/SaveOutputImageTask;-><init>(Lcom/android/camera/storage/SaverCallback;JLandroid/location/Location;IIILjava/lang/String;Lcom/android/camera/groupshot/GroupShot;)V

    .line 212
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v3, v9, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/module/SaveOutputImageTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 214
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 215
    if-eqz v0, :cond_5

    .line 216
    invoke-interface {v0, v4}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 221
    :cond_5
    :goto_1
    return-void

    .line 163
    :cond_6
    :goto_2
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 2

    .line 145
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez p2, :cond_0

    .line 146
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/MiCamera2ShotGroup;->generateParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 148
    :cond_0
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p2

    .line 149
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 151
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2ShotGroup;->notifyResultData([B)V

    .line 152
    iget p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge p1, p2, :cond_1

    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mDeparted:Z

    if-nez p1, :cond_1

    .line 153
    sget-object p1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onPictureTaken: GroupShot mReceivedJpegCallbackNum = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->startShot()V

    .line 157
    :cond_1
    return-void
.end method

.method protected prepare()V
    .locals 0

    .line 59
    return-void
.end method

.method protected startShot()V
    .locals 4

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 65
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 67
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    .line 68
    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v2

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture a still picture, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 70
    :catch_1
    move-exception v0

    .line 71
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 72
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Cannot capture a still picture"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 77
    :goto_0
    nop

    .line 78
    :goto_1
    return-void
.end method
