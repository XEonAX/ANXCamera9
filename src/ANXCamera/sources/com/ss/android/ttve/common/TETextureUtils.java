package com.ss.android.ttve.common;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Log;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class TETextureUtils {
    private static final String TAG = "TETextureUtils";

    private static void _texParamHelper(int i, int i2, int i3) {
        GLES20.glTexParameteri(i, 10241, i2);
        GLES20.glTexParameteri(i, 10240, i2);
        GLES20.glTexParameteri(i, 10242, i3);
        GLES20.glTexParameteri(i, 10243, i3);
    }

    public static int genBlankTextureID(int i, int i2) {
        return genBlankTextureID(i, i2, 9729, 33071);
    }

    public static int genBlankTextureID(int i, int i2, int i3, int i4) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(3553, iArr[0]);
        GLES20.glTexImage2D(3553, 0, 6408, i, i2, 0, 6408, 5121, null);
        _texParamHelper(3553, i3, i4);
        return iArr[0];
    }

    public static int genNormalTextureID(Bitmap bitmap) {
        return genNormalTextureID(bitmap, 9729, 33071);
    }

    public static int genNormalTextureID(Bitmap bitmap, int i, int i2) {
        if (bitmap == null) {
            return 0;
        }
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(3553, iArr[0]);
        GLUtils.texImage2D(3553, 0, bitmap, 0);
        _texParamHelper(3553, i, i2);
        return iArr[0];
    }

    public static int genSurfaceTextureID() {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        TEGLUtils.checkGLError("glGenTextures");
        GLES20.glBindTexture(36197, iArr[0]);
        _texParamHelper(36197, 9729, 33071);
        return iArr[0];
    }

    public static void deleteTextureID(int i) {
        GLES20.glDeleteTextures(1, new int[]{i}, 0);
    }

    public static int genFullscreenVertexArrayBuffer() {
        int[] iArr = new int[1];
        GLES20.glGenBuffers(1, iArr, 0);
        if (iArr[0] == 0) {
            Log.e(TAG, "Invalid VertexBuffer! You must call this within an OpenGL thread!");
            return 0;
        }
        GLES20.glBindBuffer(34962, iArr[0]);
        Buffer asFloatBuffer = ByteBuffer.allocateDirect(TEGLUtils.FULLSCREEN_VERTICES.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        asFloatBuffer.put(TEGLUtils.FULLSCREEN_VERTICES).position(0);
        GLES20.glBufferData(34962, 32, asFloatBuffer, 35044);
        return iArr[0];
    }
}
