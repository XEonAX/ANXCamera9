package com.arcsoft.avatar.a;

import android.opengl.GLES20;
import com.arcsoft.avatar.d.f;

/* compiled from: ShaderManager */
public class g {
    private static final String a = "Arc_ShaderManager";

    private static int a(int i, String str) {
        String h = h(i);
        i = GLES20.glCreateShader(i);
        if (i == 0) {
            String str2 = a;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("create shader error, shader type=");
            stringBuilder.append(h);
            stringBuilder.append(" , error=");
            stringBuilder.append(GLES20.glGetError());
            f.e(str2, stringBuilder.toString());
            return 0;
        }
        GLES20.glShaderSource(i, str);
        GLES20.glCompileShader(i);
        int[] iArr = new int[1];
        GLES20.glGetShaderiv(i, 35713, iArr, 0);
        if (iArr[0] != 0) {
            return i;
        }
        str = GLES20.glGetShaderInfoLog(i);
        String str3 = a;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("createShader shader = ");
        stringBuilder2.append(h);
        stringBuilder2.append("  error: ");
        stringBuilder2.append(str);
        f.e(str3, stringBuilder2.toString());
        GLES20.glDeleteShader(i);
        return 0;
    }

    public static int createProgram(String str, String str2) {
        int glCreateProgram = GLES20.glCreateProgram();
        if (glCreateProgram == 0) {
            str = a;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("create program error ,error=");
            stringBuilder.append(GLES20.glGetError());
            f.e(str, stringBuilder.toString());
            return 0;
        }
        int a = a(35633, str);
        int a2 = a(35632, str2);
        if (a == 0 || a2 == 0) {
            GLES20.glDeleteShader(a);
            GLES20.glDeleteShader(a2);
            GLES20.glDeleteProgram(glCreateProgram);
            return 0;
        }
        GLES20.glAttachShader(glCreateProgram, a);
        GLES20.glAttachShader(glCreateProgram, a2);
        GLES20.glLinkProgram(glCreateProgram);
        int[] iArr = new int[1];
        GLES20.glGetProgramiv(glCreateProgram, 35714, iArr, 0);
        if (iArr[0] != 0) {
            return glCreateProgram;
        }
        String glGetProgramInfoLog = GLES20.glGetProgramInfoLog(glCreateProgram);
        String str3 = a;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("createProgram error : ");
        stringBuilder2.append(glGetProgramInfoLog);
        f.e(str3, stringBuilder2.toString());
        GLES20.glDeleteShader(a);
        GLES20.glDeleteShader(a2);
        GLES20.glDeleteProgram(glCreateProgram);
        return 0;
    }

    private static String h(int i) {
        switch (i) {
            case 35632:
                return "fragment_shader";
            case 35633:
                return "vertext_shader";
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("invalid shader type = ");
                stringBuilder.append(i);
                return stringBuilder.toString();
        }
    }
}
