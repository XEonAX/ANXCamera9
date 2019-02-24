package com.ss.android.medialib.listener;

public interface FaceDetectListener {
    public static final int DETECT_TYPE_FACE = 0;
    public static final int DETECT_TYPE_HAND = 1;

    void onResult(int i, int i2);
}
