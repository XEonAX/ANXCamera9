package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.a.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.util.k;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* compiled from: BitmapEncoder */
public class e implements h<Bitmap> {
    private static final String TAG = "BitmapEncoder";
    public static final com.bumptech.glide.load.e<Integer> jT = com.bumptech.glide.load.e.a("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", Integer.valueOf(90));
    public static final com.bumptech.glide.load.e<CompressFormat> jU = com.bumptech.glide.load.e.g("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat");
    @Nullable
    private final b v;

    public e(@NonNull b bVar) {
        this.v = bVar;
    }

    @Deprecated
    public e() {
        this.v = null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x007b A:{Catch:{ all -> 0x00d0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0065 A:{Catch:{ all -> 0x0059 }} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x006e A:{SYNTHETIC, Splitter: B:29:0x006e} */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x007b A:{Catch:{ all -> 0x00d0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00ca A:{SYNTHETIC, Splitter: B:38:0x00ca} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean a(@NonNull p<Bitmap> pVar, @NonNull File file, @NonNull f fVar) {
        Throwable e;
        Throwable th;
        Bitmap bitmap = (Bitmap) pVar.get();
        CompressFormat a = a(bitmap, fVar);
        com.bumptech.glide.util.a.b.a("encode: [%dx%d] %s", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()), a);
        try {
            long eE = com.bumptech.glide.util.e.eE();
            int intValue = ((Integer) fVar.a(jT)).intValue();
            boolean z = false;
            OutputStream outputStream = null;
            try {
                OutputStream fileOutputStream = new FileOutputStream(file);
                try {
                    if (this.v != null) {
                        outputStream = new c(fileOutputStream, this.v);
                    } else {
                        outputStream = fileOutputStream;
                    }
                    bitmap.compress(a, intValue, outputStream);
                    outputStream.close();
                    z = true;
                } catch (IOException e2) {
                    e = e2;
                    outputStream = fileOutputStream;
                    try {
                        if (Log.isLoggable(TAG, 3)) {
                        }
                        if (outputStream != null) {
                        }
                        if (Log.isLoggable(TAG, 2)) {
                        }
                        com.bumptech.glide.util.a.b.endSection();
                        return z;
                    } catch (Throwable th2) {
                        th = th2;
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e3) {
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    outputStream = fileOutputStream;
                    if (outputStream != null) {
                    }
                    throw th;
                }
                try {
                    outputStream.close();
                } catch (IOException e4) {
                }
            } catch (IOException e5) {
                e = e5;
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Failed to encode Bitmap", e);
                }
                if (outputStream != null) {
                    outputStream.close();
                }
                if (Log.isLoggable(TAG, 2)) {
                }
                com.bumptech.glide.util.a.b.endSection();
                return z;
            }
            if (Log.isLoggable(TAG, 2)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Compressed with type: ");
                stringBuilder.append(a);
                stringBuilder.append(" of size ");
                stringBuilder.append(k.p(bitmap));
                stringBuilder.append(" in ");
                stringBuilder.append(com.bumptech.glide.util.e.e(eE));
                stringBuilder.append(", options format: ");
                stringBuilder.append(fVar.a(jU));
                stringBuilder.append(", hasAlpha: ");
                stringBuilder.append(bitmap.hasAlpha());
                Log.v(str, stringBuilder.toString());
            }
            com.bumptech.glide.util.a.b.endSection();
            return z;
        } catch (Throwable th4) {
            com.bumptech.glide.util.a.b.endSection();
        }
    }

    private CompressFormat a(Bitmap bitmap, f fVar) {
        CompressFormat compressFormat = (CompressFormat) fVar.a(jU);
        if (compressFormat != null) {
            return compressFormat;
        }
        if (bitmap.hasAlpha()) {
            return CompressFormat.PNG;
        }
        return CompressFormat.JPEG;
    }

    @NonNull
    public EncodeStrategy b(@NonNull f fVar) {
        return EncodeStrategy.TRANSFORMED;
    }
}
