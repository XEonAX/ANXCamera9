package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: ByteBufferUtil */
public final class a {
    private static final int BUFFER_SIZE = 16384;
    private static final AtomicReference<byte[]> pf = new AtomicReference();

    /* compiled from: ByteBufferUtil */
    private static class a extends InputStream {
        private static final int UNSET = -1;
        @NonNull
        private final ByteBuffer byteBuffer;
        private int pg = -1;

        a(@NonNull ByteBuffer byteBuffer) {
            this.byteBuffer = byteBuffer;
        }

        public int available() {
            return this.byteBuffer.remaining();
        }

        public int read() {
            if (this.byteBuffer.hasRemaining()) {
                return this.byteBuffer.get();
            }
            return -1;
        }

        public synchronized void mark(int i) {
            this.pg = this.byteBuffer.position();
        }

        public boolean markSupported() {
            return true;
        }

        public int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            i2 = Math.min(i2, available());
            this.byteBuffer.get(bArr, i, i2);
            return i2;
        }

        public synchronized void reset() throws IOException {
            if (this.pg != -1) {
                this.byteBuffer.position(this.pg);
            } else {
                throw new IOException("Cannot reset to unset mark position");
            }
        }

        public long skip(long j) throws IOException {
            if (!this.byteBuffer.hasRemaining()) {
                return -1;
            }
            j = Math.min(j, (long) available());
            this.byteBuffer.position((int) (((long) this.byteBuffer.position()) + j));
            return j;
        }
    }

    /* compiled from: ByteBufferUtil */
    static final class b {
        final byte[] data;
        final int limit;
        final int offset;

        b(@NonNull byte[] bArr, int i, int i2) {
            this.data = bArr;
            this.offset = i;
            this.limit = i2;
        }
    }

    private a() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0055 A:{SYNTHETIC, Splitter: B:30:0x0055} */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x005c A:{SYNTHETIC, Splitter: B:34:0x005c} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0055 A:{SYNTHETIC, Splitter: B:30:0x0055} */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x005c A:{SYNTHETIC, Splitter: B:34:0x005c} */
    @android.support.annotation.NonNull
    public static java.nio.ByteBuffer l(@android.support.annotation.NonNull java.io.File r9) throws java.io.IOException {
        /*
        r0 = 0;
        r5 = r9.length();	 Catch:{ all -> 0x0051 }
        r1 = 2147483647; // 0x7fffffff float:NaN double:1.060997895E-314;
        r1 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1));
        if (r1 > 0) goto L_0x0049;
    L_0x000e:
        r1 = 0;
        r1 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1));
        if (r1 == 0) goto L_0x0041;
    L_0x0014:
        r7 = new java.io.RandomAccessFile;	 Catch:{ all -> 0x0051 }
        r1 = "r";
        r7.<init>(r9, r1);	 Catch:{ all -> 0x0051 }
        r9 = r7.getChannel();	 Catch:{ all -> 0x003f }
        r2 = java.nio.channels.FileChannel.MapMode.READ_ONLY;	 Catch:{ all -> 0x003a }
        r3 = 0;
        r1 = r9;
        r0 = r1.map(r2, r3, r5);	 Catch:{ all -> 0x003a }
        r0 = r0.load();	 Catch:{ all -> 0x003a }
        if (r9 == 0) goto L_0x0033;
    L_0x002e:
        r9.close();	 Catch:{ IOException -> 0x0032 }
        goto L_0x0033;
    L_0x0032:
        r9 = move-exception;
        r7.close();	 Catch:{ IOException -> 0x0038 }
        goto L_0x0039;
    L_0x0038:
        r9 = move-exception;
    L_0x0039:
        return r0;
    L_0x003a:
        r0 = move-exception;
        r8 = r0;
        r0 = r9;
        r9 = r8;
        goto L_0x0053;
    L_0x003f:
        r9 = move-exception;
        goto L_0x0053;
    L_0x0041:
        r9 = new java.io.IOException;	 Catch:{ all -> 0x0051 }
        r1 = "File unsuitable for memory mapping";
        r9.<init>(r1);	 Catch:{ all -> 0x0051 }
        throw r9;	 Catch:{ all -> 0x0051 }
    L_0x0049:
        r9 = new java.io.IOException;	 Catch:{ all -> 0x0051 }
        r1 = "File too large to map into memory";
        r9.<init>(r1);	 Catch:{ all -> 0x0051 }
        throw r9;	 Catch:{ all -> 0x0051 }
    L_0x0051:
        r9 = move-exception;
        r7 = r0;
    L_0x0053:
        if (r0 == 0) goto L_0x005a;
    L_0x0055:
        r0.close();	 Catch:{ IOException -> 0x0059 }
        goto L_0x005a;
    L_0x0059:
        r0 = move-exception;
    L_0x005a:
        if (r7 == 0) goto L_0x0061;
    L_0x005c:
        r7.close();	 Catch:{ IOException -> 0x0060 }
        goto L_0x0061;
    L_0x0060:
        r0 = move-exception;
    L_0x0061:
        throw r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.util.a.l(java.io.File):java.nio.ByteBuffer");
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037 A:{SYNTHETIC, Splitter: B:20:0x0037} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e A:{SYNTHETIC, Splitter: B:24:0x003e} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037 A:{SYNTHETIC, Splitter: B:20:0x0037} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e A:{SYNTHETIC, Splitter: B:24:0x003e} */
    public static void a(@android.support.annotation.NonNull java.nio.ByteBuffer r4, @android.support.annotation.NonNull java.io.File r5) throws java.io.IOException {
        /*
        r0 = 0;
        r4.position(r0);
        r1 = 0;
        r2 = new java.io.RandomAccessFile;	 Catch:{ all -> 0x0032 }
        r3 = "rw";
        r2.<init>(r5, r3);	 Catch:{ all -> 0x0032 }
        r5 = r2.getChannel();	 Catch:{ all -> 0x002f }
        r5.write(r4);	 Catch:{ all -> 0x002d }
        r5.force(r0);	 Catch:{ all -> 0x002d }
        r5.close();	 Catch:{ all -> 0x002d }
        r2.close();	 Catch:{ all -> 0x002d }
        if (r5 == 0) goto L_0x0025;
    L_0x0020:
        r5.close();	 Catch:{ IOException -> 0x0024 }
        goto L_0x0025;
    L_0x0024:
        r4 = move-exception;
        r2.close();	 Catch:{ IOException -> 0x002a }
    L_0x0029:
        goto L_0x002c;
    L_0x002a:
        r4 = move-exception;
        goto L_0x0029;
    L_0x002c:
        return;
    L_0x002d:
        r4 = move-exception;
        goto L_0x0035;
    L_0x002f:
        r4 = move-exception;
        r5 = r1;
        goto L_0x0035;
    L_0x0032:
        r4 = move-exception;
        r5 = r1;
        r2 = r5;
    L_0x0035:
        if (r5 == 0) goto L_0x003c;
    L_0x0037:
        r5.close();	 Catch:{ IOException -> 0x003b }
        goto L_0x003c;
    L_0x003b:
        r5 = move-exception;
    L_0x003c:
        if (r2 == 0) goto L_0x0043;
    L_0x003e:
        r2.close();	 Catch:{ IOException -> 0x0042 }
        goto L_0x0043;
    L_0x0042:
        r5 = move-exception;
    L_0x0043:
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.util.a.a(java.nio.ByteBuffer, java.io.File):void");
    }

    public static void a(@NonNull ByteBuffer byteBuffer, @NonNull OutputStream outputStream) throws IOException {
        b h = h(byteBuffer);
        if (h != null) {
            outputStream.write(h.data, h.offset, h.offset + h.limit);
            return;
        }
        Object obj = (byte[]) pf.getAndSet(null);
        if (obj == null) {
            obj = new byte[16384];
        }
        while (byteBuffer.remaining() > 0) {
            int min = Math.min(byteBuffer.remaining(), obj.length);
            byteBuffer.get(obj, 0, min);
            outputStream.write(obj, 0, min);
        }
        pf.set(obj);
    }

    @NonNull
    public static byte[] f(@NonNull ByteBuffer byteBuffer) {
        b h = h(byteBuffer);
        if (h != null && h.offset == 0 && h.limit == h.data.length) {
            return byteBuffer.array();
        }
        byteBuffer = byteBuffer.asReadOnlyBuffer();
        byte[] bArr = new byte[byteBuffer.limit()];
        byteBuffer.position(0);
        byteBuffer.get(bArr);
        return bArr;
    }

    @NonNull
    public static InputStream g(@NonNull ByteBuffer byteBuffer) {
        return new a(byteBuffer);
    }

    @NonNull
    public static ByteBuffer g(@NonNull InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(16384);
        Object obj = (byte[]) pf.getAndSet(null);
        if (obj == null) {
            obj = new byte[16384];
        }
        while (true) {
            int read = inputStream.read(obj);
            if (read >= 0) {
                byteArrayOutputStream.write(obj, 0, read);
            } else {
                pf.set(obj);
                byte[] toByteArray = byteArrayOutputStream.toByteArray();
                return (ByteBuffer) ByteBuffer.allocateDirect(toByteArray.length).put(toByteArray).position(0);
            }
        }
    }

    @Nullable
    private static b h(@NonNull ByteBuffer byteBuffer) {
        if (byteBuffer.isReadOnly() || !byteBuffer.hasArray()) {
            return null;
        }
        return new b(byteBuffer.array(), byteBuffer.arrayOffset(), byteBuffer.limit());
    }
}
