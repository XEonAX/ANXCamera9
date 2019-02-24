package com.android.camera.backup;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.XmlResourceParser;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.CameraScene;
import com.android.camera.log.Log;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.KeyStringSettingItem;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry;
import java.util.ArrayList;
import java.util.List;

public class CameraBackupHelper {
    private static final String TAG = CameraBackupHelper.class.getSimpleName();

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void restoreSettings(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr, boolean z) {
        List settingsKeys = getSettingsKeys();
        Editor edit = sharedPreferences.edit();
        for (PrefEntry prefEntry : prefEntryArr) {
            if (settingsKeys.contains(prefEntry.getLocalKey()) && (!(z && CameraSettings.isCameraSpecific(prefEntry.getLocalKey())) && (z || CameraSettings.isCameraSpecific(prefEntry.getLocalKey())))) {
                String convertVideoQuality;
                try {
                    KeyStringSettingItem keyStringSettingItem = (KeyStringSettingItem) dataPackage.get(prefEntry.getCloudKey());
                    if (keyStringSettingItem != null) {
                        Object obj;
                        String localKey = prefEntry.getLocalKey();
                        switch (localKey.hashCode()) {
                            case -2096668591:
                                if (localKey.equals(CameraSettings.KEY_FRONT_MIRROR)) {
                                    obj = 6;
                                    break;
                                }
                            case -885525953:
                                if (localKey.equals(CameraSettings.KEY_VIDEO_QUALITY)) {
                                    obj = null;
                                    break;
                                }
                            case -302378757:
                                if (localKey.equals(CameraSettings.KEY_QC_SATURATION)) {
                                    obj = 4;
                                    break;
                                }
                            case -33912691:
                                if (localKey.equals(CameraSettings.KEY_ANTIBANDING)) {
                                    obj = 1;
                                    break;
                                }
                            case 549001748:
                                if (localKey.equals(CameraSettings.KEY_AUTOEXPOSURE)) {
                                    obj = 2;
                                    break;
                                }
                            case 936502456:
                                if (localKey.equals(CameraSettings.KEY_QC_SHARPNESS)) {
                                    obj = 5;
                                    break;
                                }
                            case 1907727979:
                                if (localKey.equals(CameraSettings.KEY_QC_CONTRAST)) {
                                    obj = 3;
                                    break;
                                }
                            default:
                                obj = -1;
                                break;
                        }
                        switch (obj) {
                            case null:
                                convertVideoQuality = convertVideoQuality((String) keyStringSettingItem.getValue());
                                break;
                            case 1:
                                convertVideoQuality = convertAntiBandingMode((String) keyStringSettingItem.getValue());
                                break;
                            case 2:
                                convertVideoQuality = convertExposureMode((String) keyStringSettingItem.getValue());
                                break;
                            case 3:
                                convertVideoQuality = convertContrast((String) keyStringSettingItem.getValue());
                                break;
                            case 4:
                                convertVideoQuality = convertSaturation((String) keyStringSettingItem.getValue());
                                break;
                            case 5:
                                convertVideoQuality = convertSharpness((String) keyStringSettingItem.getValue());
                                break;
                            case 6:
                                convertVideoQuality = filterValue((String) keyStringSettingItem.getValue(), R.array.pref_front_mirror_entryvalues);
                                break;
                            default:
                                convertVideoQuality = (String) keyStringSettingItem.getValue();
                                break;
                        }
                        if (convertVideoQuality != null) {
                            if (prefEntry.getValueClass() == Integer.class) {
                                edit.putInt(prefEntry.getLocalKey(), Integer.parseInt(convertVideoQuality));
                            } else if (prefEntry.getValueClass() == Long.class) {
                                edit.putLong(prefEntry.getLocalKey(), Long.parseLong(convertVideoQuality));
                            } else if (prefEntry.getValueClass() == Boolean.class) {
                                edit.putBoolean(prefEntry.getLocalKey(), Boolean.parseBoolean(convertVideoQuality));
                            } else if (prefEntry.getValueClass() == String.class) {
                                edit.putString(prefEntry.getLocalKey(), convertVideoQuality);
                            }
                        }
                    }
                } catch (ClassCastException e) {
                    convertVideoQuality = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("entry ");
                    stringBuilder.append(prefEntry.getCloudKey());
                    stringBuilder.append(" is not KeyStringSettingItem");
                    Log.e(convertVideoQuality, stringBuilder.toString());
                }
            }
        }
        edit.commit();
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0039 A:{Splitter: B:1:0x0013, ExcHandler: org.xmlpull.v1.XmlPullParserException (r2_7 'e' java.lang.Throwable)} */
    /* JADX WARNING: Missing block: B:15:0x0039, code:
            r2 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x003a, code:
            com.android.camera.log.Log.e(TAG, r2.getMessage(), r2);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static List<String> getSettingsKeys() {
        List<String> arrayList = new ArrayList();
        XmlResourceParser xml = CameraAppImpl.getAndroidContext().getResources().getXml(R.xml.camera_other_preferences);
        try {
            int eventType = xml.getEventType();
            while (eventType != 1) {
                if ((eventType == 2 || eventType == 3) && xml.getDepth() >= 3) {
                    String attributeValue = xml.getAttributeValue("http://schemas.android.com/apk/res/android", "key");
                    if (attributeValue != null) {
                        arrayList.add(attributeValue);
                    }
                }
                eventType = xml.next();
            }
        } catch (Throwable e) {
        }
        xml.close();
        return arrayList;
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
                if (str.equals("8")) {
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
                return "8";
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
