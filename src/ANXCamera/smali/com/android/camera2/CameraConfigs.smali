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

.field private mASDScene:I

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

.field private mIsQcfaEnabled:Z

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

    .line 34
    const-class v0, Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 48
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 49
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 50
    const/16 v1, 0x23

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 51
    const/16 v1, 0x100

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 52
    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 53
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 56
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 58
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 62
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 70
    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 73
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 77
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 78
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 79
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 80
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 83
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 95
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 98
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    .line 109
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    .line 110
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 111
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 112
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 113
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 115
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    .line 121
    const-string v0, "-1"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 122
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 123
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 125
    const/4 v0, -0x2

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return-void
.end method


# virtual methods
.method public getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 471
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getASDScene()I
    .locals 1

    .line 1001
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return v0
.end method

.method public getAWBMode()I
    .locals 1

    .line 485
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    .line 837
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAntiBanding()I
    .locals 1

    .line 332
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    .line 497
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object v0
.end method

.method public getColorEffect()I
    .locals 1

    .line 748
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    return v0
.end method

.method public getContrastLevel()I
    .locals 1

    .line 784
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .line 304
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    .line 344
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    .line 821
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    .line 392
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getEyeLightType()I
    .locals 1

    .line 156
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    return v0
.end method

.method public getFNumber()Ljava/lang/String;
    .locals 1

    .line 989
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    .line 953
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 407
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    .line 459
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .line 446
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    .line 866
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    .line 380
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 280
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 292
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getNormalWideLDCEnabled()Z
    .locals 1

    .line 760
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    return v0
.end method

.method public getPhotoFormat()I
    .locals 1

    .line 240
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    return v0
.end method

.method public getPhotoMaxImages()I
    .locals 1

    .line 248
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 216
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPortraitLightingPattern()I
    .locals 1

    .line 707
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    return v0
.end method

.method public getPreviewFormat()I
    .locals 1

    .line 194
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

    .line 170
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    .line 202
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    .line 796
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    .line 523
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    .line 808
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getShotPath()Ljava/lang/String;
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    return-object v0
.end method

.method public getShotType()I
    .locals 1

    .line 606
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    return v0
.end method

.method public getSubPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 724
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    .line 945
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraWideLDCEnabled()Z
    .locals 1

    .line 772
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

    .line 136
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getVideoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 870
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 878
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

    .line 886
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 318
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    .line 356
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    .line 509
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    .line 825
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .line 682
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    return v0
.end method

.method public isCameraAi30Enabled()Z
    .locals 1

    .line 849
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    .line 537
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    .line 658
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    .line 736
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    .line 670
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    .line 973
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    .line 588
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    .line 575
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    .line 562
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    .line 694
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    .line 634
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    .line 431
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isNeedPausePreview()Z
    .locals 1

    .line 965
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    .line 264
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isOptimizedFlash()Z
    .locals 1

    .line 419
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    return v0
.end method

.method public isQcfaEnable()Z
    .locals 1

    .line 981
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    return v0
.end method

.method public isRecordingHintEnabled()Z
    .locals 1

    .line 549
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    .line 601
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isSwMfnrEnabled()Z
    .locals 1

    .line 646
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    .line 256
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1

    .line 348
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    .line 349
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    .line 350
    const/4 p1, 0x1

    return p1

    .line 352
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 361
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 362
    const/4 p1, 0x1

    return p1

    .line 364
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 463
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 464
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 465
    const/4 p1, 0x1

    return p1

    .line 467
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setASDScene(I)Z
    .locals 1

    .line 993
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    if-eq v0, p1, :cond_0

    .line 994
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    .line 995
    const/4 p1, 0x1

    return p1

    .line 997
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBLock(Z)Z
    .locals 1

    .line 501
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    .line 502
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    .line 503
    const/4 p1, 0x1

    return p1

    .line 505
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBMode(I)Z
    .locals 1

    .line 477
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    .line 478
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 479
    const/4 p1, 0x1

    return p1

    .line 481
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1

    .line 829
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 830
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    .line 831
    const/4 p1, 0x1

    return p1

    .line 833
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1

    .line 841
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    .line 842
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    .line 843
    const/4 p1, 0x1

    return p1

    .line 845
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAntiBanding(I)Z
    .locals 1

    .line 324
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    .line 325
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 326
    const/4 p1, 0x1

    return p1

    .line 328
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    .line 140
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 141
    return-void
.end method

