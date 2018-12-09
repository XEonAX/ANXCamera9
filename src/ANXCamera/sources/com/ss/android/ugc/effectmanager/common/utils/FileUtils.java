package com.ss.android.ugc.effectmanager.common.utils;

import android.os.Environment;
import android.text.TextUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileUtils {
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0045 A:{SYNTHETIC, Splitter: B:32:0x0045} */
    public static void writeToExternal(java.lang.String r3, java.lang.String r4) {
        /*
        r0 = com.ss.android.ugc.effectmanager.common.utils.FileUtils.class;
        monitor-enter(r0);
        r1 = new java.io.File;	 Catch:{ all -> 0x004e }
        r1.<init>(r4);	 Catch:{ all -> 0x004e }
        r4 = r1.exists();	 Catch:{ all -> 0x004e }
        if (r4 != 0) goto L_0x0016;
    L_0x000e:
        r4 = r1.getPath();	 Catch:{ all -> 0x004e }
        r2 = 1;
        createFile(r4, r2);	 Catch:{ all -> 0x004e }
    L_0x0016:
        r4 = 0;
        r2 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0035 }
        r2.<init>(r1);	 Catch:{ Exception -> 0x0035 }
        r3 = r3.getBytes();	 Catch:{ Exception -> 0x0030, all -> 0x002d }
        r2.write(r3);	 Catch:{ Exception -> 0x0030, all -> 0x002d }
        r2.close();	 Catch:{ IOException -> 0x0028 }
        goto L_0x003e;
    L_0x0028:
        r3 = move-exception;
    L_0x0029:
        r3.printStackTrace();	 Catch:{ all -> 0x004e }
        goto L_0x003e;
    L_0x002d:
        r3 = move-exception;
        r4 = r2;
        goto L_0x0043;
    L_0x0030:
        r3 = move-exception;
        r4 = r2;
        goto L_0x0036;
    L_0x0033:
        r3 = move-exception;
        goto L_0x0043;
    L_0x0035:
        r3 = move-exception;
    L_0x0036:
        r3.printStackTrace();	 Catch:{ all -> 0x0033 }
        if (r4 == 0) goto L_0x0041;
    L_0x003b:
        r4.close();	 Catch:{ IOException -> 0x003f }
    L_0x003e:
        goto L_0x0041;
    L_0x003f:
        r3 = move-exception;
        goto L_0x0029;
    L_0x0041:
        monitor-exit(r0);	 Catch:{ all -> 0x004e }
        return;
    L_0x0043:
        if (r4 == 0) goto L_0x004d;
    L_0x0045:
        r4.close();	 Catch:{ IOException -> 0x0049 }
        goto L_0x004d;
    L_0x0049:
        r4 = move-exception;
        r4.printStackTrace();	 Catch:{ all -> 0x004e }
    L_0x004d:
        throw r3;	 Catch:{ all -> 0x004e }
    L_0x004e:
        r3 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x004e }
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.common.utils.FileUtils.writeToExternal(java.lang.String, java.lang.String):void");
    }

    public static File createFile(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.exists()) {
            if (z) {
                try {
                    File parentFile = file.getParentFile();
                    if (!parentFile.exists()) {
                        parentFile.mkdirs();
                    }
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                file.mkdirs();
            }
        }
        return file;
    }

    public static boolean isSdcardAvailable() {
        String externalStorageState = Environment.getExternalStorageState();
        return "mounted".equals(externalStorageState) || "mounted_ro".equals(externalStorageState);
    }

    public static boolean isSdcardWritable() {
        try {
            return "mounted".equals(Environment.getExternalStorageState());
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean ensureDirExists(File file) {
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.exists();
    }

    public static boolean checkFileExists(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return new File(str).exists();
    }

    public static boolean removeFile(String str) {
        boolean z = false;
        if (!isSdcardWritable() || TextUtils.isEmpty(str)) {
            return false;
        }
        File file = new File(str);
        if (file.exists() && file.canWrite() && file.delete()) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00bd A:{SYNTHETIC, Splitter: B:46:0x00bd} */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c5 A:{Catch:{ IOException -> 0x00c1 }} */
    public static void unZip(java.lang.String r5, java.lang.String r6) throws com.ss.android.ugc.effectmanager.common.exception.UnzipException {
        /*
        r0 = 0;
        r1 = new java.util.zip.ZipInputStream;	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
        r2 = new java.io.BufferedInputStream;	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
        r3 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
        r3.<init>(r5);	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
        r2.<init>(r3);	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
        r1.<init>(r2);	 Catch:{ IOException -> 0x00ac, all -> 0x00a9 }
    L_0x0012:
        r5 = r1.getNextEntry();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        if (r5 == 0) goto L_0x008f;
    L_0x0018:
        r2 = r5.getName();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r5 = r5.isDirectory();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        if (r5 == 0) goto L_0x003f;
    L_0x0022:
        r5 = new java.io.File;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.<init>();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r6);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r4 = java.io.File.separator;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r4);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r2);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2 = r3.toString();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r5.<init>(r2);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r5.mkdirs();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        goto L_0x008a;
    L_0x003f:
        r5 = new java.io.File;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3 = new java.lang.StringBuilder;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.<init>();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r6);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r4 = java.io.File.separator;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r4);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.append(r2);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2 = r3.toString();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r5.<init>(r2);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2 = r5.exists();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        if (r2 == 0) goto L_0x0062;
    L_0x005e:
        r5.delete();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        goto L_0x0069;
    L_0x0062:
        r2 = r5.getParentFile();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2.mkdirs();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
    L_0x0069:
        r5.createNewFile();	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2 = new java.io.BufferedOutputStream;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3 = new java.io.FileOutputStream;	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r3.<init>(r5);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r2.<init>(r3);	 Catch:{ IOException -> 0x00a5, all -> 0x00a3 }
        r5 = 2048; // 0x800 float:2.87E-42 double:1.0118E-320;
        r5 = new byte[r5];	 Catch:{ IOException -> 0x008d, all -> 0x008b }
    L_0x007a:
        r0 = r1.read(r5);	 Catch:{ IOException -> 0x008d, all -> 0x008b }
        r3 = -1;
        if (r0 == r3) goto L_0x0086;
    L_0x0081:
        r3 = 0;
        r2.write(r5, r3, r0);	 Catch:{ IOException -> 0x008d, all -> 0x008b }
        goto L_0x007a;
    L_0x0086:
        r2.flush();	 Catch:{ IOException -> 0x008d, all -> 0x008b }
        r0 = r2;
    L_0x008a:
        goto L_0x0012;
    L_0x008b:
        r5 = move-exception;
        goto L_0x00ba;
    L_0x008d:
        r5 = move-exception;
        goto L_0x00a7;
        r1.close();	 Catch:{ IOException -> 0x0094 }
        goto L_0x0096;
    L_0x0094:
        r5 = move-exception;
        goto L_0x009c;
    L_0x0096:
        if (r0 == 0) goto L_0x00a1;
    L_0x0098:
        r0.close();	 Catch:{ IOException -> 0x0094 }
        goto L_0x00a1;
        r5.printStackTrace();
        goto L_0x00a2;
    L_0x00a2:
        return;
    L_0x00a3:
        r5 = move-exception;
        goto L_0x00bb;
    L_0x00a5:
        r5 = move-exception;
        r2 = r0;
    L_0x00a7:
        r0 = r1;
        goto L_0x00ae;
    L_0x00a9:
        r5 = move-exception;
        r1 = r0;
        goto L_0x00bb;
    L_0x00ac:
        r5 = move-exception;
        r2 = r0;
    L_0x00ae:
        r6 = new com.ss.android.ugc.effectmanager.common.exception.UnzipException;	 Catch:{ all -> 0x00b8 }
        r5 = r5.getMessage();	 Catch:{ all -> 0x00b8 }
        r6.<init>(r5);	 Catch:{ all -> 0x00b8 }
        throw r6;	 Catch:{ all -> 0x00b8 }
    L_0x00b8:
        r5 = move-exception;
        r1 = r0;
    L_0x00ba:
        r0 = r2;
    L_0x00bb:
        if (r1 == 0) goto L_0x00c3;
    L_0x00bd:
        r1.close();	 Catch:{ IOException -> 0x00c1 }
        goto L_0x00c3;
    L_0x00c1:
        r6 = move-exception;
        goto L_0x00c9;
    L_0x00c3:
        if (r0 == 0) goto L_0x00ce;
    L_0x00c5:
        r0.close();	 Catch:{ IOException -> 0x00c1 }
        goto L_0x00ce;
        r6.printStackTrace();
    L_0x00ce:
        throw r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.common.utils.FileUtils.unZip(java.lang.String, java.lang.String):void");
    }

    public static String combineFilePath(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        if (TextUtils.isEmpty(str)) {
            str = "";
        }
        stringBuilder.append(str);
        if (TextUtils.isEmpty(str2)) {
            str2 = "";
        }
        stringBuilder.append(str2);
        return stringBuilder.toString();
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x0060 A:{SYNTHETIC, Splitter: B:32:0x0060} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x006a A:{SYNTHETIC, Splitter: B:37:0x006a} */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0072 A:{SYNTHETIC, Splitter: B:42:0x0072} */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x007c A:{SYNTHETIC, Splitter: B:47:0x007c} */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0060 A:{SYNTHETIC, Splitter: B:32:0x0060} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x006a A:{SYNTHETIC, Splitter: B:37:0x006a} */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0072 A:{SYNTHETIC, Splitter: B:42:0x0072} */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x007c A:{SYNTHETIC, Splitter: B:47:0x007c} */
    public static java.lang.String getFileContent(java.lang.String r5) {
        /*
        r0 = new java.io.File;
        r0.<init>(r5);
        r5 = r0.getPath();
        r5 = checkFileExists(r5);
        if (r5 == 0) goto L_0x0085;
    L_0x000f:
        r5 = "";
        r1 = 0;
        r2 = new java.io.FileReader;	 Catch:{ Exception -> 0x0057, all -> 0x0053 }
        r2.<init>(r0);	 Catch:{ Exception -> 0x0057, all -> 0x0053 }
        r0 = new java.io.BufferedReader;	 Catch:{ Exception -> 0x004e, all -> 0x004b }
        r0.<init>(r2);	 Catch:{ Exception -> 0x004e, all -> 0x004b }
    L_0x001e:
        r1 = r0.readLine();	 Catch:{ Exception -> 0x0049 }
        if (r1 == 0) goto L_0x0035;
    L_0x0024:
        r3 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0049 }
        r3.<init>();	 Catch:{ Exception -> 0x0049 }
        r3.append(r5);	 Catch:{ Exception -> 0x0049 }
        r3.append(r1);	 Catch:{ Exception -> 0x0049 }
        r1 = r3.toString();	 Catch:{ Exception -> 0x0049 }
        r5 = r1;
        goto L_0x001e;
        r2.close();	 Catch:{ IOException -> 0x003b }
        goto L_0x003f;
    L_0x003b:
        r1 = move-exception;
        r1.printStackTrace();
        r0.close();	 Catch:{ IOException -> 0x0044 }
    L_0x0043:
        goto L_0x006e;
    L_0x0044:
        r0 = move-exception;
        r0.printStackTrace();
        goto L_0x0043;
    L_0x0049:
        r1 = move-exception;
        goto L_0x005b;
    L_0x004b:
        r5 = move-exception;
        r0 = r1;
        goto L_0x0070;
    L_0x004e:
        r0 = move-exception;
        r4 = r1;
        r1 = r0;
        r0 = r4;
        goto L_0x005b;
    L_0x0053:
        r5 = move-exception;
        r0 = r1;
        r2 = r0;
        goto L_0x0070;
    L_0x0057:
        r0 = move-exception;
        r2 = r1;
        r1 = r0;
        r0 = r2;
    L_0x005b:
        r1.printStackTrace();	 Catch:{ all -> 0x006f }
        if (r2 == 0) goto L_0x0068;
    L_0x0060:
        r2.close();	 Catch:{ IOException -> 0x0064 }
        goto L_0x0068;
    L_0x0064:
        r1 = move-exception;
        r1.printStackTrace();
    L_0x0068:
        if (r0 == 0) goto L_0x006e;
    L_0x006a:
        r0.close();	 Catch:{ IOException -> 0x0044 }
        goto L_0x0043;
    L_0x006e:
        return r5;
    L_0x006f:
        r5 = move-exception;
    L_0x0070:
        if (r2 == 0) goto L_0x007a;
    L_0x0072:
        r2.close();	 Catch:{ IOException -> 0x0076 }
        goto L_0x007a;
    L_0x0076:
        r1 = move-exception;
        r1.printStackTrace();
    L_0x007a:
        if (r0 == 0) goto L_0x0084;
    L_0x007c:
        r0.close();	 Catch:{ IOException -> 0x0080 }
        goto L_0x0084;
    L_0x0080:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x0084:
        throw r5;
    L_0x0085:
        r5 = "";
        return r5;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.common.utils.FileUtils.getFileContent(java.lang.String):java.lang.String");
    }

    public static InputStream getFileStream(String str) {
        File file = new File(str);
        if (!checkFileExists(file.getPath())) {
            return null;
        }
        InputStream fileInputStream;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (Exception e) {
            e.printStackTrace();
            fileInputStream = null;
        }
        return fileInputStream;
    }

    public static void removeDir(File file) {
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null && listFiles.length != 0) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        removeDir(file2);
                    } else {
                        file2.delete();
                    }
                }
            }
        }
    }
}
