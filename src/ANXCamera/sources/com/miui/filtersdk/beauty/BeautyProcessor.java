package com.miui.filtersdk.beauty;

import android.graphics.Bitmap;
import java.util.Map;

public abstract class BeautyProcessor {
    protected int mRotation;

    public abstract int beautify(byte[] bArr, int i, int i2);

    public abstract void beautify(int i, int i2, int i3, int i4);

    public abstract void beautify(Bitmap bitmap, int i, int i2);

    public abstract void beautify(byte[] bArr, int i, int i2, int i3, byte[] bArr2, int i4);

    public abstract BeautyParameterType[] getSupportedBeautyParamTypes();

    public abstract float[] getSupportedParamRange(BeautyParameterType beautyParameterType);

    public abstract void init(int i, int i2);

    public abstract void onDisplaySizeChanged(int i, int i2);

    public abstract void release();

    public abstract void setBeautyParamDegree(BeautyParameterType beautyParameterType, Float f);

    public abstract void setBeautyParamsDegree(Map<BeautyParameterType, Float> map);

    public void setRotation(int i) {
        this.mRotation = i;
    }
}
