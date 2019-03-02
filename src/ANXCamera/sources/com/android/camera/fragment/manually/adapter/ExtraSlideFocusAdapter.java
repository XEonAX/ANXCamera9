package com.android.camera.fragment.manually.adapter;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import com.android.camera.Util;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.HorizontalSlideView;
import com.android.camera.ui.HorizontalSlideView.HorizontalDrawAdapter;
import com.android.camera.ui.HorizontalSlideView.OnItemSelectListener;
import com.oneplus.camera.R;

public class ExtraSlideFocusAdapter extends HorizontalDrawAdapter implements OnItemSelectListener {
    private static final int ENTRY_GAP = 10;
    private static final int MAX_ENTRY_SECTION = 10;
    private static final int MAX_POSITION = 1000;
    private static final int MAX_SECTION = 100;
    private static final int MAX_VALUE = 100;
    private static final int[] sTextActivatedColorState = new int[]{16843518};
    private static final int[] sTextDefaultColorState = new int[]{0};
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private CharSequence[] mEntries;
    private int mLineColorDefault;
    private float mLineHalfHeight;
    private int mLineLineGap;
    private int mLineTextGap;
    private int mLineWidth;
    private ManuallyListener mManuallyListener;
    private float mMinimumFocusDistance;
    private Paint mPaint;
    private ColorStateList mTextColor;
    private int mTextSize;
    private int mTrackedFocusPosition;

    public ExtraSlideFocusAdapter(Context context, ComponentData componentData, int i, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
        try {
            this.mTrackedFocusPosition = Integer.parseInt(this.mCurrentValue);
        } catch (NumberFormatException e) {
            this.mTrackedFocusPosition = 1000;
        }
        initStyle(context);
        CharSequence[] charSequenceArr = new CharSequence[11];
        for (i = 0; i <= 10; i++) {
            charSequenceArr[i] = getDisplayedFocusValue(context, i * 10);
        }
        this.mEntries = charSequenceArr;
    }

    private void initStyle(Context context) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(R.style.SingeTextItemTextStyle, new int[]{16842901, 16842904});
        this.mTextSize = obtainStyledAttributes.getDimensionPixelSize(obtainStyledAttributes.getIndex(0), this.mTextSize);
        this.mTextColor = obtainStyledAttributes.getColorStateList(obtainStyledAttributes.getIndex(1));
        obtainStyledAttributes.recycle();
        Resources resources = context.getResources();
        this.mLineHalfHeight = ((float) resources.getDimensionPixelSize(R.dimen.focus_line_height)) / 2.0f;
        this.mLineWidth = resources.getDimensionPixelSize(R.dimen.focus_line_width);
        this.mLineLineGap = resources.getDimensionPixelSize(R.dimen.focus_line_line_gap);
        this.mLineTextGap = resources.getDimensionPixelSize(R.dimen.focus_line_text_gap);
        this.mLineColorDefault = resources.getColor(R.color.manual_focus_line_color_default);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setTextSize((float) this.mTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
    }

    private String getDisplayedFocusValue(Context context, int i) {
        if (i == 0) {
            return context.getString(R.string.pref_camera_focusmode_entry_auto);
        }
        return String.valueOf(i);
    }

    private void drawText(int i, Canvas canvas) {
        canvas.drawText(this.mEntries[i].toString(), 0.0f, ((-(this.mPaint.ascent() + this.mPaint.descent())) / 2.0f) + 1.0f, this.mPaint);
    }

    public void draw(int i, Canvas canvas, boolean z) {
        int colorForState;
        if (i % 10 == 0) {
            Paint paint = this.mPaint;
            if (z) {
                colorForState = this.mTextColor.getColorForState(sTextActivatedColorState, 0);
            } else {
                colorForState = this.mTextColor.getColorForState(sTextDefaultColorState, 0);
            }
            paint.setColor(colorForState);
            drawText(i / 10, canvas);
            return;
        }
        Paint paint2 = this.mPaint;
        if (z) {
            colorForState = this.mTextColor.getColorForState(sTextActivatedColorState, 0);
        } else {
            colorForState = this.mLineColorDefault;
        }
        paint2.setColor(colorForState);
        canvas.drawLine(0.0f, -this.mLineHalfHeight, 0.0f, this.mLineHalfHeight, this.mPaint);
    }

    public float measureWidth(int i) {
        if (i % 10 == 0) {
            return this.mPaint.measureText(this.mEntries[i / 10].toString());
        }
        return (float) this.mLineWidth;
    }

    public float measureGap(int i) {
        if (i % 10 == 0 || (i + 1) % 10 == 0) {
            return (float) this.mLineTextGap;
        }
        return (float) this.mLineLineGap;
    }

    public Align getAlign(int i) {
        return Align.LEFT;
    }

    public int getCount() {
        return 101;
    }

    public void onItemSelect(HorizontalSlideView horizontalSlideView, int i) {
        i = mapIndexToFocus(i);
        if (!(horizontalSlideView.isScrolling() || this.mTrackedFocusPosition == i)) {
            this.mTrackedFocusPosition = i;
            CameraStatUtil.trackFocusPositionChanged(i);
        }
        String valueOf = String.valueOf(i);
        if (!valueOf.equals(this.mCurrentValue)) {
            this.mComponentData.setComponentValue(this.mCurrentMode, valueOf);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, valueOf, false);
            }
            this.mCurrentValue = valueOf;
        }
    }

    public int mapFocusToIndex(int i) {
        return 100 - (Util.clamp(i, 0, 1000) / 10);
    }

    private int mapIndexToFocus(int i) {
        return 1000 - ((i * 1000) / 100);
    }
}
