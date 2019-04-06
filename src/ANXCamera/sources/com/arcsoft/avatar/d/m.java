package com.arcsoft.avatar.d;

import android.content.res.Resources;
import android.opengl.GLES20;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/* compiled from: ShaderUtils */
public class m {
    private m() {
    }

    private static int a(int i, String str) {
        i = GLES20.glCreateShader(i);
        if (i == 0) {
            return i;
        }
        GLES20.glShaderSource(i, str);
        GLES20.glCompileShader(i);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(i, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return i;
        }
        GLES20.glDeleteShader(i);
        return 0;
    }

    public static String a(String str, Resources resources) {
        String str2;
        Exception e;
        try {
            InputStream open = resources.getAssets().open(str);
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
            str2 = null;
            e.printStackTrace();
            return str2;
        }
    }

    public static void a(String str) {
        int glGetError = GLES20.glGetError();
        if (glGetError != 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": glError ");
            stringBuilder.append(glGetError);
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    public static int h(String str, String str2) {
        int a = a(35632, str2);
        if (a == 0) {
            return -1;
        }
        int a2 = a(35633, str);
        if (a2 == 0) {
            return -1;
        }
        int glCreateProgram = GLES20.glCreateProgram();
        if (glCreateProgram == 0) {
            return 0;
        }
        GLES20.glAttachShader(glCreateProgram, a2);
        a("glAttachShader");
        GLES20.glAttachShader(glCreateProgram, a);
        a("glAttachShader");
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 1) {
            GLES20.glDeleteProgram(glCreateProgram);
            glCreateProgram = 0;
        }
        return glCreateProgram;
    }
}
