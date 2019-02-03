package com.ss.android.ttve.monitor;

import android.support.v4.util.ArraySet;
import java.util.Set;

public class TEMonitorKeys {
    public static final String LOG_TYPE = "sdk_video_edit_compose";
    public static final String TETRACKER_DEVICE_INFO_PREFIX = "te_device_info_";
    public static final String TETRACKER_KEY_AUDIO_DECODE_AVERAGE_TIME = "te_audio_decode_average_time";
    public static final String TETRACKER_KEY_AUDIO_DECODE_MODE = "te_audio_decode_mode";
    public static final String TETRACKER_KEY_COMPLETE = "completed";
    public static final String TETRACKER_KEY_COMPOSITION_AUDIO_DECODE_MODE = "te_composition_audio_decode_mode";
    public static final String TETRACKER_KEY_COMPOSITION_AUDIO_DECODE_TIME = "te_composition_audio_decode_time";
    public static final String TETRACKER_KEY_COMPOSITION_AUDIO_ENCODE_MODE = "te_composition_audio_encode_mode";
    public static final String TETRACKER_KEY_COMPOSITION_AUDIO_ENCODE_TIME = "te_composition_audio_encode_time";
    public static final String TETRACKER_KEY_COMPOSITION_BIT_RATE = "te_composition_bit_rate";
    public static final String TETRACKER_KEY_COMPOSITION_FILE_DURATION = "te_composition_file_duration";
    public static final String TETRACKER_KEY_COMPOSITION_FILE_SIZE = "te_composition_file_size";
    public static final String TETRACKER_KEY_COMPOSITION_FPS = "te_composition_fps";
    public static final String TETRACKER_KEY_COMPOSITION_RESOLUTION = "te_composition_resolution";
    public static final String TETRACKER_KEY_COMPOSITION_TIME = "te_composition_time";
    public static final String TETRACKER_KEY_COMPOSITION_VIDEO_DECODE_MODE = "te_composition_video_decode_mode";
    public static final String TETRACKER_KEY_COMPOSITION_VIDEO_DECODE_TIME = "te_composition_video_decode_time";
    public static final String TETRACKER_KEY_COMPOSITION_VIDEO_ENCODE_MODE = "te_composition_video_encode_mode";
    public static final String TETRACKER_KEY_COMPOSITION_VIDEO_ENCODE_TIME = "te_composition_video_encode_time";
    public static final String TETRACKER_KEY_IMPORT_CROP_FILE_BITRATE = "te_import_crop_file_bitrate";
    public static final String TETRACKER_KEY_IMPORT_CROP_FILE_DURATION = "te_import_crop_file_duration";
    public static final String TETRACKER_KEY_IMPORT_CROP_FILE_RESOLUTION = "te_import_crop_file_resolution";
    public static final String TETRACKER_KEY_IMPORT_CROP_TIME = "te_import_crop_time";
    public static final String TETRACKER_KEY_IMPORT_GENERATE_THUMBNAIL_TIME = "te_import_generate_thumbnail_time";
    public static final String TETRACKER_KEY_IMPORT_SOURCE_FILE_BITRATE = "te_import_source_file_bitrate";
    public static final String TETRACKER_KEY_IMPORT_SOURCE_FILE_DURATION = "te_import_source_file_duration";
    public static final String TETRACKER_KEY_IMPORT_SOURCE_FILE_RESOLUTION = "te_import_source_file_resolution";
    public static final String TETRACKER_KEY_RECORD_AUDIO_ENCODE_MODE = "te_record_audio_encode_mode";
    public static final String TETRACKER_KEY_RECORD_CAMERA_FRAME_RATE = "te_record_camera_frame_rate";
    public static final String TETRACKER_KEY_RECORD_CAMERA_TYPE = "te_record_camera_type";
    public static final String TETRACKER_KEY_RECORD_CONCAT_TIME = "te_record_concat_time";
    public static final String TETRACKER_KEY_RECORD_FPS = "te_record_frame_rate";
    public static final String TETRACKER_KEY_RECORD_PREVIEW_FRAME_RATE = "te_record_preview_frame_rate";
    public static final String TETRACKER_KEY_RECORD_RENDER_AVERAGE_TIME = "te_record_render_average_time";
    public static final String TETRACKER_KEY_RECORD_RESOLUTION = "te_record_resolution";
    public static final String TETRACKER_KEY_RECORD_START_TIME = "te_record_start_time";
    public static final String TETRACKER_KEY_RECORD_STOP_TIME = "te_record_stop_time";
    public static final String TETRACKER_KEY_RECORD_SWITCH_CAMERA_TIME = "te_record_switch_camera_time";
    public static final String TETRACKER_KEY_RECORD_VIDEO_ENCODE_MODE = "te_record_video_encode_mode";
    public static final String TETRACKER_KEY_RECORD_VIDEO_ENCODE_TYPE = "te_record_video_encode_type";
    public static final String TETRACKER_KEY_RECORD_VIDEO_FRAME_ENCODE_TIME = "te_record_video_frame_encode_time";
    public static final String TETRACKER_KEY_RECORD_VIDEO_PREVIEW_RESOLUTION = "te_record_video_preview_resolution";
    public static final String TETRACKER_KEY_VIDEO_DECODE_AVERAGE_TIME = "te_video_decode_average_time";
    public static final String TETRACKER_KEY_VIDEO_DECODE_MODE = "te_video_decode_mode";
    public static int TYPE_DOUBLE = 2;
    public static int TYPE_INT = 1;
    public static int TYPE_STRING = 0;
    private static Set<String> sDoubleKeys = new ArraySet();
    private static Set<String> sIntKeys = new ArraySet();
    private static Set<String> sStringKeys = new ArraySet();

