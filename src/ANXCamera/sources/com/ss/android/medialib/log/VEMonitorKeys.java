package com.ss.android.medialib.log;

import android.support.v4.util.ArraySet;
import java.util.Set;

public class VEMonitorKeys {
    public static final String IESMMTRACKER_KEY_AUDIO_DECODE_AVERAGE_TIME = "iesve_audio_decode_average_time";
    public static final String IESMMTRACKER_KEY_AUDIO_DECODE_MODE = "iesve_audio_decode_mode";
    public static final String IESMMTRACKER_KEY_COMPLETE = "completed";
    public static final String IESMMTRACKER_KEY_COMPOSITION_AUDIO_DECODE_MODE = "iesve_composition_audio_decode_mode";
    public static final String IESMMTRACKER_KEY_COMPOSITION_AUDIO_DECODE_TIME = "iesve_composition_audio_decode_time";
    public static final String IESMMTRACKER_KEY_COMPOSITION_AUDIO_ENCODE_MODE = "iesve_composition_audio_encode_mode";
    public static final String IESMMTRACKER_KEY_COMPOSITION_AUDIO_ENCODE_TIME = "iesve_composition_audio_encode_time";
    public static final String IESMMTRACKER_KEY_COMPOSITION_BIT_RATE = "iesve_composition_bit_rate";
    public static final String IESMMTRACKER_KEY_COMPOSITION_FILE_DURATION = "iesve_composition_file_duration";
    public static final String IESMMTRACKER_KEY_COMPOSITION_FILE_SIZE = "iesve_composition_file_size";
    public static final String IESMMTRACKER_KEY_COMPOSITION_FPS = "iesve_composition_fps";
    public static final String IESMMTRACKER_KEY_COMPOSITION_RESOLUTION = "iesve_composition_resolution";
    public static final String IESMMTRACKER_KEY_COMPOSITION_TIME = "iesve_composition_time";
    public static final String IESMMTRACKER_KEY_COMPOSITION_VIDEO_DECODE_MODE = "iesve_composition_video_decode_mode";
    public static final String IESMMTRACKER_KEY_COMPOSITION_VIDEO_DECODE_TIME = "iesve_composition_video_decode_time";
    public static final String IESMMTRACKER_KEY_COMPOSITION_VIDEO_ENCODE_MODE = "iesve_composition_video_encode_mode";
    public static final String IESMMTRACKER_KEY_COMPOSITION_VIDEO_ENCODE_TIME = "iesve_composition_video_encode_time";
    public static final String IESMMTRACKER_KEY_IMPORT_CROP_FILE_BITRATE = "iesve_import_crop_file_bitrate";
    public static final String IESMMTRACKER_KEY_IMPORT_CROP_FILE_DURATION = "iesve_import_crop_file_duration";
    public static final String IESMMTRACKER_KEY_IMPORT_CROP_FILE_RESOLUTION = "iesve_import_crop_file_resolution";
    public static final String IESMMTRACKER_KEY_IMPORT_CROP_TIME = "iesve_import_crop_time";
    public static final String IESMMTRACKER_KEY_IMPORT_GENERATE_THUMBNAIL_TIME = "iesve_import_generate_thumbnail_time";
    public static final String IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_BITRATE = "iesve_import_source_file_bitrate";
    public static final String IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_DURATION = "iesve_import_source_file_duration";
    public static final String IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_RESOLUTION = "iesve_import_source_file_resolution";
    public static final String IESMMTRACKER_KEY_RECORD_AUDIO_ENCODE_MODE = "iesve_record_audio_encode_mode";
    public static final String IESMMTRACKER_KEY_RECORD_CAMERA_FRAME_RATE = "iesve_record_camera_frame_rate";
    public static final String IESMMTRACKER_KEY_RECORD_CAMERA_HW_LEVEL = "iesve_record_camera_hw_level";
    public static final String IESMMTRACKER_KEY_RECORD_CAMERA_TYPE = "iesve_record_camera_type";
    public static final String IESMMTRACKER_KEY_RECORD_CONCAT_TIME = "iesve_record_concat_time";
    public static final String IESMMTRACKER_KEY_RECORD_FPS = "iesve_record_frame_rate";
    public static final String IESMMTRACKER_KEY_RECORD_MEDIACODEC_PROFILE = "iesve_record_mediacodec_profile";
    public static final String IESMMTRACKER_KEY_RECORD_PREVIEW_FRAME_RATE = "iesve_record_preview_frame_rate";
    public static final String IESMMTRACKER_KEY_RECORD_RENDER_AVERAGE_TIME = "iesve_record_render_average_time";
    public static final String IESMMTRACKER_KEY_RECORD_RESOLUTION = "iesve_record_resolution";
    public static final String IESMMTRACKER_KEY_RECORD_START_TIME = "iesve_record_start_time";
    public static final String IESMMTRACKER_KEY_RECORD_STOP_TIME = "iesve_record_stop_time";
    public static final String IESMMTRACKER_KEY_RECORD_SWITCH_CAMERA_TIME = "iesve_record_switch_camera_time";
    public static final String IESMMTRACKER_KEY_RECORD_VIDEO_ENCODE_MODE = "iesve_record_video_encode_mode";
    public static final String IESMMTRACKER_KEY_RECORD_VIDEO_ENCODE_TYPE = "iesve_record_video_encode_type";
    public static final String IESMMTRACKER_KEY_RECORD_VIDEO_FRAME_ENCODE_TIME = "iesve_record_video_frame_encode_time";
    public static final String IESMMTRACKER_KEY_RECORD_VIDEO_PREVIEW_RESOLUTION = "iesve_record_video_preview_resolution";
    public static final String IESMMTRACKER_KEY_VIDEO_DECODE_AVERAGE_TIME = "iesve_video_decode_average_time";
    public static final String IESMMTRACKER_KEY_VIDEO_DECODE_MODE = "iesve_video_decode_mode";
    public static final String LOG_TYPE = "sdk_video_edit_compose";
    public static int TYPE_DOUBLE = 2;
    public static int TYPE_INT = 1;
    public static int TYPE_STRING = 0;
    private static Set<String> sDoubleKeys = new ArraySet();
    private static Set<String> sIntKeys = new ArraySet();
    private static Set<String> sStringKeys = new ArraySet();

