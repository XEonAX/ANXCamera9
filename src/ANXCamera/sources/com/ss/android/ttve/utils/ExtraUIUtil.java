package com.ss.android.ttve.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.WindowManager;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class ExtraUIUtil {
    public static final float DEFAULT_SURFACE_SCALE_HEIGHT = 16.0f;
    public static final float DEFAULT_SURFACE_SCALE_WIDTH = 9.0f;
    public static final int SURFACE_LOCATION_HEIGHT_INDEX = 3;
    public static final int SURFACE_LOCATION_WIDTH_INDEX = 2;
    public static final int SURFACE_LOCATION_X_INDEX = 0;
    public static final int SURFACE_LOCATION_Y_INDEX = 1;
    public static final String TAG = "ExtraUIUtil";

    public static float[] calScreenSurfaceLocation(Context context, int i, int i2, int i3, int i4, int i5) {
        int i6;
        int i7 = i;
        int i8 = i5;
        if (i8 == 90 || i8 == 270) {
            i6 = i3;
            i8 = i4;
        } else {
            i8 = i3;
            i6 = i4;
        }
        r4 = new float[4];
        float f = (float) i8;
        r4[2] = f;
        float f2 = (float) i6;
        r4[3] = f2;
        if (context == null) {
            Log.e(TAG, "Context is null while calculating surface location!");
            return r4;
        }
        if (f * 16.0f > f2 * 9.0f) {
            float f3 = (float) i7;
            r4[2] = f3;
            r4[3] = ((1.0f * f2) * f3) / f;
            int i9 = i2;
        } else {
            float f4 = (float) i2;
            r4[3] = f4;
            r4[2] = (9.0f * f4) / 16.0f;
            f4 = (float) i7;
            r4[0] = (f4 - r4[2]) / 2.0f;
            if (r4[0] > PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                r4[0] = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
                r4[2] = f4;
                r4[3] = ((1.0f * f2) * f4) / f;
            }
        }
        Log.d(TAG, String.format("video[%d, %d], max[%d, %d], screen[%d, %d], surface[%f, %f, %f, %f]", new Object[]{Integer.valueOf(i8), Integer.valueOf(i6), Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(UIUtils.getScreenWidth(context)), Integer.valueOf(UIUtils.getScreenHeight(context)), Float.valueOf(r4[0]), Float.valueOf(r4[1]), Float.valueOf(r4[2]), Float.valueOf(r4[3])}));
        return r4;
    }

    @TargetApi(17)
    public static int getRealDisplayHeight(Context context) {
        if (context == null) {
            return 0;
        }
        int i;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        try {
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
            i = displayMetrics.heightPixels;
        } catch (Exception e) {
            i = UIUtils.getScreenHeight(context);
        }
        return i;
    }

    public static int getNavigationBarHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        int identifier = context.getResources().getIdentifier("navigation_bar_height", "dimen", "android");
        if (identifier > 0) {
            i = context.getResources().getDimensionPixelSize(identifier);
        }
        return i;
    }
}
