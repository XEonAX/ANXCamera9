package com.bumptech.glide.load.engine.b;

import android.os.Build.VERSION;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy;
import java.io.File;
import java.io.FilenameFilter;
import java.util.regex.Pattern;

/* compiled from: RuntimeCompat */
final class b {
    private static final String TAG = "GlideRuntimeCompat";
    private static final String ik = "cpu[0-9]+";
    private static final String il = "/sys/devices/system/cpu/";

    private b() {
    }

    static int availableProcessors() {
        int availableProcessors = Runtime.getRuntime().availableProcessors();
        if (VERSION.SDK_INT < 17) {
            return Math.max(bM(), availableProcessors);
        }
        return availableProcessors;
    }

    private static int bM() {
        File[] listFiles;
        ThreadPolicy allowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            File file = new File(il);
            final Pattern compile = Pattern.compile(ik);
            listFiles = file.listFiles(new FilenameFilter() {
                public boolean accept(File file, String str) {
                    return compile.matcher(str).matches();
                }
            });
            StrictMode.setThreadPolicy(allowThreadDiskReads);
        } catch (Throwable th) {
            StrictMode.setThreadPolicy(allowThreadDiskReads);
            throw th;
        }
        return Math.max(1, listFiles != null ? listFiles.length : 0);
    }
}
