package com.mi.config;

import com.android.camera.data.DataRepository;
import java.util.Collections;
import java.util.Map;
import miui.util.FeatureParser;

@Deprecated
/* compiled from: FeatureParserWrapper */
public class d {
    public static final String rY = "is_xiaomi";
    public static final String rZ = "is_hongmi";
    public static final String rg = "camera_supported_asd";
    public static final String rj = "support_zoom_mfnr";
    public static final String sA = "support_camera_4k_quality";
    public static final String sB = "support_camera_ubifocus";
    public static final String sC = "camera_supported_scene";
    public static final String sD = "camera_supported_ai_scene";
    public static final String sE = "support_camera_audio_focus";
    public static final String sF = "is_camera_use_morpho_lib";
    public static final String sG = "is_camera_replace_higher_cost_effect";
    public static final String sH = "support_camera_manual_function";
    public static final String sI = "support_camera_press_down_capture";
    public static final String sJ = "support_camera_torch_capture";
    public static final String sK = "is_camera_freeze_after_hdr_capture";
    public static final String sL = "is_camera_face_detection_need_orientation";
    public static final String sM = "is_camera_hold_blur_background";
    public static final String sN = "support_camera_peaking_mf";
    public static final String sO = "support_camera_gradienter";
    public static final String sP = "is_camera_lower_qrscan_frequency";
    public static final String sQ = "is_camera_preview_with_subthread_looper";
    public static final String sR = "camera_reduce_preview_flag";
    public static final String sS = "camera_focus_success_flag";
    public static final String sT = "camera_exposure_compensation_steps_num";
    public static final String sU = "is_camera_app_water_mark";
    public static final String sV = "support_camera_tilt_shift";
    public static final String sW = "support_camera_magic_mirror";
    public static final String sZ = "support_camera_quick_snap";
    public static final String sb = "is_pad";
    public static final String sc = "vendor";
    public static final String se = "support_dual_sd_card";
    public static final String sf = "support_edge_handgrip";
    public static final String sg = "camera_continuous_shot_callback_class";
    public static final String sh = "camera_continuous_shot_callback_setter";
    public static final String si = "fp_nav_event_name_list";
    public static final String sj = "support_camera_shader_effect";
    public static final String sk = "support_camera_burst_shoot";
    public static final String sl = "support_camera_burst_shoot_denoise";
    public static final String sm = "burst_shoot_count";
    public static final String sn = "support_camera_movie_solid";
    public static final String so = "support_camera_skin_beauty";
    public static final String sp = "support_camera_age_detection";
    public static final String sq = "support_camera_record_location";
    public static final String sr = "support_camera_water_mark";
    public static final String ss = "support_camera_new_style_time_water_mark";
    public static final String st = "support_camera_video_pause";
    public static final String su = "support_camera_boost_brightness";
    public static final String sv = "is_lower_size_effect";
    public static final String sw = "support_camera_aohdr";
    public static final String sx = "support_camera_hfr";
    public static final String sy = "support_chroma_flash";
    public static final String sz = "support_object_track";
    public static final String tA = "is_support_optical_zoom";
    public static final String tB = "is_support_portrait";
    public static final String tC = "camera_is_support_portrait_front";
    public static final String tD = "is_support_fhd_fhr";
    public static final String tE = "is_rgb888_egl_prefer";
    public static final String tF = "is_legacy_face_beauty";
    public static final String tG = "use_legacy_normal_filter";
    public static final String tH = "camera_hibernation_timeout_in_minutes";
    public static final String tI = "support_front_hht_enhance";
    public static final String tJ = "support_screen_light";
    public static final String tK = "support_parallel_process";
    public static final String tL = "support_psensor_pocket_mode";
    public static final String tM = "support_front_beauty_mfnr";
    public static final String tN = "support_video_hfr_mode";
    public static final String tO = "support_3d_face_beauty";
    public static final String tP = "support_mi_face_beauty";
    public static final String tQ = "support_lens_dirty_detect";
    public static final String tR = "enable_algorithm_in_file_suffix";
    public static final String tS = "support_camera_dynamic_light_spot";
    public static final String tT = "support_super_resolution";
    public static final String tU = "support_realtime_manual_exposure_time";
    public static final String tV = "support_picture_watermark";
    public static final String tW = "sensor_has_latency";
    private static final Map<String, String> tX = Collections.unmodifiableMap(new FeatureParserWrapper$1());
    public static final String ta = "camera_front_count_down_margin";
    public static final String tb = "support_camera_groupshot";
    public static final String tc = "is_full_size_effect";
    public static final String td = "support_camera_face_info_water_mark";
    public static final String te = "support_camera_square_mode";
    public static final String tf = "is_camera_use_still_effect_image";
    public static final String tg = "support_front_flash";
    public static final String th = "support_video_front_flash";
    public static final String ti = "is_camera_isp_rotated";
    public static final String tj = "support_full_size_panorama";
    public static final String tk = "support_hfr_video_pause";
    public static final String tl = "is_front_remosic_sensor";
    public static final String tm = "front_fingerprint_sensor";
    public static final String tn = "cmcc_strategic_phone";
    public static final String to = "is_need_force_recycle_effect";
    public static final String tp = "is_18x9_ratio_screen";
    public static final String tq = "camera_extra_picture_size";
    public static final String tr = "is_support_tele_asd_night";
    public static final String ts = "is_front_video_quality_1080p";
    public static final String tt = "is_capture_stop_face_detection";
    public static final String tu = "is_video_snapshot_size_limit";
    public static final String tv = "is_surface_size_limit";
    public static final String tw = "is_hal_does_caf_when_flash_on";
    public static final String tx = "is_new_hdr_param_key_used";
    public static final String ty = "is_hrf_video_capture_support";
    public static final String tz = "is_support_stereo";

    private static String C(String str) {
        return (String) tX.get(str);
    }

    public static boolean getBoolean(String str, boolean z) {
        String C = C(str);
        if (C == null || !DataRepository.dataItemFeature().B(C)) {
            return FeatureParser.getBoolean(str, z);
        }
        return DataRepository.dataItemFeature().getBoolean(C, z);
    }

    public static String getString(String str) {
        String C = C(str);
        if (C == null || !DataRepository.dataItemFeature().B(C)) {
            return FeatureParser.getString(str);
        }
        return DataRepository.dataItemFeature().getString(C, "N/A");
    }

    public static int getInteger(String str, int i) {
        String C = C(str);
        if (C == null || !DataRepository.dataItemFeature().B(C)) {
            return FeatureParser.getInteger(str, i);
        }
        return DataRepository.dataItemFeature().getInt(C, i);
    }

    public static Float getFloat(String str, float f) {
        String C = C(str);
        if (C == null || !DataRepository.dataItemFeature().B(C)) {
            return FeatureParser.getFloat(str, f);
        }
        return Float.valueOf(DataRepository.dataItemFeature().getFloat(C, f));
    }

    public static String[] getStringArray(String str) {
        return FeatureParser.getStringArray(str);
    }
}
