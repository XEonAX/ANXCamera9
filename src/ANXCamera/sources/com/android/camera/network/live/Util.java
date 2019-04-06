package com.android.camera.network.live;

import android.support.v4.view.InputDeviceCompat;
import com.android.camera.log.Log;

public class Util {
    private static String TAG = "LiveUtil";

    static {
        try {
            System.loadLibrary("tt_jni");
        } catch (Throwable th) {
            Log.e(TAG, "load tt_jni.so failed.", th);
        }
    }

    private static native byte[] genAccessKey();

    private static native byte[] generate(long j, long j2);

    public static String getAccessKey() {
        return new String(genAccessKey());
    }

    public static String md5(long j, long j2) {
        byte[] generate = generate(j, j2);
        String str = "";
        for (byte b : generate) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(Integer.toHexString((255 & b) | InputDeviceCompat.SOURCE_ANY).substring(6));
            str = stringBuilder.toString();
        }
        return str;
    }
}