.method public setBokehEnabled(Z)Z
    .locals 1

    .line 650
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    if-eq v0, p1, :cond_0

    .line 651
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    .line 652
    const/4 p1, 0x1

    return p1

    .line 654
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCameraAi30Enable(Z)Z
    .locals 1

    .line 853
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    if-eq v0, p1, :cond_0

    .line 854
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    .line 855
    const/4 p1, 0x1

    return p1

    .line 857
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(I)Z
    .locals 1

    .line 740
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    if-eq v0, p1, :cond_0

    .line 741
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 742
    const/4 p1, 0x1

    return p1

    .line 744
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setContrastLevel(I)Z
    .locals 1

    .line 776
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    .line 777
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 778
    const/4 p1, 0x1

    return p1

    .line 780
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomAWB(I)Z
    .locals 1

    .line 489
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    .line 490
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    .line 491
    const/4 p1, 0x1

    return p1

    .line 493
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDeviceOrientation(I)Z
    .locals 1

    .line 296
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    .line 297
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 298
    const/4 p1, 0x1

    return p1

    .line 300
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 2

    .line 890
    const-string v0, "device"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 891
    if-eqz p1, :cond_0

    .line 892
    if-nez v0, :cond_1

    .line 893
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 895
    :cond_0
    if-eqz v0, :cond_1

    .line 896
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 899
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 900
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 901
    const/4 p1, 0x1

    return p1

    .line 903
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableEIS(Z)Z
    .locals 1

    .line 529
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    .line 530
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    .line 531
    const/4 p1, 0x1

    return p1

    .line 533
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableOIS(Z)V
    .locals 0

    .line 260
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    .line 261
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0

    .line 252
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    .line 253
    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1

    .line 336
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    .line 337
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    .line 338
    const/4 p1, 0x1

    return p1

    .line 340
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1

    .line 812
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    .line 813
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 814
    const/4 p1, 0x1

    return p1

    .line 816
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureTime(J)Z
    .locals 2

    .line 384
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 385
    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    .line 386
    const/4 p1, 0x1

    return p1

    .line 388
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEyeLight(I)Z
    .locals 1

    .line 148
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    if-eq v0, p1, :cond_0

    .line 149
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 150
    const/4 p1, 0x1

    return p1

    .line 152
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 0

    .line 985
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    .line 986
    return-void
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1

    .line 662
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 663
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    .line 664
    const/4 p1, 0x1

    return p1

    .line 666
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1

    .line 728
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 729
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    .line 730
    const/4 p1, 0x1

    return p1

    .line 732
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1

    .line 674
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    .line 675
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    .line 676
    const/4 p1, 0x1

    return p1

    .line 678
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 2

    .line 924
    const-string v0, "beautify"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 925
    if-eqz p1, :cond_0

    .line 926
    if-nez v0, :cond_1

    .line 927
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 929
    :cond_0
    if-eqz v0, :cond_1

    .line 930
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 933
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 934
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 935
    const/4 p1, 0x1

    return p1

    .line 937
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0

    .line 949
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 950
    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1

    .line 398
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    .line 399
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 400
    const/4 p1, 0x1

    return p1

    .line 402
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusDistance(F)Z
    .locals 1

    .line 450
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 451
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 452
    const/4 p1, 0x1

    return p1

    .line 455
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusMode(I)Z
    .locals 1

    .line 437
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    .line 438
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 439
    const/4 p1, 0x1

    return p1

    .line 441
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFrontMirror(Z)V
    .locals 0

    .line 969
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    .line 970
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0

    .line 862
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    .line 863
    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1

    .line 579
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    .line 580
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    .line 581
    const/4 p1, 0x1

    return p1

    .line 584
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHDREnabled(Z)Z
    .locals 1

    .line 566
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    .line 567
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    .line 568
    const/4 p1, 0x1

    return p1

    .line 571
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHHTEnabled(Z)Z
    .locals 1

    .line 553
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    .line 554
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    .line 555
    const/4 p1, 0x1

    return p1

    .line 558
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setISO(I)Z
    .locals 1

    .line 372
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    .line 373
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    .line 374
    const/4 p1, 0x1

    return p1

    .line 376
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setJpegQuality(I)Z
    .locals 4

    .line 268
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_2

    const/16 v2, 0x64

    if-le p1, v2, :cond_0

    goto :goto_0

    .line 272
    :cond_0
    iget v2, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v2, p1, :cond_1

    .line 273
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 274
    return v1

    .line 276
    :cond_1
    return v0

    .line 269
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

    .line 270
    return v0
