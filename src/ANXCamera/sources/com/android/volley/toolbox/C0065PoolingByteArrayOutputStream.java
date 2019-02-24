package com.android.volley.toolbox;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* renamed from: com.android.volley.toolbox.PoolingByteArrayOutputStream */
public class C0065PoolingByteArrayOutputStream extends ByteArrayOutputStream {
    private static final int DEFAULT_SIZE = 256;
    private final C0037ByteArrayPool mPool;

    public C0065PoolingByteArrayOutputStream(C0037ByteArrayPool pool) {
        this(pool, 256);
    }

    public C0065PoolingByteArrayOutputStream(C0037ByteArrayPool pool, int size) {
        this.mPool = pool;
        this.buf = this.mPool.getBuf(Math.max(size, 256));
    }

    public void close() throws IOException {
        this.mPool.returnBuf(this.buf);
        this.buf = null;
        super.close();
    }

    public void finalize() {
        this.mPool.returnBuf(this.buf);
    }

    private void expand(int i) {
        if (this.count + i > this.buf.length) {
            byte[] newbuf = this.mPool.getBuf((this.count + i) * 2);
            System.arraycopy(this.buf, 0, newbuf, 0, this.count);
            this.mPool.returnBuf(this.buf);
            this.buf = newbuf;
        }
    }

    public synchronized void write(byte[] buffer, int offset, int len) {
        expand(len);
        super.write(buffer, offset, len);
    }

    public synchronized void write(int oneByte) {
        expand(1);
        super.write(oneByte);
    }
}
