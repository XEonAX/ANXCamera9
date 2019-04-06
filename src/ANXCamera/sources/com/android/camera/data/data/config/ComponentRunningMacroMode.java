package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.util.SparseArray;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import java.util.List;

public class ComponentRunningMacroMode extends ComponentData {
    public static final String VALUE_OFF = "OFF";
    public static final String VALUE_ON = "ON";
    private SparseArray<Boolean> mCacheValues = new SparseArray();
    public List<ComponentDataItem> mItems;

    public ComponentRunningMacroMode(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    private int getMode(int i) {
        if (165 == i) {
            i = 163;
        }
        return 169 == i ? 162 : i;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "OFF";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public String getKey(int i) {
        return "pref_macro_mode";
    }

    public int getResIcon(boolean z) {
        return z ? R.drawable.ic_eye_light_rainbow : R.drawable.ic_eye_light_off;
    }

    public int getResText() {
        return R.string.pref_camera_recordlocation_entry_on;
    }

    public boolean isCacheSwitchOn(int i) {
        Boolean bool = (Boolean) this.mCacheValues.get(getMode(i));
        return bool == null ? false : bool.booleanValue();
    }

    public boolean isSwitchOn(int i) {
        return isCacheSwitchOn(i);
    }

    public void setSwitchOff(int i) {
        this.mCacheValues.put(getMode(i), Boolean.valueOf(false));
    }

    public void setSwitchOn(int i) {
        this.mCacheValues.put(getMode(i), Boolean.valueOf(true));
    }
}
