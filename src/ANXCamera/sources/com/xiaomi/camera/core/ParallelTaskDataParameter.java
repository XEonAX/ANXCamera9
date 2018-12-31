package com.xiaomi.camera.core;

import android.location.Location;
import android.support.annotation.NonNull;
import android.util.Size;
import com.android.camera.effect.renders.DualWatermarkParam;
import com.android.camera.watermark.WaterMarkData;
import java.util.List;

public class ParallelTaskDataParameter {
    private boolean mAgeGenderAndMagicMirrorWater;
    private String mAlgorithmName;
    private boolean mBokehFrontCamera;
    private DualWatermarkParam mDualWatermarkParam;
    private List<WaterMarkData> mFaceWaterMarkList;
    private int mFilterId;
    private boolean mHasDualWaterMark;
    private boolean mIsFrontCamera;
    private boolean mIsGradienterOn;
    private int mJpegRotation;
    private int mLightingPattern;
    private Location mLocation;
    private boolean mMirror;
    private int mOrientation;
    private Size mOutputSize;
    private PictureInfo mPictureInfo;
    private Size mPictureSize;
    private Size mPreviewSize;
    private boolean mSaveGroupshotPrimitive;
    private int mShootOrientation;
    private float mShootRotation;
    private String mSuffix;
    private String mTiltShiftMode;
    private String mTimeWaterMarkString;

    public static final class Builder {
        private final ParallelTaskDataParameter mParameter;

        public Builder(Size size, Size size2, Size size3) {
            this.mParameter = new ParallelTaskDataParameter(size, size2, size3);
        }

        public Builder(ParallelTaskDataParameter parallelTaskDataParameter) {
            this.mParameter = new ParallelTaskDataParameter();
        }

        @NonNull
        public ParallelTaskDataParameter build() {
            return this.mParameter;
        }

        public Builder setHasDualWaterMark(boolean z) {
            this.mParameter.mHasDualWaterMark = z;
            return this;
        }

        public Builder setMirror(boolean z) {
            this.mParameter.mMirror = z;
            return this;
        }

        public Builder setLightingPattern(int i) {
            this.mParameter.mLightingPattern = i;
            return this;
        }

        public Builder setFilterId(int i) {
            this.mParameter.mFilterId = i;
            return this;
        }

        public Builder setOrientation(int i) {
            this.mParameter.mOrientation = i;
            return this;
        }

        public Builder setJpegRotation(int i) {
            this.mParameter.mJpegRotation = i;
            return this;
        }

        public Builder setShootRotation(float f) {
            this.mParameter.mShootRotation = f;
            return this;
        }

        public Builder setShootOrientation(int i) {
            this.mParameter.mShootOrientation = i;
            return this;
        }

        public Builder setLocation(Location location) {
            this.mParameter.mLocation = location;
            return this;
        }

        public Builder setTimeWaterMarkString(String str) {
            this.mParameter.mTimeWaterMarkString = str;
            return this;
        }

        public Builder setFaceWaterMarkList(List<WaterMarkData> list) {
            this.mParameter.mFaceWaterMarkList = list;
            return this;
        }

        public Builder setAgeGenderAndMagicMirrorWater(boolean z) {
            this.mParameter.mAgeGenderAndMagicMirrorWater = z;
            return this;
        }

        public Builder setFrontCamera(boolean z) {
            this.mParameter.mIsFrontCamera = z;
            return this;
        }

        public Builder setBokehFrontCamera(boolean z) {
            this.mParameter.mBokehFrontCamera = z;
            return this;
        }

        public Builder setAlgorithmName(String str) {
            this.mParameter.mAlgorithmName = str;
            return this;
        }

        public Builder setPictureInfo(PictureInfo pictureInfo) {
            this.mParameter.mPictureInfo = pictureInfo;
            return this;
        }

        public Builder setSuffix(String str) {
            this.mParameter.mSuffix = str;
            return this;
        }

        public Builder setGradienterOn(boolean z) {
            this.mParameter.mIsGradienterOn = z;
            return this;
        }

        public Builder setTiltShiftMode(String str) {
            this.mParameter.mTiltShiftMode = str;
            return this;
        }

        public Builder setSaveGroupshotPrimitive(boolean z) {
            this.mParameter.mSaveGroupshotPrimitive = z;
            return this;
        }

        public Builder setDualWatermarkParam(DualWatermarkParam dualWatermarkParam) {
            this.mParameter.mDualWatermarkParam = dualWatermarkParam;
            return this;
        }
    }

