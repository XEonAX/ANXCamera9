package com.xiaomi.camera.core;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class ShotConstant {
    public static final int ALGO_CLEAR_SHOT = 2;
    public static final int ALGO_HDR = 1;
    public static final int DISPATCH_ALL = 3;
    public static final int DISPATCH_MAIN = 1;
    public static final int DISPATCH_SUB = 2;
    public static final int RESULT_IMAGE_DEPTH = 3;
    public static final int RESULT_IMAGE_NORMAL = 1;
    public static final int RESULT_IMAGE_RAW = 2;
    public static final int TYPE_BURST = 3;
    public static final int TYPE_INTENT_NORMAL_SINGLE = -2;
    public static final int TYPE_LIVE_SHOT = 1;
    public static final int TYPE_NORMAL_DUAL = 2;
    public static final int TYPE_NORMAL_SINGLE = 0;
    public static final int TYPE_PARALLEL_DUAL = 6;
    public static final int TYPE_PARALLEL_SEQUENCE = 7;
    public static final int TYPE_PARALLEL_SINGLE = 5;
    public static final int TYPE_PREVIEW_SHOT = -1;
    public static final int TYPE_VIDEO_SHOT = 4;

    @Retention(RetentionPolicy.SOURCE)
    public @interface DispatchType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ParallelAlgo {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ResultImage {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ShotType {
    }

    public static final boolean isParallelEnabled(int i) {
        return i == 5 || i == 6 || i == 7;
    }
}
