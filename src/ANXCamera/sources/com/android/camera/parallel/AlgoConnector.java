package com.android.camera.parallel;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.android.camera.LocalParallelService;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.LocalParallelService.ServiceStatusListener;
import com.android.camera.log.Log;

public class AlgoConnector {
    private static final String TAG = AlgoConnector.class.getSimpleName();
    private static AlgoConnector ourInstance = new AlgoConnector();
    public LocalBinder mLocalBinder;
    private final ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            String access$000 = AlgoConnector.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onServiceConnected: ");
            stringBuilder.append(componentName);
            Log.d(access$000, stringBuilder.toString());
            AlgoConnector.this.mLocalBinder = (LocalBinder) iBinder;
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.d(AlgoConnector.TAG, "onServiceDisconnected");
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
            context.bindService(new Intent(context, LocalParallelService.class), this.mServiceConnection, 67108929);
        }
    }

    public LocalBinder getLocalBinder() {
        return this.mLocalBinder;
    }
}
