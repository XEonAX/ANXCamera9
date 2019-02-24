package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.text.TextUtils;
import android.util.Range;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyET extends ComponentData {
    private static final String TAG = ComponentManuallyET.class.getSimpleName();
    private ComponentDataItem[] mFullItems;

    public ComponentManuallyET(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_manual_exposure_title;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_QC_EXPOSURETIME;
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

    public boolean checkValueValid(String str) {
        if (!TextUtils.isEmpty(str)) {
            for (ComponentDataItem componentDataItem : getFullItems()) {
                if (componentDataItem.mValue.equals(str)) {
                    return true;
                }
            }
        }
        Log.d(TAG, "checkValueValid: invalid value!");
        return false;
    }

    public void resetComponentValue(int i) {
        super.resetComponentValue(i);
        setComponentValue(i, getDefaultValue(i));
    }

    public int getValueDisplayString(int i) {
        String componentValue = getComponentValue(i);
        for (ComponentDataItem componentDataItem : getFullItems()) {
            if (componentDataItem.mValue.equals(componentValue)) {
                return componentDataItem.mDisplayNameRes;
            }
        }
        throw new IllegalArgumentException("invalid value");
    }

    public String getComponentValue(int i) {
        String componentValue = super.getComponentValue(i);
        List items = getItems();
        if (items.isEmpty()) {
            return componentValue;
        }
        String str = ((ComponentDataItem) items.get(items.size() - 1)).mValue;
        if (Long.parseLong(componentValue) <= Long.parseLong(str)) {
            return componentValue;
        }
        setComponentValue(i, str);
        return str;
    }

    @TargetApi(21)
    private List<ComponentDataItem> initItems() {
        List<ComponentDataItem> arrayList = new ArrayList();
        CameraCapabilities currentCameraCapabilities = Camera2DataContainer.getInstance().getCurrentCameraCapabilities();
        if (currentCameraCapabilities == null) {
            return arrayList;
        }
        Range exposureTimeRange = currentCameraCapabilities.getExposureTimeRange();
        ComponentDataItem[] fullItems = getFullItems();
        arrayList.add(fullItems[0]);
        if (exposureTimeRange != null) {
            long longValue = ((Long) exposureTimeRange.getLower()).longValue();
            long longValue2 = ((Long) exposureTimeRange.getUpper()).longValue();
            for (int i = 1; i < fullItems.length; i++) {
                ComponentDataItem componentDataItem = fullItems[i];
                long parseLong = Long.parseLong(componentDataItem.mValue);
                if (longValue <= parseLong && parseLong <= longValue2) {
                    arrayList.add(componentDataItem);
                }
            }
        }
        return arrayList;
    }

    private ComponentDataItem[] getFullItems() {
        if (this.mFullItems != null) {
            return this.mFullItems;
        }
        this.mFullItems = new ComponentDataItem[]{new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_auto, "0"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_1000, "1000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_500, "2000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_250, "4000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_125, "8000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_60, "16667000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_30, "33333000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_15, "66667000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_8, "125000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_4, "250000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_2, "500000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_1, "1000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_0_5, "2000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_4s, "4000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_8s, "8000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_16s, "16000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_32s, "32000000000"), new ComponentDataItem(-1, -1, R.string.pref_camera_exposuretime_entry_64s, "60000000000")};
        return this.mFullItems;
    }
}
