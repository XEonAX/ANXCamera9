package com.bumptech.glide.load.engine.a;

import android.util.Log;
import com.bumptech.glide.a.a;
import com.bumptech.glide.a.a.d;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.a.b;
import java.io.File;
import java.io.IOException;

/* compiled from: DiskLruCacheWrapper */
public class e implements a {
    private static final String TAG = "DiskLruCacheWrapper";
    private static final int hq = 1;
    private static final int hr = 1;
    private static e hs;
    private final File directory;
    private final m ht;
    private final c hu = new c();
    private a hv;
    private final long maxSize;

    @Deprecated
    public static synchronized a a(File file, long j) {
        a aVar;
        synchronized (e.class) {
            if (hs == null) {
                hs = new e(file, j);
            }
            aVar = hs;
        }
        return aVar;
    }

    public static a b(File file, long j) {
        return new e(file, j);
    }

    @Deprecated
    protected e(File file, long j) {
        this.directory = file;
        this.maxSize = j;
        this.ht = new m();
    }

    private synchronized a bw() throws IOException {
        if (this.hv == null) {
            this.hv = a.a(this.directory, 1, 1, this.maxSize);
        }
        return this.hv;
    }

    public File e(c cVar) {
        String h = this.ht.h(cVar);
        if (Log.isLoggable(TAG, 2)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Get: Obtained: ");
            stringBuilder.append(h);
            stringBuilder.append(" for for Key: ");
            stringBuilder.append(cVar);
            Log.v(str, stringBuilder.toString());
        }
        try {
            d c = bw().c(h);
            if (c != null) {
                return c.f(0);
            }
            return null;
        } catch (Throwable e) {
            if (!Log.isLoggable(TAG, 5)) {
                return null;
            }
            Log.w(TAG, "Unable to get from disk cache", e);
            return null;
        }
    }

    public void a(c cVar, b bVar) {
        String h = this.ht.h(cVar);
        this.hu.k(h);
        try {
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Put: Obtained: ");
                stringBuilder.append(h);
                stringBuilder.append(" for for Key: ");
                stringBuilder.append(cVar);
                Log.v(str, stringBuilder.toString());
            }
            a.b f;
            try {
                a bw = bw();
                if (bw.c(h) == null) {
                    f = bw.f(h);
                    if (f != null) {
                        if (bVar.f(f.f(0))) {
                            f.commit();
                        }
                        f.abortUnlessCommitted();
                        this.hu.l(h);
                        return;
                    }
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Had two simultaneous puts for: ");
                    stringBuilder2.append(h);
                    throw new IllegalStateException(stringBuilder2.toString());
                }
            } catch (Throwable e) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Unable to put to disk cache", e);
                }
            } catch (Throwable th) {
                f.abortUnlessCommitted();
            }
        } finally {
            this.hu.l(h);
        }
    }

    public void f(c cVar) {
        try {
            bw().remove(this.ht.h(cVar));
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Unable to delete from disk cache", e);
            }
        }
    }

    public synchronized void clear() {
        try {
            bw().delete();
        } catch (Throwable e) {
            try {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Unable to clear disk cache or disk cache cleared externally", e);
                }
            } catch (Throwable th) {
                bx();
            }
        }
        bx();
    }

    private synchronized void bx() {
        this.hv = null;
    }
}
