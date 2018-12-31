package com.bumptech.glide.load.engine.a;

import com.bumptech.glide.util.i;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* compiled from: DiskCacheWriteLocker */
final class c {
    private final Map<String, a> hh = new HashMap();
    private final b hi = new b();

    /* compiled from: DiskCacheWriteLocker */
    private static class a {
        int hj;
        final Lock lock = new ReentrantLock();

        a() {
        }
    }

    /* compiled from: DiskCacheWriteLocker */
    private static class b {
        private static final int hk = 10;
        private final Queue<a> hl = new ArrayDeque();

        b() {
        }

        a bu() {
            a aVar;
            synchronized (this.hl) {
                aVar = (a) this.hl.poll();
            }
            if (aVar == null) {
                return new a();
            }
            return aVar;
        }

        void a(a aVar) {
            synchronized (this.hl) {
                if (this.hl.size() < 10) {
                    this.hl.offer(aVar);
                }
            }
        }
    }

    c() {
    }

    void k(String str) {
        a aVar;
        synchronized (this) {
            aVar = (a) this.hh.get(str);
            if (aVar == null) {
                aVar = this.hi.bu();
                this.hh.put(str, aVar);
            }
            aVar.hj++;
        }
        aVar.lock.lock();
    }

    void l(String str) {
        a aVar;
        synchronized (this) {
            aVar = (a) i.checkNotNull(this.hh.get(str));
            if (aVar.hj >= 1) {
                aVar.hj--;
                if (aVar.hj == 0) {
                    a aVar2 = (a) this.hh.remove(str);
                    if (aVar2.equals(aVar)) {
                        this.hi.a(aVar2);
                    } else {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Removed the wrong lock, expected to remove: ");
                        stringBuilder.append(aVar);
                        stringBuilder.append(", but actually removed: ");
                        stringBuilder.append(aVar2);
                        stringBuilder.append(", safeKey: ");
                        stringBuilder.append(str);
                        throw new IllegalStateException(stringBuilder.toString());
                    }
                }
            } else {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Cannot release a lock that is not held, safeKey: ");
                stringBuilder2.append(str);
                stringBuilder2.append(", interestedThreads: ");
                stringBuilder2.append(aVar.hj);
                throw new IllegalStateException(stringBuilder2.toString());
            }
        }
        aVar.lock.unlock();
    }
}
