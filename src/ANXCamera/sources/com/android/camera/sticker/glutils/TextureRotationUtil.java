package com.android.camera.sticker.glutils;

import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class TextureRotationUtil {
    public static final float[] CUBE = new float[]{-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
    public static final float[] TEXTURE_NO_ROTATION = new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO};
    public static final float[] TEXTURE_ROTATED_180 = new float[]{1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f};
    public static final float[] TEXTURE_ROTATED_270 = new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f};
    public static final float[] TEXTURE_ROTATED_90 = new float[]{1.0f, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO};

    private TextureRotationUtil() {
    }

    public static float[] getRotation(int i, boolean z, boolean z2) {
        float[] fArr;
        if (i == 90) {
            fArr = TEXTURE_ROTATED_90;
        } else if (i == 180) {
            fArr = TEXTURE_ROTATED_180;
        } else if (i != 270) {
            fArr = TEXTURE_NO_ROTATION;
        } else {
            fArr = TEXTURE_ROTATED_270;
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
        if (f == PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
            return 1.0f;
        }
        return PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
    }
}
