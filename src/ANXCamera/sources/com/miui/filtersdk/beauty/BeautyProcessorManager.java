package com.miui.filtersdk.beauty;

public class BeautyProcessorManager {
    public static final BeautyProcessorManager INSTANCE = new BeautyProcessorManager();
    private IntelligentBeautyProcessor mBeautyProcessor;

    private BeautyProcessorManager() {
    }

    public IntelligentBeautyProcessor getBeautyProcessor() {
        return new ArcsoftBeautyProcessor();
    }

    public boolean needPreviewCallback() {
        return false;
    }
}
