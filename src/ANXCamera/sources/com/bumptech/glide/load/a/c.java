package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import java.io.IOException;
import java.io.OutputStream;

/* compiled from: BufferedOutputStream */
public final class c extends OutputStream {
    private byte[] buffer;
    private int index;
    @NonNull
    private final OutputStream out;
    private b r;

    public c(@NonNull OutputStream outputStream, @NonNull b bVar) {
        this(outputStream, bVar, 65536);
    }

    @VisibleForTesting
    c(@NonNull OutputStream outputStream, b bVar, int i) {
        this.out = outputStream;
        this.r = bVar;
        this.buffer = (byte[]) bVar.a(i, byte[].class);
    }

    public void write(int i) throws IOException {
        byte[] bArr = this.buffer;
        int i2 = this.index;
        this.index = i2 + 1;
        bArr[i2] = (byte) i;
        af();
    }

    public void write(@NonNull byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    public void write(@NonNull byte[] bArr, int i, int i2) throws IOException {
        int i3 = 0;
        do {
            int i4 = i2 - i3;
            int i5 = i + i3;
            if (this.index != 0 || i4 < this.buffer.length) {
                i4 = Math.min(i4, this.buffer.length - this.index);
                System.arraycopy(bArr, i5, this.buffer, this.index, i4);
                this.index += i4;
                i3 += i4;
                af();
            } else {
                this.out.write(bArr, i5, i4);
                return;
            }
        } while (i3 < i2);
    }

    public void flush() throws IOException {
        flushBuffer();
        this.out.flush();
    }

    private void flushBuffer() throws IOException {
        if (this.index > 0) {
            this.out.write(this.buffer, 0, this.index);
            this.index = 0;
        }
    }

    private void af() throws IOException {
        if (this.index == this.buffer.length) {
            flushBuffer();
        }
    }

    public void close() throws IOException {
        try {
            flush();
            release();
        } finally {
            this.out.close();
        }
    }

    private void release() {
        if (this.buffer != null) {
            this.r.put(this.buffer);
            this.buffer = null;
        }
    }
}
