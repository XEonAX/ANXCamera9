package com.ss.android.vesdk;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.ttve.nativePort.TEVideoUtilsCallback;

public class VEUtils {
    public static int mux(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            return -100;
        }
        return TEVideoUtils.mux(str, str2, str3);
    }

    public static int getVideoFileInfo(@NonNull String str, @NonNull int[] iArr) {
        return TEVideoUtils.getVideoFileInfo(str, iArr);
    }

    public static int isCanImport(String str) {
        return TEVideoUtils.isCanImport(str);
    }

    public static int getVideoFrames(@NonNull String str, @NonNull int[] iArr, @NonNull VEFrameAvailableListener vEFrameAvailableListener) {
        TEVideoUtilsCallback tEVideoUtilsCallback = new TEVideoUtilsCallback();
        tEVideoUtilsCallback.setListener(vEFrameAvailableListener);
        return TEVideoUtils.getVideoFrames(str, iArr, tEVideoUtilsCallback);
    }
}
