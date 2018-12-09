package com.bumptech.glide.c;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

@Deprecated
/* compiled from: ManifestParser */
public final class e {
    private static final String TAG = "ManifestParser";
    private static final String mL = "GlideModule";
    private final Context context;

    public e(Context context) {
        this.context = context;
    }

    public List<c> db() {
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Loading Glide modules");
        }
        List<c> arrayList = new ArrayList();
        try {
            ApplicationInfo applicationInfo = this.context.getPackageManager().getApplicationInfo(this.context.getPackageName(), 128);
            if (applicationInfo.metaData == null) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Got null app info metadata");
                }
                return arrayList;
            }
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Got app info metadata: ");
                stringBuilder.append(applicationInfo.metaData);
                Log.v(str, stringBuilder.toString());
            }
            for (String str2 : applicationInfo.metaData.keySet()) {
                if (mL.equals(applicationInfo.metaData.get(str2))) {
                    arrayList.add(s(str2));
                    if (Log.isLoggable(TAG, 3)) {
                        String str3 = TAG;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("Loaded Glide module: ");
                        stringBuilder2.append(str2);
                        Log.d(str3, stringBuilder2.toString());
                    }
                }
            }
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Finished loading Glide modules");
            }
            return arrayList;
        } catch (Throwable e) {
            throw new RuntimeException("Unable to find metadata to parse GlideModules", e);
        }
    }

    private static c s(String str) {
        try {
            Class cls = Class.forName(str);
            Object obj = null;
            try {
                obj = cls.getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
            } catch (Exception e) {
                a(cls, e);
            } catch (Exception e2) {
                a(cls, e2);
            } catch (Exception e22) {
                a(cls, e22);
            } catch (Exception e222) {
                a(cls, e222);
            }
            if (obj instanceof c) {
                return (c) obj;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Expected instanceof GlideModule, but found: ");
            stringBuilder.append(obj);
            throw new RuntimeException(stringBuilder.toString());
        } catch (Throwable e3) {
            throw new IllegalArgumentException("Unable to find GlideModule implementation", e3);
        }
    }

    private static void a(Class<?> cls, Exception exception) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unable to instantiate GlideModule implementation for ");
        stringBuilder.append(cls);
        throw new RuntimeException(stringBuilder.toString(), exception);
    }
}
