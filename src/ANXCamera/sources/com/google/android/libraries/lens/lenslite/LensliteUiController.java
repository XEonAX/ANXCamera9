package com.google.android.libraries.lens.lenslite;

import android.graphics.PointF;
import android.graphics.drawable.Drawable;
import android.util.Log;

public class LensliteUiController {
    private static final String TAG = "LensliteUiController";

    public @interface FocusType {
        public static final int FOCUS_RELEASE = 1;
        public static final int FOCUS_SET = 0;
    }

    public @interface ResultType {
        public static final int ADDRESS = 0;
        public static final int APPAREL = 16;
        public static final int CALENDAR_ENTRY = 14;
        public static final int CONTACT = 4;
        public static final int DOCUMENT_SCANNING = 10;
        public static final int EMAIL = 1;
        public static final int FOREIGN_TEXT = 17;
        public static final int IM2QUERY_PRODUCT = 15;
        public static final int PHONE = 3;
        public static final int PRODUCT_UPC = 8;
        public static final int QR = 5;
        public static final int QR_GEO = 12;
        public static final int QR_WIFI = 7;
        public static final int RAW_BARCODE = 6;
        public static final int SMS = 13;
        public static final int TEXT_SELECTION = 11;
        public static final int TEXT_WIFI = 9;
        public static final int UNKNOWN = 18;
        public static final int URL = 2;
    }

    public @interface VerticalPlacement {
        public static final int BOTTOM = 1;
        public static final int TOP = 0;
    }

    public boolean onFocusChange(@FocusType int i, PointF pointF) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onFocusChange: type = ");
        stringBuilder.append(i);
        stringBuilder.append(", focusLocation = ");
        stringBuilder.append(pointF);
        Log.d(str, stringBuilder.toString());
        return false;
    }

    public void setChipDrawable(int i) {
    }

    public void setChipLocation(PointF pointF) {
    }

    public void setChipSidePadding(int i) {
    }

    public void setChipTextStyle(int i) {
    }

    public void setIconForResultType(@ResultType int i, Drawable drawable) {
    }

    public void setIconSize(int i) {
    }

    public void setLensliteLayoutVisibility(boolean z) {
    }

    public void setOobeLocation(@VerticalPlacement int i, float f) {
    }

    public void setOobeTextStyles(int i, int i2, int i3) {
    }

    public void setPostCaptureEnabled(boolean z) {
    }
}
