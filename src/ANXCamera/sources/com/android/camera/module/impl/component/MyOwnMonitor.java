package com.android.camera.module.impl.component;

import android.util.Log;
import com.ss.android.vesdk.runtime.VEExternalMonitorListener;

public class MyOwnMonitor implements VEExternalMonitorListener {
    public static MyOwnMonitor Instance = new MyOwnMonitor();

    private MyOwnMonitor() {
    }

    public void onMonitorInvoked(String str, int i, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(i);
        stringBuilder.append(str2);
        Log.i("LiveLog", stringBuilder.toString());
    }
}
