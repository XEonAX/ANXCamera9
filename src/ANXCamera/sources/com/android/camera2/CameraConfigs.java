package com.android.camera2;

import android.hardware.camera2.params.MeteringRectangle;
import android.location.Location;
import android.util.Range;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class CameraConfigs {
    private static final int MAX_JPEG_COMPRESSION_QUALITY = 100;
    private static final int MIN_JPEG_COMPRESSION_QUALITY = 1;
    private static final String TAG = CameraConfigs.class.getSimpleName();
    private boolean mAELocked;
    private MeteringRectangle[] mAERegions;
    private MeteringRectangle[] mAFRegions;
    private int mASDScene;
    private boolean mAWBLocked;
    private boolean mAiSceneDetectEnabled;
    private int mAiSceneDetectPeriod;
    private int mAntiBanding;
    private int mAwbCustomValue;
    private int mAwbMode;
    private BeautyValues mBeautyValues;
    private boolean mBokehEnabled;
    private boolean mCameraAi30Enabled;
    private int mColorEffect;
    private int mContrastLevel;
    private int mDeviceOrientation;
    private boolean mDualCamWaterMarkEnabled = false;
    private boolean mEISEnabled;
    private int mExposureCompensationIndex;
    private int mExposureMeteringMode;
    private long mExposureTime;
    private int mEyeLightType = Integer.parseInt(EyeLightConstant.OFF);
    private String mFNumber;
    private boolean mFaceAgeAnalyzeEnabled;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceScoreEnabled;
    private boolean mFaceWaterMarkEnabled = false;
    private String mFaceWaterMarkFormat = null;
    private int mFlashMode;
    private float mFocusDistance;
    private int mFocusMode;
    private boolean mFrontMirror;
    private Location mGpsLocation;
    private boolean mHDRCheckerEnabled;
    private boolean mHDREnabled;
    private boolean mHHTEnabled;
    private boolean mIsQcfaEnabled = false;
    private int mIso;
    private int mJpegQuality;
    private int mJpegRotation;
    private boolean mLensDirtyDetectEnabled;
    private boolean mMfnrEnabled;
    private boolean mNeedFlash;
    private boolean mNeedPausePreview = true;
    private boolean mNormalWideLDCEnabled;
    private boolean mOISEnabled;
    private boolean mOptimizedFlash;
    private int mPhotoFormat = 256;
    private int mPhotoMaxImages = 2;
    private CameraSize mPhotoSize;
    private int mPortraitLightingPattern;
    private int mPreviewFormat = 35;
    private Range<Integer> mPreviewFpsRange;
    private int mPreviewMaxImages = 1;
    private CameraSize mPreviewSize;
    private boolean mRecordingHintEnabled;
    private int mSaturationLevel;
    private int mSceneMode;
    private int mSharpnessLevel;
    private String mShotPath = null;
    private int mShotType = 0;
    private CameraSize mSubPhotoSize;
    private boolean mSuperResolutionEnabled;
    private boolean mSwMfnrEnabled;
    private CameraSize mThumbnailSize;
    private boolean mTimeWaterMarkEnabled = false;
    private String mTimeWatermarkValue = null;
    private boolean mUltraWideLDCEnabled;
    private Range<Integer> mVideoFpsRange;
    private CameraSize mVideoSize;
    private CameraSize mVideoSnapshotSize;
    private List<String> mWaterMarkAppliedList = new ArrayList();
    private float mZoomRatio = 1.0f;
    private boolean mZslEnabled;

    public boolean setVideoFpsRange(Range<Integer> range) {
        if (Objects.equals(this.mVideoFpsRange, range)) {
            return false;
        }
        this.mVideoFpsRange = range;
        return true;
    }

    public Range<Integer> getVideoFpsRange() {
        return this.mVideoFpsRange;
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mBeautyValues = beautyValues;
    }

    public BeautyValues getBeautyValues() {
        return this.mBeautyValues;
    }

    public boolean setEyeLight(int i) {
        if (this.mEyeLightType == i) {
            return false;
        }
        this.mEyeLightType = i;
        return true;
    }

    public int getEyeLightType() {
        return this.mEyeLightType;
    }

    public boolean setPreviewFpsRange(Range<Integer> range) {
        if (Objects.equals(this.mPreviewFpsRange, range)) {
            return false;
        }
        this.mPreviewFpsRange = range;
        return true;
    }

    public Range<Integer> getPreviewFpsRange() {
        return this.mPreviewFpsRange;
    }

    public boolean setPreviewSize(CameraSize cameraSize) {
        if (Objects.equals(this.mPreviewSize, cameraSize)) {
            return false;
        }
        this.mPreviewSize = cameraSize;
        return true;
    }

    public CameraSize getPreviewSize() {
        return this.mPreviewSize;
    }

    public boolean setPreviewFormat(int i) {
        if (this.mPreviewFormat == i) {
            return false;
        }
        this.mPreviewFormat = i;
        return true;
    }

    public int getPreviewFormat() {
        return this.mPreviewFormat;
    }

    public void setPreviewMaxImages(int i) {
        this.mPreviewMaxImages = i;
    }

    public int getPreviewMaxImages() {
        return this.mPreviewMaxImages;
    }

    public boolean setPhotoSize(CameraSize cameraSize) {
        if (Objects.equals(this.mPhotoSize, cameraSize)) {
            return false;
        }
        this.mPhotoSize = cameraSize;
        return true;
    }

    public CameraSize getPhotoSize() {
        return this.mPhotoSize;
    }

    public boolean setSubPhotoSize(CameraSize cameraSize) {
        if (Objects.equals(this.mSubPhotoSize, cameraSize)) {
            return false;
        }
        this.mSubPhotoSize = cameraSize;
        return true;
    }

    public CameraSize getSubPhotoSize() {
        return this.mSubPhotoSize;
    }

    public boolean setPhotoFormat(int i) {
        if (this.mPhotoFormat == i) {
            return false;
        }
        this.mPhotoFormat = i;
        return true;
    }

    public int getPhotoFormat() {
        return this.mPhotoFormat;
    }

    public void setPhotoMaxImages(int i) {
        this.mPhotoMaxImages = i;
    }

    public int getPhotoMaxImages() {
        return this.mPhotoMaxImages;
    }

    public void setEnableZsl(boolean z) {
        this.mZslEnabled = z;
    }

    public boolean isZslEnabled() {
        return this.mZslEnabled;
    }

    public void setEnableOIS(boolean z) {
        this.mOISEnabled = z;
    }

    public boolean isOISEnabled() {
        return this.mOISEnabled;
    }

    public boolean setJpegQuality(int i) {
        if (i < 1 || i > 100) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setJpegQuality: invalid jpeg quality ");
            stringBuilder.append(i);
            Log.w(str, stringBuilder.toString());
            return false;
        } else if (this.mJpegQuality == i) {
            return false;
        } else {
            this.mJpegQuality = i;
            return true;
        }
    }

    public int getJpegQuality() {
        return this.mJpegQuality;
    }

    public boolean setJpegRotation(int i) {
        if (this.mJpegRotation == i) {
            return false;
        }
        this.mJpegRotation = i;
        return true;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public boolean setDeviceOrientation(int i) {
        if (this.mDeviceOrientation == i) {
            return false;
        }
        this.mDeviceOrientation = i;
        return true;
    }

    public int getDeviceOrientation() {
        return this.mDeviceOrientation;
    }

    public boolean setZoomRatio(float f) {
        if (((double) Math.abs(this.mZoomRatio - f)) <= 0.01d) {
            return false;
        }
        this.mZoomRatio = f;
        return true;
    }

    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    public boolean setAntiBanding(int i) {
        if (this.mAntiBanding == i) {
            return false;
        }
        this.mAntiBanding = i;
        return true;
    }

    public int getAntiBanding() {
        return this.mAntiBanding;
    }

    public boolean setExposureCompensationIndex(int i) {
        if (this.mExposureCompensationIndex == i) {
            return false;
        }
        this.mExposureCompensationIndex = i;
        return true;
    }

    public int getExposureCompensationIndex() {
        return this.mExposureCompensationIndex;
    }

    public boolean setAELock(boolean z) {
        if (this.mAELocked == z) {
            return false;
        }
        this.mAELocked = z;
        return true;
    }

    public boolean isAELocked() {
        return this.mAELocked;
    }

    public boolean setAERegions(MeteringRectangle[] meteringRectangleArr) {
        if (Arrays.equals(this.mAERegions, meteringRectangleArr)) {
            return false;
        }
        this.mAERegions = meteringRectangleArr;
        return true;
    }

    public MeteringRectangle[] getAERegions() {
        return this.mAERegions;
    }

    public boolean setISO(int i) {
        if (this.mIso == i) {
            return false;
        }
        this.mIso = i;
        return true;
    }

    public int getISO() {
        return this.mIso;
    }

    public boolean setExposureTime(long j) {
        if (this.mExposureTime == j) {
            return false;
        }
        this.mExposureTime = j;
        return true;
    }

    public long getExposureTime() {
        return this.mExposureTime;
    }

    public boolean setFlashMode(int i) {
        if (this.mFlashMode == i) {
            return false;
        }
        this.mFlashMode = i;
        return true;
    }

    public int getFlashMode() {
        return this.mFlashMode;
    }

    public boolean setOptimizedFlash(boolean z) {
        if (this.mOptimizedFlash == z) {
            return false;
        }
        this.mOptimizedFlash = z;
        return true;
    }

    public boolean isOptimizedFlash() {
        return this.mOptimizedFlash;
    }

    public boolean setNeedFlash(boolean z) {
        if (this.mNeedFlash == z) {
            return false;
        }
        this.mNeedFlash = z;
        return true;
    }

    public boolean isNeedFlash() {
        return this.mNeedFlash;
    }

    public boolean setFocusMode(int i) {
        if (this.mFocusMode == i) {
            return false;
        }
        this.mFocusMode = i;
        return true;
    }

    public int getFocusMode() {
        return this.mFocusMode;
    }

    public boolean setFocusDistance(float f) {
        if (this.mFocusDistance == f) {
            return false;
        }
        this.mFocusDistance = f;
        return true;
    }

    public float getFocusDistance() {
        return this.mFocusDistance;
    }

    public boolean setAFRegions(MeteringRectangle[] meteringRectangleArr) {
        if (Arrays.equals(this.mAFRegions, meteringRectangleArr)) {
            return false;
        }
        this.mAFRegions = meteringRectangleArr;
        return true;
    }

    public MeteringRectangle[] getAFRegions() {
        return this.mAFRegions;
    }

    public boolean setAWBMode(int i) {
        if (this.mAwbMode == i) {
            return false;
        }
        this.mAwbMode = i;
        return true;
    }

    public int getAWBMode() {
        return this.mAwbMode;
    }

    public boolean setCustomAWB(int i) {
        if (this.mAwbCustomValue == i) {
            return false;
        }
        this.mAwbCustomValue = i;
        return true;
    }

    public int getAwbCustomValue() {
        return this.mAwbCustomValue;
    }

    public boolean setAWBLock(boolean z) {
        if (this.mAWBLocked == z) {
            return false;
        }
        this.mAWBLocked = z;
        return true;
    }

    public boolean isAWBLocked() {
        return this.mAWBLocked;
    }

    public boolean setSceneMode(int i) {
        if (this.mSceneMode == i) {
            return false;
        }
        this.mSceneMode = i;
        return true;
    }

    public int getSceneMode() {
        return this.mSceneMode;
    }

    public boolean setEnableEIS(boolean z) {
        if (this.mEISEnabled == z) {
            return false;
        }
        this.mEISEnabled = z;
        return true;
    }

    public boolean isEISEnabled() {
        return this.mEISEnabled;
    }

    public boolean setRecordingHintEnabled(boolean z) {
        if (this.mRecordingHintEnabled == z) {
            return false;
        }
        this.mRecordingHintEnabled = z;
        return true;
    }

    public boolean isRecordingHintEnabled() {
        return this.mRecordingHintEnabled;
    }

    public boolean setHHTEnabled(boolean z) {
        if (this.mHHTEnabled == z) {
            return false;
        }
        this.mHHTEnabled = z;
        return true;
    }

    public boolean isHHTEnabled() {
        return this.mHHTEnabled;
    }

    public boolean setHDREnabled(boolean z) {
        if (this.mHDREnabled == z) {
            return false;
        }
        this.mHDREnabled = z;
        return true;
    }

    public boolean isHDREnabled() {
        return this.mHDREnabled;
    }

    public boolean setHDRCheckerEnabled(boolean z) {
        if (this.mHDRCheckerEnabled == z) {
            return false;
        }
        this.mHDRCheckerEnabled = z;
        return true;
    }

    public boolean isHDRCheckerEnabled() {
        return this.mHDRCheckerEnabled;
    }

    public boolean setSuperResolutionEnabled(boolean z) {
        if (this.mSuperResolutionEnabled == z) {
            return false;
        }
        this.mSuperResolutionEnabled = z;
        return true;
    }

    public boolean isSuperResolutionEnabled() {
        return this.mSuperResolutionEnabled;
    }

    public int getShotType() {
        return this.mShotType;
    }

    public boolean setShotType(int i) {
        if (this.mShotType == i) {
            return false;
        }
        this.mShotType = i;
        return true;
    }

    public String getShotPath() {
        return this.mShotPath;
    }

    public void setShotPath(String str) {
        this.mShotPath = str;
    }

    public boolean setMfnrEnabled(boolean z) {
        if (this.mMfnrEnabled == z) {
            return false;
        }
        this.mMfnrEnabled = z;
        return true;
    }

    public boolean isMfnrEnabled() {
        return this.mMfnrEnabled;
    }

    public boolean setSwMfnrEnabled(boolean z) {
        if (this.mSwMfnrEnabled == z) {
            return false;
        }
        this.mSwMfnrEnabled = z;
        return true;
    }

    public boolean isSwMfnrEnabled() {
        return this.mSwMfnrEnabled;
    }

    public boolean setBokehEnabled(boolean z) {
        if (this.mBokehEnabled == z) {
            return false;
        }
        this.mBokehEnabled = z;
        return true;
    }

    public boolean isFaceAgeAnalyzeEnabled() {
        return this.mFaceAgeAnalyzeEnabled;
    }

    public boolean setFaceAgeAnalyzeEnabled(boolean z) {
        if (this.mFaceAgeAnalyzeEnabled == z) {
            return false;
        }
        this.mFaceAgeAnalyzeEnabled = z;
        return true;
    }

    public boolean isFaceScoreEnabled() {
        return this.mFaceScoreEnabled;
    }

    public boolean setFaceScoreEnabled(boolean z) {
        if (this.mFaceScoreEnabled == z) {
            return false;
        }
        this.mFaceScoreEnabled = z;
        return true;
    }

    public boolean isBokehEnabled() {
        return this.mBokehEnabled;
    }

    public boolean setLensDirtyDetectEnabled(boolean z) {
        if (this.mLensDirtyDetectEnabled == z) {
            return false;
        }
        this.mLensDirtyDetectEnabled = z;
        return true;
    }

    public boolean isLensDirtyDetectEnabled() {
        return this.mLensDirtyDetectEnabled;
    }

    public boolean setPortraitLightingPattern(int i) {
        if (this.mPortraitLightingPattern == i) {
            return false;
        }
        this.mPortraitLightingPattern = i;
        return true;
    }

    public int getPortraitLightingPattern() {
        return this.mPortraitLightingPattern;
    }

    public boolean setThumbnailSize(CameraSize cameraSize) {
        if (Objects.equals(this.mThumbnailSize, cameraSize)) {
            return false;
        }
        this.mThumbnailSize = cameraSize;
        return true;
    }

    public CameraSize getThumbnailSize() {
        return this.mThumbnailSize;
    }

    public boolean setFaceDetectionEnabled(boolean z) {
        if (this.mFaceDetectionEnabled == z) {
            return false;
        }
        this.mFaceDetectionEnabled = z;
        return true;
    }

    public boolean isFaceDetectionEnabled() {
        return this.mFaceDetectionEnabled;
    }

    public boolean setColorEffect(int i) {
        if (this.mColorEffect == i) {
            return false;
        }
        this.mColorEffect = i;
        return true;
    }

    public int getColorEffect() {
        return this.mColorEffect;
    }

    public boolean setNormalWideLDCEnabled(boolean z) {
        if (this.mNormalWideLDCEnabled == z) {
            return false;
        }
        this.mNormalWideLDCEnabled = z;
        return true;
    }

    public boolean getNormalWideLDCEnabled() {
        return this.mNormalWideLDCEnabled;
    }

    public boolean setUltraWideLDCEnabled(boolean z) {
        if (this.mUltraWideLDCEnabled == z) {
            return false;
        }
        this.mUltraWideLDCEnabled = z;
        return true;
    }

    public boolean getUltraWideLDCEnabled() {
        return this.mUltraWideLDCEnabled;
    }

    public boolean setContrastLevel(int i) {
        if (this.mContrastLevel == i) {
            return false;
        }
        this.mContrastLevel = i;
        return true;
    }

    public int getContrastLevel() {
        return this.mContrastLevel;
    }

    public boolean setSaturationLevel(int i) {
        if (this.mSaturationLevel == i) {
            return false;
        }
        this.mSaturationLevel = i;
        return true;
    }

    public int getSaturationLevel() {
        return this.mSaturationLevel;
    }

    public boolean setSharpnessLevel(int i) {
        if (this.mSharpnessLevel == i) {
            return false;
        }
        this.mSharpnessLevel = i;
        return true;
    }

    public int getSharpnessLevel() {
        return this.mSharpnessLevel;
    }

    public boolean setExposureMeteringMode(int i) {
        if (this.mExposureMeteringMode == i) {
            return false;
        }
        this.mExposureMeteringMode = i;
        return true;
    }

    public int getExposureMeteringMode() {
        return this.mExposureMeteringMode;
    }

    public boolean isAiSceneDetectEnabled() {
        return this.mAiSceneDetectEnabled;
    }

    public boolean setAiSceneDetectEnable(boolean z) {
        if (this.mAiSceneDetectEnabled == z) {
            return false;
        }
        this.mAiSceneDetectEnabled = z;
        return true;
    }

    public int getAiSceneDetectPeriod() {
        return this.mAiSceneDetectPeriod;
    }

    public boolean setAiSceneDetectPeriod(int i) {
        if (this.mAiSceneDetectPeriod == i) {
            return false;
        }
        this.mAiSceneDetectPeriod = i;
        return true;
    }

    public boolean isCameraAi30Enabled() {
        return this.mCameraAi30Enabled;
    }

    public boolean setCameraAi30Enable(boolean z) {
        if (this.mCameraAi30Enabled == z) {
            return false;
        }
        this.mCameraAi30Enabled = z;
        return true;
    }

    public void setGpsLocation(Location location) {
        this.mGpsLocation = location;
    }

    public Location getGpsLocation() {
        return this.mGpsLocation;
    }

    public CameraSize getVideoSize() {
        return this.mVideoSize;
    }

    public void setVideoSize(CameraSize cameraSize) {
        this.mVideoSize = cameraSize;
    }

    public CameraSize getVideoSnapshotSize() {
        return this.mVideoSnapshotSize;
    }

    public void setVideoSnapshotSize(CameraSize cameraSize) {
        this.mVideoSnapshotSize = cameraSize;
    }

    public List<String> getWaterMarkAppliedList() {
        return this.mWaterMarkAppliedList;
    }

    public boolean setDualCamWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "device", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("device");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("device");
        }
        if (this.mDualCamWaterMarkEnabled == z) {
            return false;
        }
        this.mDualCamWaterMarkEnabled = z;
        return true;
    }

    public boolean setTimeWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "watermark", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("watermark");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("watermark");
        }
        if (this.mTimeWaterMarkEnabled == z) {
            return false;
        }
        this.mTimeWaterMarkEnabled = z;
        return true;
    }

    public boolean setFaceWaterMarkEnable(boolean z) {
        boolean isStringValueContained = Util.isStringValueContained((Object) "beautify", this.mWaterMarkAppliedList);
        if (z) {
            if (!isStringValueContained) {
                this.mWaterMarkAppliedList.add("beautify");
            }
        } else if (isStringValueContained) {
            this.mWaterMarkAppliedList.remove("beautify");
        }
        if (this.mFaceWaterMarkEnabled == z) {
            return false;
        }
        this.mFaceWaterMarkEnabled = z;
        return true;
    }

    public void setTimeWaterMarkValue(String str) {
        this.mTimeWatermarkValue = str;
    }

    public String getTimeWaterMarkValue() {
        return this.mTimeWatermarkValue;
    }

    public void setFaceWaterMarkFormat(String str) {
        this.mFaceWaterMarkFormat = str;
    }

    public String getFaceWaterMarkFormat() {
        return this.mFaceWaterMarkFormat;
    }

    public boolean setPausePreview(boolean z) {
        if (this.mNeedPausePreview == z) {
            return false;
        }
        this.mNeedPausePreview = z;
        return true;
    }

    public boolean isNeedPausePreview() {
        return this.mNeedPausePreview;
    }

    public void setFrontMirror(boolean z) {
        this.mFrontMirror = z;
    }

    public boolean isFrontMirror() {
        return this.mFrontMirror;
    }

    public void setQcfaEnable(boolean z) {
        this.mIsQcfaEnabled = z;
    }

    public boolean isQcfaEnable() {
        return this.mIsQcfaEnabled;
    }

    public void setFNumber(String str) {
        this.mFNumber = str;
    }

    public String getFNumber() {
        return this.mFNumber;
    }

    public boolean setASDScene(int i) {
        if (this.mASDScene == i) {
            return false;
        }
        this.mASDScene = i;
        return true;
    }

    public int getASDScene() {
        return this.mASDScene;
    }
}
