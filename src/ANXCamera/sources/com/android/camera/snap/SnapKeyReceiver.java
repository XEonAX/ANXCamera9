package com.android.camera.snap;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.PowerManager;
import com.android.camera.permission.PermissionManager;
import com.mi.config.b;

@TargetApi(21)
public class SnapKeyReceiver extends BroadcastReceiver {
    public static final String KEY_ACTION = "key_action";
    public static final String KEY_CODE = "key_code";
    public static final String KEY_EVENT_TIME = "key_event_time";
    private static final String TAG = SnapKeyReceiver.class.getSimpleName();

    /* JADX WARNING: Missing block: B:25:0x009d, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onReceive(Context context, Intent intent) {
        if (VERSION.SDK_INT < 21 || !b.gO() || !"miui.intent.action.CAMERA_KEY_BUTTON".equals(intent.getAction()) || !SnapCamera.isSnapEnabled(context) || !PermissionManager.checkCameraLaunchPermissions()) {
            return;
        }
        if ((!((PowerManager) context.getSystemService("power")).isScreenOn() && 26 != intent.getIntExtra(KEY_CODE, 0)) || SnapTrigger.getInstance().isRunning()) {
            if (SnapTrigger.getInstance().isRunning()) {
                SnapTrigger.getInstance().handleKeyEvent(intent.getIntExtra(KEY_CODE, 0), intent.getIntExtra(KEY_ACTION, 0), intent.getLongExtra(KEY_EVENT_TIME, 0));
            } else {
                Bundle bundle = new Bundle();
                bundle.putInt(KEY_CODE, intent.getIntExtra(KEY_CODE, 0));
                bundle.putInt(KEY_ACTION, intent.getIntExtra(KEY_ACTION, 0));
                bundle.putLong(KEY_EVENT_TIME, intent.getLongExtra(KEY_EVENT_TIME, 0));
                SnapService.startJob(context, bundle);
            }
        }
    }
}
