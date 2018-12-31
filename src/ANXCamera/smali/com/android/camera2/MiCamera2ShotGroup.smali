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


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final MAX_GROUP_FACE_NUM:I

.field private mCaptureResult:Landroid/hardware/camera2/CaptureResult;

.field private mContext:Landroid/content/Context;

.field private mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mGroupShot:Lcom/android/camera/groupshot/GroupShot;

.field private mGroupShotFolderName:Ljava/lang/String;

.field private mReceivedJpegCallbackNum:I

.field private mTotalJpegCallbackNum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    const-class v0, Lcom/android/camera2/MiCamera2ShotGroup;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera2/MiCamera2;ILandroid/content/Context;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    .line 40
    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->MAX_GROUP_FACE_NUM:I

    .line 57
    iput p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    .line 58
    iput-object p3, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mContext:Landroid/content/Context;

    .line 59
    iput-object p4, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotGroup;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p0
.end method

.method static synthetic access$002(Lcom/android/camera2/MiCamera2ShotGroup;Lcom/xiaomi/camera/core/ParallelTaskData;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    .line 37
    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p1
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 37
    sget-object v0, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private getGroupShotMaxImage()I
    .locals 3

    .line 105
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/hardware/camera2/params/Face;

    .line 106
    if-eqz v0, :cond_0

    array-length v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 107
    :goto_0
    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x4

    invoke-static {v0, v1, v2}, Lcom/android/camera/Util;->clamp(III)I

    move-result v0

    return v0
.end method

.method private getGroupShotNum()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/camera/Util;->isMemoryRich(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->getGroupShotMaxImage()I

    move-result v0

    return v0

    .line 81
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private initGroupShot(I)V
    .locals 18

    move-object/from16 v0, p0

    .line 86
    iget-object v1, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v1}, Lcom/android/camera/groupshot/GroupShot;->isUsed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 87
    :cond_0
    new-instance v1, Lcom/android/camera/groupshot/GroupShot;

    invoke-direct {v1}, Lcom/android/camera/groupshot/GroupShot;-><init>()V

    iput-object v1, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    .line 90
    :cond_1
    iget-object v1, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->getDeviceOrientation()I

    move-result v1

    .line 91
    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    .line 92
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 93
    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_2

    invoke-static {}, Lcom/mi/config/b;->hk()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 94
    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/16 v6, 0xa

    .line 95
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v7

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v8

    .line 96
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v9

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v10

    .line 94
    move/from16 v5, p1

    invoke-virtual/range {v4 .. v10}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    goto :goto_0

    .line 98
    :cond_2
    iget-object v11, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/16 v13, 0xa

    .line 99
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v14

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v15

    .line 100
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v16

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v17

    .line 98
    move/from16 v12, p1

    invoke-virtual/range {v11 .. v17}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    .line 102
    :goto_0
    return-void
.end method

.method private prepareGroupShot()V
    .locals 2

    .line 68
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->getGroupShotNum()I

    move-result v0

    iput v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    .line 69
    iget v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    invoke-direct {p0, v0}, Lcom/android/camera2/MiCamera2ShotGroup;->initGroupShot(I)V

    .line 70
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0, v1}, Lcom/android/camera/groupshot/GroupShot;->attach_start(I)I

    goto :goto_0

    .line 73
    :cond_0
    iput v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    .line 75
    :goto_0
    return-void
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    .line 131
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

    .line 165
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 166
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 168
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    .line 169
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 171
    sget-object v2, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 171
    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->isInQcfaMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 176
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 177
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 180
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 181
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 180
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 183
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 185
    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    .line 37
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotGroup;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 21

    move-object/from16 v0, p0

    .line 205
    move-object/from16 v1, p1

    iget v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    .line 207
    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    .line 208
    if-nez v2, :cond_0

    .line 209
    return-void

    .line 212
    :cond_0
    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v4

    .line 214
    iget-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    if-nez v5, :cond_1

    .line 215
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getSuffix()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    .line 218
    :cond_1
    iget-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5, v1}, Lcom/android/camera/groupshot/GroupShot;->attach([B)I

    move-result v5

    .line 221
    sget-boolean v6, Lcom/android/camera/Util;->sIsDumpOrigJpg:Z

    if-eqz v6, :cond_2

    .line 222
    iget v6, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget-object v7, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    invoke-static {v1, v6, v7}, Lcom/android/camera/storage/Storage;->saveOriginalPic([BILjava/lang/String;)V

    .line 224
    :cond_2
    sget-object v6, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v8, "groupShot attach() = 0x%08x index=%d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    .line 225
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v10, 0x0

    aput-object v5, v9, v10

    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v3

    .line 224
    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget v6, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge v5, v6, :cond_3

    .line 228
    iget v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    if-ne v4, v3, :cond_5

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSaveGroushotPrimitiveOn()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 231
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v10}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    .line 232
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v1, v10}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    .line 233
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-interface {v2, v0}, Lcom/xiaomi/camera/core/ParallelCallback;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    goto :goto_1

    .line 236
    :cond_3
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 237
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v5

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v5

    .line 238
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v18

    .line 239
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v1

    .line 243
    add-int v1, v1, v18

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_4

    .line 244
    nop

    .line 245
    nop

    .line 251
    move/from16 v16, v2

    move/from16 v17, v5

    goto :goto_0

    .line 247
    :cond_4
    nop

    .line 248
    nop

    .line 251
    move/from16 v17, v2

    move/from16 v16, v5

    :goto_0
    new-instance v1, Lcom/android/camera/module/SaveOutputImageTask;

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 253
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/android/camera/storage/SaverCallback;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .line 254
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v15

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    move-object v11, v1

    move-object/from16 v19, v2

    move-object/from16 v20, v4

    invoke-direct/range {v11 .. v20}, Lcom/android/camera/module/SaveOutputImageTask;-><init>(Lcom/android/camera/storage/SaverCallback;JLandroid/location/Location;IIILjava/lang/String;Lcom/android/camera/groupshot/GroupShot;)V

    .line 256
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v10, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v4}, Lcom/android/camera/module/SaveOutputImageTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 258
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 259
    if-eqz v0, :cond_5

    .line 260
    invoke-interface {v0, v3}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 264
    :cond_5
    :goto_1
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 2

    .line 190
    sget-object p2, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onImageReceived: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez p2, :cond_0

    .line 192
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/MiCamera2ShotGroup;->generateParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 194
    :cond_0
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p2

    .line 195
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 196
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2ShotGroup;->notifyResultData([B)V

    .line 197
    iget p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge p1, p2, :cond_1

    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mDeparted:Z

    if-nez p1, :cond_1

    .line 199
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->startSessionCapture()V

    .line 201
    :cond_1
    return-void
.end method

.method protected prepare()V
    .locals 0

    .line 64
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->prepareGroupShot()V

    .line 65
    return-void
.end method

.method protected startSessionCapture()V
    .locals 4

    .line 113
    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 114
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 116
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    .line 117
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

    .line 123
    :catch_0
    move-exception v0

    .line 124
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture a still picture, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 125
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 119
    :catch_1
    move-exception v0

    .line 120
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 121
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Cannot capture a still picture"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 126
    :goto_0
    nop

    .line 127
    :goto_1
    return-void
.end method
