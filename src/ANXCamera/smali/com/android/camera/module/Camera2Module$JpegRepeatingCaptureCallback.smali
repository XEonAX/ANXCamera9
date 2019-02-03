.class final Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;
.super Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;
.source "Camera2Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Camera2Module;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "JpegRepeatingCaptureCallback"
.end annotation


# instance fields
.field mBurstShotTitle:Ljava/lang/String;

.field private mDropped:Z

.field mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

.field mPressDownTitle:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/camera/module/Camera2Module;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Camera2Module;)V
    .locals 0

    .line 1270
    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-direct {p0}, Lcom/android/camera2/Camera2Proxy$PictureCallbackWrapper;-><init>()V

    .line 1274
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Camera2Module;Lcom/android/camera/module/Camera2Module$1;)V
    .locals 0

    .line 1270
    invoke-direct {p0, p1}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;-><init>(Lcom/android/camera/module/Camera2Module;)V

    return-void
.end method

.method private getBurstShotTitle()Ljava/lang/String;
    .locals 6

    .line 1277
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$600(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 1278
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mPressDownTitle:Ljava/lang/String;

    .line 1279
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    .line 1281
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 1282
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1283
    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    .line 1284
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v4, 0x13

    if-eq v0, v4, :cond_1

    .line 1285
    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    .line 1288
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mBurstShotTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v2, v2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1289
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_UBIFOCUS_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1290
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_BURST"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1288
    return-object v0
.end method

.method private tryCheckNeedStop()Z
    .locals 11

    .line 1406
    invoke-static {}, Lcom/android/camera/storage/Storage;->isLowStorageAtLastPoint()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 1407
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1408
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v3}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v3

    invoke-virtual {v0, v3, v2}, Lcom/android/camera/module/Camera2Module;->trackGeneralInfo(IZ)V

    .line 1409
    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v5

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1410
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    move v7, v2

    goto :goto_0

    :cond_0
    move v7, v1

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2900(Lcom/android/camera/module/Camera2Module;)Z

    move-result v9

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$3000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v10

    .line 1409
    invoke-virtual/range {v4 .. v10}, Lcom/android/camera/module/Camera2Module;->trackPictureTaken(IZZLjava/lang/String;ZZ)V

    .line 1411
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    .line 1413
    :cond_1
    return v2

    .line 1415
    :cond_2
    return v1
.end method


