package com.android.camera.module.loader;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class StartControl {
    public static final int RESET_TYPE_RETAIN = 1;
    public static final int RESET_TYPE_SWITCH_CAMERA = 5;
    public static final int RESET_TYPE_SWITCH_INTENT_CHANGED = 6;
    public static final int RESET_TYPE_SWITCH_MODE = 3;
    public static final int RESET_TYPE_TIME_OUT = 2;
    public static final int START_IMMEDIATELY = 0;
    @Deprecated
    public static final int START_WAIT_FOR_TOUCH = 300;
    public static final int VIEW_CONFIG_JUST_CLEAR_NECESSARY = 3;
    public static final int VIEW_CONFIG_SILENT = 1;
    public static final int VIEW_CONFIG_WITH_ANIMATION = 2;
    public boolean mFromScreenSlide = false;
    public boolean mNeedBlurAnimation;
    public boolean mNeedReConfigureCamera = true;
    public boolean mNeedReConfigureData = true;
    public int mResetType = 1;
    public int mStartDelay = 0;
    public int mTargetMode;
    public int mViewConfigType = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ResetType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface StartDelay {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ViewConfigType {
    }

    private StartControl(int i) {
        this.mTargetMode = i;
    }

    public static final StartControl create(int i) {
        return new StartControl(i);
    }

    public StartControl setStartDelay(int i) {
        this.mStartDelay = i;
        return this;
    }

    public StartControl setResetType(int i) {
        this.mResetType = i;
        return this;
    }

    public StartControl setNeedBlurAnimation(boolean z) {
        this.mNeedBlurAnimation = z;
        return this;
    }

    public StartControl setNeedReConfigureCamera(boolean z) {
        this.mNeedReConfigureCamera = z;
        return this;
    }

    public StartControl setNeedReConfigureData(boolean z) {
        this.mNeedReConfigureData = z;
        return this;
    }

    public StartControl setViewConfigType(int i) {
        this.mViewConfigType = i;
        return this;
    }

    public StartControl setFromScreenSlide(boolean z) {
        this.mFromScreenSlide = z;
        return this;
    }

    public boolean needNotifyUI() {
        return this.mViewConfigType != 3;
    }

    public boolean saveWith(StartControl startControl) {
        return this.mTargetMode == startControl.mTargetMode && this.mResetType == startControl.mResetType && this.mNeedReConfigureCamera == startControl.mNeedReConfigureCamera;
    }
}
