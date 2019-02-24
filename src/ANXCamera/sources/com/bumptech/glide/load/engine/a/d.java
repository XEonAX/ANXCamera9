package com.bumptech.glide.load.engine.a;

import java.io.File;

/* compiled from: DiskLruCacheFactory */
public class d implements com.bumptech.glide.load.engine.a.a.a {
    private final long hm;
    private final a hn;

    /* compiled from: DiskLruCacheFactory */
    public interface a {
        File bv();
    }

    public d(final String str, long j) {
        this(new a() {
            public File bv() {
                return new File(str);
            }
        }, j);
    }

    public d(final String str, final String str2, long j) {
        this(new a() {
            public File bv() {
                return new File(str, str2);
            }
        }, j);
    }

    public d(a aVar, long j) {
        this.hm = j;
        this.hn = aVar;
    }

    public a bt() {
        File bv = this.hn.bv();
        if (bv == null) {
            return null;
        }
        if (bv.mkdirs() || (bv.exists() && bv.isDirectory())) {
            return e.b(bv, this.hm);
        }
        return null;
    }
}
