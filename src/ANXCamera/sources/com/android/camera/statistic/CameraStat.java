package com.android.camera.statistic;

import android.content.Context;
import android.content.res.Resources;
import android.os.SystemProperties;
import com.aeonax.camera.R;
import com.android.camera.log.Log;
import com.xiaomi.mistatistic.sdk.CustomSettings;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Map;
import java.util.Map.Entry;
import miui.os.Build;

public class CameraStat {
    private static final String APP_ID = "2882303761517373386";
    private static final String APP_KEY = "5641737344386";
    public static final String CATEGORY_CAMERA = "capture";
    public static final String CATEGORY_COUNTER = "counter";
    public static final String CATEGORY_SETTINGS = "settings";
    private static final String CHANNEL = SystemProperties.get("ro.product.mod_device", Build.DEVICE);
    public static final String KEY_AI_DETECT_CHANGED = "ai_detect_changed";
    public static final String KEY_AI_SCENE_CHANGED = "ai_scene_changed";
    public static final String KEY_AI_SCENE_SWITCHED = "ai_scene_switched";
    public static final String KEY_BACK_CAMERA_INFO = "back_camera_info";
    public static final String KEY_BEAUTY_3D_MAKEUP_BUTTON = "beauty_3d_makeup_button";
    public static final String KEY_BEAUTY_BUTTON = "beauty_button";
    public static final String KEY_BEAUTY_LEVEL_BUTTON = "beauty_level_button";
    public static final String KEY_BEAUTY_MAKEUP_BUTTON = "beauty_makeup_button";
    public static final String KEY_BEAUTY_SWITCH_CHANGED = "beauty_switch_changed";
    public static final String KEY_BURST_SHOT_TIMES = "burst_shot_times";
    public static final String KEY_CALL_CAMERA_FROM_VOICE_CONTROL = "voice_assist_call_event";
    public static final String KEY_CAMERA_BROADCAST_KILL_SERVICE = "camera_broadcast_kill_service";
    public static final String KEY_CAMERA_ERROR_DIALOG_SHOW = "camera_error_dialog_show";
    public static final String KEY_CAMERA_HARDWARE_ERROR = "camera_hardware_error";
    public static final String KEY_DUAL_ZOOM_CHANGED = "dual_zoom_changed";
    public static final String KEY_EV_ADJUSTED = "ev_adjusted";
    public static final String KEY_FILTER_CHANGED = "filter_changed";
    public static final String KEY_FLASH_CHANGED = "flash_changed";
    public static final String KEY_FPS960_PROCESS_FAILED = "fps_960_process_failed";
    public static final String KEY_FPS960_TOO_SHORT = "fps_960_too_short";
    public static final String KEY_FRONT_CAMERA_INFO = "front_camera_info";
    public static final String KEY_GENDER_AGE_CHANGED = "gender_age_changed";
    public static final String KEY_GOTO_GALLERY = "goto_gallery";
    public static final String KEY_GOTO_SETTINGS = "goto_settings";
    public static final String KEY_GRADIENT_CHANGED = "gradienter_changed";
    public static final String KEY_GROUP_SHOT_CHANGED = "group_shot_changed";
    public static final String KEY_HDR_CHANGED = "hdr_changed";
    public static final String KEY_HHT_CHANGED = "hht_changed";
    public static final String KEY_LIGHTING_BUTTON = "lighting_button";
    public static final String KEY_LIGHTING_CHANGED = "lighting_changed";
    public static final String KEY_MAGIC_MIRROR_CHANGED = "magic_mirror_changed";
    public static final String KEY_MANUAL_AWB_CHANGED = "manual_awb_changed";
    public static final String KEY_MANUAL_EXPOSURE_TIME_CHANGED = "manual_exposure_time_changed";
    public static final String KEY_MANUAL_FOCUS_PEAK_CHANGED = "manual_focus_peak_changed";
    public static final String KEY_MANUAL_FOCUS_POSITION_CHANGED = "manual_focus_position_changed";
    public static final String KEY_MANUAL_ISO_CHANGED = "manual_iso_changed";
    public static final String KEY_MANUAL_LENS_CHANGED = "manual_lens_changed";
    public static final String KEY_NEW_SLOW_MOTION = "slow_motion_mode";
    public static final String KEY_PANORAMA_DIRECTION_CHANGED = "panorama_direction_changed";
    public static final String KEY_PICTURE_LOST = "lost_picture";
    public static final String KEY_PICTURE_MISS_TAKEN = "picture_miss_taken";
    public static final String KEY_PICTURE_TAKEN = "picture_taken";
    public static final String KEY_PICTURE_TAKEN_BEAUTY = "picture_taken_beauty";
    public static final String KEY_PICTURE_TAKEN_BEAUTY_LEGACY = "picture_taken_beauty_legacy";
    public static final String KEY_PICTURE_TAKEN_BURST = "picture_taken_burst";
    public static final String KEY_PICTURE_TAKEN_GAP = "picture_taken_gap";
    public static final String KEY_PICTURE_TAKEN_MANUAL = "picture_taken_manual";
    public static final String KEY_PICTURE_TAKEN_PANORAMA = "picture_taken_panorama";
    public static final String KEY_POCKET_MODE_ENTER = "pocket_mode_enter";
    public static final String KEY_POCKET_MODE_KEYGUARD_EXIT = "pocket_mode_keyguard_exit";
    public static final String KEY_POCKET_MODE_SENSOR_DELAY = "pocket_mode_sensor_delay";
    public static final String KEY_QRCODE_DETECTED = "qrcode_detected";
    public static final String KEY_SNAP_CAMERA = "snap_camera";
    public static final String KEY_START_APP_COST = "start_app_cost";
    public static final String KEY_SUPER_RESOLUTION_CHANGED = "super_resolution_changed";
    public static final String KEY_T2T_TIMES = "t2t_times";
    public static final String KEY_TAKE_PICTURE_COST = "take_picture_cost";
    public static final String KEY_TILTSHIFT_CHANGED = "tiltshift_changed";
    public static final String KEY_TIMER_CHANGED = "timer_changed";
    public static final String KEY_VIDEO_MODE_CHANGED = "video_mode_changed";
    public static final String KEY_VIDEO_PAUSE_RECORDING = "video_pause_recording";
    public static final String KEY_VIDEO_SNAPSHOT = "video_snapshot";
    public static final String KEY_VIDEO_TAKEN = "video_taken";
    public static final String KEY_VIDEO_TIME_LAPSE_INTERVAL = "video_time_lapse_interval";
    public static final String KEY_ZOOM_ADJUSTED = "zoom_adjusted";
    public static final String LOCATION_CLOSED = "关";
    public static final String LOCATION_WITH = "有";
    public static final String LOCATION_WITHOUT = "无";
    public static final String NEW_SLOW_MOTION_SWITCH_FPS = "帧率切换";
    public static final String PANORAMA_DIRECTION_L2R = "从左往右";
    public static final String PANORAMA_DIRECTION_R2L = "从右往左";
    public static final String PARAM_AI_SCENE_DETECTED = "智能场景发现";
    public static final String PARAM_AI_SCENE_SWITCHED = "智能场景开关";
    public static final String PARAM_AUTO_HDR = "自动HDR";
    public static final String PARAM_AUTO_HHT = "自动HHT";
    public static final String PARAM_AWB = "白平衡";
    public static final String PARAM_BEAUTY_BLUSHER = "腮红";
    public static final String PARAM_BEAUTY_CHIN = "翘下巴";
    public static final String PARAM_BEAUTY_ENLARGE_EYE = "大眼";
    public static final String PARAM_BEAUTY_EYEBROW_DYE = "染眉";
    public static final String PARAM_BEAUTY_JELLY_LIPS = "果冻唇";
    public static final String PARAM_BEAUTY_LEVEL = "等级";
    public static final String PARAM_BEAUTY_LIPS = "花瓣唇";
    public static final String PARAM_BEAUTY_NECK = "天鹅颈";
    public static final String PARAM_BEAUTY_NOSE = "芭比鼻";
    public static final String PARAM_BEAUTY_PUPIL_LINE = "美瞳线";
    public static final String PARAM_BEAUTY_RISORIUS = "苹果肌";
    public static final String PARAM_BEAUTY_SKIN_COLOR = "美白";
    public static final String PARAM_BEAUTY_SKIN_SMOOTH = "嫩肤";
    public static final String PARAM_BEAUTY_SLIM_FACE = "瘦脸";
    public static final String PARAM_BEAUTY_SLIM_NOSE = "瘦鼻";
    public static final String PARAM_BEAUTY_SMILE = "微笑";
    public static final String PARAM_CAMERA_ID = "前后摄";
    public static final String PARAM_CAMERA_MODE = "模式";
    public static final String PARAM_COMMON_MODE = "方式";
    public static final String PARAM_DUAL_WATERMARK = "双摄水印";
    public static final String PARAM_ET = "快门";
    public static final String PARAM_FILTER = "滤镜";
    public static final String PARAM_FLASH_MODE = "闪光灯";
    public static final String PARAM_FOCUS_PEAK = "峰值对焦";
    public static final String PARAM_FOCUS_POSITION = "对焦";
    public static final String PARAM_GENDER_AGE = "年龄检测";
    public static final String PARAM_GRADIENTER = "水平仪";
    public static final String PARAM_GROUP_SHOT = "合影优选";
    public static final String PARAM_HDR = "HDR";
    public static final String PARAM_HHT = "HHT";
    public static final String PARAM_ISO = "感光度";
    public static final String PARAM_LENS = "镜头";
    public static final String PARAM_LIGHTING = "光效";
    public static final String PARAM_LOCATION = "地理位置";
    public static final String PARAM_MAGIC_MIRROR = "魔镜";
    public static final String PARAM_PANORAMA_DIRECTION = "方向";
    public static final String PARAM_PICTURE_RATIO = "画幅";
    public static final String PARAM_QUALITY = "画质";
    public static final String PARAM_SUPER_RESOLUTION = "超分辨率";
    public static final String PARAM_TILTSHIFT = "移轴";
    public static final String PARAM_TIMER = "倒计时";
    public static final String PARAM_TIME_WATERMARK = "时间水印";
    public static final String PARAM_TRIGGER_MODE = "触发方式";
    public static final String PARAM_VIDEO_FPS = "帧率";
    public static final String PARAM_VIDEO_MODE = "模式";
    public static final String PARAM_VIDEO_TIME = "时长";
    public static final String PARAM_ZOOM = "变焦";
    public static final String POCKET_MODE_KEYGUARD_EXIT_DISMISS = "锁屏手动解除";
    public static final String POCKET_MODE_KEYGUARD_EXIT_TIMEOUT = "锁屏超时退出";
    public static final String POCKET_MODE_KEYGUARD_EXIT_UNLOCK = "锁屏自动解除";
    public static final String POCKET_MODE_NONUI_ENTER_SNAP = "NonUI街拍";
    public static final String POCKET_MODE_NONUI_ENTER_VOLUME = "NonUI音量键";
    public static final String POCKET_MODE_PSENSOR_ENTER_KEYGUARD = "Psensor锁屏进入";
    public static final String POCKET_MODE_PSENSOR_ENTER_SNAP = "Psensor街拍";
    public static final String POCKET_MODE_PSENSOR_ENTER_VOLUME = "Psensor音量键";
    public static final String SWITCH_MODE_CLICK = "点击";
    public static final String SWITCH_MODE_SLIDE = "滑动";
    private static final String TAG = CameraStat.class.getSimpleName();
    public static final String VALUE_BACK_CAMERA = "后摄";
    public static final String VALUE_FRONT_CAMERA = "前摄";
    public static final String VALUE_OFF = "off";
    public static final String VALUE_ON = "on";
    public static final String ZOOM_1X = "1x";
    public static final String ZOOM_2X = "2x";
    public static final String ZOOM_MODE_GESTURE = "手势";
    public static final String ZOOM_MODE_VOLUME = "音量键";
    private static boolean sDumpStatEvent;
    private static boolean sIsAnonymous;
    private static boolean sIsCounterEventEnabled;
    private static boolean sIsEnabled = true;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Category {
    }

