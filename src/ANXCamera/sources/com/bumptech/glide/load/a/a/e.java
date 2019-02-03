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
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/* compiled from: ThumbnailStreamOpener */
class e {
    private static final String TAG = "ThumbStreamOpener";
    private static final a dJ = new a();
    private final a dK;
    private final d dL;
    private final List<ImageHeaderParser> dM;
    private final b dv;
    private final ContentResolver dw;

    e(List<ImageHeaderParser> list, d dVar, b bVar, ContentResolver contentResolver) {
        this(list, dJ, dVar, bVar, contentResolver);
    }

    e(List<ImageHeaderParser> list, a aVar, d dVar, b bVar, ContentResolver contentResolver) {
        this.dK = aVar;
        this.dL = dVar;
        this.dv = bVar;
        this.dw = contentResolver;
        this.dM = list;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    int h(Uri uri) {
        InputStream openInputStream;
        try {
            openInputStream = this.dw.openInputStream(uri);
            try {
                int b = com.bumptech.glide.load.b.b(this.dM, openInputStream, this.dv);
                if (openInputStream != null) {
                    try {
                        openInputStream.close();
                    } catch (IOException e) {
                    }
                }
                return b;
            } catch (IOException e2) {
            }
        } catch (Throwable e3) {
        } catch (Throwable th) {
            Throwable th2 = th;
            openInputStream = null;
            if (openInputStream != null) {
                try {
                    openInputStream.close();
                } catch (IOException e4) {
                }
            }
            throw th2;
        }
        return -1;
    }

    public InputStream i(Uri uri) throws FileNotFoundException {
        Object j = j(uri);
        if (TextUtils.isEmpty(j)) {
            return null;
        }
        File h = this.dK.h(j);
        if (!e(h)) {
            return null;
        }
        Uri fromFile = Uri.fromFile(h);
        try {
            return this.dw.openInputStream(fromFile);
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
        Cursor g = this.dL.g(uri);
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
        return this.dK.exists(file) && 0 < this.dK.d(file);
    }
}
