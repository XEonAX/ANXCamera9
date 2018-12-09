package com.android.camera.effect;

import android.content.res.AssetManager;
import android.opengl.GLES20;
import com.android.camera.CameraAppImpl;
import com.android.camera.log.Log;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.Buffer;

public class ShaderUtil {
    public static final String DIR = "shading_script";
    public static final int NO_TEXTURE = -1;
    private static final String TAG = "Camera_ShaderUtil";

    public static int loadShader(int i, String str) {
        int glCreateShader = GLES20.glCreateShader(i);
        if (glCreateShader == 0) {
            return glCreateShader;
        }
        GLES20.glShaderSource(glCreateShader, str);
        GLES20.glCompileShader(glCreateShader);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(glCreateShader, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateShader;
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Could not compile shader ");
        stringBuilder.append(i);
        stringBuilder.append(":");
        stringBuilder.append(str);
        Log.e(str2, stringBuilder.toString());
        String str3 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Info: ");
        stringBuilder2.append(GLES20.glGetShaderInfoLog(glCreateShader));
        Log.e(str3, stringBuilder2.toString());
        GLES20.glDeleteShader(glCreateShader);
        return 0;
    }

    public static int createProgram(String str, String str2) {
        int loadShader = loadShader(35633, str);
        StringBuilder stringBuilder;
        if (loadShader == 0) {
            str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Fail to init vertex shader ");
            stringBuilder.append(str);
            Log.e(str2, stringBuilder.toString());
            return 0;
        }
        int loadShader2 = loadShader(35632, str2);
        if (loadShader2 == 0) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Fail to init fragment shader ");
            stringBuilder.append(str2);
            Log.e(str, stringBuilder.toString());
            return 0;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        if (glCreateProgram != 0) {
            GLES20.glGetError();
            GLES20.glAttachShader(glCreateProgram, loadShader);
            checkGlError("glAttachShader");
            GLES20.glAttachShader(glCreateProgram, loadShader2);
            checkGlError("glAttachShader");
            GLES20.glLinkProgram(glCreateProgram);
            int[] iArr = new int[1];
            GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
            if (iArr[0] != 1) {
                Log.e(TAG, "Could not link program: ");
                Log.e(TAG, GLES20.glGetProgramInfoLog(glCreateProgram));
                GLES20.glDeleteProgram(glCreateProgram);
                glCreateProgram = 0;
            }
        }
        GLES20.glDeleteShader(loadShader);
        GLES20.glDeleteShader(loadShader2);
        return glCreateProgram;
    }

    public static void checkGlError(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("ES20_ERROR: op ");
            stringBuilder.append(str);
            stringBuilder.append(": glError ");
            stringBuilder.append(glGetError);
            Log.e(TAG, stringBuilder.toString());
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append(": glError ");
            stringBuilder2.append(glGetError);
            throw new RuntimeException(stringBuilder2.toString());
        }
    }

    public static String loadFromAssetsFile(String str) {
        Exception e;
        String str2 = null;
        try {
            AssetManager assets = CameraAppImpl.getAndroidContext().getAssets();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("shading_script/");
            stringBuilder.append(str);
            InputStream open = assets.open(stringBuilder.toString());
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            while (true) {
                int read = open.read();
                if (read != -1) {
                    byteArrayOutputStream.write(read);
                } else {
                    byte[] toByteArray = byteArrayOutputStream.toByteArray();
                    byteArrayOutputStream.close();
                    open.close();
                    str = new String(toByteArray, "UTF-8");
                    try {
                        return str.replaceAll("\\r\\n", "\n");
                    } catch (Exception e2) {
                        Exception exception = e2;
                        str2 = str;
                        e = exception;
                    }
                }
            }
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            return str2;
        }
    }

    public static void loadYuvToTextures(Buffer buffer, Buffer buffer2, int i, int i2, int[] iArr) {
        int[] iArr2 = iArr;
        if (buffer == null || buffer2 == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid channel ");
            stringBuilder.append(buffer == null ? "Y" : "UV");
            Log.e(str, stringBuilder.toString());
            return;
        }
        int i3 = 0;
        if (iArr2 == null || iArr2.length < 2) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("invalid output texture size ");
            if (iArr2 != null) {
                i3 = iArr2.length;
            }
            stringBuilder2.append(i3);
            Log.e(str2, stringBuilder2.toString());
            return;
        }
        int i4;
        int i5;
        int i6;
        float f;
        float f2;
        int i7;
        if (iArr2[0] == -1) {
            GLES20.glGenTextures(1, iArr2, 0);
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(3553, iArr2[0]);
            i4 = 3553;
            GLES20.glTexImage2D(3553, 0, 6409, i, i2, 0, 6409, 5121, buffer);
        } else {
            i4 = 3553;
            GLES20.glActiveTexture(33984);
            GLES20.glBindTexture(i4, iArr2[0]);
            GLES20.glTexImage2D(3553, 0, 6409, i, i2, 0, 6409, 5121, buffer);
        }
        GLES20.glTexParameterf(i4, 10240, 9729.0f);
        GLES20.glTexParameterf(i4, 10241, 9729.0f);
        GLES20.glTexParameterf(i4, 10242, 33071.0f);
        GLES20.glTexParameterf(i4, 10243, 33071.0f);
        if (iArr2[1] == -1) {
            GLES20.glGenTextures(1, iArr2, 1);
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(i4, iArr2[1]);
            float f3 = 33071.0f;
            i5 = 10242;
            i6 = 10241;
            f = 9729.0f;
            int i8 = 10240;
            GLES20.glTexImage2D(3553, 0, 6410, i / 2, i2 / 2, 0, 6410, 5121, buffer2);
            int i9 = i8;
            f2 = f3;
            i7 = i5;
            i5 = i6;
            i6 = i9;
        } else {
            f = 9729.0f;
            int i10 = 10240;
            float f4 = 33071.0f;
            GLES20.glActiveTexture(33985);
            GLES20.glBindTexture(i4, iArr2[1]);
            i7 = 10242;
            i5 = 10241;
            i6 = i10;
            f2 = f4;
            GLES20.glTexImage2D(3553, 0, 6410, i / 2, i2 / 2, 0, 6410, 5121, buffer2);
        }
        GLES20.glTexParameterf(i4, i6, f);
        GLES20.glTexParameterf(i4, i5, f);
        GLES20.glTexParameterf(i4, i7, f2);
        GLES20.glTexParameterf(i4, 10243, f2);
    }
}
