package com.android.camera.lib.compatibility.related.v26;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.graphics.GraphicBuffer;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.media.MediaRecorder;
import android.os.Build.VERSION;
import android.util.Log;
import java.io.File;
import java.io.FileDescriptor;

@TargetApi(26)
public class V26Utils {
    public static final int MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING = 802;
    public static final int MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED = 803;
    private static final String TAG = "V26Utils";

    private V26Utils() {
    }

    public static void allocGraphicBuffers() {
        GraphicBuffer.create(12800, 2560, 1, 51).destroy();
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, String str) {
        if (VERSION.SDK_INT >= 26) {
            try {
                mediaRecorder.setNextOutputFile(new File(str));
                return true;
            } catch (Throwable e) {
                Log.e(TAG, e.getMessage(), e);
            }
        }
        return false;
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, FileDescriptor fileDescriptor) {
        if (VERSION.SDK_INT >= 26) {
            try {
                mediaRecorder.setNextOutputFile(fileDescriptor);
                return true;
            } catch (Throwable e) {
                Log.e(TAG, e.getMessage(), e);
            }
        }
        return false;
    }

    public static void setZsl(Builder builder, boolean z) {
        if (VERSION.SDK_INT >= 26) {
            builder.set(CaptureRequest.CONTROL_ENABLE_ZSL, Boolean.valueOf(z));
        }
    }

    public static void addChannelForNotificationBuilder(NotificationManager notificationManager, String str, CharSequence charSequence, Notification.Builder builder) {
        if (VERSION.SDK_INT >= 26) {
            NotificationChannel notificationChannel = new NotificationChannel(str, charSequence, 2);
            notificationChannel.enableLights(false);
            notificationChannel.enableVibration(false);
            notificationChannel.setLockscreenVisibility(-1);
            notificationManager.createNotificationChannel(notificationChannel);
            builder.setChannelId(str);
        }
    }
}
