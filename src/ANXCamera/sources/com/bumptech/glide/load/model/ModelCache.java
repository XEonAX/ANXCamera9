package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.f;
import com.bumptech.glide.util.k;
import java.util.Queue;

public class ModelCache<A, B> {
    private static final int DEFAULT_SIZE = 250;
    private final f<ModelKey<A>, B> jl;

    @VisibleForTesting
    static final class ModelKey<A> {
        private static final Queue<ModelKey<?>> jn = k.U(0);
        private A aK;
        private int height;
        private int width;

        static <A> ModelKey<A> d(A a, int i, int i2) {
            ModelKey<A> modelKey;
            synchronized (jn) {
                modelKey = (ModelKey) jn.poll();
            }
            if (modelKey == null) {
                modelKey = new ModelKey();
            }
            modelKey.e(a, i, i2);
            return modelKey;
        }

        private ModelKey() {
        }

        private void e(A a, int i, int i2) {
            this.aK = a;
            this.width = i;
            this.height = i2;
        }

        public void release() {
            synchronized (jn) {
                jn.offer(this);
            }
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof ModelKey)) {
                return false;
            }
            ModelKey modelKey = (ModelKey) obj;
            if (this.width == modelKey.width && this.height == modelKey.height && this.aK.equals(modelKey.aK)) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * ((this.height * 31) + this.width)) + this.aK.hashCode();
        }
    }

    public ModelCache() {
        this(250);
    }

    public ModelCache(long j) {
        this.jl = new f<ModelKey<A>, B>(j) {
            protected void a(@NonNull ModelKey<A> modelKey, @Nullable B b) {
                modelKey.release();
            }
        };
    }

    @Nullable
    public B c(A a, int i, int i2) {
        ModelKey d = ModelKey.d(a, i, i2);
        B b = this.jl.get(d);
        d.release();
        return b;
    }

    public void a(A a, int i, int i2, B b) {
        this.jl.put(ModelKey.d(a, i, i2), b);
    }

    public void clear() {
        this.jl.i();
    }
}
