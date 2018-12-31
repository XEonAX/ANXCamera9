package com.ss.android.medialib.common;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.util.Log;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class Common {
    public static final boolean DEBUG = true;
    public static final float[] FULLSCREEN_VERTICES = new float[]{-1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f, -1.0f, 1.0f};
    public static final String TAG = "WIX";
    public static final boolean USE_TEXTURE_ENCODE_INPUT = true;

    public interface IOnOpenGLCallback {
        void onOpenGLCreate();

        void onOpenGLDestroy();

        int onOpenGLRunning();
    }

    public interface IGetTimestampCallback {
        void getTimestamp(double d);
    }

    public interface IShotScreenCallback {
        void onShotScreen(int i);
    }

    public static void checkGLError(String str) {
        int glGetError = GLES20.glGetError();
        for (int i = 0; i < 32 && glGetError != 0; i++) {
            String str2;
            switch (glGetError) {
                case 1280:
                    str2 = "invalid enum";
                    break;
                case 1281:
                    str2 = "invalid value";
                    break;
                case 1282:
                    str2 = "invalid operation";
                    break;
                case 1285:
                    str2 = "out of memory";
                    break;
                case 1286:
                    str2 = "invalid framebuffer operation";
                    break;
                default:
                    str2 = "unknown error";
                    break;
            }
            Log.e("WIX", String.format("After tag \"%s\" glGetError %s(0x%x) ", new Object[]{str, str2, Integer.valueOf(glGetError)}));
            glGetError = GLES20.glGetError();
        }
    }

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
        int[] iArr = new int[]{-1};
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(36197, iArr[0]);
        _texParamHelper(36197, 9729, 33071);
        return iArr[0];
    }

    public static boolean isTextureID(int i) {
        return GLES20.glIsTexture(i);
    }

    public static void deleteTextureID(int i) {
        GLES20.glDeleteTextures(1, new int[]{i}, 0);
    }

    public static int genFullscreenVertexArrayBuffer() {
        int[] iArr = new int[1];
        GLES20.glGenBuffers(1, iArr, 0);
        if (iArr[0] == 0) {
            Log.e("WIX", "Invalid VertexBuffer! You must call this within an OpenGL thread!");
            return 0;
        }
        GLES20.glBindBuffer(34962, iArr[0]);
        Buffer asFloatBuffer = ByteBuffer.allocateDirect(FULLSCREEN_VERTICES.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
        asFloatBuffer.put(FULLSCREEN_VERTICES).position(0);
        GLES20.glBufferData(34962, 32, asFloatBuffer, 35044);
        return iArr[0];
    }

    public static Bitmap createBitmap(int i, int i2, Config config) {
        if (i <= 0 || i2 <= 0) {
            return null;
        }
        try {
            return Bitmap.createBitmap(i, i2, config);
        } catch (Error e) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("createBitmap: Error");
            stringBuilder.append(e.getMessage());
            Log.e("WIX", stringBuilder.toString());
            return null;
        }
    }
}
