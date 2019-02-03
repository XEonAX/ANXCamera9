.class public Lcom/android/camera/backup/CameraBackupSettings;
.super Ljava/lang/Object;
.source "CameraBackupSettings.java"


# static fields
.field private static final KEY_ANTIBANDING:Ljava/lang/String; = "camera_antibanding"

.field private static final KEY_AUTOEXPOSURE:Ljava/lang/String; = "camera_autoexposure"

.field private static final KEY_AUTO_CHROMA_FLASH:Ljava/lang/String; = "auto_chroma_flash"

.field private static final KEY_BEAUTIFY_ENLARGE_EYE_RATIO:Ljava/lang/String; = "beautify_enlarge_eye_ratio"

.field private static final KEY_BEAUTIFY_SKIN_COLOR_RATIO:Ljava/lang/String; = "beautify_skin_color_ratio"

.field private static final KEY_BEAUTIFY_SKIN_SMOOTH_RATIO:Ljava/lang/String; = "beautify_skin_smooth_ratio"

.field private static final KEY_BEAUTIFY_SLIM_FACE_RATIO:Ljava/lang/String; = "beautify_slim_face_ratio"

.field private static final KEY_CAMERA_ASD_NIGHT:Ljava/lang/String; = "camera_asd_night"

.field private static final KEY_CAMERA_GROUPSHOT_PRIMITIVE:Ljava/lang/String; = "groupshot_with_primitive_picture"

.field private static final KEY_CAMERA_PROXIMITY_LOCK:Ljava/lang/String; = "camera_proximity_lock"

.field private static final KEY_CAMERA_SNAP:Ljava/lang/String; = "camera_snap"

.field private static final KEY_CAMERA_SOUND:Ljava/lang/String; = "camerasound"

.field private static final KEY_CAMERA_USER_WATERMARK:Ljava/lang/String; = "camera_user_watermark"

.field private static final KEY_CAPTURE_WHEN_STABLE:Ljava/lang/String; = "capture_when_stable"

.field private static final KEY_DUALCAMERA_WATERMARK:Ljava/lang/String; = "dualcamera_watermark"

.field private static final KEY_FACE_BEAUTY:Ljava/lang/String; = "camera_face_beauty"

.field private static final KEY_FACE_BEAUTY_SWITCH:Ljava/lang/String; = "camera_face_beauty_switch"

.field private static final KEY_FACE_DETECTION:Ljava/lang/String; = "camera_facedetection"

.field private static final KEY_FINGERPRINT_CAPTURE:Ljava/lang/String; = "fingerprint_capture"

.field private static final KEY_FOCUS_SHOOT:Ljava/lang/String; = "camera_focus_shoot"

.field private static final KEY_FRONT_MIRROR:Ljava/lang/String; = "front_mirror"

.field private static final KEY_JPEG_QUALITY:Ljava/lang/String; = "camera_jpegquality"

.field private static final KEY_LONG_PRESS_SHUTTER:Ljava/lang/String; = "camera_long_press_shutter"

.field private static final KEY_LONG_PRESS_SHUTTER_FEATURE:Ljava/lang/String; = "camera_long_press_shutter_feature"

.field private static final KEY_MOVIE_SOLID:Ljava/lang/String; = "camera_movie_solid"

.field private static final KEY_PICTURE_SIZE:Ljava/lang/String; = "camera_picturesize"

.field private static final KEY_PRIORITY_STORAGE:Ljava/lang/String; = "priority_storage"

.field private static final KEY_QC_CONTRAST:Ljava/lang/String; = "qc_camera_contrast"

.field private static final KEY_QC_EXPOSURETIME:Ljava/lang/String; = "qc_camera_exposuretime"

.field private static final KEY_QC_FOCUS_POSITION:Ljava/lang/String; = "focus_position"

.field private static final KEY_QC_ISO:Ljava/lang/String; = "qc_camera_iso"

.field private static final KEY_QC_MANUAL_WHITEBALANCE_VALUE:Ljava/lang/String; = "qc_manual_whitebalance_k_value"

.field private static final KEY_QC_SATURATION:Ljava/lang/String; = "qc_camera_saturation"

.field private static final KEY_QC_SHARPNESS:Ljava/lang/String; = "qc_camera_sharpness"

.field private static final KEY_RECORD_LOCATION:Ljava/lang/String; = "camera_recordlocation"

