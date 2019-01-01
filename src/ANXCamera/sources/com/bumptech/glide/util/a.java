package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @NonNull
    public static ByteBuffer l(@NonNull File file) throws IOException {
        Throwable th;
        FileChannel fileChannel = null;
        RandomAccessFile randomAccessFile;
        try {
            long length = file.length();
            if (length > 2147483647L) {
                throw new IOException("File too large to map into memory");
            } else if (length != 0) {
                randomAccessFile = new RandomAccessFile(file, "r");
                try {
                    FileChannel channel = randomAccessFile.getChannel();
                    try {
                        ByteBuffer load = channel.map(MapMode.READ_ONLY, 0, length).load();
                        if (channel != null) {
                            try {
                                channel.close();
                            } catch (IOException e) {
                            }
                        }
                        try {
                            randomAccessFile.close();
                        } catch (IOException e2) {
                        }
                        return load;
                    } catch (Throwable th2) {
                        Throwable th3 = th2;
                        fileChannel = channel;
                        th = th3;
                        if (fileChannel != null) {
                        }
                        if (randomAccessFile != null) {
                        }
                        throw th;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    if (fileChannel != null) {
                    }
                    if (randomAccessFile != null) {
                    }
                    throw th;
                }
            } else {
                throw new IOException("File unsuitable for memory mapping");
            }
        } catch (Throwable th5) {
            th = th5;
            randomAccessFile = null;
            if (fileChannel != null) {
                try {
                    fileChannel.close();
                } catch (IOException e3) {
                }
            }
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037 A:{SYNTHETIC, Splitter: B:20:0x0037} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e A:{SYNTHETIC, Splitter: B:24:0x003e} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037 A:{SYNTHETIC, Splitter: B:20:0x0037} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x003e A:{SYNTHETIC, Splitter: B:24:0x003e} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void a(@NonNull ByteBuffer byteBuffer, @NonNull File file) throws IOException {
        FileChannel channel;
        Throwable th;
        byteBuffer.position(0);
        RandomAccessFile randomAccessFile;
        try {
            randomAccessFile = new RandomAccessFile(file, "rw");
            try {
                channel = randomAccessFile.getChannel();
            } catch (Throwable th2) {
                th = th2;
                channel = null;
                if (channel != null) {
                }
                if (randomAccessFile != null) {
                }
                throw th;
            }
            try {
                channel.write(byteBuffer);
                channel.force(false);
                channel.close();
                randomAccessFile.close();
                if (channel != null) {
                    try {
                        channel.close();
                    } catch (IOException e) {
                    }
                }
                try {
                    randomAccessFile.close();
                } catch (IOException e2) {
                }
            } catch (Throwable th3) {
                th = th3;
                if (channel != null) {
                }
                if (randomAccessFile != null) {
                }
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            channel = null;
            randomAccessFile = channel;
            if (channel != null) {
                try {
                    channel.close();
                } catch (IOException e3) {
                }
            }
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
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
