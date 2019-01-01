package android.support.v4.util;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class LruCache<K, V> {
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private final LinkedHashMap<K, V> map;
    private int maxSize;
    private int missCount;
    private int putCount;
    private int size;

    public LruCache(int maxSize) {
        if (maxSize > 0) {
            this.maxSize = maxSize;
            this.map = new LinkedHashMap(0, 0.75f, true);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    public void resize(int maxSize) {
        if (maxSize > 0) {
            synchronized (this) {
                this.maxSize = maxSize;
            }
            trimToSize(maxSize);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    /* JADX WARNING: Missing block: B:12:0x001b, code:
            r2 = create(r6);
     */
    /* JADX WARNING: Missing block: B:13:0x001f, code:
            if (r2 != null) goto L_0x0022;
     */
    /* JADX WARNING: Missing block: B:14:0x0021, code:
            return null;
     */
    /* JADX WARNING: Missing block: B:15:0x0022, code:
            monitor-enter(r5);
     */
    /* JADX WARNING: Missing block: B:17:?, code:
            r5.createCount++;
            r1 = r5.map.put(r6, r2);
     */
    /* JADX WARNING: Missing block: B:18:0x0030, code:
            if (r1 == null) goto L_0x0038;
     */
    /* JADX WARNING: Missing block: B:19:0x0032, code:
            r5.map.put(r6, r1);
     */
    /* JADX WARNING: Missing block: B:20:0x0038, code:
            r5.size += safeSizeOf(r6, r2);
     */
    /* JADX WARNING: Missing block: B:21:0x0041, code:
            monitor-exit(r5);
     */
    /* JADX WARNING: Missing block: B:22:0x0042, code:
            if (r1 == null) goto L_0x0049;
     */
    /* JADX WARNING: Missing block: B:23:0x0044, code:
            entryRemoved(false, r6, r2, r1);
     */
    /* JADX WARNING: Missing block: B:24:0x0048, code:
            return r1;
     */
    /* JADX WARNING: Missing block: B:25:0x0049, code:
            trimToSize(r5.maxSize);
     */
    /* JADX WARNING: Missing block: B:26:0x004e, code:
            return r2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final V get(K key) {
        Throwable th;
        if (key != null) {
            synchronized (this) {
                V mapValue;
                try {
                    mapValue = this.map.get(key);
                    if (mapValue != null) {
                        try {
                            this.hitCount++;
                            return mapValue;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    }
                    this.missCount++;
                } catch (Throwable th3) {
                    Throwable th4 = th3;
                    mapValue = null;
                    th = th4;
                    throw th;
                }
            }
        }
        throw new NullPointerException("key == null");
    }

    public final V put(K key, V value) {
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        V previous;
        synchronized (this) {
            this.putCount++;
            this.size += safeSizeOf(key, value);
            previous = this.map.put(key, value);
            if (previous != null) {
                this.size -= safeSizeOf(key, previous);
            }
        }
        if (previous != null) {
            entryRemoved(false, key, previous, value);
        }
        trimToSize(this.maxSize);
        return previous;
    }

    /* JADX WARNING: Missing block: B:18:0x0055, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void trimToSize(int maxSize) {
        StringBuilder stringBuilder;
        V value = null;
        while (true) {
            K key;
            synchronized (this) {
                if (this.size < 0 || (this.map.isEmpty() && this.size != 0)) {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append(getClass().getName());
                    stringBuilder.append(".sizeOf() is reporting inconsistent results!");
                } else if (this.size <= maxSize || this.map.isEmpty()) {
                    break;
                } else {
                    Entry<K, V> toEvict = (Entry) this.map.entrySet().iterator().next();
                    key = toEvict.getKey();
                    value = toEvict.getValue();
                    this.map.remove(key);
                    this.size -= safeSizeOf(key, value);
                    this.evictionCount++;
                }
            }
            entryRemoved(true, key, value, null);
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(getClass().getName());
        stringBuilder.append(".sizeOf() is reporting inconsistent results!");
        throw new IllegalStateException(stringBuilder.toString());
    }

    /* JADX WARNING: Missing block: B:9:0x0016, code:
            if (r1 == null) goto L_0x001c;
     */
    /* JADX WARNING: Missing block: B:10:0x0018, code:
            entryRemoved(false, r6, r1, null);
     */
    /* JADX WARNING: Missing block: B:11:0x001c, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final V remove(K key) {
        Throwable th;
        if (key != null) {
            synchronized (this) {
                try {
                    V previous = this.map.remove(key);
                    if (previous != null) {
                        try {
                            this.size -= safeSizeOf(key, previous);
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    }
                } catch (Throwable th3) {
                    Throwable th4 = th3;
                    Object obj = null;
                    th = th4;
                    throw th;
                }
            }
        }
        throw new NullPointerException("key == null");
    }

    protected void entryRemoved(boolean evicted, K k, V v, V v2) {
    }

    protected V create(K k) {
        return null;
    }

    private int safeSizeOf(K key, V value) {
        int result = sizeOf(key, value);
        if (result >= 0) {
            return result;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Negative size: ");
        stringBuilder.append(key);
        stringBuilder.append("=");
        stringBuilder.append(value);
        throw new IllegalStateException(stringBuilder.toString());
    }

    protected int sizeOf(K k, V v) {
        return 1;
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    public final synchronized int size() {
        return this.size;
    }

    public final synchronized int maxSize() {
        return this.maxSize;
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int createCount() {
        return this.createCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }

    public final synchronized Map<K, V> snapshot() {
        return new LinkedHashMap(this.map);
    }

    public final synchronized String toString() {
        int hitPercent;
        int accesses = this.hitCount + this.missCount;
        hitPercent = accesses != 0 ? (100 * this.hitCount) / accesses : 0;
        return String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", new Object[]{Integer.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(hitPercent)});
    }
}
