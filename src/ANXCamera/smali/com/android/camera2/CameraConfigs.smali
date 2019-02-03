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

.field private mAutoZoomMode:I

.field private mAutoZoomScaleOffset:F

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

    .line 64
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

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

    .line 388
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 491
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getASDScene()I
    .locals 1

    .line 1021
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return v0
.end method

.method public getAWBMode()I
    .locals 1

    .line 505
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    .line 857
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAntiBanding()I
    .locals 1

    .line 352
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAutoZoomMode()I
    .locals 1

    .line 160
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    return v0
.end method

.method public getAutoZoomScaleOffset()F
    .locals 1

    .line 164
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    .line 517
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object v0
.end method

.method public getColorEffect()I
    .locals 1

    .line 768
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    return v0
.end method

.method public getContrastLevel()I
    .locals 1

    .line 804
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .line 324
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    .line 364
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    .line 841
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    .line 412
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getEyeLightType()I
    .locals 1

    .line 176
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    return v0
.end method

.method public getFNumber()Ljava/lang/String;
    .locals 1

    .line 1009
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    .line 973
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 427
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    .line 479
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .line 466
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    .line 886
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    .line 400
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 300
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 312
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getNormalWideLDCEnabled()Z
    .locals 1

    .line 780
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    return v0
.end method

.method public getPhotoFormat()I
    .locals 1

    .line 260
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    return v0
.end method

.method public getPhotoMaxImages()I
    .locals 1

    .line 268
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPortraitLightingPattern()I
    .locals 1

    .line 727
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    return v0
.end method

.method public getPreviewFormat()I
    .locals 1

    .line 214
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

    .line 190
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    .line 222
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    .line 816
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    .line 543
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    .line 828
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getShotPath()Ljava/lang/String;
    .locals 1

    .line 638
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    return-object v0
.end method

.method public getShotType()I
    .locals 1

    .line 626
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    return v0
.end method

.method public getSubPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 744
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    .line 965
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraWideLDCEnabled()Z
    .locals 1

    .line 792
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

    .line 140
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getVideoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 890
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 898
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

    .line 906
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 338
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    .line 376
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    .line 529
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    .line 845
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .line 702
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    return v0
.end method

.method public isCameraAi30Enabled()Z
    .locals 1

    .line 869
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    .line 557
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    .line 678
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    .line 756
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    .line 690
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    .line 993
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    .line 608
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    .line 595
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    .line 582
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    .line 714
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    .line 654
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    .line 451
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isNeedPausePreview()Z
    .locals 1

    .line 985
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    .line 284
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isOptimizedFlash()Z
    .locals 1

    .line 439
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    return v0
.end method

.method public isQcfaEnable()Z
    .locals 1

    .line 1001
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    return v0
.end method

.method public isRecordingHintEnabled()Z
    .locals 1

    .line 569
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    .line 621
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isSwMfnrEnabled()Z
    .locals 1

    .line 666
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    .line 276
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1

    .line 368
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    .line 369
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    .line 370
    const/4 p1, 0x1

    return p1

    .line 372
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 380
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 381
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 382
    const/4 p1, 0x1

    return p1

    .line 384
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 483
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 484
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 485
    const/4 p1, 0x1

    return p1

    .line 487
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setASDScene(I)Z
    .locals 1

    .line 1013
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    if-eq v0, p1, :cond_0

    .line 1014
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    .line 1015
    const/4 p1, 0x1

    return p1

    .line 1017
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBLock(Z)Z
    .locals 1

    .line 521
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    .line 522
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    .line 523
    const/4 p1, 0x1

    return p1

    .line 525
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBMode(I)Z
    .locals 1

    .line 497
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    .line 498
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 499
    const/4 p1, 0x1

    return p1

    .line 501
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1

    .line 849
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 850
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    .line 851
    const/4 p1, 0x1

    return p1

    .line 853
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1

    .line 861
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    .line 862
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    .line 863
    const/4 p1, 0x1

    return p1

    .line 865
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAntiBanding(I)Z
    .locals 1

    .line 344
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    .line 345
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 346
    const/4 p1, 0x1

    return p1

    .line 348
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAutoZoomMode(I)V
    .locals 0

    .line 152
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    .line 153
    return-void
.end method

.method public setAutoZoomScaleOffset(F)V
    .locals 0

    .line 156
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    .line 157
    return-void
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    .line 144
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 145
    return-void
.end method