    static {
        sIntKeys.add(TETRACKER_KEY_RECORD_VIDEO_ENCODE_MODE);
        sIntKeys.add(TETRACKER_KEY_RECORD_AUDIO_ENCODE_MODE);
        sIntKeys.add(TETRACKER_KEY_VIDEO_DECODE_MODE);
        sIntKeys.add(TETRACKER_KEY_AUDIO_DECODE_MODE);
        sIntKeys.add(TETRACKER_KEY_COMPOSITION_VIDEO_ENCODE_MODE);
        sIntKeys.add(TETRACKER_KEY_COMPOSITION_VIDEO_DECODE_MODE);
        sIntKeys.add(TETRACKER_KEY_COMPOSITION_AUDIO_ENCODE_MODE);
        sIntKeys.add(TETRACKER_KEY_COMPOSITION_AUDIO_DECODE_MODE);
        sIntKeys.add("completed");
        sIntKeys.add(TETRACKER_KEY_RECORD_CAMERA_TYPE);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_FPS);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_VIDEO_FRAME_ENCODE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_START_TIME);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_STOP_TIME);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_SWITCH_CAMERA_TIME);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_RENDER_AVERAGE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_PREVIEW_FRAME_RATE);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_CAMERA_FRAME_RATE);
        sDoubleKeys.add(TETRACKER_KEY_VIDEO_DECODE_AVERAGE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_AUDIO_DECODE_AVERAGE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_FPS);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_BIT_RATE);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_FILE_DURATION);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_FILE_SIZE);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_TIME);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_VIDEO_ENCODE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_AUDIO_ENCODE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_VIDEO_DECODE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_COMPOSITION_AUDIO_DECODE_TIME);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_GENERATE_THUMBNAIL_TIME);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_CROP_TIME);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_CROP_FILE_DURATION);
        sDoubleKeys.add(TETRACKER_KEY_RECORD_CONCAT_TIME);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_SOURCE_FILE_BITRATE);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_CROP_FILE_BITRATE);
        sDoubleKeys.add(TETRACKER_KEY_IMPORT_SOURCE_FILE_DURATION);
        sStringKeys.add(TETRACKER_KEY_RECORD_RESOLUTION);
        sStringKeys.add(TETRACKER_KEY_RECORD_VIDEO_ENCODE_TYPE);
        sStringKeys.add(TETRACKER_KEY_RECORD_VIDEO_PREVIEW_RESOLUTION);
        sStringKeys.add(TETRACKER_KEY_COMPOSITION_RESOLUTION);
        sStringKeys.add(TETRACKER_KEY_IMPORT_SOURCE_FILE_RESOLUTION);
        sStringKeys.add(TETRACKER_KEY_IMPORT_CROP_FILE_RESOLUTION);
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
