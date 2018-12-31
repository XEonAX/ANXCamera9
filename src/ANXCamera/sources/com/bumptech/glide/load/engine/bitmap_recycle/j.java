package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* compiled from: LruBitmapPool */
public class j implements d {
    private static final Config DEFAULT_CONFIG = Config.ARGB_8888;
    private static final String TAG = "LruBitmapPool";
    private final k gK;
    private final Set<Config> gL;
    private final long gM;
    private final a gN;
    private long gO;
    private int gP;
    private int gQ;
    private int gR;
    private int gS;
    private long maxSize;

    /* compiled from: LruBitmapPool */
    private interface a {
        void j(Bitmap bitmap);

        void k(Bitmap bitmap);
    }

    /* compiled from: LruBitmapPool */
    private static final class b implements a {
        b() {
        }

        public void j(Bitmap bitmap) {
        }

        public void k(Bitmap bitmap) {
        }
    }

    /* compiled from: LruBitmapPool */
    private static class c implements a {
        private final Set<Bitmap> gT = Collections.synchronizedSet(new HashSet());

        private c() {
        }

        public void j(Bitmap bitmap) {
            if (this.gT.contains(bitmap)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Can't add already added bitmap: ");
                stringBuilder.append(bitmap);
                stringBuilder.append(" [");
                stringBuilder.append(bitmap.getWidth());
                stringBuilder.append("x");
                stringBuilder.append(bitmap.getHeight());
                stringBuilder.append("]");
                throw new IllegalStateException(stringBuilder.toString());
            }
            this.gT.add(bitmap);
        }

        public void k(Bitmap bitmap) {
            if (this.gT.contains(bitmap)) {
                this.gT.remove(bitmap);
                return;
            }
            throw new IllegalStateException("Cannot remove bitmap not in tracker");
        }
    }

    j(long j, k kVar, Set<Config> set) {
        this.gM = j;
        this.maxSize = j;
        this.gK = kVar;
        this.gL = set;
        this.gN = new b();
    }

    public j(long j) {
        this(j, bp(), bq());
    }

    public j(long j, Set<Config> set) {
        this(j, bp(), set);
    }

    public long getMaxSize() {
        return this.maxSize;
    }

    public synchronized void b(float f) {
        this.maxSize = (long) Math.round(((float) this.gM) * f);
        bl();
    }

