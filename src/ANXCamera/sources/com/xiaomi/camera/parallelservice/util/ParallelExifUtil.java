package com.xiaomi.camera.parallelservice.util;

import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class ParallelExifUtil {
    private static final String TAG = ParallelExifUtil.class.getSimpleName();

    /* JADX WARNING: Removed duplicated region for block: B:36:0x00b5 A:{SYNTHETIC, Splitter: B:36:0x00b5} */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00bd A:{Catch:{ IOException -> 0x00b9 }} */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x009b A:{SYNTHETIC, Splitter: B:27:0x009b} */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x00a3 A:{Catch:{ IOException -> 0x009f }} */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00b5 A:{SYNTHETIC, Splitter: B:36:0x00b5} */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00bd A:{Catch:{ IOException -> 0x00b9 }} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void updateExif(String str) {
        Throwable e;
        Throwable e2;
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateExif path:");
        stringBuilder.append(str);
        Log.v(str2, stringBuilder.toString());
        File file = new File(str);
        if (file.exists()) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(".tmp");
            File file2 = new File(stringBuilder.toString());
            FileInputStream fileInputStream;
            FileOutputStream fileOutputStream;
            try {
                file2.createNewFile();
                fileInputStream = new FileInputStream(file);
                try {
                    fileOutputStream = new FileOutputStream(file2);
                    try {
                        byte[] bArr = new byte[((int) file.length())];
                        fileInputStream.read(bArr);
                        fileOutputStream.write(ExifInterface.removeParallelProcessComment(bArr));
                        fileOutputStream.close();
                        file.delete();
                        file2.renameTo(file);
                    } catch (Exception e3) {
                        e = e3;
                    }
                    try {
                        fileInputStream.close();
                        fileOutputStream.close();
                    } catch (Throwable e4) {
                        Log.e(TAG, "close image file failed!", e4);
                    }
                } catch (Exception e5) {
                    e2 = e5;
                    fileOutputStream = null;
                    e4 = e2;
                    try {
                        Log.e(TAG, "process exif failed!", e4);
                        if (fileInputStream != null) {
                        }
                        if (fileOutputStream != null) {
                        }
                        return;
                    } catch (Throwable th) {
                        e4 = th;
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (Throwable e22) {
                                Log.e(TAG, "close image file failed!", e22);
                                throw e4;
                            }
                        }
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                        throw e4;
                    }
                } catch (Throwable th2) {
                    e22 = th2;
                    fileOutputStream = null;
                    e4 = e22;
                    if (fileInputStream != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    throw e4;
                }
            } catch (Exception e6) {
                e22 = e6;
                fileInputStream = null;
                fileOutputStream = fileInputStream;
                e4 = e22;
                Log.e(TAG, "process exif failed!", e4);
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
                return;
            } catch (Throwable th3) {
                e22 = th3;
                fileInputStream = null;
                fileOutputStream = fileInputStream;
                e4 = e22;
                if (fileInputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                throw e4;
            }
            return;
        }
        str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("updateExif path not exist. ");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
    }
}
