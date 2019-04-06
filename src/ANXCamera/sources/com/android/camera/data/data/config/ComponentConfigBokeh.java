package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigBokeh extends ComponentData {
    public static final String BOKEH_VALUE_OFF = "off";
    public static final String BOKEH_VALUE_ON = "on";

    public ComponentConfigBokeh(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    private static List<ComponentDataItem> createItems(int i, int i2) {
        List<ComponentDataItem> arrayList = new ArrayList();
        Object obj = 1;
        if (!(i2 == 1 && DataRepository.dataItemFeature().hv())) {
            obj = null;
        }
        if (obj != null) {
            arrayList.add(new ComponentDataItem(R.drawable.ic_live_record_loading, R.drawable.ic_live_record_loading, R.string.pref_camera_coloreffect_entry_none, "off"));
            arrayList.add(new ComponentDataItem(R.drawable.ic_live_record_loading, R.drawable.ic_live_record_loading, R.string.pref_camera_coloreffect_title, "on"));
        }
        return arrayList;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "off";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_bokeh_key";
    }

    void reInit(int i, int i2) {
        this.mItems = createItems(i, i2);
    }

    public void toggle(int i) {
        if ("on".equals(getComponentValue(i))) {
            setComponentValue(i, "off");
        } else {
            setComponentValue(i, "on");
        }
    }
}