.method public setBokehEnabled(Z)Z
    .locals 1

    .line 670
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    if-eq v0, p1, :cond_0

    .line 671
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    .line 672
    const/4 p1, 0x1

    return p1

    .line 674
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCameraAi30Enable(Z)Z
    .locals 1

    .line 873
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    if-eq v0, p1, :cond_0

    .line 874
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    .line 875
    const/4 p1, 0x1

    return p1

    .line 877
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(I)Z
    .locals 1

    .line 760
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    if-eq v0, p1, :cond_0

    .line 761
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 762
    const/4 p1, 0x1

    return p1

    .line 764
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setContrastLevel(I)Z
    .locals 1

    .line 796
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    .line 797
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 798
    const/4 p1, 0x1

    return p1

    .line 800
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomAWB(I)Z
    .locals 1

    .line 509
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    .line 510
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    .line 511
    const/4 p1, 0x1

    return p1

    .line 513
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDeviceOrientation(I)Z
    .locals 1

    .line 316
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    .line 317
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 318
    const/4 p1, 0x1

    return p1

    .line 320
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 2

    .line 910
    const-string v0, "device"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 911
    if-eqz p1, :cond_0

    .line 912
    if-nez v0, :cond_1

    .line 913
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 915
    :cond_0
    if-eqz v0, :cond_1

    .line 916
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 919
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 920
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 921
    const/4 p1, 0x1

    return p1

    .line 923
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableEIS(Z)Z
    .locals 1

    .line 549
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    .line 550
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    .line 551
    const/4 p1, 0x1

    return p1

    .line 553
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableOIS(Z)V
    .locals 0

    .line 280
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    .line 281
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0

    .line 272
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    .line 273
    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1

    .line 356
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    .line 357
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    .line 358
    const/4 p1, 0x1

    return p1

    .line 360
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1

    .line 832
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    .line 833
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 834
    const/4 p1, 0x1

    return p1

    .line 836
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureTime(J)Z
    .locals 2

    .line 404
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 405
    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    .line 406
    const/4 p1, 0x1

    return p1

    .line 408
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEyeLight(I)Z
    .locals 1

    .line 168
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    if-eq v0, p1, :cond_0

    .line 169
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 170
    const/4 p1, 0x1

    return p1

    .line 172
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 0

    .line 1005
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    .line 1006
    return-void
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1

    .line 682
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 683
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    .line 684
    const/4 p1, 0x1

    return p1

    .line 686
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1

    .line 748
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 749
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    .line 750
    const/4 p1, 0x1

    return p1

    .line 752
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1

    .line 694
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    .line 695
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    .line 696
    const/4 p1, 0x1

    return p1

    .line 698
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 2

    .line 944
    const-string v0, "beautify"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 945
    if-eqz p1, :cond_0

    .line 946
    if-nez v0, :cond_1

    .line 947
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 949
    :cond_0
    if-eqz v0, :cond_1

    .line 950
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 953
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 954
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 955
    const/4 p1, 0x1

    return p1

    .line 957
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0

    .line 969
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 970
    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1

    .line 418
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    .line 419
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 420
    const/4 p1, 0x1

    return p1

    .line 422
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusDistance(F)Z
    .locals 1

    .line 470
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 471
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 472
    const/4 p1, 0x1

    return p1

    .line 475
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusMode(I)Z
    .locals 1

    .line 457
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    .line 458
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 459
    const/4 p1, 0x1

    return p1

    .line 461
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFrontMirror(Z)V
    .locals 0

    .line 989
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    .line 990
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0

    .line 882
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    .line 883
    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1

    .line 599
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    .line 600
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    .line 601
    const/4 p1, 0x1

    return p1

    .line 604
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHDREnabled(Z)Z
    .locals 1

    .line 586
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    .line 587
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    .line 588
    const/4 p1, 0x1

    return p1

    .line 591
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHHTEnabled(Z)Z
    .locals 1

    .line 573
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    .line 574
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    .line 575
    const/4 p1, 0x1

    return p1

    .line 578
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setISO(I)Z
    .locals 1

    .line 392
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    .line 393
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    .line 394
    const/4 p1, 0x1

    return p1

    .line 396
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setJpegQuality(I)Z
    .locals 4

    .line 288
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_2

    const/16 v2, 0x64

    if-le p1, v2, :cond_0

    goto :goto_0

    .line 292
    :cond_0
    iget v2, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v2, p1, :cond_1

    .line 293
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 294
    return v1

    .line 296
    :cond_1
    return v0

    .line 289
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

    .line 290
    return v0
