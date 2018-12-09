package com.android.camera.sticker;

public class STLicenseUtils {
    private static final String LICENSE_NAME = "SenseME.lic";
    private static final String PREF_ACTIVATE_CODE = "activate_code";
    private static final String PREF_ACTIVATE_CODE_FILE = "activate_code_file";
    private static final String TAG = "STLicenseUtils";

    /* JADX WARNING: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0109 A:{SYNTHETIC, Splitter: B:61:0x0109} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0113 A:{SYNTHETIC, Splitter: B:66:0x0113} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0052 A:{SYNTHETIC, Splitter: B:27:0x0052} */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x005c A:{SYNTHETIC, Splitter: B:32:0x005c} */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x0070  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0109 A:{SYNTHETIC, Splitter: B:61:0x0109} */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x0113 A:{SYNTHETIC, Splitter: B:66:0x0113} */
    public static boolean checkLicense(android.content.Context r8) {
        /*
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = 0;
        r2 = new java.io.InputStreamReader;	 Catch:{ IOException -> 0x004a, all -> 0x0046 }
        r3 = r8.getResources();	 Catch:{ IOException -> 0x004a, all -> 0x0046 }
        r3 = r3.getAssets();	 Catch:{ IOException -> 0x004a, all -> 0x0046 }
        r4 = "SenseME.lic";
        r3 = r3.open(r4);	 Catch:{ IOException -> 0x004a, all -> 0x0046 }
        r2.<init>(r3);	 Catch:{ IOException -> 0x004a, all -> 0x0046 }
        r3 = new java.io.BufferedReader;	 Catch:{ IOException -> 0x0043, all -> 0x0040 }
        r3.<init>(r2);	 Catch:{ IOException -> 0x0043, all -> 0x0040 }
    L_0x0021:
        r4 = r3.readLine();	 Catch:{ IOException -> 0x003e }
        if (r4 == 0) goto L_0x0030;
    L_0x0027:
        r0.append(r4);	 Catch:{ IOException -> 0x003e }
        r4 = "\n";
        r0.append(r4);	 Catch:{ IOException -> 0x003e }
        goto L_0x0021;
        r2.close();	 Catch:{ IOException -> 0x0035 }
        goto L_0x0039;
    L_0x0035:
        r2 = move-exception;
        r2.printStackTrace();
        r3.close();	 Catch:{ IOException -> 0x0060 }
        goto L_0x005f;
    L_0x003e:
        r4 = move-exception;
        goto L_0x004d;
    L_0x0040:
        r8 = move-exception;
        goto L_0x0107;
    L_0x0043:
        r4 = move-exception;
        r3 = r1;
        goto L_0x004d;
    L_0x0046:
        r8 = move-exception;
        r2 = r1;
        goto L_0x0107;
    L_0x004a:
        r4 = move-exception;
        r2 = r1;
        r3 = r2;
    L_0x004d:
        r4.printStackTrace();	 Catch:{ all -> 0x0105 }
        if (r2 == 0) goto L_0x005a;
    L_0x0052:
        r2.close();	 Catch:{ IOException -> 0x0056 }
        goto L_0x005a;
    L_0x0056:
        r2 = move-exception;
        r2.printStackTrace();
    L_0x005a:
        if (r3 == 0) goto L_0x0065;
    L_0x005c:
        r3.close();	 Catch:{ IOException -> 0x0060 }
    L_0x005f:
        goto L_0x0065;
    L_0x0060:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x005f;
    L_0x0065:
        r2 = r0.toString();
        r2 = r2.length();
        r3 = 0;
        if (r2 != 0) goto L_0x0078;
    L_0x0070:
        r8 = "STLicenseUtils";
        r0 = "read license data error";
        com.android.camera.log.Log.e(r8, r0);
        return r3;
    L_0x0078:
        r0 = r0.toString();
        r8 = r8.getApplicationContext();
        r2 = "activate_code_file";
        r8 = r8.getSharedPreferences(r2, r3);
        r2 = "activate_code";
        r1 = r8.getString(r2, r1);
        r2 = -1;
        r2 = java.lang.Integer.valueOf(r2);
        r4 = 1;
        if (r1 == 0) goto L_0x00b6;
    L_0x0094:
        r5 = r0.length();
        r5 = com.sensetime.stmobile.STMobileAuthentificationNative.checkActiveCodeFromBuffer(r0, r5, r1);
        if (r5 == 0) goto L_0x009f;
    L_0x009e:
        goto L_0x00b6;
    L_0x009f:
        r8 = "STLicenseUtils";
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r2 = "activeCode: ";
        r0.append(r2);
        r0.append(r1);
        r0 = r0.toString();
        com.android.camera.log.Log.e(r8, r0);
        return r4;
    L_0x00b6:
        r5 = "STLicenseUtils";
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r7 = "activeCode: ";
        r6.append(r7);
        if (r1 != 0) goto L_0x00c6;
    L_0x00c4:
        r1 = r4;
        goto L_0x00c7;
    L_0x00c6:
        r1 = r3;
    L_0x00c7:
        r6.append(r1);
        r1 = r6.toString();
        com.android.camera.log.Log.e(r5, r1);
        r1 = r0.length();
        r0 = com.sensetime.stmobile.STMobileAuthentificationNative.generateActiveCodeFromBuffer(r0, r1);
        if (r0 == 0) goto L_0x00ee;
    L_0x00db:
        r1 = r0.length();
        if (r1 == 0) goto L_0x00ee;
    L_0x00e1:
        r8 = r8.edit();
        r1 = "activate_code";
        r8.putString(r1, r0);
        r8.commit();
        return r4;
    L_0x00ee:
        r8 = "STLicenseUtils";
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = "generate license error: ";
        r0.append(r1);
        r0.append(r2);
        r0 = r0.toString();
        com.android.camera.log.Log.e(r8, r0);
        return r3;
    L_0x0105:
        r8 = move-exception;
        r1 = r3;
    L_0x0107:
        if (r2 == 0) goto L_0x0111;
    L_0x0109:
        r2.close();	 Catch:{ IOException -> 0x010d }
        goto L_0x0111;
    L_0x010d:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x0111:
        if (r1 == 0) goto L_0x011b;
    L_0x0113:
        r1.close();	 Catch:{ IOException -> 0x0117 }
        goto L_0x011b;
    L_0x0117:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x011b:
        throw r8;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.sticker.STLicenseUtils.checkLicense(android.content.Context):boolean");
    }
}
