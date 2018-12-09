package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: MarkEnforcingInputStream */
public class g extends FilterInputStream {
    private static final int UNSET = Integer.MIN_VALUE;
    private static final int po = -1;
    private int pp = Integer.MIN_VALUE;

    public g(@NonNull InputStream inputStream) {
        super(inputStream);
    }

    public synchronized void mark(int i) {
        super.mark(i);
        this.pp = i;
    }

    public int read() throws IOException {
        if (f(1) == -1) {
            return -1;
        }
        int read = super.read();
        g(1);
        return read;
    }

    public int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
        i2 = (int) f((long) i2);
        if (i2 == -1) {
            return -1;
        }
        int read = super.read(bArr, i, i2);
        g((long) read);
        return read;
    }

    public synchronized void reset() throws IOException {
        super.reset();
        this.pp = Integer.MIN_VALUE;
    }

    public long skip(long j) throws IOException {
        j = f(j);
        if (j == -1) {
            return 0;
        }
        j = super.skip(j);
        g(j);
        return j;
    }

    public int available() throws IOException {
        if (this.pp == Integer.MIN_VALUE) {
            return super.available();
        }
        return Math.min(this.pp, super.available());
    }

    private long f(long j) {
        if (this.pp == 0) {
            return -1;
        }
        if (this.pp == Integer.MIN_VALUE || j <= ((long) this.pp)) {
            return j;
        }
        return (long) this.pp;
    }

    private void g(long j) {
        if (this.pp != Integer.MIN_VALUE && j != -1) {
            this.pp = (int) (((long) this.pp) - j);
        }
    }
}
