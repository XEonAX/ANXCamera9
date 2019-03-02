package com.android.camera.data.data.runing;

import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningTimer extends ComponentData {
    public static final String TIMER_0 = "0";
    public static final String TIMER_3 = "3";
    public static final String TIMER_5 = "5";

    public ComponentRunningTimer(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_delay_capture_title;
    }

    public String getKey(int i) {
        return "pref_delay_capture_mode";
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        arrayList.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer, R.string.pref_camera_delay_capture_title, "0"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer_3s, R.string.pref_camera_delay_capture_entry_3s, "3"));
        arrayList.add(new ComponentDataItem(R.drawable.ic_config_timer, R.drawable.ic_config_timer_5s, R.string.pref_camera_delay_capture_entry_5s, "5"));
        return arrayList;
    }

    public boolean isSwitchOn() {
        return getComponentValue(160).equals("0") ^ 1;
    }

    public void switchOff() {
        setComponentValue(160, "0");
    }

    public int getTimer() {
        return Integer.valueOf(getComponentValue(160)).intValue();
    }

    public String getNextValue() {
        String componentValue = getComponentValue(160);
        if ("0".equals(componentValue)) {
            return "3";
        }
        if ("3".equals(componentValue)) {
            return "5";
        }
        if ("5".equals(componentValue)) {
            return "0";
        }
        return "0";
    }
}
