package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;

/* compiled from: LruArrayPool */
public final class i implements b {
    private static final int DEFAULT_SIZE = 4194304;
    @VisibleForTesting
    static final int MAX_OVER_SIZE_MULTIPLE = 8;
    private static final int gD = 2;
    private final b gE;
    private final Map<Class<?>, NavigableMap<Integer, Integer>> gF;
    private final Map<Class<?>, a<?>> gG;
    private int gH;
    private final g<a, Object> gw;
    private final int maxSize;

    /* compiled from: LruArrayPool */
    private static final class a implements l {
        private final b gI;
        private Class<?> gJ;
        int size;

        a(b bVar) {
            this.gI = bVar;
        }

        void d(int i, Class<?> cls) {
            this.size = i;
            this.gJ = cls;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            if (this.size == aVar.size && this.gJ == aVar.gJ) {
                z = true;
            }
            return z;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Key{size=");
            stringBuilder.append(this.size);
            stringBuilder.append("array=");
            stringBuilder.append(this.gJ);
            stringBuilder.append('}');
            return stringBuilder.toString();
        }

        public void bg() {
            this.gI.a(this);
        }

        public int hashCode() {
            return (31 * this.size) + (this.gJ != null ? this.gJ.hashCode() : 0);
        }
    }

    /* compiled from: LruArrayPool */
    private static final class b extends c<a> {
        b() {
        }

        a e(int i, Class<?> cls) {
            a aVar = (a) bj();
            aVar.d(i, cls);
            return aVar;
        }

        /* renamed from: bn */
        protected a bi() {
            return new a(this);
        }
    }

    @VisibleForTesting
    public i() {
        this.gw = new g();
        this.gE = new b();
        this.gF = new HashMap();
        this.gG = new HashMap();
        this.maxSize = DEFAULT_SIZE;
    }

    public i(int i) {
        this.gw = new g();
        this.gE = new b();
        this.gF = new HashMap();
        this.gG = new HashMap();
        this.maxSize = i;
    }

    @Deprecated
    public <T> void a(T t, Class<T> cls) {
        put(t);
    }

    public synchronized <T> void put(T t) {
        Class cls = t.getClass();
        a g = g(cls);
        int l = g.l(t);
        int be = g.be() * l;
        if (o(be)) {
            a e = this.gE.e(l, cls);
            this.gw.a(e, t);
            NavigableMap f = f(cls);
            Integer num = (Integer) f.get(Integer.valueOf(e.size));
            Integer valueOf = Integer.valueOf(e.size);
            int i = 1;
            if (num != null) {
                i = 1 + num.intValue();
            }
            f.put(valueOf, Integer.valueOf(i));
            this.gH += be;
            bl();
        }
    }

    public synchronized <T> T b(int i, Class<T> cls) {
        return a(this.gE.e(i, cls), (Class) cls);
    }

    public synchronized <T> T a(int i, Class<T> cls) {
        a e;
        Integer num = (Integer) f(cls).ceilingKey(Integer.valueOf(i));
        if (a(i, num)) {
            e = this.gE.e(num.intValue(), cls);
        } else {
            e = this.gE.e(i, cls);
        }
        return a(e, (Class) cls);
    }

    private <T> T a(a aVar, Class<T> cls) {
        a g = g(cls);
        T a = a(aVar);
        if (a != null) {
            this.gH -= g.l(a) * g.be();
            c(g.l(a), cls);
        }
        if (a != null) {
            return a;
        }
        if (Log.isLoggable(g.getTag(), 2)) {
            String tag = g.getTag();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Allocated ");
            stringBuilder.append(aVar.size);
            stringBuilder.append(" bytes");
            Log.v(tag, stringBuilder.toString());
        }
        return g.newArray(aVar.size);
    }

    @Nullable
    private <T> T a(a aVar) {
        return this.gw.b((l) aVar);
    }

    private boolean o(int i) {
        return i <= this.maxSize / 2;
    }

    private boolean a(int i, Integer num) {
        return num != null && (bk() || num.intValue() <= 8 * i);
    }

    private boolean bk() {
        return this.gH == 0 || this.maxSize / this.gH >= 2;
    }

    public synchronized void i() {
        p(0);
    }

    public synchronized void trimMemory(int i) {
        if (i >= 40) {
            i();
        } else if (i >= 20 || i == 15) {
            p(this.maxSize / 2);
        }
    }

    private void bl() {
        p(this.maxSize);
    }

    private void p(int i) {
        while (this.gH > i) {
            Object removeLast = this.gw.removeLast();
            com.bumptech.glide.util.i.checkNotNull(removeLast);
            a m = m(removeLast);
            this.gH -= m.l(removeLast) * m.be();
            c(m.l(removeLast), removeLast.getClass());
            if (Log.isLoggable(m.getTag(), 2)) {
                String tag = m.getTag();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("evicted: ");
                stringBuilder.append(m.l(removeLast));
                Log.v(tag, stringBuilder.toString());
            }
        }
    }

    private void c(int i, Class<?> cls) {
        NavigableMap f = f(cls);
        Integer num = (Integer) f.get(Integer.valueOf(i));
        if (num == null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Tried to decrement empty size, size: ");
            stringBuilder.append(i);
            stringBuilder.append(", this: ");
            stringBuilder.append(this);
            throw new NullPointerException(stringBuilder.toString());
        } else if (num.intValue() == 1) {
            f.remove(Integer.valueOf(i));
        } else {
            f.put(Integer.valueOf(i), Integer.valueOf(num.intValue() - 1));
        }
    }

    private NavigableMap<Integer, Integer> f(Class<?> cls) {
        NavigableMap<Integer, Integer> navigableMap = (NavigableMap) this.gF.get(cls);
        if (navigableMap != null) {
            return navigableMap;
        }
        NavigableMap treeMap = new TreeMap();
        this.gF.put(cls, treeMap);
        return treeMap;
    }

    private <T> a<T> m(T t) {
        return g(t.getClass());
    }

    private <T> a<T> g(Class<T> cls) {
        a<T> aVar = (a) this.gG.get(cls);
        if (aVar == null) {
            if (cls.equals(int[].class)) {
                aVar = new h();
            } else if (cls.equals(byte[].class)) {
                aVar = new f();
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("No array pool found for: ");
                stringBuilder.append(cls.getSimpleName());
                throw new IllegalArgumentException(stringBuilder.toString());
            }
            this.gG.put(cls, aVar);
        }
        return aVar;
    }

    int bm() {
        int i = 0;
        for (Class cls : this.gF.keySet()) {
            for (Integer num : ((NavigableMap) this.gF.get(cls)).keySet()) {
                i += (num.intValue() * ((Integer) ((NavigableMap) this.gF.get(cls)).get(num)).intValue()) * g(cls).be();
            }
        }
        return i;
    }
}
