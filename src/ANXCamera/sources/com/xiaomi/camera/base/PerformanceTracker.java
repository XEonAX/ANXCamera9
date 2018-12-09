package com.xiaomi.camera.base;

import android.util.Log;

public class PerformanceTracker {
    public static final int END = 1;
    private static final String END_TAG = "[  END]";
    private static final String EVENT_ALGORITHM_PROCESS = "[AlgorithmProcess]";
    private static final String EVENT_IMAGE_SAVER = "[      ImageSaver]";
    private static final String EVENT_JPEG_REPROCESS = "[   JpegReprocess]";
    private static final String EVENT_PICTURE_CAPTURE = "[    PictureTaken]";
    public static final int START = 0;
    private static final String START_TAG = "[START]";
    private static final String TAG = "[PERFORMANCE]";
    private static final boolean isEnable = true;

    public static synchronized void trackPictureCapture(int i) {
        synchronized (PerformanceTracker.class) {
            String str;
            StringBuilder stringBuilder;
            if (i == 0) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[    PictureTaken][START][");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str, stringBuilder.toString());
            } else if (i == 1) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[    PictureTaken][  END][");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str, stringBuilder.toString());
            }
        }
    }

    public static synchronized void trackAlgorithmProcess(String str, int i) {
        synchronized (PerformanceTracker.class) {
            String str2;
            StringBuilder stringBuilder;
            if (i == 0) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[AlgorithmProcess][START]");
                stringBuilder.append(str);
                stringBuilder.append("[");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str2, stringBuilder.toString());
            } else if (i == 1) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[AlgorithmProcess][  END]");
                stringBuilder.append(str);
                stringBuilder.append("[");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str2, stringBuilder.toString());
            }
        }
    }

    public static synchronized void trackJpegReprocess(int i, int i2) {
        synchronized (PerformanceTracker.class) {
            String str = null;
            switch (i) {
                case 1:
                    str = "[EFFECT]";
                    break;
                case 2:
                    str = "[   RAW]";
                    break;
                case 3:
                    str = "[ DEPTH]";
                    break;
            }
            String str2;
            StringBuilder stringBuilder;
            if (i2 == 0) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[   JpegReprocess][START]");
                stringBuilder.append(str);
                stringBuilder.append("[");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str2, stringBuilder.toString());
            } else if (i2 == 1) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[   JpegReprocess][  END]");
                stringBuilder.append(str);
                stringBuilder.append("[");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str2, stringBuilder.toString());
            }
        }
    }

    public static synchronized void trackImageSaver(Object obj, int i) {
        synchronized (PerformanceTracker.class) {
            String str;
            StringBuilder stringBuilder;
            if (i == 0) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[      ImageSaver][START][");
                stringBuilder.append(obj);
                stringBuilder.append("][");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str, stringBuilder.toString());
            } else if (i == 1) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[      ImageSaver][  END][");
                stringBuilder.append(obj);
                stringBuilder.append("][");
                stringBuilder.append(System.currentTimeMillis());
                stringBuilder.append("]");
                Log.i(str, stringBuilder.toString());
            }
        }
    }
}
