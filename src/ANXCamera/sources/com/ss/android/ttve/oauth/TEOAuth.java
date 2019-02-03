package com.ss.android.ttve.oauth;

import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.ss.android.ttve.nativePort.TENativeLibsLoader;

public class TEOAuth {
    private static native int nativeActivate(@NonNull String str, @NonNull String str2, @NonNull String str3, @NonNull String str4, @NonNull String str5, @Nullable String str6);

    private static native String nativeGetActivationCode();

    private static native boolean nativePermitted();

    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static TEOAuthResult activate(Context context, @NonNull String str, @NonNull String str2, @Nullable String str3) {
        return TEOAuthResult.from(nativeActivate(str, str2, context.getApplicationInfo().packageName, "Android", Build.DEVICE, str3));
    }

    public static String getActivationCode() {
        return nativeGetActivationCode();
    }

    public static boolean isPermitted() {
        return nativePermitted();
    }
}
