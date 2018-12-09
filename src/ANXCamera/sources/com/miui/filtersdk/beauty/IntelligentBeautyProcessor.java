package com.miui.filtersdk.beauty;

import java.util.HashMap;
import java.util.Map;

public abstract class IntelligentBeautyProcessor extends BeautyProcessor {
    private float mExtraSpan = 0.0f;
    protected float[][] mLevelParameters;

    public abstract void clearBeautyParameters();

    public float getExtraSpan() {
        return this.mExtraSpan;
    }

    public void setExtraSpan(float f) {
        this.mExtraSpan = f;
    }

    public final Map<BeautyParameterType, Float> getIntelligentLevelParams(int i) {
        Map<BeautyParameterType, Float> hashMap = new HashMap();
        BeautyParameterType[] supportedBeautyParamTypes = getSupportedBeautyParamTypes();
        for (int i2 = 0; i2 < supportedBeautyParamTypes.length; i2++) {
            hashMap.put(supportedBeautyParamTypes[i2], Float.valueOf(this.mLevelParameters[i][i2]));
        }
        return hashMap;
    }
}
