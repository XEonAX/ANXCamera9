package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import android.util.Log;
import com.bumptech.glide.load.DecodeFormat;
import java.io.File;

/* compiled from: HardwareConfigState */
final class r {
    private static final int kR = 128;
    private static final File kS = new File("/proc/self/fd");
    private static final int kT = 50;
    private static final int kU = 700;
    private static volatile r kX;
    private volatile int kV;
    private volatile boolean kW = true;

    static r cp() {
        if (kX == null) {
            synchronized (r.class) {
                if (kX == null) {
                    kX = new r();
                }
            }
        }
        return kX;
    }

    private r() {
    }

    @TargetApi(26)
    boolean a(int i, int i2, Options options, DecodeFormat decodeFormat, boolean z, boolean z2) {
        if (!z || VERSION.SDK_INT < 26 || decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE || z2) {
            return false;
        }
        boolean z3;
        if (i < 128 || i2 < 128 || !cq()) {
            z3 = false;
        } else {
            z3 = true;
        }
        if (z3) {
            options.inPreferredConfig = Config.HARDWARE;
            options.inMutable = false;
        }
        return z3;
    }

    private synchronized boolean cq() {
        int i = this.kV + 1;
        this.kV = i;
        if (i >= 50) {
            boolean z = false;
            this.kV = 0;
            int length = kS.list().length;
            if (length < 700) {
                z = true;
            }
            this.kW = z;
            if (!this.kW && Log.isLoggable("Downsampler", 5)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Excluding HARDWARE bitmap config because we're over the file descriptor limit, file descriptors ");
                stringBuilder.append(length);
                stringBuilder.append(", limit ");
                stringBuilder.append(700);
                Log.w("Downsampler", stringBuilder.toString());
            }
        }
        return this.kW;
    }
}
