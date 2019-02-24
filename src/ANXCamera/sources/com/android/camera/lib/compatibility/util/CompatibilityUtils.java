package com.android.camera.lib.compatibility.util;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.media.MediaRecorder;
import android.os.Handler;
import android.os.IPowerManager;
import android.text.TextPaint;
import android.view.Surface;
import android.view.Window;
import com.android.camera.lib.compatibility.related.screenlight.ScreenLightUtils;
import com.android.camera.lib.compatibility.related.v21.V21Utils;
import com.android.camera.lib.compatibility.related.v23.V23Utils;
import com.android.camera.lib.compatibility.related.v24.V24Utils;
import com.android.camera.lib.compatibility.related.v26.V26Utils;
import com.android.camera.lib.compatibility.related.v28.V28Utils;
import java.io.FileDescriptor;
import java.util.List;

public class CompatibilityUtils {
    public static final int ANDROID_L_VERSION = 21;
    public static final int ANDROID_M_VERSION = 23;
    public static final int ANDROID_N_VERSION = 24;
    public static final int ANDROID_O_VERSION = 26;
    public static final int ANDROID_P_VERSION = 28;
    public static final int MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING = 802;
    public static final int MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED = 803;

    public interface PackageInstallerListener {
        void onPackageInstalled(String str, boolean z);
    }

    public static final boolean isInMultiWindowMode(Activity activity) {
        return V24Utils.isInMultiWindowMode(activity);
    }

    public static boolean isInVideoCall(Context context) {
        return V23Utils.isInVideoCall(context);
    }

    public static String getSdcardPath(Context context) {
        return V23Utils.getSdcardPath(context);
    }

    public static void setSurfaceTextureOnFrameAvailableListener(SurfaceTexture surfaceTexture, OnFrameAvailableListener onFrameAvailableListener, Handler handler) {
        V21Utils.setSurfaceTextureOnFrameAvailableListener(surfaceTexture, onFrameAvailableListener, handler);
    }

    public static void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.pauseMediaRecorder(mediaRecorder);
    }

    public static void resumeMediaRecorder(MediaRecorder mediaRecorder) {
        V24Utils.resumeMediaRecorder(mediaRecorder);
    }

    public static void setTextPaintLetterSpacing(TextPaint textPaint, float f) {
        V21Utils.setTextPaintLetterSpacing(textPaint, f);
    }

    public static void allocGraphicBuffers() {
        V26Utils.allocGraphicBuffers();
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, String str) {
        return V26Utils.setNextOutputFile(mediaRecorder, str);
    }

    public static boolean setNextOutputFile(MediaRecorder mediaRecorder, FileDescriptor fileDescriptor) {
        return V26Utils.setNextOutputFile(mediaRecorder, fileDescriptor);
    }

    public static void setZsl(Builder builder, boolean z) {
        V26Utils.setZsl(builder, z);
    }

    public static void setBrightnessRampRate(IPowerManager iPowerManager, int i) {
        ScreenLightUtils.setBrightnessRampRate(iPowerManager, i);
    }

    public static Object getPackageInstallObserver(PackageInstallerListener packageInstallerListener) {
        return V28Utils.getPackageInstallObserver(packageInstallerListener);
    }

    public static String getInstallMethodDescription() {
        return V28Utils.getInstallMethodDescription();
    }

    public static Builder constructCaptureRequestBuilder(CameraMetadataNative cameraMetadataNative, boolean z, int i, CaptureRequest captureRequest) {
        return V28Utils.constructCaptureRequestBuilder(cameraMetadataNative, z, i, captureRequest);
    }

    public static void addChannelForNotificationBuilder(NotificationManager notificationManager, String str, CharSequence charSequence, Notification.Builder builder) {
        V26Utils.addChannelForNotificationBuilder(notificationManager, str, charSequence, builder);
    }

    public static void setCutoutModeShortEdges(Window window) {
        V28Utils.setCutoutModeShortEdges(window);
    }

    public static void createCaptureSessionWithSessionConfiguration(CameraDevice cameraDevice, List<Surface> list, CaptureRequest captureRequest, StateCallback stateCallback, Handler handler) throws CameraAccessException {
        V28Utils.createCaptureSessionWithSessionConfiguration(cameraDevice, list, captureRequest, stateCallback, handler);
    }
}
