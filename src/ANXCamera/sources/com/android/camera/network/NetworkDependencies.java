package com.android.camera.network;

import android.app.Application;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.util.NetworkUtils;
import java.io.File;

public class NetworkDependencies {
    public static void depend(Application application) {
        HttpManager.getInstance().initRequestQueue(application);
        NetworkUtils.bind(application);
    }

    public static File getRequestCache(Context context) {
        return context.getExternalCacheDir();
    }

    public static boolean isConnected(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager != null) {
            NetworkInfo[] allNetworkInfo = connectivityManager.getAllNetworkInfo();
            if (allNetworkInfo != null) {
                for (NetworkInfo state : allNetworkInfo) {
                    if (state.getState() == State.CONNECTED) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
