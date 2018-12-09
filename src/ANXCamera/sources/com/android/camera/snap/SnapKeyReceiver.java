package com.android.camera.snap;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;

@TargetApi(21)
public class SnapKeyReceiver extends BroadcastReceiver {
    public static final String KEY_ACTION = "key_action";
    public static final String KEY_CODE = "key_code";
    public static final String KEY_EVENT_TIME = "key_event_time";
    private static final String TAG = SnapKeyReceiver.class.getSimpleName();

    /* JADX WARNING: Missing block: B:25:0x009d, code:
            return;
     */
    public void onReceive(android.content.Context r7, android.content.Intent r8) {
        /*
        r6 = this;
        r0 = android.os.Build.VERSION.SDK_INT;
        r1 = 21;
        if (r0 < r1) goto L_0x009d;
    L_0x0006:
        r0 = com.mi.config.b.gO();
        if (r0 != 0) goto L_0x000e;
    L_0x000c:
        goto L_0x009d;
    L_0x000e:
        r0 = "miui.intent.action.CAMERA_KEY_BUTTON";
        r1 = r8.getAction();
        r0 = r0.equals(r1);
        if (r0 != 0) goto L_0x001b;
    L_0x001a:
        return;
    L_0x001b:
        r0 = com.android.camera.snap.SnapCamera.isSnapEnabled(r7);
        if (r0 != 0) goto L_0x0022;
    L_0x0021:
        return;
    L_0x0022:
        r0 = com.android.camera.permission.PermissionManager.checkCameraLaunchPermissions();
        if (r0 != 0) goto L_0x0029;
    L_0x0028:
        return;
    L_0x0029:
        r0 = "power";
        r0 = r7.getSystemService(r0);
        r0 = (android.os.PowerManager) r0;
        r0 = r0.isScreenOn();
        r1 = 0;
        if (r0 != 0) goto L_0x0042;
    L_0x0038:
        r0 = 26;
        r2 = "key_code";
        r2 = r8.getIntExtra(r2, r1);
        if (r0 != r2) goto L_0x004d;
    L_0x0042:
        r0 = com.android.camera.snap.SnapTrigger.getInstance();
        r0 = r0.isRunning();
        if (r0 != 0) goto L_0x004d;
    L_0x004c:
        return;
    L_0x004d:
        r0 = com.android.camera.snap.SnapTrigger.getInstance();
        r0 = r0.isRunning();
        r2 = 0;
        if (r0 == 0) goto L_0x0073;
    L_0x0059:
        r7 = com.android.camera.snap.SnapTrigger.getInstance();
        r0 = "key_code";
        r0 = r8.getIntExtra(r0, r1);
        r4 = "key_action";
        r1 = r8.getIntExtra(r4, r1);
        r4 = "key_event_time";
        r2 = r8.getLongExtra(r4, r2);
        r7.handleKeyEvent(r0, r1, r2);
        goto L_0x009c;
    L_0x0073:
        r0 = new android.os.Bundle;
        r0.<init>();
        r4 = "key_code";
        r5 = "key_code";
        r5 = r8.getIntExtra(r5, r1);
        r0.putInt(r4, r5);
        r4 = "key_action";
        r5 = "key_action";
        r1 = r8.getIntExtra(r5, r1);
        r0.putInt(r4, r1);
        r1 = "key_event_time";
        r4 = "key_event_time";
        r2 = r8.getLongExtra(r4, r2);
        r0.putLong(r1, r2);
        com.android.camera.snap.SnapService.startJob(r7, r0);
    L_0x009c:
        return;
    L_0x009d:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.snap.SnapKeyReceiver.onReceive(android.content.Context, android.content.Intent):void");
    }
}
