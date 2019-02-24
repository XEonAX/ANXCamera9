package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.util.k;
import java.util.Queue;

/* compiled from: BaseKeyPool */
abstract class c<T extends l> {
    private static final int MAX_SIZE = 20;
    private final Queue<T> gy = k.U(20);

    abstract T bi();

    c() {
    }

    T bj() {
        l lVar = (l) this.gy.poll();
        if (lVar == null) {
            return bi();
        }
        return lVar;
    }

    public void a(T t) {
        if (this.gy.size() < 20) {
            this.gy.offer(t);
        }
    }
}
