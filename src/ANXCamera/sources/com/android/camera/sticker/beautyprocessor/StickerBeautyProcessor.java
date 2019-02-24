package com.android.camera.sticker.beautyprocessor;

import android.graphics.Bitmap;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.sensetime.stmobile.STBeautifyNative;
import java.util.Map;
import java.util.Map.Entry;

public class StickerBeautyProcessor extends IntelligentBeautyProcessor {
    private static final int ST_BEAUTIFY_CONTRAST_STRENGTH = 1;
    private static final int ST_BEAUTIFY_ENLARGE_EYE_RATIO = 5;
    private static final int ST_BEAUTIFY_ILLEGAL_PARAMETER = -1;
    private static final int ST_BEAUTIFY_SHRINK_FACE_RATIO = 6;
    private static final int ST_BEAUTIFY_SHRINK_JAW_RATIO = 7;
    private static final int ST_BEAUTIFY_SMOOTH_STRENGTH = 3;
    private static final int ST_BEAUTIFY_WHITEN_STRENGTH = 4;
    private STBeautifyNative mStBeautifyNative;

    public StickerBeautyProcessor(STBeautifyNative sTBeautifyNative) {
        this.mStBeautifyNative = sTBeautifyNative;
        this.mLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f}, new float[]{0.1f, 0.1f, 0.1f, 0.1f, 0.1f, 0.1f}, new float[]{0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f}, new float[]{0.3f, 0.3f, 0.3f, 0.3f, 0.3f, 0.3f}, new float[]{0.5f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f}, new float[]{0.6f, 0.6f, 0.6f, 0.6f, 0.6f, 0.6f}};
    }

    public BeautyParameterType[] getSupportedBeautyParamTypes() {
        return new BeautyParameterType[]{BeautyParameterType.CONTRAST_STRENGTH, BeautyParameterType.ENLARGE_EYE_RATIO, BeautyParameterType.SHRINK_FACE_RATIO, BeautyParameterType.SHRINK_JAW_RATIO, BeautyParameterType.WHITEN_STRENGTH, BeautyParameterType.SMOOTH_STRENGTH};
    }

    public float[] getSupportedParamRange(BeautyParameterType beautyParameterType) {
        switch (beautyParameterType) {
            case CONTRAST_STRENGTH:
            case ENLARGE_EYE_RATIO:
            case SHRINK_FACE_RATIO:
            case SHRINK_JAW_RATIO:
            case WHITEN_STRENGTH:
            case SMOOTH_STRENGTH:
                return new float[]{0.0f, 1.0f};
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
            case CONTRAST_STRENGTH:
                i = 1;
                break;
            case ENLARGE_EYE_RATIO:
                i = 5;
                break;
            case SHRINK_FACE_RATIO:
                i = 6;
                break;
            case SHRINK_JAW_RATIO:
                i = 7;
                break;
            case WHITEN_STRENGTH:
                i = 4;
                break;
            case SMOOTH_STRENGTH:
                i = 3;
                break;
            default:
                i = -1;
                break;
        }
        if (-1 != i) {
            this.mStBeautifyNative.setParam(i, f.floatValue());
        }
    }

    public void beautify(byte[] bArr, int i, int i2, int i3, byte[] bArr2, int i4) {
        this.mStBeautifyNative.processBufferNotInGLContext(bArr, i, i2, i3, null, bArr2, i4, null);
    }

    public int beautify(byte[] bArr, int i, int i2) {
        return 0;
    }

    public void beautify(int i, int i2, int i3, int i4) {
        this.mStBeautifyNative.processTexture(i, i2, i3, null, i4, null);
    }

    public void beautify(Bitmap bitmap, int i, int i2) {
    }

    public void init(int i, int i2) {
        this.mStBeautifyNative.createInstance(i, i2);
    }

    public void release() {
        this.mStBeautifyNative.destroyBeautify();
    }

    public void onDisplaySizeChanged(int i, int i2) {
    }

    public void clearBeautyParameters() {
    }
}
