package com.android.camera.data.data.config;

import android.annotation.TargetApi;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

@TargetApi(21)
public class ComponentConfigFlash extends ComponentData {
    public static final String FLASH_VALUE_AUTO = "3";
    public static final String FLASH_VALUE_OFF = "0";
    public static final String FLASH_VALUE_ON = "1";
    public static final String FLASH_VALUE_SCREEN_LIGHT_AUTO = "103";
    public static final String FLASH_VALUE_SCREEN_LIGHT_ON = "101";
    public static final String FLASH_VALUE_TORCH = "2";
    private SparseArray<String> mFlashValuesForSceneMode;
    private boolean mIsClosed;

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public ComponentConfigFlash(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
        this.mFlashValuesForSceneMode = new SparseArray();
        this.mItems = new ArrayList();
        this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_flashmode_title;
    }

    public String getKey(int i) {
        if (!(i == 172 || i == 174)) {
            switch (i) {
                case 160:
                    throw new RuntimeException("unspecified flash");
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
                            return CameraSettings.KEY_FLASH_MODE;
                    }
            }
        }
        return CameraSettings.KEY_VIDEOCAMERA_FLASH_MODE;
    }

    public String getDefaultValue(int i) {
        return "0";
    }

    public String getComponentValue(int i) {
        if (isClosed()) {
            return "0";
        }
        if (isEmpty()) {
            return "0";
        }
        return getComponentValueInternal(i);
    }

    public boolean disableUpdate() {
        return ThermalDetector.getInstance().thermalConstrained();
    }

    public int getDisableReasonString() {
        if (CameraSettings.isFrontCamera()) {
            return R.string.close_front_flash_toast;
        }
        return R.string.close_back_flash_toast;
    }

    private String getComponentValueInternal(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key")) {
            Object flashModeByScene = CameraSettings.getFlashModeByScene(dataItemRunning.getComponentRunningSceneValue().getComponentValue(i));
            if (!TextUtils.isEmpty(flashModeByScene)) {
                return flashModeByScene;
            }
        }
        return super.getComponentValue(i);
    }

    public void setSceneModeFlashValue(int i, String str) {
        this.mFlashValuesForSceneMode.put(i, str);
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

    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities, ComponentConfigUltraWide componentConfigUltraWide) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if ((i == 166 || i == 171 || i == 173) && i2 == 0) {
            return this.mItems;
        }
        if (cameraCapabilities.isFlashSupported()) {
            this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
            if (!(i == 172 || i == 174)) {
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
                                this.mItems.add(new ComponentDataItem(getFlashAutoRes(), getFlashAutoRes(), R.string.pref_camera_flashmode_entry_auto, "3"));
                                if (CameraSettings.isBackCamera()) {
                                    this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "1"));
                                }
                                if (!CameraSettings.isFrontCamera() || !b.hq()) {
                                    if (b.gy()) {
                                        this.mItems.add(new ComponentDataItem(getFlashTorchRes(), getFlashTorchRes(), R.string.pref_camera_flashmode_entry_torch, "2"));
                                        break;
                                    }
                                }
                                this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, "2"));
                                break;
                                break;
                        }
                }
            }
            this.mItems.add(new ComponentDataItem(getFlashTorchRes(), getFlashTorchRes(), R.string.pref_camera_flashmode_entry_torch, "2"));
            return this.mItems;
        }
        if (i2 == 1 && b.hw() && (i == 163 || i == 165 || i == 171)) {
            this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
            this.mItems.add(new ComponentDataItem(getFlashAutoRes(), getFlashAutoRes(), R.string.pref_camera_flashmode_entry_auto, FLASH_VALUE_SCREEN_LIGHT_AUTO));
            this.mItems.add(new ComponentDataItem(getFlashOnRes(), getFlashOnRes(), R.string.pref_camera_flashmode_entry_on, FLASH_VALUE_SCREEN_LIGHT_ON));
        }
        if (componentConfigUltraWide.isOpenUltrWide(i)) {
            this.mItems.add(new ComponentDataItem(getFlashOffRes(), getFlashOffRes(), R.string.pref_camera_flashmode_entry_off, "0"));
        }
        return this.mItems;
    }

    public int getValueSelectedDrawableIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        if ("1".equals(componentValue)) {
            return getFlashOnRes();
        }
        if ("3".equals(componentValue)) {
            return getFlashAutoRes();
        }
        if ("0".equals(componentValue)) {
            return getFlashOffRes();
        }
        if ("2".equals(componentValue)) {
            return CameraSettings.isFrontCamera() ? getFlashOnRes() : getFlashTorchRes();
        } else if (FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
            return getFlashAutoRes();
        } else {
            if (FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                return getFlashOnRes();
            }
            return -1;
        }
    }

    private int getFlashOnRes() {
        return R.drawable.ic_new_config_flash_on;
    }

    private int getFlashOffRes() {
        return R.drawable.ic_new_config_flash_off;
    }

    private int getFlashAutoRes() {
        return R.drawable.ic_new_config_flash_auto;
    }

    private int getFlashTorchRes() {
        return R.drawable.ic_new_config_flash_torch;
    }

    public void clearClosed() {
        this.mIsClosed = false;
    }

    public int getValueSelectedStringIdIgnoreClose(int i) {
        String componentValue = getComponentValue(i);
        boolean equals = "1".equals(componentValue);
        int i2 = R.string.accessibility_flash_on;
        if (equals) {
            return R.string.accessibility_flash_on;
        }
        if ("3".equals(componentValue)) {
            return R.string.accessibility_flash_auto;
        }
        if ("0".equals(componentValue)) {
            return R.string.accessibility_flash_off;
        }
        if ("2".equals(componentValue)) {
            if (!CameraSettings.isFrontCamera()) {
                i2 = R.string.accessibility_flash_torch;
            }
            return i2;
        } else if (FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
            return R.string.accessibility_flash_auto;
        } else {
            if (FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                return R.string.accessibility_flash_on;
            }
            return -1;
        }
    }

    public boolean isValidFlashValue(String str) {
        return str.matches("^[0-9]+$");
    }
}
