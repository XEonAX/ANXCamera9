package com.ss.android.medialib.utils;

import android.content.Context;
import android.content.pm.PackageManager;
import android.media.AudioManager;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.util.Pair;

public class Utils {
    public static Pair<Integer, Integer> getSystemAudioInfo(Context context) {
        PackageManager packageManager = context.getPackageManager();
        if (packageManager != null) {
            packageManager.hasSystemFeature("android.hardware.audio.low_latency");
        }
        int i = 44100;
        int i2 = 256;
        if (VERSION.SDK_INT >= 17) {
            AudioManager audioManager = (AudioManager) context.getSystemService("audio");
            i = str2Int(audioManager.getProperty("android.media.property.OUTPUT_SAMPLE_RATE"), 44100);
            i2 = str2Int(audioManager.getProperty("android.media.property.OUTPUT_FRAMES_PER_BUFFER"), 256);
        }
        return new Pair(Integer.valueOf(i), Integer.valueOf(i2));
    }

    public static int str2Int(String str, int i) {
        if (TextUtils.isEmpty(str)) {
            return i;
        }
        try {
            return Integer.parseInt(str);
        } catch (Exception e) {
            return i;
        }
    }
}
