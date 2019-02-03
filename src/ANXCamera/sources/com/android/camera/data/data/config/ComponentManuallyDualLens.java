package com.android.camera.data.data.config;

import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyDualLens extends ComponentData {
    public static final String LENS_TELE = "tele";
    public static final String LENS_ULTRA = "ultra";
    public static final String LENS_WIDE = "wide";

    public ComponentManuallyDualLens(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_zoom_mode_title;
    }

    public String getKey(int i) {
        if (i != 167) {
            return CameraSettings.KEY_CAMERA_ZOOM_MODE;
        }
        return CameraSettings.KEY_CAMERA_MANUALLY_LENS;
    }

    public String getDefaultValue(int i) {
        return LENS_WIDE;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_wide, LENS_WIDE));
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_tele, LENS_TELE));
        if (b.fx()) {
            arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_zoom_mode_entry_ultra, LENS_ULTRA));
        }
        return arrayList;
    }

    public static String next(String str, int i) {
        if (LENS_WIDE.equals(str)) {
            return LENS_TELE;
        }
        if (b.fx() && LENS_TELE.equals(str) && i == 167) {
            return LENS_ULTRA;
        }
        return LENS_WIDE;
    }
}
