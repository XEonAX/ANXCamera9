package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.camera.log.Log;
import com.android.camera.module.Camera2Module;
import com.android.camera.module.impl.component.ConfigChangeImpl;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.Camera2OpenManager;

public class PreloadReceiver extends BroadcastReceiver {
    private static final String TAG = "PreloadReceiver";

    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.BOOT_COMPLETED".equals(intent.getAction())) {
            Log.i(TAG, "receive boot complete");
            Camera2DataContainer.getInstance();
            Camera2Module camera2Module = new Camera2Module();
            Camera2OpenManager.preload();
            CameraSettings cameraSettings = new CameraSettings();
            ConfigChangeImpl.preload();
        }
    }
}
