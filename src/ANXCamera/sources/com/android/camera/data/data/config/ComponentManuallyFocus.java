package com.android.camera.data.data.config;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.android.camera.CameraSettings;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyFocus extends ComponentData {
    public ComponentManuallyFocus(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_qc_focus_position_title;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_QC_FOCUS_POSITION;
    }

    public String getDefaultValue(int i) {
        return "1000";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "1000"));
        arrayList.add(new ComponentDataItem(-1, -1, R.string.pref_camera_focusmode_entry_auto, "manual"));
        return arrayList;
    }

    @StringRes
    public int getValueDisplayString(int i) {
        if (Integer.valueOf(getComponentValue(i)).intValue() == 1000) {
            return R.string.pref_camera_focusmode_entry_auto;
        }
        return -2;
    }

    @DrawableRes
    public int getValueSelectedDrawable(int i) {
        i = Integer.valueOf(getComponentValue(i)).intValue();
        if (i == 1000) {
            return -1;
        }
        double d = (double) i;
        if (d >= 600.0d) {
            return R.drawable.ic_focusmode_macro;
        }
        if (d >= 200.0d) {
            return R.drawable.ic_focusmode_normal;
        }
        return R.drawable.ic_focusmode_infinity;
    }
}