    public synchronized void d(Bitmap bitmap) {
        String str;
        StringBuilder stringBuilder;
        if (bitmap == null) {
            throw new NullPointerException("Bitmap must not be null");
        } else if (bitmap.isRecycled()) {
            throw new IllegalStateException("Cannot pool recycled bitmap");
        } else if (bitmap.isMutable() && ((long) this.gK.f(bitmap)) <= this.maxSize && this.gL.contains(bitmap.getConfig())) {
            int f = this.gK.f(bitmap);
            this.gK.d(bitmap);
            this.gN.j(bitmap);
            this.gR++;
            this.gO += (long) f;
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Put bitmap in pool=");
                stringBuilder.append(this.gK.e(bitmap));
                Log.v(str, stringBuilder.toString());
            }
            dump();
            bl();
        } else {
            if (Log.isLoggable(TAG, 2)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Reject bitmap from pool, bitmap: ");
                stringBuilder.append(this.gK.e(bitmap));
                stringBuilder.append(", is mutable: ");
                stringBuilder.append(bitmap.isMutable());
                stringBuilder.append(", is allowed config: ");
                stringBuilder.append(this.gL.contains(bitmap.getConfig()));
                Log.v(str, stringBuilder.toString());
            }
            bitmap.recycle();
        }
    }

    private void bl() {
        a(this.maxSize);
    }

    @NonNull
    public Bitmap b(int i, int i2, Config config) {
        Bitmap h = h(i, i2, config);
        if (h == null) {
            return createBitmap(i, i2, config);
        }
        h.eraseColor(0);
        return h;
    }

    @NonNull
    public Bitmap g(int i, int i2, Config config) {
        Bitmap h = h(i, i2, config);
        if (h == null) {
            return createBitmap(i, i2, config);
        }
        return h;
    }

    @NonNull
    private static Bitmap createBitmap(int i, int i2, @Nullable Config config) {
        if (config == null) {
            config = DEFAULT_CONFIG;
        }
        return Bitmap.createBitmap(i, i2, config);
    }

    @TargetApi(26)
    private static void b(Config config) {
        if (VERSION.SDK_INT >= 26 && config == Config.HARDWARE) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Cannot create a mutable Bitmap with config: ");
            stringBuilder.append(config);
            stringBuilder.append(". Consider setting Downsampler#ALLOW_HARDWARE_CONFIG to false in your RequestOptions and/or in GlideBuilder.setDefaultRequestOptions");
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    @Nullable
    private synchronized Bitmap h(int i, int i2, @Nullable Config config) {
        Bitmap b;
        String str;
        StringBuilder stringBuilder;
        b(config);
        b = this.gK.b(i, i2, config != null ? config : DEFAULT_CONFIG);
        if (b == null) {
            if (Log.isLoggable(TAG, 3)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Missing bitmap=");
                stringBuilder.append(this.gK.c(i, i2, config));
                Log.d(str, stringBuilder.toString());
            }
            this.gQ++;
        } else {
            this.gP++;
            this.gO -= (long) this.gK.f(b);
            this.gN.k(b);
            h(b);
        }
        if (Log.isLoggable(TAG, 2)) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Get bitmap=");
            stringBuilder.append(this.gK.c(i, i2, config));
            Log.v(str, stringBuilder.toString());
        }
        dump();
        return b;
    }

    private static void h(Bitmap bitmap) {
        bitmap.setHasAlpha(true);
        i(bitmap);
    }

    @TargetApi(19)
    private static void i(Bitmap bitmap) {
        if (VERSION.SDK_INT >= 19) {
            bitmap.setPremultiplied(true);
        }
    }

    public void i() {
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "clearMemory");
        }
        a(0);
    }

    @SuppressLint({"InlinedApi"})
    public void trimMemory(int i) {
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("trimMemory, level=");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
        }
        if (i >= 40) {
            i();
        } else if (i >= 20 || i == 15) {
            a(getMaxSize() / 2);
        }
    }

    private synchronized void a(long j) {
        while (this.gO > j) {
            Bitmap bf = this.gK.bf();
            if (bf == null) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Size mismatch, resetting");
                    bo();
                }
                this.gO = 0;
                return;
            }
            this.gN.k(bf);
            this.gO -= (long) this.gK.f(bf);
            this.gS++;
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Evicting bitmap=");
                stringBuilder.append(this.gK.e(bf));
                Log.d(str, stringBuilder.toString());
            }
            dump();
            bf.recycle();
        }
    }

    private void dump() {
        if (Log.isLoggable(TAG, 2)) {
            bo();
        }
    }

    private void bo() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Hits=");
        stringBuilder.append(this.gP);
        stringBuilder.append(", misses=");
        stringBuilder.append(this.gQ);
        stringBuilder.append(", puts=");
        stringBuilder.append(this.gR);
        stringBuilder.append(", evictions=");
        stringBuilder.append(this.gS);
        stringBuilder.append(", currentSize=");
        stringBuilder.append(this.gO);
        stringBuilder.append(", maxSize=");
        stringBuilder.append(this.maxSize);
        stringBuilder.append("\nStrategy=");
        stringBuilder.append(this.gK);
        Log.v(str, stringBuilder.toString());
    }

    private static k bp() {
        if (VERSION.SDK_INT >= 19) {
            return new SizeConfigStrategy();
        }
        return new AttributeStrategy();
    }

    @TargetApi(26)
    private static Set<Config> bq() {
        Set hashSet = new HashSet(Arrays.asList(Config.values()));
        if (VERSION.SDK_INT >= 19) {
            hashSet.add(null);
        }
        if (VERSION.SDK_INT >= 26) {
            hashSet.remove(Config.HARDWARE);
        }
        return Collections.unmodifiableSet(hashSet);
    }
}
