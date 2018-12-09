package com.android.camera;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.BadParcelableException;
import android.os.Bundle;
import com.android.camera.log.Log;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.WeakHashMap;

public class CameraIntentManager {
    public static final String ACTION_QR_CODE_CAPTURE = "com.android.camera.action.QR_CODE_CAPTURE";
    public static final String ACTION_QR_CODE_ZXING = "com.google.zxing.client.android.SCAN";
    public static final String ACTION_VOICE_CONTROL = "android.media.action.VOICE_COMMAND";
    private static final String CALLER_FROM_HOME = "com.miui.home";
    private static final String CALLER_GOOGLE_ASSISTANT = "com.google.android.googlequicksearchbox";
    private static final String CALLER_XIAO_AI = "com.miui.voiceassist";
    private static final String CALLER_XIAO_AI_DEBUG_UTIL = "com.xiaomi.voiceassistant";
    private static final String CALLER_XIAO_SHOP = "com.xiaomi.shop";
    public static final String EXTRAS_CAMERA_FACING = "android.intent.extras.CAMERA_FACING";
    public static final String EXTRAS_CAMERA_PORTRAIT = "android.intent.extras.PORTRAIT";
    private static final String EXTRAS_QUICK_CAPTURE = "android.intent.extra.quickCapture";
    public static final String EXTRAS_SCREEN_SLIDE = "android.intent.extras.SCREEN_SLIDE";
    private static final String TAG = CameraIntentManager.class.getSimpleName();
    public static final int TIMER_DURATION_NONE = -1;
    private static WeakHashMap<Intent, CameraIntentManager> sMap = new WeakHashMap();
    private Intent mIntent;
    private Uri mReferer;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BroadcastControlExtras {
        public static final String EXTRAS_VOICE_CONTROL_ACTION = "android.intent.extras.VOICE_CONTROL_ACTION";
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraExtras {
        public static final String CAMERA_FILTER_MODE = "android.intent.extra.CAMERA_FILTER_MODE";
        public static final String CAMERA_FLASH_MODE = "android.intent.extra.CAMERA_FLASH_MODE";
        public static final String CAMERA_MODE = "android.intent.extra.CAMERA_MODE";
        public static final String CAMERA_OPEN_ONLY = "android.intent.extra.CAMERA_OPEN_ONLY";
        public static final String CAMERA_SUB_MODE = "android.intent.extra.CAMERA_SUB_MODE";
        public static final String EXTRAS_CAMERA_HDR_MODE = "android.intent.extra.CAMERA_HDR_MODE";
        public static final String TIMER_DURATION_SECONDS = "android.intent.extra.TIMER_DURATION_SECONDS";
        public static final String USE_FRONT_CAMERA = "android.intent.extra.USE_FRONT_CAMERA";
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraMode {
        public static final String CAPTURE = "CAPTURE";
        public static final String FAST_MOTION = "FAST_MOTION";
        public static final String GOOGLE_MANUAL = "MANUAL_MODE";
        public static final String GOOGLE_PANORAMA = "PANORAMIC";
        public static final String MANUAL = "MANUAL";
        public static final String PANORAMA = "PANORAMA";
        public static final String PORTRAIT = "PORTRAIT";
        public static final String SHORT_VIDEO = "SHORT_VIDEO";
        public static final String SLOW_MOTION = "SLOW_MOTION";
        public static final String SQUARE = "SQUARE";
        public static final String SUPER_NIGHT = "SUPER_NIGHT";
        public static final String UNSPECIFIED = "UNSPECIFIED";
        public static final String VIDEO = "VIDEO";
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ControlActions {
        public static final String CONTROL_ACTION_CAPTURE = "CAPTURE";
        public static final String CONTROL_ACTION_UNKNOWN = "NONE";
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface FlashMode {
        public static final String AUTO = "auto";
        public static final String OFF = "off";
        public static final String ON = "on";
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface HDRMode {
        public static final String AUTO = "auto";
        public static final String OFF = "off";
        public static final String ON = "on";
    }

    public static CameraIntentManager getInstance(Intent intent) {
        CameraIntentManager cameraIntentManager = (CameraIntentManager) sMap.get(intent);
        if (cameraIntentManager != null) {
            return cameraIntentManager;
        }
        cameraIntentManager = new CameraIntentManager(intent);
        sMap.put(intent, cameraIntentManager);
        Log.dumpIntent(TAG, intent);
        return cameraIntentManager;
    }

    public static void removeInstance(Intent intent) {
        sMap.remove(intent);
    }

    public static void removeAllInstance() {
        sMap.clear();
    }

    public void destroy() {
        sMap.remove(this.mIntent);
        this.mReferer = null;
    }

    private CameraIntentManager(Intent intent) {
        this.mIntent = intent;
        this.mReferer = parseReferer(intent);
    }

    private static boolean isFrontCameraIntent(int i) {
        return i == 1;
    }

    private static boolean isBackCameraIntent(int i) {
        return i == 0;
    }

    public boolean isImageCaptureIntent() {
        return "android.media.action.IMAGE_CAPTURE".equals(this.mIntent.getAction());
    }

    public boolean isVideoCaptureIntent() {
        return "android.media.action.VIDEO_CAPTURE".equals(this.mIntent.getAction());
    }

    public boolean isScanQRCodeIntent() {
        String action = this.mIntent.getAction();
        return ACTION_QR_CODE_CAPTURE.equals(action) || ACTION_QR_CODE_ZXING.equals(action);
    }

    public Uri getExtraSavedUri() {
        Bundle extras = this.mIntent.getExtras();
        if (extras != null) {
            return (Uri) extras.getParcelable("output");
        }
        return null;
    }

    public String getExtraCropValue() {
        Bundle extras = this.mIntent.getExtras();
        if (extras != null) {
            return extras.getString("crop");
        }
        return null;
    }

    public long getRequestSize() {
        Bundle extras = this.mIntent.getExtras();
        if (extras != null) {
            return extras.getLong("android.intent.extra.sizeLimit");
        }
        return 0;
    }

    public int getVideoQuality() {
        if (this.mIntent.hasExtra("android.intent.extra.videoQuality")) {
            return this.mIntent.getIntExtra("android.intent.extra.videoQuality", 0);
        }
        throw new RuntimeException("EXTRA_VIDEO_QUALITY has not been defined");
    }

    public int getVideoDurationTime() {
        if (this.mIntent.hasExtra("android.intent.extra.durationLimit")) {
            return this.mIntent.getIntExtra("android.intent.extra.durationLimit", 0);
        }
        throw new RuntimeException("EXTRA_DURATION_LIMIT has not been defined");
    }

    public Boolean getExtraShouldSaveCapture() {
        Bundle extras = this.mIntent.getExtras();
        if (extras != null) {
            return Boolean.valueOf(extras.getBoolean("save-image", false));
        }
        return Boolean.valueOf(false);
    }

    public Boolean isQuickCapture() {
        return Boolean.valueOf(this.mIntent.getBooleanExtra(EXTRAS_QUICK_CAPTURE, false));
    }

    public Boolean isFromVolumeKey() {
        return Boolean.valueOf((this.mIntent.getFlags() & 8388608) == 0);
    }

    public Boolean isFromScreenSlide() {
        boolean z = false;
        if (this.mIntent.getBooleanExtra(EXTRAS_SCREEN_SLIDE, false) || isFrontCameraIntent(getCameraFacing())) {
            z = true;
        }
        return Boolean.valueOf(z);
    }

    public int getTimerDurationSeconds() {
        return this.mIntent.getIntExtra(CameraExtras.TIMER_DURATION_SECONDS, -1);
    }

    public boolean isUseFrontCamera() throws Exception {
        if (this.mIntent.hasExtra(CameraExtras.USE_FRONT_CAMERA)) {
            return this.mIntent.getBooleanExtra(CameraExtras.USE_FRONT_CAMERA, false);
        }
        throw new Exception("USE_FRONT_CAMERA extras has not been defined!");
    }

    public String getCameraMode() {
        if (this.mIntent.hasExtra(CameraExtras.CAMERA_MODE)) {
            String stringExtra = this.mIntent.getStringExtra(CameraExtras.CAMERA_MODE);
            if (stringExtra == null || stringExtra.isEmpty()) {
                return CameraMode.UNSPECIFIED;
            }
            return stringExtra;
        } else if ("android.media.action.VIDEO_CAMERA".equals(this.mIntent.getAction())) {
            return CameraMode.VIDEO;
        } else {
            if ("android.media.action.STILL_IMAGE_CAMERA".equals(this.mIntent.getAction())) {
                return "CAPTURE";
            }
            return CameraMode.UNSPECIFIED;
        }
    }

    public int getCameraModeId() {
        /*
        r2 = this;
        r0 = r2.getCameraMode();
        r1 = r0.hashCode();
        switch(r1) {
            case -2028086330: goto L_0x0081;
            case -1841345251: goto L_0x0077;
            case 65911732: goto L_0x006c;
            case 76699320: goto L_0x0062;
            case 81665115: goto L_0x0057;
            case 244777209: goto L_0x004c;
            case 1270567718: goto L_0x0042;
            case 1340413460: goto L_0x0037;
            case 1511893915: goto L_0x002d;
            case 1596340582: goto L_0x0023;
            case 1852610165: goto L_0x0018;
            case 1871805052: goto L_0x000d;
            default: goto L_0x000b;
        };
    L_0x000b:
        goto L_0x008b;
    L_0x000d:
        r1 = "MANUAL_MODE";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0015:
        r0 = 1;
        goto L_0x008c;
    L_0x0018:
        r1 = "PANORAMA";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0020:
        r0 = 4;
        goto L_0x008c;
    L_0x0023:
        r1 = "PANORAMIC";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x002b:
        r0 = 3;
        goto L_0x008c;
    L_0x002d:
        r1 = "PORTRAIT";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0035:
        r0 = 5;
        goto L_0x008c;
    L_0x0037:
        r1 = "SUPER_NIGHT";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x003f:
        r0 = 11;
        goto L_0x008c;
    L_0x0042:
        r1 = "CAPTURE";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x004a:
        r0 = 0;
        goto L_0x008c;
    L_0x004c:
        r1 = "FAST_MOTION";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0054:
        r0 = 9;
        goto L_0x008c;
    L_0x0057:
        r1 = "VIDEO";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x005f:
        r0 = 8;
        goto L_0x008c;
    L_0x0062:
        r1 = "SHORT_VIDEO";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x006a:
        r0 = 7;
        goto L_0x008c;
    L_0x006c:
        r1 = "SLOW_MOTION";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0074:
        r0 = 10;
        goto L_0x008c;
    L_0x0077:
        r1 = "SQUARE";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x007f:
        r0 = 6;
        goto L_0x008c;
    L_0x0081:
        r1 = "MANUAL";
        r0 = r0.equals(r1);
        if (r0 == 0) goto L_0x008b;
    L_0x0089:
        r0 = 2;
        goto L_0x008c;
    L_0x008b:
        r0 = -1;
    L_0x008c:
        switch(r0) {
            case 0: goto L_0x00ba;
            case 1: goto L_0x00b7;
            case 2: goto L_0x00b7;
            case 3: goto L_0x00b4;
            case 4: goto L_0x00b4;
            case 5: goto L_0x00b1;
            case 6: goto L_0x00ae;
            case 7: goto L_0x00ab;
            case 8: goto L_0x00a8;
            case 9: goto L_0x00a5;
            case 10: goto L_0x0095;
            case 11: goto L_0x0092;
            default: goto L_0x008f;
        };
    L_0x008f:
        r0 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
        return r0;
    L_0x0092:
        r0 = 173; // 0xad float:2.42E-43 double:8.55E-322;
        return r0;
    L_0x0095:
        r0 = com.android.camera.data.DataRepository.dataItemFeature();
        r0 = r0.fp();
        if (r0 == 0) goto L_0x00a2;
    L_0x009f:
        r0 = 172; // 0xac float:2.41E-43 double:8.5E-322;
        return r0;
    L_0x00a2:
        r0 = 168; // 0xa8 float:2.35E-43 double:8.3E-322;
        return r0;
    L_0x00a5:
        r0 = 169; // 0xa9 float:2.37E-43 double:8.35E-322;
        return r0;
    L_0x00a8:
        r0 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        return r0;
    L_0x00ab:
        r0 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        return r0;
    L_0x00ae:
        r0 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        return r0;
    L_0x00b1:
        r0 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        return r0;
    L_0x00b4:
        r0 = 166; // 0xa6 float:2.33E-43 double:8.2E-322;
        return r0;
    L_0x00b7:
        r0 = 167; // 0xa7 float:2.34E-43 double:8.25E-322;
        return r0;
    L_0x00ba:
        r0 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.CameraIntentManager.getCameraModeId():int");
    }

    public String getCameraSubMode() {
        return this.mIntent.getStringExtra(CameraExtras.CAMERA_SUB_MODE);
    }

    public boolean isOpenOnly() {
        String action = this.mIntent.getAction();
        boolean z = true;
        if (!(ACTION_VOICE_CONTROL.equals(action) || "android.intent.action.MAIN".equals(action) || "android.media.action.STILL_IMAGE_CAMERA".equals(action) || "android.media.action.STILL_IMAGE_CAMERA_SECURE".equals(action))) {
            z = false;
        }
        return this.mIntent.getBooleanExtra(CameraExtras.CAMERA_OPEN_ONLY, z);
    }

    public int getFilterMode() {
        return this.mIntent.getIntExtra(CameraExtras.CAMERA_FILTER_MODE, 0);
    }

    public String getHdrMode() {
        return this.mIntent.getStringExtra(CameraExtras.EXTRAS_CAMERA_HDR_MODE);
    }

    public String getFlashMode() {
        return this.mIntent.getStringExtra(CameraExtras.CAMERA_FLASH_MODE);
    }

    private Uri parseReferer(Intent intent) {
        if (intent == null) {
            return null;
        }
        try {
            Uri uri = (Uri) intent.getParcelableExtra("android.intent.extra.REFERRER");
            if (uri != null) {
                return uri;
            }
            String stringExtra = intent.getStringExtra("android.intent.extra.REFERRER_NAME");
            if (stringExtra != null) {
                return Uri.parse(stringExtra);
            }
            return null;
        } catch (BadParcelableException e) {
            Log.w(TAG, "Cannot read referrer from intent; intent extras contain unknown custom Parcelable objects");
        }
    }

    public void setReferer(Activity activity) {
        if (activity != null) {
            this.mReferer = activity.getReferrer();
        }
    }

    public String getCaller() {
        if (this.mReferer == null) {
            this.mReferer = parseReferer(this.mIntent);
        }
        if (this.mReferer == null) {
            return null;
        }
        return this.mReferer.getHost();
    }

    public boolean checkCallerLegality() {
        String caller = getCaller();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("The caller:");
        stringBuilder.append(caller);
        Log.d(str, stringBuilder.toString());
        if (caller == null) {
            return false;
        }
        boolean z = true;
        switch (caller.hashCode()) {
            case -1958346218:
                if (caller.equals(CALLER_GOOGLE_ASSISTANT)) {
                    z = false;
                    break;
                }
                break;
            case 277863260:
                if (caller.equals(CALLER_XIAO_SHOP)) {
                    z = true;
                    break;
                }
                break;
            case 881132242:
                if (caller.equals(CALLER_XIAO_AI_DEBUG_UTIL)) {
                    z = true;
                    break;
                }
                break;
            case 1535655722:
                if (caller.equals(CALLER_XIAO_AI)) {
                    z = true;
                    break;
                }
                break;
            case 2095214256:
                if (caller.equals(CALLER_FROM_HOME)) {
                    z = true;
                    break;
                }
                break;
        }
        switch (z) {
            case false:
            case true:
            case true:
            case true:
            case true:
                return true;
            default:
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("checkCallerLegality: Unknown caller: ");
                stringBuilder2.append(caller);
                Log.e(str2, stringBuilder2.toString());
                return false;
        }
    }

    public String getVoiceControlAction() {
        if (!this.mIntent.hasExtra(BroadcastControlExtras.EXTRAS_VOICE_CONTROL_ACTION)) {
            return ControlActions.CONTROL_ACTION_UNKNOWN;
        }
        String stringExtra = this.mIntent.getStringExtra(BroadcastControlExtras.EXTRAS_VOICE_CONTROL_ACTION);
        if (stringExtra == null) {
            return ControlActions.CONTROL_ACTION_UNKNOWN;
        }
        return stringExtra;
    }

    public int getCameraFacing() {
        return this.mIntent.getIntExtra(EXTRAS_CAMERA_FACING, -1);
    }
}
