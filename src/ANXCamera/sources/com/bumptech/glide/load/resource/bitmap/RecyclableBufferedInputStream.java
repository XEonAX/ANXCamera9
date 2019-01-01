package com.bumptech.glide.load.resource.bitmap;

import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class RecyclableBufferedInputStream extends FilterInputStream {
    private volatile byte[] buf;
    private int count;
    private final b du;
    private int marklimit;
    private int markpos;
    private int pos;

    static class InvalidMarkException extends IOException {
        private static final long serialVersionUID = -4338378848813561757L;

        InvalidMarkException(String str) {
            super(str);
        }
    }

    public RecyclableBufferedInputStream(@NonNull InputStream inputStream, @NonNull b bVar) {
        this(inputStream, bVar, 65536);
    }

    @VisibleForTesting
    RecyclableBufferedInputStream(@NonNull InputStream inputStream, @NonNull b bVar, int i) {
        super(inputStream);
        this.markpos = -1;
        this.du = bVar;
        this.buf = (byte[]) bVar.a(i, byte[].class);
    }

    public synchronized int available() throws IOException {
        InputStream inputStream;
        inputStream = this.in;
        if (this.buf == null || inputStream == null) {
            throw cs();
        }
        return (this.count - this.pos) + inputStream.available();
    }

    private static IOException cs() throws IOException {
        throw new IOException("BufferedInputStream is closed");
    }

    public synchronized void ct() {
        this.marklimit = this.buf.length;
    }

    public synchronized void release() {
        if (this.buf != null) {
            this.du.put(this.buf);
            this.buf = null;
        }
    }

    public void close() throws IOException {
        if (this.buf != null) {
            this.du.put(this.buf);
            this.buf = null;
        }
        InputStream inputStream = this.in;
        this.in = null;
        if (inputStream != null) {
            inputStream.close();
        }
    }

    private int a(InputStream inputStream, byte[] bArr) throws IOException {
        int read;
        if (this.markpos == -1 || this.pos - this.markpos >= this.marklimit) {
            read = inputStream.read(bArr);
            if (read > 0) {
                this.markpos = -1;
                this.pos = 0;
                this.count = read;
            }
            return read;
        }
        if (this.markpos == 0 && this.marklimit > bArr.length && this.count == bArr.length) {
            int length = bArr.length * 2;
            if (length > this.marklimit) {
                length = this.marklimit;
            }
            byte[] bArr2 = (byte[]) this.du.a(length, byte[].class);
            System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
            this.buf = bArr2;
            this.du.put(bArr);
            bArr = bArr2;
        } else if (this.markpos > 0) {
            System.arraycopy(bArr, this.markpos, bArr, 0, bArr.length - this.markpos);
        }
        this.pos -= this.markpos;
        this.markpos = 0;
        this.count = 0;
        read = inputStream.read(bArr, this.pos, bArr.length - this.pos);
        this.count = read <= 0 ? this.pos : this.pos + read;
        return read;
    }

    public synchronized void mark(int i) {
        this.marklimit = Math.max(this.marklimit, i);
        this.markpos = this.pos;
    }

    public boolean markSupported() {
        return true;
    }

    public synchronized int read() throws IOException {
        byte[] bArr = this.buf;
        InputStream inputStream = this.in;
        if (bArr == null || inputStream == null) {
            throw cs();
        } else if (this.pos >= this.count && a(inputStream, bArr) == -1) {
            return -1;
        } else {
            if (bArr != this.buf) {
                bArr = this.buf;
                if (bArr == null) {
                    throw cs();
                }
            }
            if (this.count - this.pos <= 0) {
                return -1;
            }
            int i = this.pos;
            this.pos = i + 1;
            return bArr[i] & 255;
        }
    }

    /* JADX WARNING: Missing block: B:23:0x003a, code:
            return r2;
     */
    /* JADX WARNING: Missing block: B:35:0x0051, code:
            return r4;
     */
    /* JADX WARNING: Missing block: B:42:0x005e, code:
            return r4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized int read(@NonNull byte[] bArr, int i, int i2) throws IOException {
        byte[] bArr2 = this.buf;
        if (bArr2 == null) {
            throw cs();
        } else if (i2 == 0) {
            return 0;
        } else {
            InputStream inputStream = this.in;
            if (inputStream != null) {
                int i3;
                if (this.pos < this.count) {
                    if (this.count - this.pos >= i2) {
                        i3 = i2;
                    } else {
                        i3 = this.count - this.pos;
                    }
                    System.arraycopy(bArr2, this.pos, bArr, i, i3);
                    this.pos += i3;
                    if (i3 != i2 && inputStream.available() != 0) {
                        i += i3;
                        i3 = i2 - i3;
                    }
                } else {
                    i3 = i2;
                }
                while (true) {
                    int read;
                    int i4 = -1;
                    if (this.markpos == -1 && i3 >= bArr2.length) {
                        read = inputStream.read(bArr, i, i3);
                        if (read == -1) {
                            if (i3 != i2) {
                                i4 = i2 - i3;
                            }
                        }
                    } else if (a(inputStream, bArr2) != -1) {
                        if (bArr2 != this.buf) {
                            bArr2 = this.buf;
                            if (bArr2 == null) {
                                throw cs();
                            }
                        }
                        if (this.count - this.pos >= i3) {
                            read = i3;
                        } else {
                            read = this.count - this.pos;
                        }
                        System.arraycopy(bArr2, this.pos, bArr, i, read);
                        this.pos += read;
                    } else if (i3 != i2) {
                        i4 = i2 - i3;
                    }
                    i3 -= read;
                    if (i3 == 0) {
                        return i2;
                    }
                    if (inputStream.available() == 0) {
                        return i2 - i3;
                    }
                    i += read;
                }
            } else {
                throw cs();
            }
        }
    }

    public synchronized void reset() throws IOException {
        if (this.buf == null) {
            throw new IOException("Stream is closed");
        } else if (-1 != this.markpos) {
            this.pos = this.markpos;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Mark has been invalidated, pos: ");
            stringBuilder.append(this.pos);
            stringBuilder.append(" markLimit: ");
            stringBuilder.append(this.marklimit);
            throw new InvalidMarkException(stringBuilder.toString());
        }
    }

    public synchronized long skip(long j) throws IOException {
        if (j < 1) {
            return 0;
        }
        byte[] bArr = this.buf;
        if (bArr != null) {
            InputStream inputStream = this.in;
            if (inputStream == null) {
                throw cs();
            } else if (((long) (this.count - this.pos)) >= j) {
                this.pos = (int) (((long) this.pos) + j);
                return j;
            } else {
                long j2 = ((long) this.count) - ((long) this.pos);
                this.pos = this.count;
                if (this.markpos == -1 || j > ((long) this.marklimit)) {
                    return j2 + inputStream.skip(j - j2);
                } else if (a(inputStream, bArr) == -1) {
                    return j2;
                } else {
                    if (((long) (this.count - this.pos)) >= j - j2) {
                        this.pos = (int) ((((long) this.pos) + j) - j2);
                        return j;
                    }
                    j2 = (j2 + ((long) this.count)) - ((long) this.pos);
                    this.pos = this.count;
                    return j2;
                }
            }
        }
        throw cs();
    }
}
