package com.ss.android.ttve.oauth;

import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.ss.android.ttve.nativePort.TENativeLibsLoader;

public class TEOAuth {
    private static native int nativeActivate(@NonNull String str, @NonNull String str2, @NonNull String str3, @NonNull String str4, @NonNull String str5, @Nullable String str6);

    private static native String nativeGetActivationCode();

    private static native boolean nativePermitted();

    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static TEOAuthResult activate(Context context, @NonNull String str, @NonNull String str2, @Nullable String str3) {
        String str4 = context.getApplicationInfo().packageName;
        String str5 = Build.DEVICE;
        String simpleName = TEOAuth.class.getSimpleName();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("appId: [");
        stringBuilder.append(str2);
        stringBuilder.append("]");
        Log.i(simpleName, stringBuilder.toString());
        simpleName = TEOAuth.class.getSimpleName();
        stringBuilder = new StringBuilder();
        stringBuilder.append("packageName: [");
        stringBuilder.append(str4);
        stringBuilder.append("]");
        Log.i(simpleName, stringBuilder.toString());
        simpleName = TEOAuth.class.getSimpleName();
        stringBuilder = new StringBuilder();
        stringBuilder.append("DEVICE: [");
        stringBuilder.append(str5);
        stringBuilder.append("]");
        Log.i(simpleName, stringBuilder.toString());
        return TEOAuthResult.from(nativeActivate(str, str2, str4, "Android", str5, str3));
    }

    public static String getActivationCode() {
        return nativeGetActivationCode();
    }

    public static boolean isPermitted() {
        return nativePermitted();
    }
}
