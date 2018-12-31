package com.miui.filtersdk.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Log;
import java.nio.Buffer;

public class OpenGlUtils {
    public static final int NOT_INIT = -1;
    public static final int NO_TEXTURE = -1;
    public static final int ON_DRAWN = 1;
    private static final String TAG = "OpenGlUtils";

    public static int loadTexture(Bitmap bitmap, int i) {
        return loadTexture(bitmap, i, false);
    }

    public static int loadTexture(Bitmap bitmap, int i, boolean z) {
        if (bitmap == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
        } else {
            GLES20.glBindTexture(3553, i);
            GLUtils.texImage2D(3553, 0, bitmap, 0);
            iArr[0] = i;
        }
        if (z) {
            bitmap.recycle();
        }
        return iArr[0];
    }

    public static int loadTexture(Buffer buffer, int i, int i2, int i3) {
        int i4 = i3;
        if (buffer == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i4 == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, 5121, buffer);
        } else {
            GLES20.glBindTexture(3553, i4);
            GLES20.glTexSubImage2D(3553, 0, 0, 0, i, i2, 6408, 5121, buffer);
            iArr[0] = i4;
        }
        return iArr[0];
    }

    public static int loadTexture(Buffer buffer, int i, int i2, int i3, int i4) {
        int i5 = i3;
        if (buffer == null) {
            return -1;
        }
        int[] iArr = new int[1];
        if (i5 == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10242, 33071.0f);
            GLES20.glTexParameterf(3553, 10243, 33071.0f);
            GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, i4, buffer);
        } else {
            GLES20.glBindTexture(3553, i5);
            GLES20.glTexSubImage2D(3553, 0, 0, 0, i, i2, 6408, i4, buffer);
            iArr[0] = i5;
        }
        return iArr[0];
    }

    public static int loadTexture(Context context, String str) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        if (iArr[0] != 0) {
            Bitmap imageFromAssetsFile = getImageFromAssetsFile(context, str);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, imageFromAssetsFile, 0);
            imageFromAssetsFile.recycle();
        }
        if (iArr[0] != 0) {
            return iArr[0];
        }
        Log.e(TAG, String.format("loadTexture failed,path:%s", new Object[]{str}));
        return -1;
    }

    /* JADX WARNING: Missing block: B:16:0x00e5, code:
            return;
     */
    public static void loadYuvToTextures(java.nio.Buffer r17, java.nio.Buffer r18, int r19, int r20, int[] r21) {
        /*
        r9 = r21;
        if (r17 == 0) goto L_0x00e5;
    L_0x0004:
        if (r18 != 0) goto L_0x0008;
    L_0x0006:
        goto L_0x00e5;
    L_0x0008:
        if (r9 == 0) goto L_0x00e4;
    L_0x000a:
        r0 = r9.length;
        r10 = 2;
        if (r0 >= r10) goto L_0x0010;
    L_0x000e:
        goto L_0x00e4;
    L_0x0010:
        r0 = 0;
        r1 = r9[r0];
        r7 = 10241; // 0x2801 float:1.435E-41 double:5.0597E-320;
        r6 = 10240; // 0x2800 float:1.4349E-41 double:5.059E-320;
        r2 = 33984; // 0x84c0 float:4.7622E-41 double:1.67903E-319;
        r5 = -1;
        r4 = 1191259904; // 0x47012f00 float:33071.0 double:5.88560594E-315;
        r3 = 1175979008; // 0x46180400 float:9729.0 double:5.81010828E-315;
        r10 = 1;
        r11 = 3553; // 0xde1 float:4.979E-42 double:1.7554E-320;
        if (r1 != r5) goto L_0x0060;
    L_0x0026:
        android.opengl.GLES20.glGenTextures(r10, r9, r0);
        android.opengl.GLES20.glActiveTexture(r2);
        r0 = r9[r0];
        android.opengl.GLES20.glBindTexture(r11, r0);
        r0 = 3553; // 0xde1 float:4.979E-42 double:1.7554E-320;
        r1 = 0;
        r2 = 6409; // 0x1909 float:8.981E-42 double:3.1665E-320;
        r13 = 0;
        r14 = 6409; // 0x1909 float:8.981E-42 double:3.1665E-320;
        r15 = 5121; // 0x1401 float:7.176E-42 double:2.53E-320;
        r10 = r3;
        r3 = r19;
        r12 = r4;
        r4 = r20;
        r5 = r13;
        r12 = r6;
        r6 = r14;
        r7 = r15;
        r8 = r17;
        android.opengl.GLES20.glTexImage2D(r0, r1, r2, r3, r4, r5, r6, r7, r8);
        android.opengl.GLES20.glTexParameterf(r11, r12, r10);
        r7 = 10241; // 0x2801 float:1.435E-41 double:5.0597E-320;
        android.opengl.GLES20.glTexParameterf(r11, r7, r10);
        r0 = 1191259904; // 0x47012f00 float:33071.0 double:5.88560594E-315;
        r1 = 10242; // 0x2802 float:1.4352E-41 double:5.06E-320;
        android.opengl.GLES20.glTexParameterf(r11, r1, r0);
        r1 = 10243; // 0x2803 float:1.4354E-41 double:5.0607E-320;
        android.opengl.GLES20.glTexParameterf(r11, r1, r0);
        goto L_0x007e;
    L_0x0060:
        r10 = r3;
        r12 = r6;
        android.opengl.GLES20.glActiveTexture(r2);
        r0 = r9[r0];
        android.opengl.GLES20.glBindTexture(r11, r0);
        r0 = 3553; // 0xde1 float:4.979E-42 double:1.7554E-320;
        r1 = 0;
        r2 = 6409; // 0x1909 float:8.981E-42 double:3.1665E-320;
        r5 = 0;
        r6 = 6409; // 0x1909 float:8.981E-42 double:3.1665E-320;
        r13 = 5121; // 0x1401 float:7.176E-42 double:2.53E-320;
        r3 = r19;
        r4 = r20;
        r7 = r13;
        r8 = r17;
        android.opengl.GLES20.glTexImage2D(r0, r1, r2, r3, r4, r5, r6, r7, r8);
    L_0x007e:
        r0 = 1;
        r1 = r9[r0];
        r2 = 33985; // 0x84c1 float:4.7623E-41 double:1.6791E-319;
        r3 = -1;
        if (r1 != r3) goto L_0x00c1;
    L_0x0087:
        android.opengl.GLES20.glGenTextures(r0, r9, r0);
        android.opengl.GLES20.glActiveTexture(r2);
        r0 = r9[r0];
        android.opengl.GLES20.glBindTexture(r11, r0);
        r0 = 3553; // 0xde1 float:4.979E-42 double:1.7554E-320;
        r1 = 0;
        r2 = 6410; // 0x190a float:8.982E-42 double:3.167E-320;
        r3 = 2;
        r4 = r19 / 2;
        r5 = r20 / 2;
        r6 = 0;
        r7 = 6410; // 0x190a float:8.982E-42 double:3.167E-320;
        r8 = 5121; // 0x1401 float:7.176E-42 double:2.53E-320;
        r3 = r4;
        r4 = r5;
        r5 = r6;
        r6 = r7;
        r7 = r8;
        r8 = r18;
        android.opengl.GLES20.glTexImage2D(r0, r1, r2, r3, r4, r5, r6, r7, r8);
        android.opengl.GLES20.glTexParameterf(r11, r12, r10);
        r0 = 10241; // 0x2801 float:1.435E-41 double:5.0597E-320;
        android.opengl.GLES20.glTexParameterf(r11, r0, r10);
        r0 = 1191259904; // 0x47012f00 float:33071.0 double:5.88560594E-315;
        r1 = 10242; // 0x2802 float:1.4352E-41 double:5.06E-320;
        android.opengl.GLES20.glTexParameterf(r11, r1, r0);
        r1 = 10243; // 0x2803 float:1.4354E-41 double:5.0607E-320;
        android.opengl.GLES20.glTexParameterf(r11, r1, r0);
        goto L_0x00e3;
    L_0x00c1:
        android.opengl.GLES20.glActiveTexture(r2);
        r0 = 1;
        r0 = r9[r0];
        android.opengl.GLES20.glBindTexture(r11, r0);
        r0 = 3553; // 0xde1 float:4.979E-42 double:1.7554E-320;
        r1 = 0;
        r2 = 6410; // 0x190a float:8.982E-42 double:3.167E-320;
        r3 = 2;
        r4 = r19 / 2;
        r5 = r20 / 2;
        r6 = 0;
        r7 = 6410; // 0x190a float:8.982E-42 double:3.167E-320;
        r8 = 5121; // 0x1401 float:7.176E-42 double:2.53E-320;
        r3 = r4;
        r4 = r5;
        r5 = r6;
        r6 = r7;
        r7 = r8;
        r8 = r18;
        android.opengl.GLES20.glTexImage2D(r0, r1, r2, r3, r4, r5, r6, r7, r8);
    L_0x00e3:
        return;
    L_0x00e4:
        return;
    L_0x00e5:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.miui.filtersdk.utils.OpenGlUtils.loadYuvToTextures(java.nio.Buffer, java.nio.Buffer, int, int, int[]):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0038 A:{SYNTHETIC, Splitter: B:24:0x0038} */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0026 A:{ExcHandler: all (th java.lang.Throwable), Splitter: B:3:0x000f} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0038 A:{SYNTHETIC, Splitter: B:24:0x0038} */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x003f A:{SYNTHETIC, Splitter: B:28:0x003f} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:12:0x0021, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:13:0x0022, code:
            r1 = r0;
            r0 = r2;
            r2 = r1;
     */
    /* JADX WARNING: Missing block: B:14:0x0026, code:
            r3 = th;
     */
    /* JADX WARNING: Missing block: B:25:?, code:
            r0.close();
     */
    /* JADX WARNING: Missing block: B:29:?, code:
            r2.close();
     */
    /* JADX WARNING: Missing block: B:30:0x0043, code:
            r2 = move-exception;
     */
    /* JADX WARNING: Missing block: B:31:0x0044, code:
            r2.printStackTrace();
     */
    public static android.graphics.Bitmap getImageFromAssetsFile(android.content.Context r2, java.lang.String r3) {
        /*
        r2 = r2.getResources();
        r2 = r2.getAssets();
        r0 = 0;
        r2 = r2.open(r3);	 Catch:{ IOException -> 0x0031 }
        r3 = android.graphics.BitmapFactory.decodeStream(r2);	 Catch:{ IOException -> 0x0028, all -> 0x0026 }
        r2.close();	 Catch:{ IOException -> 0x0021, all -> 0x0026 }
        if (r2 == 0) goto L_0x003c;
    L_0x0018:
        r2.close();	 Catch:{ IOException -> 0x001c }
    L_0x001b:
        goto L_0x003c;
    L_0x001c:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x001b;
    L_0x0021:
        r0 = move-exception;
        r1 = r0;
        r0 = r2;
        r2 = r1;
        goto L_0x0033;
    L_0x0026:
        r3 = move-exception;
        goto L_0x003d;
    L_0x0028:
        r3 = move-exception;
        r1 = r0;
        r0 = r2;
        r2 = r3;
        r3 = r1;
        goto L_0x0033;
    L_0x002e:
        r3 = move-exception;
        r2 = r0;
        goto L_0x003d;
    L_0x0031:
        r2 = move-exception;
        r3 = r0;
    L_0x0033:
        r2.printStackTrace();	 Catch:{ all -> 0x002e }
        if (r0 == 0) goto L_0x003c;
    L_0x0038:
        r0.close();	 Catch:{ IOException -> 0x001c }
        goto L_0x001b;
    L_0x003c:
        return r3;
    L_0x003d:
        if (r2 == 0) goto L_0x0047;
    L_0x003f:
        r2.close();	 Catch:{ IOException -> 0x0043 }
        goto L_0x0047;
    L_0x0043:
        r2 = move-exception;
        r2.printStackTrace();
    L_0x0047:
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.miui.filtersdk.utils.OpenGlUtils.getImageFromAssetsFile(android.content.Context, java.lang.String):android.graphics.Bitmap");
    }

    public static int loadProgram(String str, String str2) {
        int[] iArr = new int[1];
        int loadShader = loadShader(str, 35633);
        if (loadShader == 0) {
            Log.d("Load Program", "Vertex Shader Failed");
            return 0;
        }
        int loadShader2 = loadShader(str2, 35632);
        if (loadShader2 == 0) {
            Log.d("Load Program", "Fragment Shader Failed");
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        GLES20.glAttachShader(glCreateProgram, loadShader);
        GLES20.glAttachShader(glCreateProgram, loadShader2);
        GLES20.glLinkProgram(glCreateProgram);
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] <= 0) {
            Log.d("Load Program", "Linking Failed");
            return 0;
        }
        GLES20.glDeleteShader(loadShader);
        GLES20.glDeleteShader(loadShader2);
        return glCreateProgram;
    }

    private static int loadShader(String str, int i) {
        int[] iArr = new int[1];
        i = GLES20.glCreateShader(i);
        GLES20.glShaderSource(i, str);
        GLES20.glCompileShader(i);
        GLES20.glGetShaderiv(i, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return i;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Compilation\n");
        stringBuilder.append(GLES20.glGetShaderInfoLog(i));
        Log.e("Load Shader Failed", stringBuilder.toString());
        return 0;
    }

    public static void checkGlError(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": glError 0x");
            stringBuilder.append(Integer.toHexString(glGetError));
            str = stringBuilder.toString();
            Log.e(TAG, str);
            throw new RuntimeException(str);
        }
    }

    public static int initEffectTexture(int i, int i2, int[] iArr, int i3) {
        if (iArr == null || iArr.length < 1) {
            return -1;
        }
        if (iArr[0] == -1) {
            GLES20.glGenTextures(1, iArr, 0);
            GLES20.glBindTexture(i3, iArr[0]);
            GLES20.glTexParameterf(i3, 10240, 9729.0f);
            GLES20.glTexParameterf(i3, 10241, 9729.0f);
            GLES20.glTexParameterf(i3, 10242, 33071.0f);
            GLES20.glTexParameterf(i3, 10243, 33071.0f);
            GLES20.glTexImage2D(i3, 0, 6408, i, i2, 0, 6408, 5121, null);
        } else {
            GLES20.glBindTexture(i3, iArr[0]);
            GLES20.glTexImage2D(i3, 0, 6408, i, i2, 0, 6408, 5121, null);
        }
        return iArr[0];
    }

    public static int loadTextureFromPath(String str) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        if (iArr[0] != 0) {
            Bitmap imageFromPath = getImageFromPath(str);
            GLES20.glBindTexture(3553, iArr[0]);
            GLES20.glTexParameteri(3553, 10240, 9729);
            GLES20.glTexParameteri(3553, 10241, 9729);
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLUtils.texImage2D(3553, 0, imageFromPath, 0);
            imageFromPath.recycle();
        }
        if (iArr[0] != 0) {
            return iArr[0];
        }
        throw new RuntimeException("Error loading texture.");
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0030 A:{SYNTHETIC, Splitter: B:24:0x0030} */
    public static android.graphics.Bitmap getImageFromPath(java.lang.String r2) {
        /*
        r0 = 0;
        r1 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x001a, all -> 0x0018 }
        r1.<init>(r2);	 Catch:{ IOException -> 0x001a, all -> 0x0018 }
        r2 = android.graphics.BitmapFactory.decodeStream(r1);	 Catch:{ IOException -> 0x0016 }
        r1.close();	 Catch:{ IOException -> 0x0011 }
    L_0x0010:
        goto L_0x002b;
    L_0x0011:
        r0 = move-exception;
        r0.printStackTrace();
        goto L_0x0010;
    L_0x0016:
        r2 = move-exception;
        goto L_0x001c;
    L_0x0018:
        r2 = move-exception;
        goto L_0x002e;
    L_0x001a:
        r2 = move-exception;
        r1 = r0;
    L_0x001c:
        r2.printStackTrace();	 Catch:{ all -> 0x002c }
        if (r1 == 0) goto L_0x002a;
    L_0x0021:
        r1.close();	 Catch:{ IOException -> 0x0025 }
    L_0x0024:
        goto L_0x002a;
    L_0x0025:
        r2 = move-exception;
        r2.printStackTrace();
        goto L_0x0024;
    L_0x002a:
        r2 = r0;
    L_0x002b:
        return r2;
    L_0x002c:
        r2 = move-exception;
        r0 = r1;
    L_0x002e:
        if (r0 == 0) goto L_0x0038;
    L_0x0030:
        r0.close();	 Catch:{ IOException -> 0x0034 }
        goto L_0x0038;
    L_0x0034:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x0038:
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.miui.filtersdk.utils.OpenGlUtils.getImageFromPath(java.lang.String):android.graphics.Bitmap");
    }
}