    public static void initialize(Context context) {
        sDumpStatEvent = SystemProperties.getBoolean("camera.debug.dump_stat_event", false);
        Resources resources = context.getResources();
        sIsEnabled = resources.getBoolean(R.bool.pref_camera_statistic_default);
        if (sIsEnabled) {
            sIsCounterEventEnabled = resources.getBoolean(R.bool.pref_camera_statistic_counter_event_default);
            sIsAnonymous = Build.IS_INTERNATIONAL_BUILD;
            MiStatInterface.initialize(context, APP_ID, APP_KEY, CHANNEL);
            MiStatInterface.enableExceptionCatcher(sIsAnonymous ^ true);
            MiStatInterface.setUploadPolicy(4, 90000);
            CustomSettings.setUseSystemUploadingService(true);
        }
    }

    public static boolean isCounterEventDisabled() {
        return sIsCounterEventEnabled ^ 1;
    }

    public static void recordPageStart(Context context, String str) {
        if (sIsEnabled) {
            MiStatInterface.recordPageStart(context, str);
        }
    }

    public static void recordPageEnd() {
        if (sIsEnabled) {
            MiStatInterface.recordPageEnd();
        }
    }

    public static void recordCountEvent(String str, String str2) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCountEventAnonymous(str, str2);
            } else {
                MiStatInterface.recordCountEvent(str, str2);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CountEvent", str, str2, null, null);
        }
    }

    public static void recordCountEvent(String str, String str2, Map<String, String> map) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCountEventAnonymous(str, str2, map);
            } else {
                MiStatInterface.recordCountEvent(str, str2, map);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CountEvent", str, str2, null, map);
        }
    }

    public static void recordCalculateEvent(String str, String str2, long j) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCalculateEventAnonymous(str, str2, j);
            } else {
                MiStatInterface.recordCalculateEvent(str, str2, j);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CalculateEvent", str, str2, String.valueOf(j), null);
        }
    }

    public static void recordCalculateEvent(String str, String str2, long j, Map<String, String> map) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordCalculateEventAnonymous(str, str2, j, map);
            } else {
                MiStatInterface.recordCalculateEvent(str, str2, j, map);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("CalculateEvent", str, str2, String.valueOf(j), map);
        }
    }

    public static void recordStringPropertyEvent(String str, String str2, String str3) {
        if (sIsEnabled) {
            if (sIsAnonymous) {
                MiStatInterface.recordStringPropertyEventAnonymous(str, str2, str3);
            } else {
                MiStatInterface.recordStringPropertyEvent(str, str2, str3);
            }
        }
        if (sDumpStatEvent) {
            dumpEvent("PropertyEvent", str, str2, str3, null);
        }
    }

    private static void dumpEvent(String str, String str2, String str3, String str4, Map<String, String> map) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(" category:");
        stringBuilder.append(str2);
        stringBuilder.append(" key:");
        stringBuilder.append(str3);
        if (str4 != null) {
            stringBuilder.append(" value:");
            stringBuilder.append(str4);
        }
        if (map != null) {
            stringBuilder.append("\n");
            stringBuilder.append("params:");
            stringBuilder.append("[");
            for (Entry entry : map.entrySet()) {
                stringBuilder.append((String) entry.getKey());
                stringBuilder.append(":");
                stringBuilder.append((String) entry.getValue());
                stringBuilder.append(" ");
            }
            int length = stringBuilder.length();
            stringBuilder.replace(length - 1, length, "]");
        }
        Log.d(TAG, stringBuilder.toString());
    }
}
