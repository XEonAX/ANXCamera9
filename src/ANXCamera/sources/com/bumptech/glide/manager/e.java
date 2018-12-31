package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.manager.c.a;
import com.bumptech.glide.util.i;

/* compiled from: DefaultConnectivityMonitor */
final class e implements c {
    private static final String TAG = "ConnectivityMonitor";
    private final Context context;
    boolean isConnected;
    final a mj;
    private boolean mk;
    private final BroadcastReceiver ml = new BroadcastReceiver() {
        public void onReceive(@NonNull Context context, Intent intent) {
            boolean z = e.this.isConnected;
            e.this.isConnected = e.this.isConnected(context);
            if (z != e.this.isConnected) {
                if (Log.isLoggable(e.TAG, 3)) {
                    String str = e.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("connectivity changed, isConnected: ");
                    stringBuilder.append(e.this.isConnected);
                    Log.d(str, stringBuilder.toString());
                }
                e.this.mj.b(e.this.isConnected);
            }
        }
    };

    e(@NonNull Context context, @NonNull a aVar) {
        this.context = context.getApplicationContext();
        this.mj = aVar;
    }

    private void register() {
        if (!this.mk) {
            this.isConnected = isConnected(this.context);
            try {
                this.context.registerReceiver(this.ml, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this.mk = true;
            } catch (Throwable e) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Failed to register", e);
                }
            }
        }
    }

    private void unregister() {
        if (this.mk) {
            this.context.unregisterReceiver(this.ml);
            this.mk = false;
        }
    }

    @SuppressLint({"MissingPermission"})
    boolean isConnected(@NonNull Context context) {
        boolean z = true;
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) i.checkNotNull((ConnectivityManager) context.getSystemService("connectivity"))).getActiveNetworkInfo();
            if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
                z = false;
            }
            return z;
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Failed to determine connectivity status when connectivity changed", e);
            }
            return true;
        }
    }

    public void onStart() {
        register();
    }

    public void onStop() {
        unregister();
    }

    public void onDestroy() {
    }
}