    private ParallelTaskDataParameter(Size size, Size size2, Size size3) {
        this.mPreviewSize = size;
        this.mPictureSize = size2;
        this.mOutputSize = size3;
    }

    private ParallelTaskDataParameter(ParallelTaskDataParameter parallelTaskDataParameter) {
        this.mHasDualWaterMark = parallelTaskDataParameter.mHasDualWaterMark;
        this.mMirror = parallelTaskDataParameter.mMirror;
        this.mLightingPattern = parallelTaskDataParameter.mLightingPattern;
        if (parallelTaskDataParameter.mPreviewSize != null) {
            this.mPreviewSize = new Size(parallelTaskDataParameter.mPreviewSize.getWidth(), parallelTaskDataParameter.mPreviewSize.getHeight());
        }
        if (parallelTaskDataParameter.mPictureSize != null) {
            this.mPictureSize = new Size(parallelTaskDataParameter.mPictureSize.getWidth(), parallelTaskDataParameter.mPictureSize.getHeight());
        }
        this.mFilterId = parallelTaskDataParameter.mFilterId;
        this.mOrientation = parallelTaskDataParameter.mOrientation;
        this.mJpegRotation = parallelTaskDataParameter.mJpegRotation;
        this.mShootRotation = parallelTaskDataParameter.mShootRotation;
        this.mShootOrientation = parallelTaskDataParameter.mShootOrientation;
        if (parallelTaskDataParameter.mLocation != null) {
            this.mLocation = new Location(parallelTaskDataParameter.mLocation);
        }
        this.mTimeWaterMarkString = parallelTaskDataParameter.mTimeWaterMarkString;
        this.mFaceWaterMarkList = parallelTaskDataParameter.mFaceWaterMarkList;
        this.mAgeGenderAndMagicMirrorWater = parallelTaskDataParameter.mAgeGenderAndMagicMirrorWater;
        this.mIsFrontCamera = parallelTaskDataParameter.mIsFrontCamera;
        if (parallelTaskDataParameter.mOutputSize != null) {
            this.mOutputSize = new Size(parallelTaskDataParameter.mOutputSize.getWidth(), parallelTaskDataParameter.mOutputSize.getHeight());
        }
        this.mBokehFrontCamera = parallelTaskDataParameter.mBokehFrontCamera;
        this.mAlgorithmName = parallelTaskDataParameter.mAlgorithmName;
        this.mPictureInfo = parallelTaskDataParameter.mPictureInfo;
        this.mSuffix = parallelTaskDataParameter.mSuffix;
        this.mIsGradienterOn = parallelTaskDataParameter.mIsGradienterOn;
        this.mTiltShiftMode = parallelTaskDataParameter.mTiltShiftMode;
        this.mDualWatermarkParam = parallelTaskDataParameter.mDualWatermarkParam;
    }

    public boolean isHasDualWaterMark() {
        return this.mHasDualWaterMark;
    }

    public int getLightingPattern() {
        return this.mLightingPattern;
    }

    public String getTimeWaterMarkString() {
        return this.mTimeWaterMarkString;
    }

    public Size getPreviewSize() {
        return this.mPreviewSize;
    }

    public Size getPictureSize() {
        return this.mPictureSize;
    }

    public Location getLocation() {
        return this.mLocation;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public int getFilterId() {
        return this.mFilterId;
    }

    public boolean isMirror() {
        return this.mMirror;
    }

    public boolean isBokehFrontCamera() {
        return this.mBokehFrontCamera;
    }

    public float getShootRotation() {
        return this.mShootRotation;
    }

    public int getShootOrientation() {
        return this.mShootOrientation;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public boolean isAgeGenderAndMagicMirrorWater() {
        return this.mAgeGenderAndMagicMirrorWater;
    }

    public List<WaterMarkData> getFaceWaterMarkList() {
        return this.mFaceWaterMarkList;
    }

    public boolean isFrontCamera() {
        return this.mIsFrontCamera;
    }

    public Size getOutputSize() {
        return this.mOutputSize;
    }

    public String getAlgorithmName() {
        return this.mAlgorithmName;
    }

    public PictureInfo getPictureInfo() {
        return this.mPictureInfo;
    }

    public String getSuffix() {
        return this.mSuffix;
    }

    public boolean isGradienterOn() {
        return this.mIsGradienterOn;
    }

    public String getTiltShiftMode() {
        return this.mTiltShiftMode;
    }

    public boolean isSaveGroupshotPrimitive() {
        return this.mSaveGroupshotPrimitive;
    }

    public DualWatermarkParam getDualWatermarkParam() {
        return this.mDualWatermarkParam;
    }
}