.field private static final KEY_REFERENCE_LINE:Ljava/lang/String; = "camera_referenceline"

.field private static final KEY_RETAIN_CAMERA_MODE:Ljava/lang/String; = "retain_camera_mode"

.field private static final KEY_SCAN_QRCODE:Ljava/lang/String; = "scan_qrcode"

.field private static final KEY_TIME_WATERMARK:Ljava/lang/String; = "watermark"

.field private static final KEY_VERSION:Ljava/lang/String; = "version"

.field private static final KEY_VIDEO_ENCODER:Ljava/lang/String; = "video_encoder"

.field private static final KEY_VIDEO_FOCUS_MODE:Ljava/lang/String; = "video_focusmode"

.field private static final KEY_VIDEO_HIGH_FRAME_RATE:Ljava/lang/String; = "video_hfr"

.field private static final KEY_VIDEO_QUALITY:Ljava/lang/String; = "video_quality"

.field private static final KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL:Ljava/lang/String; = "video_time_lapse_frame_interval"

.field private static final KEY_VOLUME_CAMERA_FUNCTION:Ljava/lang/String; = "camera_volumekey_function"

.field private static final KEY_VOLUME_LIVE_FUNCTION:Ljava/lang/String; = "live_volumekey_function"

.field private static final KEY_VOLUME_VIDEO_FUNCTION:Ljava/lang/String; = "video_volumekey_function"

.field private static final KEY_WHITE_BALANCE:Ljava/lang/String; = "camera_whitebalance"

