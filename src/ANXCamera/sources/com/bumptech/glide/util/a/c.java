package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;

/* compiled from: StateVerifier */
public abstract class c {
    private static final boolean DEBUG = false;

    /* compiled from: StateVerifier */
    private static class a extends c {
        private volatile RuntimeException pD;

        a() {
            super();
        }

        public void eN() {
            if (this.pD != null) {
                throw new IllegalStateException("Already released", this.pD);
            }
        }

        void m(boolean z) {
            if (z) {
                this.pD = new RuntimeException("Released");
            } else {
                this.pD = null;
            }
        }
    }

    /* compiled from: StateVerifier */
    private static class b extends c {
        private volatile boolean eR;

        b() {
            super();
        }

        public void eN() {
            if (this.eR) {
                throw new IllegalStateException("Already released");
            }
        }

        public void m(boolean z) {
            this.eR = z;
        }
    }

    public abstract void eN();

    abstract void m(boolean z);

    @NonNull
    public static c eM() {
        return new b();
    }

    private c() {
    }
}
