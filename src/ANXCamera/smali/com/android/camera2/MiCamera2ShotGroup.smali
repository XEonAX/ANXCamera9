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

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 37
    sget-object v0, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/camera2/MiCamera2ShotGroup;)I
    .locals 0

    .line 37
    iget p0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera2/MiCamera2ShotGroup;)I
    .locals 0

    .line 37
    iget p0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    return p0
.end method

.method private getGroupShotMaxImage()I
    .locals 3

    .line 106
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->STATISTICS_FACES:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/hardware/camera2/params/Face;

    .line 107
    if-eqz v0, :cond_0

    array-length v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 108
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
    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    const/4 v1, 0x0

    .line 92
    :cond_2
    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPictureSize()Lcom/android/camera/CameraSize;

    move-result-object v2

    .line 93
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v3}, Lcom/android/camera2/MiCamera2;->getPreviewSize()Lcom/android/camera/CameraSize;

    move-result-object v3

    .line 94
    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_3

    invoke-static {}, Lcom/mi/config/b;->hI()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 95
    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/16 v6, 0xa

    .line 96
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v7

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v8

    .line 97
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v9

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v10

    .line 95
    move/from16 v5, p1

    invoke-virtual/range {v4 .. v10}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    goto :goto_0

    .line 99
    :cond_3
    iget-object v11, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/16 v13, 0xa

    .line 100
    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v14

    invoke-virtual {v2}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v15

    .line 101
    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getWidth()I

    move-result v16

    invoke-virtual {v3}, Lcom/android/camera/CameraSize;->getHeight()I

    move-result v17

    .line 99
    move/from16 v12, p1

    invoke-virtual/range {v11 .. v17}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    .line 103
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

    .line 140
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

    .line 174
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 175
    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 177
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    .line 178
    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 180
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

    .line 181
    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 180
    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->isInQcfaMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 186
    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 189
    :cond_1
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 190
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 189
    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 192
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    .line 194
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

    .line 216
    move-object/from16 v1, p1

    iget v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    .line 218
    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    .line 219
    if-nez v2, :cond_0

    .line 220
    return-void

    .line 223
    :cond_0
    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v4

    .line 225
    iget-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    if-nez v5, :cond_1

    .line 226
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

    .line 229
    :cond_1
    iget-object v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v5, v1}, Lcom/android/camera/groupshot/GroupShot;->attach([B)I

    move-result v5

    .line 232
    sget-boolean v6, Lcom/android/camera/Util;->sIsDumpOrigJpg:Z

    if-eqz v6, :cond_2

    .line 233
    iget v6, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget-object v7, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    invoke-static {v1, v6, v7}, Lcom/android/camera/storage/Storage;->saveOriginalPic([BILjava/lang/String;)V

    .line 235
    :cond_2
    sget-object v6, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v8, "groupShot attach() = 0x%08x index=%d"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    .line 236
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v10, 0x0

    aput-object v5, v9, v10

    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v9, v3

    .line 235
    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iget v5, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget v6, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge v5, v6, :cond_3

    .line 239
    iget v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    if-ne v4, v3, :cond_5

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSaveGroushotPrimitiveOn()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 242
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v10}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    .line 243
    iget-object v3, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3, v1, v10}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    .line 244
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-interface {v2, v0}, Lcom/xiaomi/camera/core/ParallelCallback;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    goto :goto_1

    .line 247
    :cond_3
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 248
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getPictureSize()Landroid/util/Size;

    move-result-object v5

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v5

    .line 249
    invoke-static/range {p1 .. p1}, Lcom/android/camera/Exif;->getOrientation([B)I

    move-result v18

    .line 250
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegRotation()I

    move-result v1

    .line 254
    add-int v1, v1, v18

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_4

    .line 255
    nop

    .line 256
    nop

    .line 262
    move/from16 v16, v2

    move/from16 v17, v5

    goto :goto_0

    .line 258
    :cond_4
    nop

    .line 259
    nop

    .line 262
    move/from16 v17, v2

    move/from16 v16, v5

    :goto_0
    new-instance v1, Lcom/android/camera/module/SaveOutputImageTask;

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    .line 264
    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/android/camera/storage/SaverCallback;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .line 265
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getLocation()Landroid/location/Location;

    move-result-object v15

    iget-object v2, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShotFolderName:Ljava/lang/String;

    iget-object v4, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    move-object v11, v1

    move-object/from16 v19, v2

    move-object/from16 v20, v4

    invoke-direct/range {v11 .. v20}, Lcom/android/camera/module/SaveOutputImageTask;-><init>(Lcom/android/camera/storage/SaverCallback;JLandroid/location/Location;IIILjava/lang/String;Lcom/android/camera/groupshot/GroupShot;)V

    .line 267
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v10, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v4}, Lcom/android/camera/module/SaveOutputImageTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 269
    iget-object v0, v0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    .line 270
    if-eqz v0, :cond_5

    .line 271
    invoke-interface {v0, v3}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    .line 275
    :cond_5
    :goto_1
    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 6

    .line 199
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

    .line 200
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    .line 201
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long p2, v4, v2

    if-nez p2, :cond_0

    .line 202
    sget-object p2, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "onImageReceived: image arrived first"

    invoke-static {p2, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p2, v0, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->setTimestamp(J)V

    .line 205
    :cond_0
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p2

    .line 206
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 207
    invoke-virtual {p0, p2}, Lcom/android/camera2/MiCamera2ShotGroup;->notifyResultData([B)V

    .line 208
    iget p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mReceivedJpegCallbackNum:I

    iget p2, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mTotalJpegCallbackNum:I

    if-ge p1, p2, :cond_1

    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mDeparted:Z

    if-nez p1, :cond_1

    .line 210
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->startSessionCapture()V

    .line 212
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

    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v0, :cond_0

    .line 115
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/MiCamera2ShotGroup;->generateParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    .line 116
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v0, :cond_0

    .line 117
    sget-object v0, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v1, "startSessionCapture: null task data"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    return-void

    .line 122
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    .line 123
    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotGroup;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    .line 125
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    .line 126
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

    .line 132
    :catch_0
    move-exception v0

    .line 133
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture a still picture, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 134
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    .line 128
    :catch_1
    move-exception v0

    .line 129
    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    .line 130
    sget-object v1, Lcom/android/camera2/MiCamera2ShotGroup;->TAG:Ljava/lang/String;

    const-string v2, "Cannot capture a still picture"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotGroup;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    .line 135
    :goto_0
    nop

    .line 136
    :goto_1
    return-void
.end method
