package miui.util;

import java.lang.ref.SoftReference;
import java.util.HashMap;
import miui.util.concurrent.ConcurrentRingQueue;

public final class Pools {
    private static final HashMap<Class<?>, InstanceHolder<?>> Jv = new HashMap();
    private static final HashMap<Class<?>, SoftReferenceInstanceHolder<?>> Jw = new HashMap();
    private static final Pool<StringBuilder> Jx = createSoftReferencePool(new Manager<StringBuilder>() {
        /* renamed from: db */
        public StringBuilder createInstance() {
            return new StringBuilder();
        }

        /* renamed from: a */
        public void onRelease(StringBuilder stringBuilder) {
            stringBuilder.setLength(0);
        }
    }, 4);

    public static abstract class Manager<T> {
        public abstract T createInstance();

        public void onAcquire(T t) {
        }

        public void onRelease(T t) {
        }

        public void onDestroy(T t) {
        }
    }

    public interface Pool<T> {
        T acquire();

        void close();

        int getSize();

        void release(T t);
    }

    static abstract class BasePool<T> implements Pool<T> {
        private final int Hf;
        private final Manager<T> Jy;
        private IInstanceHolder<T> Jz;
        private final Object zM = new Object() {
            protected void finalize() throws Throwable {
                try {
                    BasePool.this.close();
                } finally {
                    super.finalize();
                }
            }
        };

        abstract void a(IInstanceHolder<T> iInstanceHolder, int i);

        abstract IInstanceHolder<T> d(Class<T> cls, int i);

        public BasePool(Manager<T> manager, int i) {
            if (manager == null || i < 1) {
                this.Hf = this.zM.hashCode();
                throw new IllegalArgumentException("manager cannot be null and size cannot less then 1");
            }
            this.Jy = manager;
            this.Hf = i;
            Object createInstance = this.Jy.createInstance();
            if (createInstance != null) {
                this.Jz = d(createInstance.getClass(), i);
                doRelease(createInstance);
                return;
            }
            throw new IllegalStateException("manager create instance cannot return null");
        }

        protected final T doAcquire() {
            if (this.Jz != null) {
                T t = this.Jz.get();
                if (t == null) {
                    t = this.Jy.createInstance();
                    if (t == null) {
                        throw new IllegalStateException("manager create instance cannot return null");
                    }
                }
                this.Jy.onAcquire(t);
                return t;
            }
            throw new IllegalStateException("Cannot acquire object after close()");
        }

        protected final void doRelease(T t) {
            if (this.Jz == null) {
                throw new IllegalStateException("Cannot release object after close()");
            } else if (t != null) {
                this.Jy.onRelease(t);
                if (!this.Jz.put(t)) {
                    this.Jy.onDestroy(t);
                }
            }
        }

        public T acquire() {
            return doAcquire();
        }

        public void release(T t) {
            doRelease(t);
        }

        public void close() {
            if (this.Jz != null) {
                a(this.Jz, this.Hf);
                this.Jz = null;
            }
        }

        public int getSize() {
            return this.Jz == null ? 0 : this.Hf;
        }
    }

    private interface IInstanceHolder<T> {
        Class<T> dD();

        T get();

        int getSize();

        boolean put(T t);

        void resize(int i);
    }

    private static class InstanceHolder<T> implements IInstanceHolder<T> {
        private final Class<T> JB;
        private final ConcurrentRingQueue<T> JC;

        InstanceHolder(Class<T> cls, int i) {
            this.JB = cls;
            this.JC = new ConcurrentRingQueue(i, false, true);
        }

        public Class<T> dD() {
            return this.JB;
        }

        public int getSize() {
            return this.JC.getCapacity();
        }

