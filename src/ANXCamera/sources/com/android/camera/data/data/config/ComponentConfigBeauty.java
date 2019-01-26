package com.android.camera.data.data.config;

import android.text.TextUtils;
import android.util.SparseBooleanArray;
import com.aeonax.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.log.Log;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class ComponentConfigBeauty extends ComponentData implements BeautyConstant {
    private static final String[] SWITCHABLE_BEAUTY_LEVELS;
    private static final String TAG = ComponentConfigBeauty.class.getSimpleName();
    private static final boolean sIsLegacyFaceBeauty = b.hp();
    private SparseBooleanArray mIsClosed;

    static {
        if (sIsLegacyFaceBeauty) {
            SWITCHABLE_BEAUTY_LEVELS = new String[]{LEVEL_CLOSE, LEVEL_LOW, LEVEL_HIGH};
            return;
        }
        SWITCHABLE_BEAUTY_LEVELS = new String[]{LEVEL_CLOSE, LEVEL_HIGH, LEVEL_XXXHIGH};
    }

    public ComponentConfigBeauty(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_off, R.string.pref_camera_beauty, SWITCHABLE_BEAUTY_LEVELS[0]));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_low, R.string.pref_camera_beauty, SWITCHABLE_BEAUTY_LEVELS[1]));
        this.mItems.add(new ComponentDataItem(R.drawable.ic_config_beauty_off, R.drawable.ic_config_beauty_height, R.string.pref_camera_beauty_deep, SWITCHABLE_BEAUTY_LEVELS[2]));
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public boolean isSwitchOn(int i) {
        return TextUtils.equals(getComponentValue(i), getDefaultValue(i)) ^ 1;
    }

    public String getKey(int i) {
        switch (i) {
            case 161:
            case 162:
                break;
            default:
                switch (i) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                    default:
                        return "pref_camera_face_beauty_key";
                }
        }
        return "pref_video_face_beauty_key";
    }

    public String getDefaultValue(int i) {
        return LEVEL_CLOSE;
    }

    public String getPersistValue(int i) {
        return getComponentValue(i);
    }

    public String getComponentValue(int i) {
        if (isClosed(i)) {
            logd("1: getComponentValue()", i, LEVEL_CLOSE);
            return LEVEL_CLOSE;
        }
        String componentValue = super.getComponentValue(i);
        logd("2: getComponentValue()", i, componentValue);
        if (sIsLegacyFaceBeauty) {
            if (LEVEL_MEDIUM.equals(componentValue)) {
                componentValue = LEVEL_HIGH;
            } else if (LEVEL_XHIGH.equals(componentValue) || LEVEL_XXHIGH.equals(componentValue) || LEVEL_XXXHIGH.equals(componentValue)) {
                componentValue = LEVEL_CLOSE;
            }
        } else if (LEVEL_LOW.equals(componentValue) || LEVEL_MEDIUM.equals(componentValue)) {
            componentValue = LEVEL_HIGH;
        } else if (LEVEL_XHIGH.equals(componentValue) || LEVEL_XXHIGH.equals(componentValue)) {
            componentValue = LEVEL_XXXHIGH;
        }
        logd("3: getComponentValue()", i, componentValue);
        return componentValue;
    }

    public void setComponentValue(int i, String str) {
        setClosed(false, i);
        super.setComponentValue(i, str);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getNextValue(int i) {
        CharSequence componentValue = getComponentValue(i);
        int length = SWITCHABLE_BEAUTY_LEVELS.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (TextUtils.equals(SWITCHABLE_BEAUTY_LEVELS[i2], componentValue)) {
                return SWITCHABLE_BEAUTY_LEVELS[(i2 + 1) % length];
            }
        }
        return getDefaultValue(i);
    }

    public boolean isClosed(int i) {
        if (this.mIsClosed == null) {
            return false;
        }
        return this.mIsClosed.get(i);
    }

    public void setClosed(boolean z, int i) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(i, z);
    }

    public void clearClosed() {
        if (this.mIsClosed != null) {
            this.mIsClosed.clear();
        }
    }

    private static final void logd(String str, int i, String str2) {
        Log.d(TAG, String.format(Locale.ENGLISH, "%s: legacy=%b, mode=%d, value=%s", new Object[]{str, Boolean.valueOf(sIsLegacyFaceBeauty), Integer.valueOf(i), str2}));
    }
}
