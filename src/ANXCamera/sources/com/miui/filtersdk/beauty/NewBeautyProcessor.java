package com.miui.filtersdk.beauty;

import android.graphics.Bitmap;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.miui.filtersdk.BeautifyJni;
import java.util.Map;
import java.util.Map.Entry;

class NewBeautyProcessor extends IntelligentBeautyProcessor {
    private static final int BEAUTY_PARAMETER_SIZE = 6;
    private static final float EXTRA_SPAN = 50.0f;
    private static final int NEW_BEAUTIFY_ENLARGE_EYE_RATIO = 2;
    private static final int NEW_BEAUTIFY_ILLEGAL_PARAMETER = -1;
    private static final int NEW_BEAUTIFY_RUDDY_STRENGTH = 4;
    private static final int NEW_BEAUTIFY_SHRINK_FACE_RATIO = 3;
    private static final int NEW_BEAUTIFY_SMOOTH_STRENGTH = 1;
    private static final int NEW_BEAUTIFY_WHITEN_STRENGTH = 0;
    private int[] mBeautyParameters = new int[6];

    NewBeautyProcessor() {
        for (int i = 0; i < 6; i++) {
            this.mBeautyParameters[i] = 0;
        }
        setExtraSpan(EXTRA_SPAN);
        this.mLevelParameters = new float[][]{new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}, new float[]{10.0f, 10.0f, 10.0f, 10.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}, new float[]{20.0f, 20.0f, 20.0f, 20.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}, new float[]{30.0f, 30.0f, 30.0f, 30.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}, new float[]{EXTRA_SPAN, EXTRA_SPAN, EXTRA_SPAN, EXTRA_SPAN, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}, new float[]{60.0f, 60.0f, 60.0f, 60.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}};
    }

    public BeautyParameterType[] getSupportedBeautyParamTypes() {
        return new BeautyParameterType[]{BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SMOOTH_STRENGTH, BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SHRINK_FACE_RATIO};
    }

    public float[] getSupportedParamRange(BeautyParameterType beautyParameterType) {
        switch (beautyParameterType) {
            case ENLARGE_EYE_RATIO:
            case SHRINK_FACE_RATIO:
            case WHITEN_STRENGTH:
            case SMOOTH_STRENGTH:
                return new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 100.0f};
            default:
                return new float[0];
        }
    }

    public void setBeautyParamsDegree(Map<BeautyParameterType, Float> map) {
        for (Entry entry : map.entrySet()) {
            setBeautyParamDegree((BeautyParameterType) entry.getKey(), (Float) entry.getValue());
        }
    }

    public void setBeautyParamDegree(BeautyParameterType beautyParameterType, Float f) {
        int i;
        switch (beautyParameterType) {
            case ENLARGE_EYE_RATIO:
                i = 2;
                break;
            case SHRINK_FACE_RATIO:
                i = 3;
                break;
            case WHITEN_STRENGTH:
                i = 0;
                break;
            case SMOOTH_STRENGTH:
                i = 1;
                break;
            case RUDDY_STRENGTH:
                i = 4;
                break;
            default:
                i = -1;
                break;
        }
        if (-1 != i) {
            this.mBeautyParameters[i] = Math.round(f.floatValue());
            BeautifyJni.beautifyFaceUpdateIntensity(this.mBeautyParameters);
        }
    }

    public void beautify(byte[] bArr, int i, int i2, int i3, byte[] bArr2, int i4) {
    }

    public void beautify(int i, int i2, int i3, int i4) {
    }

    public int beautify(byte[] bArr, int i, int i2) {
        BeautifyJni.beautifyFaceUpdateIntensity(this.mBeautyParameters);
        int[] iArr = new int[1];
        BeautifyJni.beautifyFaceYUVPreviewGPU(bArr, i, i2, this.mRotation, iArr);
        return iArr[0];
    }

    public void beautify(Bitmap bitmap, int i, int i2) {
    }

    public void init(int i, int i2) {
        BeautifyJni.Initbeautify();
        BeautifyJni.beautifyFaceSetScreenSize(i, i2);
    }

    public void release() {
        BeautifyJni.Cleanbeautify();
    }

    public void onDisplaySizeChanged(int i, int i2) {
    }

    public void clearBeautyParameters() {
        for (int i = 0; i < 6; i++) {
            this.mBeautyParameters[i] = 0;
        }
    }
}
