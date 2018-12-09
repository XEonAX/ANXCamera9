package com.android.camera.parallel;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.util.Log;
import com.android.camera.LocalParallelService;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.LocalParallelService.ServiceStatusListener;

public class AlgoConnector {
    private static final String TAG = "AlgoConnector";
    private static AlgoConnector ourInstance = new AlgoConnector();
    public LocalBinder mLocalBinder;
    private final ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            String str = AlgoConnector.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onServiceConnected: ");
            stringBuilder.append(componentName);
            Log.d(str, stringBuilder.toString());
            AlgoConnector.this.mLocalBinder = (LocalBinder) iBinder;
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.d(AlgoConnector.TAG, "onServiceDisconnected: ");
            AlgoConnector.this.mLocalBinder = null;
        }
    };

    private AlgoConnector() {
    }

    public static AlgoConnector getInstance() {
        if (ourInstance == null) {
            ourInstance = new AlgoConnector();
        }
        return ourInstance;
    }

    public void setServiceStatusListener(ServiceStatusListener serviceStatusListener) {
        if (serviceStatusListener != null && this.mLocalBinder != null) {
            this.mLocalBinder.setOnPictureTakenListener(serviceStatusListener);
        }
    }

    public void startService(Context context) {
        if (this.mLocalBinder == null) {
            Intent intent = new Intent(context, LocalParallelService.class);
            context.startService(intent);
            context.bindService(intent, this.mServiceConnection, 1);
        }
    }

    public LocalBinder getLocalBinder() {
        return this.mLocalBinder;
    }
}
