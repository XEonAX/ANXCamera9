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

.field private mShotPath:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mShotPathThumbnail:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

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

    .line 35
    const-class v0, Lcom/android/camera2/CameraConfigs;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 49
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 50
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 51
    const/16 v1, 0x23

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 52
    const/16 v1, 0x100

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 53
    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 54
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 57
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 59
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 63
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 65
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 71
    iput v1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 74
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 78
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 79
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 80
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 81
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 84
    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 99
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    .line 100
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    .line 111
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    .line 112
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 113
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 114
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 115
    iput-boolean v1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 117
    iput-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    .line 123
    const-string v0, "-1"

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 124
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 125
    iput-object v2, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 127
    const/4 v0, -0x2

    iput v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return-void
.end method


# virtual methods
.method public getAERegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 390
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getAFRegions()[Landroid/hardware/camera2/params/MeteringRectangle;
    .locals 1

    .line 493
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    return-object v0
.end method

.method public getASDScene()I
    .locals 1

    .line 1047
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    return v0
.end method

.method public getAWBMode()I
    .locals 1

    .line 507
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    return v0
.end method

.method public getAiSceneDetectPeriod()I
    .locals 1

    .line 883
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    return v0
.end method

.method public getAntiBanding()I
    .locals 1

    .line 354
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    return v0
.end method

.method public getAutoZoomMode()I
    .locals 1

    .line 162
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    return v0
.end method

.method public getAutoZoomScaleOffset()F
    .locals 1

    .line 166
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    return v0
.end method

.method public getAwbCustomValue()I
    .locals 1

    .line 519
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    return v0
.end method

.method public getBeautyValues()Lcom/android/camera/fragment/beauty/BeautyValues;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    return-object v0
.end method

.method public getColorEffect()I
    .locals 1

    .line 794
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    return v0
.end method

.method public getContrastLevel()I
    .locals 1

    .line 830
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    return v0
.end method

.method public getDeviceOrientation()I
    .locals 1

    .line 326
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    return v0
.end method

.method public getExposureCompensationIndex()I
    .locals 1

    .line 366
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    return v0
.end method

.method public getExposureMeteringMode()I
    .locals 1

    .line 867
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    return v0
.end method

.method public getExposureTime()J
    .locals 2

    .line 414
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    return-wide v0
.end method

.method public getEyeLightType()I
    .locals 1

    .line 178
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    return v0
.end method

.method public getFNumber()Ljava/lang/String;
    .locals 1

    .line 1035
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getFaceWaterMarkFormat()Ljava/lang/String;
    .locals 1

    .line 999
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFlashMode()I
    .locals 1

    .line 429
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    return v0
.end method

.method public getFocusDistance()F
    .locals 1

    .line 481
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    return v0
.end method

.method public getFocusMode()I
    .locals 1

    .line 468
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    return v0
.end method

.method public getGpsLocation()Landroid/location/Location;
    .locals 1

    .line 912
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getISO()I
    .locals 1

    .line 402
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    return v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 302
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    return v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 314
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    return v0
.end method

.method public getNormalWideLDCEnabled()Z
    .locals 1

    .line 806
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    return v0
.end method

.method public getPhotoFormat()I
    .locals 1

    .line 262
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    return v0
.end method

.method public getPhotoMaxImages()I
    .locals 1

    .line 270
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    return v0
.end method

.method public getPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getPortraitLightingPattern()I
    .locals 1

    .line 753
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    return v0
.end method

.method public getPreviewFormat()I
    .locals 1

    .line 216
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

    .line 192
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getPreviewMaxImages()I
    .locals 1

    .line 224
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    return v0
.end method

.method public getPreviewSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getSaturationLevel()I
    .locals 1

    .line 842
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    return v0
.end method

.method public getSceneMode()I
    .locals 1

    .line 545
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    return v0
.end method

.method public getSharpnessLevel()I
    .locals 1

    .line 854
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    return v0
.end method

.method public getShotPath()Ljava/lang/String;
    .locals 4

    .line 640
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 641
    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getShotPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    return-object v0
.end method

.method public getShotType()I
    .locals 1

    .line 628
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    return v0
.end method

.method public getSubPhotoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getThumbnailShotPath()Ljava/lang/String;
    .locals 4

    .line 646
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 647
    sget-object v1, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getThumbnailShotPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    return-object v0
.end method

.method public getThumbnailSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 770
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getTimeWaterMarkValue()Ljava/lang/String;
    .locals 1

    .line 991
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    return-object v0
.end method

.method public getUltraWideLDCEnabled()Z
    .locals 1

    .line 818
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

    .line 142
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    return-object v0
.end method

.method public getVideoSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 916
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    return-object v0
.end method

.method public getVideoSnapshotSize()Lcom/android/camera/CameraSize;
    .locals 1

    .line 924
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

    .line 932
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    return-object v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 340
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    return v0
.end method

.method public isAELocked()Z
    .locals 1

    .line 378
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    return v0
.end method

.method public isAWBLocked()Z
    .locals 1

    .line 531
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    return v0
.end method

.method public isAiSceneDetectEnabled()Z
    .locals 1

    .line 871
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    return v0
.end method

.method public isBokehEnabled()Z
    .locals 1

    .line 728
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    return v0
.end method

.method public isCameraAi30Enabled()Z
    .locals 1

    .line 895
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    return v0
.end method

.method public isEISEnabled()Z
    .locals 1

    .line 559
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    return v0
.end method

.method public isFaceAgeAnalyzeEnabled()Z
    .locals 1

    .line 704
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    return v0
.end method

.method public isFaceDetectionEnabled()Z
    .locals 1

    .line 782
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    return v0
.end method

.method public isFaceScoreEnabled()Z
    .locals 1

    .line 716
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    return v0
.end method

.method public isFrontMirror()Z
    .locals 1

    .line 1019
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    return v0
.end method

.method public isHDRCheckerEnabled()Z
    .locals 1

    .line 610
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    return v0
.end method

.method public isHDREnabled()Z
    .locals 1

    .line 597
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    return v0
.end method

.method public isHHTEnabled()Z
    .locals 1

    .line 584
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    return v0
.end method

.method public isLensDirtyDetectEnabled()Z
    .locals 1

    .line 740
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    return v0
.end method

.method public isMfnrEnabled()Z
    .locals 1

    .line 680
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    return v0
.end method

.method public isNeedFlash()Z
    .locals 1

    .line 453
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    return v0
.end method

.method public isNeedPausePreview()Z
    .locals 1

    .line 1011
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    return v0
.end method

.method public isOISEnabled()Z
    .locals 1

    .line 286
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    return v0
.end method

.method public isOptimizedFlash()Z
    .locals 1

    .line 441
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    return v0
.end method

.method public isQcfaEnable()Z
    .locals 1

    .line 1027
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    return v0
.end method

.method public isRecordingHintEnabled()Z
    .locals 1

    .line 571
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    return v0
.end method

.method public isSuperResolutionEnabled()Z
    .locals 1

    .line 623
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    return v0
.end method

.method public isSwMfnrEnabled()Z
    .locals 1

    .line 692
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    return v0
.end method

.method public isZslEnabled()Z
    .locals 1

    .line 278
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    return v0
.end method

.method public setAELock(Z)Z
    .locals 1

    .line 370
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    if-eq v0, p1, :cond_0

    .line 371
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAELocked:Z

    .line 372
    const/4 p1, 0x1

    return p1

    .line 374
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAERegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 382
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 383
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAERegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 384
    const/4 p1, 0x1

    return p1

    .line 386
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAFRegions([Landroid/hardware/camera2/params/MeteringRectangle;)Z
    .locals 1

    .line 485
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-static {v0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 486
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mAFRegions:[Landroid/hardware/camera2/params/MeteringRectangle;

    .line 487
    const/4 p1, 0x1

    return p1

    .line 489
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setASDScene(I)Z
    .locals 1

    .line 1039
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    if-eq v0, p1, :cond_0

    .line 1040
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mASDScene:I

    .line 1041
    const/4 p1, 0x1

    return p1

    .line 1043
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBLock(Z)Z
    .locals 1

    .line 523
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    if-eq v0, p1, :cond_0

    .line 524
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAWBLocked:Z

    .line 525
    const/4 p1, 0x1

    return p1

    .line 527
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAWBMode(I)Z
    .locals 1

    .line 499
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    if-eq v0, p1, :cond_0

    .line 500
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbMode:I

    .line 501
    const/4 p1, 0x1

    return p1

    .line 503
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectEnable(Z)Z
    .locals 1

    .line 875
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 876
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectEnabled:Z

    .line 877
    const/4 p1, 0x1

    return p1

    .line 879
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAiSceneDetectPeriod(I)Z
    .locals 1

    .line 887
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    if-eq v0, p1, :cond_0

    .line 888
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAiSceneDetectPeriod:I

    .line 889
    const/4 p1, 0x1

    return p1

    .line 891
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAntiBanding(I)Z
    .locals 1

    .line 346
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    if-eq v0, p1, :cond_0

    .line 347
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAntiBanding:I

    .line 348
    const/4 p1, 0x1

    return p1

    .line 350
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setAutoZoomMode(I)V
    .locals 0

    .line 154
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomMode:I

    .line 155
    return-void
.end method

.method public setAutoZoomScaleOffset(F)V
    .locals 0

    .line 158
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAutoZoomScaleOffset:F

    .line 159
    return-void
.end method

.method public setBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mBeautyValues:Lcom/android/camera/fragment/beauty/BeautyValues;

    .line 147
    return-void
.end method

.method public setBokehEnabled(Z)Z
    .locals 1

    .line 696
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    if-eq v0, p1, :cond_0

    .line 697
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mBokehEnabled:Z

    .line 698
    const/4 p1, 0x1

    return p1

    .line 700
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCameraAi30Enable(Z)Z
    .locals 1

    .line 899
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    if-eq v0, p1, :cond_0

    .line 900
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mCameraAi30Enabled:Z

    .line 901
    const/4 p1, 0x1

    return p1

    .line 903
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(I)Z
    .locals 1

    .line 786
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    if-eq v0, p1, :cond_0

    .line 787
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mColorEffect:I

    .line 788
    const/4 p1, 0x1

    return p1

    .line 790
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setContrastLevel(I)Z
    .locals 1

    .line 822
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    if-eq v0, p1, :cond_0

    .line 823
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mContrastLevel:I

    .line 824
    const/4 p1, 0x1

    return p1

    .line 826
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setCustomAWB(I)Z
    .locals 1

    .line 511
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    if-eq v0, p1, :cond_0

    .line 512
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mAwbCustomValue:I

    .line 513
    const/4 p1, 0x1

    return p1

    .line 515
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDeviceOrientation(I)Z
    .locals 1

    .line 318
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    if-eq v0, p1, :cond_0

    .line 319
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mDeviceOrientation:I

    .line 320
    const/4 p1, 0x1

    return p1

    .line 322
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setDualCamWaterMarkEnable(Z)Z
    .locals 2

    .line 936
    const-string v0, "device"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 937
    if-eqz p1, :cond_0

    .line 938
    if-nez v0, :cond_1

    .line 939
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 941
    :cond_0
    if-eqz v0, :cond_1

    .line 942
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "device"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 945
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 946
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mDualCamWaterMarkEnabled:Z

    .line 947
    const/4 p1, 0x1

    return p1

    .line 949
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableEIS(Z)Z
    .locals 1

    .line 551
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    if-eq v0, p1, :cond_0

    .line 552
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mEISEnabled:Z

    .line 553
    const/4 p1, 0x1

    return p1

    .line 555
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableOIS(Z)V
    .locals 0

    .line 282
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOISEnabled:Z

    .line 283
    return-void
.end method

.method public setEnableZsl(Z)V
    .locals 0

    .line 274
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mZslEnabled:Z

    .line 275
    return-void
.end method

.method public setExposureCompensationIndex(I)Z
    .locals 1

    .line 358
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    if-eq v0, p1, :cond_0

    .line 359
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureCompensationIndex:I

    .line 360
    const/4 p1, 0x1

    return p1

    .line 362
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureMeteringMode(I)Z
    .locals 1

    .line 858
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    if-eq v0, p1, :cond_0

    .line 859
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureMeteringMode:I

    .line 860
    const/4 p1, 0x1

    return p1

    .line 862
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setExposureTime(J)Z
    .locals 2

    .line 406
    iget-wide v0, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 407
    iput-wide p1, p0, Lcom/android/camera2/CameraConfigs;->mExposureTime:J

    .line 408
    const/4 p1, 0x1

    return p1

    .line 410
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEyeLight(I)Z
    .locals 1

    .line 170
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    if-eq v0, p1, :cond_0

    .line 171
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mEyeLightType:I

    .line 172
    const/4 p1, 0x1

    return p1

    .line 174
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFNumber(Ljava/lang/String;)V
    .locals 0

    .line 1031
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFNumber:Ljava/lang/String;

    .line 1032
    return-void
.end method

.method public setFaceAgeAnalyzeEnabled(Z)Z
    .locals 1

    .line 708
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 709
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceAgeAnalyzeEnabled:Z

    .line 710
    const/4 p1, 0x1

    return p1

    .line 712
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceDetectionEnabled(Z)Z
    .locals 1

    .line 774
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 775
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceDetectionEnabled:Z

    .line 776
    const/4 p1, 0x1

    return p1

    .line 778
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceScoreEnabled(Z)Z
    .locals 1

    .line 720
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    if-eq v0, p1, :cond_0

    .line 721
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceScoreEnabled:Z

    .line 722
    const/4 p1, 0x1

    return p1

    .line 724
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkEnable(Z)Z
    .locals 2

    .line 970
    const-string v0, "beautify"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 971
    if-eqz p1, :cond_0

    .line 972
    if-nez v0, :cond_1

    .line 973
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 975
    :cond_0
    if-eqz v0, :cond_1

    .line 976
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "beautify"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 979
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 980
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkEnabled:Z

    .line 981
    const/4 p1, 0x1

    return p1

    .line 983
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setFaceWaterMarkFormat(Ljava/lang/String;)V
    .locals 0

    .line 995
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mFaceWaterMarkFormat:Ljava/lang/String;

    .line 996
    return-void
.end method

.method public setFlashMode(I)Z
    .locals 1

    .line 420
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    if-eq v0, p1, :cond_0

    .line 421
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFlashMode:I

    .line 422
    const/4 p1, 0x1

    return p1

    .line 424
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusDistance(F)Z
    .locals 1

    .line 472
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 473
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusDistance:F

    .line 474
    const/4 p1, 0x1

    return p1

    .line 477
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFocusMode(I)Z
    .locals 1

    .line 459
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    if-eq v0, p1, :cond_0

    .line 460
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mFocusMode:I

    .line 461
    const/4 p1, 0x1

    return p1

    .line 463
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setFrontMirror(Z)V
    .locals 0

    .line 1015
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mFrontMirror:Z

    .line 1016
    return-void
.end method

.method public setGpsLocation(Landroid/location/Location;)V
    .locals 0

    .line 908
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mGpsLocation:Landroid/location/Location;

    .line 909
    return-void
.end method

.method public setHDRCheckerEnabled(Z)Z
    .locals 1

    .line 601
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    if-eq v0, p1, :cond_0

    .line 602
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDRCheckerEnabled:Z

    .line 603
    const/4 p1, 0x1

    return p1

    .line 606
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHDREnabled(Z)Z
    .locals 1

    .line 588
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    if-eq v0, p1, :cond_0

    .line 589
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHDREnabled:Z

    .line 590
    const/4 p1, 0x1

    return p1

    .line 593
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setHHTEnabled(Z)Z
    .locals 1

    .line 575
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    if-eq v0, p1, :cond_0

    .line 576
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mHHTEnabled:Z

    .line 577
    const/4 p1, 0x1

    return p1

    .line 580
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setISO(I)Z
    .locals 1

    .line 394
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    if-eq v0, p1, :cond_0

    .line 395
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mIso:I

    .line 396
    const/4 p1, 0x1

    return p1

    .line 398
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setJpegQuality(I)Z
    .locals 4

    .line 290
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p1, v1, :cond_2

    const/16 v2, 0x64

    if-le p1, v2, :cond_0

    goto :goto_0

    .line 294
    :cond_0
    iget v2, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    if-eq v2, p1, :cond_1

    .line 295
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegQuality:I

    .line 296
    return v1

    .line 298
    :cond_1
    return v0

    .line 291
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

    .line 292
    return v0
.end method

.method public setJpegRotation(I)Z
    .locals 1

    .line 306
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    if-eq v0, p1, :cond_0

    .line 307
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mJpegRotation:I

    .line 308
    const/4 p1, 0x1

    return p1

    .line 310
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setLensDirtyDetectEnabled(Z)Z
    .locals 1

    .line 732
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    if-eq v0, p1, :cond_0

    .line 733
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mLensDirtyDetectEnabled:Z

    .line 734
    const/4 p1, 0x1

    return p1

    .line 736
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setMfnrEnabled(Z)Z
    .locals 1

    .line 672
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 673
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mMfnrEnabled:Z

    .line 674
    const/4 p1, 0x1

    return p1

    .line 676
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNeedFlash(Z)Z
    .locals 1

    .line 445
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    if-eq v0, p1, :cond_0

    .line 446
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedFlash:Z

    .line 447
    const/4 p1, 0x1

    return p1

    .line 449
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setNormalWideLDCEnabled(Z)Z
    .locals 1

    .line 798
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 799
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNormalWideLDCEnabled:Z

    .line 800
    const/4 p1, 0x1

    return p1

    .line 802
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setOptimizedFlash(Z)Z
    .locals 1

    .line 433
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    if-eq v0, p1, :cond_0

    .line 434
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mOptimizedFlash:Z

    .line 435
    const/4 p1, 0x1

    return p1

    .line 437
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPausePreview(Z)Z
    .locals 1

    .line 1003
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    if-eq v0, p1, :cond_0

    .line 1004
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mNeedPausePreview:Z

    .line 1005
    const/4 p1, 0x1

    return p1

    .line 1007
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoFormat(I)Z
    .locals 1

    .line 254
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    if-eq v0, p1, :cond_0

    .line 255
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoFormat:I

    .line 256
    const/4 p1, 0x1

    return p1

    .line 258
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPhotoMaxImages(I)V
    .locals 0

    .line 266
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoMaxImages:I

    .line 267
    return-void
.end method

.method public setPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 231
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPhotoSize:Lcom/android/camera/CameraSize;

    .line 232
    const/4 p1, 0x1

    return p1

    .line 234
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPortraitLightingPattern(I)Z
    .locals 1

    .line 745
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    if-eq v0, p1, :cond_0

    .line 746
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPortraitLightingPattern:I

    .line 747
    const/4 p1, 0x1

    return p1

    .line 749
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewFormat(I)Z
    .locals 1

    .line 208
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    if-eq v0, p1, :cond_0

    .line 209
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFormat:I

    .line 210
    const/4 p1, 0x1

    return p1

    .line 212
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

    .line 184
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewFpsRange:Landroid/util/Range;

    .line 186
    const/4 p1, 0x1

    return p1

    .line 188
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setPreviewMaxImages(I)V
    .locals 0

    .line 220
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewMaxImages:I

    .line 221
    return-void
.end method

.method public setPreviewSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 197
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mPreviewSize:Lcom/android/camera/CameraSize;

    .line 198
    const/4 p1, 0x1

    return p1

    .line 200
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setQcfaEnable(Z)V
    .locals 0

    .line 1023
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mIsQcfaEnabled:Z

    .line 1024
    return-void
.end method

.method public setRecordingHintEnabled(Z)Z
    .locals 1

    .line 563
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    if-eq v0, p1, :cond_0

    .line 564
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mRecordingHintEnabled:Z

    .line 565
    const/4 p1, 0x1

    return p1

    .line 567
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSaturationLevel(I)Z
    .locals 1

    .line 834
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    if-eq v0, p1, :cond_0

    .line 835
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSaturationLevel:I

    .line 836
    const/4 p1, 0x1

    return p1

    .line 838
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSceneMode(I)Z
    .locals 1

    .line 537
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    if-eq v0, p1, :cond_0

    .line 538
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSceneMode:I

    .line 539
    const/4 p1, 0x1

    return p1

    .line 541
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSharpnessLevel(I)Z
    .locals 1

    .line 846
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    if-eq v0, p1, :cond_0

    .line 847
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mSharpnessLevel:I

    .line 848
    const/4 p1, 0x1

    return p1

    .line 850
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setShotPath(Ljava/lang/String;Z)V
    .locals 3

    .line 652
    sget-object v0, Lcom/android/camera2/CameraConfigs;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setShotPath: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    const/4 v1, 0x5

    if-nez v0, :cond_0

    .line 655
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    .line 658
    :cond_0
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mShotPath:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 660
    if-nez p2, :cond_1

    .line 661
    return-void

    .line 664
    :cond_1
    iget-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    if-nez p2, :cond_2

    .line 665
    new-instance p2, Ljava/util/ArrayDeque;

    invoke-direct {p2, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    .line 668
    :cond_2
    iget-object p2, p0, Lcom/android/camera2/CameraConfigs;->mShotPathThumbnail:Ljava/util/ArrayDeque;

    invoke-virtual {p2, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 669
    return-void
.end method

.method public setShotType(I)Z
    .locals 1

    .line 632
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    if-eq v0, p1, :cond_0

    .line 633
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mShotType:I

    .line 634
    const/4 p1, 0x1

    return p1

    .line 636
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSubPhotoSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 243
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mSubPhotoSize:Lcom/android/camera/CameraSize;

    .line 244
    const/4 p1, 0x1

    return p1

    .line 246
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSuperResolutionEnabled(Z)Z
    .locals 1

    .line 614
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    if-eq v0, p1, :cond_0

    .line 615
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSuperResolutionEnabled:Z

    .line 616
    const/4 p1, 0x1

    return p1

    .line 619
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setSwMfnrEnabled(Z)Z
    .locals 1

    .line 684
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    if-eq v0, p1, :cond_0

    .line 685
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mSwMfnrEnabled:Z

    .line 686
    const/4 p1, 0x1

    return p1

    .line 688
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setThumbnailSize(Lcom/android/camera/CameraSize;)Z
    .locals 1

    .line 757
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 758
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mThumbnailSize:Lcom/android/camera/CameraSize;

    .line 759
    const/4 p1, 0x1

    return p1

    .line 761
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkEnable(Z)Z
    .locals 2

    .line 953
    const-string v0, "watermark"

    iget-object v1, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;Ljava/util/List;)Z

    move-result v0

    .line 954
    if-eqz p1, :cond_0

    .line 955
    if-nez v0, :cond_1

    .line 956
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 958
    :cond_0
    if-eqz v0, :cond_1

    .line 959
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mWaterMarkAppliedList:Ljava/util/List;

    const-string v1, "watermark"

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 962
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    if-eq v0, p1, :cond_2

    .line 963
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWaterMarkEnabled:Z

    .line 964
    const/4 p1, 0x1

    return p1

    .line 966
    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public setTimeWaterMarkValue(Ljava/lang/String;)V
    .locals 0

    .line 987
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mTimeWatermarkValue:Ljava/lang/String;

    .line 988
    return-void
.end method

.method public setUltraWideLDCEnabled(Z)Z
    .locals 1

    .line 810
    iget-boolean v0, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    if-eq v0, p1, :cond_0

    .line 811
    iput-boolean p1, p0, Lcom/android/camera2/CameraConfigs;->mUltraWideLDCEnabled:Z

    .line 812
    const/4 p1, 0x1

    return p1

    .line 814
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

    .line 134
    iget-object v0, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoFpsRange:Landroid/util/Range;

    .line 136
    const/4 p1, 0x1

    return p1

    .line 138
    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public setVideoSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 920
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSize:Lcom/android/camera/CameraSize;

    .line 921
    return-void
.end method

.method public setVideoSnapshotSize(Lcom/android/camera/CameraSize;)V
    .locals 0

    .line 928
    iput-object p1, p0, Lcom/android/camera2/CameraConfigs;->mVideoSnapshotSize:Lcom/android/camera/CameraSize;

    .line 929
    return-void
.end method

.method public setZoomRatio(F)Z
    .locals 4

    .line 332
    iget v0, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f847ae147ae147bL    # 0.01

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    .line 333
    iput p1, p0, Lcom/android/camera2/CameraConfigs;->mZoomRatio:F

    .line 334
    const/4 p1, 0x1

    return p1

    .line 336
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
