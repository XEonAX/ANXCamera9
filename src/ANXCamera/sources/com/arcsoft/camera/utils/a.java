package com.arcsoft.camera.utils;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.text.format.DateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* compiled from: FileUtil */
public class a {
    private a() {
    }

    public static String a(String str, String str2, String str3, int i, int i2) {
        if (str == null) {
            return null;
        }
        if (!str.endsWith(File.separator)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(File.separator);
            str = stringBuilder.toString();
        }
        String charSequence = DateFormat.format("yyyyMMdd", System.currentTimeMillis()).toString();
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("_");
        stringBuilder2.append(String.format("%03d", new Object[]{Integer.valueOf(i2)}));
        stringBuilder2.append("_");
        stringBuilder2.append(i);
        String stringBuilder3 = stringBuilder2.toString();
        StringBuilder stringBuilder4 = new StringBuilder();
        stringBuilder4.append(str);
        stringBuilder4.append(str2);
        stringBuilder4.append(charSequence);
        stringBuilder4.append(stringBuilder3);
        stringBuilder4.append(str3);
        str = stringBuilder4.toString();
        File file = new File(str);
        if (file.exists()) {
            file.delete();
        }
        return str;
    }

    public static boolean a(Context context, String str, String str2) {
        if (context == null || str == null || str2 == null) {
            return false;
        }
        boolean a;
        try {
            a = a(context.getAssets().open(str), str2);
        } catch (IOException e) {
            e.printStackTrace();
            a = false;
        }
        return a;
    }

    public static boolean a(InputStream inputStream, String str) {
        if (inputStream == null || str == null) {
            return false;
        }
        File file = new File(str);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        if (file.exists()) {
            file.delete();
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, read);
            }
            inputStream.close();
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static boolean a(byte[] bArr, int i, int i2, int i3, String str) {
        if (str != null) {
            File file = new File(str);
            int i4 = 0;
            while (file.exists()) {
                i4++;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(i4);
                file = new File(stringBuilder.toString());
            }
            file.getParentFile().mkdirs();
            try {
                OutputStream fileOutputStream = new FileOutputStream(str);
                YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
                yuvImage.compressToJpeg(new Rect(0, 0, yuvImage.getWidth(), yuvImage.getHeight()), i3, fileOutputStream);
                fileOutputStream.flush();
                fileOutputStream.close();
                return true;
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
        return false;
    }

    public static String getExtension(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf(46);
        return (lastIndexOf < 0 || lastIndexOf >= str.length() - 1) ? null : str.substring(lastIndexOf + 1);
    }

    public static String j(String str, String str2) {
        if (str == null || str2 == null) {
            return null;
        }
        StringBuilder stringBuilder;
        if (!(str.isEmpty() || str.endsWith(File.separator))) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(File.separator);
            str = stringBuilder.toString();
        }
        if (!str2.isEmpty() && str2.startsWith(File.separator)) {
            str2.substring(str2.indexOf(File.separator) + 1);
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(str2);
        return stringBuilder.toString();
    }

    public static boolean o(String str) {
        if (str == null) {
            return false;
        }
        str = str.substring(str.lastIndexOf(46));
        return ".3gp".equals(str) || ".mp4".equals(str);
    }

    public static boolean q(String str) {
        boolean z = false;
        if (str == null) {
            return false;
        }
        if (new File(str).exists()) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0033 A:{Splitter: B:3:0x000d, ExcHandler: all (r3_8 'th' java.lang.Throwable)} */
    /* JADX WARNING: Removed duplicated region for block: B:51:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x004a A:{SYNTHETIC, Splitter: B:30:0x004a} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:14:0x0027, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:15:0x0028, code:
            r2 = r0;
            r0 = r3;
            r3 = r1;
            r1 = r2;
     */
    /* JADX WARNING: Missing block: B:16:0x002d, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:17:0x002e, code:
            r2 = r0;
            r0 = r3;
            r3 = r1;
            r1 = r2;
     */
    /* JADX WARNING: Missing block: B:18:0x0033, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:19:0x0034, code:
            r0 = r3;
            r3 = r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static byte[] r(String str) {
        FileNotFoundException e;
        FileInputStream fileInputStream;
        byte[] bArr;
        IOException e2;
        File file = new File(str);
        FileInputStream fileInputStream2 = null;
        try {
            FileInputStream fileInputStream3 = new FileInputStream(file);
            try {
                byte[] bArr2 = new byte[fileInputStream3.available()];
                while (fileInputStream3.read(bArr2) > 0) {
                }
                try {
                    fileInputStream3.close();
                } catch (IOException e3) {
                    e3.printStackTrace();
                }
                return bArr2;
            } catch (FileNotFoundException e4) {
                e = e4;
                fileInputStream = fileInputStream3;
                bArr = null;
                fileInputStream2 = fileInputStream;
            } catch (IOException e5) {
                e2 = e5;
                fileInputStream = fileInputStream3;
                bArr = null;
                fileInputStream2 = fileInputStream;
                try {
                    e2.printStackTrace();
                    if (fileInputStream2 != null) {
                        return bArr;
                    }
                    try {
                        fileInputStream2.close();
                        return bArr;
                    } catch (IOException e32) {
                        e32.printStackTrace();
                        return bArr;
                    }
                } catch (Throwable th) {
                    Throwable th2 = th;
                    if (fileInputStream2 != null) {
                        try {
                            fileInputStream2.close();
                        } catch (IOException e322) {
                            e322.printStackTrace();
                        }
                    }
                    throw th2;
                }
            } catch (Throwable th3) {
            }
        } catch (FileNotFoundException e6) {
            e = e6;
            bArr = null;
            e.printStackTrace();
            if (fileInputStream2 == null) {
                return bArr;
            }
            fileInputStream2.close();
            return bArr;
        } catch (IOException e7) {
            e2 = e7;
            bArr = null;
            e2.printStackTrace();
            if (fileInputStream2 != null) {
            }
        }
    }
}
