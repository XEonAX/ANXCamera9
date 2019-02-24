package com.android.camera.data.data.runing;

import com.android.camera.CameraSettings;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.log.Log;

public class DataItemRunning extends DataItemBase {
    public static final String DATA_RUNING_HAND_GESTURE = "pref_hand_gesture";
    public static final String DATA_RUNING_HAND_GESTURE_STATUS = "pref_hand_gesture_status";
    public static final String DATA_RUNING_MENU_ULTRA_PIXEL_PHOTOGRAPHY_FRONT = "pref_menu_ultra_pixel_photography_front";
    public static final String DATA_RUNING_MENU_ULTRA_PIXEL_PHOTOGRAPHY_REAR = "pref_menu_ultra_pixel_photography_rear";
    public static final String DATA_RUNNING_AUTO_ZOOM = "pref_camera_auto_zoom";
    public static final String DATA_RUNNING_FILTER_INDEX = "pref_camera_shader_coloreffect_key";
    public static final String DATA_RUNNING_FOCUS_PEAK = "pref_camera_peak_key";
    public static final String DATA_RUNNING_GENDER_AGE = "pref_camera_show_gender_age_key";
    public static final String DATA_RUNNING_GRADIENTER = "pref_camera_gradienter_key";
    public static final String DATA_RUNNING_GROUP_SELFIES = "pref_camera_groupshot_mode_key";
    public static final String DATA_RUNNING_HHT = "pref_camera_hand_night_key";
    public static final String DATA_RUNNING_LIVE_CONFIG_IS_NEED_RESTORE = "pref_live_config_is_need_restore";
    public static final String DATA_RUNNING_LIVE_MUSIC_FIRST_REQUEST_TIME = "pref_key_live_music_first_request_time";
    public static final String DATA_RUNNING_LIVE_SHOT = "pref_live_shot_enabled";
    public static final String DATA_RUNNING_MAGIC_FOCUS = "pref_camera_ubifocus_key";
    public static final String DATA_RUNNING_MAGIC_MIRROR = "pref_camera_magic_mirror_key";
    public static final String DATA_RUNNING_MANUALLY = "pref_camera_manual_mode_key";
    public static final String DATA_RUNNING_PANORAMA_MOVE_DIRECTION = "pref_panorana_move_direction_key";
    public static final String DATA_RUNNING_PORTRAIT_LIGHTING = "pref_portrait_lighting";
    public static final String DATA_RUNNING_PORTRAIT_MODE = "pref_camera_portrait_mode_key";
    public static final String DATA_RUNNING_SCENE = "pref_camera_scenemode_setting_key";
    public static final String DATA_RUNNING_SCENE_VALUE = "pref_camera_scenemode_key";
    public static final String DATA_RUNNING_SQUARE_MODE = "pref_camera_square_mode_key";
    public static final String DATA_RUNNING_STEREO_MODE = "pref_camera_stereo_mode_key";
    public static final String DATA_RUNNING_SUPER_RESOLUTION = "pref_camera_super_resolution_key";
    public static final String DATA_RUNNING_TILT = "pref_camera_tilt_shift_mode";
    public static final String DATA_RUNNING_TILT_VALUE = "pref_camera_tilt_shift_key";
    public static final String DATA_RUNNING_TIMER = "pref_delay_capture_mode";
    public static final String DATA_RUNNING_ULTRA_WIDE_BOKEH = "pref_ultra_wide_bokeh_enabled";
    public static final String DATA_RUNNING_VIDEO_FAST = "pref_video_speed_fast_key";
    public static final String DATA_RUNNING_VIDEO_HFR = "pref_video_speed_hfr_key";
    public static final String DATA_RUNNING_VIDEO_SLOW = "pref_video_speed_slow_key";
    private static final String KEY = "camera_running";
    private ComponentRunningTiltValue componentRunningTiltValue;
    private ComponentConfigFilter mComponentConfigFilter;
    private ComponentRunningLighting mComponentRunningLighting;
    private ComponentRunningLiveShot mComponentRunningLiveShot;
    private ComponentRunningSceneValue mComponentRunningSceneValue;
    private ComponentRunningTimer mComponentRunningTimer;
    private int mLastUiStyle;
    private int mUiStyle;

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

    public String provideKey() {
        return KEY;
    }

    public boolean isTransient() {
        return true;
    }

    public ComponentRunningTimer getComponentRunningTimer() {
        if (this.mComponentRunningTimer == null) {
            this.mComponentRunningTimer = new ComponentRunningTimer(this);
        }
        return this.mComponentRunningTimer;
    }

    public ComponentRunningSceneValue getComponentRunningSceneValue() {
        if (this.mComponentRunningSceneValue == null) {
            this.mComponentRunningSceneValue = new ComponentRunningSceneValue(this);
        }
        return this.mComponentRunningSceneValue;
    }

    public ComponentRunningTiltValue getComponentRunningTiltValue() {
        if (this.componentRunningTiltValue == null) {
            this.componentRunningTiltValue = new ComponentRunningTiltValue(this);
        }
        return this.componentRunningTiltValue;
    }

    public ComponentConfigFilter getComponentConfigFilter() {
        if (this.mComponentConfigFilter == null) {
            this.mComponentConfigFilter = new ComponentConfigFilter(this);
        }
        return this.mComponentConfigFilter;
    }

    public ComponentRunningLighting getComponentRunningLighting() {
        if (this.mComponentRunningLighting == null) {
            this.mComponentRunningLighting = new ComponentRunningLighting(this);
        }
        return this.mComponentRunningLighting;
    }

    public ComponentRunningLiveShot getComponentRunningLiveShot() {
        if (this.mComponentRunningLiveShot == null) {
            this.mComponentRunningLiveShot = new ComponentRunningLiveShot(this);
        }
        return this.mComponentRunningLiveShot;
    }

    public String getVideoSpeed() {
        if (isSwitchOn("pref_video_speed_fast_key")) {
            return CameraSettings.VIDEO_SPEED_FAST;
        }
        if (isSwitchOn("pref_video_speed_slow_key")) {
            return CameraSettings.VIDEO_SPEED_SLOW;
        }
        if (isSwitchOn("pref_video_speed_hfr_key")) {
            return CameraSettings.VIDEO_SPEED_HFR;
        }
        return "normal";
    }

    public int getUiStyle() {
        return this.mUiStyle;
    }

    public int getLastUiStyle() {
        return this.mLastUiStyle;
    }

    public void setUiStyle(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setUiStyle: ");
        stringBuilder.append(i);
        Log.d("DataItemRunning", stringBuilder.toString());
        this.mLastUiStyle = this.mUiStyle;
        this.mUiStyle = i;
    }

    public void setLiveConfigIsNeedRestore(boolean z) {
        putBoolean("pref_live_config_is_need_restore", z);
    }

    public boolean getLiveConfigIsNeedRestore() {
        return getBoolean("pref_live_config_is_need_restore", false);
    }

    public void setLiveMusicFirstRequestTime(long j) {
        putLong("pref_key_live_music_first_request_time", j);
    }

    public long getLiveMusicFirstRequestTime() {
        return getLong("pref_key_live_music_first_request_time", -1);
    }

    public boolean getHandGestureRunning() {
        return getBoolean("pref_hand_gesture_status", false);
    }

    public void setHandGestureRunning(boolean z) {
        putBoolean("pref_hand_gesture_status", z);
    }
}
