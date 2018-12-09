package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> pi = k.U(0);
    private InputStream pj;
    private IOException pk;

    @NonNull
    public static c h(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (pi) {
            cVar = (c) pi.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    static void eC() {
        while (!pi.isEmpty()) {
            pi.remove();
        }
    }

    c() {
    }

    void setInputStream(@NonNull InputStream inputStream) {
        this.pj = inputStream;
    }

    public int available() throws IOException {
        return this.pj.available();
    }

    public void close() throws IOException {
        this.pj.close();
    }

    public void mark(int i) {
        this.pj.mark(i);
    }

    public boolean markSupported() {
        return this.pj.markSupported();
    }

    public int read(byte[] bArr) {
        try {
            return this.pj.read(bArr);
        } catch (IOException e) {
            this.pk = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.pj.read(bArr, i, i2);
        } catch (IOException e) {
            this.pk = e;
            return -1;
        }
    }

    public synchronized void reset() throws IOException {
        this.pj.reset();
    }

    public long skip(long j) {
        try {
            return this.pj.skip(j);
        } catch (IOException e) {
            this.pk = e;
            return 0;
        }
    }

    public int read() {
        try {
            return this.pj.read();
        } catch (IOException e) {
            this.pk = e;
            return -1;
        }
    }

    @Nullable
    public IOException eD() {
        return this.pk;
    }

    public void release() {
        this.pk = null;
        this.pj = null;
        synchronized (pi) {
            pi.offer(this);
        }
    }
}
