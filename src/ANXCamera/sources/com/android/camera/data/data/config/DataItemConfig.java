package com.android.camera.data.data.config;

import com.android.camera.data.data.DataItemBase;
import com.android.camera2.CameraCapabilities;

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
        this.mComponentFlash.reInit(i, this.mCameraId, cameraCapabilities);
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
    public boolean reConfigFlashIfHdrChanged(int r6, java.lang.String r7) {
        /*
        r5 = this;
        r0 = r5.getComponentFlash();
        r0 = r0.getPersistValue(r6);
        r1 = r7.hashCode();
        r2 = -1039745817; // 0xffffffffc206bce7 float:-33.684475 double:NaN;
        r3 = 1;
        r4 = 0;
        if (r1 == r2) goto L_0x0050;
    L_0x0014:
        r2 = 3551; // 0xddf float:4.976E-42 double:1.7544E-320;
        if (r1 == r2) goto L_0x0046;
    L_0x0018:
        r2 = 109935; // 0x1ad6f float:1.54052E-40 double:5.4315E-319;
        if (r1 == r2) goto L_0x003c;
    L_0x001d:
        r2 = 3005871; // 0x2dddaf float:4.212122E-39 double:1.4850976E-317;
        if (r1 == r2) goto L_0x0032;
    L_0x0022:
        r2 = 3322092; // 0x32b0ec float:4.655242E-39 double:1.6413315E-317;
        if (r1 == r2) goto L_0x0028;
    L_0x0027:
        goto L_0x005a;
    L_0x0028:
        r1 = "live";
        r7 = r7.equals(r1);
        if (r7 == 0) goto L_0x005a;
    L_0x0030:
        r7 = 3;
        goto L_0x005b;
    L_0x0032:
        r1 = "auto";
        r7 = r7.equals(r1);
        if (r7 == 0) goto L_0x005a;
    L_0x003a:
        r7 = r4;
        goto L_0x005b;
    L_0x003c:
        r1 = "off";
        r7 = r7.equals(r1);
        if (r7 == 0) goto L_0x005a;
    L_0x0044:
        r7 = 4;
        goto L_0x005b;
    L_0x0046:
        r1 = "on";
        r7 = r7.equals(r1);
        if (r7 == 0) goto L_0x005a;
    L_0x004e:
        r7 = r3;
        goto L_0x005b;
    L_0x0050:
        r1 = "normal";
        r7 = r7.equals(r1);
        if (r7 == 0) goto L_0x005a;
    L_0x0058:
        r7 = 2;
        goto L_0x005b;
    L_0x005a:
        r7 = -1;
    L_0x005b:
        switch(r7) {
            case 0: goto L_0x006a;
            case 1: goto L_0x005f;
            case 2: goto L_0x005f;
            case 3: goto L_0x005f;
            default: goto L_0x005e;
        };
    L_0x005e:
        goto L_0x0092;
    L_0x005f:
        r7 = "0";
        r7 = r7.equals(r0);
        if (r7 != 0) goto L_0x0092;
    L_0x0067:
        r7 = "0";
        goto L_0x0093;
    L_0x006a:
        r7 = "1";
        r7 = r7.equals(r0);
        if (r7 != 0) goto L_0x0086;
    L_0x0072:
        r7 = "2";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x007b;
    L_0x007a:
        goto L_0x0086;
    L_0x007b:
        r7 = "101";
        r7 = r7.equals(r0);
        if (r7 == 0) goto L_0x0092;
    L_0x0083:
        r7 = "103";
        goto L_0x0093;
    L_0x0086:
        r7 = com.mi.config.b.gj();
        if (r7 == 0) goto L_0x008f;
    L_0x008c:
        r7 = "3";
        goto L_0x0093;
    L_0x008f:
        r7 = "0";
        goto L_0x0093;
    L_0x0092:
        r7 = 0;
    L_0x0093:
        if (r7 == 0) goto L_0x00af;
    L_0x0095:
        r0 = r0.equals(r7);
        if (r0 == 0) goto L_0x009c;
    L_0x009b:
        goto L_0x00af;
    L_0x009c:
        r0 = r5.getComponentFlash();
        r0.setComponentValue(r6, r7);
        r6 = r5.getComponentFlash();
        r6 = r6.isEmpty();
        if (r6 == 0) goto L_0x00ae;
    L_0x00ad:
        return r4;
    L_0x00ae:
        return r3;
    L_0x00af:
        return r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.data.data.config.DataItemConfig.reConfigFlashIfHdrChanged(int, java.lang.String):boolean");
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0072  */
    public boolean reConfigHhrIfFlashChanged(int r3, java.lang.String r4) {
        /*
        r2 = this;
        r0 = r2.getComponentHdr();
        r0 = r0.getPersistValue(r3);
        r1 = "3";
        r1 = r1.equals(r4);
        if (r1 != 0) goto L_0x0051;
    L_0x0011:
        r1 = "103";
        r1 = r1.equals(r4);
        if (r1 == 0) goto L_0x001a;
    L_0x0019:
        goto L_0x0051;
    L_0x001a:
        r1 = "1";
        r1 = r1.equals(r4);
        if (r1 != 0) goto L_0x0046;
    L_0x0022:
        r1 = "101";
        r1 = r1.equals(r4);
        if (r1 == 0) goto L_0x002b;
    L_0x002a:
        goto L_0x0046;
    L_0x002b:
        r1 = "2";
        r4 = r1.equals(r4);
        if (r4 == 0) goto L_0x0062;
    L_0x0033:
        r4 = "live";
        r4 = r4.equals(r0);
        if (r4 != 0) goto L_0x0062;
    L_0x003b:
        r4 = "off";
        r4 = r4.equals(r0);
        if (r4 != 0) goto L_0x0062;
    L_0x0043:
        r4 = "off";
        goto L_0x006f;
    L_0x0046:
        r4 = "off";
        r4 = r4.equals(r0);
        if (r4 != 0) goto L_0x0062;
    L_0x004e:
        r4 = "off";
        goto L_0x006f;
    L_0x0051:
        r4 = "normal";
        r4 = r4.equals(r0);
        if (r4 != 0) goto L_0x0064;
    L_0x0059:
        r4 = "live";
        r4 = r4.equals(r0);
        if (r4 == 0) goto L_0x0062;
    L_0x0061:
        goto L_0x0064;
    L_0x0062:
        r4 = 0;
        goto L_0x006f;
    L_0x0064:
        r4 = com.mi.config.b.gl();
        if (r4 == 0) goto L_0x006d;
    L_0x006a:
        r4 = "auto";
        goto L_0x006f;
    L_0x006d:
        r4 = "off";
    L_0x006f:
        r1 = 0;
        if (r4 == 0) goto L_0x008d;
    L_0x0072:
        r0 = r0.equals(r4);
        if (r0 == 0) goto L_0x0079;
    L_0x0078:
        goto L_0x008d;
    L_0x0079:
        r0 = r2.getComponentHdr();
        r0.setComponentValue(r3, r4);
        r3 = r2.getComponentHdr();
        r3 = r3.isEmpty();
        if (r3 == 0) goto L_0x008b;
    L_0x008a:
        return r1;
    L_0x008b:
        r3 = 1;
        return r3;
    L_0x008d:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.data.data.config.DataItemConfig.reConfigHhrIfFlashChanged(int, java.lang.String):boolean");
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
}
