package com.ss.android.medialib.common;

import android.opengl.GLES20;
import android.util.Log;

public class ProgramObject {
    public static final String TAG = "ProgramObject";
    private ShaderObject mFragmentShader;
    private int mProgramID = GLES20.glCreateProgram();
    private ShaderObject mVertexShader;

    public static class ShaderObject {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private int mShaderID;
        private int mShaderType;

        static {
            Class cls = ProgramObject.class;
        }

        public int getShaderID() {
            return this.mShaderID;
        }

        public ShaderObject() {
            this.mShaderType = 0;
            this.mShaderID = 0;
        }

        public ShaderObject(String str, int i) {
            init(str, i);
        }

        public boolean init(String str, int i) {
            this.mShaderType = i;
            this.mShaderID = loadShader(i, str);
            if (this.mShaderID != 0) {
                return true;
            }
            Log.e(ProgramObject.TAG, "glCreateShader Failed!...");
            return false;
        }

        public final void release() {
            if (this.mShaderID != 0) {
                GLES20.glDeleteShader(this.mShaderID);
                this.mShaderID = 0;
            }
        }

        public static int loadShader(int i, String str) {
            i = GLES20.glCreateShader(i);
            if (i != 0) {
                GLES20.glShaderSource(i, str);
                GLES20.glCompileShader(i);
                int[] iArr = new int[]{0};
                GLES20.glGetShaderiv(i, 35713, iArr, 0);
                if (iArr[0] != 1) {
                    Log.e(ProgramObject.TAG, GLES20.glGetShaderInfoLog(i));
                    GLES20.glDeleteShader(i);
                    return 0;
                }
            }
            return i;
        }
    }

    public static ProgramObject create(String str, String str2) {
        ProgramObject programObject = new ProgramObject();
        if (programObject.init(str, str2)) {
            return programObject;
        }
        programObject.release();
        return null;
    }

    public int getProgramID() {
        return this.mProgramID;
    }

    public final void release() {
        if (this.mProgramID != 0) {
            GLES20.glDeleteProgram(this.mProgramID);
            this.mProgramID = 0;
        }
    }

    public boolean init(String str, String str2) {
        return init(str, str2, this.mProgramID);
    }

    public boolean init(String str, String str2, int i) {
        if (i == 0) {
            i = GLES20.glCreateProgram();
        }
        if (i == 0) {
            Log.e(TAG, "Invalid Program ID! Check if the context is binded!");
        }
        if (this.mVertexShader != null) {
            this.mVertexShader.release();
        }
        if (this.mFragmentShader != null) {
            this.mFragmentShader.release();
        }
        this.mVertexShader = new ShaderObject(str, 35633);
        this.mFragmentShader = new ShaderObject(str2, 35632);
        GLES20.glAttachShader(i, this.mVertexShader.getShaderID());
        GLES20.glAttachShader(i, this.mFragmentShader.getShaderID());
        Common.checkGLError("AttachShaders...");
        GLES20.glLinkProgram(i);
        int[] iArr = new int[]{0};
        GLES20.glGetProgramiv(i, 35714, iArr, 0);
        this.mVertexShader.release();
        this.mFragmentShader.release();
        this.mVertexShader = null;
        this.mFragmentShader = null;
        if (iArr[0] != 1) {
            Log.e(TAG, GLES20.glGetProgramInfoLog(i));
            return false;
        }
        if (!(this.mProgramID == i || this.mProgramID == 0)) {
            GLES20.glDeleteProgram(this.mProgramID);
        }
        this.mProgramID = i;
        return true;
    }

    public void bind() {
        GLES20.glUseProgram(this.mProgramID);
    }

    public int getUniformLoc(String str) {
        int glGetUniformLocation = GLES20.glGetUniformLocation(this.mProgramID, str);
        if (glGetUniformLocation < 0) {
            Log.e(TAG, String.format("uniform name %s does not exist", new Object[]{str}));
        }
        return glGetUniformLocation;
    }

    public void sendUniformf(String str, float f) {
        GLES20.glUniform1f(getUniformLoc(str), f);
    }

    public void sendUniformf(String str, float f, float f2) {
        GLES20.glUniform2f(getUniformLoc(str), f, f2);
    }

    public void sendUniformf(String str, float f, float f2, float f3) {
        GLES20.glUniform3f(getUniformLoc(str), f, f2, f3);
    }

    public void sendUniformf(String str, float f, float f2, float f3, float f4) {
        GLES20.glUniform4f(getUniformLoc(str), f, f2, f3, f4);
    }

    public void sendUniformi(String str, int i) {
        GLES20.glUniform1i(getUniformLoc(str), i);
    }

    public void sendUniformi(String str, int i, int i2) {
        GLES20.glUniform2i(getUniformLoc(str), i, i2);
    }

    public void sendUniformi(String str, int i, int i2, int i3) {
        GLES20.glUniform3i(getUniformLoc(str), i, i2, i3);
    }

    public void sendUniformi(String str, int i, int i2, int i3, int i4) {
        GLES20.glUniform4i(getUniformLoc(str), i, i2, i3, i4);
    }

    public void sendUniformMat2(String str, int i, boolean z, float[] fArr) {
        GLES20.glUniformMatrix2fv(getUniformLoc(str), i, z, fArr, 0);
    }

    public void sendUniformMat3(String str, int i, boolean z, float[] fArr) {
        GLES20.glUniformMatrix3fv(getUniformLoc(str), i, z, fArr, 0);
    }

    public void sendUniformMat4(String str, int i, boolean z, float[] fArr) {
        GLES20.glUniformMatrix4fv(getUniformLoc(str), i, z, fArr, 0);
    }

    public int attributeLocation(String str) {
        return GLES20.glGetAttribLocation(this.mProgramID, str);
    }

    public void bindAttribLocation(String str, int i) {
        GLES20.glBindAttribLocation(this.mProgramID, i, str);
    }
}
