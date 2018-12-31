package com.bumptech.glide.e;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.c;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* compiled from: ApplicationVersionSignature */
public final class a {
    private static final String TAG = "AppVersionSignature";
    private static final ConcurrentMap<String, c> pc = new ConcurrentHashMap();

    @NonNull
    public static c m(@NonNull Context context) {
        String packageName = context.getPackageName();
        c cVar = (c) pc.get(packageName);
        if (cVar != null) {
            return cVar;
        }
        cVar = n(context);
        c cVar2 = (c) pc.putIfAbsent(packageName, cVar);
        return cVar2 == null ? cVar : cVar2;
    }

    @VisibleForTesting
    static void reset() {
        pc.clear();
    }

    @NonNull
    private static c n(@NonNull Context context) {
        return new d(a(o(context)));
    }

    @NonNull
    private static String a(@Nullable PackageInfo packageInfo) {
        if (packageInfo != null) {
            return String.valueOf(packageInfo.versionCode);
        }
        return UUID.randomUUID().toString();
    }

    @Nullable
    private static PackageInfo o(@NonNull Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Throwable e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Cannot resolve info for");
            stringBuilder.append(context.getPackageName());
            Log.e(str, stringBuilder.toString(), e);
            return null;
        }
    }

    private a() {
    }
}
