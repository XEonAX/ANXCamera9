package com.android.camera2.autozoom;

import android.content.Context;
import android.graphics.RectF;
import android.util.Size;
import android.view.WindowManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class AutoZoomUtils {
    private AutoZoomUtils() {
    }

    public static int getDisplayRotation(Context context) {
        switch (((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRotation()) {
            case 0:
                return 0;
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    public static void rotateFromVidhance(Context context, RectF rectF) {
        int displayRotation = getDisplayRotation(context);
        if (displayRotation == 0) {
            rectF.set(1.0f - rectF.bottom, rectF.left, 1.0f - rectF.top, rectF.right);
        } else if (displayRotation == 90) {
        } else {
            if (displayRotation == 180) {
                rectF.set(1.0f - rectF.bottom, rectF.left, 1.0f - rectF.top, rectF.right);
            } else if (displayRotation == 270) {
                rectF.set(1.0f - rectF.right, 1.0f - rectF.bottom, 1.0f - rectF.left, 1.0f - rectF.top);
            }
        }
    }

    public static void rotateToVidhance(Context context, RectF rectF) {
        int displayRotation = getDisplayRotation(context);
        if (displayRotation == 0) {
            rectF.set(rectF.top, 1.0f - rectF.right, rectF.bottom, 1.0f - rectF.left);
        } else if (displayRotation == 90) {
        } else {
            if (displayRotation == 180) {
                rectF.set(rectF.top, 1.0f - rectF.right, rectF.bottom, 1.0f - rectF.left);
            } else if (displayRotation == 270) {
                rectF.set(1.0f - rectF.right, 1.0f - rectF.bottom, 1.0f - rectF.left, 1.0f - rectF.top);
            }
        }
    }

    public static float median(ArrayList<Float> arrayList) {
        if (arrayList.isEmpty()) {
            return 0.0f;
        }
        Collections.sort(arrayList);
        if (arrayList.size() % 2 == 0) {
            return ((Float) arrayList.get(arrayList.size() / 2)).floatValue() + (((Float) arrayList.get((arrayList.size() / 2) - 1)).floatValue() / 2.0f);
        }
        return ((Float) arrayList.get(arrayList.size() / 2)).floatValue();
    }

    public static long mean(ArrayList<Long> arrayList) {
        Iterator it = arrayList.iterator();
        long j = 0;
        while (it.hasNext()) {
            j += ((Long) it.next()).longValue();
        }
        return j / ((long) arrayList.size());
    }

    public static void toVidhanceCoordinateSystem(RectF rectF) {
        rectF.offsetTo(rectF.left - 0.5f, rectF.top - 0.5f);
    }

    public static void fromVidhanceCoordinateSystem(RectF rectF) {
        rectF.offsetTo(rectF.left + 0.5f, rectF.top + 0.5f);
    }

    public static void normalizedRectToSize(RectF rectF, Size size) {
        rectF.set(rectF.left * ((float) size.getWidth()), rectF.top * ((float) size.getHeight()), rectF.right * ((float) size.getWidth()), rectF.bottom * ((float) size.getHeight()));
    }
}
