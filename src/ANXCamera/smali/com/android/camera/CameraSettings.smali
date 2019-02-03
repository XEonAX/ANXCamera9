.class public Lcom/android/camera/CameraSettings;
.super Ljava/lang/Object;
.source "CameraSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/CameraSettings$UiStyle;
    }
.end annotation


# static fields
.field public static final AI_LENS_PACKAGE:Ljava/lang/String; = "com.xiaomi.lens"

.field public static final APP_V10_SETTINGS_VERSION:I = 0x1

.field public static final APP_V20_SETTINGS_VERSION:I = 0x3

.field public static final APP_V30_SETTINGS_VERSION:I = 0x4

.field public static final ASPECT_RATIO_16_9:I = 0x1

.field public static final ASPECT_RATIO_18_9:I = 0x3

.field public static final ASPECT_RATIO_1_1:I = 0x2

.field public static final ASPECT_RATIO_4_3:I = 0x0

.field public static final AUTO_FOCUS_POSITION:I = 0x3e8

.field public static BOTTOM_CONTROL_HEIGHT:I = 0x0

.field public static final CLOUD_APPMARKET_SERVER:Ljava/lang/String; = "http://file.market.xiaomi.com/download/"

.field public static final CURRENT_VERSION:I = 0x4

.field public static final DEFAULT_VIDEO_DURATION:I = 0x0

.field private static final DUAL_CAMERA_USE_HINT_SHOWN_MAX_TIMES:I = 0x5

.field private static final DUAL_CAMERA_WATER_MARK_FILE:Ljava/lang/String; = "/vendor/etc/camera/dualcamera.png"

.field private static final DUAL_CAMERA_WATER_MARK_FILE_FROM_VENDOR_INDIA:Ljava/lang/String; = "/vendor/etc/camera/dualcamera_india.png"

.field private static final EDGE_HANDGRIP_MODE:Ljava/lang/String; = "edge_handgrip"

.field private static final EDGE_HANDGRIP_MODE_BACK:Ljava/lang/String; = "edge_handgrip_back"

.field private static final EDGE_HANDGRIP_MODE_CLEAN:Ljava/lang/String; = "edge_handgrip_clean"

.field private static final EDGE_HANDGRIP_MODE_PHOTO:Ljava/lang/String; = "edge_handgrip_photo"

.field private static final EDGE_HANDGRIP_MODE_SCREENSHOT:Ljava/lang/String; = "edge_handgrip_screenshot"

.field public static final EXPOSURE_DEFAULT_VALUE:Ljava/lang/String; = "0"

.field public static final F_NUMBER_DEFAULT_VALUE:Ljava/lang/String;

.field public static final GOOGLE_LENS_PACKAGE:Ljava/lang/String; = "com.google.ar.lens"

.field public static final KEY_AE_AF_LOCK_SUPPORT:Ljava/lang/String; = "pref_camera_ae_af_lock_support_key"

.field public static final KEY_AI_DETECT_ENABLE:Ljava/lang/String; = "pref_camera_ai_detect_enable_key"

.field public static final KEY_AI_SCENE_MODE:Ljava/lang/String; = "pref_camera_ai_scene_mode_key"

.field public static final KEY_ANTIBANDING:Ljava/lang/String; = "pref_camera_antibanding_key"

.field public static final KEY_AUTOEXPOSURE:Ljava/lang/String; = "pref_camera_autoexposure_key"

.field public static final KEY_AUTO_CHROMA_FLASH:Ljava/lang/String; = "pref_auto_chroma_flash_key"

.field public static final KEY_AUTO_ZOOM:Ljava/lang/String; = "pref_camera_auto_zoom"

.field public static final KEY_AUTO_ZOOM_ULTRA_COUNT:Ljava/lang/String; = "pref_auto_zoom_ultra_count"

.field public static final KEY_BEAUTIFY_BLUSHER_RATIO:Ljava/lang/String; = "pref_beautify_blusher_ratio_key"

.field public static final KEY_BEAUTIFY_CHIN_RATIO:Ljava/lang/String; = "pref_beautify_chin_ratio_key"

.field public static final KEY_BEAUTIFY_ENLARGE_EYE:Ljava/lang/String; = "pref_skin_beautify_enlarge_eye_key"

.field public static final KEY_BEAUTIFY_ENLARGE_EYE_RATIO:Ljava/lang/String; = "pref_beautify_enlarge_eye_ratio_key"

.field public static final KEY_BEAUTIFY_EYEBROW_DYE_RATIO:Ljava/lang/String; = "pref_beautify_eyebrow_dye_ratio_key"

.field public static final KEY_BEAUTIFY_JELLY_LIPS_RATIO:Ljava/lang/String; = "pref_beautify_jelly_lips_ratio_key"

.field public static final KEY_BEAUTIFY_LIPS_RATIO:Ljava/lang/String; = "pref_beautify_lips_ratio_key"

.field public static final KEY_BEAUTIFY_NECK_RATIO:Ljava/lang/String; = "pref_beautify_neck_ratio_key"

.field public static final KEY_BEAUTIFY_NOSE_RATIO:Ljava/lang/String; = "pref_beautify_nose_ratio_key"

.field public static final KEY_BEAUTIFY_PUPIL_LINE_RATIO:Ljava/lang/String; = "pref_beautify_pupil_line_ratio_key"

.field public static final KEY_BEAUTIFY_RISORIUS_RATIO:Ljava/lang/String; = "pref_beautify_risorius_ratio_key"

.field public static final KEY_BEAUTIFY_SKIN_COLOR:Ljava/lang/String; = "pref_skin_beautify_skin_color_key"

.field public static final KEY_BEAUTIFY_SKIN_COLOR_RATIO:Ljava/lang/String; = "pref_beautify_skin_color_ratio_key"

.field public static final KEY_BEAUTIFY_SKIN_SMOOTH:Ljava/lang/String; = "pref_skin_beautify_skin_smooth_key"

.field public static final KEY_BEAUTIFY_SKIN_SMOOTH_RATIO:Ljava/lang/String; = "pref_beautify_skin_smooth_ratio_key"

.field public static final KEY_BEAUTIFY_SLIM_FACE:Ljava/lang/String; = "pref_skin_beautify_slim_face_key"

.field public static final KEY_BEAUTIFY_SLIM_FACE_RATIO:Ljava/lang/String; = "pref_beautify_slim_face_ratio_key"

.field public static final KEY_BEAUTIFY_SLIM_NOSE_RATIO:Ljava/lang/String; = "pref_beautify_slim_nose_ratio_key"

.field public static final KEY_BEAUTIFY_SMILE_RATIO:Ljava/lang/String; = "pref_beautify_smile_ratio_key"

.field public static final KEY_BEAUTY_BODY_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_body_slim_ratio"

.field public static final KEY_BEAUTY_HEAD_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_head_slim_ratio"

.field public static final KEY_BEAUTY_LEG_SLIM_RATIO:Ljava/lang/String; = "key_beauty_leg_slim_ratio"

.field public static final KEY_BEAUTY_MAKEUP_CLICKED:Ljava/lang/String; = "pref_beauty_makeup_clicked_key"

.field public static final KEY_BEAUTY_REMODELING_CLICKED:Ljava/lang/String; = "pref_beauty_remodeling_clicked_key"

.field public static final KEY_BEAUTY_SHOULDER_SLIM_RATIO:Ljava/lang/String; = "pref_beauty_shoulder_slim_ratio"

.field public static final KEY_BROADCAST_KILL_SERVICE_TIME:Ljava/lang/String; = "pref_broadcast_kill_service_key"

.field public static final KEY_BURST_SHOOT:Ljava/lang/String; = "pref_camera_burst_shooting_key"

.field public static final KEY_CAMERA_ASD_MOTION:Ljava/lang/String; = "pref_camera_asd_motion_key"

.field public static final KEY_CAMERA_ASD_NIGHT:Ljava/lang/String; = "pref_camera_asd_night_key"

.field public static final KEY_CAMERA_CONFIRM_LOCATION_SHOWN:Ljava/lang/String; = "pref_camera_confirm_location_shown_key"

.field public static final KEY_CAMERA_DUAL_ENABLE:Ljava/lang/String; = "pref_camera_dual_enable_key"

.field public static final KEY_CAMERA_DUAL_SAT_ENABLE:Ljava/lang/String; = "pref_camera_dual_sat_enable_key"

.field public static final KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN:Ljava/lang/String; = "pref_camera_facedetection_auto_hidden_key"

.field public static final KEY_CAMERA_FIRST_AI_SCENE_USE_HINT_SHOWN:Ljava/lang/String; = "pref_camera_first_ai_scene_use_hint_shown_key"

.field public static final KEY_CAMERA_FIRST_PORTRAIT_USE_HINT_SHOWN:Ljava/lang/String; = "pref_camera_first_portrait_use_hint_shown_key"

.field public static final KEY_CAMERA_FIRST_ULTRA_WIDE_USE_HINT_SHOWN:Ljava/lang/String; = "pref_camera_first_ultra_wide_use_hint_shown_key"

.field public static final KEY_CAMERA_FIRST_USE_HINT_SHOWN:Ljava/lang/String; = "pref_camera_first_use_hint_shown_key"

.field public static final KEY_CAMERA_FOCUS_MODE:Ljava/lang/String; = "pref_camera_focus_mode_key"

.field public static final KEY_CAMERA_GRADIENTER_KEY:Ljava/lang/String; = "pref_camera_gradienter_key"

.field public static final KEY_CAMERA_GROUPSHOT_MODE:Ljava/lang/String; = "pref_camera_groupshot_mode_key"

.field public static final KEY_CAMERA_GROUPSHOT_PRIMITIVE:Ljava/lang/String; = "pref_groupshot_with_primitive_picture_key"

.field public static final KEY_CAMERA_HAND_NIGHT:Ljava/lang/String; = "pref_camera_hand_night_key"

.field public static final KEY_CAMERA_HDR:Ljava/lang/String; = "pref_camera_hdr_key"

.field public static final KEY_CAMERA_HSR_VALUE:Ljava/lang/String; = "pref_camera_hsr_value_key"

.field public static final KEY_CAMERA_ID:Ljava/lang/String; = "pref_camera_id_key"

.field public static final KEY_CAMERA_LAB_OPTIONS_VISIBLE:Ljava/lang/String; = "pref_camera_lab_option_key_visible"

.field public static final KEY_CAMERA_LAB_SUB_OPTIONS:Ljava/lang/String; = "pref_camera_lab_option_key"

.field public static final KEY_CAMERA_MAGIC_MIRROR_KEY:Ljava/lang/String; = "pref_camera_magic_mirror_key"

.field public static final KEY_CAMERA_MANUALLY_LENS:Ljava/lang/String; = "pref_camera_manually_lens"

.field public static final KEY_CAMERA_MANUAL_MODE:Ljava/lang/String; = "pref_camera_manual_mode_key"

.field public static final KEY_CAMERA_MFNR_SAT_ENABLE:Ljava/lang/String; = "pref_camera_mfnr_sat_enable_key"

.field public static final KEY_CAMERA_MODE_SETTINGS:Ljava/lang/String; = "pref_camera_mode_settings_key"

.field public static final KEY_CAMERA_OBJECT_TRACK_HINT_SHOWN:Ljava/lang/String; = "pref_camera_first_tap_screen_hint_shown_key"

.field public static final KEY_CAMERA_OPTIMIZED_FLASH_ENABLE:Ljava/lang/String; = "pref_camera_optimized_flash_enable_key"

.field public static final KEY_CAMERA_PARALLEL_PROCESS_ENABLE:Ljava/lang/String; = "pref_camera_parallel_process_enable_key"

.field public static final KEY_CAMERA_PEAKING_FOCUS:Ljava/lang/String; = "pref_camera_peak_key"

.field public static final KEY_CAMERA_PORTRAIT_MODE:Ljava/lang/String; = "pref_camera_portrait_mode_key"

.field public static final KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY:Ljava/lang/String; = "pref_camera_portrait_with_facebeauty_key"

.field public static final KEY_CAMERA_PROXIMITY_LOCK:Ljava/lang/String; = "pref_camera_proximity_lock_key"

.field public static final KEY_CAMERA_SNAP:Ljava/lang/String; = "pref_camera_snap_key"

.field public static final KEY_CAMERA_SOUND:Ljava/lang/String; = "pref_camerasound_key"

.field public static final KEY_CAMERA_SQUARE_MODE:Ljava/lang/String; = "pref_camera_square_mode_key"

.field public static final KEY_CAMERA_SR_ENABLE:Ljava/lang/String; = "pref_camera_sr_enable_key"

.field public static final KEY_CAMERA_STEREO:Ljava/lang/String; = "pref_camera_stereo_key"

.field public static final KEY_CAMERA_STEREO_MODE:Ljava/lang/String; = "pref_camera_stereo_mode_key"

.field public static final KEY_CAMERA_SUPER_RESOLUTION:Ljava/lang/String; = "pref_camera_super_resolution_key"

.field public static final KEY_CAMERA_TILT_SHIFT:Ljava/lang/String; = "pref_camera_tilt_shift_key"

.field public static final KEY_CAMERA_TILT_SHIFT_MODE:Ljava/lang/String; = "pref_camera_tilt_shift_mode"

.field public static final KEY_CAMERA_ZOOM_MODE:Ljava/lang/String; = "pref_camera_zoom_mode_key"

.field public static final KEY_CAPTURE_ULTRA_WIDE_MODE:Ljava/lang/String; = "pref_ultra_wide_status"

.field public static final KEY_CAPTURE_WHEN_STABLE:Ljava/lang/String; = "pref_capture_when_stable_key"

.field public static final KEY_CATEGORY_ADVANCE_SETTING:Ljava/lang/String; = "category_advance_setting"

.field public static final KEY_CATEGORY_CAMCORDER_SETTING:Ljava/lang/String; = "category_camcorder_setting"

.field public static final KEY_CATEGORY_CAPTURE_SETTING:Ljava/lang/String; = "category_camera_setting"

.field public static final KEY_CATEGORY_DEVICE_SETTING:Ljava/lang/String; = "category_device_setting"

.field public static final KEY_COLOR_EFFECT:Ljava/lang/String; = "pref_camera_coloreffect_key"

.field public static final KEY_CUSTOM_WATERMARK:Ljava/lang/String; = "pref_custom_watermark"

.field public static final KEY_DELAY_CAPTURE:Ljava/lang/String; = "pref_delay_capture_key"

.field public static final KEY_DELAY_CAPTURE_MODE:Ljava/lang/String; = "pref_delay_capture_mode"

.field public static final KEY_DEVICE_WATERMARK:Ljava/lang/String; = "pref_dualcamera_watermark"

.field public static final KEY_DUAL_CAMERA_USE_HINT_TIMES:Ljava/lang/String; = "pref_dual_camera_use_hint_shown_times_key"

.field public static final KEY_EXPOSURE:Ljava/lang/String; = "pref_camera_exposure_key"

.field public static final KEY_EYE_LIGHT_TYPE:Ljava/lang/String; = "pref_eye_light_type_key"

.field public static final KEY_FACE_BEAUTY:Ljava/lang/String; = "pref_camera_face_beauty_key"

.field public static final KEY_FACE_BEAUTY_ADVANCED:Ljava/lang/String; = "pref_camera_face_beauty_advanced_key"

.field public static final KEY_FACE_BEAUTY_MODE:Ljava/lang/String; = "pref_camera_face_beauty_mode_key"

.field public static final KEY_FACE_BEAUTY_SWITCH:Ljava/lang/String; = "pref_camera_face_beauty_switch_key"

.field public static final KEY_FACE_DETECTION:Ljava/lang/String; = "pref_camera_facedetection_key"

.field public static final KEY_FACE_INFO_WATERMARK:Ljava/lang/String; = "pref_face_info_watermark_key"