.end method

.method public setJpegRotation(I)Z
    .locals 1

    .line 304
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    .line 305
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 306
    const/4 p1, 0x1

    return p1

    .line 308
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1

    .line 706
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 707
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    .line 708
    const/4 p1, 0x1

    return p1

    .line 710
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1

    .line 646
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 647
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    .line 648
    const/4 p1, 0x1

    return p1

    .line 650
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNeedFlash(Z)Z
    .locals 1

    .line 443
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    .line 444
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    .line 445
    const/4 p1, 0x1

    return p1

    .line 447
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNormalWideLDCEnabled(Z)Z
    .locals 1

    .line 772
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 773
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    .line 774
    const/4 p1, 0x1

    return p1

    .line 776
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1

    .line 431
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    .line 432
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    .line 433
    const/4 p1, 0x1

    return p1

    .line 435
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPausePreview(Z)Z
    .locals 1

    .line 977
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    .line 978
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 979
    const/4 p1, 0x1

    return p1

    .line 981
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoFormat(I)Z
    .locals 1

    .line 252
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    if-eq v0, p1, :cond_0

    .line 253
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 254
    const/4 p1, 0x1

    return p1

    .line 256
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoMaxImages(I)V
    .locals 0

    .line 264
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 265
    return-void
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 229
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    .line 230
    const/4 p1, 0x1

    return p1

    .line 232
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPortraitLightingPattern(I)Z
    .locals 1

    .line 719
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    if-eq v0, p1, :cond_0

    .line 720
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    .line 721
    const/4 p1, 0x1

    return p1

    .line 723
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFormat(I)Z
    .locals 1

    .line 206
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    if-eq v0, p1, :cond_0

    .line 207
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 208
    const/4 p1, 0x1

    return p1

    .line 210
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

    .line 182
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    .line 184
    const/4 p1, 0x1

    return p1

    .line 186
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewMaxImages(I)V
    .locals 0

    .line 218
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 219
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 195
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 196
    const/4 p1, 0x1

    return p1

    .line 198
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setQcfaEnable(Z)V
    .locals 0

    .line 997
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    .line 998
    return-void
.end method

.method public setRecordingHintEnabled(Z)Z
    .locals 1

    .line 561
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    if-eq v0, p1, :cond_0

    .line 562
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    .line 563
    const/4 p1, 0x1

    return p1

    .line 565
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSaturationLevel(I)Z
    .locals 1

    .line 808
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    .line 809
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 810
    const/4 p1, 0x1

    return p1

    .line 812
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSceneMode(I)Z
    .locals 1

    .line 535
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    .line 536
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    .line 537
    const/4 p1, 0x1

    return p1

    .line 539
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSharpnessLevel(I)Z
    .locals 1

    .line 820
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    .line 821
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 822
    const/4 p1, 0x1

    return p1

    .line 824
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setShotPath(Ljava/lang/String;)V
    .locals 0

    .line 642
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/lang/String;

    .line 643
    return-void
.end method

.method public setShotType(I)Z
    .locals 1

    .line 630
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    if-eq v0, p1, :cond_0

    .line 631
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 632
    const/4 p1, 0x1

    return p1

    .line 634
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSubPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 241
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    .line 242
    const/4 p1, 0x1

    return p1

    .line 244
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1

    .line 612
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 613
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    .line 614
    const/4 p1, 0x1

    return p1

    .line 617
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSwMfnrEnabled(Z)Z
    .locals 1

    .line 658
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 659
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    .line 660
    const/4 p1, 0x1

    return p1

    .line 662
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 731
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 732
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    .line 733
    const/4 p1, 0x1

    return p1

    .line 735
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 2

    .line 927
    const-string v0, "watermark"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 928
    if-eqz p1, :cond_0

    .line 929
    if-nez v0, :cond_1

    .line 930
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 932
    :cond_0
    if-eqz v0, :cond_1

    .line 933
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 936
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 937
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 938
    const/4 p1, 0x1

    return p1

    .line 940
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0

    .line 961
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 962
    return-void
.end method

.method public setUltraWideLDCEnabled(Z)Z
    .locals 1

    .line 784
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 785
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    .line 786
    const/4 p1, 0x1

    return p1

    .line 788
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

    .line 132
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    .line 134
    const/4 p1, 0x1

    return p1

    .line 136
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 894
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 895
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 902
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    .line 903
    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4

    .line 330
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 331
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 332
    const/4 p1, 0x1

    return p1

    .line 334
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
