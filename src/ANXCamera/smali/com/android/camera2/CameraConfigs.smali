.class public Lcom/android/camera2/CameraConfigs;
.super Ljava/lang/Object;
.source "CameraConfigs.java"


# static fields
.field private static final MAX_JPEG_COMPRESSION_QUALITY:I = 0x64

.field private static final MIN_JPEG_COMPRESSION_QUALITY:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAELocked:Z

.field private mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

.field private mAWBLocked:Z

.field private mAiSceneDetectEnabled:Z

.field private mAiSceneDetectPeriod:I

.field private mAntiBanding:I

.field private mAwbCustomValue:I

.field private mAwbMode:I

.field private mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

.field private mBokehEnabled:Z

.field private mCameraAi30Enabled:Z

.field private mColorEffect:I

.field private mContrastLevel:I

.field private mDeviceOrientation:I

.field private mDualCamWaterMarkEnabled:Z

.field private mEISEnabled:Z

.field private mExposureCompensationIndex:I

.field private mExposureMeteringMode:I

.field private mExposureTime:J

.field private mEyeLightType:I

.field private mFNumber:Ljava/lang/String;

.field private mFaceAgeAnalyzeEnabled:Z

.field private mFaceDetectionEnabled:Z

.field private mFaceScoreEnabled:Z

.field private mFaceWaterMarkEnabled:Z

.field private mFaceWaterMarkFormat:Ljava/lang/String;

.field private mFlashMode:I

.field private mFocusDistance:F

.field private mFocusMode:I

.field private mFrontMirror:Z

.field private mGpsLocation:Landroid/location/Location;

.field private mHDRCheckerEnabled:Z

.field private mHDREnabled:Z

.field private mHHTEnabled:Z

.field private mIso:I

.field private mJpegQuality:I

.field private mJpegRotation:I

.field private mLensDirtyDetectEnabled:Z

.field private mMfnrEnabled:Z

.field private mNeedFlash:Z

.field private mNeedPausePreview:Z

.field private mNormalWideLDCEnabled:Z

.field private mOISEnabled:Z

.field private mOptimizedFlash:Z

.field private mPhotoFormat:I

.field private mPhotoMaxImages:I

.field private mPhotoSize:Lcom/android/camera/CameraSize;

.field private mPortraitLightingPattern:I

.field private mPreviewFormat:I

.field private mPreviewFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mPreviewMaxImages:I

.field private mPreviewSize:Lcom/android/camera/CameraSize;

.field private mRecordingHintEnabled:Z

.field private mSaturationLevel:I

.field private mSceneMode:I

.field private mSharpnessLevel:I

.field private mShotPath:Ljava/lang/String;

.field private mShotType:I

.field private mSubPhotoSize:Lcom/android/camera/CameraSize;

.field private mSuperResolutionEnabled:Z

.field private mSwMfnrEnabled:Z

.field private mThumbnailSize:Lcom/android/camera/CameraSize;

.field private mTimeWaterMarkEnabled:Z

.field private mTimeWatermarkValue:Ljava/lang/String;

.field private mUltraWideLDCEnabled:Z

.field private mVideoFpsRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoSize:Lcom/android/camera/CameraSize;

.field private mVideoSnapshotSize:Lcom/android/camera/CameraSize;

.field private mWaterMarkAppliedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomRatio:F

.field private mZslEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-class v0, Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/16 v0, 0x23

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 44
    const/16 v0, 0x100

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 45
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 46
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 49
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 84
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 87
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    .line 98
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    .line 99
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 100
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 101
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 102
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 109
    const-string v0, "-1"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 110
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 111
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 355
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 458
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAWBMode()I
    .locals 1

    .line 472
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    .line 824
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAntiBanding()I
    .locals 1

    .line 319
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    .line 484
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object v0
.end method

.method public getColorEffect()I
    .locals 1

    .line 735
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    return v0
.end method

.method public getContrastLevel()I
    .locals 1

    .line 771
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .line 291
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    .line 331
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    .line 808
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    .line 379
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getEyeLightType()I
    .locals 1

    .line 143
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    return v0
.end method

