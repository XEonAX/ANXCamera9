package com.android.camera.data.data.extra;

import com.android.camera.data.data.DataItemBase;

public class DataItemLive extends DataItemBase {
    public static final String DATA_LIVE_ACTIVATION = "live_activation";
    private static final String KEY = "camera_settings_live";

    public void setActivation(String str) {
        editor().putString(DATA_LIVE_ACTIVATION, str).apply();
    }

    public String getActivation() {
        return getString(DATA_LIVE_ACTIVATION, "");
    }

    public String provideKey() {
        return KEY;
    }

    public boolean isTransient() {
        return false;
    }
}
