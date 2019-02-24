package com.ss.android.ttve.utils;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Looper;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.TouchDelegate;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.widget.TextView;
import com.android.camera.constant.DurationConstant;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class UIUtils {
    public static final boolean API_ET_20 = (VERSION.SDK_INT > 19);
    private static int DPI = -1;
    public static final char ELLIPSIS_CHAR = '…';
    public static final int LAYOUT_PARAMS_KEEP_OLD = -3;
    public static EllipsisMeasureResult sTempEllipsisResult = new EllipsisMeasureResult();
    private static ToastHook sToastHook;

    public static class EllipsisMeasureResult {
        public String ellipsisStr;
        public int length;
    }

    public interface ToastHook {
        boolean showToast(Context context, int i, CharSequence charSequence, long j, int i2);
    }

    public static void setToastHook(ToastHook toastHook) {
        sToastHook = toastHook;
    }

    public static void displayToast(Context context, String str) {
        displayToast(context, 0, str);
    }

    public static void displayToast(Context context, int i) {
        displayToast(context, context.getString(i));
    }

    public static void displayToastWithIcon(Context context, int i, int i2) {
        displayToast(context, i, context.getString(i2));
    }

    public static void displayToastWithIcon(Context context, int i, String str) {
        displayToast(context, i, str);
    }

    public static void displayToast(Context context, int i, int i2) {
        displayToast(context, context.getString(i), i2);
    }

    public static void displayToast(Context context, String str, int i) {
        displayToastInternal(context, 0, str, 0, i);
    }

    public static void displayToast(Context context, int i, String str) {
        displayToastInternal(context, i, str, 0, 17);
    }

    public static void displayLongTimeToast(Context context, int i, int i2) {
        if (context != null) {
            String string = context.getString(i2);
            if (!string.isEmpty()) {
                displayToastInternal(context, i, string, 1, 17);
            }
        }
    }

    private static void displayToastInternal(Context context, int i, String str, int i2, int i3) {
    }

    public static float sp2px(Context context, float f) {
        return TypedValue.applyDimension(2, f, context.getResources().getDisplayMetrics());
    }

    public static float dip2Px(Context context, float f) {
        return (f * context.getResources().getDisplayMetrics().density) + 0.5f;
    }

    public static int px2dip(Context context, float f) {
        return (int) ((f / context.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public static void expandClickRegion(View view, int i, int i2, int i3, int i4) {
        final View view2 = view;
        final int i5 = i2;
        final int i6 = i4;
        final int i7 = i;
        final int i8 = i3;
        view.post(new Runnable() {
            public void run() {
                Rect rect = new Rect();
                view2.getHitRect(rect);
                rect.top += i5;
                rect.bottom += i6;
                rect.left += i7;
                rect.right += i8;
                TouchDelegate touchDelegate = new TouchDelegate(rect, view2);
                if (View.class.isInstance(view2.getParent())) {
                    ((View) view2.getParent()).setTouchDelegate(touchDelegate);
                }
            }
        });
    }

    public static void setViewBackgroundWithPadding(View view, int i) {
        if (view != null) {
            int paddingLeft = view.getPaddingLeft();
            int paddingRight = view.getPaddingRight();
            int paddingTop = view.getPaddingTop();
            int paddingBottom = view.getPaddingBottom();
            view.setBackgroundResource(i);
            view.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
        }
    }

    public static void setViewBackgroundWithPadding(View view, Resources resources, int i) {
        if (view != null) {
            int paddingLeft = view.getPaddingLeft();
            int paddingRight = view.getPaddingRight();
            int paddingTop = view.getPaddingTop();
            int paddingBottom = view.getPaddingBottom();
            view.setBackgroundColor(resources.getColor(i));
            view.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
        }
    }

    public static void setViewBackgroundWithPadding(View view, Drawable drawable) {
        if (view != null) {
            int paddingLeft = view.getPaddingLeft();
            int paddingRight = view.getPaddingRight();
            int paddingTop = view.getPaddingTop();
            int paddingBottom = view.getPaddingBottom();
            view.setBackgroundDrawable(drawable);
            view.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
        }
    }

    public static final String getDisplayCount(int i) {
        if (i <= DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE) {
            return String.valueOf(i);
        }
        String format = String.format("%.1f", new Object[]{Double.valueOf((1.0d * ((double) i)) / 10000.0d)});
        StringBuilder stringBuilder;
        if ('0' == format.charAt(format.length() - 1)) {
            stringBuilder = new StringBuilder();
            stringBuilder.append(format.substring(0, format.length() - 2));
            stringBuilder.append("万");
            return stringBuilder.toString();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(format);
        stringBuilder.append("万");
        return stringBuilder.toString();
    }

    public static final int getScreenWidth(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        if (displayMetrics != null) {
            i = displayMetrics.widthPixels;
        }
        return i;
    }

    public static final int getRatioOfScreen(Context context, float f) {
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        if (displayMetrics == null) {
            return 0;
        }
        return (int) (((float) displayMetrics.widthPixels) * f);
    }

    public static boolean isInUIThread() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public static void assertInUIThread() {
        if ((Looper.myLooper() == Looper.getMainLooper() ? 1 : null) == null) {
        }
    }

    public static final int getScreenHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        if (displayMetrics != null) {
            i = displayMetrics.heightPixels;
        }
        return i;
    }

    public static int getDpi(Context context) {
        if (DPI == -1 && context != null) {
            DPI = context.getApplicationContext().getResources().getDisplayMetrics().densityDpi;
        }
        return DPI;
    }

    public static int getDiggBuryWidth(Context context) {
        return ((context.getResources().getDisplayMetrics().widthPixels * 1375) / DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE) + ((int) dip2Px(context, 20.0f));
    }

    public static final int getStatusBarHeight(Context context) {
        int i = 0;
        if (context == null) {
            return 0;
        }
        int identifier = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (identifier > 0) {
            i = context.getResources().getDimensionPixelSize(identifier);
        }
        return i;
    }

    private static boolean visibilityValid(int i) {
        return i == 0 || i == 8 || i == 4;
    }

    public static final void setViewVisibility(View view, int i) {
        if (view != null && view.getVisibility() != i && visibilityValid(i)) {
            view.setVisibility(i);
        }
    }

    public static final boolean isViewVisible(View view) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        if (view.getVisibility() == 0) {
            z = true;
        }
        return z;
    }

    public static void getLocationInUpView(View view, View view2, int[] iArr, boolean z) {
        if (view != null && view2 != null && iArr != null && iArr.length >= 2) {
            view.getLocationInWindow(iArr);
            int i = iArr[0];
            int i2 = iArr[1];
            view2.getLocationInWindow(iArr);
            int i3 = iArr[0] - i;
            i = iArr[1] - i2;
            if (z) {
                i3 += view2.getWidth() / 2;
                i += view2.getHeight() / 2;
            }
            iArr[0] = i3;
            iArr[1] = i;
        }
    }

    public static void updateLayout(View view, int i, int i2) {
        if (view != null) {
            LayoutParams layoutParams = view.getLayoutParams();
            if (layoutParams != null && (layoutParams.width != i || layoutParams.height != i2)) {
                if (i != -3) {
                    layoutParams.width = i;
                }
                if (i2 != -3) {
                    layoutParams.height = i2;
                }
                view.setLayoutParams(layoutParams);
            }
        }
    }

    public static void updateLayoutMargin(View view, int i, int i2, int i3, int i4) {
        if (view != null) {
            LayoutParams layoutParams = view.getLayoutParams();
            if (layoutParams != null && (layoutParams instanceof MarginLayoutParams)) {
                updateMargin(view, (MarginLayoutParams) layoutParams, i, i2, i3, i4);
            }
        }
    }

    private static void updateMargin(View view, MarginLayoutParams marginLayoutParams, int i, int i2, int i3, int i4) {
        if (view != null && marginLayoutParams != null && (marginLayoutParams.leftMargin != i || marginLayoutParams.topMargin != i2 || marginLayoutParams.rightMargin != i3 || marginLayoutParams.bottomMargin != i4)) {
            if (i != -3) {
                marginLayoutParams.leftMargin = i;
            }
            if (i2 != -3) {
                marginLayoutParams.topMargin = i2;
            }
            if (i3 != -3) {
                marginLayoutParams.rightMargin = i3;
            }
            if (i4 != -3) {
                marginLayoutParams.bottomMargin = i4;
            }
            view.setLayoutParams(marginLayoutParams);
        }
    }

    public static void setTopMargin(View view, float f) {
        if (view != null) {
            updateLayoutMargin(view, -3, (int) TypedValue.applyDimension(1, f, view.getContext().getResources().getDisplayMetrics()), -3, -3);
        }
    }

    public static void setLayoutParams(View view, int i, int i2) {
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams != null) {
            if (i != Integer.MIN_VALUE) {
                layoutParams.width = i;
            }
            if (i2 != Integer.MIN_VALUE) {
                layoutParams.height = i2;
            }
        }
    }

    public static void setTxtAndAdjustVisible(TextView textView, CharSequence charSequence) {
        if (textView != null) {
            if (TextUtils.isEmpty(charSequence)) {
                setViewVisibility(textView, 8);
            } else {
                setViewVisibility(textView, 0);
                textView.setText(charSequence);
            }
        }
    }

    public static void setText(TextView textView, CharSequence charSequence) {
        if (textView != null || !TextUtils.isEmpty(charSequence)) {
            textView.setText(charSequence);
        }
    }

    public static void detachFromParent(View view) {
        if (view != null && view.getParent() != null) {
            ViewParent parent = view.getParent();
            if (parent instanceof ViewGroup) {
                try {
                    ((ViewGroup) parent).removeView(view);
                } catch (Exception e) {
                }
            }
        }
    }

    @SuppressLint({"NewApi"})
    public static void setViewMinHeight(View view, int i) {
        if (view != null) {
            if (VERSION.SDK_INT < 16 || view.getMinimumHeight() != i) {
                view.setMinimumHeight(i);
            }
        }
    }

    @SuppressLint({"NewApi"})
    public static void setTextViewMaxLines(TextView textView, int i) {
        if (textView != null && i > 0) {
            if (VERSION.SDK_INT < 16 || textView.getMaxLines() != i) {
                boolean z = true;
                if (i != 1) {
                    z = false;
                }
                textView.setSingleLine(z);
                textView.setMaxLines(i);
            }
        }
    }

    public static int[] getLocationInAncestor(View view, View view2) {
        if (view == null || view2 == null) {
            return null;
        }
        int i;
        r2 = new int[2];
        float[] fArr = new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO};
        fArr[0] = fArr[0] + ((float) view.getLeft());
        fArr[1] = fArr[1] + ((float) view.getTop());
        Object parent = view.getParent();
        while (parent instanceof View) {
            View view3 = (View) parent;
            if (parent == view2) {
                i = 1;
                break;
            }
            fArr[0] = fArr[0] - ((float) view3.getScrollX());
            fArr[1] = fArr[1] - ((float) view3.getScrollY());
            fArr[0] = fArr[0] + ((float) view3.getLeft());
            fArr[1] = fArr[1] + ((float) view3.getTop());
            parent = view3.getParent();
        }
        i = 0;
        if (i == 0) {
            return null;
        }
        r2[0] = (int) (fArr[0] + 0.5f);
        r2[1] = (int) (fArr[1] + 0.5f);
        return r2;
    }

    public static int setColorAlpha(int i, int i2) {
        if (i2 > 255) {
            i2 = 255;
        } else if (i2 < 0) {
            i2 = 0;
        }
        return (i & 16777215) | (i2 * 16777216);
    }

    public static void ellipseSingleLineStr(String str, int i, Paint paint, int i2, EllipsisMeasureResult ellipsisMeasureResult) {
        if (i <= i2 || str.isEmpty()) {
            ellipsisMeasureResult.ellipsisStr = "";
            ellipsisMeasureResult.length = 0;
            return;
        }
        int floatToIntBig = floatToIntBig(paint.measureText(str));
        if (floatToIntBig <= i) {
            ellipsisMeasureResult.ellipsisStr = str;
            ellipsisMeasureResult.length = floatToIntBig;
            return;
        }
        i2 = i - i2;
        StringBuilder stringBuilder = new StringBuilder();
        int breakText = paint.breakText(str, 0, str.length(), true, (float) i2, null);
        if (breakText < 1) {
            ellipsisMeasureResult.ellipsisStr = "";
            ellipsisMeasureResult.length = 0;
            return;
        }
        stringBuilder.append(str.substring(0, breakText));
        stringBuilder.append(ELLIPSIS_CHAR);
        ellipsisMeasureResult.ellipsisStr = stringBuilder.toString();
        ellipsisMeasureResult.length = i;
    }

    public static int floatToIntBig(float f) {
        return (int) (f + 0.999f);
    }

    public static void requestOrienation(Activity activity, boolean z) {
        if (activity != null && !activity.isFinishing()) {
            activity.setRequestedOrientation(z ^ 1);
            if (z) {
                activity.getWindow().setFlags(1024, 1024);
            } else {
                activity.getWindow().clearFlags(1024);
            }
        }
    }

    public static int getIndexInParent(View view) {
        if (view == null || view.getParent() == null) {
            return -1;
        }
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup) {
            return ((ViewGroup) parent).indexOfChild(view);
        }
        return -1;
    }

    public static boolean clearAnimation(View view) {
        if (view == null || view.getAnimation() == null) {
            return false;
        }
        view.clearAnimation();
        return true;
    }

    public static void setClickListener(boolean z, View view, OnClickListener onClickListener) {
        if (view != null) {
            if (z) {
                view.setOnClickListener(onClickListener);
                view.setClickable(true);
            } else {
                view.setOnClickListener(null);
                view.setClickable(false);
            }
        }
    }
}
