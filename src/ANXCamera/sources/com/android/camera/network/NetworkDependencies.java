package com.android.camera.network;

import android.app.Application;
import android.content.Context;
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
}