.field public static final KEY_FINGERPRINT_CAPTURE:Ljava/lang/String; = "pref_fingerprint_capture_key"

.field public static final KEY_FLASH_MODE:Ljava/lang/String; = "pref_camera_flashmode_key"

.field public static final KEY_FOCUS_SHOOT:Ljava/lang/String; = "pref_camera_focus_shoot_key"

.field public static final KEY_FRONT_CAMERA_FIRST_USE_HINT_SHOWN:Ljava/lang/String; = "pref_front_camera_first_use_hint_shown_key"

.field public static final KEY_FRONT_MIRROR:Ljava/lang/String; = "pref_front_mirror_key"

.field public static final KEY_F_NUMBER:Ljava/lang/String; = "pref_f_number"

.field public static final KEY_HAND_GESTURE:Ljava/lang/String; = "pref_hand_gesture"

.field public static final KEY_JPEG_QUALITY:Ljava/lang/String; = "pref_camera_jpegquality_key"

.field public static final KEY_LENS_DIRTY_DETECT_DATE:Ljava/lang/String; = "pref_lens_dirty_detect_date_key"

.field public static final KEY_LENS_DIRTY_DETECT_ENABLED:Ljava/lang/String; = "pref_lens_dirty_detect_enabled_key"

.field public static final KEY_LENS_DIRTY_DETECT_TIMES:Ljava/lang/String; = "pref_lens_dirty_detect_times_key"

.field public static final KEY_LIVE_ALL_SWITCH_ADD_VALUE:Ljava/lang/String; = "pref_live_all_switch_add_value"

.field public static final KEY_LIVE_BEAUTY_STATUS:Ljava/lang/String; = "pref_live_beauty_status"

.field public static final KEY_LIVE_CONFIG_IS_NEED_RESTORE:Ljava/lang/String; = "pref_live_config_is_need_restore"

.field public static final KEY_LIVE_ENLARGE_EYE_RATIO:Ljava/lang/String; = "key_live_enlarge_eye_ratio"

.field public static final KEY_LIVE_FILTER:Ljava/lang/String; = "key_live_filter"

.field public static final KEY_LIVE_MODULE_CLICKED:Ljava/lang/String; = "pref_live_module_clicked"

.field public static final KEY_LIVE_MUSIC_FIRST_REQUEST_TIME:Ljava/lang/String; = "pref_key_live_music_first_request_time"

.field public static final KEY_LIVE_MUSIC_HINT:Ljava/lang/String; = "pref_live_music_hint_key"

.field public static final KEY_LIVE_MUSIC_PATH:Ljava/lang/String; = "pref_live_music_path_key"

.field public static final KEY_LIVE_RECORD_IS_SELECTED_BGM:Ljava/lang/String; = "pref_key_live_record_is_selected_bgm"

.field public static final KEY_LIVE_SHOT:Ljava/lang/String; = "pref_live_shot_enabled"

.field public static final KEY_LIVE_SHRINK_FACE_RATIO:Ljava/lang/String; = "key_live_shrink_face_ratio"

.field public static final KEY_LIVE_SMOOTH_STRENGTH:Ljava/lang/String; = "key_live_smooth_strength"

.field public static final KEY_LIVE_SPEED:Ljava/lang/String; = "pref_live_speed_key"

.field public static final KEY_LIVE_STICKER:Ljava/lang/String; = "pref_live_sticker_key"

.field public static final KEY_LIVE_STICKER_HINT:Ljava/lang/String; = "pref_live_sticker_hint_key"

.field public static final KEY_LIVE_STICKER_INTERNAL:Ljava/lang/String; = "pref_camera_live_sticker_internal"

.field public static final KEY_LIVE_STICKER_LAST_CACHE_TIME:Ljava/lang/String; = "pref_live_sticker_last_cache_time"

.field public static final KEY_LIVE_STICKER_NAME:Ljava/lang/String; = "pref_live_sticker_name_key"

.field public static final KEY_LOCALWORDS_VERSION:Ljava/lang/String; = "pref_localwords_version"

.field public static final KEY_LONG_PRESS_SHUTTER:Ljava/lang/String; = "pref_camera_long_press_shutter_key"

.field public static final KEY_LONG_PRESS_SHUTTER_FEATURE:Ljava/lang/String; = "pref_camera_long_press_shutter_feature_key"

.field public static final KEY_MENU_ULTRA_PIXEL_PHOTOGRAPHY_FRONT:Ljava/lang/String; = "pref_menu_ultra_pixel_photography_front"

.field public static final KEY_MENU_ULTRA_PIXEL_PHOTOGRAPHY_REAR:Ljava/lang/String; = "pref_menu_ultra_pixel_photography_rear"

.field public static final KEY_MOVIE_SOLID:Ljava/lang/String; = "pref_camera_movie_solid_key"

.field public static final KEY_NORMAL_WIDE_LDC:Ljava/lang/String; = "pref_camera_normal_wide_ldc_key"

.field public static final KEY_OPEN_CAMERA_FAIL:Ljava/lang/String; = "open_camera_fail_key"

.field public static final KEY_PANORAMA_MODE:Ljava/lang/String; = "pref_camera_panoramamode_key"

.field public static final KEY_PANORAMA_MOVE_DIRECTION:Ljava/lang/String; = "pref_panorana_move_direction_key"

.field public static final KEY_PICTURE_SIZE:Ljava/lang/String; = "pref_camera_picturesize_key"

.field public static final KEY_POPUP_TIP_BEAUTY_INTRO_CLICKED:Ljava/lang/String; = "pref_popup_tip_beauty_intro_clicked_key"

.field public static final KEY_POPUP_TIP_BEAUTY_INTRO_SHOW_TIMES:Ljava/lang/String; = "pref_popup_tip_beauty_intro_show_times_key"

.field public static final KEY_POPUP_ULTRA_WIDE_INTRO_SHOW_TIMES:Ljava/lang/String; = "pre_popup_ultra_wide_intro_show_times"

.field public static final KEY_PORTRAIT_LIGHTING:Ljava/lang/String; = "pref_portrait_lighting"

.field public static final KEY_PRIORITY_STORAGE:Ljava/lang/String; = "pref_priority_storage"

.field public static final KEY_QC_CONTRAST:Ljava/lang/String; = "pref_qc_camera_contrast_key"

.field public static final KEY_QC_EXPOSURETIME:Ljava/lang/String; = "pref_qc_camera_exposuretime_key"

.field public static final KEY_QC_FOCUS_MODE_SWITCHING:Ljava/lang/String; = "pref_qc_focus_mode_switching_key"

.field public static final KEY_QC_FOCUS_POSITION:Ljava/lang/String; = "pref_focus_position_key"

.field public static final KEY_QC_ISO:Ljava/lang/String; = "pref_qc_camera_iso_key"

.field public static final KEY_QC_MANUAL_EXPOSURE:Ljava/lang/String; = "pref_qc_camera_manual_exposure_key"

.field public static final KEY_QC_MANUAL_WHITEBALANCE_VALUE:Ljava/lang/String; = "pref_qc_manual_whitebalance_k_value_key"

.field public static final KEY_QC_SATURATION:Ljava/lang/String; = "pref_qc_camera_saturation_key"

.field public static final KEY_QC_SHARPNESS:Ljava/lang/String; = "pref_qc_camera_sharpness_key"

.field public static final KEY_RECORD_LOCATION:Ljava/lang/String; = "pref_camera_recordlocation_key"

.field public static final KEY_REFERENCE_LINE:Ljava/lang/String; = "pref_camera_referenceline_key"

.field public static final KEY_RESTORED_FLASH_MODE:Ljava/lang/String; = "pref_camera_restored_flashmode_key"

.field public static final KEY_RETAIN_CAMERA_MODE:Ljava/lang/String; = "pref_retain_camera_mode_key"

.field public static final KEY_SCAN_QRCODE:Ljava/lang/String; = "pref_scan_qrcode_key"

.field public static final KEY_SCENE_MODE:Ljava/lang/String; = "pref_camera_scenemode_key"

.field public static final KEY_SCENE_MODE_SETTINGS:Ljava/lang/String; = "pref_camera_scenemode_setting_key"

.field public static final KEY_SHADER_COLOR_EFFECT:Ljava/lang/String; = "pref_camera_shader_coloreffect_key"

.field public static final KEY_SHOW_GENDER_AGE:Ljava/lang/String; = "pref_camera_show_gender_age_key"

.field public static final KEY_SMART_SHUTTER_POSITION:Ljava/lang/String; = "pref_key_camera_smart_shutter_position"

.field public static final KEY_STICKER_PATH:Ljava/lang/String; = "pref_sticker_path_key"

.field public static final KEY_TIME_WATERMARK:Ljava/lang/String; = "pref_watermark_key"

.field public static final KEY_TOUCH_AF_AEC:Ljava/lang/String; = "pref_camera_touchafaec_key"

.field public static final KEY_TT_LIVE_MUSIC_JSON_CACHE:Ljava/lang/String; = "pref_key_tt_live_music_json_cache"

.field public static final KEY_TT_LIVE_STICKER_JSON_CACHE:Ljava/lang/String; = "pref_key_tt_live_sticker_json_cache"

.field public static final KEY_UBIFOCUS_KEY:Ljava/lang/String; = "pref_camera_ubifocus_key"

.field public static final KEY_ULTRA_PIXEL_PHOTOGRAPHY:Ljava/lang/String; = "pref_ultra_pixel_photography_enabled"

.field public static final KEY_ULTRA_WIDE_BOKEH:Ljava/lang/String; = "pref_ultra_wide_bokeh_enabled"

.field public static final KEY_ULTRA_WIDE_LDC:Ljava/lang/String; = "pref_camera_ultra_wide_ldc_key"

.field public static final KEY_ULTRA_WIDE_VIDEO_LDC:Ljava/lang/String; = "pref_camera_ultra_wide_video_ldc_key"

.field public static final KEY_USERDEFINE_WATERMARK:Ljava/lang/String; = "user_define_watermark"

.field public static final KEY_VERSION:Ljava/lang/String; = "pref_version_key"

.field public static final KEY_VIDEOCAMERA_FLASH_MODE:Ljava/lang/String; = "pref_camera_video_flashmode_key"

.field public static final KEY_VIDEO_AUTOEXPOSURE:Ljava/lang/String; = "pref_video_autoexposure_key"

.field public static final KEY_VIDEO_BOKEH:Ljava/lang/String; = "pref_video_bokeh_key"

.field public static final KEY_VIDEO_ENCODER:Ljava/lang/String; = "pref_video_encoder_key"

.field public static final KEY_VIDEO_FACE_BEAUTY:Ljava/lang/String; = "pref_video_face_beauty_key"

.field public static final KEY_VIDEO_HDR:Ljava/lang/String; = "pref_video_hdr_key"

.field public static final KEY_VIDEO_HIGH_FRAME_RATE:Ljava/lang/String; = "pref_video_hfr_key"

.field public static final KEY_VIDEO_HSR_60:I = 0x3c

.field public static final KEY_VIDEO_NEW_SLOW_MOTION:Ljava/lang/String; = "pref_video_new_slow_motion_key"

.field public static final KEY_VIDEO_QUALITY:Ljava/lang/String; = "pref_video_quality_key"

.field public static final KEY_VIDEO_QUALITY_EXTRA:Ljava/lang/String; = "pref_video_quality_key_extra"

.field public static final KEY_VIDEO_SPEED:Ljava/lang/String; = "pref_video_speed_key"

.field public static final KEY_VIDEO_SPEED_FAST:Ljava/lang/String; = "pref_video_speed_fast_key"

.field public static final KEY_VIDEO_SPEED_HFR:Ljava/lang/String; = "pref_video_speed_hfr_key"

.field public static final KEY_VIDEO_SPEED_SLOW:Ljava/lang/String; = "pref_video_speed_slow_key"

.field public static final KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL:Ljava/lang/String; = "pref_video_time_lapse_frame_interval_key"

.field public static final KEY_VOLUME_CAMERA_FUNCTION:Ljava/lang/String; = "pref_camera_volumekey_function_key"

.field public static final KEY_VOLUME_LIVE_FUNCTION:Ljava/lang/String; = "pref_live_volumekey_function_key"

.field public static final KEY_VOLUME_VIDEO_FUNCTION:Ljava/lang/String; = "pref_video_volumekey_function_key"

.field public static final KEY_WHITE_BALANCE:Ljava/lang/String; = "pref_camera_whitebalance_key"

.field public static final KEY_ZOOM:Ljava/lang/String; = "pref_camera_zoom_key"

.field public static final LIVE_SPEED_DEFAULT:I = 0x2

.field private static final MAX_PREVIEW_FPS_TIMES_1000:I = 0x61a80

.field private static final PREFERRED_PREVIEW_FPS_TIMES_1000:I = 0x7530

.field public static final PROP_AUTO_ZOOM:Ljava/lang/String; = "camera.autozoom.enable"

.field public static final QRCODE_RECEIVER_PACKAGE:Ljava/lang/String; = "com.xiaomi.scanner"

.field public static final QUALITY_MTK_FINE:I = 0xb

.field public static final QUALITY_MTK_HIGH:I = 0xa

.field public static final QUALITY_MTK_MEDIUM:I = 0x9

.field public static final REMIND_SUFFIX:Ljava/lang/String; = "_remind"

.field public static final SIZE_FPS_1080_240:Ljava/lang/String; = "1920x1080:240"

.field public static final SURFACE_LEFT_MARGIN_MDP_QUALITY_480P:I

.field public static final SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW:I

.field private static final TAG:Ljava/lang/String; = "CameraSettings"

.field public static final TOP_CONTROL_HEIGHT:I

.field public static final UI_STYLE_16_9:I = 0x1

.field public static final UI_STYLE_3_2:I = 0x2

.field public static final UI_STYLE_4_3:I = 0x0

.field public static final UI_STYLE_ERROR:I = -0x1

.field public static final UI_STYLE_FULL_SCREEN:I = 0x3

.field public static final VIDEO_MODE_120:Ljava/lang/String; = "fps120"

.field public static final VIDEO_MODE_240:Ljava/lang/String; = "fps240"

.field public static final VIDEO_MODE_960:Ljava/lang/String; = "fps960"

.field public static final VIDEO_MODE_FUN:Ljava/lang/String; = "fun"

.field public static final VIDEO_SPEED_FAST:Ljava/lang/String; = "fast"

.field public static final VIDEO_SPEED_HFR:Ljava/lang/String; = "hfr"

.field public static final VIDEO_SPEED_NORMAL:Ljava/lang/String; = "normal"

.field public static final VIDEO_SPEED_SLOW:Ljava/lang/String; = "slow"

.field public static final ZOOM_DEFAULT_VALUE:Ljava/lang/String; = "1"

.field public static final sCameraChangeManager:Lcom/android/camera/ChangeManager;

.field public static sCroppedIfNeeded:Z

.field private static sEdgePhotoEnable:Z

.field private static sFaceBeautyLevelToValue:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sGoolgeLensAvilability:Z

