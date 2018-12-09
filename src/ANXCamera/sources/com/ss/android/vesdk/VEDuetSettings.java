package com.ss.android.vesdk;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

public final class VEDuetSettings {
    private float mAlpha;
    private String mDuetAudioPath;
    private String mDuetVideoPath;
    private boolean mIsFitMode;
    private float mXInPercent;
    private float mYInPercent;

    public VEDuetSettings(@NonNull String str, @NonNull String str2, float f, float f2, float f3, boolean z) {
        this.mDuetVideoPath = str;
        this.mDuetAudioPath = str2;
        this.mXInPercent = f;
        this.mYInPercent = f2;
        this.mAlpha = f3;
        this.mIsFitMode = z;
    }

    @Nullable
    public String getDuetVideoPath() {
        return this.mDuetVideoPath;
    }

    @Nullable
    public String getDuetAudioPath() {
        return this.mDuetAudioPath;
    }

    public float getXInPercent() {
        return this.mXInPercent;
    }

    public float getYInPercent() {
        return this.mYInPercent;
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public boolean getIsFitMode() {
        return this.mIsFitMode;
    }
}
