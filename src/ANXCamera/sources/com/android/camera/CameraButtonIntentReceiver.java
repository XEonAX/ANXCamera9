package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.camera.log.Log;
import com.android.camera.permission.PermissionManager;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;

public class CameraButtonIntentReceiver extends BroadcastReceiver {
    private static final String TAG = CameraButtonIntentReceiver.class.getSimpleName();

    public void onReceive(Context context, Intent intent) {
        if (PermissionManager.checkCameraLaunchPermissions()) {
            intent = new Intent("android.intent.action.MAIN");
            intent.setClass(context, Camera.class);
            intent.addCategory("android.intent.category.LAUNCHER");
            intent.setFlags(WideSelfieEngine.MPAF_RGB_BASE);
            context.startActivity(intent);
            return;
        }
        Log.e(TAG, "no camera permission");
    }
}
