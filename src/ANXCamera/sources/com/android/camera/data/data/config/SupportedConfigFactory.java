package com.android.camera.data.data.config;

import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;

public class SupportedConfigFactory {
    public static final int AI_DETECT = 242;
    public static final int AI_SCENE = 201;
    public static final int BACKLIGHT = 249;
    public static final int BEAUTY = 239;
    public static final String CLOSE_BY_AI = "e";
    public static final String CLOSE_BY_BURST_SHOOT = "d";
    public static final String CLOSE_BY_GROUP = "b";
    public static final String CLOSE_BY_HDR = "g";
    public static final String CLOSE_BY_HHT = "a";
    public static final String CLOSE_BY_SUPER_RESOLUTION = "c";
    public static final String CLOSE_BY_VIDEO = "h";
    public static final int DUAL_WATER_MARK = 240;
    public static final int FAST = 233;
    public static final int FILTER = 196;
    public static final int FLASH = 193;
    public static final int FOCUS_PEAK = 199;
    public static final int GENDER_AGE = 238;
    public static final int GRADIENTER = 229;
    public static final int GROUP = 235;
    public static final int HDR = 194;
    public static final int HFR = 202;
    public static final int HHT = 230;
    public static final int INVALID = 198;
    public static final int LIGHTING = 203;
    public static final int LIVE_MUSIC_SELECT = 245;
    public static final int LIVE_SHOT = 206;
    public static final int MAGIC_FOCUS = 231;
    public static final int MAGIC_MIRROR = 236;
    public static final int MOON = 246;
    public static final int MORE = 197;
    public static final int[] MUTEX_MENU_CONFIGS = new int[]{229, 236, 235, 228, 230, 241, 234, 195, 238, 199, 203, 206};
    public static final int NEW_SLOW_MOTION = 204;
    public static final int NIGHT = 247;
    public static final int PORTRAIT = 195;
    public static final int RAW = 237;
    public static final int SCENE = 234;
    public static final int SETTING = 225;
    public static final int SILHOUETTE = 248;
    public static final int SLOW = 232;
    public static final int SUPER_RESOLUTION = 241;
    public static final int TILT = 228;
    public static final int TIMER = 226;
    public static final int ULTRA_PIXEL_PHOTOGRAPHY = 209;
    public static final int ULTRA_WIDE = 205;
    public static final int ULTRA_WIDE_BOKEH = 207;
    public static final int USER_DEFINE_WATER_MARK = 244;
    public static final int VIDEO_BOKEH = 243;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CloseElementTrigger {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConfigItem {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface MutexElement {
    }

    public static boolean isMutexConfig(int i) {
        for (int i2 : MUTEX_MENU_CONFIGS) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    public static String getConfigKey(int i) {
        if (i == 195) {
            return "pref_camera_portrait_mode_key";
        }
        if (i == 199) {
            return "pref_camera_peak_key";
        }
        if (i == 201) {
            return "pref_camera_ai_scene_mode_key";
        }
        if (i == 206) {
            return "pref_live_shot_enabled";
        }
        if (i == 238) {
            return "pref_camera_show_gender_age_key";
        }
        if (i == 241) {
            return "pref_camera_super_resolution_key";
        }
        switch (i) {
            case 228:
                return "pref_camera_tilt_shift_mode";
            case 229:
                return "pref_camera_gradienter_key";
            case 230:
                return "pref_camera_hand_night_key";
            default:
                switch (i) {
                    case 234:
                        return "pref_camera_scenemode_setting_key";
                    case 235:
                        return "pref_camera_groupshot_mode_key";
                    case 236:
                        return "pref_camera_magic_mirror_key";
                    default:
                        throw new RuntimeException("unknown config item");
                }
        }
    }

    public static final SupportedConfigs getSupportedTopConfigs(int i, DataItemConfig dataItemConfig, int i2, CameraCapabilities cameraCapabilities, boolean z) {
        int i3 = i;
        int i4 = i2;
        dataItemConfig.reInitComponent(i3, cameraCapabilities);
        List arrayList = new ArrayList();
        if (dataItemConfig.supportFlash()) {
            arrayList.add(getConfigItem(193));
        } else if (DataRepository.dataItemFeature().fu() && CameraSettings.isUltraWideConfigOpen()) {
            TopConfigItem configItem = getConfigItem(193);
            configItem.enable = false;
            arrayList.add(configItem);
        }
        boolean fu = DataRepository.dataItemFeature().fu();
        boolean fy = DataRepository.dataItemFeature().fy();
        switch (i3) {
            case 161:
                if (fu && i4 == 0) {
                    arrayList.add(getConfigItem(205));
                }
                if (z && i4 != 0 && DataRepository.dataItemFeature().fb()) {
                    arrayList.add(getConfigItem(243));
                }
                if (!Util.UI_DEBUG()) {
                    if (i4 == 1) {
                        arrayList.add(getConfigItem(196, 17));
                    } else {
                        arrayList.add(getConfigItem(196));
                    }
                }
                if (i4 != 0 || !cameraCapabilities.isSupportVideoBeauty()) {
                    arrayList.add(getConfigItem(225));
                    break;
                }
                arrayList.add(getConfigItem(197));
                break;
                break;
            case 162:
            case 168:
            case 169:
            case 170:
                if (i4 == 0) {
                    if (!z) {
                        arrayList.add(getConfigItem(225));
                        break;
                    }
                    if (dataItemConfig.supportHdr()) {
                        arrayList.add(getConfigItem(194));
                    }
                    if (!DataRepository.dataItemFeature().fp() && b.ge() && b.hx()) {
                        arrayList.add(getConfigItem(202));
                    }
                    if (fu) {
                        arrayList.add(getConfigItem(205));
                    }
                    arrayList.add(getConfigItem(197));
                    break;
                }
                if (z && i3 == 162 && DataRepository.dataItemFeature().fb()) {
                    arrayList.add(getConfigItem(243));
                }
                arrayList.add(getConfigItem(225));
                break;
            case 165:
                if (dataItemConfig.supportHdr()) {
                    arrayList.add(getConfigItem(194));
                }
                if ((b.gn() && i4 == 0) || (DataRepository.dataItemFeature().eZ() && i4 == 1)) {
                    arrayList.add(getConfigItem(201));
                }
                if (fu && i4 == 0) {
                    arrayList.add(getConfigItem(205));
                }
                if (!Util.UI_DEBUG()) {
                    arrayList.add(getConfigItem(196));
                }
                arrayList.add(getConfigItem(197));
                break;
            case 166:
                arrayList.clear();
                arrayList.add(getConfigItem(225));
                break;
            case 167:
                ComponentManuallyFocus manuallyFocus = dataItemConfig.getManuallyFocus();
                if (b.gC() && !manuallyFocus.getComponentValue(i3).equals(manuallyFocus.getDefaultValue(i3))) {
                    arrayList.add(getConfigItem(199));
                }
                if (cameraCapabilities.isUltraPixelPhotographySupported()) {
                    arrayList.add(getConfigItem(209));
                }
                if (!Util.UI_DEBUG()) {
                    arrayList.add(getConfigItem(196));
                }
                arrayList.add(getConfigItem(197));
                break;
            case 171:
                if (z && cameraCapabilities.isSupportPortraitLighting()) {
                    if (i4 == 0) {
                        if (DataRepository.dataItemFeature().eX()) {
                            arrayList.add(getConfigItem(203));
                        }
                    } else if (i4 == 1 && DataRepository.dataItemFeature().eY()) {
                        arrayList.add(getConfigItem(203));
                    }
                }
                if (DataRepository.dataItemFeature().fa() && (i4 == 0 || (DataRepository.dataItemFeature().eZ() && i4 == 1))) {
                    arrayList.add(getConfigItem(201));
                }
                if (DataRepository.dataItemFeature().fu() && i4 == 0) {
                    arrayList.add(getConfigItem(207));
                }
                if (!Util.UI_DEBUG()) {
                    arrayList.add(getConfigItem(196, 17));
                }
                arrayList.add(getConfigItem(197));
                break;
            case 172:
                arrayList.add(getConfigItem(204));
                arrayList.add(getConfigItem(225));
                break;
            case 173:
                if (fu) {
                    arrayList.add(getConfigItem(205, 1));
                }
                arrayList.add(getConfigItem(225));
                break;
            case 174:
                if (fu && i4 == 0) {
                    arrayList.add(getConfigItem(205));
                }
                if (z && i4 != 0 && DataRepository.dataItemFeature().fb()) {
                    arrayList.add(getConfigItem(243));
                }
                arrayList.add(getConfigItem(245));
                if (!Util.UI_DEBUG()) {
                    if (i4 == 1) {
                        arrayList.add(getConfigItem(196, 17));
                    } else {
                        arrayList.add(getConfigItem(196));
                    }
                }
                if (i4 != 0 || !cameraCapabilities.isSupportVideoBeauty()) {
                    arrayList.add(getConfigItem(225));
                    break;
                }
                arrayList.add(getConfigItem(197));
                break;
                break;
            default:
                if (dataItemConfig.supportHdr()) {
                    arrayList.add(getConfigItem(194));
                }
                if ((b.gn() && i4 == 0) || (DataRepository.dataItemFeature().eZ() && i4 == 1)) {
                    arrayList.add(getConfigItem(201));
                }
                if (fu && i4 != 1) {
                    arrayList.add(getConfigItem(205));
                }
                if (fy && z) {
                    arrayList.add(getConfigItem(206));
                }
                if (!Util.UI_DEBUG()) {
                    arrayList.add(getConfigItem(196));
                }
                arrayList.add(getConfigItem(197));
                break;
        }
        TopViewPositionArray.fillNotUseViewPosition(arrayList);
        SupportedConfigs supportedConfigs = new SupportedConfigs();
        supportedConfigs.add(arrayList);
        return supportedConfigs;
    }

    private static TopConfigItem getConfigItem(int i, int i2) {
        return new TopConfigItem(i, i2);
    }

    private static TopConfigItem getConfigItem(int i) {
        return new TopConfigItem(i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:68:0x00f3  */
    public static final com.android.camera.data.data.config.SupportedConfigs getSupportedExtraConfigs(int r6, int r7, com.android.camera.data.cloud.DataCloud.CloudFeature r8, com.android.camera2.CameraCapabilities r9, boolean r10) {
        /*
        r0 = new com.android.camera.data.data.config.SupportedConfigs;
        r0.<init>();
        r1 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        r2 = 239; // 0xef float:3.35E-43 double:1.18E-321;
        r3 = 225; // 0xe1 float:3.15E-43 double:1.11E-321;
        if (r6 == r1) goto L_0x0121;
    L_0x000d:
        switch(r6) {
            case 161: goto L_0x0121;
            case 162: goto L_0x00f0;
            default: goto L_0x0010;
        };
    L_0x0010:
        r1 = 236; // 0xec float:3.31E-43 double:1.166E-321;
        r4 = 238; // 0xee float:3.34E-43 double:1.176E-321;
        r5 = 226; // 0xe2 float:3.17E-43 double:1.117E-321;
        switch(r6) {
            case 167: goto L_0x00e8;
            case 168: goto L_0x00f0;
            case 169: goto L_0x00f0;
            case 170: goto L_0x00f0;
            case 171: goto L_0x00a7;
            default: goto L_0x0019;
        };
    L_0x0019:
        r9 = r0.add(r3);
        r9.add(r5);
        r9 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        r3 = 235; // 0xeb float:3.3E-43 double:1.16E-321;
        r5 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        switch(r7) {
            case 0: goto L_0x0053;
            case 1: goto L_0x002b;
            default: goto L_0x0029;
        };
    L_0x0029:
        goto L_0x00a5;
    L_0x002b:
        r7 = com.mi.config.b.hg();
        if (r7 == 0) goto L_0x0036;
    L_0x0031:
        if (r6 == r5) goto L_0x0036;
    L_0x0033:
        r0.add(r3);
    L_0x0036:
        if (r6 == r5) goto L_0x003a;
    L_0x0038:
        if (r6 != r9) goto L_0x00a5;
    L_0x003a:
        r6 = com.mi.config.b.fN();
        if (r6 == 0) goto L_0x0049;
    L_0x0040:
        r6 = com.mi.config.b.fM();
        if (r6 == 0) goto L_0x0049;
    L_0x0046:
        r0.add(r4);
    L_0x0049:
        r6 = com.mi.config.b.gS();
        if (r6 == 0) goto L_0x00a5;
    L_0x004f:
        r0.add(r1);
        goto L_0x00a5;
    L_0x0053:
        r7 = com.mi.config.b.gN();
        if (r7 == 0) goto L_0x005e;
    L_0x0059:
        r7 = 228; // 0xe4 float:3.2E-43 double:1.126E-321;
        r0.add(r7);
    L_0x005e:
        r7 = com.mi.config.b.gG();
        if (r7 == 0) goto L_0x0069;
    L_0x0064:
        r7 = 229; // 0xe5 float:3.21E-43 double:1.13E-321;
        r0.add(r7);
    L_0x0069:
        r7 = com.mi.config.b.gm();
        if (r7 == 0) goto L_0x0074;
    L_0x006f:
        r7 = 234; // 0xea float:3.28E-43 double:1.156E-321;
        r0.add(r7);
    L_0x0074:
        if (r6 == r5) goto L_0x0081;
    L_0x0076:
        if (r10 == 0) goto L_0x0081;
    L_0x0078:
        r7 = com.mi.config.b.hg();
        if (r7 == 0) goto L_0x0081;
    L_0x007e:
        r0.add(r3);
    L_0x0081:
        r7 = com.android.camera.Util.UI_DEBUG();
        if (r7 != 0) goto L_0x0094;
    L_0x0087:
        if (r6 == r5) goto L_0x008b;
    L_0x0089:
        if (r6 != r9) goto L_0x0094;
    L_0x008b:
        r6 = com.mi.config.b.fM();
        if (r6 == 0) goto L_0x0094;
    L_0x0091:
        r0.add(r2);
    L_0x0094:
        if (r10 == 0) goto L_0x00a5;
    L_0x0096:
        r6 = com.android.camera.CameraAppImpl.getAndroidContext();
        r6 = com.android.camera.CameraSettings.checkLensAvailability(r6);
        if (r6 == 0) goto L_0x00a5;
    L_0x00a0:
        r6 = 242; // 0xf2 float:3.39E-43 double:1.196E-321;
        r0.add(r6);
    L_0x00a5:
        goto L_0x0135;
    L_0x00a7:
        r6 = r0.add(r3);
        r6.add(r5);
        r6 = 1;
        if (r7 != r6) goto L_0x00d0;
    L_0x00b1:
        r6 = com.mi.config.b.hb();
        if (r6 == 0) goto L_0x00d0;
    L_0x00b7:
        r6 = com.mi.config.b.fN();
        if (r6 == 0) goto L_0x00c6;
    L_0x00bd:
        r6 = com.mi.config.b.fM();
        if (r6 == 0) goto L_0x00c6;
    L_0x00c3:
        r0.add(r4);
    L_0x00c6:
        r6 = com.mi.config.b.gS();
        if (r6 == 0) goto L_0x0135;
    L_0x00cc:
        r0.add(r1);
        goto L_0x0135;
    L_0x00d0:
        if (r7 != 0) goto L_0x0135;
    L_0x00d2:
        r6 = com.android.camera.Util.UI_DEBUG();
        if (r6 != 0) goto L_0x0135;
    L_0x00d8:
        r6 = com.android.camera.CameraSettings.isCameraPortraitWithFaceBeauty();
        if (r6 == 0) goto L_0x0135;
    L_0x00de:
        r6 = com.mi.config.b.fM();
        if (r6 == 0) goto L_0x0135;
    L_0x00e4:
        r0.add(r2);
        goto L_0x0135;
    L_0x00e8:
        r6 = r0.add(r3);
        r6.add(r5);
        goto L_0x0135;
    L_0x00f0:
        if (r7 == 0) goto L_0x00f3;
    L_0x00f2:
        goto L_0x0120;
    L_0x00f3:
        r6 = r0.add(r3);
        r7 = 233; // 0xe9 float:3.27E-43 double:1.15E-321;
        r6.add(r7);
        r6 = com.mi.config.b.ge();
        if (r6 == 0) goto L_0x0111;
    L_0x0102:
        r6 = com.android.camera.data.DataRepository.dataItemFeature();
        r6 = r6.fp();
        if (r6 != 0) goto L_0x0111;
    L_0x010c:
        r6 = 232; // 0xe8 float:3.25E-43 double:1.146E-321;
        r0.add(r6);
    L_0x0111:
        r6 = com.android.camera.Util.UI_DEBUG();
        if (r6 != 0) goto L_0x0120;
    L_0x0117:
        r6 = r9.isSupportVideoBeauty();
        if (r6 == 0) goto L_0x0120;
    L_0x011d:
        r0.add(r2);
    L_0x0120:
        goto L_0x0135;
    L_0x0121:
        if (r7 != 0) goto L_0x0135;
    L_0x0123:
        r6 = r9.isSupportVideoBeauty();
        if (r6 == 0) goto L_0x0135;
    L_0x0129:
        r0.add(r3);
        r6 = com.android.camera.Util.UI_DEBUG();
        if (r6 != 0) goto L_0x0135;
    L_0x0132:
        r0.add(r2);
    L_0x0135:
        r6 = r8.filterFeature(r0);
        return r6;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.data.data.config.SupportedConfigFactory.getSupportedExtraConfigs(int, int, com.android.camera.data.cloud.DataCloud$CloudFeature, com.android.camera2.CameraCapabilities, boolean):com.android.camera.data.data.config.SupportedConfigs");
    }

    public static int findViewPosition(int i) {
        return TopViewPositionArray.getCurrentUseViewPositionFromConfig(i);
    }
}
