package com.ss.android.vesdk;

import com.ss.android.ttve.common.TELogUtil;

public class VETestAnimator implements VEStickerAnimator {
    public float getDegree(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("timestamp: ");
        stringBuilder.append(i);
        TELogUtil.d("VETestAnimator", stringBuilder.toString());
        return (((float) i) / 1000.0f) * 36.0f;
    }

    public float getTransX(int i) {
        return (((float) i) / 1000.0f) * 0.1f;
    }

    public float getTransY(int i) {
        return (((float) i) / 1000.0f) * 0.1f;
    }

    public float getScaleX(int i) {
        return 1.0f + ((((float) i) / 1000.0f) * 0.1f);
    }

    public float getScaleY(int i) {
        return 1.0f + ((((float) i) / 1000.0f) * 0.1f);
    }
}
