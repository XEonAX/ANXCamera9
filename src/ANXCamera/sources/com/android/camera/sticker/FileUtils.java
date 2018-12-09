package com.android.camera.sticker;

public class FileUtils {
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0085 A:{SYNTHETIC, Splitter: B:52:0x0085} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x008f A:{SYNTHETIC, Splitter: B:57:0x008f} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x009e A:{SYNTHETIC, Splitter: B:66:0x009e} */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00a8 A:{SYNTHETIC, Splitter: B:71:0x00a8} */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0085 A:{SYNTHETIC, Splitter: B:52:0x0085} */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x008f A:{SYNTHETIC, Splitter: B:57:0x008f} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x009e A:{SYNTHETIC, Splitter: B:66:0x009e} */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x00a8 A:{SYNTHETIC, Splitter: B:71:0x00a8} */
    public static boolean copyFileIfNeed(android.content.Context r3, java.io.File r4, java.lang.String r5) {
        /*
        if (r4 == 0) goto L_0x00b1;
    L_0x0002:
        r0 = android.text.TextUtils.isEmpty(r5);
        if (r0 != 0) goto L_0x00b1;
    L_0x0008:
        r0 = r4.getParentFile();
        r1 = r0.exists();
        if (r1 != 0) goto L_0x0015;
    L_0x0012:
        r0.mkdirs();
    L_0x0015:
        r0 = r4.exists();
        if (r0 != 0) goto L_0x00b1;
        r0 = 0;
        r1 = 0;
        r2 = r4.exists();	 Catch:{ IOException -> 0x007d, all -> 0x0079 }
        if (r2 == 0) goto L_0x0028;
    L_0x0025:
        r4.delete();	 Catch:{ IOException -> 0x007d, all -> 0x0079 }
    L_0x0028:
        r4.createNewFile();	 Catch:{ IOException -> 0x007d, all -> 0x0079 }
        r3 = r3.getAssets();	 Catch:{ IOException -> 0x007d, all -> 0x0079 }
        r3 = r3.open(r5);	 Catch:{ IOException -> 0x007d, all -> 0x0079 }
        if (r3 != 0) goto L_0x0042;
        if (r3 == 0) goto L_0x0040;
    L_0x0038:
        r3.close();	 Catch:{ IOException -> 0x003c }
        goto L_0x0040;
    L_0x003c:
        r3 = move-exception;
        r3.printStackTrace();
        return r1;
    L_0x0042:
        r5 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x0075, all -> 0x0073 }
        r5.<init>(r4);	 Catch:{ IOException -> 0x0075, all -> 0x0073 }
        r0 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0 = new byte[r0];	 Catch:{ IOException -> 0x0071, all -> 0x006f }
    L_0x004b:
        r2 = r3.read(r0);	 Catch:{ IOException -> 0x0071, all -> 0x006f }
        if (r2 <= 0) goto L_0x0055;
    L_0x0051:
        r5.write(r0, r1, r2);	 Catch:{ IOException -> 0x0071, all -> 0x006f }
        goto L_0x004b;
    L_0x0055:
        r3.close();	 Catch:{ IOException -> 0x0071, all -> 0x006f }
        r5.close();	 Catch:{ IOException -> 0x0071, all -> 0x006f }
        if (r3 == 0) goto L_0x0065;
    L_0x005d:
        r3.close();	 Catch:{ IOException -> 0x0061 }
        goto L_0x0065;
    L_0x0061:
        r3 = move-exception;
        r3.printStackTrace();
        r5.close();	 Catch:{ IOException -> 0x006a }
    L_0x0069:
        goto L_0x00b1;
    L_0x006a:
        r3 = move-exception;
        r3.printStackTrace();
        goto L_0x0069;
    L_0x006f:
        r4 = move-exception;
        goto L_0x009b;
    L_0x0071:
        r0 = move-exception;
        goto L_0x0077;
    L_0x0073:
        r4 = move-exception;
        goto L_0x009c;
    L_0x0075:
        r5 = move-exception;
        r5 = r0;
    L_0x0077:
        r0 = r3;
        goto L_0x007f;
    L_0x0079:
        r3 = move-exception;
        r4 = r3;
        r3 = r0;
        goto L_0x009c;
    L_0x007d:
        r3 = move-exception;
        r5 = r0;
    L_0x007f:
        r4.delete();	 Catch:{ all -> 0x0098 }
        if (r0 == 0) goto L_0x008d;
    L_0x0085:
        r0.close();	 Catch:{ IOException -> 0x0089 }
        goto L_0x008d;
    L_0x0089:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x008d:
        if (r5 == 0) goto L_0x0097;
    L_0x008f:
        r5.close();	 Catch:{ IOException -> 0x0093 }
        goto L_0x0097;
    L_0x0093:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x0097:
        return r1;
    L_0x0098:
        r3 = move-exception;
        r4 = r3;
        r3 = r0;
    L_0x009b:
        r0 = r5;
    L_0x009c:
        if (r3 == 0) goto L_0x00a6;
    L_0x009e:
        r3.close();	 Catch:{ IOException -> 0x00a2 }
        goto L_0x00a6;
    L_0x00a2:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x00a6:
        if (r0 == 0) goto L_0x00b0;
    L_0x00a8:
        r0.close();	 Catch:{ IOException -> 0x00ac }
        goto L_0x00b0;
    L_0x00ac:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x00b0:
        throw r4;
    L_0x00b1:
        r3 = 1;
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.sticker.FileUtils.copyFileIfNeed(android.content.Context, java.io.File, java.lang.String):boolean");
    }
}
