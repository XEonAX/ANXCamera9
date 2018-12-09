package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.k;

class AttributeStrategy implements k {
    private final KeyPool gv = new KeyPool();
    private final g<Key, Bitmap> gw = new g();

    @VisibleForTesting
    static class Key implements l {
        private Config config;
        private final KeyPool gx;
        private int height;
        private int width;

        public Key(KeyPool keyPool) {
            this.gx = keyPool;
        }

        public void e(int i, int i2, Config config) {
            this.width = i;
            this.height = i2;
            this.config = config;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof Key)) {
                return false;
            }
            Key key = (Key) obj;
            if (this.width == key.width && this.height == key.height && this.config == key.config) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * ((this.width * 31) + this.height)) + (this.config != null ? this.config.hashCode() : 0);
        }

        public String toString() {
            return AttributeStrategy.d(this.width, this.height, this.config);
        }

        public void bg() {
            this.gx.a(this);
        }
    }

    @VisibleForTesting
    static class KeyPool extends c<Key> {
        KeyPool() {
        }

        Key f(int i, int i2, Config config) {
            Key key = (Key) bj();
            key.e(i, i2, config);
            return key;
        }

        /* renamed from: bh */
        protected Key bi() {
            return new Key(this);
        }
    }

    AttributeStrategy() {
    }

    public void d(Bitmap bitmap) {
        this.gw.a(this.gv.f(bitmap.getWidth(), bitmap.getHeight(), bitmap.getConfig()), bitmap);
    }

    public Bitmap b(int i, int i2, Config config) {
        return (Bitmap) this.gw.b(this.gv.f(i, i2, config));
    }

    public Bitmap bf() {
        return (Bitmap) this.gw.removeLast();
    }

    public String e(Bitmap bitmap) {
        return g(bitmap);
    }

    public String c(int i, int i2, Config config) {
        return d(i, i2, config);
    }

    public int f(Bitmap bitmap) {
        return k.p(bitmap);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("AttributeStrategy:\n  ");
        stringBuilder.append(this.gw);
        return stringBuilder.toString();
    }

    private static String g(Bitmap bitmap) {
        return d(bitmap.getWidth(), bitmap.getHeight(), bitmap.getConfig());
    }

    static String d(int i, int i2, Config config) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        stringBuilder.append(i);
        stringBuilder.append("x");
        stringBuilder.append(i2);
        stringBuilder.append("], ");
        stringBuilder.append(config);
        return stringBuilder.toString();
    }
}
