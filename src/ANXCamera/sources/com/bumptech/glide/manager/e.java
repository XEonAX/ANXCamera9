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
    final a mi;
    private boolean mj;
    private final BroadcastReceiver mk = new BroadcastReceiver() {
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
                e.this.mi.b(e.this.isConnected);
            }
        }
    };

    e(@NonNull Context context, @NonNull a aVar) {
        this.context = context.getApplicationContext();
        this.mi = aVar;
    }

    private void register() {
        if (!this.mj) {
            this.isConnected = isConnected(this.context);
            try {
                this.context.registerReceiver(this.mk, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this.mj = true;
            } catch (Throwable e) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Failed to register", e);
                }
            }
        }
    }

    private void unregister() {
        if (this.mj) {
            this.context.unregisterReceiver(this.mk);
            this.mj = false;
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
