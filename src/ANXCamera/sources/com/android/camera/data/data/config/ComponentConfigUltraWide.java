package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.support.annotation.NonNull;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentConfigUltraWide extends ComponentData {
    public static final String ULTRA_WIDE_VALUE_OFF = "OFF";
    public static final String ULTRA_WIDE_VALUE_ON = "ON";
    private int[] mUltraWideResource = getUltraWideResources();

    public ComponentConfigUltraWide(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int i) {
        if (i == 160) {
            throw new RuntimeException("unspecified ultra wide");
        } else if (i == 162 || i == 169) {
            return "pref_ultra_wide_status162";
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(CameraSettings.KEY_CAPTURE_ULTRA_WIDE_MODE);
            stringBuilder.append(i);
            return stringBuilder.toString();
        }
    }

    @NonNull
    public String getDefaultValue(int i) {
        return ULTRA_WIDE_VALUE_OFF;
    }

    public void setComponentValue(int i, String str) {
        super.setComponentValue(i, str);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        boolean fx = DataRepository.dataItemFeature().fx();
        if (i2 != 0 || !fx) {
            return this.mItems;
        }
        if (i != 166) {
            switch (i) {
                case 171:
                case 172:
                    break;
                default:
                    this.mItems.add(new ComponentDataItem(R.drawable.icon_config_ultra_wide_off, R.drawable.icon_config_ultra_wide_off, 0, ULTRA_WIDE_VALUE_OFF));
                    this.mItems.add(new ComponentDataItem(R.drawable.icon_config_ultra_wide_on, R.drawable.icon_config_ultra_wide_on, 0, ULTRA_WIDE_VALUE_ON));
                    return this.mItems;
            }
        }
        return this.mItems;
    }

    public int getValueSelectedDrawableIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if (ULTRA_WIDE_VALUE_ON.equals(componentValue)) {
            return this.mUltraWideResource[1];
        }
        if (ULTRA_WIDE_VALUE_OFF.equals(componentValue)) {
            return this.mUltraWideResource[0];
        }
        return -1;
    }

    public int getValueSelectedStringIdIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if (ULTRA_WIDE_VALUE_ON.equals(componentValue)) {
            return R.string.accessibility_ultra_wide_on;
        }
        if (ULTRA_WIDE_VALUE_OFF.equals(componentValue)) {
            return R.string.accessibility_ultra_wide_off;
        }
        return -1;
    }

    private int[] getUltraWideResources() {
        return new int[]{R.drawable.icon_config_ultra_wide_off, R.drawable.icon_config_ultra_wide_on};
    }

    public boolean isOpenUltrWide(int i) {
        return !isEmpty() && ULTRA_WIDE_VALUE_ON.equals(getComponentValue(i));
    }

    public void resetUltraWide(ProviderEditor providerEditor) {
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(163))) {
            providerEditor.putString(getKey(163), ULTRA_WIDE_VALUE_OFF);
        }
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(161))) {
            providerEditor.putString(getKey(161), ULTRA_WIDE_VALUE_OFF);
        }
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(172))) {
            providerEditor.putString(getKey(172), ULTRA_WIDE_VALUE_OFF);
        }
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(162))) {
            providerEditor.putString(getKey(162), ULTRA_WIDE_VALUE_OFF);
        }
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(173))) {
            providerEditor.putString(getKey(173), ULTRA_WIDE_VALUE_OFF);
        }
        if (!ULTRA_WIDE_VALUE_OFF.equals(getComponentValue(165))) {
            providerEditor.putString(getKey(165), ULTRA_WIDE_VALUE_OFF);
        }
    }
}
