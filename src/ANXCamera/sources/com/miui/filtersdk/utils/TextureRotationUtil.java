package com.miui.filtersdk.utils;

import java.nio.FloatBuffer;

public class TextureRotationUtil {
    public static final float[] CUBE = new float[]{-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    public static final float[] TEXTURE_NO_ROTATION = new float[]{0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    public static final float[] TEXTURE_ROTATED_180 = new float[]{1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f};
    public static final float[] TEXTURE_ROTATED_270 = new float[]{0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f};
    public static final float[] TEXTURE_ROTATED_90 = new float[]{1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f};

    private TextureRotationUtil() {
    }

    public static float[] getRotation(Rotation rotation, boolean z, boolean z2) {
        float[] fArr;
        switch (rotation) {
            case ROTATION_90:
                fArr = TEXTURE_ROTATED_90;
                break;
            case ROTATION_180:
                fArr = TEXTURE_ROTATED_180;
                break;
            case ROTATION_270:
                fArr = TEXTURE_ROTATED_270;
                break;
            default:
                fArr = TEXTURE_NO_ROTATION;
                break;
        }
        if (z) {
            fArr = new float[]{flip(fArr[0]), fArr[1], flip(fArr[2]), fArr[3], flip(fArr[4]), fArr[5], flip(fArr[6]), fArr[7]};
        }
        if (!z2) {
            return fArr;
        }
        return new float[]{fArr[0], flip(fArr[1]), fArr[2], flip(fArr[3]), fArr[4], flip(fArr[5]), fArr[6], flip(fArr[7])};
    }

    private static float flip(float f) {
        if (f == 0.0f) {
            return 1.0f;
        }
        return 0.0f;
    }

    public static void adjustSize(int i, boolean z, boolean z2, FloatBuffer floatBuffer, FloatBuffer floatBuffer2) {
        float[] rotation = getRotation(Rotation.fromInt(i), z, z2);
        float[] fArr = CUBE;
        floatBuffer.clear();
        floatBuffer.put(fArr).position(0);
        floatBuffer2.clear();
        floatBuffer2.put(rotation).position(0);
    }
}
