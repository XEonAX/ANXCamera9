package miui.util;

import java.lang.ref.SoftReference;
import java.util.HashMap;
import miui.util.concurrent.ConcurrentRingQueue;

public final class Pools {
    private static final HashMap<Class<?>, InstanceHolder<?>> JF = new HashMap();
    private static final HashMap<Class<?>, SoftReferenceInstanceHolder<?>> JG = new HashMap();
    private static final Pool<StringBuilder> JH = createSoftReferencePool(new Manager<StringBuilder>() {
        /* renamed from: dc */
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
        private final int Ho;
        private final Manager<T> JI;
        private IInstanceHolder<T> JJ;
        private final Object zV = new Object() {
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
                this.Ho = this.zV.hashCode();
                throw new IllegalArgumentException("manager cannot be null and size cannot less then 1");
            }
            this.JI = manager;
            this.Ho = i;
            Object createInstance = this.JI.createInstance();
            if (createInstance != null) {
                this.JJ = d(createInstance.getClass(), i);
                doRelease(createInstance);
                return;
            }
            throw new IllegalStateException("manager create instance cannot return null");
        }

        protected final T doAcquire() {
            if (this.JJ != null) {
                T t = this.JJ.get();
                if (t == null) {
                    t = this.JI.createInstance();
                    if (t == null) {
                        throw new IllegalStateException("manager create instance cannot return null");
                    }
                }
                this.JI.onAcquire(t);
                return t;
            }
            throw new IllegalStateException("Cannot acquire object after close()");
        }

        protected final void doRelease(T t) {
            if (this.JJ == null) {
                throw new IllegalStateException("Cannot release object after close()");
            } else if (t != null) {
                this.JI.onRelease(t);
                if (!this.JJ.put(t)) {
                    this.JI.onDestroy(t);
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
            if (this.JJ != null) {
                a(this.JJ, this.Ho);
                this.JJ = null;
            }
        }

        public int getSize() {
            return this.JJ == null ? 0 : this.Ho;
        }
    }

    private interface IInstanceHolder<T> {
        Class<T> dE();

        T get();

        int getSize();

        boolean put(T t);

        void resize(int i);
    }

    private static class InstanceHolder<T> implements IInstanceHolder<T> {
        private final Class<T> JL;
        private final ConcurrentRingQueue<T> JN;

        InstanceHolder(Class<T> cls, int i) {
            this.JL = cls;
            this.JN = new ConcurrentRingQueue(i, false, true);
        }

        public Class<T> dE() {
            return this.JL;
        }

        public int getSize() {
            return this.JN.getCapacity();
        }

        /* JADX WARNING: Missing block: B:20:0x002f, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public synchronized void resize(int i) {
            i += this.JN.getCapacity();
            if (i <= 0) {
                synchronized (Pools.JF) {
                    Pools.JF.remove(dE());
                }
            } else if (i > 0) {
                this.JN.increaseCapacity(i);
            } else {
                this.JN.decreaseCapacity(-i);
            }
        }

        public T get() {
            return this.JN.get();
        }

        public boolean put(T t) {
            return this.JN.put(t);
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
        private volatile int Ho;
        private final Class<T> JL;
        private volatile SoftReference<T>[] JQ;
        private volatile int mIndex = 0;

        SoftReferenceInstanceHolder(Class<T> cls, int i) {
            this.JL = cls;
            this.Ho = i;
            this.JQ = new SoftReference[i];
        }

        public Class<T> dE() {
            return this.JL;
        }

        public int getSize() {
            return this.Ho;
        }

        /* JADX WARNING: Missing block: B:20:0x002e, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public synchronized void resize(int i) {
            i += this.Ho;
            if (i <= 0) {
                synchronized (Pools.JG) {
                    Pools.JG.remove(dE());
                }
                return;
            }
            this.Ho = i;
            Object obj = this.JQ;
            int i2 = this.mIndex;
            if (i > obj.length) {
                Object obj2 = new SoftReference[i];
                System.arraycopy(obj, 0, obj2, 0, i2);
                this.JQ = obj2;
            }
        }

        public synchronized T get() {
            int i = this.mIndex;
            SoftReference[] softReferenceArr = this.JQ;
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
            SoftReference[] softReferenceArr = this.JQ;
            if (i >= this.Ho) {
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
        return JH;
    }

    static <T> InstanceHolder<T> b(Class<T> cls, int i) {
        InstanceHolder<T> instanceHolder;
        synchronized (JF) {
            instanceHolder = (InstanceHolder) JF.get(cls);
            if (instanceHolder == null) {
                instanceHolder = new InstanceHolder(cls, i);
                JF.put(cls, instanceHolder);
            } else {
                instanceHolder.resize(i);
            }
        }
        return instanceHolder;
    }

    static <T> void a(InstanceHolder<T> instanceHolder, int i) {
        synchronized (JF) {
            instanceHolder.resize(-i);
        }
    }

    static <T> SoftReferenceInstanceHolder<T> c(Class<T> cls, int i) {
        SoftReferenceInstanceHolder<T> softReferenceInstanceHolder;
        synchronized (JG) {
            softReferenceInstanceHolder = (SoftReferenceInstanceHolder) JG.get(cls);
            if (softReferenceInstanceHolder == null) {
                softReferenceInstanceHolder = new SoftReferenceInstanceHolder(cls, i);
                JG.put(cls, softReferenceInstanceHolder);
            } else {
                softReferenceInstanceHolder.resize(i);
            }
        }
        return softReferenceInstanceHolder;
    }

    static <T> void a(SoftReferenceInstanceHolder<T> softReferenceInstanceHolder, int i) {
        synchronized (JG) {
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