.method public getFNumber()Ljava/lang/String;
    .locals 1

    .line 968
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    .line 940
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 394
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    .line 446
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .line 433
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    .line 853
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    .line 367
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 267
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 279
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getNormalWideLDCEnabled()Z
    .locals 1

    .line 747
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    return v0
.end method

.method public getPhotoFormat()I
    .locals 1

    .line 227
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    return v0
.end method

.method public getPhotoMaxImages()I
    .locals 1

    .line 235
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPortraitLightingPattern()I
    .locals 1

    .line 694
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    return v0
.end method

.method public getPreviewFormat()I
    .locals 1

    .line 181
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    return v0
.end method

.method public getPreviewFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    .line 189
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    .line 783
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    .line 510
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    .line 795
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getShotPath()Ljava/lang/String;
    .locals 1

    .line 605
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    return-object v0
.end method

.method public getShotType()I
    .locals 1

    .line 593
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    return v0
.end method

.method public getSubPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 711
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    .line 932
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraWideLDCEnabled()Z
    .locals 1

    .line 759
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    return v0
.end method

.method public getVideoFpsRange()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getVideoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 857
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 865
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getWaterMarkAppliedList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 873
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 305
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    .line 343
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    .line 496
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    .line 812
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .line 669
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    return v0
.end method

.method public isCameraAi30Enabled()Z
    .locals 1

    .line 836
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    .line 524
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    .line 645
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    .line 723
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    .line 657
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    .line 960
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    .line 575
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    .line 562
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    .line 549
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    .line 681
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    .line 621
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    .line 418
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isNeedPausePreview()Z
    .locals 1

    .line 952
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    .line 251
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isOptimizedFlash()Z
    .locals 1

    .line 406
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    return v0
.end method

.method public isRecordingHintEnabled()Z
    .locals 1

    .line 536
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    .line 588
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isSwMfnrEnabled()Z
    .locals 1

    .line 633
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    .line 243
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1

    .line 335
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    .line 336
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    .line 337
    const/4 p1, 0x1

    return p1

    .line 339
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 348
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 349
    const/4 p1, 0x1

    return p1

    .line 351
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 450
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 452
    const/4 p1, 0x1

    return p1

    .line 454
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBLock(Z)Z
    .locals 1

    .line 488
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    .line 489
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    .line 490
    const/4 p1, 0x1

    return p1

    .line 492
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBMode(I)Z
    .locals 1

    .line 464
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    .line 465
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 466
    const/4 p1, 0x1

    return p1

    .line 468
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1

    .line 816
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 817
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    .line 818
    const/4 p1, 0x1

    return p1

    .line 820
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1

    .line 828
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    .line 829
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    .line 830
    const/4 p1, 0x1

    return p1

    .line 832
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAntiBanding(I)Z
    .locals 1

    .line 311
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    .line 312
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 313
    const/4 p1, 0x1

    return p1

    .line 315
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 128
    return-void
.end method

