package com.ss.android.ttve.model;

public class EffectBean {
    private String mResPath;
    private boolean mWithoutFace;

    public EffectBean() {
        this("");
    }

    public EffectBean(String str) {
        this(str, false);
    }

    public EffectBean(String str, boolean z) {
        this.mResPath = str;
        this.mWithoutFace = z;
    }

    public String getResPath() {
        return this.mResPath;
    }

    public void setResPath(String str) {
        this.mResPath = str;
    }

    public boolean isWithoutFace() {
        return this.mWithoutFace;
    }

    public void setWithoutFace(boolean z) {
        this.mWithoutFace = z;
    }
}
