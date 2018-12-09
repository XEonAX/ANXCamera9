package com.android.camera2;

import java.util.ArrayList;
import java.util.List;

public class MiCustomFpsRange {
    private static final int FIELD_COUNT = 3;
    private static final int MAX_MINIMAL_FPS = 60;
    private final int mFpsMax;
    private final int mHeight;
    private final int mWidth;

    public static List<MiCustomFpsRange> unmarshal(int[] iArr) {
        if (iArr == null || iArr.length == 0) {
            throw new IllegalArgumentException("empty buffer");
        } else if (iArr.length % 3 <= 0) {
            int length = iArr.length / 3;
            List<MiCustomFpsRange> arrayList = new ArrayList(length);
            int i = 0;
            int i2 = 0;
            while (i < length) {
                int i3 = i2 + 1;
                int i4 = i3 + 1;
                int i5 = i4 + 1;
                arrayList.add(new MiCustomFpsRange(iArr[i2], iArr[i3], iArr[i4]));
                i++;
                i2 = i5;
            }
            return arrayList;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid buffer length ");
            stringBuilder.append(iArr.length);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    private MiCustomFpsRange(int i, int i2, int i3) {
        this.mFpsMax = i3;
        this.mWidth = checkArgumentPositive(i, "width must be positive");
        this.mHeight = checkArgumentPositive(i2, "height must be positive");
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getFpsMax() {
        return this.mFpsMax;
    }

    private static int checkArgumentPositive(int i, String str) {
        if (i > 0) {
            return i;
        }
        throw new IllegalArgumentException(str);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MiCustomFpsRange{mWidth=");
        stringBuilder.append(this.mWidth);
        stringBuilder.append(", mHeight=");
        stringBuilder.append(this.mHeight);
        stringBuilder.append(", mFpsMax=");
        stringBuilder.append(this.mFpsMax);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
