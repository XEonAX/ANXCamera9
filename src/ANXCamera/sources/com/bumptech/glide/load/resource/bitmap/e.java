package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;

/* compiled from: BitmapEncoder */
public class e implements h<Bitmap> {
    private static final String TAG = "BitmapEncoder";
    public static final com.bumptech.glide.load.e<Integer> jT = com.bumptech.glide.load.e.a("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", Integer.valueOf(90));
    public static final com.bumptech.glide.load.e<CompressFormat> jU = com.bumptech.glide.load.e.g("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat");
    @Nullable
    private final b r;

    public e(@NonNull b bVar) {
        this.r = bVar;
    }

    @Deprecated
    public e() {
        this.r = null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x007b A:{Catch:{ all -> 0x00d0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0065 A:{Catch:{ all -> 0x0059 }} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x006e A:{SYNTHETIC, Splitter: B:29:0x006e} */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x007b A:{Catch:{ all -> 0x00d0 }} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00ca A:{SYNTHETIC, Splitter: B:38:0x00ca} */
    public boolean a(@android.support.annotation.NonNull com.bumptech.glide.load.engine.p<android.graphics.Bitmap> r8, @android.support.annotation.NonNull java.io.File r9, @android.support.annotation.NonNull com.bumptech.glide.load.f r10) {
        /*
        r7 = this;
        r8 = r8.get();
        r8 = (android.graphics.Bitmap) r8;
        r0 = r7.a(r8, r10);
        r1 = "encode: [%dx%d] %s";
        r2 = r8.getWidth();
        r2 = java.lang.Integer.valueOf(r2);
        r3 = r8.getHeight();
        r3 = java.lang.Integer.valueOf(r3);
        com.bumptech.glide.util.a.b.a(r1, r2, r3, r0);
        r1 = com.bumptech.glide.util.e.eE();	 Catch:{ all -> 0x00d0 }
        r3 = jT;	 Catch:{ all -> 0x00d0 }
        r3 = r10.a(r3);	 Catch:{ all -> 0x00d0 }
        r3 = (java.lang.Integer) r3;	 Catch:{ all -> 0x00d0 }
        r3 = r3.intValue();	 Catch:{ all -> 0x00d0 }
        r4 = 0;
        r5 = 0;
        r6 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x005b }
        r6.<init>(r9);	 Catch:{ IOException -> 0x005b }
        r9 = r7.r;	 Catch:{ IOException -> 0x0056, all -> 0x0052 }
        if (r9 == 0) goto L_0x0043;
    L_0x003a:
        r9 = new com.bumptech.glide.load.a.c;	 Catch:{ IOException -> 0x0056, all -> 0x0052 }
        r5 = r7.r;	 Catch:{ IOException -> 0x0056, all -> 0x0052 }
        r9.<init>(r6, r5);	 Catch:{ IOException -> 0x0056, all -> 0x0052 }
        r5 = r9;
        goto L_0x0044;
    L_0x0043:
        r5 = r6;
    L_0x0044:
        r8.compress(r0, r3, r5);	 Catch:{ IOException -> 0x005b }
        r5.close();	 Catch:{ IOException -> 0x005b }
        r4 = 1;
        r5.close();	 Catch:{ IOException -> 0x0050 }
    L_0x004f:
        goto L_0x0072;
    L_0x0050:
        r9 = move-exception;
        goto L_0x004f;
    L_0x0052:
        r8 = move-exception;
        r5 = r6;
        goto L_0x00c8;
    L_0x0056:
        r9 = move-exception;
        r5 = r6;
        goto L_0x005c;
    L_0x0059:
        r8 = move-exception;
        goto L_0x00c8;
    L_0x005b:
        r9 = move-exception;
    L_0x005c:
        r3 = "BitmapEncoder";
        r6 = 3;
        r3 = android.util.Log.isLoggable(r3, r6);	 Catch:{ all -> 0x0059 }
        if (r3 == 0) goto L_0x006c;
    L_0x0065:
        r3 = "BitmapEncoder";
        r6 = "Failed to encode Bitmap";
        android.util.Log.d(r3, r6, r9);	 Catch:{ all -> 0x0059 }
    L_0x006c:
        if (r5 == 0) goto L_0x0072;
    L_0x006e:
        r5.close();	 Catch:{ IOException -> 0x0050 }
        goto L_0x004f;
    L_0x0072:
        r9 = "BitmapEncoder";
        r3 = 2;
        r9 = android.util.Log.isLoggable(r9, r3);	 Catch:{ all -> 0x00d0 }
        if (r9 == 0) goto L_0x00c3;
    L_0x007b:
        r9 = "BitmapEncoder";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00d0 }
        r3.<init>();	 Catch:{ all -> 0x00d0 }
        r5 = "Compressed with type: ";
        r3.append(r5);	 Catch:{ all -> 0x00d0 }
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = " of size ";
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = com.bumptech.glide.util.k.p(r8);	 Catch:{ all -> 0x00d0 }
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = " in ";
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = com.bumptech.glide.util.e.e(r1);	 Catch:{ all -> 0x00d0 }
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = ", options format: ";
        r3.append(r0);	 Catch:{ all -> 0x00d0 }
        r0 = jU;	 Catch:{ all -> 0x00d0 }
        r10 = r10.a(r0);	 Catch:{ all -> 0x00d0 }
        r3.append(r10);	 Catch:{ all -> 0x00d0 }
        r10 = ", hasAlpha: ";
        r3.append(r10);	 Catch:{ all -> 0x00d0 }
        r8 = r8.hasAlpha();	 Catch:{ all -> 0x00d0 }
        r3.append(r8);	 Catch:{ all -> 0x00d0 }
        r8 = r3.toString();	 Catch:{ all -> 0x00d0 }
        android.util.Log.v(r9, r8);	 Catch:{ all -> 0x00d0 }
        com.bumptech.glide.util.a.b.endSection();
        return r4;
    L_0x00c8:
        if (r5 == 0) goto L_0x00cf;
    L_0x00ca:
        r5.close();	 Catch:{ IOException -> 0x00ce }
        goto L_0x00cf;
    L_0x00ce:
        r9 = move-exception;
    L_0x00cf:
        throw r8;	 Catch:{ all -> 0x00d0 }
    L_0x00d0:
        r8 = move-exception;
        com.bumptech.glide.util.a.b.endSection();
        throw r8;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.e.a(com.bumptech.glide.load.engine.p, java.io.File, com.bumptech.glide.load.f):boolean");
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
