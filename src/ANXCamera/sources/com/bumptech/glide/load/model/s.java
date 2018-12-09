package com.bumptech.glide.load.model;

import com.bumptech.glide.load.a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import java.io.InputStream;

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
    public boolean a(@android.support.annotation.NonNull java.io.InputStream r4, @android.support.annotation.NonNull java.io.File r5, @android.support.annotation.NonNull com.bumptech.glide.load.f r6) {
        /*
        r3 = this;
        r6 = r3.du;
        r0 = byte[].class;
        r1 = 65536; // 0x10000 float:9.18355E-41 double:3.2379E-319;
        r6 = r6.a(r1, r0);
        r6 = (byte[]) r6;
        r0 = 0;
        r1 = 0;
        r2 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x0033 }
        r2.<init>(r5);	 Catch:{ IOException -> 0x0033 }
    L_0x0015:
        r5 = r4.read(r6);	 Catch:{ IOException -> 0x002e, all -> 0x002b }
        r1 = -1;
        if (r5 == r1) goto L_0x0020;
    L_0x001c:
        r2.write(r6, r0, r5);	 Catch:{ IOException -> 0x002e, all -> 0x002b }
        goto L_0x0015;
    L_0x0020:
        r2.close();	 Catch:{ IOException -> 0x002e, all -> 0x002b }
        r0 = 1;
        r2.close();	 Catch:{ IOException -> 0x0029 }
        goto L_0x0049;
    L_0x0029:
        r4 = move-exception;
        goto L_0x004b;
    L_0x002b:
        r4 = move-exception;
        r1 = r2;
        goto L_0x0052;
    L_0x002e:
        r4 = move-exception;
        r1 = r2;
        goto L_0x0034;
    L_0x0031:
        r4 = move-exception;
        goto L_0x0052;
    L_0x0033:
        r4 = move-exception;
    L_0x0034:
        r5 = "StreamEncoder";
        r2 = 3;
        r5 = android.util.Log.isLoggable(r5, r2);	 Catch:{ all -> 0x0031 }
        if (r5 == 0) goto L_0x0044;
    L_0x003d:
        r5 = "StreamEncoder";
        r2 = "Failed to encode data onto the OutputStream";
        android.util.Log.d(r5, r2, r4);	 Catch:{ all -> 0x0031 }
    L_0x0044:
        if (r1 == 0) goto L_0x004b;
    L_0x0046:
        r1.close();	 Catch:{ IOException -> 0x004a }
    L_0x0049:
        goto L_0x004b;
    L_0x004a:
        r4 = move-exception;
    L_0x004b:
        r4 = r3.du;
        r4.put(r6);
        return r0;
    L_0x0052:
        if (r1 == 0) goto L_0x0059;
    L_0x0054:
        r1.close();	 Catch:{ IOException -> 0x0058 }
        goto L_0x0059;
    L_0x0058:
        r5 = move-exception;
    L_0x0059:
        r5 = r3.du;
        r5.put(r6);
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.model.s.a(java.io.InputStream, java.io.File, com.bumptech.glide.load.f):boolean");
    }
}
