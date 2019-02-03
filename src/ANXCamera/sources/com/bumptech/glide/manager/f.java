package com.bumptech.glide.manager;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import com.bumptech.glide.manager.c.a;

/* compiled from: DefaultConnectivityMonitorFactory */
public class f implements d {
    private static final String TAG = "ConnectivityMonitor";
    private static final String mm = "android.permission.ACCESS_NETWORK_STATE";

    @NonNull
    public c a(@NonNull Context context, @NonNull a aVar) {
        Object obj = ContextCompat.checkSelfPermission(context, mm) == 0 ? 1 : null;
        if (Log.isLoggable(TAG, 3)) {
            String str;
            String str2 = TAG;
            if (obj != null) {
                str = "ACCESS_NETWORK_STATE permission granted, registering connectivity monitor";
            } else {
                str = "ACCESS_NETWORK_STATE permission missing, cannot register connectivity monitor";
            }
            Log.d(str2, str);
        }
        return obj != null ? new e(context, aVar) : new j();
    }
}
