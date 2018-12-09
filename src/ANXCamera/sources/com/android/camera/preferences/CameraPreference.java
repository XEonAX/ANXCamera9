package com.android.camera.preferences;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import com.android.camera.R;

public abstract class CameraPreference {
    protected final Context mContext;
    private SharedPreferences mSharedPreferences;
    private final String mTitle;

    public CameraPreference(Context context, AttributeSet attributeSet) {
        this.mContext = context;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.CameraPreference, 0, 0);
        this.mTitle = obtainStyledAttributes.getString(0);
        obtainStyledAttributes.recycle();
    }

    public String getTitle() {
        return this.mTitle;
    }

    public SharedPreferences getSharedPreferences() {
        if (this.mSharedPreferences == null) {
            this.mSharedPreferences = CameraSettingPreferences.instance();
        }
        return this.mSharedPreferences;
    }
}