    static {
        sIntKeys.add(IESMMTRACKER_KEY_RECORD_VIDEO_ENCODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_RECORD_AUDIO_ENCODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_VIDEO_DECODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_AUDIO_DECODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_COMPOSITION_VIDEO_ENCODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_COMPOSITION_VIDEO_DECODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_COMPOSITION_AUDIO_ENCODE_MODE);
        sIntKeys.add(IESMMTRACKER_KEY_COMPOSITION_AUDIO_DECODE_MODE);
        sIntKeys.add("completed");
        sIntKeys.add(IESMMTRACKER_KEY_RECORD_CAMERA_TYPE);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_FPS);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_VIDEO_FRAME_ENCODE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_START_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_STOP_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_SWITCH_CAMERA_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_RENDER_AVERAGE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_PREVIEW_FRAME_RATE);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_CAMERA_FRAME_RATE);
        sDoubleKeys.add(IESMMTRACKER_KEY_VIDEO_DECODE_AVERAGE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_AUDIO_DECODE_AVERAGE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_FPS);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_BIT_RATE);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_FILE_DURATION);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_FILE_SIZE);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_VIDEO_ENCODE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_AUDIO_ENCODE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_VIDEO_DECODE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_COMPOSITION_AUDIO_DECODE_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_GENERATE_THUMBNAIL_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_CROP_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_CROP_FILE_DURATION);
        sDoubleKeys.add(IESMMTRACKER_KEY_RECORD_CONCAT_TIME);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_BITRATE);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_CROP_FILE_BITRATE);
        sDoubleKeys.add(IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_DURATION);
        sStringKeys.add(IESMMTRACKER_KEY_RECORD_RESOLUTION);
        sStringKeys.add(IESMMTRACKER_KEY_RECORD_VIDEO_ENCODE_TYPE);
        sStringKeys.add(IESMMTRACKER_KEY_RECORD_VIDEO_PREVIEW_RESOLUTION);
        sStringKeys.add(IESMMTRACKER_KEY_COMPOSITION_RESOLUTION);
        sStringKeys.add(IESMMTRACKER_KEY_IMPORT_SOURCE_FILE_RESOLUTION);
        sStringKeys.add(IESMMTRACKER_KEY_IMPORT_CROP_FILE_RESOLUTION);
    }

    public static int getType(String str) {
        if (sIntKeys.contains(str)) {
            return TYPE_INT;
        }
        if (sDoubleKeys.contains(str)) {
            return TYPE_DOUBLE;
        }
        return TYPE_STRING;
    }
}
