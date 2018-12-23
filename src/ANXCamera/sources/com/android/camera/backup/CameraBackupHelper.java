package com.android.camera.backup;

import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.constant.CameraScene;
import com.android.camera.log.Log;

public class CameraBackupHelper {
    private static final String TAG = CameraBackupHelper.class.getSimpleName();

    public static void restoreSettings(android.content.SharedPreferences r9, com.xiaomi.settingsdk.backup.data.DataPackage r10, com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry[] r11, boolean r12) {
        /*
        r0 = getSettingsKeys();
        r9 = r9.edit();
        r1 = r11.length;
        r2 = 0;
        r3 = r2;
    L_0x000b:
        if (r3 >= r1) goto L_0x0163;
    L_0x000d:
        r4 = r11[r3];
        r5 = r4.getLocalKey();
        r5 = r0.contains(r5);
        if (r5 != 0) goto L_0x001b;
    L_0x0019:
        goto L_0x015f;
    L_0x001b:
        if (r12 == 0) goto L_0x0029;
    L_0x001d:
        r5 = r4.getLocalKey();
        r5 = com.android.camera.CameraSettings.isCameraSpecific(r5);
        if (r5 == 0) goto L_0x0029;
    L_0x0027:
        goto L_0x015f;
    L_0x0029:
        if (r12 != 0) goto L_0x0037;
    L_0x002b:
        r5 = r4.getLocalKey();
        r5 = com.android.camera.CameraSettings.isCameraSpecific(r5);
        if (r5 != 0) goto L_0x0037;
    L_0x0035:
        goto L_0x015f;
    L_0x0037:
        r5 = r4.getCloudKey();	 Catch:{ ClassCastException -> 0x013f }
        r5 = r10.get(r5);	 Catch:{ ClassCastException -> 0x013f }
        r5 = (com.xiaomi.settingsdk.backup.data.KeyStringSettingItem) r5;	 Catch:{ ClassCastException -> 0x013f }
        if (r5 == 0) goto L_0x013e;
    L_0x0043:
        r6 = r4.getLocalKey();	 Catch:{ ClassCastException -> 0x013f }
        r7 = -1;
        r8 = r6.hashCode();	 Catch:{ ClassCastException -> 0x013f }
        switch(r8) {
            case -2096668591: goto L_0x008c;
            case -885525953: goto L_0x0082;
            case -302378757: goto L_0x0078;
            case -33912691: goto L_0x006e;
            case 549001748: goto L_0x0064;
            case 936502456: goto L_0x005a;
            case 1907727979: goto L_0x0050;
            default: goto L_0x004f;
        };	 Catch:{ ClassCastException -> 0x013f }
    L_0x004f:
        goto L_0x0096;
    L_0x0050:
        r8 = "pref_qc_camera_contrast_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x0058:
        r6 = 3;
        goto L_0x0097;
    L_0x005a:
        r8 = "pref_qc_camera_sharpness_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x0062:
        r6 = 5;
        goto L_0x0097;
    L_0x0064:
        r8 = "pref_camera_autoexposure_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x006c:
        r6 = 2;
        goto L_0x0097;
    L_0x006e:
        r8 = "pref_camera_antibanding_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x0076:
        r6 = 1;
        goto L_0x0097;
    L_0x0078:
        r8 = "pref_qc_camera_saturation_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x0080:
        r6 = 4;
        goto L_0x0097;
    L_0x0082:
        r8 = "pref_video_quality_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x008a:
        r6 = r2;
        goto L_0x0097;
    L_0x008c:
        r8 = "pref_front_mirror_key";
        r6 = r6.equals(r8);	 Catch:{ ClassCastException -> 0x013f }
        if (r6 == 0) goto L_0x0096;
    L_0x0094:
        r6 = 6;
        goto L_0x0097;
    L_0x0096:
        r6 = r7;
    L_0x0097:
        switch(r6) {
            case 0: goto L_0x00e4;
            case 1: goto L_0x00d9;
            case 2: goto L_0x00ce;
            case 3: goto L_0x00c3;
            case 4: goto L_0x00b8;
            case 5: goto L_0x00ad;
            case 6: goto L_0x009f;
            default: goto L_0x009a;
        };	 Catch:{ ClassCastException -> 0x013f }
    L_0x009a:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00ef;
    L_0x009f:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r6 = 2131623972; // 0x7f0e0024 float:1.887511E38 double:1.0531621744E-314;
        r5 = filterValue(r5, r6);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00ad:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertSharpness(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00b8:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertSaturation(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00c3:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertContrast(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00ce:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertExposureMode(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00d9:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertAntiBandingMode(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00e4:
        r5 = r5.getValue();	 Catch:{ ClassCastException -> 0x013f }
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
        r5 = convertVideoQuality(r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x00f1;
    L_0x00ef:
        r5 = (java.lang.String) r5;	 Catch:{ ClassCastException -> 0x013f }
    L_0x00f1:
        if (r5 == 0) goto L_0x013e;
    L_0x00f3:
        r6 = r4.getValueClass();	 Catch:{ ClassCastException -> 0x013f }
        r7 = java.lang.Integer.class;
        if (r6 != r7) goto L_0x0107;
    L_0x00fb:
        r6 = r4.getLocalKey();	 Catch:{ ClassCastException -> 0x013f }
        r5 = java.lang.Integer.parseInt(r5);	 Catch:{ ClassCastException -> 0x013f }
        r9.putInt(r6, r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x013e;
    L_0x0107:
        r6 = r4.getValueClass();	 Catch:{ ClassCastException -> 0x013f }
        r7 = java.lang.Long.class;
        if (r6 != r7) goto L_0x011b;
    L_0x010f:
        r6 = r4.getLocalKey();	 Catch:{ ClassCastException -> 0x013f }
        r7 = java.lang.Long.parseLong(r5);	 Catch:{ ClassCastException -> 0x013f }
        r9.putLong(r6, r7);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x013e;
    L_0x011b:
        r6 = r4.getValueClass();	 Catch:{ ClassCastException -> 0x013f }
        r7 = java.lang.Boolean.class;
        if (r6 != r7) goto L_0x012f;
    L_0x0123:
        r6 = r4.getLocalKey();	 Catch:{ ClassCastException -> 0x013f }
        r5 = java.lang.Boolean.parseBoolean(r5);	 Catch:{ ClassCastException -> 0x013f }
        r9.putBoolean(r6, r5);	 Catch:{ ClassCastException -> 0x013f }
        goto L_0x013e;
    L_0x012f:
        r6 = r4.getValueClass();	 Catch:{ ClassCastException -> 0x013f }
        r7 = java.lang.String.class;
        if (r6 != r7) goto L_0x013e;
    L_0x0137:
        r6 = r4.getLocalKey();	 Catch:{ ClassCastException -> 0x013f }
        r9.putString(r6, r5);	 Catch:{ ClassCastException -> 0x013f }
    L_0x013e:
        goto L_0x015f;
    L_0x013f:
        r5 = move-exception;
        r5 = TAG;
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r7 = "entry ";
        r6.append(r7);
        r4 = r4.getCloudKey();
        r6.append(r4);
        r4 = " is not KeyStringSettingItem";
        r6.append(r4);
        r4 = r6.toString();
        com.android.camera.log.Log.e(r5, r4);
    L_0x015f:
        r3 = r3 + 1;
        goto L_0x000b;
    L_0x0163:
        r9.commit();
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.backup.CameraBackupHelper.restoreSettings(android.content.SharedPreferences, com.xiaomi.settingsdk.backup.data.DataPackage, com.xiaomi.settingsdk.backup.data.PrefsBackupHelper$PrefEntry[], boolean):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0039 A:{ExcHandler: org.xmlpull.v1.XmlPullParserException (r2_7 'e' java.lang.Throwable), Splitter: B:1:0x0013} */
    /* JADX WARNING: Missing block: B:15:0x0039, code:
            r2 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x003a, code:
            com.android.camera.log.Log.e(TAG, r2.getMessage(), r2);
     */
    private static java.util.List<java.lang.String> getSettingsKeys() {
        /*
        r0 = new java.util.ArrayList;
        r0.<init>();
        r1 = com.android.camera.CameraAppImpl.getAndroidContext();
        r1 = r1.getResources();
        r2 = 2131165184; // 0x7f070000 float:1.7944578E38 double:1.052935503E-314;
        r1 = r1.getXml(r2);
        r2 = r1.getEventType();	 Catch:{ XmlPullParserException -> 0x0039, XmlPullParserException -> 0x0039 }
    L_0x0017:
        r3 = 1;
        if (r2 == r3) goto L_0x0038;
    L_0x001a:
        r3 = 2;
        r4 = 3;
        if (r2 == r3) goto L_0x0020;
    L_0x001e:
        if (r2 != r4) goto L_0x0033;
    L_0x0020:
        r2 = r1.getDepth();	 Catch:{ XmlPullParserException -> 0x0039, XmlPullParserException -> 0x0039 }
        if (r2 < r4) goto L_0x0033;
    L_0x0026:
        r2 = "http://schemas.android.com/apk/res/android";
        r3 = "key";
        r2 = r1.getAttributeValue(r2, r3);	 Catch:{ XmlPullParserException -> 0x0039, XmlPullParserException -> 0x0039 }
        if (r2 == 0) goto L_0x0033;
    L_0x0030:
        r0.add(r2);	 Catch:{ XmlPullParserException -> 0x0039, XmlPullParserException -> 0x0039 }
    L_0x0033:
        r2 = r1.next();	 Catch:{ XmlPullParserException -> 0x0039, XmlPullParserException -> 0x0039 }
        goto L_0x0017;
    L_0x0038:
        goto L_0x0043;
    L_0x0039:
        r2 = move-exception;
        r3 = TAG;
        r4 = r2.getMessage();
        com.android.camera.log.Log.e(r3, r4, r2);
    L_0x0043:
        r1.close();
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.backup.CameraBackupHelper.getSettingsKeys():java.util.List<java.lang.String>");
    }

    private static String convertAntiBandingMode(String str) {
        if (str == null) {
            return null;
        }
        int i = -1;
        int hashCode = str.hashCode();
        if (hashCode != 109935) {
            if (hashCode != 1628397) {
                if (hashCode != 1658188) {
                    if (hashCode == 3005871 && str.equals("auto")) {
                        i = 3;
                    }
                } else if (str.equals("60hz")) {
                    i = 2;
                }
            } else if (str.equals("50hz")) {
                i = 1;
            }
        } else if (str.equals("off")) {
            i = 0;
        }
        switch (i) {
            case 0:
                return String.valueOf(0);
            case 1:
                return String.valueOf(1);
            case 2:
                return String.valueOf(2);
            case 3:
                return String.valueOf(3);
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unknown antibanding mode ");
                stringBuilder.append(str);
                Log.w(str2, stringBuilder.toString());
                return null;
        }
    }

    private static String convertVideoQuality(String str) {
        if (str == null) {
            return null;
        }
        Object obj = -1;
        switch (str.hashCode()) {
            case 52:
                if (str.equals("4")) {
                    obj = null;
                    break;
                }
                break;
            case 53:
                if (str.equals("5")) {
                    obj = 2;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    obj = 4;
                    break;
                }
                break;
            case 56:
                if (str.equals(CameraScene.BEACH)) {
                    obj = 6;
                    break;
                }
                break;
            case 57:
                if (str.equals(CameraScene.SNOW)) {
                    obj = 1;
                    break;
                }
                break;
            case 1567:
                if (str.equals(CameraScene.SUNSET)) {
                    obj = 3;
                    break;
                }
                break;
            case 1568:
                if (str.equals("11")) {
                    obj = 5;
                    break;
                }
                break;
            case 1569:
                if (str.equals(CameraScene.FIREWORKS)) {
                    obj = 7;
                    break;
                }
                break;
        }
        switch (obj) {
            case null:
            case 1:
                return "4";
            case 2:
            case 3:
                return "5";
            case 4:
            case 5:
                return "6";
            case 6:
            case 7:
                return CameraScene.BEACH;
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unknown video quality ");
                stringBuilder.append(str);
                Log.w(str2, stringBuilder.toString());
                return null;
        }
    }

    private static String convertExposureMode(String str) {
        if (str == null) {
            return null;
        }
        Object obj = -1;
        switch (str.hashCode()) {
            case -1364013995:
                if (str.equals("center")) {
                    obj = 2;
                    break;
                }
                break;
            case -1200037852:
                if (str.equals("spot-metering")) {
                    obj = 5;
                    break;
                }
                break;
            case -631448035:
                if (str.equals("average")) {
                    obj = null;
                    break;
                }
                break;
            case 3537154:
                if (str.equals("spot")) {
                    obj = 4;
                    break;
                }
                break;
            case 1302812559:
                if (str.equals("center-weighted")) {
                    obj = 3;
                    break;
                }
                break;
            case 2133765565:
                if (str.equals("frame-average")) {
                    obj = 1;
                    break;
                }
                break;
        }
        switch (obj) {
            case null:
            case 1:
                return "0";
            case 2:
            case 3:
                return "1";
            case 4:
            case 5:
                return "2";
            default:
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unknown exposure mode ");
                stringBuilder.append(str);
                Log.w(str2, stringBuilder.toString());
                return null;
        }
    }

    private static String convertContrast(String str) {
        return null;
    }

    private static String convertSaturation(String str) {
        return null;
    }

    private static String convertSharpness(String str) {
        return null;
    }

    private static String filterValue(String str, int i) {
        if (Util.isSupported((Object) str, CameraAppImpl.getAndroidContext().getResources().getStringArray(i))) {
            return str;
        }
        return null;
    }
}
