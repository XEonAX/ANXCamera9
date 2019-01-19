package com.android.camera.data.data.global;

import android.content.Intent;
import android.support.v4.util.Pair;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class DataItemGlobal extends DataItemBase {
    public static final String CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY = "can_connect_network";
    public static final String DATA_COMMON_AI_SCENE_HINT = "pref_camera_first_ai_scene_use_hint_shown_key";
    public static final String DATA_COMMON_CURRENT_CAMERA_ID = "pref_camera_id_key";
    public static final String DATA_COMMON_CURRENT_MODE = "pref_camera_mode_key_intent_";
    public static final String DATA_COMMON_DEVICE_WATERMARK = "pref_dualcamera_watermark";
    public static final String DATA_COMMON_DUALCAMERA_USERDEFINE_WATERMARK = "user_define_watermark";
    public static final String DATA_COMMON_FOCUS_SHOOT = "pref_camera_focus_shoot_key";
    public static final String DATA_COMMON_FRONT_CAM_ROTATE_HINT = "pref_front_camera_first_use_hint_shown_key";
    private static final String DATA_COMMON_OPEN_TIME = "pref_camera_open_time";
    public static final String DATA_COMMON_PORTRAIT_HINT = "pref_camera_first_portrait_use_hint_shown_key";
    public static final String DATA_COMMON_TIME_WATER_MARK = "pref_watermark_key";
    public static final String DATA_COMMON_ULTRA_WIDE_HINT = "pref_camera_first_ultra_wide_use_hint_shown_key";
    public static final int INTENT_TYPE_IMAGE = 1;
    public static final int INTENT_TYPE_NORMAL = 0;
    public static final int INTENT_TYPE_SCAN_QR = 3;
    public static final int INTENT_TYPE_UNSPECIFIED = -1;
    public static final int INTENT_TYPE_VIDEO = 2;
    public static final int INTENT_TYPE_VOICE_CONTROL = 4;
    public static final String KEY = "camera_settings_global";
    private static final String TAG = "DataItemGlobal";
    private int mIntentType = 0;
    private Boolean mIsTimeOut;
    private int mLastCameraId = getCurrentCameraId();
    private ComponentGlobalRaw mManuallyRaw;
    private ComponentModuleList mModuleList = new ComponentModuleList(this);
    private boolean mRetriedIfCameraError;
    private boolean mStartFromKeyguard;

    @Retention(RetentionPolicy.SOURCE)
    public @interface IntentType {
    }

    public String provideKey() {
        return "camera_settings_global";
    }

    public boolean isTransient() {
        return false;
    }

    public int getCurrentCameraId() {
        return getCurrentCameraId(getCurrentMode());
    }

    public int getLastCameraId() {
        return this.mLastCameraId;
    }

    private int getCurrentCameraId(int i) {
        switch (i) {
            case 166:
            case 167:
            case 172:
            case 173:
                return 0;
            case 171:
                if (b.hn()) {
                    return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(i)))).intValue();
                }
                return 0;
            default:
                return Integer.valueOf(getString("pref_camera_id_key", String.valueOf(getDefaultCameraId(i)))).intValue();
        }
    }

    private int getCurrentModeForFrontCamera(int i) {
        i = getCurrentMode(i);
        switch (i) {
            case 166:
            case 167:
            case 173:
                break;
            case 168:
            case 169:
            case 170:
            case 172:
                return 162;
            case 171:
                if (b.hn()) {
                    return i;
                }
                break;
            default:
                return i;
        }
        return 163;
    }

    private int getDefaultCameraId(int i) {
        return 0;
    }

    public void setCameraId(int i) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        editor().putString("pref_camera_id_key", String.valueOf(i)).apply();
    }

    public void setCameraIdTransient(int i) {
        this.mLastCameraId = getCurrentCameraId(getCurrentMode());
        putString("pref_camera_id_key", String.valueOf(i));
    }

    public int getCurrentMode() {
        return getCurrentMode(this.mIntentType);
    }

    private int getCurrentMode(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DATA_COMMON_CURRENT_MODE);
        stringBuilder.append(i);
        return getInt(stringBuilder.toString(), getDefaultMode(i));
    }

    public void setCurrentMode(int i) {
        ProviderEditor editor = editor();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DATA_COMMON_CURRENT_MODE);
        stringBuilder.append(this.mIntentType);
        editor.putInt(stringBuilder.toString(), i).apply();
    }

    public ComponentGlobalRaw getGlobalRaw() {
        if (this.mManuallyRaw == null) {
            this.mManuallyRaw = new ComponentGlobalRaw(this);
        }
        return this.mManuallyRaw;
    }

    public ComponentModuleList getComponentModuleList() {
        return this.mModuleList;
    }

    public void reInit() {
        this.mModuleList.reInit();
        ProviderEditor editor = editor();
        this.mIsTimeOut = Boolean.valueOf(false);
        editor.putLong(DATA_COMMON_OPEN_TIME, System.currentTimeMillis());
        editor.putLong(CameraSettings.KEY_OPEN_CAMERA_FAIL, 0);
        int currentCameraId = getCurrentCameraId(getCurrentMode());
        this.mLastCameraId = currentCameraId;
        editor.putString("pref_camera_id_key", String.valueOf(currentCameraId));
        editor.apply();
    }

    public boolean isFirstShowCTAConCollect() {
        return contains(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY) ^ 1;
    }

    public boolean getCTACanCollect() {
        return getBoolean(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, false);
    }

    public void setCTACanCollect(boolean z) {
        editor().putBoolean(CTA_CAN_CONNECT_NETWORK_BY_IMPUNITY, z).apply();
    }

    public boolean isGlobalSwitchOn(String str) {
        return getBoolean(str, false);
    }

    public boolean isIntentAction() {
        return this.mIntentType != 0;
    }

    public int getIntentType() {
        return this.mIntentType;
    }

    public boolean isNormalIntent() {
        return this.mIntentType == 0;
    }

    public int getDefaultMode(int i) {
        switch (i) {
            case 1:
            case 3:
                return 163;
            case 2:
                return 162;
            default:
                return 163;
        }
    }

    public boolean isTimeOut() {
        return this.mIsTimeOut == null || this.mIsTimeOut.booleanValue();
    }

    public void resetTimeOut() {
        this.mIsTimeOut = Boolean.valueOf(false);
        editor().putLong(DATA_COMMON_OPEN_TIME, System.currentTimeMillis()).apply();
    }

    private boolean determineTimeOut() {
        boolean z;
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - getLong(DATA_COMMON_OPEN_TIME, currentTimeMillis) > 30000 || this.mIsTimeOut == null) {
            z = true;
        } else {
            z = false;
        }
        return (z && CameraSettings.retainCameraMode()) ? false : z;
    }

    public void setStartFromKeyguard(boolean z) {
        this.mStartFromKeyguard = z;
    }

    public boolean getStartFromKeyguard() {
        return this.mStartFromKeyguard;
    }

    /* JADX WARNING: Missing block: B:33:0x0077, code:
            r3 = 0;
     */
    /* JADX WARNING: Missing block: B:35:0x007e, code:
            if (r10.booleanValue() == false) goto L_0x0077;
     */
    /* JADX WARNING: Missing block: B:36:0x0082, code:
            r9 = com.android.camera.CameraIntentManager.getInstance(r9);
            r10 = r9.getCameraModeId();
     */
    /* JADX WARNING: Missing block: B:37:0x008d, code:
            if (r10 != 160) goto L_0x009e;
     */
    /* JADX WARNING: Missing block: B:39:0x0093, code:
            if (determineTimeOut() == false) goto L_0x009a;
     */
    /* JADX WARNING: Missing block: B:40:0x0095, code:
            r10 = getDefaultMode(0);
     */
    /* JADX WARNING: Missing block: B:41:0x009a, code:
            r10 = getCurrentMode(0);
     */
    /* JADX WARNING: Missing block: B:43:?, code:
            r9 = r9.isUseFrontCamera();
     */
    /* JADX WARNING: Missing block: B:46:0x00a8, code:
            if (determineTimeOut() != false) goto L_0x00aa;
     */
    /* JADX WARNING: Missing block: B:47:0x00aa, code:
            r9 = getDefaultCameraId(r10);
     */
    /* JADX WARNING: Missing block: B:48:0x00af, code:
            r9 = getCurrentCameraId(r10);
     */
    /* JADX WARNING: Missing block: B:49:0x00b3, code:
            r12 = TAG;
            r13 = new java.lang.StringBuilder();
            r13.append("intent from voice control assist : pendingOpenId = ");
            r13.append(r9);
            r13.append(";pendingOpenModule = ");
            r13.append(r10);
            com.android.camera.log.Log.d(r12, r13.toString());
            r8.mIntentType = 0;
            r8.mStartFromKeyguard = r11;
            r8.mModuleList.setIntentType(r8.mIntentType);
     */
    /* JADX WARNING: Missing block: B:50:0x00e0, code:
            if (r10 == getCurrentMode()) goto L_0x00e8;
     */
    /* JADX WARNING: Missing block: B:51:0x00e2, code:
            setCurrentMode(r10);
            com.android.camera.module.ModuleManager.setActiveModuleIndex(r10);
     */
    /* JADX WARNING: Missing block: B:53:0x00ec, code:
            if (r9 == getCurrentCameraId()) goto L_0x00f1;
     */
    /* JADX WARNING: Missing block: B:54:0x00ee, code:
            setCameraId(r9);
     */
    /* JADX WARNING: Missing block: B:56:0x00fe, code:
            return new android.support.v4.util.Pair(java.lang.Integer.valueOf(r9), java.lang.Integer.valueOf(r10));
     */
    /* JADX WARNING: Missing block: B:59:0x0108, code:
            r9 = com.android.camera.CameraIntentManager.getInstance(r9).getCameraFacing();
     */
    /* JADX WARNING: Missing block: B:60:0x0110, code:
            if (r9 == -1) goto L_0x0115;
     */
    /* JADX WARNING: Missing block: B:61:0x0112, code:
            setCameraIdTransient(r9);
     */
    /* JADX WARNING: Missing block: B:62:0x0115, code:
            if (r13 == false) goto L_0x0121;
     */
    /* JADX WARNING: Missing block: B:63:0x0117, code:
            if (r3 != 0) goto L_0x0121;
     */
    /* JADX WARNING: Missing block: B:65:0x011d, code:
            if (determineTimeOut() == false) goto L_0x0121;
     */
    /* JADX WARNING: Missing block: B:66:0x011f, code:
            r10 = true;
     */
    /* JADX WARNING: Missing block: B:67:0x0121, code:
            r10 = false;
     */
    /* JADX WARNING: Missing block: B:69:0x0125, code:
            if (r8.mIntentType != r3) goto L_0x012d;
     */
    /* JADX WARNING: Missing block: B:71:0x0129, code:
            if (r8.mStartFromKeyguard == r11) goto L_0x012e;
     */
    /* JADX WARNING: Missing block: B:72:0x012d, code:
            r1 = 1;
     */
    /* JADX WARNING: Missing block: B:73:0x012e, code:
            if (r1 == 0) goto L_0x013f;
     */
    /* JADX WARNING: Missing block: B:75:0x0136, code:
            if ("android.media.action.STILL_IMAGE_CAMERA".equals(r0) == false) goto L_0x013f;
     */
    /* JADX WARNING: Missing block: B:76:0x0138, code:
            r9 = 163;
            r13 = getCurrentCameraId(163);
     */
    /* JADX WARNING: Missing block: B:77:0x013f, code:
            if (r1 == 0) goto L_0x0150;
     */
    /* JADX WARNING: Missing block: B:79:0x0147, code:
            if ("android.media.action.VIDEO_CAMERA".equals(r0) == false) goto L_0x0150;
     */
    /* JADX WARNING: Missing block: B:80:0x0149, code:
            r9 = 162;
            r13 = getCurrentCameraId(162);
     */
    /* JADX WARNING: Missing block: B:81:0x0150, code:
            if (r10 == false) goto L_0x0165;
     */
    /* JADX WARNING: Missing block: B:82:0x0152, code:
            r13 = getDefaultMode(r3);
     */
    /* JADX WARNING: Missing block: B:83:0x0156, code:
            if (r9 >= 0) goto L_0x015d;
     */
    /* JADX WARNING: Missing block: B:84:0x0158, code:
            r9 = getDefaultCameraId(r13);
     */
    /* JADX WARNING: Missing block: B:85:0x015d, code:
            r9 = getCurrentCameraId(r13);
     */
    /* JADX WARNING: Missing block: B:86:0x0161, code:
            r7 = r13;
            r13 = r9;
            r9 = r7;
     */
    /* JADX WARNING: Missing block: B:87:0x0165, code:
            if (r9 == 1) goto L_0x016c;
     */
    /* JADX WARNING: Missing block: B:88:0x0167, code:
            r9 = getCurrentMode(r3);
     */
    /* JADX WARNING: Missing block: B:89:0x016c, code:
            r9 = getCurrentModeForFrontCamera(r3);
     */
    /* JADX WARNING: Missing block: B:90:0x0170, code:
            r13 = getCurrentCameraId(r9);
     */
    /* JADX WARNING: Missing block: B:91:0x0174, code:
            if (r12 != false) goto L_0x019e;
     */
    /* JADX WARNING: Missing block: B:92:0x0176, code:
            r8.mIsTimeOut = java.lang.Boolean.valueOf(r10);
     */
    /* JADX WARNING: Missing block: B:93:0x017c, code:
            if (r1 == 0) goto L_0x0189;
     */
    /* JADX WARNING: Missing block: B:94:0x017e, code:
            r8.mIntentType = r3;
            r8.mStartFromKeyguard = r11;
            r8.mModuleList.setIntentType(r8.mIntentType);
     */
    /* JADX WARNING: Missing block: B:96:0x018d, code:
            if (r9 == getCurrentMode()) goto L_0x0195;
     */
    /* JADX WARNING: Missing block: B:97:0x018f, code:
            setCurrentMode(r9);
            com.android.camera.module.ModuleManager.setActiveModuleIndex(r9);
     */
    /* JADX WARNING: Missing block: B:99:0x0199, code:
            if (r13 == getCurrentCameraId()) goto L_0x019e;
     */
    /* JADX WARNING: Missing block: B:100:0x019b, code:
            setCameraId(r13);
     */
    /* JADX WARNING: Missing block: B:102:0x01ab, code:
            return new android.support.v4.util.Pair(java.lang.Integer.valueOf(r13), java.lang.Integer.valueOf(r9));
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Pair<Integer, Integer> parseIntent(Intent intent, Boolean bool, boolean z, boolean z2, boolean z3) {
        int i;
        int i2 = 0;
        if (DataRepository.dataItemFeature().fl() && Util.isScreenSlideOff(CameraAppImpl.getAndroidContext())) {
            setCameraId(0);
        }
        String action = intent.getAction();
        if (action == null) {
            action = "<unknown>";
        }
        int i3 = 3;
        switch (action.hashCode()) {
            case -1960745709:
                if (action.equals("android.media.action.IMAGE_CAPTURE")) {
                    i = 0;
                    break;
                }
            case -1528697361:
                if (action.equals(CameraIntentManager.ACTION_VOICE_CONTROL)) {
                    i = 6;
                    break;
                }
            case -1449841107:
                if (action.equals(CameraIntentManager.ACTION_QR_CODE_ZXING)) {
                    i = 3;
                    break;
                }
            case 464109999:
                if (action.equals("android.media.action.STILL_IMAGE_CAMERA")) {
                    i = 4;
                    break;
                }
            case 701083699:
                if (action.equals("android.media.action.VIDEO_CAPTURE")) {
                    i = 1;
                    break;
                }
            case 1130890360:
                if (action.equals("android.media.action.VIDEO_CAMERA")) {
                    i = 5;
                    break;
                }
            case 1280056183:
                if (action.equals(CameraIntentManager.ACTION_QR_CODE_CAPTURE)) {
                    i = 2;
                    break;
                }
            default:
                i = -1;
                break;
        }
        switch (i) {
            case 0:
                i3 = 1;
                break;
            case 1:
                i3 = 2;
                break;
            case 2:
            case 3:
                break;
            case 4:
            case 5:
                break;
            case 6:
                break;
        }
    }

    public int getDataBackUpKey(int i) {
        i |= (this.mIntentType + 2) << 8;
        if (this.mStartFromKeyguard) {
            return i | 65536;
        }
        return i;
    }

    public boolean isRetriedIfCameraError() {
        return this.mRetriedIfCameraError;
    }

    public void setRetriedIfCameraError(boolean z) {
        this.mRetriedIfCameraError = z;
    }

    public void resetAll() {
        this.mIsTimeOut = null;
        editor().clear().putInt(CameraSettings.KEY_VERSION, 4).apply();
    }
}
