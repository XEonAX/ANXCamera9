package com.android.camera.data.data.config;

import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigHdr extends ComponentData {
    public static final String HDR_VALUE_AUTO = "auto";
    public static final String HDR_VALUE_LIVE = "live";
    public static final String HDR_VALUE_NORMAL = "normal";
    public static final String HDR_VALUE_OFF = "off";
    public static final String HDR_VALUE_ON = "on";
    private boolean mAutoSupported;
    private boolean mIsClosed;

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public ComponentConfigHdr(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(getConfigHDROffRes(), getConfigHDROffRes(), R.string.pref_camera_hdr_entry_off, "off"));
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_hdr_title;
    }

    public String getKey(int i) {
        if (i != 160) {
            if (i != 162) {
                switch (i) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                    default:
                        return CameraSettings.KEY_CAMERA_HDR;
                }
            }
            return CameraSettings.KEY_VIDEO_HDR;
        }
        throw new RuntimeException("unspecified hdr");
    }

    public String getDefaultValue(int i) {
        if (isClosed()) {
            return "off";
        }
        if (isEmpty()) {
            return "off";
        }
        if (CameraSettings.isFrontCamera()) {
            return "off";
        }
        String fx = DataRepository.dataItemFeature().fx();
        if (!TextUtils.isEmpty(fx)) {
            Object obj = -1;
            int hashCode = fx.hashCode();
            if (hashCode != 3551) {
                if (hashCode != 109935) {
                    if (hashCode == 3005871 && fx.equals("auto")) {
                        obj = null;
                    }
                } else if (fx.equals("off")) {
                    obj = 2;
                }
            } else if (fx.equals("on")) {
                obj = 1;
            }
            switch (obj) {
                case null:
                    return this.mAutoSupported ? "auto" : "off";
                case 1:
                    return "on";
                case 2:
                    return "off";
            }
        }
        if (this.mAutoSupported) {
            return "auto";
        }
        return "off";
    }

    public String getComponentValue(int i) {
        if (isClosed()) {
            return "off";
        }
        if (isEmpty()) {
            return "off";
        }
        return super.getComponentValue(i);
    }

    public String getPersistValue(int i) {
        return super.getComponentValue(i);
    }

    public void setComponentValue(int i, String str) {
        setClosed(false);
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
        this.mAutoSupported = false;
        if (!cameraCapabilities.isSupportHdr()) {
            return this.mItems;
        }
        if (i == 163 || i == 165) {
            this.mItems.add(new ComponentDataItem(getConfigHDROffRes(), getConfigHDROffRes(), R.string.pref_camera_hdr_entry_off, "off"));
            if (cameraCapabilities.isSupportAutoHdr()) {
                this.mAutoSupported = true;
                this.mItems.add(new ComponentDataItem(getConfigHDRAutoRes(), getConfigHDRAutoRes(), R.string.pref_camera_hdr_entry_auto, "auto"));
            }
            if (b.pM || !b.gE()) {
                this.mItems.add(new ComponentDataItem(getConfigHDRNormalRes(), getConfigHDRNormalRes(), R.string.pref_simple_hdr_entry_on, "normal"));
            } else {
                if (!b.IS_MI2A) {
                    this.mItems.add(new ComponentDataItem(getConfigHDRNormalRes(), getConfigHDRNormalRes(), R.string.pref_camera_hdr_entry_normal, "normal"));
                }
                this.mItems.add(new ComponentDataItem(getConfigHDRLiveRes(), getConfigHDRLiveRes(), R.string.pref_camera_hdr_entry_live, HDR_VALUE_LIVE));
            }
        }
        return this.mItems;
    }

    public int getValueSelectedDrawableIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if ("off".equals(componentValue)) {
            return getConfigHDROffRes();
        }
        if ("auto".equals(componentValue)) {
            return getConfigHDRAutoRes();
        }
        if ("normal".equals(componentValue)) {
            return getConfigHDRNormalRes();
        }
        if (HDR_VALUE_LIVE.equals(componentValue)) {
            return getConfigHDRLiveRes();
        }
        if ("on".equals(componentValue)) {
            return getConfigHDRNormalRes();
        }
        return -1;
    }

    private int getConfigHDRLiveRes() {
        return R.drawable.ic_new_config_hdr_live;
    }

    private int getConfigHDRNormalRes() {
        return R.drawable.ic_new_config_hdr_normal;
    }

    private int getConfigHDRAutoRes() {
        return R.drawable.ic_new_config_hdr_auto;
    }

    private int getConfigHDROffRes() {
        return R.drawable.ic_new_config_hdr_off;
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }

    public int getValueSelectedStringIdIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if ("off".equals(componentValue)) {
            return R.string.accessibility_hdr_off;
        }
        if ("auto".equals(componentValue)) {
            return R.string.accessibility_hdr_auto;
        }
        if ("normal".equals(componentValue)) {
            return R.string.accessibility_hdr_on;
        }
        if (HDR_VALUE_LIVE.equals(componentValue)) {
            return R.string.accessibility_hdr_live;
        }
        if ("on".equals(componentValue)) {
            return R.string.accessibility_hdr_on;
        }
        return -1;
    }
}
