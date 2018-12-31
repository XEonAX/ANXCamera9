package com.android.camera.data.data.config;

import com.android.camera.data.data.DataItemBase;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;

public class DataItemConfig extends DataItemBase {
    public static final String DATA_COMMON_AI_SCENE = "pref_camera_ai_scene_mode_key";
    public static final String DATA_CONFIG_BEAUTY = "pref_camera_face_beauty_key";
    public static final String DATA_CONFIG_EYE_LIGHT_TYPE = "pref_eye_light_type_key";
    public static final String DATA_CONFIG_FOCUS_MODE = "pref_camera_focus_mode_key";
    public static final String DATA_CONFIG_FOCUS_SWITCHING = "pref_qc_focus_mode_switching_key";
    public static final String DATA_CONFIG_RATIO = "pref_camera_picturesize_key";
    public static final String DATA_CONFIG_STICKER_PATH = "pref_sticker_path_key";
    public static final String DATA_CONFIG_VIDEO_BEAUTY = "pref_video_face_beauty_key";
    public static final String DATA_CONFIG_VIDEO_BOKEH = "pref_video_bokeh_key";
    public static final String KEY = "camera_settings_simple_mode_local_";
    private int mCameraId;
    private ComponentConfigBeauty mComponentConfigBeauty = new ComponentConfigBeauty(this);
    private ComponentConfigUltraWide mComponentConfigUltraWide;
    private ComponentConfigFlash mComponentFlash = new ComponentConfigFlash(this);
    private ComponentConfigHdr mComponentHdr = new ComponentConfigHdr(this);
    private int mIntentType;
    private ComponentManuallyDualLens mManuallyDualLens;
    private ComponentManuallyFocus mManuallyFocus;
    private ComponentConfigSlowMotion mSlowMotion = new ComponentConfigSlowMotion(this);

    public DataItemConfig(int i, int i2) {
        this.mCameraId = i;
        this.mIntentType = i2;
    }

    public static int provideLocalId(int i, int i2) {
        if (i2 == 0) {
            return i;
        }
        return i + 100;
    }

