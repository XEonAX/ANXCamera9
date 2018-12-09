package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.TreeMap;

@RequiresApi(19)
public class SizeConfigStrategy implements k {
    private static final int gU = 8;
    private static final Config[] gV;
    private static final Config[] gW = gV;
    private static final Config[] gX = new Config[]{Config.RGB_565};
    private static final Config[] gY = new Config[]{Config.ARGB_4444};
    private static final Config[] gZ = new Config[]{Config.ALPHA_8};
    private final Map<Config, NavigableMap<Integer, Integer>> gF = new HashMap();
    private final g<Key, Bitmap> gw = new g();
    private final KeyPool ha = new KeyPool();

    /* renamed from: com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$1 */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] hb = new int[Config.values().length];

        static {
            try {
                hb[Config.ARGB_8888.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                hb[Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                hb[Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                hb[Config.ALPHA_8.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    @VisibleForTesting
    static final class Key implements l {
        private Config config;
        private final KeyPool hc;
        int size;

        public Key(KeyPool keyPool) {
            this.hc = keyPool;
        }

        @VisibleForTesting
        Key(KeyPool keyPool, int i, Config config) {
            this(keyPool);
            c(i, config);
        }

        public void c(int i, Config config) {
            this.size = i;
            this.config = config;
        }

        public void bg() {
            this.hc.a(this);
        }

        public String toString() {
            return SizeConfigStrategy.b(this.size, this.config);
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            Key key = (Key) obj;
            if (this.size == key.size && k.b(this.config, key.config)) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * this.size) + (this.config != null ? this.config.hashCode() : 0);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        public Key d(int i, Config config) {
            Key key = (Key) bj();
            key.c(i, config);
            return key;
        }

        /* renamed from: br */
        protected Key bi() {
            return new Key(this);
        }
    }

    static {
        Config[] configArr = new Config[]{Config.ARGB_8888, null};
        if (VERSION.SDK_INT >= 26) {
            configArr = (Config[]) Arrays.copyOf(configArr, configArr.length + 1);
            configArr[configArr.length - 1] = Config.RGBA_F16;
        }
        gV = configArr;
    }

    public void d(Bitmap bitmap) {
        Key d = this.ha.d(k.p(bitmap), bitmap.getConfig());
        this.gw.a(d, bitmap);
        NavigableMap c = c(bitmap.getConfig());
        Integer num = (Integer) c.get(Integer.valueOf(d.size));
        Integer valueOf = Integer.valueOf(d.size);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        c.put(valueOf, Integer.valueOf(i));
    }

    @Nullable
    public Bitmap b(int i, int i2, Config config) {
        l a = a(k.i(i, i2, config), config);
        Bitmap bitmap = (Bitmap) this.gw.b(a);
        if (bitmap != null) {
            a(Integer.valueOf(a.size), bitmap);
            bitmap.reconfigure(i, i2, bitmap.getConfig() != null ? bitmap.getConfig() : Config.ARGB_8888);
        }
        return bitmap;
    }

    private Key a(int i, Config config) {
        Key d = this.ha.d(i, config);
        Config[] d2 = d(config);
        int length = d2.length;
        int i2 = 0;
        while (i2 < length) {
            Config config2 = d2[i2];
            Integer num = (Integer) c(config2).ceilingKey(Integer.valueOf(i));
            if (num == null || num.intValue() > i * 8) {
                i2++;
            } else {
                if (num.intValue() == i) {
                    if (config2 == null) {
                        if (config == null) {
                            return d;
                        }
                    } else if (config2.equals(config)) {
                        return d;
                    }
                }
                this.ha.a(d);
                return this.ha.d(num.intValue(), config2);
            }
        }
        return d;
    }

    @Nullable
    public Bitmap bf() {
        Bitmap bitmap = (Bitmap) this.gw.removeLast();
        if (bitmap != null) {
            a(Integer.valueOf(k.p(bitmap)), bitmap);
        }
        return bitmap;
    }

    private void a(Integer num, Bitmap bitmap) {
        NavigableMap c = c(bitmap.getConfig());
        Integer num2 = (Integer) c.get(num);
        if (num2 == null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Tried to decrement empty size, size: ");
            stringBuilder.append(num);
            stringBuilder.append(", removed: ");
            stringBuilder.append(e(bitmap));
            stringBuilder.append(", this: ");
            stringBuilder.append(this);
            throw new NullPointerException(stringBuilder.toString());
        } else if (num2.intValue() == 1) {
            c.remove(num);
        } else {
            c.put(num, Integer.valueOf(num2.intValue() - 1));
        }
    }

    private NavigableMap<Integer, Integer> c(Config config) {
        NavigableMap<Integer, Integer> navigableMap = (NavigableMap) this.gF.get(config);
        if (navigableMap != null) {
            return navigableMap;
        }
        NavigableMap treeMap = new TreeMap();
        this.gF.put(config, treeMap);
        return treeMap;
    }

    public String e(Bitmap bitmap) {
        return b(k.p(bitmap), bitmap.getConfig());
    }

    public String c(int i, int i2, Config config) {
        return b(k.i(i, i2, config), config);
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SizeConfigStrategy{groupedMap=");
        stringBuilder.append(this.gw);
        stringBuilder.append(", sortedSizes=(");
        for (Entry entry : this.gF.entrySet()) {
            stringBuilder.append(entry.getKey());
            stringBuilder.append('[');
            stringBuilder.append(entry.getValue());
            stringBuilder.append("], ");
        }
        if (!this.gF.isEmpty()) {
            stringBuilder.replace(stringBuilder.length() - 2, stringBuilder.length(), "");
        }
        stringBuilder.append(")}");
        return stringBuilder.toString();
    }

    static String b(int i, Config config) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        stringBuilder.append(i);
        stringBuilder.append("](");
        stringBuilder.append(config);
        stringBuilder.append(")");
        return stringBuilder.toString();
    }

    private static Config[] d(Config config) {
        if (VERSION.SDK_INT >= 26 && Config.RGBA_F16.equals(config)) {
            return gW;
        }
        switch (AnonymousClass1.hb[config.ordinal()]) {
            case 1:
                return gV;
            case 2:
                return gX;
            case 3:
                return gY;
            case 4:
                return gZ;
            default:
                return new Config[]{config};
        }
    }
}