        /* JADX WARNING: Missing block: B:20:0x002f, code:
            return;
     */
        public synchronized void resize(int r3) {
            /*
            r2 = this;
            monitor-enter(r2);
            r0 = r2.JC;	 Catch:{ all -> 0x0030 }
            r0 = r0.getCapacity();	 Catch:{ all -> 0x0030 }
            r3 = r3 + r0;
            if (r3 > 0) goto L_0x0020;
        L_0x000a:
            r3 = miui.util.Pools.Jv;	 Catch:{ all -> 0x0030 }
            monitor-enter(r3);	 Catch:{ all -> 0x0030 }
            r0 = miui.util.Pools.Jv;	 Catch:{ all -> 0x001d }
            r1 = r2.dD();	 Catch:{ all -> 0x001d }
            r0.remove(r1);	 Catch:{ all -> 0x001d }
            monitor-exit(r3);	 Catch:{ all -> 0x001d }
            monitor-exit(r2);
            return;
        L_0x001d:
            r0 = move-exception;
            monitor-exit(r3);	 Catch:{ all -> 0x001d }
            throw r0;	 Catch:{ all -> 0x0030 }
        L_0x0020:
            if (r3 <= 0) goto L_0x0028;
        L_0x0022:
            r0 = r2.JC;	 Catch:{ all -> 0x0030 }
            r0.increaseCapacity(r3);	 Catch:{ all -> 0x0030 }
            goto L_0x002e;
        L_0x0028:
            r0 = r2.JC;	 Catch:{ all -> 0x0030 }
            r3 = -r3;
            r0.decreaseCapacity(r3);	 Catch:{ all -> 0x0030 }
        L_0x002e:
            monitor-exit(r2);
            return;
        L_0x0030:
            r3 = move-exception;
            monitor-exit(r2);
            throw r3;
            */
            throw new UnsupportedOperationException("Method not decompiled: miui.util.Pools.InstanceHolder.resize(int):void");
        }

        public T get() {
            return this.JC.get();
        }

        public boolean put(T t) {
            return this.JC.put(t);
        }
    }

    public static class SimplePool<T> extends BasePool<T> {
        SimplePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.b(cls, i);
        }

