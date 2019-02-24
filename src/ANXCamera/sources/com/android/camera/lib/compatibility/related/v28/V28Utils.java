package com.android.camera.lib.compatibility.related.v28;

import android.annotation.TargetApi;
import android.content.Intent;
import android.content.pm.IPackageInstallObserver2.Stub;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.params.SessionConfiguration;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.android.camera.lib.compatibility.util.CompatibilityUtils.PackageInstallerListener;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;

@TargetApi(28)
public class V28Utils {
    private static final String TAG = "V28Utils";

    public static Object getPackageInstallObserver(final PackageInstallerListener packageInstallerListener) {
        return new Stub() {
            public void onUserActionRequired(Intent intent) {
            }

            public void onPackageInstalled(String str, int i, String str2, Bundle bundle) throws RemoteException {
                String str3 = V28Utils.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("packageInstalled: packageName=");
                stringBuilder.append(str);
                stringBuilder.append(" returnCode=");
                stringBuilder.append(i);
                stringBuilder.append(" msg=");
                stringBuilder.append(str2);
                Log.d(str3, stringBuilder.toString());
                if (packageInstallerListener != null) {
                    PackageInstallerListener packageInstallerListener = packageInstallerListener;
                    boolean z = true;
                    if (i != 1) {
                        z = false;
                    }
                    packageInstallerListener.onPackageInstalled(str, z);
                }
            }
        };
    }

    public static String getInstallMethodDescription() {
        return "(Landroid/content/Context;Ljava/lang/String;Landroid/content/pm/IPackageInstallObserver2;I)Z";
    }

    public static Builder constructCaptureRequestBuilder(CameraMetadataNative cameraMetadataNative, boolean z, int i, CaptureRequest captureRequest) {
        return new Builder(cameraMetadataNative, z, i, captureRequest.getLogicalCameraId(), null);
    }

    public static void setCutoutModeShortEdges(Window window) {
        LayoutParams attributes = window.getAttributes();
        attributes.layoutInDisplayCutoutMode = 1;
        window.setAttributes(attributes);
    }

    public static void createCaptureSessionWithSessionConfiguration(CameraDevice cameraDevice, List<Surface> list, CaptureRequest captureRequest, StateCallback stateCallback, final Handler handler) throws CameraAccessException {
        List arrayList = new ArrayList();
        for (Surface outputConfiguration : list) {
            arrayList.add(new OutputConfiguration(outputConfiguration));
        }
        SessionConfiguration sessionConfiguration = new SessionConfiguration(1, arrayList, handler == null ? null : new Executor() {
            public void execute(Runnable runnable) {
                handler.post(runnable);
            }
        }, stateCallback);
        sessionConfiguration.setSessionParameters(captureRequest);
        cameraDevice.createCaptureSession(sessionConfiguration);
    }
}