.end method

.method public setJpegRotation(I)Z
    .locals 1

    .line 284
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    .line 285
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 286
    const/4 p1, 0x1

    return p1

    .line 288
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1

    .line 686
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 687
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    .line 688
    const/4 p1, 0x1

    return p1

    .line 690
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1

    .line 626
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 627
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    .line 628
    const/4 p1, 0x1

    return p1

    .line 630
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNeedFlash(Z)Z
    .locals 1

    .line 423
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    .line 424
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    .line 425
    const/4 p1, 0x1

    return p1

    .line 427
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNormalWideLDCEnabled(Z)Z
    .locals 1

    .line 752
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 753
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    .line 754
    const/4 p1, 0x1

    return p1

    .line 756
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1

    .line 411
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    .line 412
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    .line 413
    const/4 p1, 0x1

    return p1

    .line 415
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPausePreview(Z)Z
    .locals 1

    .line 957
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    .line 958
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 959
    const/4 p1, 0x1

    return p1

    .line 961
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoFormat(I)Z
    .locals 1

    .line 232
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    if-eq v0, p1, :cond_0

    .line 233
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 234
    const/4 p1, 0x1

    return p1

    .line 236
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoMaxImages(I)V
    .locals 0

    .line 244
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 245
    return-void
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    .line 210
    const/4 p1, 0x1

    return p1

    .line 212
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPortraitLightingPattern(I)Z
    .locals 1

    .line 699
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    if-eq v0, p1, :cond_0

    .line 700
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    .line 701
    const/4 p1, 0x1

    return p1

    .line 703
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFormat(I)Z
    .locals 1

    .line 186
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    if-eq v0, p1, :cond_0

    .line 187
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 188
    const/4 p1, 0x1

    return p1

    .line 190
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

    .line 162
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    .line 164
    const/4 p1, 0x1

    return p1

    .line 166
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewMaxImages(I)V
    .locals 0

    .line 198
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 199
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 175
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 176
    const/4 p1, 0x1

    return p1

    .line 178
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setQcfaEnable(Z)V
    .locals 0

    .line 977
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    .line 978
    return-void
.end method

.method public setRecordingHintEnabled(Z)Z
    .locals 1

    .line 541
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    if-eq v0, p1, :cond_0

    .line 542
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    .line 543
    const/4 p1, 0x1

    return p1

    .line 545
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSaturationLevel(I)Z
    .locals 1

    .line 788
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    .line 789
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 790
    const/4 p1, 0x1

    return p1

    .line 792
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSceneMode(I)Z
    .locals 1

    .line 515
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    .line 516
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    .line 517
    const/4 p1, 0x1

    return p1

    .line 519
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSharpnessLevel(I)Z
    .locals 1

    .line 800
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    .line 801
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 802
    const/4 p1, 0x1

    return p1

    .line 804
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setShotPath(Ljava/lang/String;)V
    .locals 0

    .line 622
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    .line 623
    return-void
.end method

.method public setShotType(I)Z
    .locals 1

    .line 610
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    if-eq v0, p1, :cond_0

    .line 611
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 612
    const/4 p1, 0x1

    return p1

    .line 614
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSubPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 221
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    .line 222
    const/4 p1, 0x1

    return p1

    .line 224
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1

    .line 592
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 593
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    .line 594
    const/4 p1, 0x1

    return p1

    .line 597
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSwMfnrEnabled(Z)Z
    .locals 1

    .line 638
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 639
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    .line 640
    const/4 p1, 0x1

    return p1

    .line 642
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 711
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 712
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    .line 713
    const/4 p1, 0x1

    return p1

    .line 715
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 2

    .line 907
    const-string v0, "watermark"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 908
    if-eqz p1, :cond_0

    .line 909
    if-nez v0, :cond_1

    .line 910
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 912
    :cond_0
    if-eqz v0, :cond_1

    .line 913
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 916
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 917
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 918
    const/4 p1, 0x1

    return p1

    .line 920
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0

    .line 941
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 942
    return-void
.end method

.method public setUltraWideLDCEnabled(Z)Z
    .locals 1

    .line 764
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 765
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    .line 766
    const/4 p1, 0x1

    return p1

    .line 768
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

    .line 128
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 129
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    .line 130
    const/4 p1, 0x1

    return p1

    .line 132
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 874
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 875
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 882
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    .line 883
    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4

    .line 310
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 311
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 312
    const/4 p1, 0x1

    return p1

    .line 314
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