.method public setBokehEnabled(Z)Z
    .locals 1

    .line 637
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    if-eq v0, p1, :cond_0

    .line 638
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    .line 639
    const/4 p1, 0x1

    return p1

    .line 641
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCameraAi30Enable(Z)Z
    .locals 1

    .line 840
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    if-eq v0, p1, :cond_0

    .line 841
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    .line 842
    const/4 p1, 0x1

    return p1

    .line 844
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(I)Z
    .locals 1

    .line 727
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    if-eq v0, p1, :cond_0

    .line 728
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 729
    const/4 p1, 0x1

    return p1

    .line 731
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setContrastLevel(I)Z
    .locals 1

    .line 763
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    .line 764
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 765
    const/4 p1, 0x1

    return p1

    .line 767
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomAWB(I)Z
    .locals 1

    .line 476
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    .line 477
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    .line 478
    const/4 p1, 0x1

    return p1

    .line 480
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDeviceOrientation(I)Z
    .locals 1

    .line 283
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    .line 284
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 285
    const/4 p1, 0x1

    return p1

    .line 287
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 2

    .line 877
    const-string v0, "device"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 878
    if-eqz p1, :cond_0

    .line 879
    if-nez v0, :cond_1

    .line 880
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 882
    :cond_0
    if-eqz v0, :cond_1

    .line 883
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 886
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 887
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 888
    const/4 p1, 0x1

    return p1

    .line 890
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableEIS(Z)Z
    .locals 1

    .line 516
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    .line 517
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    .line 518
    const/4 p1, 0x1

    return p1

    .line 520
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableOIS(Z)V
    .locals 0

    .line 247
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    .line 248
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0

    .line 239
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    .line 240
    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1

    .line 323
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    .line 324
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    .line 325
    const/4 p1, 0x1

    return p1

    .line 327
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1

    .line 799
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    .line 800
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 801
    const/4 p1, 0x1

    return p1

    .line 803
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureTime(J)Z
    .locals 2

    .line 371
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 372
    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    .line 373
    const/4 p1, 0x1

    return p1

    .line 375
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEyeLight(I)Z
    .locals 1

    .line 135
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    if-eq v0, p1, :cond_0

    .line 136
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 137
    const/4 p1, 0x1

    return p1

    .line 139
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 0

    .line 964
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    .line 965
    return-void
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1

    .line 649
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 650
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    .line 651
    const/4 p1, 0x1

    return p1

    .line 653
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1

    .line 715
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 716
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    .line 717
    const/4 p1, 0x1

    return p1

    .line 719
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1

    .line 661
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    .line 662
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    .line 663
    const/4 p1, 0x1

    return p1

    .line 665
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 2

    .line 911
    const-string v0, "beautify"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 912
    if-eqz p1, :cond_0

    .line 913
    if-nez v0, :cond_1

    .line 914
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 916
    :cond_0
    if-eqz v0, :cond_1

    .line 917
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 920
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 921
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 922
    const/4 p1, 0x1

    return p1

    .line 924
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0

    .line 936
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 937
    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1

    .line 385
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    .line 386
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 387
    const/4 p1, 0x1

    return p1

    .line 389
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusDistance(F)Z
    .locals 1

    .line 437
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 438
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 439
    const/4 p1, 0x1

    return p1

    .line 442
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusMode(I)Z
    .locals 1

    .line 424
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    .line 425
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 426
    const/4 p1, 0x1

    return p1

    .line 428
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFrontMirror(Z)V
    .locals 0

    .line 956
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    .line 957
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0

    .line 849
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    .line 850
    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1

    .line 566
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    .line 567
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    .line 568
    const/4 p1, 0x1

    return p1

    .line 571
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHDREnabled(Z)Z
    .locals 1

    .line 553
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    .line 554
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    .line 555
    const/4 p1, 0x1

    return p1

    .line 558
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHHTEnabled(Z)Z
    .locals 1

    .line 540
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    .line 541
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    .line 542
    const/4 p1, 0x1

    return p1

    .line 545
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setISO(I)Z
    .locals 1

    .line 359
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    .line 360
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    .line 361
    const/4 p1, 0x1

    return p1

    .line 363
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setJpegQuality(I)Z
    .locals 4

    .line 255
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_2

    const/16 v2, 0x64

    if-le p1, v2, :cond_0

    goto :goto_0

    .line 259
    :cond_0
    iget v2, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v2, p1, :cond_1

    .line 260
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 261
    return v1

    .line 263
    :cond_1
    return v0

    .line 256
    :cond_2
    :goto_0
    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setJpegQuality: invalid jpeg quality "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    return v0
.end method

