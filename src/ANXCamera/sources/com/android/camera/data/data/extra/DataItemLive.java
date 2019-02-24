package com.android.camera.data.data.extra;

import com.android.camera.CameraSettings;
import com.android.camera.data.data.DataItemBase;

public class DataItemLive extends DataItemBase {
    public static final String DATA_LIVE_ACTIVATION = "live_activation";
    public static final String DATA_LIVE_START_ORIENTATION = "live_start_orientation";
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

    public void setLiveFilter(int i) {
        putInt(CameraSettings.KEY_LIVE_FILTER, i);
    }

    public int getLiveFilter() {
        return getInt(CameraSettings.KEY_LIVE_FILTER, 0);
    }

    public void setLiveStartOrientation(int i) {
        putInt(DATA_LIVE_START_ORIENTATION, i);
    }

    public int getLiveStartOrientation() {
        return getInt(DATA_LIVE_START_ORIENTATION, 0);
    }
}
