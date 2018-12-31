package com.miui.filtersdk.filter.base;

public class BaseOriginalFilter extends GPUImageFilter implements FilterDegreeAdjustController {
    protected static final int DEGREE_VALUE_MAX = 100;
    protected static final int DEGREE_VALUE_MIN = 0;
    private static final String TAG = "BaseOriginalFilter";
    protected int mDegree;

    public BaseOriginalFilter(String str, String str2) {
        super(str, str2);
    }

    public boolean isDegreeAdjustSupported() {
        return false;
    }

    public void setDegree(int i) {
        if (isDegreeAdjustSupported()) {
            if (i < 0) {
                i = 0;
            }
            if (i > 100) {
                i = 100;
            }
            this.mDegree = i;
            return;
        }
        throw new AssertionError("Degree adjustment of the filter is not supported!");
    }
}
