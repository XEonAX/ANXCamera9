package org.greenrobot.greendao.identityscope;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.concurrent.locks.ReentrantLock;

public class IdentityScopeObject<K, T> implements IdentityScope<K, T> {
    private final ReentrantLock lock = new ReentrantLock();
    private final HashMap<K, Reference<T>> map = new HashMap();

    public T get(K k) {
        this.lock.lock();
        try {
            Reference reference = (Reference) this.map.get(k);
            if (reference != null) {
                return reference.get();
            }
            return null;
        } finally {
            this.lock.unlock();
        }
    }

    public T getNoLock(K k) {
        Reference reference = (Reference) this.map.get(k);
        if (reference != null) {
            return reference.get();
        }
        return null;
    }

    public void put(K k, T t) {
        this.lock.lock();
        try {
            this.map.put(k, new WeakReference(t));
        } finally {
            this.lock.unlock();
        }
    }

    public void putNoLock(K k, T t) {
        this.map.put(k, new WeakReference(t));
    }

    public boolean detach(K k, T t) {
        this.lock.lock();
        try {
            boolean z;
            if (get(k) != t || t == null) {
                z = false;
            } else {
                remove((Object) k);
                z = true;
            }
            this.lock.unlock();
            return z;
        } catch (Throwable th) {
            this.lock.unlock();
        }
    }

    public void remove(K k) {
        this.lock.lock();
        try {
            this.map.remove(k);
        } finally {
            this.lock.unlock();
        }
    }

    public void remove(Iterable<K> iterable) {
        this.lock.lock();
        try {
            for (K remove : iterable) {
                this.map.remove(remove);
            }
        } finally {
            this.lock.unlock();
        }
    }

    public void clear() {
        this.lock.lock();
        try {
            this.map.clear();
        } finally {
            this.lock.unlock();
        }
    }

    public void lock() {
        this.lock.lock();
    }

    public void unlock() {
        this.lock.unlock();
    }

    public void reserveRoom(int i) {
    }
}