.field static final PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 63
    const/16 v0, 0x30

    new-array v0, v0, [Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    const-string v1, "version"

    const-string v2, "pref_version_key"

    .line 64
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "camera_recordlocation"

    const-string v2, "pref_camera_recordlocation_key"

    .line 67
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "camerasound"

    const-string v2, "pref_camerasound_key"

    .line 68
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string v1, "camera_proximity_lock"

    const-string v2, "pref_camera_proximity_lock_key"

    .line 69
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string v1, "priority_storage"

    const-string v2, "pref_priority_storage"

    .line 70
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string v1, "retain_camera_mode"

    const-string v2, "pref_retain_camera_mode_key"

    .line 71
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string v1, "camera_snap"

    const-string v2, "pref_camera_snap_key"

    .line 72
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string v1, "capture_when_stable"

    const-string v2, "pref_capture_when_stable_key"

    .line 75
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "watermark"

    const-string v2, "pref_watermark_key"

    .line 76
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const-string v1, "dualcamera_watermark"

    const-string v2, "pref_dualcamera_watermark"

    .line 77
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const-string v1, "camera_user_watermark"

    const-string v2, "user_define_watermark"

    .line 78
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xa

    aput-object v1, v0, v2

    const-string v1, "auto_chroma_flash"

    const-string v2, "pref_auto_chroma_flash_key"

    .line 79
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xb

    aput-object v1, v0, v2

    const-string v1, "camera_referenceline"

    const-string v2, "pref_camera_referenceline_key"

    .line 80
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xc

    aput-object v1, v0, v2

    const-string v1, "camera_focus_shoot"

    const-string v2, "pref_camera_focus_shoot_key"

    .line 81
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const-string v1, "scan_qrcode"

    const-string v2, "pref_scan_qrcode_key"

    .line 82
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xe

    aput-object v1, v0, v2

    const-string v1, "camera_asd_night"

    const-string v2, "pref_camera_asd_night_key"

    .line 83
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0xf

    aput-object v1, v0, v2

    const-string v1, "groupshot_with_primitive_picture"

    const-string v2, "pref_groupshot_with_primitive_picture_key"

    .line 84
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x10

    aput-object v1, v0, v2

    const-string v1, "camera_long_press_shutter"

    const-string v2, "pref_camera_long_press_shutter_key"

    .line 85
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x11

    aput-object v1, v0, v2

    const-string v1, "camera_long_press_shutter_feature"

    const-string v2, "pref_camera_long_press_shutter_feature_key"

    .line 86
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x12

    aput-object v1, v0, v2

    const-string v1, "front_mirror"

    const-string v2, "pref_front_mirror_key"

    .line 87
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x13

    aput-object v1, v0, v2

    const-string v1, "camera_picturesize"

    const-string v2, "pref_camera_picturesize_key"

    .line 88
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x14

    aput-object v1, v0, v2

    const-string v1, "camera_jpegquality"

    const-string v2, "pref_camera_jpegquality_key"

    .line 89
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x15

    aput-object v1, v0, v2

    const-string v1, "camera_movie_solid"

    const-string v2, "pref_camera_movie_solid_key"

    .line 92
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x16

    aput-object v1, v0, v2

    const-string v1, "video_quality"

    const-string v2, "pref_video_quality_key"

    .line 93
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x17

    aput-object v1, v0, v2

    const-string v1, "video_encoder"

    const-string v2, "pref_video_encoder_key"

    .line 94
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x18

    aput-object v1, v0, v2

    const-string v1, "video_hfr"

    const-string v2, "pref_video_hfr_key"

    .line 95
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x19

    aput-object v1, v0, v2

    const-string v1, "video_time_lapse_frame_interval"

    const-string v2, "pref_video_time_lapse_frame_interval_key"

    .line 96
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    const-string v1, "camera_facedetection"

    const-string v2, "pref_camera_facedetection_key"

    .line 99
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    const-string v1, "fingerprint_capture"

    const-string v2, "pref_fingerprint_capture_key"

    .line 100
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createBoolEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    const-string v1, "camera_volumekey_function"

    const-string v2, "pref_camera_volumekey_function_key"

    .line 101
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    const-string v1, "video_volumekey_function"

    const-string v2, "pref_video_volumekey_function_key"

    .line 102
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    const-string v1, "live_volumekey_function"

    const-string v2, "pref_live_volumekey_function_key"

    .line 103
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    const-string v1, "camera_antibanding"

    const-string v2, "pref_camera_antibanding_key"

    .line 104
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x20

    aput-object v1, v0, v2

    const-string v1, "camera_autoexposure"

    const-string v2, "pref_camera_autoexposure_key"

    .line 105
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x21

    aput-object v1, v0, v2

    const-string v1, "qc_camera_contrast"

    const-string v2, "pref_qc_camera_contrast_key"

    .line 106
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x22

    aput-object v1, v0, v2

    const-string v1, "qc_camera_saturation"

    const-string v2, "pref_qc_camera_saturation_key"

    .line 107
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x23

    aput-object v1, v0, v2

    const-string v1, "qc_camera_sharpness"

    const-string v2, "pref_qc_camera_sharpness_key"

    .line 108
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x24

    aput-object v1, v0, v2

    const-string v1, "camera_whitebalance"

    const-string v2, "pref_camera_whitebalance_key"

    .line 111
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x25

    aput-object v1, v0, v2

    const-string v1, "focus_position"

    const-string v2, "pref_focus_position_key"

    .line 112
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x26

    aput-object v1, v0, v2

    const-string v1, "qc_camera_exposuretime"

    const-string v2, "pref_qc_camera_exposuretime_key"

    .line 113
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x27

    aput-object v1, v0, v2

    const-string v1, "qc_camera_iso"

    const-string v2, "pref_qc_camera_iso_key"

    .line 114
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x28

    aput-object v1, v0, v2

    const-string v1, "qc_manual_whitebalance_k_value"

    const-string v2, "pref_qc_manual_whitebalance_k_value_key"

    .line 115
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x29

    aput-object v1, v0, v2

    const-string v1, "camera_face_beauty"

    const-string v2, "pref_camera_face_beauty_key"

    .line 118
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    const-string v1, "camera_face_beauty_switch"

    const-string v2, "pref_camera_face_beauty_switch_key"

    .line 119
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createStringEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    const-string v1, "beautify_slim_face_ratio"

    const-string v2, "pref_beautify_slim_face_ratio_key"

    .line 120
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    const-string v1, "beautify_skin_smooth_ratio"

    const-string v2, "pref_beautify_skin_smooth_ratio_key"

    .line 121
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    const-string v1, "beautify_skin_color_ratio"

    const-string v2, "pref_beautify_skin_color_ratio_key"

    .line 122
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2e

    aput-object v1, v0, v2

    const-string v1, "beautify_enlarge_eye_ratio"

    const-string v2, "pref_beautify_enlarge_eye_ratio_key"

    .line 123
    invoke-static {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;->createIntEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    move-result-object v1

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/camera/backup/CameraBackupSettings;->PREF_ENTRIES:[Lcom/xiaomi/settingsdk/backup/data/PrefsBackupHelper$PrefEntry;

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
