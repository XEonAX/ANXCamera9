package com.android.camera.fragment.bottom;

import com.android.camera.constant.DurationConstant;

public class BottomAnimationConfig {
    public int mCurrentMode;
    public int mDuration;
    public boolean mIsFPS960;
    public boolean mIsPostProcessing;
    public boolean mIsRecordingCircle;
    public boolean mIsStart;
    public boolean mIsVideoBokeh;
    public boolean mNeedFinishRecord;
    public boolean mShouldRepeat;

    private BottomAnimationConfig(boolean z, int i, boolean z2, boolean z3, boolean z4) {
        this.mIsPostProcessing = z;
        this.mCurrentMode = i;
        this.mIsStart = z2;
        this.mIsFPS960 = z3;
        this.mIsVideoBokeh = z4;
    }

    public static BottomAnimationConfig generate(boolean z, int i, boolean z2, boolean z3, boolean z4) {
        return new BottomAnimationConfig(z, i, z2, z3, z4);
    }

    public BottomAnimationConfig configVariables() {
        if (this.mIsFPS960) {
            this.mDuration = 2000;
        } else if (this.mCurrentMode == 173) {
            this.mDuration = 2000;
        } else if (this.mCurrentMode == 162 && this.mIsVideoBokeh) {
            this.mDuration = 30000;
        } else if (this.mCurrentMode == 161) {
            this.mDuration = 15000;
        } else if (this.mCurrentMode == 174) {
            this.mDuration = 15000;
        } else {
            this.mDuration = DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE;
        }
        boolean z = false;
        boolean z2 = (this.mCurrentMode == 161 || ((this.mCurrentMode == 162 && this.mIsVideoBokeh) || this.mCurrentMode == 173 || this.mIsFPS960)) ? false : true;
        this.mShouldRepeat = z2;
        this.mIsRecordingCircle = this.mCurrentMode == 173;
        if ((this.mCurrentMode == 173 || this.mIsFPS960) && !this.mIsPostProcessing) {
            z = true;
        }
        this.mNeedFinishRecord = z;
        return this;
    }
}
