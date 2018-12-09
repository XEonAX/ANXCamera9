package com.android.camera.data.data.global;

import com.android.camera.CameraSettings;
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
    public static final String DATA_COMMON_DUALCAMERA_USERDEFINE_WATERMARK = "user_define_watermark";
    public static final String DATA_COMMON_DUALCAMERA_WATERMARK = "pref_dualcamera_watermark";
    public static final String DATA_COMMON_FOCUS_SHOOT = "pref_camera_focus_shoot_key";
    public static final String DATA_COMMON_FRONT_CAM_ROTATE_HINT = "pref_front_camera_first_use_hint_shown_key";
    private static final String DATA_COMMON_OPEN_TIME = "pref_camera_open_time";
    public static final String DATA_COMMON_PORTRAIT_HINT = "pref_camera_first_portrait_use_hint_shown_key";
    public static final String DATA_COMMON_TIME_WATER_MARK = "pref_watermark_key";
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
                if (b.hb()) {
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
                if (b.hb()) {
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
    public android.support.v4.util.Pair<java.lang.Integer, java.lang.Integer> parseIntent(android.content.Intent r9, java.lang.Boolean r10, boolean r11, boolean r12, boolean r13) {
        /*
        r8 = this;
        r0 = com.android.camera.data.DataRepository.dataItemFeature();
        r0 = r0.fj();
        r1 = 0;
        if (r0 == 0) goto L_0x0018;
    L_0x000b:
        r0 = com.android.camera.CameraAppImpl.getAndroidContext();
        r0 = com.android.camera.Util.isScreenSlideOff(r0);
        if (r0 == 0) goto L_0x0018;
    L_0x0015:
        r8.setCameraId(r1);
    L_0x0018:
        r0 = r9.getAction();
        if (r0 != 0) goto L_0x0020;
    L_0x001e:
        r0 = "<unknown>";
    L_0x0020:
        r2 = r0.hashCode();
        r3 = 3;
        r4 = 2;
        r5 = -1;
        r6 = 1;
        switch(r2) {
            case -1960745709: goto L_0x0068;
            case -1528697361: goto L_0x005e;
            case -1449841107: goto L_0x0054;
            case 464109999: goto L_0x004a;
            case 701083699: goto L_0x0040;
            case 1130890360: goto L_0x0036;
            case 1280056183: goto L_0x002c;
            default: goto L_0x002b;
        };
    L_0x002b:
        goto L_0x0072;
    L_0x002c:
        r2 = "com.android.camera.action.QR_CODE_CAPTURE";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x0034:
        r2 = r4;
        goto L_0x0073;
    L_0x0036:
        r2 = "android.media.action.VIDEO_CAMERA";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x003e:
        r2 = 5;
        goto L_0x0073;
    L_0x0040:
        r2 = "android.media.action.VIDEO_CAPTURE";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x0048:
        r2 = r6;
        goto L_0x0073;
    L_0x004a:
        r2 = "android.media.action.STILL_IMAGE_CAMERA";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x0052:
        r2 = 4;
        goto L_0x0073;
    L_0x0054:
        r2 = "com.google.zxing.client.android.SCAN";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x005c:
        r2 = r3;
        goto L_0x0073;
    L_0x005e:
        r2 = "android.media.action.VOICE_COMMAND";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x0066:
        r2 = 6;
        goto L_0x0073;
    L_0x0068:
        r2 = "android.media.action.IMAGE_CAPTURE";
        r2 = r0.equals(r2);
        if (r2 == 0) goto L_0x0072;
    L_0x0070:
        r2 = r1;
        goto L_0x0073;
    L_0x0072:
        r2 = r5;
    L_0x0073:
        switch(r2) {
            case 0: goto L_0x0105;
            case 1: goto L_0x0101;
            case 2: goto L_0x00ff;
            case 3: goto L_0x00ff;
            case 4: goto L_0x007a;
            case 5: goto L_0x007a;
            case 6: goto L_0x0082;
            default: goto L_0x0076;
        };
    L_0x0077:
        r3 = r1;
        goto L_0x0108;
    L_0x007a:
        r10 = r10.booleanValue();
        if (r10 != 0) goto L_0x0082;
        goto L_0x0077;
        r9 = com.android.camera.CameraIntentManager.getInstance(r9);
        r10 = r9.getCameraModeId();
        r12 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
        if (r10 != r12) goto L_0x009e;
    L_0x008f:
        r10 = r8.determineTimeOut();
        if (r10 == 0) goto L_0x009a;
    L_0x0095:
        r10 = r8.getDefaultMode(r1);
        goto L_0x009e;
    L_0x009a:
        r10 = r8.getCurrentMode(r1);
    L_0x009e:
        r9 = r9.isUseFrontCamera();	 Catch:{ Exception -> 0x00a3 }
        goto L_0x00b3;
    L_0x00a3:
        r9 = move-exception;
        r9 = r8.determineTimeOut();
        if (r9 == 0) goto L_0x00af;
    L_0x00aa:
        r9 = r8.getDefaultCameraId(r10);
        goto L_0x00b3;
    L_0x00af:
        r9 = r8.getCurrentCameraId(r10);
    L_0x00b3:
        r12 = "DataItemGlobal";
        r13 = new java.lang.StringBuilder;
        r13.<init>();
        r0 = "intent from voice control assist : pendingOpenId = ";
        r13.append(r0);
        r13.append(r9);
        r0 = ";pendingOpenModule = ";
        r13.append(r0);
        r13.append(r10);
        r13 = r13.toString();
        com.android.camera.log.Log.d(r12, r13);
        r8.mIntentType = r1;
        r8.mStartFromKeyguard = r11;
        r11 = r8.mModuleList;
        r12 = r8.mIntentType;
        r11.setIntentType(r12);
        r11 = r8.getCurrentMode();
        if (r10 == r11) goto L_0x00e8;
    L_0x00e2:
        r8.setCurrentMode(r10);
        com.android.camera.module.ModuleManager.setActiveModuleIndex(r10);
    L_0x00e8:
        r11 = r8.getCurrentCameraId();
        if (r9 == r11) goto L_0x00f1;
    L_0x00ee:
        r8.setCameraId(r9);
    L_0x00f1:
        r11 = new android.support.v4.util.Pair;
        r9 = java.lang.Integer.valueOf(r9);
        r10 = java.lang.Integer.valueOf(r10);
        r11.<init>(r9, r10);
        return r11;
        goto L_0x0108;
        r3 = r4;
        goto L_0x0108;
        r3 = r6;
    L_0x0108:
        r9 = com.android.camera.CameraIntentManager.getInstance(r9);
        r9 = r9.getCameraFacing();
        if (r9 == r5) goto L_0x0115;
    L_0x0112:
        r8.setCameraIdTransient(r9);
    L_0x0115:
        if (r13 == 0) goto L_0x0121;
    L_0x0117:
        if (r3 != 0) goto L_0x0121;
    L_0x0119:
        r10 = r8.determineTimeOut();
        if (r10 == 0) goto L_0x0121;
    L_0x011f:
        r10 = r6;
        goto L_0x0123;
        r10 = r1;
    L_0x0123:
        r13 = r8.mIntentType;
        if (r13 != r3) goto L_0x012d;
    L_0x0127:
        r13 = r8.mStartFromKeyguard;
        if (r13 == r11) goto L_0x012c;
    L_0x012b:
        goto L_0x012d;
    L_0x012c:
        goto L_0x012e;
    L_0x012d:
        r1 = r6;
    L_0x012e:
        if (r1 == 0) goto L_0x013f;
    L_0x0130:
        r13 = "android.media.action.STILL_IMAGE_CAMERA";
        r13 = r13.equals(r0);
        if (r13 == 0) goto L_0x013f;
    L_0x0138:
        r9 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        r13 = r8.getCurrentCameraId(r9);
        goto L_0x0174;
    L_0x013f:
        if (r1 == 0) goto L_0x0150;
    L_0x0141:
        r13 = "android.media.action.VIDEO_CAMERA";
        r13 = r13.equals(r0);
        if (r13 == 0) goto L_0x0150;
    L_0x0149:
        r9 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        r13 = r8.getCurrentCameraId(r9);
        goto L_0x0174;
    L_0x0150:
        if (r10 == 0) goto L_0x0165;
    L_0x0152:
        r13 = r8.getDefaultMode(r3);
        if (r9 >= 0) goto L_0x015d;
    L_0x0158:
        r9 = r8.getDefaultCameraId(r13);
        goto L_0x0161;
    L_0x015d:
        r9 = r8.getCurrentCameraId(r13);
    L_0x0161:
        r7 = r13;
        r13 = r9;
        r9 = r7;
        goto L_0x0174;
    L_0x0165:
        if (r9 == r6) goto L_0x016c;
    L_0x0167:
        r9 = r8.getCurrentMode(r3);
        goto L_0x0170;
    L_0x016c:
        r9 = r8.getCurrentModeForFrontCamera(r3);
    L_0x0170:
        r13 = r8.getCurrentCameraId(r9);
    L_0x0174:
        if (r12 != 0) goto L_0x019e;
    L_0x0176:
        r10 = java.lang.Boolean.valueOf(r10);
        r8.mIsTimeOut = r10;
        if (r1 == 0) goto L_0x0189;
    L_0x017e:
        r8.mIntentType = r3;
        r8.mStartFromKeyguard = r11;
        r10 = r8.mModuleList;
        r11 = r8.mIntentType;
        r10.setIntentType(r11);
    L_0x0189:
        r10 = r8.getCurrentMode();
        if (r9 == r10) goto L_0x0195;
    L_0x018f:
        r8.setCurrentMode(r9);
        com.android.camera.module.ModuleManager.setActiveModuleIndex(r9);
    L_0x0195:
        r10 = r8.getCurrentCameraId();
        if (r13 == r10) goto L_0x019e;
    L_0x019b:
        r8.setCameraId(r13);
    L_0x019e:
        r10 = new android.support.v4.util.Pair;
        r11 = java.lang.Integer.valueOf(r13);
        r9 = java.lang.Integer.valueOf(r9);
        r10.<init>(r11, r9);
        return r10;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.data.data.global.DataItemGlobal.parseIntent(android.content.Intent, java.lang.Boolean, boolean, boolean, boolean):android.support.v4.util.Pair<java.lang.Integer, java.lang.Integer>");
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
