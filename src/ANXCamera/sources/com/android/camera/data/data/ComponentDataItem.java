package com.android.camera.data.data;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;

public final class ComponentDataItem {
    @DrawableRes
    public static final int RES_NULL = -1;
    @StringRes
    public static final int STRING_NULL = -2;
    @StringRes
    public int mDisplayNameRes;
    @DrawableRes
    public int mIconRes;
    @DrawableRes
    public int mIconSelectedRes;
    public String mValue;

    public ComponentDataItem(@DrawableRes int i, @DrawableRes int i2, @StringRes int i3, String str) {
        this.mIconRes = i;
        this.mIconSelectedRes = i2;
        this.mDisplayNameRes = i3;
        this.mValue = str;
    }
}
