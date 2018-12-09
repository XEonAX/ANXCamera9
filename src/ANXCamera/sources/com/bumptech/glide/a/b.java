package com.bumptech.glide.a;

import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

/* compiled from: StrictLineReader */
class b implements Closeable {
    private static final byte bp = (byte) 13;
    private static final byte bq = (byte) 10;
    private byte[] buf;
    private final Charset charset;
    private int end;
    private final InputStream in;
    private int pos;

    public b(InputStream inputStream, Charset charset) {
        this(inputStream, 8192, charset);
    }

    public b(InputStream inputStream, int i, Charset charset) {
        if (inputStream == null || charset == null) {
            throw new NullPointerException();
        } else if (i < 0) {
            throw new IllegalArgumentException("capacity <= 0");
        } else if (charset.equals(c.US_ASCII)) {
            this.in = inputStream;
            this.charset = charset;
            this.buf = new byte[i];
        } else {
            throw new IllegalArgumentException("Unsupported encoding");
        }
    }

    public void close() throws IOException {
        synchronized (this.in) {
            if (this.buf != null) {
                this.buf = null;
                this.in.close();
            }
        }
    }

    /* JADX WARNING: Missing block: B:16:0x002a, code:
            if (r7.buf[r3] == bp) goto L_0x002e;
     */
    public java.lang.String readLine() throws java.io.IOException {
        /*
        r7 = this;
        r0 = r7.in;
        monitor-enter(r0);
        r1 = r7.buf;	 Catch:{ all -> 0x0097 }
        if (r1 == 0) goto L_0x008f;
    L_0x0007:
        r1 = r7.pos;	 Catch:{ all -> 0x0097 }
        r2 = r7.end;	 Catch:{ all -> 0x0097 }
        if (r1 < r2) goto L_0x0010;
    L_0x000d:
        r7.N();	 Catch:{ all -> 0x0097 }
    L_0x0010:
        r1 = r7.pos;	 Catch:{ all -> 0x0097 }
    L_0x0012:
        r2 = r7.end;	 Catch:{ all -> 0x0097 }
        r3 = 10;
        if (r1 == r2) goto L_0x0049;
    L_0x0018:
        r2 = r7.buf;	 Catch:{ all -> 0x0097 }
        r2 = r2[r1];	 Catch:{ all -> 0x0097 }
        if (r2 != r3) goto L_0x0046;
    L_0x001e:
        r2 = r7.pos;	 Catch:{ all -> 0x0097 }
        if (r1 == r2) goto L_0x002d;
    L_0x0022:
        r2 = r7.buf;	 Catch:{ all -> 0x0097 }
        r3 = r1 + -1;
        r2 = r2[r3];	 Catch:{ all -> 0x0097 }
        r4 = 13;
        if (r2 != r4) goto L_0x002d;
    L_0x002c:
        goto L_0x002e;
    L_0x002d:
        r3 = r1;
    L_0x002e:
        r2 = new java.lang.String;	 Catch:{ all -> 0x0097 }
        r4 = r7.buf;	 Catch:{ all -> 0x0097 }
        r5 = r7.pos;	 Catch:{ all -> 0x0097 }
        r6 = r7.pos;	 Catch:{ all -> 0x0097 }
        r3 = r3 - r6;
        r6 = r7.charset;	 Catch:{ all -> 0x0097 }
        r6 = r6.name();	 Catch:{ all -> 0x0097 }
        r2.<init>(r4, r5, r3, r6);	 Catch:{ all -> 0x0097 }
        r1 = r1 + 1;
        r7.pos = r1;	 Catch:{ all -> 0x0097 }
        monitor-exit(r0);	 Catch:{ all -> 0x0097 }
        return r2;
    L_0x0046:
        r1 = r1 + 1;
        goto L_0x0012;
    L_0x0049:
        r1 = new com.bumptech.glide.a.b$1;	 Catch:{ all -> 0x0097 }
        r2 = r7.end;	 Catch:{ all -> 0x0097 }
        r4 = r7.pos;	 Catch:{ all -> 0x0097 }
        r2 = r2 - r4;
        r2 = r2 + 80;
        r1.<init>(r2);	 Catch:{ all -> 0x0097 }
    L_0x0055:
        r2 = r7.buf;	 Catch:{ all -> 0x0097 }
        r4 = r7.pos;	 Catch:{ all -> 0x0097 }
        r5 = r7.end;	 Catch:{ all -> 0x0097 }
        r6 = r7.pos;	 Catch:{ all -> 0x0097 }
        r5 = r5 - r6;
        r1.write(r2, r4, r5);	 Catch:{ all -> 0x0097 }
        r2 = -1;
        r7.end = r2;	 Catch:{ all -> 0x0097 }
        r7.N();	 Catch:{ all -> 0x0097 }
        r2 = r7.pos;	 Catch:{ all -> 0x0097 }
    L_0x0069:
        r4 = r7.end;	 Catch:{ all -> 0x0097 }
        if (r2 == r4) goto L_0x0055;
    L_0x006d:
        r4 = r7.buf;	 Catch:{ all -> 0x0097 }
        r4 = r4[r2];	 Catch:{ all -> 0x0097 }
        if (r4 != r3) goto L_0x008c;
    L_0x0073:
        r3 = r7.pos;	 Catch:{ all -> 0x0097 }
        if (r2 == r3) goto L_0x0082;
    L_0x0077:
        r3 = r7.buf;	 Catch:{ all -> 0x0097 }
        r4 = r7.pos;	 Catch:{ all -> 0x0097 }
        r5 = r7.pos;	 Catch:{ all -> 0x0097 }
        r5 = r2 - r5;
        r1.write(r3, r4, r5);	 Catch:{ all -> 0x0097 }
    L_0x0082:
        r2 = r2 + 1;
        r7.pos = r2;	 Catch:{ all -> 0x0097 }
        r1 = r1.toString();	 Catch:{ all -> 0x0097 }
        monitor-exit(r0);	 Catch:{ all -> 0x0097 }
        return r1;
    L_0x008c:
        r2 = r2 + 1;
        goto L_0x0069;
    L_0x008f:
        r1 = new java.io.IOException;	 Catch:{ all -> 0x0097 }
        r2 = "LineReader is closed";
        r1.<init>(r2);	 Catch:{ all -> 0x0097 }
        throw r1;	 Catch:{ all -> 0x0097 }
    L_0x0097:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0097 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.a.b.readLine():java.lang.String");
    }

    public boolean M() {
        return this.end == -1;
    }

    private void N() throws IOException {
        int read = this.in.read(this.buf, 0, this.buf.length);
        if (read != -1) {
            this.pos = 0;
            this.end = read;
            return;
        }
        throw new EOFException();
    }
}
