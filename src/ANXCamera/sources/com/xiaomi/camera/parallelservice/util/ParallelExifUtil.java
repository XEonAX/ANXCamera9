package com.xiaomi.camera.parallelservice.util;

public class ParallelExifUtil {
    private static final String TAG = ParallelExifUtil.class.getSimpleName();

    /* JADX WARNING: Removed duplicated region for block: B:36:0x00b5 A:{SYNTHETIC, Splitter: B:36:0x00b5} */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00bd A:{Catch:{ IOException -> 0x00b9 }} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x009b A:{SYNTHETIC, Splitter: B:27:0x009b} */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00a3 A:{Catch:{ IOException -> 0x009f }} */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00b5 A:{SYNTHETIC, Splitter: B:36:0x00b5} */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00bd A:{Catch:{ IOException -> 0x00b9 }} */
    public static void updateExif(java.lang.String r6) {
        /*
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "updateExif path:";
        r1.append(r2);
        r1.append(r6);
        r1 = r1.toString();
        android.util.Log.v(r0, r1);
        r0 = new java.io.File;
        r0.<init>(r6);
        r1 = r0.exists();
        if (r1 != 0) goto L_0x0038;
    L_0x0021:
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "updateExif path not exist. ";
        r1.append(r2);
        r1.append(r6);
        r6 = r1.toString();
        android.util.Log.e(r0, r6);
        return;
    L_0x0038:
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r1.append(r6);
        r6 = ".tmp";
        r1.append(r6);
        r6 = r1.toString();
        r1 = new java.io.File;
        r1.<init>(r6);
        r6 = 0;
        r1.createNewFile();	 Catch:{ Exception -> 0x008e, all -> 0x0089 }
        r2 = new java.io.FileInputStream;	 Catch:{ Exception -> 0x008e, all -> 0x0089 }
        r2.<init>(r0);	 Catch:{ Exception -> 0x008e, all -> 0x0089 }
        r3 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0086, all -> 0x0083 }
        r3.<init>(r1);	 Catch:{ Exception -> 0x0086, all -> 0x0083 }
        r4 = r0.length();	 Catch:{ Exception -> 0x0081 }
        r6 = (int) r4;	 Catch:{ Exception -> 0x0081 }
        r6 = new byte[r6];	 Catch:{ Exception -> 0x0081 }
        r2.read(r6);	 Catch:{ Exception -> 0x0081 }
        r6 = com.android.gallery3d.exif.ExifInterface.removeParallelProcessComment(r6);	 Catch:{ Exception -> 0x0081 }
        r3.write(r6);	 Catch:{ Exception -> 0x0081 }
        r3.close();	 Catch:{ Exception -> 0x0081 }
        r0.delete();	 Catch:{ Exception -> 0x0081 }
        r1.renameTo(r0);	 Catch:{ Exception -> 0x0081 }
        r2.close();	 Catch:{ IOException -> 0x009f }
        r3.close();	 Catch:{ IOException -> 0x009f }
        goto L_0x00b0;
    L_0x0081:
        r6 = move-exception;
        goto L_0x0092;
    L_0x0083:
        r0 = move-exception;
        r3 = r6;
        goto L_0x008c;
    L_0x0086:
        r0 = move-exception;
        r3 = r6;
        goto L_0x0091;
    L_0x0089:
        r0 = move-exception;
        r2 = r6;
        r3 = r2;
    L_0x008c:
        r6 = r0;
        goto L_0x00b3;
    L_0x008e:
        r0 = move-exception;
        r2 = r6;
        r3 = r2;
    L_0x0091:
        r6 = r0;
    L_0x0092:
        r0 = TAG;	 Catch:{ all -> 0x00b2 }
        r1 = "process exif failed!";
        android.util.Log.e(r0, r1, r6);	 Catch:{ all -> 0x00b2 }
        if (r2 == 0) goto L_0x00a1;
    L_0x009b:
        r2.close();	 Catch:{ IOException -> 0x009f }
        goto L_0x00a1;
    L_0x009f:
        r6 = move-exception;
        goto L_0x00a7;
    L_0x00a1:
        if (r3 == 0) goto L_0x00b0;
    L_0x00a3:
        r3.close();	 Catch:{ IOException -> 0x009f }
        goto L_0x00b0;
        r0 = TAG;
        r1 = "close image file failed!";
        android.util.Log.e(r0, r1, r6);
        goto L_0x00b1;
    L_0x00b1:
        return;
    L_0x00b2:
        r6 = move-exception;
    L_0x00b3:
        if (r2 == 0) goto L_0x00bb;
    L_0x00b5:
        r2.close();	 Catch:{ IOException -> 0x00b9 }
        goto L_0x00bb;
    L_0x00b9:
        r0 = move-exception;
        goto L_0x00c1;
    L_0x00bb:
        if (r3 == 0) goto L_0x00ca;
    L_0x00bd:
        r3.close();	 Catch:{ IOException -> 0x00b9 }
        goto L_0x00ca;
        r1 = TAG;
        r2 = "close image file failed!";
        android.util.Log.e(r1, r2, r0);
    L_0x00ca:
        throw r6;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.parallelservice.util.ParallelExifUtil.updateExif(java.lang.String):void");
    }
}
