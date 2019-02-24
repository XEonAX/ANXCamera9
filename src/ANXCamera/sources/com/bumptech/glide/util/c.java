package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* compiled from: ExceptionCatchingInputStream */
public class c extends InputStream {
    private static final Queue<c> ph = k.U(0);
    private InputStream pi;
    private IOException pj;

    @NonNull
    public static c h(@NonNull InputStream inputStream) {
        c cVar;
        synchronized (ph) {
            cVar = (c) ph.poll();
        }
        if (cVar == null) {
            cVar = new c();
        }
        cVar.setInputStream(inputStream);
        return cVar;
    }

    static void eC() {
        while (!ph.isEmpty()) {
            ph.remove();
        }
    }

    c() {
    }

    void setInputStream(@NonNull InputStream inputStream) {
        this.pi = inputStream;
    }

    public int available() throws IOException {
        return this.pi.available();
    }

    public void close() throws IOException {
        this.pi.close();
    }

    public void mark(int i) {
        this.pi.mark(i);
    }

    public boolean markSupported() {
        return this.pi.markSupported();
    }

    public int read(byte[] bArr) {
        try {
            return this.pi.read(bArr);
        } catch (IOException e) {
            this.pj = e;
            return -1;
        }
    }

    public int read(byte[] bArr, int i, int i2) {
        try {
            return this.pi.read(bArr, i, i2);
        } catch (IOException e) {
            this.pj = e;
            return -1;
        }
    }

    public synchronized void reset() throws IOException {
        this.pi.reset();
    }

    public long skip(long j) {
        try {
            return this.pi.skip(j);
        } catch (IOException e) {
            this.pj = e;
            return 0;
        }
    }

    public int read() {
        try {
            return this.pi.read();
        } catch (IOException e) {
            this.pj = e;
            return -1;
        }
    }

    @Nullable
    public IOException eD() {
        return this.pj;
    }

    public void release() {
        this.pj = null;
        this.pi = null;
        synchronized (ph) {
            ph.offer(this);
        }
    }
}
