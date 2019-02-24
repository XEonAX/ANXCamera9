package com.android.camera.network.util;

import android.app.Application;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.android.camera.CameraSettings;
import com.android.camera.network.live.TTLiveStickerResourceRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;

public class NetworkUtils {
    private static boolean DBG = false;
    private static final String TAG = "NetworkUtils";
    private static Application sApp;

    private NetworkUtils() {
    }

    public static void bind(Application application) {
        sApp = application;
    }

    public static boolean isNetworkConnected() {
        ConnectivityManager connectivityManager = (ConnectivityManager) sApp.getSystemService("connectivity");
        if (connectivityManager == null) {
            return false;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return false;
        }
        return true;
    }

    public static boolean isActiveNetworkMetered() {
        ConnectivityManager connectivityManager = (ConnectivityManager) sApp.getSystemService("connectivity");
        if (connectivityManager == null) {
            return false;
        }
        return connectivityManager.isActiveNetworkMetered();
    }

    public static NetworkInfo getActiveNetworkInfo() {
        ConnectivityManager connectivityManager = (ConnectivityManager) sApp.getSystemService("connectivity");
        return connectivityManager == null ? null : connectivityManager.getActiveNetworkInfo();
    }

    public static void tryRequestTTSticker() {
        new TTLiveStickerResourceRequest(CameraSettings.isLiveStickerInternalChannel() ? "local_test" : MonitorCommonConstants.DEFAULT_AID, MonitorCommonConstants.DEFAULT_AID).execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
            }
        });
    }
}