# virtual methods
.method public onCaptureStart(Lcom/xiaomi/camera/core/ParallelTaskData;Lcom/android/camera/CameraSize;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 7

    .line 1299
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$800(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-boolean v0, v0, Lcom/android/camera/module/Camera2Module;->mPaused:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1300
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    iget-object v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v2}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)I

    move-result v2

    if-ge v0, v2, :cond_12

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1000(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_9

    .line 1303
    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1305
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1200(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1306
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1300(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/module/loader/camera2/FocusManager2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/FocusManager2;->onShutter()V

    .line 1309
    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {v0}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1310
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {v0}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mPressDownTitle:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/android/camera/storage/ImageSaver;->updateImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    :cond_2
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->tryCheckNeedStop()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1316
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1400()Ljava/lang/String;

    move-result-object p1

    const-string p2, "onMultiSnapCaptureStart: need stop multi capture, return null"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    return-object v1

    .line 1320
    :cond_3
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    const/4 v3, 0x0

    if-nez v0, :cond_a

    .line 1321
    nop

    .line 1322
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1323
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v4, 0xa6

    .line 1324
    invoke-virtual {v0, v4}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    .line 1325
    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->getFaceWaterMarkInfos()Ljava/util/List;

    move-result-object v0

    .line 1326
    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 1327
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 1332
    :cond_4
    move-object v4, v1

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    if-nez v0, :cond_5

    .line 1333
    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v0

    goto :goto_1

    .line 1335
    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v0, v0, Lcom/android/camera/module/Camera2Module;->mOutPutSize:Lcom/android/camera/CameraSize;

    invoke-virtual {v0}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v0

    .line 1338
    :goto_1
    new-instance v5, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    iget-object v6, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object v6, v6, Lcom/android/camera/module/Camera2Module;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 1339
    invoke-virtual {v6}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object v6

    invoke-virtual {p2}, Lcom/android/camera/CameraSize;->toSizeObject()Landroid/util/Size;

    move-result-object p2

    invoke-direct {v5, v6, p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;-><init>(Landroid/util/Size;Landroid/util/Size;Landroid/util/Size;)V

    .line 1340
    nop

    .line 1341
    invoke-static {}, Lcom/android/camera/CameraSettings;->isDualCameraWaterMarkOpen()Z

    move-result p2

    invoke-virtual {v5, p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setHasDualWaterMark(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1342
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2500(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setMirror(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1343
    invoke-static {}, Lcom/android/camera/CameraSettings;->getPortraitLightingPattern()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLightingPattern(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1344
    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/android/camera/effect/EffectController;->getEffectForSaving(Z)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFilterId(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1345
    const/4 v0, -0x1

    iget-object v5, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v5, v5, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    if-ne v0, v5, :cond_6

    move v0, v3

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget v0, v0, Lcom/android/camera/module/Camera2Module;->mOrientation:I

    :goto_2
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1346
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2400(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegRotation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1347
    invoke-static {}, Lcom/android/camera/CameraSettings;->isGradienterOn()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2300(Lcom/android/camera/module/Camera2Module;)F

    move-result v0

    const/high16 v5, -0x40800000    # -1.0f

    cmpl-float v0, v0, v5

    if-nez v0, :cond_7

    const/4 v0, 0x0

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2300(Lcom/android/camera/module/Camera2Module;)F

    move-result v0

    :goto_3
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootRotation(F)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1348
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2200(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setShootOrientation(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1349
    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_8

    new-instance v0, Landroid/location/Location;

    iget-object v5, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v5}, Lcom/android/camera/module/Camera2Module;->access$2100(Lcom/android/camera/module/Camera2Module;)Landroid/location/Location;

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    goto :goto_4

    :cond_8
    move-object v0, v1

    :goto_4
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setLocation(Landroid/location/Location;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1350
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTimeWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/android/camera/Util;->getTimeWatermark()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_9
    move-object v0, v1

    :goto_5
    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTimeWaterMarkString(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1351
    invoke-virtual {p2, v4}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFaceWaterMarkList(Ljava/util/List;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1352
    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderAndMagicMirrorWaterOpen()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAgeGenderAndMagicMirrorWater(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1353
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isFrontCamera()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1354
    invoke-virtual {v0}, Lcom/android/camera/module/Camera2Module;->isBokehFrontCamera()Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setBokehFrontCamera(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1355
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$2000(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setAlgorithmName(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1356
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1900(Lcom/android/camera/module/Camera2Module;)Lcom/xiaomi/camera/core/PictureInfo;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setPictureInfo(Lcom/xiaomi/camera/core/PictureInfo;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1357
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1800(Lcom/android/camera/module/Camera2Module;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSuffix(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1358
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1700(Lcom/android/camera/module/Camera2Module;)Z

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setGradienterOn(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1359
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1600()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setTiltShiftMode(Ljava/lang/String;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1360
    invoke-virtual {p2, v3}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setSaveGroupshotPrimitive(Z)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1361
    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$1500(Lcom/android/camera/module/Camera2Module;)Lcom/android/camera/effect/renders/DualWatermarkParam;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setDualWatermarkParam(Lcom/android/camera/effect/renders/DualWatermarkParam;)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1362
    invoke-static {v2}, Lcom/android/camera/module/BaseModule;->getJpegQuality(Z)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->setJpegQuality(I)Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;

    move-result-object p2

    .line 1363
    invoke-virtual {p2}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter$Builder;->build()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    .line 1365
    :cond_a
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mParallelParameter:Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillParameter(Lcom/xiaomi/camera/core/ParallelTaskDataParameter;)V

    .line 1367
    nop

    .line 1368
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p2}, Lcom/android/camera/Camera;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/storage/ImageSaver;->isSaveQueueFull()Z

    move-result p2

    if-nez p2, :cond_e

    .line 1369
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$704(Lcom/android/camera/module/Camera2Module;)I

    .line 1370
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result p2

    if-nez p2, :cond_b

    .line 1371
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    const/4 v0, 0x4

    invoke-virtual {p2, v0}, Lcom/android/camera/module/Camera2Module;->playCameraSound(I)V

    .line 1373
    :cond_b
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1400()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCaptureStart: mReceivedJpegCallbackNum = "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v4}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1374
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 1376
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p2, p2, Lcom/android/camera/module/Camera2Module;->mMutexModePicker:Lcom/android/camera/MutexModeManager;

    invoke-virtual {p2}, Lcom/android/camera/MutexModeManager;->isUbiFocus()Z

    move-result p2

    if-nez p2, :cond_f

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    if-gt p2, v0, :cond_f

    .line 1378
    invoke-direct {p0}, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->getBurstShotTitle()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/android/camera/storage/Storage;->generateFilepath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1379
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCaptureStart: savePath = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1380
    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->setSavePath(Ljava/lang/String;)V

    .line 1383
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    if-eq p2, v0, :cond_d

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    .line 1384
    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result p2

    if-nez p2, :cond_d

    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    if-eqz p2, :cond_c

    goto :goto_6

    .line 1385
    :cond_c
    move v2, v3

    goto :goto_7

    .line 1384
    :cond_d
    :goto_6
    nop

    .line 1385
    :goto_7
    invoke-virtual {p1, v2}, Lcom/xiaomi/camera/core/ParallelTaskData;->setNeedThumbnail(Z)V

    .line 1386
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2, p1, v3}, Lcom/android/camera/module/Camera2Module;->access$2600(Lcom/android/camera/module/Camera2Module;Lcom/xiaomi/camera/core/ParallelTaskData;Z)V

    .line 1387
    nop

    .line 1388
    iput-boolean v3, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    .line 1389
    goto :goto_8

    .line 1391
    :cond_e
    invoke-static {}, Lcom/android/camera/module/Camera2Module;->access$1400()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureStart queue full and drop "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1392
    iput-boolean v2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    .line 1394
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    if-lt p1, p2, :cond_f

    .line 1395
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    iget-object p1, p1, Lcom/android/camera/module/Camera2Module;->mActivity:Lcom/android/camera/Camera;

    invoke-virtual {p1}, Lcom/android/camera/Camera;->getThumbnailUpdater()Lcom/android/camera/ThumbnailUpdater;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ThumbnailUpdater;->getLastThumbnailUncached()V

    .line 1399
    :cond_f
    move-object p1, v1

    :goto_8
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$700(Lcom/android/camera/module/Camera2Module;)I

    move-result p2

    iget-object v0, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {v0}, Lcom/android/camera/module/Camera2Module;->access$900(Lcom/android/camera/module/Camera2Module;)I

    move-result v0

    if-ge p2, v0, :cond_10

    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$1100(Lcom/android/camera/module/Camera2Module;)Z

    move-result p2

    if-nez p2, :cond_10

    iget-boolean p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->mDropped:Z

    if-eqz p2, :cond_11

    .line 1400
    :cond_10
    iget-object p2, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p2}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    .line 1402
    :cond_11
    return-object p1

    .line 1301
    :cond_12
    :goto_9
    return-object v1
.end method

.method public onPictureTakenFinished(Z)V
    .locals 0

    .line 1420
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$2700(Lcom/android/camera/module/Camera2Module;)V

    .line 1421
    iget-object p1, p0, Lcom/android/camera/module/Camera2Module$JpegRepeatingCaptureCallback;->this$0:Lcom/android/camera/module/Camera2Module;

    invoke-static {p1}, Lcom/android/camera/module/Camera2Module;->access$000(Lcom/android/camera/module/Camera2Module;)Lio/reactivex/ObservableEmitter;

    move-result-object p1

    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V

    .line 1422
    return-void
.end method
