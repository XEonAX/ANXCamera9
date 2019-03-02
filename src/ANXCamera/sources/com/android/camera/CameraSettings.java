package com.android.camera;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.Size;
import android.hardware.input.InputManager;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.os.SystemProperties;
import android.provider.MiuiSettings;
import android.provider.MiuiSettings.Key;
import android.provider.MiuiSettings.ScreenEffect;
import android.provider.Settings.Global;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.util.Range;
import android.util.SparseArray;
import android.util.TypedValue;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.CameraScene;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeautyBody;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.provider.DataProvider;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.fragment.manually.adapter.ExtraSlideFNumberAdapter;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.preferences.ListPreference;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.MiCustomFpsRange;
import com.mi.config.b;
import com.oneplus.camera.R;
import java.io.File;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import miui.reflect.Method;

public class CameraSettings {
    public static final String AI_LENS_PACKAGE = "com.xiaomi.lens";
    public static final int APP_V10_SETTINGS_VERSION = 1;
    public static final int APP_V20_SETTINGS_VERSION = 3;
    public static final int APP_V30_SETTINGS_VERSION = 4;
    public static final int ASPECT_RATIO_16_9 = 1;
    public static final int ASPECT_RATIO_18_9 = 3;
    public static final int ASPECT_RATIO_1_1 = 2;
    public static final int ASPECT_RATIO_4_3 = 0;
    public static final int AUTO_FOCUS_POSITION = 1000;
    public static int BOTTOM_CONTROL_HEIGHT = 0;
    public static final String CLOUD_APPMARKET_SERVER = "http://file.market.xiaomi.com/download/";
    public static final int CURRENT_VERSION = 4;
    private static final boolean DEBUG_FAST_SHOT = SystemProperties.getBoolean("debug.vendor.camera.app.quickshot.enable", false);
    public static final int DEFAULT_VIDEO_DURATION = 0;
    private static final int DUAL_CAMERA_USE_HINT_SHOWN_MAX_TIMES = 5;
    private static final String DUAL_CAMERA_WATER_MARK_FILE = "/vendor/etc/camera/dualcamera.png";
    private static final String DUAL_CAMERA_WATER_MARK_FILE_FROM_VENDOR_INDIA = "/vendor/etc/camera/dualcamera_india.png";
    private static final String EDGE_HANDGRIP_MODE = "edge_handgrip";
    private static final String EDGE_HANDGRIP_MODE_BACK = "edge_handgrip_back";
    private static final String EDGE_HANDGRIP_MODE_CLEAN = "edge_handgrip_clean";
    private static final String EDGE_HANDGRIP_MODE_PHOTO = "edge_handgrip_photo";
    private static final String EDGE_HANDGRIP_MODE_SCREENSHOT = "edge_handgrip_screenshot";
    public static final String EXPOSURE_DEFAULT_VALUE = "0";
    public static final String F_NUMBER_DEFAULT_VALUE = ExtraSlideFNumberAdapter.F_NUMBERS[13];
    public static final String GOOGLE_LENS_PACKAGE = "com.google.ar.lens";
    public static final String KEY_AE_AF_LOCK_SUPPORT = "pref_camera_ae_af_lock_support_key";
    public static final String KEY_AI_DETECT_ENABLE = "pref_camera_ai_detect_enable_key";
    public static final String KEY_AI_SCENE_MODE = "pref_camera_ai_scene_mode_key";
    public static final String KEY_ANTIBANDING = "pref_camera_antibanding_key";
    public static final String KEY_AUTOEXPOSURE = "pref_camera_autoexposure_key";
    public static final String KEY_AUTO_CHROMA_FLASH = "pref_auto_chroma_flash_key";
    public static final String KEY_AUTO_ZOOM = "pref_camera_auto_zoom";
    public static final String KEY_BEAUTIFY_BLUSHER_RATIO = "pref_beautify_blusher_ratio_key";
    public static final String KEY_BEAUTIFY_CHIN_RATIO = "pref_beautify_chin_ratio_key";
    public static final String KEY_BEAUTIFY_ENLARGE_EYE = "pref_skin_beautify_enlarge_eye_key";
    public static final String KEY_BEAUTIFY_ENLARGE_EYE_RATIO = "pref_beautify_enlarge_eye_ratio_key";
    public static final String KEY_BEAUTIFY_EYEBROW_DYE_RATIO = "pref_beautify_eyebrow_dye_ratio_key";
    public static final String KEY_BEAUTIFY_JELLY_LIPS_RATIO = "pref_beautify_jelly_lips_ratio_key";
    public static final String KEY_BEAUTIFY_LIPS_RATIO = "pref_beautify_lips_ratio_key";
    public static final String KEY_BEAUTIFY_NECK_RATIO = "pref_beautify_neck_ratio_key";
    public static final String KEY_BEAUTIFY_NOSE_RATIO = "pref_beautify_nose_ratio_key";
    public static final String KEY_BEAUTIFY_PUPIL_LINE_RATIO = "pref_beautify_pupil_line_ratio_key";
    public static final String KEY_BEAUTIFY_RISORIUS_RATIO = "pref_beautify_risorius_ratio_key";
    public static final String KEY_BEAUTIFY_SKIN_COLOR = "pref_skin_beautify_skin_color_key";
    public static final String KEY_BEAUTIFY_SKIN_COLOR_RATIO = "pref_beautify_skin_color_ratio_key";
    public static final String KEY_BEAUTIFY_SKIN_SMOOTH = "pref_skin_beautify_skin_smooth_key";
    public static final String KEY_BEAUTIFY_SKIN_SMOOTH_RATIO = "pref_beautify_skin_smooth_ratio_key";
    public static final String KEY_BEAUTIFY_SLIM_FACE = "pref_skin_beautify_slim_face_key";
    public static final String KEY_BEAUTIFY_SLIM_FACE_RATIO = "pref_beautify_slim_face_ratio_key";
    public static final String KEY_BEAUTIFY_SLIM_NOSE_RATIO = "pref_beautify_slim_nose_ratio_key";
    public static final String KEY_BEAUTIFY_SMILE_RATIO = "pref_beautify_smile_ratio_key";
    public static final String KEY_BEAUTY_BODY_SLIM_RATIO = "pref_beauty_body_slim_ratio";
    public static final String KEY_BEAUTY_HEAD_SLIM_RATIO = "pref_beauty_head_slim_ratio";
    public static final String KEY_BEAUTY_LEG_SLIM_RATIO = "key_beauty_leg_slim_ratio";
    public static final String KEY_BEAUTY_MAKEUP_CLICKED = "pref_beauty_makeup_clicked_key";
    public static final String KEY_BEAUTY_REMODELING_CLICKED = "pref_beauty_remodeling_clicked_key";
    public static final String KEY_BEAUTY_SHOULDER_SLIM_RATIO = "pref_beauty_shoulder_slim_ratio";
    public static final String KEY_BROADCAST_KILL_SERVICE_TIME = "pref_broadcast_kill_service_key";
    public static final String KEY_BURST_SHOOT = "pref_camera_burst_shooting_key";
    public static final String KEY_CAMERA_ASD_MOTION = "pref_camera_asd_motion_key";
    public static final String KEY_CAMERA_ASD_NIGHT = "pref_camera_asd_night_key";
    public static final String KEY_CAMERA_CONFIRM_LOCATION_SHOWN = "pref_camera_confirm_location_shown_key";
    public static final String KEY_CAMERA_DUAL_ENABLE = "pref_camera_dual_enable_key";
    public static final String KEY_CAMERA_DUAL_SAT_ENABLE = "pref_camera_dual_sat_enable_key";
    public static final String KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN = "pref_camera_facedetection_auto_hidden_key";
    public static final String KEY_CAMERA_FIRST_AI_SCENE_USE_HINT_SHOWN = "pref_camera_first_ai_scene_use_hint_shown_key";
    public static final String KEY_CAMERA_FIRST_PORTRAIT_USE_HINT_SHOWN = "pref_camera_first_portrait_use_hint_shown_key";
    public static final String KEY_CAMERA_FIRST_ULTRA_WIDE_USE_HINT_SHOWN = "pref_camera_first_ultra_wide_use_hint_shown_key";
    public static final String KEY_CAMERA_FIRST_USE_HINT_SHOWN = "pref_camera_first_use_hint_shown_key";
    public static final String KEY_CAMERA_FOCUS_MODE = "pref_camera_focus_mode_key";
    public static final String KEY_CAMERA_GRADIENTER_KEY = "pref_camera_gradienter_key";
    public static final String KEY_CAMERA_GROUPSHOT_MODE = "pref_camera_groupshot_mode_key";
    public static final String KEY_CAMERA_GROUPSHOT_PRIMITIVE = "pref_groupshot_with_primitive_picture_key";
    public static final String KEY_CAMERA_HAND_NIGHT = "pref_camera_hand_night_key";
    public static final String KEY_CAMERA_HDR = "pref_camera_hdr_key";
    public static final String KEY_CAMERA_HSR_VALUE = "pref_camera_hsr_value_key";
    public static final String KEY_CAMERA_ID = "pref_camera_id_key";
    public static final String KEY_CAMERA_LAB_OPTIONS_VISIBLE = "pref_camera_lab_option_key_visible";
    public static final String KEY_CAMERA_LAB_SUB_OPTIONS = "pref_camera_lab_option_key";
    public static final String KEY_CAMERA_MAGIC_MIRROR_KEY = "pref_camera_magic_mirror_key";
    public static final String KEY_CAMERA_MANUALLY_LENS = "pref_camera_manually_lens";
    public static final String KEY_CAMERA_MANUAL_MODE = "pref_camera_manual_mode_key";
    public static final String KEY_CAMERA_MFNR_SAT_ENABLE = "pref_camera_mfnr_sat_enable_key";
    public static final String KEY_CAMERA_MODE_SETTINGS = "pref_camera_mode_settings_key";
    public static final String KEY_CAMERA_OBJECT_TRACK_HINT_SHOWN = "pref_camera_first_tap_screen_hint_shown_key";
    public static final String KEY_CAMERA_OPTIMIZED_FLASH_ENABLE = "pref_camera_optimized_flash_enable_key";
    public static final String KEY_CAMERA_PARALLEL_PROCESS_ENABLE = "pref_camera_parallel_process_enable_key";
    public static final String KEY_CAMERA_PEAKING_FOCUS = "pref_camera_peak_key";
    public static final String KEY_CAMERA_PORTRAIT_MODE = "pref_camera_portrait_mode_key";
    public static final String KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY = "pref_camera_portrait_with_facebeauty_key";
    public static final String KEY_CAMERA_PROXIMITY_LOCK = "pref_camera_proximity_lock_key";
    public static final String KEY_CAMERA_QUICK_SHOT_ANIM_ENABLE = "pref_camera_quick_shot_anim_enable_key";
    public static final String KEY_CAMERA_QUICK_SHOT_ENABLE = "pref_camera_quick_shot_enable_key";
    public static final String KEY_CAMERA_SNAP = "pref_camera_snap_key";
    public static final String KEY_CAMERA_SOUND = "pref_camerasound_key";
    public static final String KEY_CAMERA_SQUARE_MODE = "pref_camera_square_mode_key";
    public static final String KEY_CAMERA_SR_ENABLE = "pref_camera_sr_enable_key";
    public static final String KEY_CAMERA_STEREO = "pref_camera_stereo_key";
    public static final String KEY_CAMERA_STEREO_MODE = "pref_camera_stereo_mode_key";
    public static final String KEY_CAMERA_SUPER_RESOLUTION = "pref_camera_super_resolution_key";
    public static final String KEY_CAMERA_TILT_SHIFT = "pref_camera_tilt_shift_key";
    public static final String KEY_CAMERA_TILT_SHIFT_MODE = "pref_camera_tilt_shift_mode";
    public static final String KEY_CAMERA_ZOOM_MODE = "pref_camera_zoom_mode_key";
    public static final String KEY_CAPTURE_ULTRA_WIDE_MODE = "pref_ultra_wide_status";
    public static final String KEY_CAPTURE_WHEN_STABLE = "pref_capture_when_stable_key";
    public static final String KEY_CATEGORY_ADVANCE_SETTING = "category_advance_setting";
    public static final String KEY_CATEGORY_CAMCORDER_SETTING = "category_camcorder_setting";
    public static final String KEY_CATEGORY_CAPTURE_SETTING = "category_camera_setting";
    public static final String KEY_CATEGORY_DEVICE_SETTING = "category_device_setting";
    public static final String KEY_COLOR_EFFECT = "pref_camera_coloreffect_key";
    public static final String KEY_CUSTOM_WATERMARK = "pref_custom_watermark";
    public static final String KEY_DELAY_CAPTURE = "pref_delay_capture_key";
    public static final String KEY_DELAY_CAPTURE_MODE = "pref_delay_capture_mode";
    public static final String KEY_DEVICE_WATERMARK = "pref_dualcamera_watermark";
    public static final String KEY_DUAL_CAMERA_USE_HINT_TIMES = "pref_dual_camera_use_hint_shown_times_key";
    public static final String KEY_EXPOSURE = "pref_camera_exposure_key";
    public static final String KEY_EYE_LIGHT_TYPE = "pref_eye_light_type_key";
    public static final String KEY_FACE_BEAUTY = "pref_camera_face_beauty_key";
    public static final String KEY_FACE_BEAUTY_ADVANCED = "pref_camera_face_beauty_advanced_key";
    public static final String KEY_FACE_BEAUTY_MODE = "pref_camera_face_beauty_mode_key";
    public static final String KEY_FACE_BEAUTY_SWITCH = "pref_camera_face_beauty_switch_key";
    public static final String KEY_FACE_DETECTION = "pref_camera_facedetection_key";
    public static final String KEY_FACE_INFO_WATERMARK = "pref_face_info_watermark_key";
    public static final String KEY_FINGERPRINT_CAPTURE = "pref_fingerprint_capture_key";
    public static final String KEY_FLASH_MODE = "pref_camera_flashmode_key";
    public static final String KEY_FOCUS_SHOOT = "pref_camera_focus_shoot_key";
    public static final String KEY_FRONT_CAMERA_FIRST_USE_HINT_SHOWN = "pref_front_camera_first_use_hint_shown_key";
    public static final String KEY_FRONT_MIRROR = "pref_front_mirror_key";
    public static final String KEY_F_NUMBER = "pref_f_number";
    public static final String KEY_HAND_GESTURE = "pref_hand_gesture";
    public static final String KEY_HAND_GESTURE_STATUS = "pref_hand_gesture_status";
    public static final String KEY_JPEG_QUALITY = "pref_camera_jpegquality_key";
    public static final String KEY_LENS_DIRTY_DETECT_DATE = "pref_lens_dirty_detect_date_key";
    public static final String KEY_LENS_DIRTY_DETECT_ENABLED = "pref_lens_dirty_detect_enabled_key";
    public static final String KEY_LENS_DIRTY_DETECT_TIMES = "pref_lens_dirty_detect_times_key";
    public static final String KEY_LIVE_ALL_SWITCH_ADD_VALUE = "pref_live_all_switch_add_value";
    public static final String KEY_LIVE_BEAUTY_STATUS = "pref_live_beauty_status";
    public static final String KEY_LIVE_CONFIG_IS_NEED_RESTORE = "pref_live_config_is_need_restore";
    public static final String KEY_LIVE_ENLARGE_EYE_RATIO = "key_live_enlarge_eye_ratio";
    public static final String KEY_LIVE_FILTER = "key_live_filter";
    public static final String KEY_LIVE_MODULE_CLICKED = "pref_live_module_clicked";
    public static final String KEY_LIVE_MUSIC_FIRST_REQUEST_TIME = "pref_key_live_music_first_request_time";
    public static final String KEY_LIVE_MUSIC_HINT = "pref_live_music_hint_key";
    public static final String KEY_LIVE_MUSIC_PATH = "pref_live_music_path_key";
    public static final String KEY_LIVE_RECORD_IS_SELECTED_BGM = "pref_key_live_record_is_selected_bgm";
    public static final String KEY_LIVE_SHOT = "pref_live_shot_enabled";
    public static final String KEY_LIVE_SHRINK_FACE_RATIO = "key_live_shrink_face_ratio";
    public static final String KEY_LIVE_SMOOTH_STRENGTH = "key_live_smooth_strength";
    public static final String KEY_LIVE_SPEED = "pref_live_speed_key";
    public static final String KEY_LIVE_STICKER = "pref_live_sticker_key";
    public static final String KEY_LIVE_STICKER_HINT = "pref_live_sticker_hint_key";
    public static final String KEY_LIVE_STICKER_INTERNAL = "pref_camera_live_sticker_internal";
    public static final String KEY_LIVE_STICKER_LAST_CACHE_TIME = "pref_live_sticker_last_cache_time";
    public static final String KEY_LIVE_STICKER_NAME = "pref_live_sticker_name_key";
    public static final String KEY_LIVE_STICKER_NEED_RED_DOT = "pref_live_sticker_need_red_dot";
    public static final String KEY_LIVE_STICKER_RED_DOT_TIME = "pref_live_sticker_red_dot_time";
    public static final String KEY_LOCALWORDS_VERSION = "pref_localwords_version";
    public static final String KEY_LONG_PRESS_SHUTTER = "pref_camera_long_press_shutter_key";
    public static final String KEY_LONG_PRESS_SHUTTER_FEATURE = "pref_camera_long_press_shutter_feature_key";
    public static final String KEY_MENU_ULTRA_PIXEL_PHOTOGRAPHY_FRONT = "pref_menu_ultra_pixel_photography_front";
    public static final String KEY_MENU_ULTRA_PIXEL_PHOTOGRAPHY_REAR = "pref_menu_ultra_pixel_photography_rear";
    public static final String KEY_MOVIE_SOLID = "pref_camera_movie_solid_key";
    public static final String KEY_NORMAL_WIDE_LDC = "pref_camera_normal_wide_ldc_key";
    public static final String KEY_OPEN_CAMERA_FAIL = "open_camera_fail_key";
    public static final String KEY_ORIGIN_ULTR_WIDE_STATUS = "pref_origin_ultra_wide_status";
    public static final String KEY_PANORAMA_MODE = "pref_camera_panoramamode_key";
    public static final String KEY_PANORAMA_MOVE_DIRECTION = "pref_panorana_move_direction_key";
    public static final String KEY_PICTURE_SIZE = "pref_camera_picturesize_key";
    public static final String KEY_POPUP_TIP_BEAUTY_INTRO_CLICKED = "pref_popup_tip_beauty_intro_clicked_key";
    public static final String KEY_POPUP_TIP_BEAUTY_INTRO_SHOW_TIMES = "pref_popup_tip_beauty_intro_show_times_key";
    public static final String KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES = "pre_popup_ultra_wide_intro_show_times";
    public static final String KEY_PORTRAIT_LIGHTING = "pref_portrait_lighting";
    public static final String KEY_PRIORITY_STORAGE = "pref_priority_storage";
    public static final String KEY_QC_CONTRAST = "pref_qc_camera_contrast_key";
    public static final String KEY_QC_EXPOSURETIME = "pref_qc_camera_exposuretime_key";
    public static final String KEY_QC_FOCUS_MODE_SWITCHING = "pref_qc_focus_mode_switching_key";
    public static final String KEY_QC_FOCUS_POSITION = "pref_focus_position_key";
    public static final String KEY_QC_ISO = "pref_qc_camera_iso_key";
    public static final String KEY_QC_MANUAL_EXPOSURE = "pref_qc_camera_manual_exposure_key";
    public static final String KEY_QC_MANUAL_WHITEBALANCE_VALUE = "pref_qc_manual_whitebalance_k_value_key";
    public static final String KEY_QC_SATURATION = "pref_qc_camera_saturation_key";
    public static final String KEY_QC_SHARPNESS = "pref_qc_camera_sharpness_key";
    public static final String KEY_RECORD_LOCATION = "pref_camera_recordlocation_key";
    public static final String KEY_REFERENCE_LINE = "pref_camera_referenceline_key";
    public static final String KEY_RESTORED_FLASH_MODE = "pref_camera_restored_flashmode_key";
    public static final String KEY_RETAIN_CAMERA_MODE = "pref_retain_camera_mode_key";
    public static final String KEY_SCAN_QRCODE = "pref_scan_qrcode_key";
    public static final String KEY_SCENE_MODE = "pref_camera_scenemode_key";
    public static final String KEY_SCENE_MODE_SETTINGS = "pref_camera_scenemode_setting_key";
    public static final String KEY_SHADER_COLOR_EFFECT = "pref_camera_shader_coloreffect_key";
    public static final String KEY_SHOW_GENDER_AGE = "pref_camera_show_gender_age_key";
    public static final String KEY_SMART_SHUTTER_POSITION = "pref_key_camera_smart_shutter_position";
    public static final String KEY_STICKER_PATH = "pref_sticker_path_key";
    public static final String KEY_TIME_WATERMARK = "pref_watermark_key";
    public static final String KEY_TOUCH_AF_AEC = "pref_camera_touchafaec_key";
    public static final String KEY_TT_LIVE_MUSIC_JSON_CACHE = "pref_key_tt_live_music_json_cache";
    public static final String KEY_TT_LIVE_STICKER_JSON_CACHE = "pref_key_tt_live_sticker_json_cache";
    public static final String KEY_UBIFOCUS_KEY = "pref_camera_ubifocus_key";
    public static final String KEY_ULTRA_PIXEL_PHOTOGRAPHY = "pref_ultra_pixel_photography_enabled";
    public static final String KEY_ULTRA_WIDE_BOKEH = "pref_ultra_wide_bokeh_enabled";
    public static final String KEY_ULTRA_WIDE_LDC = "pref_camera_ultra_wide_ldc_key";
    public static final String KEY_ULTRA_WIDE_VIDEO_LDC = "pref_camera_ultra_wide_video_ldc_key";
    public static final String KEY_USERDEFINE_WATERMARK = "user_define_watermark";
    public static final String KEY_VERSION = "pref_version_key";
    public static final String KEY_VIDEOCAMERA_FLASH_MODE = "pref_camera_video_flashmode_key";
    public static final String KEY_VIDEO_AUTOEXPOSURE = "pref_video_autoexposure_key";
    public static final String KEY_VIDEO_BOKEH = "pref_video_bokeh_key";
    public static final String KEY_VIDEO_ENCODER = "pref_video_encoder_key";
    public static final String KEY_VIDEO_FACE_BEAUTY = "pref_video_face_beauty_key";
    public static final String KEY_VIDEO_HDR = "pref_video_hdr_key";
    public static final String KEY_VIDEO_HIGH_FRAME_RATE = "pref_video_hfr_key";
    public static final int KEY_VIDEO_HSR_60 = 60;
    public static final String KEY_VIDEO_NEW_SLOW_MOTION = "pref_video_new_slow_motion_key";
    public static final String KEY_VIDEO_QUALITY = "pref_video_quality_key";
    public static final String KEY_VIDEO_QUALITY_EXTRA = "pref_video_quality_key_extra";
    public static final String KEY_VIDEO_SPEED = "pref_video_speed_key";
    public static final String KEY_VIDEO_SPEED_FAST = "pref_video_speed_fast_key";
    public static final String KEY_VIDEO_SPEED_HFR = "pref_video_speed_hfr_key";
    public static final String KEY_VIDEO_SPEED_SLOW = "pref_video_speed_slow_key";
    public static final String KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL = "pref_video_time_lapse_frame_interval_key";
    public static final String KEY_VOLUME_CAMERA_FUNCTION = "pref_camera_volumekey_function_key";
    public static final String KEY_VOLUME_LIVE_FUNCTION = "pref_live_volumekey_function_key";
    public static final String KEY_VOLUME_VIDEO_FUNCTION = "pref_video_volumekey_function_key";
    public static final String KEY_WHITE_BALANCE = "pref_camera_whitebalance_key";
    public static final String KEY_ZOOM = "pref_camera_zoom_key";
    public static final int LIVE_SPEED_DEFAULT = 2;
    private static final int MAX_PREVIEW_FPS_TIMES_1000 = 400000;
    private static final int PREFERRED_PREVIEW_FPS_TIMES_1000 = 30000;
    public static final String PROP_AUTO_ZOOM = "camera.autozoom.enable";
    public static final String QRCODE_RECEIVER_PACKAGE = "com.xiaomi.scanner";
    public static final int QUALITY_MTK_FINE = 11;
    public static final int QUALITY_MTK_HIGH = 10;
    public static final int QUALITY_MTK_MEDIUM = 9;
    public static final String REMIND_SUFFIX = "_remind";
    public static final String SIZE_FPS_1080_240 = "1920x1080:240";
    public static final int SURFACE_LEFT_MARGIN_MDP_QUALITY_480P = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_surface_view_left_margin_mdp_render_quality_480p);
    public static final int SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_surface_view_left_margin_mdp_render_quality_low);
    private static final String TAG = "CameraSettings";
    public static final int TOP_CONTROL_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.bottom_control_upper_panel_height);
    public static final int UI_STYLE_16_9 = 1;
    public static final int UI_STYLE_3_2 = 2;
    public static final int UI_STYLE_4_3 = 0;
    public static final int UI_STYLE_ERROR = -1;
    public static final int UI_STYLE_FULL_SCREEN = 3;
    public static final String VIDEO_MODE_120 = "fps120";
    public static final String VIDEO_MODE_240 = "fps240";
    public static final String VIDEO_MODE_960 = "fps960";
    public static final String VIDEO_MODE_FUN = "fun";
    public static final String VIDEO_SPEED_FAST = "fast";
    public static final String VIDEO_SPEED_HFR = "hfr";
    public static final String VIDEO_SPEED_NORMAL = "normal";
    public static final String VIDEO_SPEED_SLOW = "slow";
    public static final String ZOOM_DEFAULT_VALUE = "1";
    public static final ChangeManager sCameraChangeManager = new ChangeManager();
    public static boolean sCroppedIfNeeded = false;
    private static boolean sEdgePhotoEnable = false;
    private static SparseArray<String> sFaceBeautyLevelToValue = new SparseArray();
    private static boolean sGoolgeLensAvilability = false;
    public static final int[] sLiveSpeedTextList = new int[]{R.string.live_speed_extreme_slow, R.string.live_speed_slow, R.string.live_speed_normal, R.string.live_speed_fast, R.string.live_speed_extreme_fast};
    public static ArrayList<String> sRemindMode = new ArrayList();
    private static HashMap<String, String> sSceneToFlash = new HashMap(11);

    @Retention(RetentionPolicy.SOURCE)
    public @interface UiStyle {
    }

    static {
        sSceneToFlash.put("0", null);
        sSceneToFlash.put("3", null);
        sSceneToFlash.put("4", "0");
        sSceneToFlash.put(CameraScene.SPORTS, null);
        sSceneToFlash.put("5", "0");
        sSceneToFlash.put("6", "1");
        sSceneToFlash.put("8", "0");
        sSceneToFlash.put(CameraScene.SNOW, "0");
        sSceneToFlash.put(CameraScene.SUNSET, "0");
        sSceneToFlash.put(CameraScene.FIREWORKS, "0");
        sSceneToFlash.put(CameraScene.BACKLIGHT, "0");
        sSceneToFlash.put(CameraScene.FLOWERS, "0");
        sRemindMode.add(KEY_CAMERA_MODE_SETTINGS);
        sRemindMode.add("pref_camera_magic_mirror_key");
        if (b.hH()) {
            sRemindMode.add("pref_camera_groupshot_mode_key");
        }
        if (b.hP()) {
            sFaceBeautyLevelToValue.put(0, BeautyConstant.LEVEL_CLOSE);
            sFaceBeautyLevelToValue.put(1, BeautyConstant.LEVEL_LOW);
            sFaceBeautyLevelToValue.put(2, BeautyConstant.LEVEL_MEDIUM);
            sFaceBeautyLevelToValue.put(3, BeautyConstant.LEVEL_HIGH);
        } else {
            sFaceBeautyLevelToValue.put(0, BeautyConstant.LEVEL_CLOSE);
            sFaceBeautyLevelToValue.put(1, BeautyConstant.LEVEL_MEDIUM);
            sFaceBeautyLevelToValue.put(2, BeautyConstant.LEVEL_HIGH);
            sFaceBeautyLevelToValue.put(3, BeautyConstant.LEVEL_XHIGH);
            sFaceBeautyLevelToValue.put(4, BeautyConstant.LEVEL_XXHIGH);
            sFaceBeautyLevelToValue.put(5, BeautyConstant.LEVEL_XXXHIGH);
        }
    }

    public static boolean isFrontCamera() {
        return DataRepository.dataItemGlobal().getCurrentCameraId() == 1;
    }

    public static boolean isBackCamera() {
        return DataRepository.dataItemGlobal().getCurrentCameraId() == 0;
    }

    public static String getPictureSizeRatioString(String str) {
        if (ModuleManager.isSquareModule()) {
            Log.d("size", "#1: getPictureSize ratio return 4x3");
            return "4x3";
        } else if (!ModuleManager.isPortraitModule() || !isBackCamera() || !DataRepository.dataItemFeature().fB()) {
            return DataRepository.dataItemConfig().getString("pref_camera_picturesize_key", str);
        } else {
            Log.d("size", "#2: getPictureSize ratio return 4x3");
            return "4x3";
        }
    }

    public static boolean isUnsolicited4X3Ratio() {
        return (isSupportedUltraPixelPhotography(Camera2DataContainer.getInstance().getCurrentCameraCapabilities()) && ((ModuleManager.isManualModule() && isUltraPixelPhotographyOn()) || (ModuleManager.isCameraModule() && isRearMenuUltraPixelPhotographyOn()))) || (ModuleManager.isCameraModule() && isFrontSupportedUltraPixelPhotography(Camera2DataContainer.getInstance().getCurrentCameraCapabilities()) && isFrontMenuUltraPixelPhotographyOn());
    }

    public static boolean isSupportedUltraPixelPhotography(CameraCapabilities cameraCapabilities) {
        if (cameraCapabilities == null) {
            return false;
        }
        boolean z = true;
        boolean z2 = ModuleManager.isManualModule() && cameraCapabilities.getCameraId() == Camera2DataContainer.getInstance().getMainBackCameraId();
        if (!(ModuleManager.isCameraModule() && isBackCamera())) {
            z = false;
        }
        if (!z2 && !z) {
            return false;
        }
        int fR = DataRepository.dataItemFeature().fR();
        if (fR <= 0) {
            return false;
        }
        return cameraCapabilities.isUltraPixelPhotographySupported(fR);
    }

    public static boolean isFrontSupportedUltraPixelPhotography(CameraCapabilities cameraCapabilities) {
        if (cameraCapabilities == null || !ModuleManager.isCameraModule() || isBackCamera()) {
            return false;
        }
        int fS = DataRepository.dataItemFeature().fS();
        if (fS <= 0) {
            return false;
        }
        return cameraCapabilities.isUltraPixelPhotographySupported(fS);
    }

    public static float getPreviewAspectRatio(int i, int i2) {
        double d = ((double) i) / ((double) i2);
        double d2 = d - 1.7777777777777777d;
        if (Math.abs(d - 1.3333333333333333d) <= Math.abs(d2)) {
            return 1.3333334f;
        }
        double d3 = d - 2.0d;
        if (Math.abs(d3) > Math.abs(d - 2.1666666666666665d)) {
            return 2.1666667f;
        }
        if (Math.abs(d2) > Math.abs(d3)) {
            return 2.0f;
        }
        return 1.7777778f;
    }

    public static int getRenderAspectRatio(int i, int i2) {
        return getAspectRatio(i, i2);
    }

    public static int getAspectRatio(int i, int i2) {
        if (isNearRatio16_9(i, i2)) {
            return 1;
        }
        if (isNearRatio18_9(i, i2)) {
            return 3;
        }
        return 0;
    }

    public static boolean isAspectRatio4_3(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        if (Math.abs((((double) i) / ((double) i2)) - 1.3333333333333333d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static boolean isAspectRatio16_9(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        if (Math.abs((((double) i) / ((double) i2)) - 1.7777777777777777d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static boolean isAspectRatio18_9(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        if (Math.abs((((double) i) / ((double) i2)) - 2.0d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static boolean isAspectRatio19_5_9(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        if (Math.abs((((double) i) / ((double) i2)) - 2.1666666666666665d) < 0.02d) {
            return true;
        }
        return false;
    }

    public static int getStrictAspectRatio(int i, int i2) {
        if (isAspectRatio16_9(i, i2)) {
            return 1;
        }
        if (isAspectRatio4_3(i, i2)) {
            return 0;
        }
        if (isAspectRatio1_1(i, i2)) {
            return 2;
        }
        return -1;
    }

    public static boolean isNearAspectRatio(int i, int i2, int i3, int i4) {
        return getAspectRatio(i, i2) == getAspectRatio(i3, i4);
    }

    public static boolean isAspectRatio1_1(int i, int i2) {
        return i == i2;
    }

    public static boolean isNearRatio16_9(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        double d = ((double) i) / ((double) i2);
        double d2 = d - 1.7777777777777777d;
        if ((Math.abs(d - 1.3333333333333333d) > Math.abs(d2) || Math.abs(d - 1.5d) < 0.02d) && Math.abs(d2) <= Math.abs(d - 2.0d)) {
            return true;
        }
        return false;
    }

    public static boolean isNearRatio18_9(int i, int i2) {
        if (i < i2) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        double d = ((double) i) / ((double) i2);
        double d2 = d - 1.7777777777777777d;
        if ((Math.abs(d - 1.3333333333333333d) > Math.abs(d2) || Math.abs(d - 1.5d) < 0.02d) && Math.abs(d2) > Math.abs(d - 2.0d)) {
            return true;
        }
        return false;
    }

    public static String getHfrSetting() {
        return DataRepository.dataItemConfig().getString(KEY_VIDEO_HIGH_FRAME_RATE, getString(R.string.pref_video_hfr_entryvalue_default));
    }

    public static int getNewSlowMotionIQ() {
        return Integer.valueOf(DataRepository.dataItemConfig().getString(KEY_VIDEO_NEW_SLOW_MOTION, String.valueOf(5))).intValue();
    }

    public static int getVideoQuality() {
        if (isStereoModeOn()) {
            return 6;
        }
        if (isVideoBokehOn() || !TextUtils.equals(getFaceBeautifyValue(), BeautyConstant.LEVEL_CLOSE)) {
            return 5;
        }
        if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom")) {
            return 6;
        }
        return getPreferVideoQuality(DataRepository.dataItemGlobal().getCurrentMode());
    }

    public static int getSkipFrameNumber() {
        if (isFrontCamera() || getCameraId() == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.camera_skip_frame_num);
        }
        return 0;
    }

    public static int getPreferVideoQuality(int i) {
        String string = getString(getDefaultPreferenceId(R.string.pref_video_quality_default));
        ProviderEditor editor;
        if (DataRepository.dataItemConfig().contains(KEY_VIDEO_QUALITY)) {
            String substring;
            String string2 = DataRepository.dataItemConfig().getString(KEY_VIDEO_QUALITY, string);
            int indexOf = string2.indexOf(",");
            ProviderEditor editor2 = DataRepository.dataItemConfig().editor();
            String str = null;
            if (indexOf > 0) {
                substring = string2.substring(0, indexOf);
                string2 = string2.substring(indexOf + 1);
                if (isSupportFpsRange(3840, 2160, i) || isSupportFpsRange(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT, i)) {
                    str = string2;
                } else {
                    Log.d(TAG, "getPreferVideoQuality: do not support 60fps");
                    editor2.putString(KEY_VIDEO_QUALITY, substring);
                }
            } else {
                substring = string2;
            }
            editor2.putString(KEY_CAMERA_HSR_VALUE, str);
            editor2.apply();
            if (string.equals(substring) || Util.isStringValueContained((Object) substring, (int) R.array.pref_video_quality_entryvalues)) {
                string = substring;
            } else {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("reset invalid video quality ");
                stringBuilder.append(substring);
                Log.e(str2, stringBuilder.toString());
                editor = DataRepository.dataItemConfig().editor();
                editor.putString(KEY_VIDEO_QUALITY, string);
                editor.apply();
            }
            return Integer.parseInt(string);
        }
        if (!CamcorderProfile.hasProfile(getCameraId(), Integer.parseInt(string))) {
            string = Integer.toString(1);
        }
        editor = DataRepository.dataItemConfig().editor();
        editor.putString(KEY_VIDEO_QUALITY, string);
        editor.apply();
        return Integer.parseInt(string);
    }

    public static int getVideoEncoder() {
        if ("h265".equals(DataRepository.dataItemGlobal().getString(KEY_VIDEO_ENCODER, getString(R.string.pref_video_encoder_default)))) {
            return 5;
        }
        return 2;
    }

    public static int getExposureMeteringMode() {
        String string;
        int activeModuleIndex = ModuleManager.getActiveModuleIndex();
        if (!(activeModuleIndex == 172 || activeModuleIndex == 174)) {
            switch (activeModuleIndex) {
                case 161:
                case 162:
                    break;
                default:
                    switch (activeModuleIndex) {
                        case 168:
                        case 169:
                        case 170:
                            break;
                        default:
                            string = DataRepository.dataItemGlobal().getString(KEY_AUTOEXPOSURE, getString(R.string.pref_camera_autoexposure_default));
                            break;
                    }
            }
        }
        string = DataRepository.dataItemGlobal().getString(KEY_VIDEO_AUTOEXPOSURE, getString(R.string.pref_video_autoexposure_default));
        return Util.parseInt(string, 1);
    }

    public static boolean getBool(int i) {
        return CameraAppImpl.getAndroidContext().getResources().getBoolean(i);
    }

    public static String getString(int i) {
        return CameraAppImpl.getAndroidContext().getString(i);
    }

    public static float getResourceFloat(int i, float f) {
        Context androidContext = CameraAppImpl.getAndroidContext();
        TypedValue typedValue = new TypedValue();
        try {
            androidContext.getResources().getValue(i, typedValue, true);
            return typedValue.getFloat();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Missing resource ");
            stringBuilder.append(Integer.toHexString(i));
            Log.e(str, stringBuilder.toString());
            return f;
        }
    }

    public static <T> ArrayList<T> listToArrayList(List<T> list) {
        if (list == null) {
            return null;
        }
        if (list instanceof ArrayList) {
            return (ArrayList) list;
        }
        ArrayList<T> arrayList = new ArrayList(list.size());
        arrayList.addAll(list);
        return arrayList;
    }

    public static List<String> sizeListToStringList(List<Size> list) {
        if (list == null) {
            return null;
        }
        List arrayList = new ArrayList();
        for (Size size : list) {
            arrayList.add(String.format(Locale.ENGLISH, "%dx%d", new Object[]{Integer.valueOf(size.width), Integer.valueOf(size.height)}));
        }
        return arrayList;
    }

    public static void upgradeGlobalPreferences() {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int i = dataItemGlobal.getInt(KEY_VERSION, 0);
        if (i < 4) {
            DataRepository.dataItemGlobal().editor().clear().apply();
            for (int i2 : new int[]{0, 1}) {
                DataProvider provider = DataRepository.provider();
                provider.dataConfig(0, i2).editor().clear().apply();
                provider.dataConfig(1, i2).editor().clear().apply();
            }
            dataItemGlobal.editor().putInt(KEY_VERSION, 4).apply();
            if (i == 1) {
                deleteObsoletePreferences();
            }
        }
    }

    private static void deleteObsoletePreferences() {
        Context androidContext = CameraAppImpl.getAndroidContext();
        int[] iArr = new int[]{0, 1};
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("/data/data/");
        stringBuilder.append(androidContext.getPackageName().toString());
        stringBuilder.append("/shared_prefs");
        String stringBuilder2 = stringBuilder.toString();
        for (int i : BaseModule.CAMERA_MODES) {
            if (i != 0) {
                for (int i2 : iArr) {
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("camera_settings_simple_mode_local_");
                    stringBuilder3.append(BaseModule.getPreferencesLocalId(i2, i));
                    String stringBuilder4 = stringBuilder3.toString();
                    StringBuilder stringBuilder5 = new StringBuilder();
                    stringBuilder5.append(stringBuilder4);
                    stringBuilder5.append(".xml");
                    File file = new File(stringBuilder2, stringBuilder5.toString());
                    if (file.exists()) {
                        file.delete();
                    }
                }
            }
        }
        File file2 = new File(stringBuilder2, "camera_settings_simple_mode_global.xml");
        if (file2.exists()) {
            file2.delete();
        }
    }

    public static int readPreferredCameraId() {
        return DataRepository.dataItemGlobal().getCurrentCameraId();
    }

    public static int getBogusCameraId() {
        return DataRepository.dataItemGlobal().getCurrentCameraId();
    }

    public static int getCameraId() {
        return Camera2DataContainer.getInstance().getActualOpenCameraId(DataRepository.dataItemGlobal().getCurrentCameraId(), DataRepository.dataItemGlobal().getCurrentMode());
    }

    public static int getCameraId(int i) {
        return Camera2DataContainer.getInstance().getActualOpenCameraId(DataRepository.dataItemGlobal().getCurrentCameraId(), i);
    }

    public static int readExposure() {
        return Util.parseInt(DataRepository.dataItemConfig().getString(KEY_EXPOSURE, "0"), 0);
    }

    public static void writeExposure(int i) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString(KEY_EXPOSURE, Integer.toString(i));
        editor.apply();
    }

    public static void resetExposure() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove(KEY_EXPOSURE);
        editor.apply();
    }

    public static float readZoom() {
        String string = DataRepository.dataItemConfig().getString(KEY_ZOOM, "1");
        try {
            return Float.parseFloat(string);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Invalid zoom: ");
            stringBuilder.append(string);
            Log.e(str, stringBuilder.toString());
            return 0.0f;
        }
    }

    public static void writeZoom(float f) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString(KEY_ZOOM, Float.toString(f));
        editor.apply();
    }

    public static void resetZoom() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove(KEY_ZOOM);
        editor.apply();
    }

    public static ArrayList<String> getSupportedVideoSpeed(Context context, int i) {
        ArrayList<String> arrayList = new ArrayList();
        arrayList.add("normal");
        arrayList.add(VIDEO_SPEED_FAST);
        arrayList.add(VIDEO_SPEED_SLOW);
        return arrayList;
    }

    public static boolean isSupportBeautyMakeup() {
        CameraCapabilities currentCameraCapabilities = Camera2DataContainer.getInstance().getCurrentCameraCapabilities();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isSupportBeautyMakeup: ");
        stringBuilder.append(currentCameraCapabilities.isSupportBeautyMakeup());
        Log.d(str, stringBuilder.toString());
        return currentCameraCapabilities.isSupportBeautyMakeup();
    }

    public static int get4kProfile() {
        if (b.gI()) {
            return Integer.parseInt(getString(R.string.pref_video_quality_entry_value_4kuhd));
        }
        return -1;
    }

    public static boolean is4KHigherVideoQuality(int i) {
        boolean z = false;
        if (!b.gI()) {
            return false;
        }
        if (get4kProfile() <= i || i == 1) {
            z = true;
        }
        return z;
    }

    public static ArrayList<String> getSupportedVideoQuality(int i) {
        int bogusCameraId = getBogusCameraId();
        ArrayList<String> arrayList = new ArrayList();
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(getCameraId(i));
        if (capabilities == null) {
            return arrayList;
        }
        List supportedOutputSize = capabilities.getSupportedOutputSize(MediaRecorder.class);
        int i2 = get4kProfile();
        if (b.gI() && supportedOutputSize.contains(new CameraSize(3840, 2160)) && CamcorderProfile.hasProfile(bogusCameraId, i2)) {
            arrayList.add(Integer.toString(i2));
            if (isSupportFpsRange(3840, 2160, i)) {
                arrayList.add(getString(R.string.pref_video_quality_entry_value_4kuhd_60fps));
            }
        }
        if (supportedOutputSize.contains(new CameraSize(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT)) && CamcorderProfile.hasProfile(bogusCameraId, 6)) {
            arrayList.add(Integer.toString(6));
            if (isSupportFpsRange(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT, i)) {
                arrayList.add(getString(R.string.pref_video_quality_entry_value_1080p_60fps));
            }
        }
        if (supportedOutputSize.contains(new CameraSize(1280, Util.LIMIT_SURFACE_WIDTH)) && CamcorderProfile.hasProfile(bogusCameraId, 5)) {
            arrayList.add(Integer.toString(5));
        }
        if (supportedOutputSize.contains(new CameraSize(Util.LIMIT_SURFACE_WIDTH, 480)) && CamcorderProfile.hasProfile(bogusCameraId, 4)) {
            arrayList.add(Integer.toString(4));
        }
        if (CamcorderProfile.hasProfile(bogusCameraId, 11)) {
            arrayList.add(Integer.toString(11));
        }
        if (CamcorderProfile.hasProfile(bogusCameraId, 10)) {
            arrayList.add(Integer.toString(10));
        }
        if (CamcorderProfile.hasProfile(bogusCameraId, 9)) {
            arrayList.add(Integer.toString(9));
        }
        return arrayList;
    }

    public static boolean isSupportFpsRange(int i, int i2, int i3) {
        if (DataRepository.dataItemGlobal().getIntentType() != 0) {
            return false;
        }
        List<MiCustomFpsRange> supportedCustomFpsRange = Camera2DataContainer.getInstance().getCapabilities(getCameraId(i3)).getSupportedCustomFpsRange();
        if (supportedCustomFpsRange == null || supportedCustomFpsRange.isEmpty()) {
            return false;
        }
        for (MiCustomFpsRange miCustomFpsRange : supportedCustomFpsRange) {
            if (miCustomFpsRange.getWidth() == i && miCustomFpsRange.getHeight() == i2) {
                return true;
            }
        }
        return false;
    }

    public static boolean isSupportFpsRange(int i) {
        for (Range range : Camera2DataContainer.getInstance().getCapabilities(getCameraId()).getSupportedFpsRange()) {
            if (range.getLower() == range.getUpper() && ((Integer) range.getUpper()).intValue() == i) {
                return true;
            }
        }
        return false;
    }

    public static ArrayList<String> getSupportedHfrSettings(int i) {
        ArrayList<String> arrayList = new ArrayList();
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i);
        if (capabilities == null) {
            return arrayList;
        }
        for (android.util.Size size : capabilities.getSupportedHighSpeedVideoSize()) {
            if (size.getWidth() == 1920 || size.getWidth() == 1280) {
                for (Range range : capabilities.getSupportedHighSpeedVideoFPSRange(size)) {
                    String format = String.format(Locale.ENGLISH, "%dx%d:%d", new Object[]{Integer.valueOf(size.getWidth()), Integer.valueOf(size.getHeight()), range.getUpper()});
                    if (!arrayList.contains(format)) {
                        arrayList.add(format);
                    }
                }
            }
        }
        return arrayList;
    }

    public static int getScreenLightBrightness() {
        int screenLightBrightness = Camera2DataContainer.getInstance().getCapabilities(getCameraId()).getScreenLightBrightness();
        if (screenLightBrightness <= 0) {
            return SystemProperties.getInt("camera_screen_light_brightness", DataRepository.dataItemFeature().fq());
        }
        return screenLightBrightness;
    }

    public static long updateOpenCameraFailTimes() {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        long j = DataRepository.dataItemGlobal().getLong(KEY_OPEN_CAMERA_FAIL, 0) + 1;
        editor.putLong(KEY_OPEN_CAMERA_FAIL, j);
        editor.apply();
        return j;
    }

    public static void resetOpenCameraFailTimes() {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putLong(KEY_OPEN_CAMERA_FAIL, 0);
        editor.apply();
    }

    public static boolean isVideoCaptureVisible() {
        return ((b.isMTKPlatform() && isStereoModeOn()) || isVideoBokehOn() || ((!b.hz() && (VIDEO_SPEED_SLOW.equals(DataRepository.dataItemRunning().getVideoSpeed()) || VIDEO_SPEED_HFR.equals(DataRepository.dataItemRunning().getVideoSpeed()))) || (b.gI() && ((b.qf || b.qh) && getVideoQuality() > 6)))) ? false : true;
    }

    public static int getDefaultPreferenceId(int i) {
        if (i != R.string.pref_video_quality_default) {
            if (i != R.string.pref_camera_antibanding_default) {
                if (i == R.bool.pref_camera_auto_chroma_flash_default && (b.qh || b.qi)) {
                    return R.bool.pref_camera_auto_chroma_flash_virgo_default;
                }
            } else if (Util.isAntibanding60()) {
                return R.string.pref_camera_antibanding_entryvalue_60hz;
            }
        } else if (b.gU() && isFrontCamera()) {
            return R.string.pref_mi_front_video_quality_default;
        }
        return i;
    }

    public static boolean isRecordLocation() {
        if (b.gr() && DataRepository.dataItemGlobal().getBoolean(KEY_RECORD_LOCATION, false)) {
            return true;
        }
        return false;
    }

    public static boolean isCameraSoundOpen() {
        if (!b.gm() || DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_SOUND, true)) {
            return true;
        }
        return false;
    }

    public static boolean isTimeWaterMarkOpen() {
        if (!DataRepository.dataItemGlobal().getBoolean("pref_watermark_key", false) || isFrontMenuUltraPixelPhotographyOn()) {
            return false;
        }
        return true;
    }

    public static void setDualCameraWaterMarkOpen(boolean z) {
        if (isSupportedDualCameraWaterMark() && isBackCamera()) {
            DataRepository.dataItemGlobal().editor().putBoolean("pref_dualcamera_watermark", z).apply();
        }
    }

    public static void setAiSceneOpen(boolean z) {
        DataRepository.dataItemConfig().editor().putBoolean("pref_camera_ai_scene_mode_key", z).apply();
    }

    public static boolean getAiSceneOpen() {
        return (!isFrontCamera() || DataRepository.dataItemFeature().fd()) && ((ModuleManager.isCameraModule() || ModuleManager.isSquareModule() || (DataRepository.dataItemFeature().fe() && ModuleManager.isPortraitModule())) && DataRepository.dataItemConfig().getBoolean("pref_camera_ai_scene_mode_key", DataRepository.dataItemFeature().eX()));
    }

    public static boolean isDualCameraWaterMarkOpen() {
        if (isSupportedDualCameraWaterMark() && isBackCamera()) {
            return DataRepository.dataItemGlobal().getBoolean("pref_dualcamera_watermark", getBool(R.bool.pref_device_watermark_default));
        }
        return false;
    }

    public static boolean retainCameraMode() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_RETAIN_CAMERA_MODE, false);
    }

    public static boolean isProximityLockOpen() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_PROXIMITY_LOCK, true);
    }

    public static boolean isFaceWaterMarkOpen() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_FACE_INFO_WATERMARK, false);
    }

    public static boolean isFrontMirror() {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        String string = dataItemGlobal.getString(KEY_FRONT_MIRROR, getString(R.string.pref_front_mirror_default));
        if ("auto".equals(string)) {
            dataItemGlobal.editor().remove(KEY_FRONT_MIRROR).apply();
        }
        return getString(R.string.pref_front_mirror_entryvalue_on).equals(string);
    }

    public static boolean isMovieSolidOn() {
        return b.gi() && DataRepository.dataItemGlobal().getBoolean(KEY_MOVIE_SOLID, Boolean.valueOf(getString(R.string.pref_camera_movie_solid_default)).booleanValue());
    }

    public static boolean showGenderAge() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key");
    }

    public static boolean isMagicMirrorOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key");
    }

    public static boolean isScanQRCode(Context context) {
        return !isFrontCamera() && isQRCodeReceiverAvailable(context) && b.hj() && DataRepository.dataItemGlobal().getBoolean(KEY_SCAN_QRCODE, Boolean.valueOf(getString(R.string.pref_scan_qrcode_default)).booleanValue());
    }

    public static boolean isQRCodeReceiverAvailable(Context context) {
        return Util.isPackageAvailable(context, "com.xiaomi.scanner");
    }

    public static boolean checkLensAvailability(Context context) {
        boolean z = false;
        if (Util.isGlobalVersion()) {
            if (DataRepository.dataItemGlobal().getBoolean(KEY_AI_DETECT_ENABLE, Boolean.valueOf(getString(R.bool.pref_ai_detect_enable)).booleanValue()) && Util.isPackageAvailable(context, "com.google.ar.lens") && sGoolgeLensAvilability) {
                z = true;
            }
            return z;
        }
        if (DataRepository.dataItemFeature().fl() && Util.isPackageAvailable(context, AI_LENS_PACKAGE)) {
            z = true;
        }
        return z;
    }

    public static void setGoogleLensAvailability(boolean z) {
        sGoolgeLensAvilability = z;
    }

    public static boolean isBurstShootingEnable() {
        return b.go() && "burst".equals(DataRepository.dataItemGlobal().getString(KEY_LONG_PRESS_SHUTTER_FEATURE, getString(R.string.pref_camera_long_press_shutter_feature_default)));
    }

    public static boolean isAEAFLockSupport() {
        if (ModuleManager.isSuperNightScene()) {
            return false;
        }
        return DataRepository.dataItemGlobal().getBoolean(KEY_AE_AF_LOCK_SUPPORT, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_AEAF_lock_support));
    }

    public static int addExtraHeight(Context context, int i) {
        if (!b.qR && Util.checkDeviceHasNavigationBar(context) && Global.getInt(context.getContentResolver(), MiuiSettings.Global.CAN_NAV_BAR_HIDE, 0) == 1) {
            return i + Util.getNavigationBarHeight(context);
        }
        return i;
    }

    public static int getUIStyleByPreview(int i, int i2) {
        int i3 = 0;
        if (b.isPad()) {
            return 0;
        }
        if (sCroppedIfNeeded) {
            return 1;
        }
        double d = ((double) i) / ((double) i2);
        if (!b.hl() || Math.abs(d - 1.5d) >= 0.02d) {
            if (Math.abs((((double) Util.sWindowHeight) / ((double) Util.sWindowWidth)) - d) >= 0.02d) {
                double d2 = d - 1.7777777777777777d;
                if (Math.abs(d - 1.3333333333333333d) > Math.abs(d2) || Math.abs(d - 1.5d) < 0.02d) {
                    if (Math.abs(d2) <= Math.abs(d - 2.0d)) {
                        i3 = 1;
                    }
                }
            }
            i3 = 3;
        } else {
            i3 = 2;
        }
        return i3;
    }

    private static void filterPreference(Map<String, ?> map, String str, Editor editor, int i) {
        if (editor != null && !TextUtils.isEmpty(str) && i != 0) {
            Object obj = map.get(str);
            if (obj != null && !Util.isStringValueContained(obj, i)) {
                editor.remove(str);
            }
        }
    }

    public static boolean isSwitchOn(String str) {
        if (isTransient(str)) {
            return DataRepository.dataItemRunning().isSwitchOn(str);
        }
        if (isCameraSpecific(str)) {
            return "on".equals(DataRepository.dataItemConfig().getString(str, "off"));
        }
        return "on".equals(DataRepository.dataItemGlobal().getString(str, "off"));
    }

    public static boolean isPortraitModeBackOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_portrait_mode_key");
    }

    public static boolean isStereoModeOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_stereo_mode_key");
    }

    public static boolean isVideoBokehOn() {
        return DataRepository.dataItemConfig().isSwitchOn("pref_video_bokeh_key");
    }

    public static boolean isGroupShotOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_groupshot_mode_key");
    }

    public static boolean isGradienterOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_gradienter_key");
    }

    public static boolean isLiveShotOn() {
        if (DataRepository.dataItemFeature().fE() && ModuleManager.isCameraModule()) {
            return DataRepository.dataItemRunning().getComponentRunningLiveShot().isLiveShotOn(163);
        }
        return false;
    }

    public static void setLiveShotOn(boolean z) {
        if (DataRepository.dataItemFeature().fE() && ModuleManager.isCameraModule()) {
            DataRepository.dataItemRunning().getComponentRunningLiveShot().setLiveShotOn(163, z);
        }
    }

    public static boolean isTiltShiftOn() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_tilt_shift_mode");
    }

    public static String getColorEffect() {
        return DataRepository.dataItemConfig().getString(KEY_COLOR_EFFECT, getString(R.string.pref_camera_coloreffect_default));
    }

    public static void resetColorEffect() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove(KEY_COLOR_EFFECT);
        editor.remove("pref_camera_shader_coloreffect_key");
        editor.apply();
    }

    public static void resetWhiteBalance() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.remove(KEY_WHITE_BALANCE);
        editor.apply();
    }

    public static void setCustomWB(int i) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putInt("pref_qc_manual_whitebalance_k_value_key", i);
        editor.apply();
    }

    public static int getCustomWB() {
        return DataRepository.dataItemConfig().getInt("pref_qc_manual_whitebalance_k_value_key", CameraAppImpl.getAndroidContext().getResources().getInteger(R.integer.default_manual_whitebalance_value));
    }

    public static void setSmartShutterPosition(String str) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putString(KEY_SMART_SHUTTER_POSITION, str);
        editor.apply();
    }

    public static String getSmartShutterPosition() {
        return DataRepository.dataItemGlobal().getString(KEY_SMART_SHUTTER_POSITION, "");
    }

    public static void setFocusMode(String str) {
        DataRepository.dataItemConfig().editor().putString("pref_camera_focus_mode_key", str).apply();
    }

    public static String getMappingFocusMode(int i) {
        return i == 1000 ? AutoFocus.LEGACY_CONTINUOUS_PICTURE : "manual";
    }

    public static String getFocusMode() {
        if (ModuleManager.isManualModule()) {
            return getMappingFocusMode(getFocusPosition());
        }
        if (ModuleManager.isVideoModule() || ModuleManager.isFunModule()) {
            return getString(R.string.pref_video_focusmode_entryvalue_default);
        }
        return getString(R.string.pref_camera_focusmode_value_default);
    }

    public static void setFocusModeSwitching(boolean z) {
        DataRepository.dataItemConfig().editor().putBoolean("pref_qc_focus_mode_switching_key", z).apply();
    }

    public static boolean isFocusModeSwitching() {
        return DataRepository.dataItemConfig().getBoolean("pref_qc_focus_mode_switching_key", false);
    }

    public static String getWhiteBalance() {
        return DataRepository.dataItemConfig().getString(KEY_WHITE_BALANCE, getString(R.string.pref_camera_whitebalance_default));
    }

    public static void updateFocusMode() {
        String focusMode = getFocusMode();
        String str = (!ModuleManager.isManualModule() || getFocusPosition() == 1000) ? AutoFocus.LEGACY_CONTINUOUS_PICTURE : "manual";
        if (!str.equals(focusMode)) {
            setFocusModeSwitching(true);
            setFocusMode(str);
        }
    }

    public static void setFocusPosition(int i) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString(KEY_QC_FOCUS_POSITION, String.valueOf(i));
        editor.apply();
    }

    public static void setShaderEffect(int i) {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ComponentConfigFilter componentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setShaderEffect: mode = ");
        stringBuilder.append(currentMode);
        stringBuilder.append(", value = ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        componentConfigFilter.setComponentValue(currentMode, String.valueOf(i));
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("setShaderEffect: getValue = ");
        stringBuilder2.append(componentConfigFilter.getComponentValue(currentMode));
        Log.d(str2, stringBuilder2.toString());
    }

    public static int getShaderEffect() {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ComponentConfigFilter componentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getShaderEffect: mode = ");
        stringBuilder.append(currentMode);
        stringBuilder.append(", value = ");
        stringBuilder.append(componentConfigFilter.getComponentValue(currentMode));
        Log.d(str, stringBuilder.toString());
        return Util.parseInt(componentConfigFilter.getComponentValue(currentMode), FilterInfo.FILTER_ID_NONE);
    }

    public static int getFocusPosition() {
        return Integer.parseInt(DataRepository.dataItemConfig().getManuallyFocus().getComponentValue(167));
    }

    public static String getManualFocusName(Context context, int i) {
        if (i == 1000) {
            return context.getString(R.string.pref_camera_focusmode_entry_auto);
        }
        double d = (double) i;
        if (d >= 600.0d) {
            return context.getString(R.string.pref_camera_focusmode_entry_macro);
        }
        if (d >= 200.0d) {
            return context.getString(R.string.pref_camera_focusmode_entry_normal);
        }
        return context.getString(R.string.pref_camera_focusmode_entry_infinity);
    }

    public static String getSkinBeautifyHumanReadableValue(Context context, ListPreference listPreference) {
        int findIndexOfValue = listPreference.findIndexOfValue(listPreference.getValue());
        int length = listPreference.getEntryValues().length;
        if (findIndexOfValue > (length * 2) / 3) {
            return context.getString(R.string.pref_camera_beautify_entry_high);
        }
        if (findIndexOfValue > length / 3) {
            return context.getString(R.string.pref_camera_beautify_entry_normal);
        }
        if (findIndexOfValue > 0) {
            return context.getString(R.string.pref_camera_beautify_entry_low);
        }
        return context.getString(R.string.pref_camera_beautify_entry_close);
    }

    public static boolean isFaceBeautyOn(String str) {
        boolean z = true;
        if (DataRepository.dataItemGlobal().getCurrentCameraId() != 0) {
            return BeautyConstant.LEVEL_CLOSE.equals(str) ^ true;
        }
        if (BeautyConstant.LEVEL_CLOSE.equals(str) && !isBeautyBodySlimOn()) {
            z = false;
        }
        return z;
    }

    public static boolean isBeautyBodySlimOn() {
        if (!isSupportBeautyBody()) {
            return false;
        }
        String str = KEY_BEAUTY_HEAD_SLIM_RATIO;
        String str2 = KEY_BEAUTY_BODY_SLIM_RATIO;
        String str3 = KEY_BEAUTY_SHOULDER_SLIM_RATIO;
        String str4 = KEY_BEAUTY_LEG_SLIM_RATIO;
        ComponentConfigBeautyBody componentConfigBeautyBody = DataRepository.dataItemConfig().getComponentConfigBeautyBody();
        if (componentConfigBeautyBody.getBeautyBodyValue(getFaceBeautyRatioKey(str), getDefaultRatio(str, false)) <= 0 && componentConfigBeautyBody.getBeautyBodyValue(getFaceBeautyRatioKey(str2), getDefaultRatio(str2, false)) <= 0 && componentConfigBeautyBody.getBeautyBodyValue(getFaceBeautyRatioKey(str3), getDefaultRatio(str3, false)) <= 0 && componentConfigBeautyBody.getBeautyBodyValue(getFaceBeautyRatioKey(str4), getDefaultRatio(str4, false)) <= 0) {
            return false;
        }
        return true;
    }

    public static boolean isAdvancedBeautyOn() {
        return BeautyConstant.LEVEL_ADVANCED.equals(getFaceBeautifyValue());
    }

    public static String getFlashMode(int i) {
        return DataRepository.dataItemConfig().getComponentFlash().getComponentValue(i);
    }

    public static void setFlashMode(int i, String str) {
        DataRepository.dataItemConfig().getComponentFlash().setComponentValue(i, str);
    }

    public static String getFlashModeByScene(String str) {
        return (String) sSceneToFlash.get(str);
    }

    public static void setRestoredFlashMode(String str) {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        if (str == null) {
            editor.remove(KEY_RESTORED_FLASH_MODE);
        } else {
            editor.putString(KEY_RESTORED_FLASH_MODE, str);
        }
        editor.apply();
    }

    public static String getRestoredFlashMode() {
        return DataRepository.dataItemConfig().getString(KEY_RESTORED_FLASH_MODE, null);
    }

    public static int getCountDownTimes() {
        return DataRepository.dataItemRunning().getComponentRunningTimer().getTimer();
    }

    public static int getPortraitLightingPattern() {
        return Integer.valueOf(DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171)).intValue();
    }

    public static String getFaceBeautySwitch() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        String string = dataItemConfig.getString(KEY_FACE_BEAUTY_SWITCH, "pref_camera_face_beauty_key");
        if (b.hP() || !KEY_FACE_BEAUTY_ADVANCED.equals(string)) {
            return string;
        }
        Log.w(TAG, "reset beauty switch");
        dataItemConfig.editor().remove(KEY_FACE_BEAUTY_SWITCH).apply();
        return "pref_camera_face_beauty_key";
    }

    public static void setFaceBeautySwitch(String str) {
        DataRepository.dataItemConfig().editor().putString(KEY_FACE_BEAUTY_SWITCH, str).apply();
    }

    private static String getFaceBeautyKey() {
        if (ModuleManager.isVideoModule() || ModuleManager.isFunModule()) {
            return "pref_video_face_beauty_key";
        }
        return "pref_camera_face_beauty_key";
    }

    private static String getFaceBeautyRatioKey(String str) {
        if (!ModuleManager.isVideoModule() && !ModuleManager.isFunModule()) {
            return str;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("_video");
        return stringBuilder.toString();
    }

    public static void setFaceBeautyLevel(int i) {
        DataRepository.dataItemConfig().editor().putString(getFaceBeautyKey(), beautyLevelToIntelligentValue(i)).apply();
    }

    public static int getFaceBeautyRatio(String str, int i) {
        if (isLiveBeautyModeKey(str)) {
            return DataRepository.dataItemLive().getInt(getFaceBeautyRatioKey(str), i);
        }
        return DataRepository.dataItemConfig().getInt(getFaceBeautyRatioKey(str), i);
    }

    public static void setFaceBeautyRatio(String str, int i) {
        ComponentConfigBeautyBody componentConfigBeautyBody = DataRepository.dataItemConfig().getComponentConfigBeautyBody();
        if (componentConfigBeautyBody.isBeautyBodyKey(str)) {
            componentConfigBeautyBody.setBeautyBodyValue(getFaceBeautyRatioKey(str), i);
        } else if (isLiveBeautyModeKey(str)) {
            DataRepository.dataItemLive().editor().putInt(getFaceBeautyRatioKey(str), i).apply();
        } else {
            DataRepository.dataItemConfig().editor().putInt(getFaceBeautyRatioKey(str), i).apply();
        }
    }

    public static String getFaceBeautifyValue() {
        if (!b.gp()) {
            return BeautyConstant.LEVEL_CLOSE;
        }
        if (b.hP() && KEY_FACE_BEAUTY_ADVANCED.equals(getFaceBeautySwitch())) {
            return BeautyConstant.LEVEL_ADVANCED;
        }
        String defaultValue = DataRepository.dataItemConfig().getComponentConfigBeauty().getDefaultValue(ModuleManager.getActiveModuleIndex());
        String string = DataRepository.dataItemConfig().getString(getFaceBeautyKey(), defaultValue);
        if (defaultValue.equals(string) || isFaceBeautyValid(string)) {
            defaultValue = string;
        } else {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("reset invalid face beauty value: ");
            stringBuilder.append(string);
            Log.e(str, stringBuilder.toString());
            DataRepository.dataItemConfig().editor().remove(getFaceBeautyKey()).apply();
        }
        return defaultValue;
    }

    public static String getFaceBeautyCloseValue() {
        return BeautyConstant.LEVEL_CLOSE;
    }

    public static String beautyLevelToIntelligentValue(int i) {
        String str = (String) sFaceBeautyLevelToValue.get(i);
        if (str != null) {
            return str;
        }
        str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("invalid faceBeautyLevel: ");
        stringBuilder.append(i);
        Log.e(str, stringBuilder.toString());
        return BeautyConstant.LEVEL_CLOSE;
    }

    public static int intelligentValueToBeautyLevel(String str) {
        int stringSparseArraysIndexOf = Util.stringSparseArraysIndexOf(sFaceBeautyLevelToValue, str);
        if (stringSparseArraysIndexOf < 0) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid faceBeautyValue: ");
            stringBuilder.append(str);
            Log.e(str2, stringBuilder.toString());
            stringSparseArraysIndexOf = 0;
        }
        return sFaceBeautyLevelToValue.keyAt(stringSparseArraysIndexOf);
    }

    public static boolean isFaceBeautyValid(String str) {
        boolean z = true;
        if (BeautyConstant.LEVEL_ADVANCED.equals(str)) {
            return true;
        }
        if (Util.stringSparseArraysIndexOf(sFaceBeautyLevelToValue, str) < 0) {
            z = false;
        }
        return z;
    }

    public static int getBeautifyDefaultValue(String str) {
        int i;
        if (KEY_BEAUTIFY_SKIN_COLOR_RATIO.equals(str)) {
            i = R.string.pref_skin_beautify_color_default;
        } else if (KEY_BEAUTIFY_SLIM_FACE_RATIO.equals(str)) {
            i = R.string.pref_skin_beautify_slim_default;
        } else if (KEY_BEAUTIFY_SKIN_SMOOTH_RATIO.equals(str)) {
            i = R.string.pref_skin_beautify_smooth_default;
        } else if (KEY_BEAUTIFY_ENLARGE_EYE_RATIO.equals(str)) {
            i = R.string.pref_skin_beautify_eye_default;
        } else {
            i = 0;
        }
        return Util.parseInt(getString(i), 0);
    }

    public static int getBeautifyDetailValue(String str, int i, int i2) {
        if (!b.gp()) {
            return 0;
        }
        int faceBeautyRatio = getFaceBeautyRatio(str, -1);
        if (faceBeautyRatio < 0) {
            return getBeautifyDefaultValue(str);
        }
        return ((((i2 - i) * faceBeautyRatio) + 50) / 100) + i;
    }

    public static int[] getBeautifyValueRange() {
        if (b.isMTKPlatform()) {
            return new int[]{-12, 12};
        }
        if (b.gA()) {
            return new int[]{0, 7};
        }
        return new int[]{0, 10};
    }

    public static int[] getMaxPreviewFpsRange(Parameters parameters) {
        List supportedPreviewFpsRange = parameters.getSupportedPreviewFpsRange();
        if (supportedPreviewFpsRange == null || supportedPreviewFpsRange.size() <= 0) {
            return new int[0];
        }
        return (int[]) supportedPreviewFpsRange.get(supportedPreviewFpsRange.size() - 1);
    }

    public static void setPriorityStoragePreference(boolean z) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean(KEY_PRIORITY_STORAGE, z);
        editor.apply();
    }

    public static boolean getPriorityStoragePreference() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_PRIORITY_STORAGE, Boolean.valueOf(getString(R.bool.priority_storage)).booleanValue());
    }

    public static int[] getPhotoPreviewFpsRange(Parameters parameters) {
        List<int[]> supportedPreviewFpsRange = parameters.getSupportedPreviewFpsRange();
        if (supportedPreviewFpsRange == null || supportedPreviewFpsRange.isEmpty()) {
            Log.e(TAG, "No supported frame rates returned!");
            return null;
        }
        int i = MAX_PREVIEW_FPS_TIMES_1000;
        for (int[] iArr : supportedPreviewFpsRange) {
            int i2 = iArr[0];
            if (iArr[1] >= 30000 && i2 <= 30000 && i2 < i) {
                i = i2;
            }
        }
        int i3 = -1;
        int i4 = 0;
        int i5 = i4;
        while (i4 < supportedPreviewFpsRange.size()) {
            int[] iArr2 = (int[]) supportedPreviewFpsRange.get(i4);
            int i6 = iArr2[0];
            int i7 = iArr2[1];
            if (i6 == i && i5 < i7) {
                i3 = i4;
                i5 = i7;
            }
            i4++;
        }
        if (i3 >= 0) {
            return (int[]) supportedPreviewFpsRange.get(i3);
        }
        Log.e(TAG, "Can't find an appropriate frame rate range!");
        return null;
    }

    public static boolean isPressDownCapture() {
        boolean z = false;
        if (!b.gV()) {
            return false;
        }
        if (isFrontCamera() || !"focus".equals(DataRepository.dataItemGlobal().getString(KEY_LONG_PRESS_SHUTTER_FEATURE, getString(R.string.pref_camera_long_press_shutter_feature_default)))) {
            z = true;
        }
        return z;
    }

    public static boolean isAsdPopupEnable() {
        return b.gK();
    }

    public static boolean isAsdNightEnable() {
        return b.gR() && DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_ASD_NIGHT, Boolean.valueOf(getString(R.bool.pref_camera_asd_night_default)).booleanValue());
    }

    public static boolean isAsdMotionEnable() {
        return b.gP() && DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_ASD_NIGHT, Boolean.valueOf(getString(R.bool.pref_camera_asd_night_default)).booleanValue());
    }

    public static boolean isNoCameraModeSelected(Context context) {
        for (String isSwitchOn : ((ActivityBase) context).getCurrentModule().getSupportedSettingKeys()) {
            if (isSwitchOn(isSwitchOn)) {
                return false;
            }
        }
        return true;
    }

    public static String getVideoSpeed() {
        return DataRepository.dataItemRunning().getVideoSpeed();
    }

    public static boolean isEdgePhotoEnable() {
        return b.hn() && sEdgePhotoEnable;
    }

    public static int getSystemEdgeMode(Context context) {
        if (!b.hn()) {
            return 0;
        }
        if ((System.getInt(context.getContentResolver(), "edge_handgrip_screenshot", 0) | ((System.getInt(context.getContentResolver(), "edge_handgrip", 0) | System.getInt(context.getContentResolver(), "edge_handgrip_clean", 0)) | System.getInt(context.getContentResolver(), "edge_handgrip_back", 0))) == 1) {
            return 2;
        }
        return 0;
    }

    public static void readEdgePhotoSetting(Context context) {
        if (b.hn()) {
            boolean z = true;
            if (System.getInt(context.getContentResolver(), "edge_handgrip_photo", 0) != 1) {
                z = false;
            }
            sEdgePhotoEnable = z;
        }
    }

    public static void setEdgeMode(Context context, boolean z) {
        if (context != null) {
            if (z) {
                readEdgePhotoSetting(context);
            }
            if (isEdgePhotoEnable()) {
                InputManager inputManager = (InputManager) context.getSystemService("input");
                int i = 1;
                Class[] clsArr = new Class[]{InputManager.class};
                Method method = Util.getMethod(clsArr, "switchTouchEdgeMode", "(I)V");
                if (method != null) {
                    Class cls = clsArr[0];
                    Object[] objArr = new Object[1];
                    if (!z) {
                        i = getSystemEdgeMode(context);
                    }
                    objArr[0] = Integer.valueOf(i);
                    method.invoke(cls, inputManager, objArr);
                }
            }
        }
    }

    public static String getJpegQuality(boolean z) {
        String string = DataRepository.dataItemConfig().getString(KEY_JPEG_QUALITY, getString(R.string.pref_camera_jpegquality_default));
        String str = "high";
        if (z) {
            str = "normal";
        }
        if (JpegEncodingQualityMappings.getQualityNumber(string) < JpegEncodingQualityMappings.getQualityNumber(str)) {
            return string;
        }
        return str;
    }

    public static boolean isDualCameraHintShown() {
        boolean z = true;
        if (!b.qx) {
            return true;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int i = dataItemGlobal.getInt(KEY_DUAL_CAMERA_USE_HINT_TIMES, 0);
        ProviderEditor editor = dataItemGlobal.editor();
        editor.putInt(KEY_DUAL_CAMERA_USE_HINT_TIMES, i + 1);
        editor.apply();
        if (i >= 5) {
            z = false;
        }
        return z;
    }

    public static boolean isNeedRemind(String str) {
        if (!sRemindMode.contains(str)) {
            return false;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(REMIND_SUFFIX);
        return dataItemGlobal.getBoolean(stringBuilder.toString(), true);
    }

    public static void cancelRemind(String str) {
        if (isNeedRemind(str)) {
            ProviderEditor editor = DataRepository.dataItemGlobal().editor();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(REMIND_SUFFIX);
            editor.putBoolean(stringBuilder.toString(), false);
            editor.apply();
        }
    }

    public static String getMiuiSettingsKeyForStreetSnap(String str) {
        if (str.equals(getString(R.string.pref_camera_snap_value_take_picture))) {
            return Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE;
        }
        if (str.equals(getString(R.string.pref_camera_snap_value_take_movie))) {
            return Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE;
        }
        return "none";
    }

    public static boolean isSwitchCameraZoomMode() {
        return ModuleManager.isPanoramaModule() || ModuleManager.isManualModule();
    }

    public static String getCameraZoomMode(int i) {
        return DataRepository.dataItemConfig().getManuallyDualLens().getComponentValue(i);
    }

    public static boolean isLabOptionsVisible() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_LAB_OPTIONS_VISIBLE, false);
    }

    public static void setLabOptionsVisible(boolean z) {
        DataRepository.dataItemGlobal().editor().putBoolean(KEY_CAMERA_LAB_OPTIONS_VISIBLE, z).apply();
    }

    public static boolean isCameraPortraitWithFaceBeauty() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_portrait_with_facebeauty_default));
    }

    public static boolean isCameraFaceDetectionAutoHidden() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_facedetection_auto_hidden_default));
    }

    public static boolean isDualCameraEnable() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_DUAL_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_dual_enable_default));
    }

    public static boolean isDualCameraSatEnable() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_DUAL_SAT_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_dual_sat_enable_default));
    }

    public static boolean isMfnrSatEnable() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_MFNR_SAT_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_mfnr_sat_enable_default));
    }

    public static boolean isOptimizedFlashEnable() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_OPTIMIZED_FLASH_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_optimized_flash_enable_default));
    }

    public static boolean isSREnable() {
        return b.isSupportSuperResolution() && DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_SR_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_sr_enable_default));
    }

    public static boolean isCameraParallelProcessEnable() {
        return isSupportParallelProcess() && DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_PARALLEL_PROCESS_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_parallel_process_enable_default));
    }

    public static boolean isCameraQuickShotAnimateEnable() {
        if (isSupportQuickShot()) {
            return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_QUICK_SHOT_ANIM_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_quick_shot_anim_enable_default));
        }
        return false;
    }

    public static boolean isCameraQuickShotEnable() {
        if (isSupportQuickShot()) {
            return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_QUICK_SHOT_ENABLE, CameraAppImpl.getAndroidContext().getResources().getBoolean(R.bool.pref_camera_quick_shot_enable_default));
        }
        return false;
    }

    public static boolean isSupportedOpticalZoom() {
        return b.isSupportedOpticalZoom() && Camera2DataContainer.getInstance().hasMuxCamera();
    }

    public static boolean isSupportedPortrait() {
        return b.isSupportedPortrait() && Camera2DataContainer.getInstance().hasMuxCamera();
    }

    public static boolean isSupportParallelProcess() {
        return DataRepository.dataItemFeature().fr();
    }

    public static boolean isSupportQuickShot() {
        return DataRepository.dataItemFeature().fo() || (DEBUG_FAST_SHOT && !b.qY);
    }

    public static boolean isSupportedDualCameraWaterMark() {
        return b.ie();
    }

    public static boolean isSupportedMetadata() {
        return b.gL() || isSupportedPortrait();
    }

    public static boolean isEnableDNG() {
        return false;
    }

    public static boolean isFingerprintCaptureEnable() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_FINGERPRINT_CAPTURE, false);
    }

    public static String getSaturation() {
        String string = getString(R.string.pref_camera_saturation_default);
        String string2 = DataRepository.dataItemGlobal().getString(KEY_QC_SATURATION, string);
        if (string.equals(string2) || Util.isStringValueContained((Object) string2, (int) R.array.pref_camera_saturation_entryvalues)) {
            return string2;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("reset invalid saturation ");
        stringBuilder.append(string2);
        Log.e(str, stringBuilder.toString());
        resetSaturation();
        return string;
    }

    public static String getContrast() {
        String string = getString(R.string.pref_camera_contrast_default);
        String string2 = DataRepository.dataItemGlobal().getString(KEY_QC_CONTRAST, string);
        if (string.equals(string2) || Util.isStringValueContained((Object) string2, (int) R.array.pref_camera_contrast_entryvalues)) {
            return string2;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("reset invalid contrast ");
        stringBuilder.append(string2);
        Log.e(str, stringBuilder.toString());
        resetContrast();
        return string;
    }

    public static String getSharpness() {
        String string = getString(R.string.pref_camera_sharpness_default);
        String string2 = DataRepository.dataItemGlobal().getString(KEY_QC_SHARPNESS, string);
        if (string.equals(string2) || Util.isStringValueContained((Object) string2, (int) R.array.pref_camera_sharpness_entryvalues)) {
            return string2;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("reset invalid sharpness ");
        stringBuilder.append(string2);
        Log.e(str, stringBuilder.toString());
        resetSharpness();
        return string;
    }

    public static void resetSaturation() {
        DataRepository.dataItemGlobal().editor().remove(KEY_QC_SATURATION).apply();
    }

    public static void resetContrast() {
        DataRepository.dataItemGlobal().editor().remove(KEY_QC_CONTRAST).apply();
    }

    public static void resetSharpness() {
        DataRepository.dataItemGlobal().editor().remove(KEY_QC_SHARPNESS).apply();
    }

    public static String getAntiBanding() {
        return DataRepository.dataItemGlobal().getString(KEY_ANTIBANDING, getString(getDefaultPreferenceId(R.string.pref_camera_antibanding_default)));
    }

    public static String getStereoDofLevel() {
        return DataRepository.dataItemConfig().getString(KEY_CAMERA_STEREO, getString(R.string.pref_camera_stereo_default));
    }

    public static boolean isEvAdjustable() {
        boolean z = false;
        if (isTiltShiftOn() || ModuleManager.isSuperNightScene()) {
            return false;
        }
        if (!ModuleManager.isManualModule()) {
            return true;
        }
        CameraSettingPreferences instance = CameraSettingPreferences.instance();
        String string = instance.getString(KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default));
        String string2 = instance.getString(KEY_QC_ISO, getString(R.string.pref_camera_iso_default));
        if (b.id()) {
            return string.equals(getString(R.string.pref_camera_exposuretime_default));
        }
        if (string.equals(getString(R.string.pref_camera_exposuretime_default)) || string2.equals(getString(R.string.pref_camera_iso_default))) {
            z = true;
        }
        return z;
    }

    public static boolean isPopupTipBeautyIntroEnable() {
        if (!b.hY() || DataRepository.dataItemGlobal().getBoolean(KEY_POPUP_TIP_BEAUTY_INTRO_CLICKED, false) || DataRepository.dataItemGlobal().getInt(KEY_POPUP_TIP_BEAUTY_INTRO_SHOW_TIMES, 0) >= 3) {
            return false;
        }
        return true;
    }

    public static void addPopupTipBeautyIntroShowTimes() {
        DataRepository.dataItemGlobal().editor().putInt(KEY_POPUP_TIP_BEAUTY_INTRO_SHOW_TIMES, DataRepository.dataItemGlobal().getInt(KEY_POPUP_TIP_BEAUTY_INTRO_SHOW_TIMES, 0) + 1).apply();
    }

    public static void setPopupTipBeautyIntroClicked() {
        DataRepository.dataItemGlobal().editor().putBoolean(KEY_POPUP_TIP_BEAUTY_INTRO_CLICKED, true).apply();
    }

    public static boolean isBeautyRemodelingClicked() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_BEAUTY_REMODELING_CLICKED, false);
    }

    public static void setBeautyRemodelingClicked() {
        DataRepository.dataItemGlobal().editor().putBoolean(KEY_BEAUTY_REMODELING_CLICKED, true).apply();
    }

    public static boolean isBeautyMakeupClicked() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_BEAUTY_MAKEUP_CLICKED, false);
    }

    public static void setBeautyMakeupClicked() {
        DataRepository.dataItemGlobal().editor().putBoolean(KEY_BEAUTY_MAKEUP_CLICKED, true).apply();
    }

    public static long getBroadcastKillServiceTime() {
        return DataRepository.dataItemGlobal().getLong(KEY_BROADCAST_KILL_SERVICE_TIME, 0);
    }

    public static void setBroadcastKillServiceTime(long j) {
        DataRepository.dataItemGlobal().editor().putLong(KEY_BROADCAST_KILL_SERVICE_TIME, j).apply();
    }

    public static boolean isLensDirtyDetectEnabled() {
        return DataRepository.dataNormalItemConfig().getBoolean(KEY_LENS_DIRTY_DETECT_ENABLED, true);
    }

    public static boolean shouldShowLensDirtyDetectHint() {
        long currentTimeMillis = System.currentTimeMillis();
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(currentTimeMillis);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTimeInMillis(DataRepository.dataNormalItemConfig().getLong(KEY_LENS_DIRTY_DETECT_DATE, currentTimeMillis));
        boolean z = true;
        if (instance.get(1) != instance2.get(1) || instance.get(2) != instance2.get(2) || instance.get(5) != instance2.get(5)) {
            return true;
        }
        if (DataRepository.dataNormalItemConfig().getInt(KEY_LENS_DIRTY_DETECT_TIMES, 0) >= 3) {
            z = false;
        }
        return z;
    }

    public static void setLensDirtyDetectEnable(boolean z) {
        DataRepository.dataNormalItemConfig().editor().putBoolean(KEY_LENS_DIRTY_DETECT_ENABLED, z).apply();
    }

    public static void addLensDirtyDetectedTimes() {
        ProviderEditor editor = DataRepository.dataNormalItemConfig().editor();
        editor.putBoolean(KEY_LENS_DIRTY_DETECT_ENABLED, false);
        long currentTimeMillis = System.currentTimeMillis();
        Calendar instance = Calendar.getInstance();
        instance.setTimeInMillis(currentTimeMillis);
        Calendar instance2 = Calendar.getInstance();
        instance2.setTimeInMillis(DataRepository.dataNormalItemConfig().getLong(KEY_LENS_DIRTY_DETECT_DATE, currentTimeMillis));
        int i = 1;
        if (instance.get(1) == instance2.get(1) && instance.get(2) == instance2.get(2) && instance.get(5) == instance2.get(5)) {
            i = 1 + DataRepository.dataNormalItemConfig().getInt(KEY_LENS_DIRTY_DETECT_TIMES, 0);
        }
        editor.putInt(KEY_LENS_DIRTY_DETECT_TIMES, i);
        editor.putLong(KEY_LENS_DIRTY_DETECT_DATE, currentTimeMillis);
        editor.apply();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("add lens dirty detected times: ");
        stringBuilder.append(i);
        Log.i(str, stringBuilder.toString());
    }

    public static void initBeautyValues(BeautyValues beautyValues, boolean z) {
        if (beautyValues != null) {
            if (b.ia()) {
                initNewBeautyValues(beautyValues);
                return;
            }
            beautyValues.mBeautyLevel = getFaceBeautifyValue();
            boolean isUseAdvanceBeauty = isUseAdvanceBeauty();
            String str = KEY_BEAUTIFY_SLIM_FACE_RATIO;
            int i = 0;
            beautyValues.mBeautySlimFace = !isUseAdvanceBeauty ? 0 : getFaceBeautyRatio(str, getDefaultRatio(str, z));
            str = KEY_BEAUTIFY_ENLARGE_EYE_RATIO;
            beautyValues.mBeautyEnlargeEye = !isUseAdvanceBeauty ? 0 : getFaceBeautyRatio(str, getDefaultRatio(str, z));
            str = KEY_BEAUTIFY_SKIN_COLOR_RATIO;
            beautyValues.mBeautySkinColor = !isUseAdvanceBeauty ? 0 : getFaceBeautyRatio(str, getDefaultRatio(str, z));
            str = KEY_BEAUTIFY_SKIN_SMOOTH_RATIO;
            if (isUseAdvanceBeauty) {
                i = getFaceBeautyRatio(str, getDefaultRatio(str, z));
            }
            beautyValues.mBeautySkinSmooth = i;
        }
    }

    public static void initBeautyBody(BeautyValues beautyValues) {
        if (beautyValues != null) {
            boolean z = isSupportBeautyBody() && !DataRepository.dataItemConfig().getComponentConfigBeautyBody().isClosed();
            beautyValues.mBeautyHeadSlim = getItemBeautyValue(z, KEY_BEAUTY_HEAD_SLIM_RATIO);
            beautyValues.mBeautyBodySlim = getItemBeautyValue(z, KEY_BEAUTY_BODY_SLIM_RATIO);
            beautyValues.mBeautyShoulderSlim = getItemBeautyValue(z, KEY_BEAUTY_SHOULDER_SLIM_RATIO);
            beautyValues.mBeautyLegSlim = getItemBeautyValue(z, KEY_BEAUTY_LEG_SLIM_RATIO);
        }
    }

    private static boolean isUseAdvanceBeauty() {
        return ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode() != 171;
    }

    private static int getDefaultRatio(String str, boolean z) {
        if (!z) {
            return 0;
        }
        int[] beautifyValueRange = getBeautifyValueRange();
        if (beautifyValueRange == null || beautifyValueRange.length != 2) {
            return 0;
        }
        int i = beautifyValueRange[1] - beautifyValueRange[0];
        if (i == 0) {
            return 0;
        }
        return (100 * (getBeautifyDefaultValue(str) - beautifyValueRange[0])) / i;
    }

    private static void initNewBeautyValues(BeautyValues beautyValues) {
        if (beautyValues != null) {
            beautyValues.mBeautyLevel = getFaceBeautifyValue();
            boolean isUseAdvanceBeauty = isUseAdvanceBeauty();
            beautyValues.mBeautySlimFace = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_SLIM_FACE_RATIO);
            beautyValues.mBeautyEnlargeEye = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_ENLARGE_EYE_RATIO);
            beautyValues.mBeautyNose = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_NOSE_RATIO);
            beautyValues.mBeautyRisorius = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_RISORIUS_RATIO);
            beautyValues.mBeautyLips = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_LIPS_RATIO);
            beautyValues.mBeautyChin = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_CHIN_RATIO);
            beautyValues.mBeautyNeck = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_NECK_RATIO);
            beautyValues.mBeautySmile = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_SMILE_RATIO);
            beautyValues.mBeautySlimNose = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_SLIM_NOSE_RATIO);
            beautyValues.mBeautyEyebrowDye = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_EYEBROW_DYE_RATIO);
            beautyValues.mBeautyPupilLine = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_PUPIL_LINE_RATIO);
            beautyValues.mBeautyJellyLips = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_JELLY_LIPS_RATIO);
            beautyValues.mBeautyBlusher = getItemBeautyValue(isUseAdvanceBeauty, KEY_BEAUTIFY_BLUSHER_RATIO);
        }
    }

    private static int getItemBeautyValue(boolean z, String str) {
        return !z ? 0 : getFaceBeautyRatio(str, getDefaultRatio(str, false));
    }

    public static void resetEyeLight() {
        DataRepository.dataItemConfig().editor().remove("pref_eye_light_type_key");
    }

    public static String getEyeLightType() {
        if (isFaceBeautyOn(getFaceBeautifyValue()) && isUseAdvanceBeauty()) {
            return DataRepository.dataItemConfig().getString("pref_eye_light_type_key", EyeLightConstant.OFF);
        }
        return EyeLightConstant.OFF;
    }

    public static boolean isEyeLightOpen() {
        if (EyeLightConstant.OFF.equals(getEyeLightType())) {
            return false;
        }
        return true;
    }

    public static void setEyeLight(String str) {
        DataRepository.dataItemConfig().putString("pref_eye_light_type_key", str);
    }

    public static boolean isCameraSpecific(String str) {
        return str.equals("pref_camera_picturesize_key") || str.equals(KEY_JPEG_QUALITY) || str.equals(KEY_VIDEO_QUALITY) || str.equals(KEY_VIDEO_HIGH_FRAME_RATE) || str.equals(KEY_VIDEO_NEW_SLOW_MOTION) || str.equals("pref_sticker_path_key") || str.equals(KEY_FLASH_MODE) || str.equals(KEY_VIDEOCAMERA_FLASH_MODE) || str.equals(KEY_CAMERA_HDR) || str.equals(KEY_VIDEO_HDR) || str.equals(KEY_WHITE_BALANCE) || str.equals("pref_qc_manual_whitebalance_k_value_key") || str.equals(KEY_QC_FOCUS_POSITION) || str.equals(KEY_QC_EXPOSURETIME) || str.equals(KEY_QC_ISO) || str.equals(KEY_CAMERA_ZOOM_MODE) || str.equals(KEY_CAMERA_MANUALLY_LENS) || str.equals("pref_camera_face_beauty_key") || str.equals("pref_video_face_beauty_key") || str.equals(KEY_FACE_BEAUTY_SWITCH) || str.equals(KEY_BEAUTIFY_SLIM_FACE_RATIO) || str.equals(KEY_BEAUTIFY_SKIN_SMOOTH_RATIO) || str.equals(KEY_BEAUTIFY_SKIN_COLOR_RATIO) || str.equals(KEY_BEAUTIFY_ENLARGE_EYE_RATIO);
    }

    public static boolean isTransient(String str) {
        return str.equals("pref_delay_capture_mode") || str.equals("pref_camera_shader_coloreffect_key") || str.equals("pref_camera_scenemode_key") || str.equals("pref_camera_scenemode_setting_key") || str.equals("pref_camera_gradienter_key") || str.equals("pref_camera_ubifocus_key") || str.equals("pref_camera_magic_mirror_key") || str.equals("pref_camera_groupshot_mode_key") || str.equals("pref_camera_super_resolution_key") || str.equals("pref_camera_tilt_shift_key") || str.equals("pref_camera_tilt_shift_mode") || str.equals("pref_camera_hand_night_key") || str.equals("pref_video_speed_fast_key") || str.equals("pref_video_speed_slow_key") || str.equals("pref_video_speed_hfr_key") || str.equals("pref_camera_portrait_mode_key") || str.equals("pref_camera_manual_mode_key") || str.equals("pref_camera_square_mode_key") || str.equals("pref_camera_show_gender_age_key") || str.equals("pref_camera_peak_key") || str.equals("pref_camera_stereo_mode_key");
    }

    public static void setPanoramaMoveDirection(int i) {
        DataRepository.dataItemRunning().putInt("pref_panorana_move_direction_key", i);
    }

    public static int getPanoramaMoveDirection() {
        return DataRepository.dataItemRunning().getInt("pref_panorana_move_direction_key", 3);
    }

    public static final String getDualCameraWaterMarkFilePathVendor() {
        if (b.qO) {
            if ("india".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"))) {
                return DUAL_CAMERA_WATER_MARK_FILE_FROM_VENDOR_INDIA;
            }
        }
        return DUAL_CAMERA_WATER_MARK_FILE;
    }

    public static boolean isAgeGenderWaterMarkOpen() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key");
    }

    public static boolean isMagicMirrorWaterMarkOpen() {
        return DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key");
    }

    public static boolean isAgeGenderAndMagicMirrorWaterOpen() {
        return DataRepository.dataItemFeature().fg() && isFrontCamera() && (isAgeGenderWaterMarkOpen() || isMagicMirrorWaterMarkOpen());
    }

    public static boolean isFrontPortrait() {
        boolean z = false;
        if (!isFrontCamera()) {
            return false;
        }
        if (((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode() == 171) {
            z = true;
        }
        return z;
    }

    public static boolean isBackPortrait() {
        boolean z = false;
        if (!isBackCamera()) {
            return false;
        }
        if (((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode() == 171) {
            z = true;
        }
        return z;
    }

    public static void setUltraWideConfig(int i, boolean z) {
        String str;
        if (z) {
            str = ComponentConfigUltraWide.ULTRA_WIDE_VALUE_ON;
        } else {
            str = ComponentConfigUltraWide.ULTRA_WIDE_VALUE_OFF;
        }
        DataRepository.dataItemConfig().getComponentConfigUltraWide().setComponentValue(i, str);
    }

    public static boolean isUltraWideConfigOpen(int i) {
        ComponentConfigUltraWide componentConfigUltraWide = DataRepository.dataItemConfig().getComponentConfigUltraWide();
        return componentConfigUltraWide.isSupportUltraWide() && componentConfigUltraWide.isUltraWideOnInMode(i);
    }

    public static int getBeautyShowLevel() {
        return intelligentValueToBeautyLevel(getFaceBeautifyValue());
    }

    public static boolean isUltraWideLDCEnabled() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_ULTRA_WIDE_LDC, getBool(R.bool.pref_camera_ultra_wide_ldc_default));
    }

    public static boolean isUltraWideVideoLDCEnabled() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_ULTRA_WIDE_VIDEO_LDC, getBool(R.bool.pref_camera_ultra_wide_ldc_default));
    }

    public static boolean isNormalWideLDCEnabled() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_NORMAL_WIDE_LDC, getBool(R.bool.pref_camera_normal_wide_ldc_default));
    }

    public static String getCustomWatermarkDefault() {
        Object obj = (isUltraPixelPhotographyOn() || isRearMenuUltraPixelPhotographyOn()) ? 1 : null;
        if (obj != null) {
            return getString(R.string.device_48m_watermark_default_text);
        }
        return getString(R.string.device_watermark_default_text);
    }

    public static String getCustomWatermark() {
        return DataRepository.dataItemGlobal().getString(KEY_CUSTOM_WATERMARK, getString(R.string.device_watermark_default_text));
    }

    public static String getDefaultWatermarkStr() {
        return getString(R.string.device_watermark_default_text);
    }

    public static void setCustomWatermark(String str) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putString(KEY_CUSTOM_WATERMARK, str);
        editor.apply();
    }

    public static String getKeyCloudSenstiveWordsPath(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(CLOUD_APPMARKET_SERVER);
        stringBuilder.append(str);
        stringBuilder.append("/sensi_words.txt");
        return stringBuilder.toString();
    }

    public static int getLocalWordsVersion() {
        return DataRepository.dataItemGlobal().getInt(KEY_LOCALWORDS_VERSION, 0);
    }

    public static void setLocalWordsVersion(int i) {
        DataRepository.dataItemGlobal().editor().putInt(KEY_LOCALWORDS_VERSION, i).apply();
    }

    public static String readFNumber() {
        return DataRepository.dataItemRunning().getString(KEY_F_NUMBER, F_NUMBER_DEFAULT_VALUE);
    }

    public static void writeFNumber(String str) {
        DataRepository.dataItemRunning().putString(KEY_F_NUMBER, str);
    }

    public static boolean isLiveStickerInternalChannel() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_LIVE_STICKER_INTERNAL, getBool(R.bool.pref_camera_live_sticker_internal_default));
    }

    public static void setCurrentLiveSticker(String str, String str2, String str3) {
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_STICKER, str).apply();
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_STICKER_NAME, str2).apply();
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_STICKER_HINT, str3).apply();
    }

    public static String getCurrentLiveSticker() {
        return DataRepository.dataItemLive().getString(KEY_LIVE_STICKER, "");
    }

    public static String getCurrentLiveStickerName() {
        return DataRepository.dataItemLive().getString(KEY_LIVE_STICKER_NAME, "");
    }

    public static String getCurrentLiveStickerHint() {
        return DataRepository.dataItemLive().getString(KEY_LIVE_STICKER_HINT, "");
    }

    public static void setCurrentLiveMusic(String str, String str2) {
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_MUSIC_PATH, str).apply();
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_MUSIC_HINT, str2).apply();
    }

    public static String[] getCurrentLiveMusic() {
        return new String[]{DataRepository.dataItemLive().getString(KEY_LIVE_MUSIC_PATH, ""), DataRepository.dataItemLive().getString(KEY_LIVE_MUSIC_HINT, "")};
    }

    public static void setLiveAllSwitchAddValue(int i) {
        DataRepository.dataItemLive().editor().putInt(KEY_LIVE_ALL_SWITCH_ADD_VALUE, i).apply();
    }

    public static int getLiveAllSwitchAllValue() {
        return DataRepository.dataItemLive().getInt(KEY_LIVE_ALL_SWITCH_ADD_VALUE, 0);
    }

    public static void setUltraPixelPhotographyConfig(boolean z) {
        DataRepository.dataItemRunning().putBoolean(KEY_ULTRA_PIXEL_PHOTOGRAPHY, z);
    }

    public static boolean isUltraPixelPhotographyOn() {
        return DataRepository.dataItemRunning().getBoolean(KEY_ULTRA_PIXEL_PHOTOGRAPHY, false);
    }

    public static void setCurrentLiveSpeed(String str) {
        DataRepository.dataItemLive().editor().putString(KEY_LIVE_SPEED, str).apply();
    }

    public static String getCurrentLiveSpeed() {
        return DataRepository.dataItemLive().getString(KEY_LIVE_SPEED, String.valueOf(2));
    }

    public static String getCurrentLiveSpeedText() {
        return getString(sLiveSpeedTextList[Integer.valueOf(getCurrentLiveSpeed()).intValue()]);
    }

    public static boolean shouldNormalWideLDCBeVisibleInMode(int i) {
        boolean isSupportNormalWideLDC = DataRepository.dataItemFeature().isSupportNormalWideLDC();
        if (i == 163 || i == 165 || i == 167) {
            return isSupportNormalWideLDC;
        }
        return false;
    }

    public static boolean shouldUltraWideLDCBeVisibleInMode(int i) {
        boolean isSupportUltraWideLDC = DataRepository.dataItemFeature().isSupportUltraWideLDC();
        boolean z = false;
        if (i != 163 && i != 165 && i != 167 && i != 173) {
            return false;
        }
        if (isSupportUltraWideLDC && isBackCamera()) {
            z = true;
        }
        return z;
    }

    public static boolean shouldUltraWideVideoLDCBeVisibleInMode(int i) {
        return false;
    }

    public static String getTTLiveMusicJsonCache() {
        return DataRepository.dataItemLive().getString(KEY_TT_LIVE_MUSIC_JSON_CACHE, "");
    }

    public static void setTTLiveMusicJsonCache(String str) {
        ProviderEditor editor = DataRepository.dataItemLive().editor();
        editor.putString(KEY_TT_LIVE_MUSIC_JSON_CACHE, str);
        editor.apply();
    }

    public static String getTTLiveStickerJsonCache() {
        return DataRepository.dataItemLive().getString(KEY_TT_LIVE_STICKER_JSON_CACHE, "");
    }

    public static void setTTLiveStickerJsonCache(String str) {
        ProviderEditor editor = DataRepository.dataItemLive().editor();
        editor.putString(KEY_TT_LIVE_STICKER_JSON_CACHE, str);
        editor.apply();
    }

    public static void setTTLiveStickerNeedRedDot(boolean z) {
        ProviderEditor editor = DataRepository.dataItemLive().editor();
        editor.putBoolean(KEY_LIVE_STICKER_NEED_RED_DOT, z);
        editor.apply();
    }

    public static boolean getTTLiveStickerNeedRedDot() {
        return DataRepository.dataItemLive().getBoolean(KEY_LIVE_STICKER_NEED_RED_DOT, false);
    }

    public static long getLiveStickerRedDotTime() {
        return DataRepository.dataItemGlobal().getLong(KEY_LIVE_STICKER_RED_DOT_TIME, 0);
    }

    public static void setLiveStickerRedDotTime(long j) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putLong(KEY_LIVE_STICKER_RED_DOT_TIME, j);
        editor.apply();
    }

    public static long getLiveStickerLastCacheTime() {
        return DataRepository.dataItemGlobal().getLong(KEY_LIVE_STICKER_LAST_CACHE_TIME, 0);
    }

    public static void setLiveStickerLastCacheTime(long j) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putLong(KEY_LIVE_STICKER_LAST_CACHE_TIME, j);
        editor.apply();
    }

    public static boolean isSaveGroushotPrimitiveOn() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_CAMERA_GROUPSHOT_PRIMITIVE, false);
    }

    public static void addPopupUltraWideIntroShowTimes() {
        DataRepository.dataItemGlobal().editor().putInt(KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES, DataRepository.dataItemGlobal().getInt(KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES, 0) + 1).apply();
    }

    public static boolean isShowUltraWideIntro() {
        return DataRepository.dataItemGlobal().getInt(KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES, 0) < 2;
    }

    public static void setPopupUltraWideIntroClicked() {
        DataRepository.dataItemGlobal().editor().putInt(KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES, 2).apply();
    }

    public static boolean isLiveModuleClicked() {
        return DataRepository.dataItemGlobal().getBoolean(KEY_LIVE_MODULE_CLICKED, false);
    }

    public static void setLiveModuleClicked(boolean z) {
        DataRepository.dataItemGlobal().editor().putBoolean(KEY_LIVE_MODULE_CLICKED, z).apply();
    }

    public static boolean isRearMenuUltraPixelPhotographyOn() {
        return DataRepository.dataItemRunning().getBoolean("pref_menu_ultra_pixel_photography_rear", false);
    }

    public static boolean isFrontMenuUltraPixelPhotographyOn() {
        return DataRepository.dataItemRunning().getBoolean("pref_menu_ultra_pixel_photography_front", false);
    }

    public static void setRearMenuUltraPixelPhotographyConfig(boolean z) {
        DataRepository.dataItemRunning().putBoolean("pref_menu_ultra_pixel_photography_rear", z);
    }

    public static void setFrontMenuUltraPixelPhotographyConfig(boolean z) {
        DataRepository.dataItemRunning().putBoolean("pref_menu_ultra_pixel_photography_front", z);
    }

    public static void setLiveBeautyStatus(boolean z) {
        if (DataRepository.dataItemLive().getBoolean(KEY_LIVE_BEAUTY_STATUS, false) != z) {
            DataRepository.dataItemLive().putBoolean(KEY_LIVE_BEAUTY_STATUS, z);
        }
    }

    public static boolean isLiveBeautyOpen() {
        if (DataRepository.dataItemLive().getBoolean(KEY_LIVE_BEAUTY_STATUS, false) || DataRepository.dataItemLive().getLiveFilter() != 0) {
            return true;
        }
        return false;
    }

    public static boolean isSupportBeautyBody() {
        if (isBackPortrait()) {
            return false;
        }
        switch (ModuleManager.getActiveModuleIndex()) {
            case 161:
            case 162:
                return false;
            default:
                return DataRepository.dataItemFeature().isSupportBeautyBody();
        }
    }

    public static void setHandGestureStatus(boolean z) {
        if (DataRepository.dataItemRunning().getBoolean("pref_hand_gesture", false) != z) {
            DataRepository.dataItemRunning().putBoolean("pref_hand_gesture", z);
        }
    }

    public static boolean isHandGestureOpen() {
        return DataRepository.dataItemRunning().getBoolean("pref_hand_gesture", false);
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0043 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0042 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0041 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0043 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0042 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0041 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0043 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0042 A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0041 A:{RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isLiveBeautyModeKey(String str) {
        if (!TextUtils.isEmpty(str)) {
            boolean z;
            int hashCode = str.hashCode();
            if (hashCode == -2110473153) {
                if (str.equals(KEY_LIVE_SMOOTH_STRENGTH)) {
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        default:
                            break;
                    }
                }
            } else if (hashCode == 175697132) {
                if (str.equals(KEY_LIVE_SHRINK_FACE_RATIO)) {
                    z = false;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                        case true:
                            break;
                        default:
                            break;
                    }
                }
            } else if (hashCode == 1771202045 && str.equals(KEY_LIVE_ENLARGE_EYE_RATIO)) {
                z = true;
                switch (z) {
                    case false:
                        return true;
                    case true:
                        return true;
                    case true:
                        return true;
                    default:
                        return false;
                }
            }
            z = true;
            switch (z) {
                case false:
                    break;
                case true:
                    break;
                case true:
                    break;
                default:
                    break;
            }
        }
        return false;
    }

    public static long getExposureTime() {
        CameraSettingPreferences instance = CameraSettingPreferences.instance();
        String string = getString(R.string.pref_camera_exposuretime_default);
        if (ModuleManager.isManualModule()) {
            string = instance.getString(KEY_QC_EXPOSURETIME, string);
        }
        return Long.parseLong(string);
    }

    public static boolean isCheckShowUltraWideTip(int i) {
        if ((163 == i || 162 == i) && isUltraWideConfigOpen(i)) {
            return true;
        }
        return false;
    }
}
