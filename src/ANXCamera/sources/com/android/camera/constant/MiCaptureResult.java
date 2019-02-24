package com.android.camera.constant;

import android.hardware.camera2.CaptureResult.Key;

public class MiCaptureResult {
    public static final Key<float[]> STATISTICS_FACE_AGE = new Key("xiaomi.faceAnalyzeResult.age", float[].class);
    public static final Key<float[]> STATISTICS_FACE_FACESCORE = new Key("xiaomi.faceAnalyzeResult.score", float[].class);
    public static final Key<float[]> STATISTICS_FACE_GENDER = new Key("xiaomi.faceAnalyzeResult.gender", float[].class);
    public static final Key<byte[]> STATISTICS_FACE_INFO = new Key("xiaomi.faceAnalyzeResult.result", byte[].class);
    public static final Key<float[]> STATISTICS_FACE_PROP = new Key("xiaomi.faceAnalyzeResult.prop", float[].class);
    public static final Key<Integer> VIDEO_RECORD_STATE = new Key("xiaomi.video.recordState", Integer.class);
    public static final int VIDEO_RECORD_STATE_IDLE = 2;
    public static final int VIDEO_RECORD_STATE_PROCESS = 1;
}
