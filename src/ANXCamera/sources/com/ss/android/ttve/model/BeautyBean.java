package com.ss.android.ttve.model;

import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class BeautyBean {
    private int mBeautyFaceType;
    private String mResPath;
    private float mSmoothIntensity;
    private float mWhiteIntensity;

    public BeautyBean() {
        this(0, "", PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    public BeautyBean(int i, String str, float f, float f2) {
        this.mBeautyFaceType = i;
        this.mResPath = str;
        this.mSmoothIntensity = f;
        this.mWhiteIntensity = f2;
    }

    public void setResPath(String str) {
        this.mResPath = str;
    }

    public String getResPath() {
        return this.mResPath;
    }

    public float getSmoothIntensity() {
        return this.mSmoothIntensity;
    }

    public void setSmoothIntensity(float f) {
        this.mSmoothIntensity = f;
    }

    public float getWhiteIntensity() {
        return this.mWhiteIntensity;
    }

    public void setWhiteIntensity(float f) {
        this.mWhiteIntensity = f;
    }

    public int getType() {
        return this.mBeautyFaceType;
    }

    public void setType(int i) {
        this.mBeautyFaceType = i;
    }
}
