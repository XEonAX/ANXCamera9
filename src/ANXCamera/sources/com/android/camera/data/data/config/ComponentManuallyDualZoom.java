package com.android.camera.data.data.config;

import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.oneplus.camera.R;
import java.util.List;

public class ComponentManuallyDualZoom extends ComponentData {
    public ComponentManuallyDualZoom(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_zoom_value_title;
    }

    public String getKey(int i) {
        return "pref_camera_zoom_dual_key";
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }
}
