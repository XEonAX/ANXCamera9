package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* compiled from: StreamEncoder */
public class s implements a<InputStream> {
    private static final String TAG = "StreamEncoder";
    private final b du;

    public s(b bVar) {
        this.du = bVar;
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x003d A:{Catch:{ all -> 0x0031 }} */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0046 A:{SYNTHETIC, Splitter: B:23:0x0046} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0054 A:{SYNTHETIC, Splitter: B:29:0x0054} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean a(@NonNull InputStream inputStream, @NonNull File file, @NonNull f fVar) {
        Throwable e;
        byte[] bArr = (byte[]) this.du.a(65536, byte[].class);
        boolean z = false;
        OutputStream outputStream = null;
        try {
            OutputStream fileOutputStream = new FileOutputStream(file);
            while (true) {
                try {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                } catch (IOException e2) {
                    e = e2;
                    outputStream = fileOutputStream;
                    try {
                        if (Log.isLoggable(TAG, 3)) {
                        }
                        if (outputStream != null) {
                        }
                        this.du.put(bArr);
                        return z;
                    } catch (Throwable th) {
                        e = th;
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e3) {
                            }
                        }
                        this.du.put(bArr);
                        throw e;
                    }
                } catch (Throwable th2) {
                    e = th2;
                    outputStream = fileOutputStream;
                    if (outputStream != null) {
                    }
                    this.du.put(bArr);
                    throw e;
                }
            }
            fileOutputStream.close();
            z = true;
            try {
                fileOutputStream.close();
            } catch (IOException e4) {
            }
        } catch (IOException e5) {
            e = e5;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to encode data onto the OutputStream", e);
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e6) {
                }
            }
            this.du.put(bArr);
            return z;
        }
        this.du.put(bArr);
        return z;
    }
}
