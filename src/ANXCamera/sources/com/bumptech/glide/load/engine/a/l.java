package com.bumptech.glide.load.engine.a;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.annotation.VisibleForTesting;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.bumptech.glide.util.i;

/* compiled from: MemorySizeCalculator */
public final class l {
    @VisibleForTesting
    static final int BYTES_PER_ARGB_8888_PIXEL = 4;
    private static final String TAG = "MemorySizeCalculator";
    private static final int hx = 2;
    private final Context context;
    private final int hA;
    private final int hy;
    private final int hz;

    /* compiled from: MemorySizeCalculator */
    public static final class a {
        @VisibleForTesting
        static final int MEMORY_CACHE_TARGET_SCREENS = 2;
        static final int hB = (VERSION.SDK_INT < 26 ? 4 : 1);
        static final float hC = 0.4f;
        static final float hD = 0.33f;
        static final int hE = 4194304;
        final Context context;
        ActivityManager hF;
        c hG;
        float hH = 2.0f;
        float hI = ((float) hB);
        float hJ = 0.4f;
        float hK = 0.33f;
        int hL = hE;

        public a(Context context) {
            this.context = context;
            this.hF = (ActivityManager) context.getSystemService("activity");
            this.hG = new b(context.getResources().getDisplayMetrics());
            if (VERSION.SDK_INT >= 26 && l.a(this.hF)) {
                this.hI = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
            }
        }

        public a c(float f) {
            i.a(f >= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, "Memory cache screens must be greater than or equal to 0");
            this.hH = f;
            return this;
        }

        public a d(float f) {
            i.a(f >= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, "Bitmap pool screens must be greater than or equal to 0");
            this.hI = f;
            return this;
        }

        public a e(float f) {
            boolean z = f >= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO && f <= 1.0f;
            i.a(z, "Size multiplier must be between 0 and 1");
            this.hJ = f;
            return this;
        }

        public a f(float f) {
            boolean z = f >= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO && f <= 1.0f;
            i.a(z, "Low memory max size multiplier must be between 0 and 1");
            this.hK = f;
            return this;
        }

        public a t(int i) {
            this.hL = i;
            return this;
        }

        @VisibleForTesting
        a setActivityManager(ActivityManager activityManager) {
            this.hF = activityManager;
            return this;
        }

        @VisibleForTesting
        a setScreenDimensions(c cVar) {
            this.hG = cVar;
            return this;
        }

        public l bD() {
            return new l(this);
        }
    }

    /* compiled from: MemorySizeCalculator */
    interface c {
        int bE();

        int bF();
    }

    /* compiled from: MemorySizeCalculator */
    private static final class b implements c {
        private final DisplayMetrics hM;

        b(DisplayMetrics displayMetrics) {
            this.hM = displayMetrics;
        }

        public int bE() {
            return this.hM.widthPixels;
        }

        public int bF() {
            return this.hM.heightPixels;
        }
    }

    l(a aVar) {
        int i;
        this.context = aVar.context;
        if (a(aVar.hF)) {
            i = aVar.hL / 2;
        } else {
            i = aVar.hL;
        }
        this.hA = i;
        i = a(aVar.hF, aVar.hJ, aVar.hK);
        float bE = (float) ((aVar.hG.bE() * aVar.hG.bF()) * 4);
        int round = Math.round(aVar.hI * bE);
        int round2 = Math.round(bE * aVar.hH);
        int i2 = i - this.hA;
        int i3 = round2 + round;
        if (i3 <= i2) {
            this.hz = round2;
            this.hy = round;
        } else {
            bE = ((float) i2) / (aVar.hI + aVar.hH);
            this.hz = Math.round(aVar.hH * bE);
            this.hy = Math.round(bE * aVar.hI);
        }
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Calculation complete, Calculated memory cache size: ");
            stringBuilder.append(s(this.hz));
            stringBuilder.append(", pool size: ");
            stringBuilder.append(s(this.hy));
            stringBuilder.append(", byte array size: ");
            stringBuilder.append(s(this.hA));
            stringBuilder.append(", memory class limited? ");
            stringBuilder.append(i3 > i);
            stringBuilder.append(", max size: ");
            stringBuilder.append(s(i));
            stringBuilder.append(", memoryClass: ");
            stringBuilder.append(aVar.hF.getMemoryClass());
            stringBuilder.append(", isLowMemoryDevice: ");
            stringBuilder.append(a(aVar.hF));
            Log.d(str, stringBuilder.toString());
        }
    }

    public int bA() {
        return this.hz;
    }

    public int bB() {
        return this.hy;
    }

    public int bC() {
        return this.hA;
    }

    private static int a(ActivityManager activityManager, float f, float f2) {
        float memoryClass = (float) ((activityManager.getMemoryClass() * 1024) * 1024);
        if (a(activityManager)) {
            f = f2;
        }
        return Math.round(memoryClass * f);
    }

    private String s(int i) {
        return Formatter.formatFileSize(this.context, (long) i);
    }

    @TargetApi(19)
    static boolean a(ActivityManager activityManager) {
        if (VERSION.SDK_INT >= 19) {
            return activityManager.isLowRamDevice();
        }
        return true;
    }
}
