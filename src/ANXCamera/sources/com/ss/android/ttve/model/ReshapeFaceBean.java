package com.ss.android.ttve.model;

import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class ReshapeFaceBean {
    private float mCheekIntensity;
    private float mEyeIntensity;
    private String mResPath;

    public ReshapeFaceBean() {
        this("", PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    public ReshapeFaceBean(String str, float f, float f2) {
        this.mResPath = str;
        this.mEyeIntensity = f;
        this.mCheekIntensity = f2;
    }

    public String getResPath() {
        return this.mResPath;
    }

    public void setResPath(String str) {
        this.mResPath = str;
    }

    public float getEyeIntensity() {
        return this.mEyeIntensity;
    }

    public void setEyeIntensity(float f) {
        this.mEyeIntensity = f;
    }

    public float getCheekIntensity() {
        return this.mCheekIntensity;
    }

    public void setCheekIntensity(float f) {
        this.mCheekIntensity = f;
    }
}
