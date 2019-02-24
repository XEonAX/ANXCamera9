package com.miui.filtersdk.filter.base;

import com.miui.filtersdk.beauty.BeautyProcessor;

public abstract class BaseBeautyFilter extends GPUImageFilter {
    protected BeautyProcessor mBeautyProcessor;

    public abstract void initBeautyProcessor(int i, int i2);

    public void setBeautyProcessor(BeautyProcessor beautyProcessor) {
        this.mBeautyProcessor = beautyProcessor;
    }

    public boolean beautyEnable() {
        return this.mBeautyProcessor != null;
    }
}
