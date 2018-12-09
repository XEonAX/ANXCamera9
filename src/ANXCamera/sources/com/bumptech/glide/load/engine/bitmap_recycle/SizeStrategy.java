package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;
import java.util.NavigableMap;

@RequiresApi(19)
final class SizeStrategy implements k {
    private static final int gU = 8;
    private final g<Key, Bitmap> gw = new g();
    private final KeyPool hd = new KeyPool();
    private final NavigableMap<Integer, Integer> he = new PrettyPrintTreeMap();

    @VisibleForTesting
    static final class Key implements l {
        private final KeyPool hf;
        int size;

        Key(KeyPool keyPool) {
            this.hf = keyPool;
        }

        public void init(int i) {
            this.size = i;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            if (this.size == ((Key) obj).size) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return this.size;
        }

        public String toString() {
            return SizeStrategy.q(this.size);
        }

        public void bg() {
            this.hf.a(this);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        public Key r(int i) {
            Key key = (Key) super.bj();
            key.init(i);
            return key;
        }

        /* renamed from: bs */
        protected Key bi() {
            return new Key(this);
        }
    }

    SizeStrategy() {
    }

    public void d(Bitmap bitmap) {
        Key r = this.hd.r(k.p(bitmap));
        this.gw.a(r, bitmap);
        Integer num = (Integer) this.he.get(Integer.valueOf(r.size));
        NavigableMap navigableMap = this.he;
        Integer valueOf = Integer.valueOf(r.size);
        int i = 1;
        if (num != null) {
            i = 1 + num.intValue();
        }
        navigableMap.put(valueOf, Integer.valueOf(i));
    }

    @Nullable
    public Bitmap b(int i, int i2, Config config) {
        int i3 = k.i(i, i2, config);
        l r = this.hd.r(i3);
        Integer num = (Integer) this.he.ceilingKey(Integer.valueOf(i3));
        if (!(num == null || num.intValue() == i3 || num.intValue() > i3 * 8)) {
            this.hd.a(r);
            r = this.hd.r(num.intValue());
        }
        Bitmap bitmap = (Bitmap) this.gw.b(r);
        if (bitmap != null) {
            bitmap.reconfigure(i, i2, config);
            c(num);
        }
        return bitmap;
    }

    @Nullable
    public Bitmap bf() {
        Bitmap bitmap = (Bitmap) this.gw.removeLast();
        if (bitmap != null) {
            c(Integer.valueOf(k.p(bitmap)));
        }
        return bitmap;
    }

    private void c(Integer num) {
        Integer num2 = (Integer) this.he.get(num);
        if (num2.intValue() == 1) {
            this.he.remove(num);
        } else {
            this.he.put(num, Integer.valueOf(num2.intValue() - 1));
        }
    }

    public String e(Bitmap bitmap) {
        return g(bitmap);
    }

    public String c(int i, int i2, Config config) {
        return q(k.i(i, i2, config));
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("SizeStrategy:\n  ");
        stringBuilder.append(this.gw);
        stringBuilder.append("\n  SortedSizes");
        stringBuilder.append(this.he);
        return stringBuilder.toString();
    }

    private static String g(Bitmap bitmap) {
        return q(k.p(bitmap));
    }

    static String q(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        stringBuilder.append(i);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
