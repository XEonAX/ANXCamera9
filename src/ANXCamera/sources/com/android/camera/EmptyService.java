package com.android.camera;

import android.app.IntentService;
import android.app.Notification.Builder;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;

public class EmptyService extends IntentService {
    private static final String TAG = EmptyService.class.getSimpleName();
    BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            EmptyService.this.stopForeground(true);
            EmptyService.this.stopSelf();
        }
    };

    public EmptyService() {
        super("EmptyService");
    }

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onCreate() {
        getApplicationContext().registerReceiver(this.mReceiver, new IntentFilter("android.intent.action.SCREEN_ON"));
        super.onCreate();
    }

    protected void onHandleIntent(Intent intent) {
        if (intent == null) {
            Log.e(TAG, "onHandleIntent: but intent is null");
            return;
        }
        startForeground(0, new Builder(this).setTicker("camera service").setContentIntent(PendingIntent.getActivity(this, 0, intent, 0)).setWhen(System.currentTimeMillis()).build());
        CompatibilityUtils.allocGraphicBuffers();
    }

    public void onDestroy() {
        stopForeground(true);
        getApplicationContext().unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }
}