        final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((InstanceHolder) iInstanceHolder, i);
        }
    }

    private static class SoftReferenceInstanceHolder<T> implements IInstanceHolder<T> {
        private volatile int Hf;
        private final Class<T> JB;
        private volatile SoftReference<T>[] JD;
        private volatile int mIndex = 0;

        SoftReferenceInstanceHolder(Class<T> cls, int i) {
            this.JB = cls;
            this.Hf = i;
            this.JD = new SoftReference[i];
        }

        public Class<T> dD() {
            return this.JB;
        }

        public int getSize() {
            return this.Hf;
        }

        /* JADX WARNING: Missing block: B:20:0x002e, code:
            return;
     */
        public synchronized void resize(int r4) {
            /*
            r3 = this;
            monitor-enter(r3);
            r0 = r3.Hf;	 Catch:{ all -> 0x002f }
            r4 = r4 + r0;
            if (r4 > 0) goto L_0x001c;
        L_0x0006:
            r4 = miui.util.Pools.Jw;	 Catch:{ all -> 0x002f }
            monitor-enter(r4);	 Catch:{ all -> 0x002f }
            r0 = miui.util.Pools.Jw;	 Catch:{ all -> 0x0019 }
            r1 = r3.dD();	 Catch:{ all -> 0x0019 }
            r0.remove(r1);	 Catch:{ all -> 0x0019 }
            monitor-exit(r4);	 Catch:{ all -> 0x0019 }
            monitor-exit(r3);
            return;
        L_0x0019:
            r0 = move-exception;
            monitor-exit(r4);	 Catch:{ all -> 0x0019 }
            throw r0;	 Catch:{ all -> 0x002f }
        L_0x001c:
            r3.Hf = r4;	 Catch:{ all -> 0x002f }
            r0 = r3.JD;	 Catch:{ all -> 0x002f }
            r1 = r3.mIndex;	 Catch:{ all -> 0x002f }
            r2 = r0.length;	 Catch:{ all -> 0x002f }
            if (r4 <= r2) goto L_0x002d;
        L_0x0025:
            r4 = new java.lang.ref.SoftReference[r4];	 Catch:{ all -> 0x002f }
            r2 = 0;
            java.lang.System.arraycopy(r0, r2, r4, r2, r1);	 Catch:{ all -> 0x002f }
            r3.JD = r4;	 Catch:{ all -> 0x002f }
        L_0x002d:
            monitor-exit(r3);
            return;
        L_0x002f:
            r4 = move-exception;
            monitor-exit(r3);
            throw r4;
            */
            throw new UnsupportedOperationException("Method not decompiled: miui.util.Pools.SoftReferenceInstanceHolder.resize(int):void");
        }

        public synchronized T get() {
            int i = this.mIndex;
            SoftReference[] softReferenceArr = this.JD;
            while (i != 0) {
                i--;
                if (softReferenceArr[i] != null) {
                    T t = softReferenceArr[i].get();
                    softReferenceArr[i] = null;
                    if (t != null) {
                        this.mIndex = i;
                        return t;
                    }
                }
            }
            return null;
        }

        public synchronized boolean put(T t) {
            int i = this.mIndex;
            SoftReference[] softReferenceArr = this.JD;
            if (i >= this.Hf) {
                int i2 = 0;
                while (i2 < i) {
                    if (softReferenceArr[i2] == null || softReferenceArr[i2].get() == null) {
                        softReferenceArr[i2] = new SoftReference(t);
                        return true;
                    }
                    i2++;
                }
                return false;
            }
            softReferenceArr[i] = new SoftReference(t);
            this.mIndex = i + 1;
            return true;
        }
    }

    public static class SoftReferencePool<T> extends BasePool<T> {
        SoftReferencePool(Manager<T> manager, int i) {
            super(manager, i);
        }

        final IInstanceHolder<T> d(Class<T> cls, int i) {
            return Pools.c(cls, i);
        }

        final void a(IInstanceHolder<T> iInstanceHolder, int i) {
            Pools.a((SoftReferenceInstanceHolder) iInstanceHolder, i);
        }
    }

    public static Pool<StringBuilder> getStringBuilderPool() {
        return Jx;
    }

    static <T> InstanceHolder<T> b(Class<T> cls, int i) {
        InstanceHolder<T> instanceHolder;
        synchronized (Jv) {
            instanceHolder = (InstanceHolder) Jv.get(cls);
            if (instanceHolder == null) {
                instanceHolder = new InstanceHolder(cls, i);
                Jv.put(cls, instanceHolder);
            } else {
                instanceHolder.resize(i);
            }
        }
        return instanceHolder;
    }

    static <T> void a(InstanceHolder<T> instanceHolder, int i) {
        synchronized (Jv) {
            instanceHolder.resize(-i);
        }
    }

    static <T> SoftReferenceInstanceHolder<T> c(Class<T> cls, int i) {
        SoftReferenceInstanceHolder<T> softReferenceInstanceHolder;
        synchronized (Jw) {
            softReferenceInstanceHolder = (SoftReferenceInstanceHolder) Jw.get(cls);
            if (softReferenceInstanceHolder == null) {
                softReferenceInstanceHolder = new SoftReferenceInstanceHolder(cls, i);
                Jw.put(cls, softReferenceInstanceHolder);
            } else {
                softReferenceInstanceHolder.resize(i);
            }
        }
        return softReferenceInstanceHolder;
    }

    static <T> void a(SoftReferenceInstanceHolder<T> softReferenceInstanceHolder, int i) {
        synchronized (Jw) {
            softReferenceInstanceHolder.resize(-i);
        }
    }

    public static <T> SimplePool<T> createSimplePool(Manager<T> manager, int i) {
        return new SimplePool(manager, i);
    }

    public static <T> SoftReferencePool<T> createSoftReferencePool(Manager<T> manager, int i) {
        return new SoftReferencePool(manager, i);
    }
}
