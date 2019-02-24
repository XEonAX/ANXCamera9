package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LruCache */
public class f<T, Y> {
    private final long gM;
    private long gO;
    private long maxSize;
    private final Map<T, Y> pm = new LinkedHashMap(100, 0.75f, true);

    public f(long j) {
        this.gM = j;
        this.maxSize = j;
    }

    public synchronized void b(float f) {
        if (f >= 0.0f) {
            this.maxSize = (long) Math.round(((float) this.gM) * f);
            bl();
        } else {
            throw new IllegalArgumentException("Multiplier must be >= 0");
        }
    }

    protected int n(@Nullable Y y) {
        return 1;
    }

    protected synchronized int getCount() {
        return this.pm.size();
    }

    protected void a(@NonNull T t, @Nullable Y y) {
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public synchronized long bz() {
        return this.gO;
    }

    public synchronized boolean contains(@NonNull T t) {
        return this.pm.containsKey(t);
    }

    @Nullable
    public synchronized Y get(@NonNull T t) {
        return this.pm.get(t);
    }

    @Nullable
    public synchronized Y put(@NonNull T t, @Nullable Y y) {
        long n = (long) n(y);
        if (n >= this.maxSize) {
            a(t, y);
            return null;
        }
        if (y != null) {
            this.gO += n;
        }
        Y put = this.pm.put(t, y);
        if (put != null) {
            this.gO -= (long) n(put);
            if (!put.equals(y)) {
                a(t, put);
            }
        }
        bl();
        return put;
    }

    @Nullable
    public synchronized Y remove(@NonNull T t) {
        Y remove;
        remove = this.pm.remove(t);
        if (remove != null) {
            this.gO -= (long) n(remove);
        }
        return remove;
    }

    public void i() {
        a(0);
    }

    protected synchronized void a(long j) {
        while (this.gO > j) {
            Iterator it = this.pm.entrySet().iterator();
            Entry entry = (Entry) it.next();
            Object value = entry.getValue();
            this.gO -= (long) n(value);
            Object key = entry.getKey();
            it.remove();
            a(key, value);
        }
    }

    private void bl() {
        a(this.maxSize);
    }
}
