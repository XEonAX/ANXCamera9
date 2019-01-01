package com.android.camera.fragment.manually.adapter;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import com.android.camera.ActivityBase;
import com.android.camera.R;
import com.android.camera.constant.CameraScene;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.module.BaseModule;
import com.android.camera.ui.HorizontalSlideView;
import com.android.camera.ui.HorizontalSlideView.HorizontalDrawAdapter;
import com.android.camera.ui.HorizontalSlideView.OnPositionSelectListener;
import java.util.Arrays;
import java.util.List;

public class ExtraSlideFNumberAdapter extends HorizontalDrawAdapter implements OnPositionSelectListener {
    public static final int DEFAULT_F = 13;
    private static final int ENTRY_COUNT_TOTAL = F_NUMBERS.length;
    public static final String[] F_NUMBERS = new String[]{"1.0", "1.1", "1.2", "1.4", "1.6", "1.8", "2", "2.2", "2.5", "2.8", "3.2", "3.5", "4", "4.5", "5.0", "5.6", "6.3", "7.1", CameraScene.BEACH, CameraScene.SNOW, CameraScene.SUNSET, "11", CameraScene.SPORTS, "14", "16"};
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private boolean mEnable;
    private int mLineCircleRadius;
    private int mLineColorDefault;
    private int mLineColorDefaultCircle;
    private int mLineColorDivider;
    private int mLineDefaultCircleGap;
    private float mLineHalfHeight;
    private int mLineLineGap;
    private int mLineWidth;
    private ManuallyListener mManuallyListener;
    private Paint mPaint;
    private int mTextSize;
    private List<String> mValidFNumbers = Arrays.asList(F_NUMBERS);

    public ExtraSlideFNumberAdapter(Context context, ComponentData componentData, int i, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
        BaseModule baseModule = (BaseModule) ((ActivityBase) context).getCurrentModule();
        initStyle(context);
    }

    private void initStyle(Context context) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(R.style.SingeTextItemTextStyle, new int[]{16842901, 16842904});
        this.mTextSize = obtainStyledAttributes.getDimensionPixelSize(obtainStyledAttributes.getIndex(0), this.mTextSize);
        obtainStyledAttributes.recycle();
        Resources resources = context.getResources();
        this.mLineHalfHeight = ((float) resources.getDimensionPixelSize(R.dimen.bokeh_line_height)) / 2.0f;
        this.mLineWidth = resources.getDimensionPixelSize(R.dimen.bokeh_line_width);
        this.mLineLineGap = resources.getDimensionPixelSize(R.dimen.bokeh_line_line_gap);
        this.mLineColorDefault = resources.getColor(R.color.bokeh_popup_line_color_default);
        this.mLineColorDivider = resources.getColor(R.color.bokeh_popup_line_color_divider);
        this.mLineColorDefaultCircle = resources.getColor(R.color.bokeh_popup_line_default_circle);
        this.mLineCircleRadius = resources.getDimensionPixelSize(R.dimen.bokeh_line_default_circle_radius);
        this.mLineDefaultCircleGap = resources.getDimensionPixelSize(R.dimen.bokeh_line_default_circle_gap);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) this.mLineWidth);
        this.mPaint.setTextSize((float) this.mTextSize);
        this.mPaint.setTextAlign(Align.LEFT);
    }

    public void draw(int i, Canvas canvas, boolean z) {
        int i2 = this.mLineColorDefault;
        if (i % 3 == 0) {
            i2 = this.mLineColorDivider;
        }
        if (i == 13 && !z) {
            this.mPaint.setColor(this.mLineColorDefaultCircle);
            canvas.drawCircle(0.0f, (float) (-this.mLineDefaultCircleGap), (float) this.mLineCircleRadius, this.mPaint);
        }
        this.mPaint.setColor(i2);
        canvas.drawLine(0.0f, -this.mLineHalfHeight, 0.0f, this.mLineHalfHeight, this.mPaint);
    }

    public float measureWidth(int i) {
        return (float) this.mLineWidth;
    }

    public float measureGap(int i) {
        return (float) this.mLineLineGap;
    }

    public Align getAlign(int i) {
        return Align.CENTER;
    }

    public int getCount() {
        return ENTRY_COUNT_TOTAL;
    }

    public void onPositionSelect(HorizontalSlideView horizontalSlideView, float f) {
        if (this.mEnable) {
            String mapPositionToFNumber = mapPositionToFNumber(f);
            if (!mapPositionToFNumber.equals(this.mCurrentValue)) {
                this.mComponentData.setComponentValue(this.mCurrentMode, mapPositionToFNumber);
                if (this.mManuallyListener != null) {
                    this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, mapPositionToFNumber, false);
                }
                this.mCurrentValue = mapPositionToFNumber;
            }
        }
    }

    public float mapFNumberToPosition(String str) {
        return (((float) this.mValidFNumbers.indexOf(str)) * 1.0f) / ((float) (F_NUMBERS.length - 1));
    }

    private String mapPositionToFNumber(float f) {
        return F_NUMBERS[Math.round(f * ((float) (F_NUMBERS.length - 1)))];
    }

    public void setEnable(boolean z) {
        this.mEnable = z;
    }
}
