package com.android.camera;

import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraErrorCallback;
import java.lang.ref.WeakReference;

public class CameraErrorCallbackImpl implements CameraErrorCallback {
    private static final String TAG = "CameraErrorCallback";
    private WeakReference<ActivityBase> mWeakActivity;

    public CameraErrorCallbackImpl(ActivityBase activityBase) {
        this.mWeakActivity = new WeakReference(activityBase);
    }

    public void onCameraError(Camera2Proxy camera2Proxy, int i) {
        if (i == 5) {
            Log.e(TAG, "onCameraError: camera service error");
        } else if (i == 4) {
            Log.e(TAG, "onCameraError: camera device error");
        } else if (i == 3) {
            Log.e(TAG, "onCameraError: camera disabled");
        } else if (i == 2) {
            Log.e(TAG, "onCameraError: max camera in use");
        } else if (i == 1) {
            Log.e(TAG, "onCameraError: camera in use");
        } else {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onCameraError: other error ");
            stringBuilder.append(i);
            Log.e(str, stringBuilder.toString());
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("");
        stringBuilder2.append(i);
        CameraStatUtil.trackCameraError(stringBuilder2.toString());
        ActivityBase activityBase = (ActivityBase) this.mWeakActivity.get();
        if (activityBase != null) {
            Module currentModule = activityBase.getCurrentModule();
            if (currentModule != null && currentModule.isCreated()) {
                currentModule.notifyError();
                return;
            }
            return;
        }
        Log.d(TAG, "mActivity has been collected.");
    }
}
