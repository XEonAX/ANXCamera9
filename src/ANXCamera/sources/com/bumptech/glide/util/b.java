package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ContentLengthInputStream */
public final class b extends FilterInputStream {
    private static final String TAG = "ContentLengthStream";
    private static final int UNKNOWN = -1;
    private final long contentLength;
    private int ph;

    @NonNull
    public static InputStream a(@NonNull InputStream inputStream, @Nullable String str) {
        return a(inputStream, (long) x(str));
    }

    @NonNull
    public static InputStream a(@NonNull InputStream inputStream, long j) {
        return new b(inputStream, j);
    }

    private static int x(@Nullable String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return Integer.parseInt(str);
            } catch (Throwable e) {
                if (Log.isLoggable(TAG, 3)) {
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("failed to parse content length header: ");
                    stringBuilder.append(str);
                    Log.d(str2, stringBuilder.toString(), e);
                }
            }
        }
        return -1;
    }

    private b(@NonNull InputStream inputStream, long j) {
        super(inputStream);
        this.contentLength = j;
    }

    public synchronized int available() throws IOException {
        return (int) Math.max(this.contentLength - ((long) this.ph), (long) this.in.available());
    }

    public synchronized int read() throws IOException {
        int read;
        read = super.read();
        S(read >= 0 ? 1 : -1);
        return read;
    }

    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    public synchronized int read(byte[] bArr, int i, int i2) throws IOException {
        return S(super.read(bArr, i, i2));
    }

    private int S(int i) throws IOException {
        if (i >= 0) {
            this.ph += i;
        } else if (this.contentLength - ((long) this.ph) > 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to read all expected data, expected: ");
            stringBuilder.append(this.contentLength);
            stringBuilder.append(", but read: ");
            stringBuilder.append(this.ph);
            throw new IOException(stringBuilder.toString());
        }
        return i;
    }
}