.method public setJpegRotation(I)Z
    .locals 1

    .line 271
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    .line 272
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 273
    const/4 p1, 0x1

    return p1

    .line 275
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1

    .line 673
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 674
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    .line 675
    const/4 p1, 0x1

    return p1

    .line 677
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1

    .line 613
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 614
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    .line 615
    const/4 p1, 0x1

    return p1

    .line 617
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNeedFlash(Z)Z
    .locals 1

    .line 410
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    .line 411
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    .line 412
    const/4 p1, 0x1

    return p1

    .line 414
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNormalWideLDCEnabled(Z)Z
    .locals 1

    .line 739
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 740
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    .line 741
    const/4 p1, 0x1

    return p1

    .line 743
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1

    .line 398
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    .line 399
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    .line 400
    const/4 p1, 0x1

    return p1

    .line 402
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPausePreview(Z)Z
    .locals 1

    .line 944
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    .line 945
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 946
    const/4 p1, 0x1

    return p1

    .line 948
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoFormat(I)Z
    .locals 1

    .line 219
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    if-eq v0, p1, :cond_0

    .line 220
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 221
    const/4 p1, 0x1

    return p1

    .line 223
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoMaxImages(I)V
    .locals 0

    .line 231
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 232
    return-void
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    .line 197
    const/4 p1, 0x1

    return p1

    .line 199
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPortraitLightingPattern(I)Z
    .locals 1

    .line 686
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    if-eq v0, p1, :cond_0

    .line 687
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    .line 688
    const/4 p1, 0x1

    return p1

    .line 690
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFormat(I)Z
    .locals 1

    .line 173
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    if-eq v0, p1, :cond_0

    .line 174
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 175
    const/4 p1, 0x1

    return p1

    .line 177
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    .line 151
    const/4 p1, 0x1

    return p1

    .line 153
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewMaxImages(I)V
    .locals 0

    .line 185
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 186
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 162
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 163
    const/4 p1, 0x1

    return p1

    .line 165
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setRecordingHintEnabled(Z)Z
    .locals 1

    .line 528
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    if-eq v0, p1, :cond_0

    .line 529
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    .line 530
    const/4 p1, 0x1

    return p1

    .line 532
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSaturationLevel(I)Z
    .locals 1

    .line 775
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    .line 776
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 777
    const/4 p1, 0x1

    return p1

    .line 779
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSceneMode(I)Z
    .locals 1

    .line 502
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    .line 503
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    .line 504
    const/4 p1, 0x1

    return p1

    .line 506
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSharpnessLevel(I)Z
    .locals 1

    .line 787
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    .line 788
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 789
    const/4 p1, 0x1

    return p1

    .line 791
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setShotPath(Ljava/lang/String;)V
    .locals 0

    .line 609
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    .line 610
    return-void
.end method

.method public setShotType(I)Z
    .locals 1

    .line 597
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    if-eq v0, p1, :cond_0

    .line 598
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 599
    const/4 p1, 0x1

    return p1

    .line 601
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSubPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 208
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    .line 209
    const/4 p1, 0x1

    return p1

    .line 211
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1

    .line 579
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 580
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    .line 581
    const/4 p1, 0x1

    return p1

    .line 584
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSwMfnrEnabled(Z)Z
    .locals 1

    .line 625
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 626
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    .line 627
    const/4 p1, 0x1

    return p1

    .line 629
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 698
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 699
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    .line 700
    const/4 p1, 0x1

    return p1

    .line 702
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 2

    .line 894
    const-string v0, "watermark"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 895
    if-eqz p1, :cond_0

    .line 896
    if-nez v0, :cond_1

    .line 897
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 899
    :cond_0
    if-eqz v0, :cond_1

    .line 900
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 903
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 904
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 905
    const/4 p1, 0x1

    return p1

    .line 907
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0

    .line 928
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 929
    return-void
.end method

.method public setUltraWideLDCEnabled(Z)Z
    .locals 1

    .line 751
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 752
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    .line 753
    const/4 p1, 0x1

    return p1

    .line 755
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoFpsRange(Landroid/util/Range;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    .line 117
    const/4 p1, 0x1

    return p1

    .line 119
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 861
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 862
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 869
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    .line 870
    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4

    .line 297
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 298
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 299
    const/4 p1, 0x1

    return p1

    .line 301
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
