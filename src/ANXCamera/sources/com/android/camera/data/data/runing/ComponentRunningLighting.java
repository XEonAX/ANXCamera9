package com.android.camera.data.data.runing;

import com.android.camera.CameraSettings;
import com.android.camera.constant.LightingConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningLighting extends ComponentData {
    public ComponentRunningLighting(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int i) {
        return "pref_portrait_lighting";
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            initItems();
        }
        return this.mItems;
    }

    public void initItems() {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_none, R.drawable.ic_lighting_none, R.string.lighting_pattern_null, "0"));
        if (CameraSettings.isBackCamera() || Camera2DataContainer.getInstance().getBokehFrontCameraId() != -1) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_nature, R.drawable.ic_lighting_nature, R.string.lighting_pattern_nature, "1"));
        }
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_stage, R.drawable.ic_lighting_stage, R.string.lighting_pattern_stage, "2"));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_movie, R.drawable.ic_lighting_movie, R.string.lighting_pattern_movie, "3"));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_rainbow, R.drawable.ic_lighting_rainbow, R.string.lighting_pattern_rainbow, "4"));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_shutter, R.drawable.ic_lighting_shutter, R.string.lighting_pattern_shutter, "5"));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_dot, R.drawable.ic_lighting_dot, R.string.lighting_pattern_dot, "6"));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_leaf, R.drawable.ic_lighting_leaf, R.string.lighting_pattern_leaf, LightingConstant.LIGHTING_LEAF));
        if (DataRepository.dataItemFeature().fc()) {
            this.mItems.add(new ComponentDataItem(R.drawable.ic_lighting_holi, R.drawable.ic_lighting_holi, R.string.lighting_pattern_holi, "8"));
        }
    }

    public boolean isSwitchOn(int i) {
        return getComponentValue(i).equals("0") ^ 1;
    }
}
