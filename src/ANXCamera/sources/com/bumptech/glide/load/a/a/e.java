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

    /* JADX WARNING: Removed duplicated region for block: B:13:0x001d A:{ExcHandler: java.io.IOException (r1_3 'e' java.lang.Throwable), Splitter: B:1:0x0002} */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x002a A:{Catch:{ all -> 0x004a }} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0042 A:{SYNTHETIC, Splitter: B:20:0x0042} */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0018 A:{ExcHandler: java.io.IOException (e java.io.IOException), Splitter: B:3:0x0008} */
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
            openInputStream = this.dv.openInputStream(uri);
            try {
                int b = com.bumptech.glide.load.b.b(this.dL, openInputStream, this.du);
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
