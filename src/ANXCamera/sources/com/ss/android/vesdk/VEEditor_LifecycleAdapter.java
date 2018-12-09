package com.ss.android.vesdk;

import android.arch.lifecycle.GeneratedAdapter;
import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.MethodCallsLogger;

public class VEEditor_LifecycleAdapter implements GeneratedAdapter {
    final VEEditor mReceiver;

    VEEditor_LifecycleAdapter(VEEditor vEEditor) {
        this.mReceiver = vEEditor;
    }

    public void callMethods(LifecycleOwner lifecycleOwner, Event event, boolean z, MethodCallsLogger methodCallsLogger) {
        int i;
        if (methodCallsLogger != null) {
            i = 1;
        } else {
            i = 0;
        }
        if (!z && event == Event.ON_DESTROY) {
            if (i == 0 || methodCallsLogger.approveCall("destroy", 1)) {
                this.mReceiver.destroy();
            }
        }
    }
}
