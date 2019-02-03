package com.android.camera.data.data.runing;

import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningTiltValue extends ComponentData {
    public static final String TILT_CIRCLE = "circle";
    public static final String TILT_PARALLEL = "parallel";

    public ComponentRunningTiltValue(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_tilt_shift_title;
    }

    public String getKey(int i) {
        return "pref_camera_tilt_shift_key";
    }

    public String getDefaultValue(int i) {
        return TILT_CIRCLE;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(R.drawable.ic_config_tilt_circle_selected, R.drawable.ic_config_tilt_circle_selected, R.string.pref_camera_tilt_shift_entry_circle, TILT_CIRCLE));
        arrayList.add(new ComponentDataItem(R.drawable.ic_config_tilt_parallel_selected, R.drawable.ic_config_tilt_parallel_selected, R.string.pref_camera_tilt_shift_entry_parallel, TILT_PARALLEL));
        return arrayList;
    }
}
