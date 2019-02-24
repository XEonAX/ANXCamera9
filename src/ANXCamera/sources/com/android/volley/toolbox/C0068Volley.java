package com.android.volley.toolbox;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.http.AndroidHttpClient;
import android.os.Build.VERSION;
import com.android.volley.C0024RequestQueue;
import java.io.File;

/* renamed from: com.android.volley.toolbox.Volley */
public class C0068Volley {
    private static final String DEFAULT_CACHE_DIR = "volley";

    public static C0024RequestQueue newRequestQueue(Context context, C0043HttpStack stack) {
        File cacheDir = new File(context.getCacheDir(), "volley");
        String userAgent = "volley/0";
        try {
            String packageName = context.getPackageName();
            PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(packageName);
            stringBuilder.append("/");
            stringBuilder.append(info.versionCode);
            userAgent = stringBuilder.toString();
        } catch (NameNotFoundException e) {
        }
        if (stack == null) {
            if (VERSION.SDK_INT >= 9) {
                stack = new C0047HurlStack();
            } else {
                stack = new C0044HttpClientStack(AndroidHttpClient.newInstance(userAgent));
            }
        }
        C0024RequestQueue queue = new C0024RequestQueue(new C0041DiskBasedCache(cacheDir), new C0035BasicNetwork(stack));
        queue.start();
        return queue;
    }

    public static C0024RequestQueue newRequestQueue(Context context) {
        return C0068Volley.newRequestQueue(context, null);
    }
}
