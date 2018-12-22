package com.bumptech.glide.load.a.a;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

/* compiled from: ThumbnailStreamOpener */
class e {
    private static final String TAG = "ThumbStreamOpener";
    private static final a dI = new a();
    private final a dJ;
    private final d dK;
    private final List<ImageHeaderParser> dL;
    private final b du;
    private final ContentResolver dv;

    e(List<ImageHeaderParser> list, d dVar, b bVar, ContentResolver contentResolver) {
        this(list, dI, dVar, bVar, contentResolver);
    }

    e(List<ImageHeaderParser> list, a aVar, d dVar, b bVar, ContentResolver contentResolver) {
        this.dJ = aVar;
        this.dK = dVar;
        this.du = bVar;
        this.dv = contentResolver;
        this.dL = list;
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x001d A:{Splitter: B:1:0x0002, ExcHandler: java.io.IOException (r1_3 'e' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x002a A:{Catch:{ all -> 0x004a }} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0042 A:{SYNTHETIC, Splitter: B:20:0x0042} */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0018 A:{Splitter: B:3:0x0008, ExcHandler: java.io.IOException (e java.io.IOException)} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x004d A:{SYNTHETIC, Splitter: B:27:0x004d} */
    /* JADX WARNING: Missing block: B:10:0x0018, code:
            r0 = e;
     */
    /* JADX WARNING: Missing block: B:13:0x001d, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:14:0x001e, code:
            r5 = r1;
            r1 = null;
            r0 = r5;
     */
    /* JADX WARNING: Missing block: B:17:0x0028, code:
            if (android.util.Log.isLoggable(TAG, 3) != false) goto L_0x002a;
     */
    /* JADX WARNING: Missing block: B:18:0x002a, code:
            r2 = TAG;
            r3 = new java.lang.StringBuilder();
            r3.append("Failed to open uri: ");
            r3.append(r7);
            android.util.Log.d(r2, r3.toString(), r0);
     */
    /* JADX WARNING: Missing block: B:19:0x0040, code:
            if (r1 != null) goto L_0x0042;
     */
    /* JADX WARNING: Missing block: B:21:?, code:
            r1.close();
     */
    /* JADX WARNING: Missing block: B:25:0x004a, code:
            r7 = th;
     */
    int h(android.net.Uri r7) {
        /*
        r6 = this;
        r0 = 0;
        r1 = r6.dv;	 Catch:{ IOException -> 0x001d, IOException -> 0x001d, all -> 0x001a }
        r1 = r1.openInputStream(r7);	 Catch:{ IOException -> 0x001d, IOException -> 0x001d, all -> 0x001a }
        r0 = r6.dL;	 Catch:{ IOException -> 0x0018, IOException -> 0x0018 }
        r2 = r6.du;	 Catch:{ IOException -> 0x0018, IOException -> 0x0018 }
        r0 = com.bumptech.glide.load.b.b(r0, r1, r2);	 Catch:{ IOException -> 0x0018, IOException -> 0x0018 }
        if (r1 == 0) goto L_0x0017;
    L_0x0012:
        r1.close();	 Catch:{ IOException -> 0x0016 }
        goto L_0x0017;
    L_0x0016:
        r7 = move-exception;
    L_0x0017:
        return r0;
    L_0x0018:
        r0 = move-exception;
        goto L_0x0021;
    L_0x001a:
        r7 = move-exception;
        r1 = r0;
        goto L_0x004b;
    L_0x001d:
        r1 = move-exception;
        r5 = r1;
        r1 = r0;
        r0 = r5;
    L_0x0021:
        r2 = "ThumbStreamOpener";
        r3 = 3;
        r2 = android.util.Log.isLoggable(r2, r3);	 Catch:{ all -> 0x004a }
        if (r2 == 0) goto L_0x0040;
    L_0x002a:
        r2 = "ThumbStreamOpener";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x004a }
        r3.<init>();	 Catch:{ all -> 0x004a }
        r4 = "Failed to open uri: ";
        r3.append(r4);	 Catch:{ all -> 0x004a }
        r3.append(r7);	 Catch:{ all -> 0x004a }
        r7 = r3.toString();	 Catch:{ all -> 0x004a }
        android.util.Log.d(r2, r7, r0);	 Catch:{ all -> 0x004a }
    L_0x0040:
        if (r1 == 0) goto L_0x0048;
    L_0x0042:
        r1.close();	 Catch:{ IOException -> 0x0046 }
    L_0x0045:
        goto L_0x0048;
    L_0x0046:
        r7 = move-exception;
        goto L_0x0045;
    L_0x0048:
        r7 = -1;
        return r7;
    L_0x004a:
        r7 = move-exception;
    L_0x004b:
        if (r1 == 0) goto L_0x0052;
    L_0x004d:
        r1.close();	 Catch:{ IOException -> 0x0051 }
        goto L_0x0052;
    L_0x0051:
        r0 = move-exception;
    L_0x0052:
        throw r7;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.a.a.e.h(android.net.Uri):int");
    }

    public InputStream i(Uri uri) throws FileNotFoundException {
        Object j = j(uri);
        if (TextUtils.isEmpty(j)) {
            return null;
        }
        File h = this.dJ.h(j);
        if (!e(h)) {
            return null;
        }
        Uri fromFile = Uri.fromFile(h);
        try {
            return this.dv.openInputStream(fromFile);
        } catch (Throwable e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("NPE opening uri: ");
            stringBuilder.append(uri);
            stringBuilder.append(" -> ");
            stringBuilder.append(fromFile);
            throw ((FileNotFoundException) new FileNotFoundException(stringBuilder.toString()).initCause(e));
        }
    }

    @Nullable
    private String j(@NonNull Uri uri) {
        Cursor g = this.dK.g(uri);
        if (g != null) {
            try {
                if (g.moveToFirst()) {
                    String string = g.getString(0);
                    return string;
                }
            } finally {
                if (g != null) {
                    g.close();
                }
            }
        }
        if (g != null) {
            g.close();
        }
        return null;
    }

    private boolean e(File file) {
        return this.dJ.exists(file) && 0 < this.dJ.d(file);
    }
}
