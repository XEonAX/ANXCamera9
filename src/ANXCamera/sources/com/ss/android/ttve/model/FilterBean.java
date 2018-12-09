package com.ss.android.ttve.model;

import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class FilterBean {
    private float mIntensity;
    private String mLeftResPath;
    private float mPosition;
    private String mRightResPath;

    public FilterBean() {
        this("", PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
    }

    public FilterBean(String str, float f) {
        this(str, str, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, f);
    }

    public FilterBean(String str, String str2, float f, float f2) {
        this.mIntensity = f2;
        this.mLeftResPath = str;
        this.mRightResPath = str2;
        this.mPosition = f;
    }

    public String getLeftResPath() {
        return this.mLeftResPath;
    }

    public void setLeftResPath(String str) {
        this.mLeftResPath = str;
    }

    public String getRightResPath() {
        return this.mRightResPath;
    }

    public void setRightResPath(String str) {
        this.mRightResPath = str;
    }

    public float getPosition() {
        return this.mPosition;
    }

    public void setPosition(float f) {
        this.mPosition = f;
    }

    public float getIntensity() {
        return this.mIntensity;
    }

    public void setIntensity(float f) {
        this.mIntensity = f;
    }
}
