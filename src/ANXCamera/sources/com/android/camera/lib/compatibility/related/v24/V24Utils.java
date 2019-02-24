package com.android.camera.lib.compatibility.related.v24;

import android.annotation.TargetApi;
import android.app.Activity;
import android.media.MediaRecorder;
import android.os.Build.VERSION;
import android.util.Log;

@TargetApi(24)
public class V24Utils {
    private static final String TAG = "V24Utils";

    public static final boolean isInMultiWindowMode(Activity activity) {
        return activity.isInMultiWindowMode();
    }

    public static void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        if (VERSION.SDK_INT >= 24) {
            try {
                mediaRecorder.pause();
            } catch (IllegalArgumentException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    public static void resumeMediaRecorder(MediaRecorder mediaRecorder) {
        if (VERSION.SDK_INT >= 24) {
            try {
                mediaRecorder.resume();
            } catch (IllegalArgumentException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }
}