    public String provideKey() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera_settings_simple_mode_local_");
        stringBuilder.append(provideLocalId(this.mCameraId, this.mIntentType));
        return stringBuilder.toString();
    }

    public boolean isTransient() {
        return false;
    }

    public void reInitComponent(int i, CameraCapabilities cameraCapabilities) {
        getComponentConfigUltraWide().reInit(i, this.mCameraId, cameraCapabilities);
        this.mComponentFlash.reInit(i, this.mCameraId, cameraCapabilities, getComponentConfigUltraWide());
        this.mComponentHdr.reInit(i, this.mCameraId, cameraCapabilities);
    }

    public ComponentConfigFlash getComponentFlash() {
        return this.mComponentFlash;
    }

    public ComponentConfigHdr getComponentHdr() {
        return this.mComponentHdr;
    }

    public ComponentConfigBeauty getComponentConfigBeauty() {
        return this.mComponentConfigBeauty;
    }

    public ComponentConfigSlowMotion getComponentConfigSlowMotion() {
        return this.mSlowMotion;
    }

    public ComponentManuallyFocus getManuallyFocus() {
        if (this.mManuallyFocus == null) {
            this.mManuallyFocus = new ComponentManuallyFocus(this);
        }
        return this.mManuallyFocus;
    }

    public ComponentManuallyDualLens getManuallyDualLens() {
        if (this.mManuallyDualLens == null) {
            this.mManuallyDualLens = new ComponentManuallyDualLens(this);
        }
        return this.mManuallyDualLens;
    }

    public boolean supportFlash() {
        return this.mComponentFlash.isEmpty() ^ 1;
    }

    public boolean supportHdr() {
        return this.mComponentHdr.isEmpty() ^ 1;
    }

    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A:{FALL_THROUGH} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A:{FALL_THROUGH} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0095  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A:{FALL_THROUGH} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0095  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A:{FALL_THROUGH} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0095  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A:{FALL_THROUGH} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0095  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean reConfigFlashIfHdrChanged(int i, String str) {
        boolean z;
        String persistValue = getComponentFlash().getPersistValue(i);
        int hashCode = str.hashCode();
        if (hashCode != -1039745817) {
            if (hashCode != 3551) {
                if (hashCode != 109935) {
                    if (hashCode != 3005871) {
                        if (hashCode == 3322092 && str.equals(ComponentConfigHdr.HDR_VALUE_LIVE)) {
                            z = true;
                            switch (z) {
                                case false:
                                    if (!"1".equals(persistValue) && !"2".equals(persistValue)) {
                                        if (ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(persistValue)) {
                                            str = ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO;
                                            break;
                                        }
                                    } else if (!b.gm()) {
                                        str = "0";
                                        break;
                                    } else {
                                        str = "3";
                                        break;
                                    }
                                    break;
                                case true:
                                case true:
                                case true:
                                    if (!"0".equals(persistValue)) {
                                        str = "0";
                                        break;
                                    }
                                default:
                                    str = null;
                                    break;
                            }
                            if (str != null || persistValue.equals(str)) {
                                return false;
                            }
                            getComponentFlash().setComponentValue(i, str);
                            return !getComponentFlash().isEmpty();
                        }
                    } else if (str.equals("auto")) {
                        z = false;
                        switch (z) {
                            case false:
                                break;
                            case true:
                            case true:
                            case true:
                                break;
                            default:
                                break;
                        }
                        if (str != null) {
                        }
                        return false;
                    }
                } else if (str.equals("off")) {
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                        case true:
                        case true:
                            break;
                        default:
                            break;
                    }
                    if (str != null) {
                    }
                    return false;
                }
            } else if (str.equals("on")) {
                z = true;
                switch (z) {
                    case false:
                        break;
                    case true:
                    case true:
                    case true:
                        break;
                    default:
                        break;
                }
                if (str != null) {
                }
                return false;
            }
        } else if (str.equals("normal")) {
            z = true;
            switch (z) {
                case false:
                    break;
                case true:
                case true:
                case true:
                    break;
                default:
                    break;
            }
            if (str != null) {
            }
            return false;
        }
        z = true;
        switch (z) {
            case false:
                break;
            case true:
            case true:
            case true:
                break;
            default:
                break;
        }
        if (str != null) {
        }
        return false;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0072  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean reConfigHhrIfFlashChanged(int i, String str) {
        String persistValue = getComponentHdr().getPersistValue(i);
        if ("3".equals(str) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(str)) {
            if ("normal".equals(persistValue) || ComponentConfigHdr.HDR_VALUE_LIVE.equals(persistValue)) {
                str = b.go() ? "auto" : "off";
                if (str != null || persistValue.equals(str)) {
                    return false;
                }
                getComponentHdr().setComponentValue(i, str);
                if (getComponentHdr().isEmpty()) {
                    return false;
                }
                return true;
            }
        } else if ("1".equals(str) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(str)) {
            if (!"off".equals(persistValue)) {
                str = "off";
                if (str != null) {
                }
                return false;
            }
        } else if (!(!"2".equals(str) || ComponentConfigHdr.HDR_VALUE_LIVE.equals(persistValue) || "off".equals(persistValue))) {
            str = "off";
            if (str != null) {
            }
            return false;
        }
        str = null;
        if (str != null) {
        }
        return false;
    }

    public void resetAll() {
        editor().clear().apply();
        getComponentFlash().clearClosed();
        getComponentHdr().clearClosed();
        getComponentConfigBeauty().clearClosed();
    }

    public boolean isSwitchOn(String str) {
        return getBoolean(str, false);
    }

    public boolean triggerSwitchAndGet(String str) {
        if (isSwitchOn(str)) {
            switchOff(str);
            return false;
        }
        switchOn(str);
        return true;
    }

    public void switchOn(String str) {
        putBoolean(str, true);
    }

    public void switchOff(String str) {
        putBoolean(str, false);
    }

    public ComponentConfigUltraWide getComponentConfigUltraWide() {
        if (this.mComponentConfigUltraWide == null) {
            this.mComponentConfigUltraWide = new ComponentConfigUltraWide(this);
        }
        return this.mComponentConfigUltraWide;
    }
}