.field public static final sLiveSpeedTextList:[I

.field public static sRemindMode:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sSceneToFlash:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 314
    sget-object v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFNumberAdapter;->F_NUMBERS:[Ljava/lang/String;

    const/16 v1, 0xd

    aget-object v0, v0, v1

    sput-object v0, Lcom/android/camera/CameraSettings;->F_NUMBER_DEFAULT_VALUE:Ljava/lang/String;

    .line 366
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/CameraSettings;->sCroppedIfNeeded:Z

    .line 367
    sput-boolean v0, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    .line 369
    sput-boolean v0, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    .line 376
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 377
    const v2, 0x7f0a001e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sput v1, Lcom/android/camera/CameraSettings;->TOP_CONTROL_HEIGHT:I

    .line 379
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 380
    const v2, 0x7f0a0050

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sput v1, Lcom/android/camera/CameraSettings;->SURFACE_LEFT_MARGIN_MDP_QUALITY_480P:I

    .line 381
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 382
    const v2, 0x7f0a0051

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sput v1, Lcom/android/camera/CameraSettings;->SURFACE_LEFT_MARGIN_MDP_QUALITY_LOW:I

    .line 383
    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sput-object v1, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    .line 384
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    sput-object v1, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    .line 385
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    .line 388
    const/4 v1, 0x5

    new-array v2, v1, [I

    fill-array-data v2, :array_0

    sput-object v2, Lcom/android/camera/CameraSettings;->sLiveSpeedTextList:[I

    .line 397
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "0"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "3"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "4"

    const-string v5, "0"

    invoke-virtual {v2, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "13"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "5"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "6"

    const-string v4, "1"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "8"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "9"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "10"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "12"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "backlight"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    sget-object v2, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    const-string v3, "flowers"

    const-string v4, "0"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    sget-object v2, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string v3, "pref_camera_mode_settings_key"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 411
    sget-object v2, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string v3, "pref_camera_magic_mirror_key"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 412
    invoke-static {}, Lcom/mi/config/b;->hy()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 413
    sget-object v2, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    const-string v3, "pref_camera_groupshot_mode_key"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_1

    .line 417
    sget-object v1, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 418
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_LOW:Ljava/lang/String;

    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 419
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 420
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 423
    :cond_1
    sget-object v2, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v6, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v2, v0, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 424
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_MEDIUM:Ljava/lang/String;

    invoke-virtual {v0, v5, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 425
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_HIGH:Ljava/lang/String;

    invoke-virtual {v0, v4, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 426
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XHIGH:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 427
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    const/4 v2, 0x4

    sget-object v3, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXHIGH:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 428
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_XXXHIGH:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1093
    :goto_0
    new-instance v0, Lcom/android/camera/ChangeManager;

    invoke-direct {v0}, Lcom/android/camera/ChangeManager;-><init>()V

    sput-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    return-void

    :array_0
    .array-data 4
        0x7f09022a
        0x7f09022b
        0x7f09022c
        0x7f09022d
        0x7f09022e
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addExtraHeight(Landroid/content/Context;I)I
    .locals 3

    .line 1270
    sget-boolean v0, Lcom/mi/config/b;->qR:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1271
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "can_nav_bar_hide"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1273
    invoke-static {p0}, Lcom/android/camera/Util;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result p0

    add-int/2addr p1, p0

    .line 1275
    :cond_0
    return p1
.end method

.method public static addLensDirtyDetectedTimes()V
    .locals 9

    .line 2243
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2244
    const-string v1, "pref_lens_dirty_detect_enabled_key"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 2247
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 2248
    invoke-virtual {v1, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 2249
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 2250
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v6

    const-string v7, "pref_lens_dirty_detect_date_key"

    invoke-virtual {v6, v7, v3, v4}, Lcom/android/camera/data/data/config/DataItemConfig;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 2252
    nop

    .line 2253
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v7

    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    move-result v8

    if-ne v7, v8, :cond_0

    .line 2254
    const/4 v7, 0x2

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-virtual {v5, v7}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-ne v8, v7, :cond_0

    .line 2255
    const/4 v7, 0x5

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v5, v7}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ne v1, v5, :cond_0

    .line 2256
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v5, "pref_lens_dirty_detect_times_key"

    invoke-virtual {v1, v5, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 2258
    add-int/2addr v6, v1

    .line 2260
    :cond_0
    const-string v1, "pref_lens_dirty_detect_times_key"

    invoke-interface {v0, v1, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2261
    const-string v1, "pref_lens_dirty_detect_date_key"

    invoke-interface {v0, v1, v3, v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2262
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2263
    const-string v0, "CameraSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "add lens dirty detected times: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2264
    return-void
.end method

.method public static addPopupTipBeautyIntroShowTimes()V
    .locals 3

    .line 2185
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_popup_tip_beauty_intro_show_times_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2186
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string v2, "pref_popup_tip_beauty_intro_show_times_key"

    add-int/lit8 v0, v0, 0x1

    invoke-interface {v1, v2, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2187
    return-void
.end method

.method public static addPopupUltraWideIntroShowTimes()V
    .locals 3

    .line 2744
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pre_popup_ultra_wide_intro_show_times"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2745
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    const-string v2, "pre_popup_ultra_wide_intro_show_times"

    add-int/lit8 v0, v0, 0x1

    invoke-interface {v1, v2, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2746
    return-void
.end method

.method public static beautyLevelToIntelligentValue(I)Ljava/lang/String;
    .locals 3

    .line 1738
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1739
    if-nez v0, :cond_0

    .line 1740
    const-string v0, "CameraSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid faceBeautyLevel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1741
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    .line 1743
    :cond_0
    return-object v0
.end method

.method public static cancelRemind(Ljava/lang/String;)V
    .locals 2

    .line 1982
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isNeedRemind(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1983
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1984
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_remind"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1985
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1987
    :cond_0
    return-void
.end method

.method public static checkLensAvailability(Landroid/content/Context;)Z
    .locals 5

    .line 1241
    invoke-static {}, Lcom/android/camera/Util;->isGlobalVersion()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 1242
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fj()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.xiaomi.lens"

    .line 1243
    invoke-static {p0, v0}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1242
    move v1, v2

    goto :goto_0

    .line 1243
    :cond_0
    nop

    .line 1242
    :goto_0
    return v1

    .line 1245
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v3, "pref_camera_ai_detect_enable_key"

    const v4, 0x7f0f0012

    .line 1246
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    .line 1245
    invoke-virtual {v0, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1247
    if-eqz v0, :cond_2

    const-string v0, "com.google.ar.lens"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    sget-boolean p0, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    if-eqz p0, :cond_2

    move v1, v2

    nop

    :cond_2
    return v1
.end method

.method private static deleteObsoletePreferences()V
    .locals 12

    .line 868
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 869
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    .line 870
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/data/data/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/shared_prefs"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 871
    sget-object v2, Lcom/android/camera/module/BaseModule;->CAMERA_MODES:[I

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_2

    aget v6, v2, v5

    .line 872
    if-eqz v6, :cond_1

    .line 873
    array-length v7, v1

    move v8, v4

    :goto_1
    if-ge v8, v7, :cond_1

    aget v9, v1, v8

    .line 874
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "camera_settings_simple_mode_local_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 876
    invoke-static {v9, v6}, Lcom/android/camera/module/BaseModule;->getPreferencesLocalId(II)I

    move-result v9

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 877
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ".xml"

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v10, v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 878
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 879
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 873
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 871
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 885
    :cond_2
    new-instance v1, Ljava/io/File;

    const-string v2, "camera_settings_simple_mode_global.xml"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 886
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 887
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 889
    :cond_3
    return-void

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method private static filterPreference(Ljava/util/Map;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/lang/String;",
            "Landroid/content/SharedPreferences$Editor;",
            "I)V"
        }
    .end annotation

    .line 1319
    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p3, :cond_0

    .line 1320
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 1321
    if-eqz p0, :cond_0

    invoke-static {p0, p3}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result p0

    if-nez p0, :cond_0

    .line 1322
    invoke-interface {p2, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1325
    :cond_0
    return-void
.end method

.method public static get4kProfile()I
    .locals 1

    .line 967
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result v0

    if-nez v0, :cond_0

    .line 968
    const/4 v0, -0x1

    return v0

    .line 970
    :cond_0
    const v0, 0x7f090023

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getAiSceneOpen()Z
    .locals 3

    .line 1172
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fb()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1173
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1174
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fc()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1175
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_ai_scene_mode_key"

    .line 1176
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mi/config/a;->eW()Z

    move-result v2

    .line 1175
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 1172
    :goto_0
    return v0
.end method

.method public static getAntiBanding()Ljava/lang/String;
    .locals 3

    .line 2148
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_antibanding_key"

    .line 2150
    const v2, 0x7f0900bb

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v2

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2148
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAspectRatio(II)I
    .locals 1

    .line 549
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isNearRatio16_9(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 550
    const/4 p0, 0x1

    return p0

    .line 551
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isNearRatio18_9(II)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 552
    const/4 p0, 0x3

    return p0

    .line 554
    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static getBeautifyDefaultValue(Ljava/lang/String;)I
    .locals 2

    .line 1763
    nop

    .line 1764
    const-string v0, "pref_beautify_skin_color_ratio_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1765
    const p0, 0x7f0901aa

    goto :goto_0

    .line 1766
    :cond_0
    const-string v0, "pref_beautify_slim_face_ratio_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1767
    const p0, 0x7f0901ab

    goto :goto_0

    .line 1768
    :cond_1
    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1769
    const p0, 0x7f0901ad

    goto :goto_0

    .line 1770
    :cond_2
    const-string v0, "pref_beautify_enlarge_eye_ratio_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 1771
    const p0, 0x7f0901ac

    goto :goto_0

    .line 1774
    :cond_3
    move p0, v1

    :goto_0
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getBeautifyDetailValue(Ljava/lang/String;II)I
    .locals 1

    .line 1778
    nop

    .line 1779
    invoke-static {}, Lcom/mi/config/b;->gg()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1780
    const/4 v0, -0x1

    invoke-static {p0, v0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v0

    .line 1781
    if-gez v0, :cond_0

    .line 1782
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result p0

    goto :goto_0

    .line 1784
    :cond_0
    sub-int/2addr p2, p1

    .line 1785
    mul-int/2addr p2, v0

    add-int/lit8 p2, p2, 0x32

    div-int/lit8 p2, p2, 0x64

    add-int p0, p2, p1

    goto :goto_0

    .line 1788
    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static getBeautifyValueRange()[I
    .locals 2

    .line 1792
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 1793
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    return-object v0

    .line 1794
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->gr()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1795
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    return-object v0

    .line 1797
    :cond_1
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    return-object v0

    nop

    :array_0
    .array-data 4
        -0xc
        0xc
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x7
    .end array-data

    :array_2
    .array-data 4
        0x0
        0xa
    .end array-data
.end method

.method public static getBeautyShowLevel()I
    .locals 1

    .line 2534
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 2535
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->intelligentValueToBeautyLevel(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getBogusCameraId()I
    .locals 1

    .line 896
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    return v0
.end method

.method public static getBool(I)Z
    .locals 1

    .line 792
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method public static getBroadcastKillServiceTime()J
    .locals 4

    .line 2210
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_broadcast_kill_service_key"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCameraId()I
    .locals 3

    .line 901
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    .line 902
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 903
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v2

    .line 901
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getActualOpenCameraId(II)I

    move-result v0

    return v0
.end method

.method public static getCameraId(I)I
    .locals 2

    .line 908
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    .line 909
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    .line 908
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getActualOpenCameraId(II)I

    move-result p0

    return p0
.end method

.method public static getCameraZoomMode(I)Ljava/lang/String;
    .locals 1

    .line 2004
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 2005
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyDualLens()Lcom/android/camera/data/data/config/ComponentManuallyDualLens;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->getComponentValue(I)Ljava/lang/String;

    move-result-object p0

    .line 2004
    return-object p0
.end method

.method public static getColorEffect()Ljava/lang/String;
    .locals 3

    .line 1412
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_coloreffect_key"

    .line 1414
    const v2, 0x7f090067

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1412
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getContrast()Ljava/lang/String;
    .locals 5

    .line 2112
    const v0, 0x7f090096

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2113
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_qc_camera_contrast_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2114
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const v2, 0x7f0e0015

    .line 2115
    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2116
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reset invalid contrast "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2117
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetContrast()V

    .line 2118
    goto :goto_0

    .line 2120
    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method public static getCountDownTimes()I
    .locals 1

    .line 1627
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningTimer()Lcom/android/camera/data/data/runing/ComponentRunningTimer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningTimer;->getTimer()I

    move-result v0

    return v0
.end method

.method public static getCurrentLiveMusic()[Ljava/lang/String;
    .locals 4

    .line 2619
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    .line 2620
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v1

    const-string v2, "pref_live_music_path_key"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 2621
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v1

    const-string v2, "pref_live_music_hint_key"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 2622
    return-object v0
.end method

.method public static getCurrentLiveSpeed()Ljava/lang/String;
    .locals 3

    .line 2647
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_speed_key"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentLiveSpeedText()Ljava/lang/String;
    .locals 2

    .line 2651
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSpeed()Ljava/lang/String;

    move-result-object v0

    .line 2652
    sget-object v1, Lcom/android/camera/CameraSettings;->sLiveSpeedTextList:[I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aget v0, v1, v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentLiveSticker()Ljava/lang/String;
    .locals 3

    .line 2602
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_sticker_key"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentLiveStickerHint()Ljava/lang/String;
    .locals 3

    .line 2610
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_sticker_hint_key"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentLiveStickerName()Ljava/lang/String;
    .locals 3

    .line 2606
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_sticker_name_key"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCustomWB()I
    .locals 3

    .line 1437
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10000a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 1439
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v2, "pref_qc_manual_whitebalance_k_value_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getCustomWatermark()Ljava/lang/String;
    .locals 3

    .line 2554
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_custom_watermark"

    const v2, 0x7f090288

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultPreferenceId(I)I
    .locals 1

    .line 1121
    const v0, 0x7f090020

    if-eq p0, v0, :cond_3

    const v0, 0x7f0900bb

    if-eq p0, v0, :cond_2

    const v0, 0x7f0f0003

    if-eq p0, v0, :cond_0

    goto :goto_0

    .line 1135
    :cond_0
    sget-boolean v0, Lcom/mi/config/b;->qh:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->qi:Z

    if-eqz v0, :cond_4

    .line 1136
    :cond_1
    const p0, 0x7f0f0004

    return p0

    .line 1123
    :cond_2
    invoke-static {}, Lcom/android/camera/Util;->isAntibanding60()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1124
    const p0, 0x7f0900be

    return p0

    .line 1129
    :cond_3
    invoke-static {}, Lcom/mi/config/b;->gL()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1130
    const p0, 0x7f090021

    return p0

    .line 1141
    :cond_4
    :goto_0
    return p0
.end method

.method private static getDefaultRatio(Ljava/lang/String;Z)I
    .locals 3

    .line 2322
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 2323
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBeautifyValueRange()[I

    move-result-object p1

    .line 2324
    if-eqz p1, :cond_2

    array-length v1, p1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 2327
    :cond_0
    const/4 v1, 0x1

    aget v1, p1, v1

    aget v2, p1, v0

    sub-int/2addr v1, v2

    .line 2328
    if-nez v1, :cond_1

    .line 2329
    return v0

    .line 2331
    :cond_1
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getBeautifyDefaultValue(Ljava/lang/String;)I

    move-result p0

    .line 2332
    const/16 v2, 0x64

    aget p1, p1, v0

    sub-int/2addr p0, p1

    mul-int/2addr v2, p0

    div-int/2addr v2, v1

    return v2

    .line 2325
    :cond_2
    :goto_0
    return v0

    .line 2334
    :cond_3
    return v0
.end method

.method public static getDefaultWatermarkStr()Ljava/lang/String;
    .locals 1

    .line 2559
    const v0, 0x7f090288

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getDualCameraWaterMarkFilePathVendor()Ljava/lang/String;
    .locals 2

    .line 2471
    sget-boolean v0, Lcom/mi/config/b;->qO:Z

    if-eqz v0, :cond_0

    .line 2472
    const-string v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2474
    const-string v1, "india"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2475
    const-string v0, "/vendor/etc/camera/dualcamera_india.png"

    return-object v0

    .line 2478
    :cond_0
    const-string v0, "/vendor/etc/camera/dualcamera.png"

    return-object v0
.end method

.method public static getExposureMeteringMode()I
    .locals 3

    .line 767
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v0

    const/16 v1, 0xac

    if-eq v0, v1, :cond_0

    const/16 v1, 0xae

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    .line 769
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_autoexposure_key"

    const v2, 0x7f09010b

    .line 771
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 769
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 772
    goto :goto_0

    .line 781
    :cond_0
    :pswitch_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_video_autoexposure_key"

    const v2, 0x7f09010c

    .line 783
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 781
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 787
    :goto_0
    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getEyeLightType()Ljava/lang/String;
    .locals 3

    .line 2394
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFaceBeautyOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUseAdvanceBeauty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2395
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_eye_light_type_key"

    const-string v2, "-1"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2397
    :cond_0
    const-string v0, "-1"

    return-object v0
.end method

.method public static getFaceBeautifyValue()Ljava/lang/String;
    .locals 5

    .line 1692
    invoke-static {}, Lcom/mi/config/b;->gg()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1693
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1694
    const-string v0, "pref_camera_face_beauty_advanced_key"

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautySwitch()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1695
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    return-object v0

    .line 1698
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeauty()Lcom/android/camera/data/data/config/ComponentConfigBeauty;

    move-result-object v0

    .line 1699
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentConfigBeauty;->getDefaultValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1700
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    .line 1701
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1708
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->isFaceBeautyValid(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1709
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reset invalid face beauty value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1710
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1711
    goto :goto_0

    .line 1727
    :cond_1
    move-object v0, v1

    :goto_0
    return-object v0

    .line 1730
    :cond_2
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    return-object v0
.end method

.method public static getFaceBeautyCloseValue()Ljava/lang/String;
    .locals 1

    .line 1734
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    return-object v0
.end method

.method private static getFaceBeautyKey()Ljava/lang/String;
    .locals 1

    .line 1651
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1654
    :cond_0
    const-string v0, "pref_camera_face_beauty_key"

    return-object v0

    .line 1652
    :cond_1
    :goto_0
    const-string v0, "pref_video_face_beauty_key"

    return-object v0
.end method

.method public static getFaceBeautyRatio(Ljava/lang/String;I)I
    .locals 1

    .line 1671
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isLiveBeautyModeKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1672
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    .line 1674
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method private static getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1658
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1661
    :cond_0
    return-object p0

    .line 1659
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_video"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFaceBeautySwitch()Ljava/lang/String;
    .locals 3

    .line 1636
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1637
    const-string v1, "pref_camera_face_beauty_switch_key"

    const-string v2, "pref_camera_face_beauty_key"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1638
    invoke-static {}, Lcom/mi/config/b;->hG()Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "pref_camera_face_beauty_advanced_key"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1639
    const-string v1, "CameraSettings"

    const-string v2, "reset beauty switch"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1640
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_face_beauty_switch_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1641
    const-string v1, "pref_camera_face_beauty_key"

    .line 1643
    :cond_0
    return-object v1
.end method

.method public static getFlashMode(I)Ljava/lang/String;
    .locals 1

    .line 1601
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->getComponentValue(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFlashModeByScene(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1609
    sget-object v0, Lcom/android/camera/CameraSettings;->sSceneToFlash:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static getFocusMode()Ljava/lang/String;
    .locals 1

    .line 1464
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1465
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1467
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isVideoModule()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isFunModule()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1470
    :cond_1
    const v0, 0x7f09005e

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1468
    :cond_2
    :goto_0
    const v0, 0x7f09005d

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFocusPosition()I
    .locals 2

    .line 1528
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    .line 1529
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getManuallyFocus()Lcom/android/camera/data/data/config/ComponentManuallyFocus;

    move-result-object v0

    const/16 v1, 0xa7

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1527
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getHfrSetting()Ljava/lang/String;
    .locals 3

    .line 676
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_video_hfr_key"

    .line 677
    const v2, 0x7f090034

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 676
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getItemBeautyValue(ZLjava/lang/String;)I
    .locals 1

    .line 2386
    const/4 v0, 0x0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, v0}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result p0

    invoke-static {p1, p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v0

    :goto_0
    return v0
.end method

.method public static getJpegQuality(Z)Ljava/lang/String;
    .locals 3

    .line 1948
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_jpegquality_key"

    .line 1949
    const v2, 0x7f09004e

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1948
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1950
    const-string v1, "high"

    .line 1951
    if-eqz p0, :cond_0

    .line 1952
    const-string v1, "normal"

    .line 1954
    :cond_0
    invoke-static {v0}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result p0

    .line 1955
    invoke-static {v1}, Lcom/android/camera/JpegEncodingQualityMappings;->getQualityNumber(Ljava/lang/String;)I

    move-result v2

    if-ge p0, v2, :cond_1

    .line 1956
    return-object v0

    .line 1958
    :cond_1
    return-object v1
.end method

.method public static getKeyCloudSenstiveWordsPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 2570
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://file.market.xiaomi.com/download/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/sensi_words.txt"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2571
    return-object p0
.end method

.method public static getLiveAllSwitchAllValue()I
    .locals 3

    .line 2629
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_all_switch_add_value"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getLiveStickerLastCacheTime()J
    .locals 4

    .line 2730
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_live_sticker_last_cache_time"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLocalWordsVersion()I
    .locals 3

    .line 2575
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_localwords_version"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getManualFocusName(Landroid/content/Context;I)Ljava/lang/String;
    .locals 4

    .line 1533
    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_0

    .line 1534
    const p1, 0x7f090054

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1535
    :cond_0
    int-to-double v0, p1

    const-wide v2, 0x4082c00000000000L    # 600.0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_1

    .line 1536
    const p1, 0x7f090057

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1537
    :cond_1
    const-wide/high16 v2, 0x4069000000000000L    # 200.0

    cmpl-double p1, v0, v2

    if-ltz p1, :cond_2

    .line 1538
    const p1, 0x7f090055

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1540
    :cond_2
    const p1, 0x7f090056

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMappingFocusMode(I)Ljava/lang/String;
    .locals 1

    .line 1459
    const/16 v0, 0x3e8

    if-ne p0, v0, :cond_0

    .line 1460
    const-string p0, "continuous-picture"

    goto :goto_0

    :cond_0
    const-string p0, "manual"

    .line 1459
    :goto_0
    return-object p0
.end method

.method public static getMaxPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I
    .locals 1

    .line 1802
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object p0

    .line 1803
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1805
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    .line 1807
    :cond_0
    const/4 p0, 0x0

    new-array p0, p0, [I

    return-object p0
.end method

.method public static getMiuiSettingsKeyForStreetSnap(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1990
    const v0, 0x7f09018a

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1991
    const-string p0, "Street-snap-picture"

    return-object p0

    .line 1992
    :cond_0
    const v0, 0x7f09018b

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 1993
    const-string p0, "Street-snap-movie"

    return-object p0

    .line 1995
    :cond_1
    const-string p0, "none"

    return-object p0
.end method

.method public static getNewSlowMotionIQ()I
    .locals 3

    .line 681
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_video_new_slow_motion_key"

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 682
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getPanoramaMoveDirection()I
    .locals 3

    .line 2462
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_panorana_move_direction_key"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getPhotoPreviewFpsRange(Landroid/hardware/Camera$Parameters;)[I
    .locals 9

    .line 1831
    invoke-virtual {p0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object p0

    .line 1832
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 1838
    :cond_0
    const v1, 0x61a80

    .line 1839
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 1840
    aget v5, v3, v5

    .line 1841
    aget v3, v3, v4

    .line 1842
    const/16 v4, 0x7530

    if-lt v3, v4, :cond_1

    if-gt v5, v4, :cond_1

    if-ge v5, v1, :cond_1

    .line 1845
    nop

    .line 1847
    move v1, v5

    :cond_1
    goto :goto_0

    .line 1851
    :cond_2
    const/4 v2, -0x1

    .line 1852
    nop

    .line 1853
    move v3, v2

    move v2, v5

    move v6, v2

    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_4

    .line 1854
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    .line 1855
    aget v8, v7, v5

    .line 1856
    aget v7, v7, v4

    .line 1857
    if-ne v8, v1, :cond_3

    if-ge v6, v7, :cond_3

    .line 1858
    nop

    .line 1859
    nop

    .line 1853
    move v3, v2

    move v6, v7

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1863
    :cond_4
    if-ltz v3, :cond_5

    .line 1864
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    .line 1866
    :cond_5
    const-string p0, "CameraSettings"

    const-string v1, "Can\'t find an appropriate frame rate range!"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1867
    return-object v0

    .line 1833
    :cond_6
    :goto_2
    const-string p0, "CameraSettings"

    const-string v1, "No supported frame rates returned!"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1834
    return-object v0
.end method

.method public static getPictureSizeRatioString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 444
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSquareModule()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 445
    const-string p0, "size"

    const-string v0, "#1: getPictureSize ratio return 4x3"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    const-string p0, "4x3"

    return-object p0

    .line 449
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPortraitModule()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fz()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 450
    const-string p0, "size"

    const-string v0, "#2: getPictureSize ratio return 4x3"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    const-string p0, "4x3"

    return-object p0

    .line 453
    :cond_1
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 454
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isUltraPixelPhotographyOn()Z

    move-result v0

    if-nez v0, :cond_3

    .line 455
    :cond_2
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRearMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 456
    :cond_3
    const-string p0, "size"

    const-string v0, "#3: getPictureSize ratio return 4x3"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    const-string p0, "4x3"

    return-object p0

    .line 460
    :cond_4
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 461
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontMenuUltraPixelPhotographyOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 462
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 463
    const-string p0, "size"

    const-string v0, "#4: getPictureSize ratio return 4x3"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    const-string p0, "4x3"

    return-object p0

    .line 466
    :cond_5
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_picturesize_key"

    .line 467
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 466
    return-object p0
.end method

.method public static getPortraitLightingPattern()I
    .locals 2

    .line 1631
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 1632
    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object v0

    const/16 v1, 0xab

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    .line 1631
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getPreferVideoQuality(I)I
    .locals 7

    .line 708
    nop

    .line 709
    const v0, 0x7f090020

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getDefaultPreferenceId(I)I

    move-result v0

    .line 708
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 711
    nop

    .line 712
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v2, "pref_video_quality_key"

    invoke-virtual {v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->contains(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    .line 714
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v3, "pref_video_quality_key"

    invoke-virtual {v1, v3, v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 716
    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 717
    nop

    .line 718
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    .line 719
    const/4 v5, 0x0

    if-lez v3, :cond_1

    .line 720
    const/4 v6, 0x0

    invoke-virtual {v1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 721
    add-int/2addr v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 722
    const/16 v2, 0xf00

    const/16 v3, 0x870

    invoke-static {v2, v3, p0}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result v2

    if-nez v2, :cond_0

    const/16 v2, 0x780

    const/16 v3, 0x438

    .line 723
    invoke-static {v2, v3, p0}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result p0

    if-nez p0, :cond_0

    .line 724
    const-string p0, "CameraSettings"

    const-string v1, "getPreferVideoQuality: do not support 60fps"

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    const-string p0, "pref_video_quality_key"

    invoke-interface {v4, p0, v6}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 726
    goto :goto_0

    .line 729
    :cond_0
    move-object v5, v1

    goto :goto_0

    :cond_1
    move-object v6, v1

    :goto_0
    const-string p0, "pref_camera_hsr_value_key"

    invoke-interface {v4, p0, v5}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 730
    invoke-interface {v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 732
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    const p0, 0x7f0e0003

    .line 733
    invoke-static {v6, p0}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result p0

    if-nez p0, :cond_2

    .line 734
    const-string p0, "CameraSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reset invalid video quality "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    nop

    .line 736
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    .line 737
    const-string v1, "pref_video_quality_key"

    invoke-interface {p0, v1, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 738
    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    goto :goto_1

    .line 740
    :cond_2
    move-object v0, v6

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    .line 741
    goto :goto_2

    .line 742
    :cond_3
    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result p0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result p0

    if-nez p0, :cond_4

    .line 743
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 746
    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    .line 747
    const-string v1, "pref_video_quality_key"

    invoke-interface {p0, v1, v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 748
    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 749
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    .line 751
    :goto_2
    return p0
.end method

.method public static getPreviewAspectRatio(II)F
    .locals 8

    .line 522
    nop

    .line 523
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    const-wide p0, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double p0, v0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v2, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double v2, v0, v2

    .line 524
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpl-double p0, p0, v4

    if-lez p0, :cond_2

    .line 525
    const-wide/high16 p0, 0x4000000000000000L    # 2.0

    sub-double p0, v0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x4001555555555555L    # 2.1666666666666665

    sub-double/2addr v0, v6

    .line 526
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    cmpl-double v0, v4, v0

    if-lez v0, :cond_0

    .line 527
    const p0, 0x400aaaab

    goto :goto_0

    .line 528
    :cond_0
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    .line 529
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    cmpl-double p0, v0, p0

    if-lez p0, :cond_1

    .line 530
    const/high16 p0, 0x40000000    # 2.0f

    goto :goto_0

    .line 532
    :cond_1
    const p0, 0x3fe38e39

    goto :goto_0

    .line 535
    :cond_2
    const p0, 0x3faaaaab

    .line 537
    :goto_0
    return p0
.end method

.method public static getPriorityStoragePreference()Z
    .locals 3

    .line 1817
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_priority_storage"

    .line 1818
    const/high16 v2, 0x7f0f0000

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 1817
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getRenderAspectRatio(II)I
    .locals 0

    .line 544
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result p0

    return p0
.end method

.method public static getResourceFloat(IF)F
    .locals 3

    .line 800
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 801
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 803
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 804
    invoke-virtual {v1}, Landroid/util/TypedValue;->getFloat()F

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 805
    :catch_0
    move-exception v0

    .line 806
    const-string v0, "CameraSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missing resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 807
    return p1
.end method

.method public static getRestoredFlashMode()Ljava/lang/String;
    .locals 3

    .line 1623
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_restored_flashmode_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSaturation()Ljava/lang/String;
    .locals 5

    .line 2100
    const v0, 0x7f090098

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2101
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_qc_camera_saturation_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2102
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const v2, 0x7f0e0017

    .line 2103
    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2104
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reset invalid saturation "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2105
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetSaturation()V

    .line 2106
    goto :goto_0

    .line 2108
    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method public static getShaderEffect()I
    .locals 5

    .line 1519
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 1521
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v1

    .line 1522
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getShaderEffect: mode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1523
    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/android/camera/effect/FilterInfo;->FILTER_ID_NONE:I

    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getSharpness()Ljava/lang/String;
    .locals 5

    .line 2124
    const v0, 0x7f09009a

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2125
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_qc_camera_sharpness_key"

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2126
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const v2, 0x7f0e0019

    .line 2127
    invoke-static {v1, v2}, Lcom/android/camera/Util;->isStringValueContained(Ljava/lang/Object;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2128
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reset invalid sharpness "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2129
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetSharpness()V

    .line 2130
    goto :goto_0

    .line 2132
    :cond_0
    move-object v0, v1

    :goto_0
    return-object v0
.end method

.method public static getSkinBeautifyHumanReadableValue(Landroid/content/Context;Lcom/android/camera/preferences/ListPreference;)Ljava/lang/String;
    .locals 2

    .line 1545
    invoke-virtual {p1}, Lcom/android/camera/preferences/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/preferences/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 1546
    invoke-virtual {p1}, Lcom/android/camera/preferences/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object p1

    array-length p1, p1

    .line 1547
    mul-int/lit8 v1, p1, 0x2

    div-int/lit8 v1, v1, 0x3

    if-le v0, v1, :cond_0

    .line 1548
    const p1, 0x7f0901a8

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1549
    :cond_0
    div-int/lit8 p1, p1, 0x3

    if-le v0, p1, :cond_1

    .line 1550
    const p1, 0x7f0901a7

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1551
    :cond_1
    if-lez v0, :cond_2

    .line 1552
    const p1, 0x7f0901a6

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1554
    :cond_2
    const p1, 0x7f0901a9

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSkipFrameNumber()I
    .locals 2

    .line 701
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 702
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100006

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    return v0

    .line 704
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static getSmartShutterPosition()Ljava/lang/String;
    .locals 3

    .line 1449
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_key_camera_smart_shutter_position"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStereoDofLevel()Ljava/lang/String;
    .locals 3

    .line 2154
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_stereo_key"

    .line 2156
    const v2, 0x7f090192

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2154
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStrictAspectRatio(II)I
    .locals 1

    .line 611
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio16_9(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 612
    const/4 p0, 0x1

    return p0

    .line 613
    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio4_3(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 614
    const/4 p0, 0x0

    return p0

    .line 615
    :cond_1
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->isAspectRatio1_1(II)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 616
    const/4 p0, 0x2

    return p0

    .line 620
    :cond_2
    const/4 p0, -0x1

    return p0
.end method

.method public static getString(I)Ljava/lang/String;
    .locals 1

    .line 796
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSupportedHfrSettings(I)Ljava/util/ArrayList;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1070
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1071
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p0

    .line 1072
    if-nez p0, :cond_0

    .line 1074
    return-object v0

    .line 1076
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoSize()[Landroid/util/Size;

    move-result-object v1

    .line 1077
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_4

    aget-object v5, v1, v4

    .line 1078
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v6

    const/16 v7, 0x780

    if-eq v6, v7, :cond_1

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v6

    const/16 v7, 0x500

    if-eq v6, v7, :cond_1

    .line 1079
    goto :goto_2

    .line 1081
    :cond_1
    invoke-virtual {p0, v5}, Lcom/android/camera2/CameraCapabilities;->getSupportedHighSpeedVideoFPSRange(Landroid/util/Size;)[Landroid/util/Range;

    move-result-object v6

    .line 1082
    array-length v7, v6

    move v8, v3

    :goto_1
    if-ge v8, v7, :cond_3

    aget-object v9, v6, v8

    .line 1083
    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v11, "%dx%d:%d"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    .line 1084
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v3

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x1

    aput-object v13, v12, v14

    const/4 v13, 0x2

    invoke-virtual {v9}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v9

    aput-object v9, v12, v13

    .line 1083
    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1085
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 1086
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1082
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1077
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1090
    :cond_4
    return-object v0
.end method

.method public static getSupportedVideoQuality(I)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 981
    invoke-static {}, Lcom/android/camera/CameraSettings;->getBogusCameraId()I

    move-result v0

    .line 982
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 983
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getCameraId(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v2

    .line 984
    if-nez v2, :cond_0

    .line 986
    return-object v1

    .line 988
    :cond_0
    const-class v3, Landroid/media/MediaRecorder;

    invoke-virtual {v2, v3}, Lcom/android/camera2/CameraCapabilities;->getSupportedOutputSize(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 990
    invoke-static {}, Lcom/android/camera/CameraSettings;->get4kProfile()I

    move-result v3

    .line 991
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance v4, Lcom/android/camera/CameraSize;

    const/16 v5, 0x870

    const/16 v6, 0xf00

    invoke-direct {v4, v6, v5}, Lcom/android/camera/CameraSize;-><init>(II)V

    .line 992
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 993
    invoke-static {v0, v3}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 994
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 995
    invoke-static {v6, v5, p0}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 996
    const v3, 0x7f090024

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 999
    :cond_1
    new-instance v3, Lcom/android/camera/CameraSize;

    const/16 v4, 0x438

    const/16 v5, 0x780

    invoke-direct {v3, v5, v4}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1000
    const/4 v3, 0x6

    invoke-static {v0, v3}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1001
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1002
    invoke-static {v5, v4, p0}, Lcom/android/camera/CameraSettings;->isSupportFpsRange(III)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 1003
    const p0, 0x7f090025

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1006
    :cond_2
    new-instance p0, Lcom/android/camera/CameraSize;

    const/16 v3, 0x500

    const/16 v4, 0x2d0

    invoke-direct {p0, v3, v4}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 1007
    const/4 p0, 0x5

    invoke-static {v0, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1008
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1010
    :cond_3
    new-instance p0, Lcom/android/camera/CameraSize;

    const/16 v3, 0x1e0

    invoke-direct {p0, v4, v3}, Lcom/android/camera/CameraSize;-><init>(II)V

    invoke-interface {v2, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 1011
    const/4 p0, 0x4

    invoke-static {v0, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1012
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1014
    :cond_4
    const/16 p0, 0xb

    invoke-static {v0, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1015
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1017
    :cond_5
    const/16 p0, 0xa

    invoke-static {v0, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1018
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1020
    :cond_6
    const/16 p0, 0x9

    invoke-static {v0, p0}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1021
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1024
    :cond_7
    return-object v1
.end method

.method public static getSupportedVideoSpeed(Landroid/content/Context;I)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 953
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 954
    const-string p1, "normal"

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 955
    const-string p1, "fast"

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 956
    const-string p1, "slow"

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 957
    return-object p0
.end method

.method public static getSystemEdgeMode(Landroid/content/Context;)I
    .locals 4

    .line 1915
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1916
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "edge_handgrip"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 1917
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "edge_handgrip_clean"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    or-int/2addr v0, v2

    .line 1918
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "edge_handgrip_back"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    or-int/2addr v0, v2

    .line 1919
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v2, "edge_handgrip_screenshot"

    invoke-static {p0, v2, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    or-int/2addr p0, v0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const/4 v1, 0x2

    nop

    .line 1915
    :cond_0
    return v1
.end method

.method public static getTTLiveMusicJsonCache()Ljava/lang/String;
    .locals 3

    .line 2710
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_key_tt_live_music_json_cache"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTTLiveStickerJsonCache()Ljava/lang/String;
    .locals 3

    .line 2720
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_key_tt_live_sticker_json_cache"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUIStyleByPreview(II)I
    .locals 16

    .line 1292
    invoke-static {}, Lcom/mi/config/b;->isPad()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1293
    return v1

    .line 1295
    :cond_0
    sget-boolean v0, Lcom/android/camera/CameraSettings;->sCroppedIfNeeded:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 1296
    return v2

    .line 1298
    :cond_1
    nop

    .line 1299
    move/from16 v0, p0

    int-to-double v3, v0

    move/from16 v0, p1

    int-to-double v5, v0

    div-double/2addr v3, v5

    .line 1300
    invoke-static {}, Lcom/mi/config/b;->hc()Z

    move-result v0

    const/4 v5, 0x3

    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    const-wide v8, 0x3f947ae147ae147bL    # 0.02

    if-eqz v0, :cond_2

    sub-double v10, v3, v6

    .line 1301
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    cmpg-double v0, v10, v8

    if-gez v0, :cond_2

    .line 1302
    const/4 v1, 0x2

    goto :goto_1

    .line 1303
    :cond_2
    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    int-to-double v10, v0

    sget v0, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-double v12, v0

    div-double/2addr v10, v12

    sub-double/2addr v10, v3

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    cmpg-double v0, v10, v8

    if-gez v0, :cond_3

    .line 1304
    nop

    .line 1314
    :goto_0
    move v1, v5

    goto :goto_1

    .line 1305
    :cond_3
    const-wide v10, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double v10, v3, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    const-wide v12, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double v12, v3, v12

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v14

    cmpl-double v0, v10, v14

    if-gtz v0, :cond_4

    sub-double v6, v3, v6

    .line 1306
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    cmpg-double v0, v6, v8

    if-gez v0, :cond_6

    .line 1307
    :cond_4
    invoke-static {v12, v13}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    sub-double/2addr v3, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    cmpl-double v0, v0, v3

    if-lez v0, :cond_5

    .line 1308
    goto :goto_0

    .line 1311
    :cond_5
    nop

    .line 1314
    move v1, v2

    :cond_6
    :goto_1
    return v1
.end method

.method public static getVideoEncoder()I
    .locals 3

    .line 755
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_video_encoder_key"

    .line 756
    const v2, 0x7f090033

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 757
    const-string v1, "h265"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 758
    const/4 v0, 0x5

    return v0

    .line 760
    :cond_0
    const/4 v0, 0x2

    return v0
.end method

.method public static getVideoQuality()I
    .locals 3

    .line 686
    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    const/4 v1, 0x6

    if-eqz v0, :cond_0

    .line 688
    return v1

    .line 689
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 692
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v2, "pref_camera_auto_zoom"

    invoke-virtual {v0, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 693
    return v1

    .line 695
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getPreferVideoQuality(I)I

    move-result v0

    .line 696
    return v0

    .line 691
    :cond_3
    :goto_0
    const/4 v0, 0x5

    return v0
.end method

.method public static getVideoSpeed()Ljava/lang/String;
    .locals 1

    .line 1907
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getWhiteBalance()Ljava/lang/String;
    .locals 3

    .line 1488
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_whitebalance_key"

    .line 1490
    const v2, 0x7f090064

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1488
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static initBeautyBody(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 2

    .line 2293
    if-nez p0, :cond_0

    .line 2294
    return-void

    .line 2296
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object v0

    .line 2297
    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->isClosed()Z

    move-result v0

    .line 2298
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyBody()Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 2300
    :goto_0
    const-string v1, "pref_beauty_head_slim_ratio"

    .line 2301
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyHeadSlim:I

    .line 2303
    const-string v1, "pref_beauty_body_slim_ratio"

    .line 2304
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBodySlim:I

    .line 2306
    const-string v1, "pref_beauty_shoulder_slim_ratio"

    .line 2307
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyShoulderSlim:I

    .line 2309
    const-string v1, "key_beauty_leg_slim_ratio"

    .line 2310
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLegSlim:I

    .line 2311
    return-void
.end method

.method public static initBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;Z)V
    .locals 4

    .line 2267
    if-nez p0, :cond_0

    .line 2268
    return-void

    .line 2271
    :cond_0
    invoke-static {}, Lcom/mi/config/b;->hR()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2272
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->initNewBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V

    .line 2273
    return-void

    .line 2276
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 2277
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUseAdvanceBeauty()Z

    move-result v0

    .line 2278
    const-string v1, "pref_beautify_slim_face_ratio_key"

    .line 2279
    const/4 v2, 0x0

    if-nez v0, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v3

    invoke-static {v1, v3}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    :goto_0
    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 2281
    const-string v1, "pref_beautify_enlarge_eye_ratio_key"

    .line 2282
    if-nez v0, :cond_3

    move v1, v2

    goto :goto_1

    :cond_3
    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v3

    invoke-static {v1, v3}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    :goto_1
    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 2284
    const-string v1, "pref_beautify_skin_color_ratio_key"

    .line 2285
    if-nez v0, :cond_4

    move v1, v2

    goto :goto_2

    :cond_4
    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v3

    invoke-static {v1, v3}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v1

    :goto_2
    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinColor:I

    .line 2287
    const-string v1, "pref_beautify_skin_smooth_ratio_key"

    .line 2288
    if-nez v0, :cond_5

    goto :goto_3

    :cond_5
    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result p1

    invoke-static {v1, p1}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatio(Ljava/lang/String;I)I

    move-result v2

    :goto_3
    iput v2, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySkinSmooth:I

    .line 2289
    return-void
.end method

.method private static initNewBeautyValues(Lcom/android/camera/fragment/beauty/BeautyValues;)V
    .locals 2

    .line 2339
    if-nez p0, :cond_0

    .line 2340
    return-void

    .line 2343
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLevel:Ljava/lang/String;

    .line 2344
    invoke-static {}, Lcom/android/camera/CameraSettings;->isUseAdvanceBeauty()Z

    move-result v0

    .line 2345
    const-string v1, "pref_beautify_slim_face_ratio_key"

    .line 2346
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimFace:I

    .line 2348
    const-string v1, "pref_beautify_enlarge_eye_ratio_key"

    .line 2349
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEnlargeEye:I

    .line 2351
    const-string v1, "pref_beautify_nose_ratio_key"

    .line 2352
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNose:I

    .line 2354
    const-string v1, "pref_beautify_risorius_ratio_key"

    .line 2355
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyRisorius:I

    .line 2357
    const-string v1, "pref_beautify_lips_ratio_key"

    .line 2358
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyLips:I

    .line 2360
    const-string v1, "pref_beautify_chin_ratio_key"

    .line 2361
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyChin:I

    .line 2363
    const-string v1, "pref_beautify_neck_ratio_key"

    .line 2364
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyNeck:I

    .line 2366
    const-string v1, "pref_beautify_smile_ratio_key"

    .line 2367
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySmile:I

    .line 2369
    const-string v1, "pref_beautify_slim_nose_ratio_key"

    .line 2370
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautySlimNose:I

    .line 2372
    const-string v1, "pref_beautify_eyebrow_dye_ratio_key"

    .line 2373
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyEyebrowDye:I

    .line 2375
    const-string v1, "pref_beautify_pupil_line_ratio_key"

    .line 2376
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyPupilLine:I

    .line 2378
    const-string v1, "pref_beautify_jelly_lips_ratio_key"

    .line 2379
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyJellyLips:I

    .line 2381
    const-string v1, "pref_beautify_blusher_ratio_key"

    .line 2382
    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getItemBeautyValue(ZLjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/BeautyValues;->mBeautyBlusher:I

    .line 2383
    return-void
.end method

.method public static intelligentValueToBeautyLevel(Ljava/lang/String;)I
    .locals 3

    .line 1747
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-static {v0, p0}, Lcom/android/camera/Util;->stringSparseArraysIndexOf(Landroid/util/SparseArray;Ljava/lang/String;)I

    move-result v0

    .line 1748
    if-gez v0, :cond_0

    .line 1749
    const-string v0, "CameraSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid faceBeautyValue: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1750
    const/4 v0, 0x0

    .line 1752
    :cond_0
    sget-object p0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result p0

    return p0
.end method

.method public static is4KHigherVideoQuality(I)Z
    .locals 3

    .line 974
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 975
    return v1

    .line 977
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->get4kProfile()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, p0, :cond_2

    if-ne p0, v2, :cond_1

    goto :goto_0

    :cond_1
    goto :goto_1

    :cond_2
    :goto_0
    move v1, v2

    :goto_1
    return v1
.end method

.method public static isAEAFLockSupport()Z
    .locals 4

    .line 1264
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_ae_af_lock_support_key"

    .line 1265
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 1264
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isAdvancedBeautyOn()Z
    .locals 2

    .line 1596
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyValue()Ljava/lang/String;

    move-result-object v0

    .line 1597
    sget-object v1, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isAgeGenderAndMagicMirrorWaterOpen()Z
    .locals 1

    .line 2491
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fe()Z

    move-result v0

    .line 2492
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isAgeGenderWaterMarkOpen()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isMagicMirrorWaterMarkOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isAgeGenderWaterMarkOpen()Z
    .locals 2

    .line 2482
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_show_gender_age_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isAsdMotionEnable()Z
    .locals 3

    .line 1890
    invoke-static {}, Lcom/mi/config/b;->gG()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1891
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_asd_night_key"

    const v2, 0x7f0f0005

    .line 1892
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 1891
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1890
    :goto_0
    return v0
.end method

.method public static isAsdNightEnable()Z
    .locals 3

    .line 1884
    invoke-static {}, Lcom/mi/config/b;->gI()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1885
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_asd_night_key"

    const v2, 0x7f0f0005

    .line 1886
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 1885
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1884
    :goto_0
    return v0
.end method

.method public static isAsdPopupEnable()Z
    .locals 1

    .line 1880
    invoke-static {}, Lcom/mi/config/b;->gB()Z

    move-result v0

    return v0
.end method

.method public static isAspectRatio16_9(II)Z
    .locals 3

    .line 572
    if-ge p0, p1, :cond_0

    .line 573
    nop

    .line 574
    nop

    .line 575
    nop

    .line 577
    move v2, p1

    move p1, p0

    move p0, v2

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 578
    const-wide p0, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, p0, v0

    if-gez p0, :cond_1

    .line 579
    const/4 p0, 0x1

    return p0

    .line 581
    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isAspectRatio18_9(II)Z
    .locals 3

    .line 585
    if-ge p0, p1, :cond_0

    .line 586
    nop

    .line 587
    nop

    .line 588
    nop

    .line 590
    move v2, p1

    move p1, p0

    move p0, v2

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 591
    const-wide/high16 p0, 0x4000000000000000L    # 2.0

    sub-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, p0, v0

    if-gez p0, :cond_1

    .line 592
    const/4 p0, 0x1

    return p0

    .line 594
    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isAspectRatio19_5_9(II)Z
    .locals 3

    .line 598
    if-ge p0, p1, :cond_0

    .line 599
    nop

    .line 600
    nop

    .line 601
    nop

    .line 603
    move v2, p1

    move p1, p0

    move p0, v2

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 604
    const-wide p0, 0x4001555555555555L    # 2.1666666666666665

    sub-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, p0, v0

    if-gez p0, :cond_1

    .line 605
    const/4 p0, 0x1

    return p0

    .line 607
    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isAspectRatio1_1(II)Z
    .locals 0

    .line 630
    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isAspectRatio4_3(II)Z
    .locals 3

    .line 559
    if-ge p0, p1, :cond_0

    .line 560
    nop

    .line 561
    nop

    .line 562
    nop

    .line 564
    move v2, p1

    move p1, p0

    move p0, v2

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 565
    const-wide p0, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, p0, v0

    if-gez p0, :cond_1

    .line 566
    const/4 p0, 0x1

    return p0

    .line 568
    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isBackCamera()Z
    .locals 1

    .line 438
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isBackPortrait()Z
    .locals 3

    .line 2508
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    .line 2509
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2510
    return v1

    .line 2512
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 2513
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 2514
    const/16 v2, 0xab

    if-ne v0, v2, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public static isBeautyBodySlimOn()Z
    .locals 7

    .line 1568
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyBody()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1569
    return v1

    .line 1571
    :cond_0
    const-string v0, "pref_beauty_head_slim_ratio"

    .line 1572
    const-string v2, "pref_beauty_body_slim_ratio"

    .line 1573
    const-string v3, "pref_beauty_shoulder_slim_ratio"

    .line 1574
    const-string v4, "key_beauty_leg_slim_ratio"

    .line 1575
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object v5

    .line 1576
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v0

    invoke-virtual {v5, v6, v0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->getBeautyBodyValue(Ljava/lang/String;I)I

    move-result v0

    .line 1577
    const/4 v6, 0x1

    if-lez v0, :cond_1

    .line 1578
    return v6

    .line 1580
    :cond_1
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v2

    invoke-virtual {v5, v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->getBeautyBodyValue(Ljava/lang/String;I)I

    move-result v0

    .line 1581
    if-lez v0, :cond_2

    .line 1582
    return v6

    .line 1584
    :cond_2
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v2

    invoke-virtual {v5, v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->getBeautyBodyValue(Ljava/lang/String;I)I

    move-result v0

    .line 1585
    if-lez v0, :cond_3

    .line 1586
    return v6

    .line 1588
    :cond_3
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v1}, Lcom/android/camera/CameraSettings;->getDefaultRatio(Ljava/lang/String;Z)I

    move-result v2

    invoke-virtual {v5, v0, v2}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->getBeautyBodyValue(Ljava/lang/String;I)I

    move-result v0

    .line 1589
    if-lez v0, :cond_4

    .line 1590
    return v6

    .line 1592
    :cond_4
    return v1
.end method

.method public static isBeautyMakeupClicked()Z
    .locals 3

    .line 2202
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_beauty_makeup_clicked_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isBeautyRemodelingClicked()Z
    .locals 3

    .line 2194
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_beauty_remodeling_clicked_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isBurstShootingEnable()Z
    .locals 4

    .line 1257
    invoke-static {}, Lcom/mi/config/b;->gf()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "burst"

    .line 1258
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "pref_camera_long_press_shutter_feature_key"

    const v3, 0x7f09016f

    .line 1260
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1258
    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1257
    :goto_0
    return v0
.end method

.method public static isCameraFaceDetectionAutoHidden()Z
    .locals 4

    .line 2025
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_facedetection_auto_hidden_key"

    .line 2026
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2027
    const v3, 0x7f0f0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2025
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isCameraParallelProcessEnable()Z
    .locals 4

    .line 2062
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportParallelProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_parallel_process_enable_key"

    .line 2063
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f000d

    .line 2064
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2062
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isCameraPortraitWithFaceBeauty()Z
    .locals 4

    .line 2019
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_portrait_with_facebeauty_key"

    .line 2020
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2021
    const v3, 0x7f0f0008

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2019
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isCameraSoundOpen()Z
    .locals 3

    .line 1150
    invoke-static {}, Lcom/mi/config/b;->gd()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 1151
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v2, "pref_camerasound_key"

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    nop

    .line 1150
    :cond_1
    :goto_0
    return v1
.end method

.method public static isCameraSpecific(Ljava/lang/String;)Z
    .locals 1

    .line 2406
    const-string v0, "pref_camera_picturesize_key"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_jpegquality_key"

    .line 2407
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_quality_key"

    .line 2408
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_hfr_key"

    .line 2409
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_new_slow_motion_key"

    .line 2410
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_sticker_path_key"

    .line 2411
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_flashmode_key"

    .line 2412
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_video_flashmode_key"

    .line 2413
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_hdr_key"

    .line 2414
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_hdr_key"

    .line 2415
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_whitebalance_key"

    .line 2416
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_qc_manual_whitebalance_k_value_key"

    .line 2417
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_focus_position_key"

    .line 2418
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_qc_camera_exposuretime_key"

    .line 2419
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_qc_camera_iso_key"

    .line 2420
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_zoom_mode_key"

    .line 2421
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_manually_lens"

    .line 2422
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_face_beauty_key"

    .line 2423
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_face_beauty_key"

    .line 2424
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_face_beauty_switch_key"

    .line 2425
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_beautify_slim_face_ratio_key"

    .line 2426
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    .line 2427
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_beautify_skin_color_ratio_key"

    .line 2428
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_beautify_enlarge_eye_ratio_key"

    .line 2429
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 2406
    :goto_1
    return p0
.end method

.method public static isDualCameraEnable()Z
    .locals 4

    .line 2031
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_dual_enable_key"

    .line 2032
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2033
    const v3, 0x7f0f0009

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2031
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDualCameraHintShown()Z
    .locals 6

    .line 1963
    sget-boolean v0, Lcom/mi/config/b;->qx:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1964
    return v1

    .line 1966
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1967
    const-string v2, "pref_dual_camera_use_hint_shown_times_key"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1968
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1969
    const-string v4, "pref_dual_camera_use_hint_shown_times_key"

    add-int/lit8 v5, v2, 0x1

    invoke-interface {v0, v4, v5}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1970
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1971
    const/4 v0, 0x5

    if-ge v2, v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    return v1
.end method

.method public static isDualCameraSatEnable()Z
    .locals 4

    .line 2037
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_dual_sat_enable_key"

    .line 2038
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2039
    const v3, 0x7f0f000a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2037
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDualCameraWaterMarkOpen()Z
    .locals 3

    .line 1180
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1181
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_dualcamera_watermark"

    const v2, 0x7f0f0013

    .line 1183
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 1182
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1181
    return v0

    .line 1185
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isEdgePhotoEnable()Z
    .locals 1

    .line 1911
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isEnableDNG()Z
    .locals 1

    .line 2088
    const/4 v0, 0x0

    return v0
.end method

.method public static isEvAdjustable()Z
    .locals 8

    .line 2160
    invoke-static {}, Lcom/android/camera/CameraSettings;->isTiltShiftOn()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    .line 2162
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 2163
    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object v0

    .line 2164
    const-string v3, "pref_qc_camera_exposuretime_key"

    .line 2165
    const v4, 0x7f090136

    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 2164
    invoke-virtual {v0, v3, v5}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2166
    const-string v5, "pref_qc_camera_iso_key"

    .line 2167
    const v6, 0x7f0900aa

    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 2166
    invoke-virtual {v0, v5, v7}, Lcom/android/camera/preferences/CameraSettingPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2168
    invoke-static {}, Lcom/mi/config/b;->hU()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2169
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 2171
    :cond_1
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 2172
    invoke-static {v6}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    goto :goto_1

    .line 2171
    :cond_3
    :goto_0
    move v1, v2

    :goto_1
    return v1

    .line 2175
    :cond_4
    return v2

    .line 2161
    :cond_5
    :goto_2
    return v1
.end method

.method public static isFaceBeautyOn(Ljava/lang/String;)Z
    .locals 2

    .line 1559
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1563
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0

    .line 1561
    :cond_0
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_CLOSE:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyBodySlimOn()Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    nop

    :cond_2
    :goto_0
    return v1
.end method

.method public static isFaceBeautyValid(Ljava/lang/String;)Z
    .locals 2

    .line 1756
    sget-object v0, Lcom/android/camera/constant/BeautyConstant;->LEVEL_ADVANCED:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1757
    return v1

    .line 1759
    :cond_0
    sget-object v0, Lcom/android/camera/CameraSettings;->sFaceBeautyLevelToValue:Landroid/util/SparseArray;

    invoke-static {v0, p0}, Lcom/android/camera/Util;->stringSparseArraysIndexOf(Landroid/util/SparseArray;Ljava/lang/String;)I

    move-result p0

    if-ltz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static isFaceWaterMarkOpen()Z
    .locals 3

    .line 1197
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_face_info_watermark_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFingerprintCaptureEnable()Z
    .locals 3

    .line 2092
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_fingerprint_capture_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFocusModeSwitching()Z
    .locals 3

    .line 1481
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_qc_focus_mode_switching_key"

    .line 1482
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1481
    return v0
.end method

.method public static isFovcEnabled()Z
    .locals 1

    .line 2096
    const/4 v0, 0x0

    return v0
.end method

.method public static isFrontCamera()Z
    .locals 2

    .line 433
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static isFrontMenuUltraPixelPhotographyOn()Z
    .locals 3

    .line 2772
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2773
    const-string v1, "pref_menu_ultra_pixel_photography_front"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFrontMirror()Z
    .locals 3

    .line 1201
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1202
    const-string v1, "pref_front_mirror_key"

    .line 1203
    const v2, 0x7f090166

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1202
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1205
    const-string v2, "auto"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1206
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v2, "pref_front_mirror_key"

    invoke-interface {v0, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1208
    :cond_0
    const v0, 0x7f090167

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isFrontPortrait()Z
    .locals 3

    .line 2497
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    .line 2498
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2499
    return v1

    .line 2501
    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 2502
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 2503
    const/16 v2, 0xab

    if-ne v0, v2, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public static isFrontSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z
    .locals 2

    .line 504
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 505
    return v0

    .line 507
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v1

    if-nez v1, :cond_1

    .line 508
    return v0

    .line 510
    :cond_1
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 511
    return v0

    .line 514
    :cond_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fQ()I

    move-result v1

    .line 515
    if-gtz v1, :cond_3

    .line 516
    return v0

    .line 518
    :cond_3
    invoke-virtual {p0, v1}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographySupported(I)Z

    move-result p0

    return p0
.end method

.method public static isGradienterOn()Z
    .locals 2

    .line 1378
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_gradienter_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isGroupShotOn()Z
    .locals 2

    .line 1374
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_groupshot_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isHangGestureOpen()Z
    .locals 3

    .line 2824
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_hand_gesture"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isLabOptionsVisible()Z
    .locals 3

    .line 2009
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_lab_option_key_visible"

    .line 2010
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2009
    return v0
.end method

.method public static isLensDirtyDetectEnabled()Z
    .locals 3

    .line 2218
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_lens_dirty_detect_enabled_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isLiveBeautyModeKey(Ljava/lang/String;)Z
    .locals 5

    .line 2828
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2829
    return v1

    .line 2831
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, -0x7dcb43c1

    const/4 v4, 0x1

    if-eq v2, v3, :cond_3

    const v3, 0xa78ecec

    if-eq v2, v3, :cond_2

    const v3, 0x699265fd

    if-eq v2, v3, :cond_1

    goto :goto_0

    :cond_1
    const-string v2, "key_live_enlarge_eye_ratio"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    move p0, v4

    goto :goto_1

    :cond_2
    const-string v2, "key_live_shrink_face_ratio"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    move p0, v1

    goto :goto_1

    :cond_3
    const-string v2, "key_live_smooth_strength"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x2

    goto :goto_1

    :cond_4
    :goto_0
    move p0, v0

    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 2839
    return v1

    .line 2837
    :pswitch_0
    return v4

    .line 2835
    :pswitch_1
    return v4

    .line 2833
    :pswitch_2
    return v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static isLiveBeautyOpen()Z
    .locals 3

    .line 2794
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_beauty_status"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2795
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getLiveFilter()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 2794
    :goto_1
    return v2
.end method

.method public static isLiveModuleClicked()Z
    .locals 3

    .line 2759
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_live_module_clicked"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isLiveShotOn()Z
    .locals 2

    .line 1382
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1383
    return v1

    .line 1386
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1387
    return v1

    .line 1390
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLiveShot()Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    move-result-object v0

    const/16 v1, 0xa3

    .line 1391
    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;->isLiveShotOn(I)Z

    move-result v0

    .line 1390
    return v0
.end method

.method public static isLiveStickerInternalChannel()Z
    .locals 3

    .line 2591
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_live_sticker_internal"

    .line 2592
    const v2, 0x7f0f0011

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 2591
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMagicMirrorOn()Z
    .locals 2

    .line 1222
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isMagicMirrorWaterMarkOpen()Z
    .locals 2

    .line 2486
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_magic_mirror_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isMfnrSatEnable()Z
    .locals 4

    .line 2043
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_mfnr_sat_enable_key"

    .line 2044
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2045
    const v3, 0x7f0f000e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2043
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMovieSolidOn()Z
    .locals 3

    .line 1212
    invoke-static {}, Lcom/mi/config/b;->fY()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1213
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_movie_solid_key"

    const v2, 0x7f090125

    .line 1214
    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 1213
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1212
    :goto_0
    return v0
.end method

.method public static isNearAspectRatio(IIII)Z
    .locals 0

    .line 626
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result p0

    invoke-static {p2, p3}, Lcom/android/camera/CameraSettings;->getAspectRatio(II)I

    move-result p1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isNearRatio16_9(II)Z
    .locals 9

    .line 634
    if-ge p0, p1, :cond_0

    .line 635
    nop

    .line 636
    nop

    .line 637
    nop

    .line 639
    move v8, p1

    move p1, p0

    move p0, v8

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 641
    const-wide p0, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double p0, v0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v2, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double v2, v0, v2

    .line 642
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpl-double p0, p0, v4

    const/4 p1, 0x0

    if-gtz p0, :cond_2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    sub-double v4, v0, v4

    .line 643
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, v4, v6

    if-gez p0, :cond_1

    goto :goto_0

    .line 651
    :cond_1
    return p1

    .line 644
    :cond_2
    :goto_0
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    sub-double/2addr v0, v4

    .line 645
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    cmpl-double p0, v2, v0

    if-lez p0, :cond_3

    .line 646
    return p1

    .line 648
    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method public static isNearRatio18_9(II)Z
    .locals 9

    .line 655
    if-ge p0, p1, :cond_0

    .line 656
    nop

    .line 657
    nop

    .line 658
    nop

    .line 660
    move v8, p1

    move p1, p0

    move p0, v8

    :cond_0
    int-to-double v0, p0

    int-to-double p0, p1

    div-double/2addr v0, p0

    .line 662
    const-wide p0, 0x3ff5555555555555L    # 1.3333333333333333

    sub-double p0, v0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v2, 0x3ffc71c71c71c71cL    # 1.7777777777777777

    sub-double v2, v0, v2

    .line 663
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpl-double p0, p0, v4

    const/4 p1, 0x0

    if-gtz p0, :cond_2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    sub-double v4, v0, v4

    .line 664
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3f947ae147ae147bL    # 0.02

    cmpg-double p0, v4, v6

    if-gez p0, :cond_1

    goto :goto_0

    .line 672
    :cond_1
    return p1

    .line 665
    :cond_2
    :goto_0
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    sub-double/2addr v0, v4

    .line 666
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    cmpl-double p0, v2, v0

    if-lez p0, :cond_3

    .line 667
    const/4 p0, 0x1

    return p0

    .line 669
    :cond_3
    return p1
.end method

.method public static isNeedRemind(Ljava/lang/String;)Z
    .locals 2

    .line 1975
    sget-object v0, Lcom/android/camera/CameraSettings;->sRemindMode:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1976
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "_remind"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    .line 1978
    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isNoCameraModeSelected(Landroid/content/Context;)Z
    .locals 1

    .line 1897
    check-cast p0, Lcom/android/camera/ActivityBase;

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/module/Module;->getSupportedSettingKeys()Ljava/util/List;

    move-result-object p0

    .line 1898
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1899
    invoke-static {v0}, Lcom/android/camera/CameraSettings;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1900
    const/4 p0, 0x0

    return p0

    .line 1902
    :cond_0
    goto :goto_0

    .line 1903
    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static isNormalWideLDCEnabled()Z
    .locals 3

    .line 2549
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_normal_wide_ldc_key"

    .line 2550
    const v2, 0x7f0f0016

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 2549
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isOptimizedFlashEnable()Z
    .locals 4

    .line 2049
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_optimized_flash_enable_key"

    .line 2050
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 2051
    const v3, 0x7f0f000f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2049
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isPopupTipBeautyIntroEnable()Z
    .locals 3

    .line 2179
    invoke-static {}, Lcom/mi/config/b;->hP()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2180
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v2, "pref_popup_tip_beauty_intro_clicked_key"

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2181
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v2, "pref_popup_tip_beauty_intro_show_times_key"

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x3

    if-ge v0, v2, :cond_0

    const/4 v1, 0x1

    nop

    .line 2179
    :cond_0
    return v1
.end method

.method public static isPortraitModeBackOn()Z
    .locals 2

    .line 1362
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_portrait_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isPressDownCapture()Z
    .locals 5

    .line 1871
    invoke-static {}, Lcom/mi/config/b;->gM()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 1872
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "focus"

    .line 1873
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v2

    const-string v3, "pref_camera_long_press_shutter_feature_key"

    const v4, 0x7f09016f

    .line 1874
    invoke-static {v4}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1873
    invoke-virtual {v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1872
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 1876
    :cond_2
    return v1
.end method

.method public static isProximityLockOpen()Z
    .locals 3

    .line 1193
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_proximity_lock_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isQRCodeReceiverAvailable(Landroid/content/Context;)Z
    .locals 1

    .line 1234
    const-string v0, "com.xiaomi.scanner"

    invoke-static {p0, v0}, Lcom/android/camera/Util;->isPackageAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static isRearMenuUltraPixelPhotographyOn()Z
    .locals 3

    .line 2767
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2768
    const-string v1, "pref_menu_ultra_pixel_photography_rear"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isRecordLocation()Z
    .locals 3

    .line 1145
    invoke-static {}, Lcom/mi/config/b;->gi()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1146
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v2, "pref_camera_recordlocation_key"

    invoke-virtual {v0, v2, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    .line 1145
    :cond_0
    return v1
.end method

.method public static isSREnable()Z
    .locals 4

    .line 2055
    invoke-static {}, Lcom/mi/config/b;->isSupportSuperResolution()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2056
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_sr_enable_key"

    .line 2057
    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0f0010

    .line 2058
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 2056
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2055
    :goto_0
    return v0
.end method

.method public static isSaveGroushotPrimitiveOn()Z
    .locals 3

    .line 2740
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_groupshot_with_primitive_picture_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isScanQRCode(Landroid/content/Context;)Z
    .locals 2

    .line 1226
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isQRCodeReceiverAvailable(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1227
    invoke-static {}, Lcom/mi/config/b;->ha()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 1228
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p0

    const-string v0, "pref_scan_qrcode_key"

    const v1, 0x7f090134

    .line 1230
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1228
    invoke-virtual {p0, v0, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 1226
    :goto_0
    return p0
.end method

.method public static isShowUltraWideIntro()Z
    .locals 3

    .line 2750
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pre_popup_ultra_wide_intro_show_times"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    const/4 v2, 0x1

    nop

    :cond_0
    return v2
.end method

.method public static isStereoModeOn()Z
    .locals 2

    .line 1366
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_stereo_mode_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isSupportBeautyBody()Z
    .locals 2

    .line 2800
    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackPortrait()Z

    move-result v0

    .line 2801
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2802
    return v1

    .line 2804
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->getActiveModuleIndex()I

    move-result v0

    .line 2806
    packed-switch v0, :pswitch_data_0

    .line 2813
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupportBeautyBody()Z

    move-result v0

    return v0

    .line 2809
    :pswitch_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static isSupportBeautyMakeup()Z
    .locals 4

    .line 961
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCurrentCameraCapabilities()Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 962
    const-string v1, "CameraSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSupportBeautyMakeup: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBeautyMakeup()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 963
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->isSupportBeautyMakeup()Z

    move-result v0

    return v0
.end method

.method public static isSupportFpsRange(I)Z
    .locals 7

    .line 1053
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCameraId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v0

    .line 1054
    invoke-virtual {v0}, Lcom/android/camera2/CameraCapabilities;->getSupportedFpsRange()[Landroid/util/Range;

    move-result-object v0

    .line 1055
    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 1056
    invoke-virtual {v4}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v6

    if-ne v5, v6, :cond_0

    invoke-virtual {v4}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, p0, :cond_0

    .line 1057
    const/4 p0, 0x1

    return p0

    .line 1055
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1060
    :cond_1
    return v2
.end method

.method public static isSupportFpsRange(III)Z
    .locals 3

    .line 1035
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 1036
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v0

    .line 1037
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1038
    return v1

    .line 1040
    :cond_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->getCameraId(I)I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object p2

    .line 1041
    invoke-virtual {p2}, Lcom/android/camera2/CameraCapabilities;->getSupportedCustomFpsRange()Ljava/util/List;

    move-result-object p2

    .line 1042
    if-eqz p2, :cond_4

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 1044
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera2/MiCustomFpsRange;

    .line 1046
    invoke-virtual {v0}, Lcom/android/camera2/MiCustomFpsRange;->getWidth()I

    move-result v2

    if-ne v2, p0, :cond_2

    invoke-virtual {v0}, Lcom/android/camera2/MiCustomFpsRange;->getHeight()I

    move-result v0

    if-ne v0, p1, :cond_2

    .line 1047
    const/4 p0, 0x1

    return p0

    .line 1048
    :cond_2
    goto :goto_0

    .line 1049
    :cond_3
    return v1

    .line 1043
    :cond_4
    :goto_1
    return v1
.end method

.method public static isSupportParallelProcess()Z
    .locals 1

    .line 2076
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fp()Z

    move-result v0

    return v0
.end method

.method public static isSupportedDualCameraWaterMark()Z
    .locals 1

    .line 2080
    invoke-static {}, Lcom/mi/config/b;->hV()Z

    move-result v0

    return v0
.end method

.method public static isSupportedMetadata()Z
    .locals 1

    .line 2084
    invoke-static {}, Lcom/mi/config/b;->gC()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isSupportedOpticalZoom()Z
    .locals 1

    .line 2068
    invoke-static {}, Lcom/mi/config/b;->isSupportedOpticalZoom()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->hasMuxCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSupportedPortrait()Z
    .locals 1

    .line 2072
    invoke-static {}, Lcom/mi/config/b;->isSupportedPortrait()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->hasMuxCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSupportedUltraPixelPhotography(Lcom/android/camera2/CameraCapabilities;)Z
    .locals 4

    .line 476
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 477
    return v0

    .line 480
    :cond_0
    invoke-virtual {p0}, Lcom/android/camera2/CameraCapabilities;->getCameraId()I

    move-result v1

    .line 482
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getMainBackCameraId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 484
    move v1, v3

    goto :goto_0

    .line 482
    :cond_1
    nop

    .line 484
    move v1, v0

    :goto_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    .line 486
    :cond_2
    move v3, v0

    :goto_1
    if-nez v1, :cond_4

    if-eqz v3, :cond_3

    goto :goto_2

    .line 495
    :cond_3
    return v0

    .line 488
    :cond_4
    :goto_2
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mi/config/a;->fP()I

    move-result v1

    .line 489
    if-gtz v1, :cond_5

    .line 490
    return v0

    .line 493
    :cond_5
    invoke-virtual {p0, v1}, Lcom/android/camera2/CameraCapabilities;->isUltraPixelPhotographySupported(I)Z

    move-result p0

    return p0
.end method

.method public static isSwitchCameraZoomMode()Z
    .locals 1

    .line 2000
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isPanoramaModule()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isSwitchOn(Ljava/lang/String;)Z
    .locals 3

    .line 1328
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isTransient(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1329
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 1330
    :cond_0
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isCameraSpecific(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1331
    const-string v0, "on"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v2, "off"

    invoke-virtual {v1, p0, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 1333
    :cond_1
    const-string v0, "on"

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "off"

    invoke-virtual {v1, p0, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static isTiltShiftOn()Z
    .locals 2

    .line 1408
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_tilt_shift_mode"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isTimeWaterMarkOpen()Z
    .locals 3

    .line 1155
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_watermark_key"

    .line 1156
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1155
    return v0
.end method

.method public static isTransient(Ljava/lang/String;)Z
    .locals 1

    .line 2433
    const-string v0, "pref_delay_capture_mode"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_shader_coloreffect_key"

    .line 2434
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_scenemode_key"

    .line 2435
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_scenemode_setting_key"

    .line 2436
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_gradienter_key"

    .line 2437
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_ubifocus_key"

    .line 2438
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_magic_mirror_key"

    .line 2439
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_groupshot_mode_key"

    .line 2440
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_super_resolution_key"

    .line 2441
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_tilt_shift_key"

    .line 2442
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_tilt_shift_mode"

    .line 2443
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_hand_night_key"

    .line 2444
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_speed_fast_key"

    .line 2445
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_speed_slow_key"

    .line 2446
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_video_speed_hfr_key"

    .line 2447
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_portrait_mode_key"

    .line 2448
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_manual_mode_key"

    .line 2449
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_square_mode_key"

    .line 2450
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_show_gender_age_key"

    .line 2451
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_peak_key"

    .line 2452
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "pref_camera_stereo_mode_key"

    .line 2453
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 2433
    :goto_1
    return p0
.end method

.method public static isUltraPixelPhotographyOn()Z
    .locals 3

    .line 2638
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2639
    const-string v1, "pref_ultra_pixel_photography_enabled"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isUltraWideConfigOpen(I)Z
    .locals 1

    .line 2529
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object v0

    .line 2530
    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->isOpenUltrWide(I)Z

    move-result p0

    return p0
.end method

.method public static isUltraWideLDCEnabled()Z
    .locals 3

    .line 2539
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_ultra_wide_ldc_key"

    .line 2540
    const v2, 0x7f0f0015

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 2539
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isUltraWideVideoLDCEnabled()Z
    .locals 3

    .line 2544
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_ultra_wide_video_ldc_key"

    .line 2545
    const v2, 0x7f0f0015

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->getBool(I)Z

    move-result v2

    .line 2544
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static isUseAdvanceBeauty()Z
    .locals 2

    .line 2316
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    .line 2317
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 2318
    const/16 v1, 0xab

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isVideoBokehOn()Z
    .locals 2

    .line 1370
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_video_bokeh_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/config/DataItemConfig;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isVideoCaptureVisible()Z
    .locals 2

    .line 1110
    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isStereoModeOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1111
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isVideoBokehOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1112
    invoke-static {}, Lcom/mi/config/b;->hq()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "slow"

    .line 1113
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "hfr"

    .line 1114
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getVideoSpeed()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1116
    :cond_1
    invoke-static {}, Lcom/mi/config/b;->gz()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-boolean v0, Lcom/mi/config/b;->qf:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/mi/config/b;->qh:Z

    if-eqz v0, :cond_3

    .line 1117
    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoQuality()I

    move-result v0

    const/4 v1, 0x6

    if-gt v0, v1, :cond_4

    :cond_3
    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    .line 1110
    :goto_0
    return v0
.end method

.method public static listToArrayList(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 815
    if-nez p0, :cond_0

    .line 816
    const/4 p0, 0x0

    return-object p0

    .line 818
    :cond_0
    instance-of v0, p0, Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 819
    check-cast p0, Ljava/util/ArrayList;

    return-object p0

    .line 822
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 823
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 824
    return-object v0
.end method

.method public static readEdgePhotoSetting(Landroid/content/Context;)V
    .locals 2

    .line 1923
    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1924
    nop

    .line 1925
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "edge_handgrip_photo"

    .line 1924
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/android/camera/CameraSettings;->sEdgePhotoEnable:Z

    .line 1927
    :cond_1
    return-void
.end method

.method public static readExposure()I
    .locals 3

    .line 913
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_exposure_key"

    const-string v2, "0"

    .line 914
    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 915
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/Util;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static readFNumber()Ljava/lang/String;
    .locals 3

    .line 2583
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_f_number"

    sget-object v2, Lcom/android/camera/CameraSettings;->F_NUMBER_DEFAULT_VALUE:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readPreferredCameraId()I
    .locals 1

    .line 892
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    return v0
.end method

.method public static readZoom()F
    .locals 4

    .line 931
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_camera_zoom_key"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/config/DataItemConfig;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 933
    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 934
    :catch_0
    move-exception v1

    .line 935
    const-string v1, "CameraSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid zoom: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 937
    const/4 v0, 0x0

    return v0
.end method

.method public static resetColorEffect()V
    .locals 2

    .line 1418
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1419
    const-string v1, "pref_camera_coloreffect_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1420
    const-string v1, "pref_camera_shader_coloreffect_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1421
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1422
    return-void
.end method

.method public static resetContrast()V
    .locals 2

    .line 2140
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_qc_camera_contrast_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2141
    return-void
.end method

.method public static resetExposure()V
    .locals 2

    .line 925
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 926
    const-string v1, "pref_camera_exposure_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 927
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 928
    return-void
.end method

.method public static resetEyeLight()V
    .locals 2

    .line 2390
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_eye_light_type_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2391
    return-void
.end method

.method public static resetOpenCameraFailTimes()V
    .locals 4

    .line 1104
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1105
    const-string v1, "open_camera_fail_key"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1106
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1107
    return-void
.end method

.method public static resetSaturation()V
    .locals 2

    .line 2136
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_qc_camera_saturation_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2137
    return-void
.end method

.method public static resetSharpness()V
    .locals 2

    .line 2144
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_qc_camera_sharpness_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2145
    return-void
.end method

.method public static resetWhiteBalance()V
    .locals 2

    .line 1425
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1426
    const-string v1, "pref_camera_whitebalance_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1427
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1428
    return-void
.end method

.method public static resetZoom()V
    .locals 2

    .line 947
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 948
    const-string v1, "pref_camera_zoom_key"

    invoke-interface {v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 949
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 950
    return-void
.end method

.method public static retainCameraMode()Z
    .locals 3

    .line 1189
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_retain_camera_mode_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setAiSceneOpen(Z)V
    .locals 2

    .line 1167
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_ai_scene_mode_key"

    .line 1168
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1169
    return-void
.end method

.method public static setBeautyMakeupClicked()V
    .locals 3

    .line 2206
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_beauty_makeup_clicked_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2207
    return-void
.end method

.method public static setBeautyRemodelingClicked()V
    .locals 3

    .line 2198
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_beauty_remodeling_clicked_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2199
    return-void
.end method

.method public static setBroadcastKillServiceTime(J)V
    .locals 2

    .line 2214
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_broadcast_kill_service_key"

    invoke-interface {v0, v1, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2215
    return-void
.end method

.method public static setCurrentLiveMusic(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 2614
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_live_music_path_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2615
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    const-string v0, "pref_live_music_hint_key"

    invoke-interface {p0, v0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2616
    return-void
.end method

.method public static setCurrentLiveSpeed(Ljava/lang/String;)V
    .locals 2

    .line 2643
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_live_speed_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2644
    return-void
.end method

.method public static setCurrentLiveSticker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 2596
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_live_sticker_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2597
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    const-string v0, "pref_live_sticker_name_key"

    invoke-interface {p0, v0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2598
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    const-string p1, "pref_live_sticker_hint_key"

    invoke-interface {p0, p1, p2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2599
    return-void
.end method

.method public static setCustomWB(I)V
    .locals 2

    .line 1431
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1432
    const-string v1, "pref_qc_manual_whitebalance_k_value_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1433
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1434
    return-void
.end method

.method public static setCustomWatermark(Ljava/lang/String;)V
    .locals 2

    .line 2564
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2565
    const-string v1, "pref_custom_watermark"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2566
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2567
    return-void
.end method

.method public static setDualCameraWaterMarkOpen(Z)V
    .locals 2

    .line 1160
    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportedDualCameraWaterMark()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1161
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_dualcamera_watermark"

    .line 1162
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1164
    :cond_0
    return-void
.end method

.method public static setEdgeMode(Landroid/content/Context;Z)V
    .locals 6

    .line 1930
    if-eqz p0, :cond_2

    .line 1931
    if-eqz p1, :cond_0

    .line 1932
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->readEdgePhotoSetting(Landroid/content/Context;)V

    .line 1934
    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isEdgePhotoEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1935
    const-string v0, "input"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/input/InputManager;

    .line 1937
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/hardware/input/InputManager;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 1938
    const-string v3, "switchTouchEdgeMode"

    const-string v5, "(I)V"

    invoke-static {v2, v3, v5}, Lcom/android/camera/Util;->getMethod([Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Method;

    move-result-object v3

    .line 1939
    if-eqz v3, :cond_2

    .line 1940
    aget-object v2, v2, v4

    new-array v5, v1, [Ljava/lang/Object;

    .line 1941
    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getSystemEdgeMode(Landroid/content/Context;)I

    move-result v1

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v5, v4

    .line 1940
    invoke-virtual {v3, v2, v0, v5}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 1945
    :cond_2
    return-void
.end method

.method public static setEyeLight(Ljava/lang/String;)V
    .locals 2

    .line 2402
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    const-string v1, "pref_eye_light_type_key"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/config/DataItemConfig;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2403
    return-void
.end method

.method public static setFaceBeautyLevel(I)V
    .locals 2

    .line 1665
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->beautyLevelToIntelligentValue(I)Ljava/lang/String;

    move-result-object p0

    .line 1666
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautyKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1667
    return-void
.end method

.method public static setFaceBeautyRatio(Ljava/lang/String;I)V
    .locals 2

    .line 1678
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigBeautyBody()Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;

    move-result-object v0

    .line 1680
    invoke-virtual {v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->isBeautyBodyKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1681
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigBeautyBody;->setBeautyBodyValue(Ljava/lang/String;I)V

    goto :goto_0

    .line 1682
    :cond_0
    invoke-static {p0}, Lcom/android/camera/CameraSettings;->isLiveBeautyModeKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1684
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    goto :goto_0

    .line 1686
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-static {p0}, Lcom/android/camera/CameraSettings;->getFaceBeautyRatioKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1688
    :goto_0
    return-void
.end method

.method public static setFaceBeautySwitch(Ljava/lang/String;)V
    .locals 2

    .line 1647
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_face_beauty_switch_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1648
    return-void
.end method

.method public static setFlashMode(ILjava/lang/String;)V
    .locals 1

    .line 1605
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setComponentValue(ILjava/lang/String;)V

    .line 1606
    return-void
.end method

.method public static setFocusMode(Ljava/lang/String;)V
    .locals 2

    .line 1454
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_camera_focus_mode_key"

    .line 1455
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1456
    return-void
.end method

.method public static setFocusModeSwitching(Z)V
    .locals 2

    .line 1476
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_qc_focus_mode_switching_key"

    .line 1477
    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1478
    return-void
.end method

.method public static setFocusPosition(I)V
    .locals 2

    .line 1504
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1505
    const-string v1, "pref_focus_position_key"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1506
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1507
    return-void
.end method

.method public static setFrontMenuUltraPixelPhotographyConfig(Z)V
    .locals 2

    .line 2782
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2783
    const-string v1, "pref_menu_ultra_pixel_photography_front"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2784
    return-void
.end method

.method public static setGoogleLensAvailability(Z)V
    .locals 0

    .line 1253
    sput-boolean p0, Lcom/android/camera/CameraSettings;->sGoolgeLensAvilability:Z

    .line 1254
    return-void
.end method

.method public static setHandGestureStatus(Z)V
    .locals 3

    .line 2817
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_hand_gesture"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2818
    if-eq v0, p0, :cond_0

    .line 2819
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_hand_gesture"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2821
    :cond_0
    return-void
.end method

.method public static setLabOptionsVisible(Z)V
    .locals 2

    .line 2014
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2015
    const-string v1, "pref_camera_lab_option_key_visible"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2016
    return-void
.end method

.method public static setLensDirtyDetectEnable(Z)V
    .locals 2

    .line 2239
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_lens_dirty_detect_enabled_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2240
    return-void
.end method

.method public static setLiveAllSwitchAddValue(I)V
    .locals 2

    .line 2626
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_live_all_switch_add_value"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2627
    return-void
.end method

.method public static setLiveBeautyStatus(Z)V
    .locals 3

    .line 2787
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_beauty_status"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/extra/DataItemLive;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2788
    if-eq v0, p0, :cond_0

    .line 2789
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    const-string v1, "pref_live_beauty_status"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/extra/DataItemLive;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2791
    :cond_0
    return-void
.end method

.method public static setLiveModuleClicked()V
    .locals 3

    .line 2763
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_live_module_clicked"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2764
    return-void
.end method

.method public static setLiveShotOn(Z)V
    .locals 2

    .line 1395
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fC()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1396
    return-void

    .line 1399
    :cond_0
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCameraModule()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1400
    return-void

    .line 1403
    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLiveShot()Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;

    move-result-object v0

    const/16 v1, 0xa3

    .line 1404
    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/ComponentRunningLiveShot;->setLiveShotOn(IZ)V

    .line 1405
    return-void
.end method

.method public static setLiveStickerLastCacheTime(J)V
    .locals 2

    .line 2734
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2735
    const-string v1, "pref_live_sticker_last_cache_time"

    invoke-interface {v0, v1, p0, p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2736
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2737
    return-void
.end method

.method public static setLocalWordsVersion(I)V
    .locals 2

    .line 2579
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_localwords_version"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2580
    return-void
.end method

.method public static setPanoramaMoveDirection(I)V
    .locals 2

    .line 2457
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_panorana_move_direction_key"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2459
    return-void
.end method

.method public static setPopupTipBeautyIntroClicked()V
    .locals 3

    .line 2190
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pref_popup_tip_beauty_intro_clicked_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2191
    return-void
.end method

.method public static setPopupUltraWideIntroClicked()V
    .locals 3

    .line 2755
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v1, "pre_popup_ultra_wide_intro_show_times"

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2756
    return-void
.end method

.method public static setPriorityStoragePreference(Z)V
    .locals 2

    .line 1811
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1812
    const-string v1, "pref_priority_storage"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1813
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1814
    return-void
.end method

.method public static setRearMenuUltraPixelPhotographyConfig(Z)V
    .locals 2

    .line 2777
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2778
    const-string v1, "pref_menu_ultra_pixel_photography_rear"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2779
    return-void
.end method

.method public static setRestoredFlashMode(Ljava/lang/String;)V
    .locals 2

    .line 1613
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1614
    if-nez p0, :cond_0

    .line 1615
    const-string p0, "pref_camera_restored_flashmode_key"

    invoke-interface {v0, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->remove(Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    goto :goto_0

    .line 1617
    :cond_0
    const-string v1, "pref_camera_restored_flashmode_key"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1619
    :goto_0
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1620
    return-void
.end method

.method public static setShaderEffect(I)V
    .locals 5

    .line 1510
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    .line 1512
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentConfigFilter()Lcom/android/camera/data/data/config/ComponentConfigFilter;

    move-result-object v1

    .line 1513
    const-string v2, "CameraSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setShaderEffect: mode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1514
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->setComponentValue(ILjava/lang/String;)V

    .line 1515
    const-string p0, "CameraSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setShaderEffect: getValue = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1516
    return-void
.end method

.method public static setSmartShutterPosition(Ljava/lang/String;)V
    .locals 2

    .line 1443
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1444
    const-string v1, "pref_key_camera_smart_shutter_position"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1445
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1446
    return-void
.end method

.method public static setTTLiveMusicJsonCache(Ljava/lang/String;)V
    .locals 2

    .line 2714
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2715
    const-string v1, "pref_key_tt_live_music_json_cache"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2716
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2717
    return-void
.end method

.method public static setTTLiveStickerJsonCache(Ljava/lang/String;)V
    .locals 2

    .line 2724
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 2725
    const-string v1, "pref_key_tt_live_sticker_json_cache"

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2726
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 2727
    return-void
.end method

.method public static setUltraPixelPhotographyConfig(Z)V
    .locals 2

    .line 2633
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    .line 2634
    const-string v1, "pref_ultra_pixel_photography_enabled"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2635
    return-void
.end method

.method public static setUltraWideConfig(IZ)V
    .locals 1

    .line 2519
    if-eqz p1, :cond_0

    .line 2520
    const-string p1, "ON"

    goto :goto_0

    .line 2522
    :cond_0
    const-string p1, "OFF"

    .line 2524
    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigUltraWide()Lcom/android/camera/data/data/config/ComponentConfigUltraWide;

    move-result-object v0

    .line 2525
    invoke-virtual {v0, p0, p1}, Lcom/android/camera/data/data/config/ComponentConfigUltraWide;->setComponentValue(ILjava/lang/String;)V

    .line 2526
    return-void
.end method

.method public static shouldNormalWideLDCBeVisibleInMode(I)Z
    .locals 2

    .line 2659
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupportNormalWideLDC()Z

    move-result v0

    .line 2660
    const/16 v1, 0xa3

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa5

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa7

    if-eq p0, v1, :cond_0

    .line 2668
    const/4 p0, 0x0

    return p0

    .line 2666
    :cond_0
    return v0
.end method

.method public static shouldShowLensDirtyDetectHint()Z
    .locals 6

    .line 2222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 2223
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 2224
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 2225
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    .line 2226
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v4

    const-string v5, "pref_lens_dirty_detect_date_key"

    invoke-virtual {v4, v5, v0, v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {v3, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 2228
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v3, v0}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-ne v1, v4, :cond_1

    .line 2229
    const/4 v1, 0x2

    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-virtual {v3, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v4, v1, :cond_1

    .line 2230
    const/4 v1, 0x5

    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v3, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v2, v1, :cond_1

    .line 2231
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataNormalItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    const-string v2, "pref_lens_dirty_detect_times_key"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/camera/data/data/config/DataItemConfig;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 2232
    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    return v0

    .line 2234
    :cond_1
    return v0
.end method

.method public static shouldUltraWideLDCBeVisibleInMode(I)Z
    .locals 3

    .line 2676
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->isSupportUltraWideLDC()Z

    move-result v0

    .line 2677
    const/16 v1, 0xa3

    const/4 v2, 0x0

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa5

    if-eq p0, v1, :cond_0

    const/16 v1, 0xa7

    if-eq p0, v1, :cond_0

    const/16 v1, 0xad

    if-eq p0, v1, :cond_0

    .line 2687
    return v2

    .line 2685
    :cond_0
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBackCamera()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v2, 0x1

    nop

    :cond_1
    return v2
.end method

.method public static shouldUltraWideVideoLDCBeVisibleInMode(I)Z
    .locals 0

    .line 2696
    const/4 p0, 0x0

    return p0
.end method

.method public static showGenderAge()Z
    .locals 2

    .line 1218
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_camera_show_gender_age_key"

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static sizeListToStringList(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Size;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 828
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 829
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 830
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Camera$Size;

    .line 831
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "%dx%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, v1, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 832
    goto :goto_0

    .line 833
    :cond_1
    return-object v0
.end method

.method public static updateFocusMode()V
    .locals 3

    .line 1494
    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 1495
    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isManualModule()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFocusPosition()I

    move-result v1

    const/16 v2, 0x3e8

    if-eq v1, v2, :cond_0

    .line 1496
    const-string v1, "manual"

    goto :goto_0

    :cond_0
    const-string v1, "continuous-picture"

    .line 1497
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1498
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->setFocusModeSwitching(Z)V

    .line 1499
    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFocusMode(Ljava/lang/String;)V

    .line 1501
    :cond_1
    return-void
.end method

.method public static updateOpenCameraFailTimes()J
    .locals 5

    .line 1096
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 1097
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v1

    const-string v2, "open_camera_fail_key"

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    .line 1098
    const-string v3, "open_camera_fail_key"

    invoke-interface {v0, v3, v1, v2}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putLong(Ljava/lang/String;J)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 1099
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 1100
    return-wide v1
.end method

.method public static upgradeGlobalPreferences()V
    .locals 11

    .line 837
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    .line 838
    const-string v1, "pref_version_key"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 839
    const/4 v3, 0x4

    if-ge v1, v3, :cond_1

    .line 841
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    .line 842
    invoke-interface {v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 844
    const/4 v4, 0x2

    new-array v4, v4, [I

    fill-array-data v4, :array_0

    .line 846
    array-length v5, v4

    move v6, v2

    :goto_0
    const/4 v7, 0x1

    if-ge v6, v5, :cond_0

    aget v8, v4, v6

    .line 847
    nop

    .line 848
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v9

    .line 849
    invoke-interface {v9, v2, v8}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v10

    invoke-interface {v10}, Lcom/android/camera/data/provider/DataProvider$ProviderEvent;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v10

    .line 850
    invoke-interface {v10}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v10

    invoke-interface {v10}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 852
    nop

    .line 853
    invoke-interface {v9, v7, v8}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(II)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/camera/data/provider/DataProvider$ProviderEvent;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v7

    .line 854
    invoke-interface {v7}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->clear()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 846
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 858
    :cond_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    const-string v2, "pref_version_key"

    invoke-interface {v0, v2, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putInt(Ljava/lang/String;I)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 861
    if-ne v1, v7, :cond_1

    .line 862
    invoke-static {}, Lcom/android/camera/CameraSettings;->deleteObsoletePreferences()V

    .line 865
    :cond_1
    return-void

    :array_0
    .array-data 4
        0x0
        0x1
    .end array-data
.end method

.method public static writeExposure(I)V
    .locals 2

    .line 919
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 920
    const-string v1, "pref_camera_exposure_key"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 921
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 922
    return-void
.end method

.method public static writeFNumber(Ljava/lang/String;)V
    .locals 2

    .line 2587
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    const-string v1, "pref_f_number"

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/data/data/runing/DataItemRunning;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 2588
    return-void
.end method

.method public static writeZoom(F)V
    .locals 2

    .line 941
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/DataItemConfig;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object v0

    .line 942
    const-string v1, "pref_camera_zoom_key"

    invoke-static {p0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v1, p0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putString(Ljava/lang/String;Ljava/lang/String;)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    .line 943
    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    .line 944
    return-void
.end method
