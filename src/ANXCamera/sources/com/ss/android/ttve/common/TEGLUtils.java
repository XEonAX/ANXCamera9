package com.ss.android.ttve.common;

import android.opengl.GLES20;
import com.arcsoft.camera.wideselfie.ArcWideSelfieDef.MAsvlOffScreen;

public class TEGLUtils {
    public static final float[] FULLSCREEN_VERTICES = new float[]{-1.0f, -1.0f, 1.0f, -1.0f, 1.0f, 1.0f, -1.0f, 1.0f};
    private static final String TAG = "TEGLUtils";

    public static void checkGLError(String str) {
        int glGetError = GLES20.glGetError();
        for (int i = 0; i < 4 && glGetError != 0; i++) {
            String str2;
            switch (glGetError) {
                case 1280:
                    str2 = "invalid enum";
                    break;
                case MAsvlOffScreen.ASVL_PAF_YUYV /*1281*/:
                    str2 = "invalid value";
                    break;
                case MAsvlOffScreen.ASVL_PAF_YVYU /*1282*/:
                    str2 = "invalid operation";
                    break;
                case MAsvlOffScreen.ASVL_PAF_YUYV2 /*1285*/:
                    str2 = "out of memory";
                    break;
                case MAsvlOffScreen.ASVL_PAF_YVYU2 /*1286*/:
                    str2 = "invalid framebuffer operation";
                    break;
                default:
                    str2 = "unknown error";
                    break;
            }
            TELogUtil.e(TAG, String.format("After tag \"%s\" glGetError %s(0x%x) ", new Object[]{str, str2, Integer.valueOf(glGetError)}));
            glGetError = GLES20.glGetError();
        }
    }
}
