package com.android.camera.ui;

public class FloatSlideAdapter implements RollAdapter {
    public static final float DEFAULT_GAP_VALUE = 1.0f;
    public static final int DEFAULT_MAX_VALUE = 9;
    private static final int DEFAULT_MIN_VALUE = 0;
    private int mCenterItem;
    private float mGapValue;
    private int mItemCount;
    private int mMaxValue;
    private int mMinValue;

    public FloatSlideAdapter() {
        this(0, 9, 1.0f);
    }

    public FloatSlideAdapter(int i, int i2, float f) {
        this.mGapValue = 1.0f;
        this.mMinValue = i;
        this.mMaxValue = i2;
        this.mGapValue = f;
        this.mItemCount = (int) ((((float) (this.mMaxValue - this.mMinValue)) / this.mGapValue) + 1.0f);
        this.mCenterItem = (this.mItemCount - 1) / 2;
    }

    public int getMaxValue() {
        return this.mMaxValue;
    }

    public int getMinValue() {
        return this.mMinValue;
    }

    public String getItem(int i) {
        if (i < 0 || i >= getItemsCount()) {
            return null;
        }
        return Integer.toString(round(((float) this.mMinValue) + (((float) i) * this.mGapValue)));
    }

    public int getItemValue(int i) {
        if (i < 0 || i >= getItemsCount()) {
            return -1;
        }
        return round(((float) this.mMinValue) + (((float) i) * this.mGapValue));
    }

    private int round(float f) {
        return (int) (((double) f) + (f < 0.0f ? -0.5d : 0.5d));
    }

    public int getItemsCount() {
        return this.mItemCount;
    }

    public int getCenterIndex() {
        return this.mCenterItem;
    }

    public int getMaxItem() {
        return this.mItemCount - 1;
    }

    public int getItemIndexByValue(Object obj) {
        int intValue;
        if (obj instanceof Integer) {
            intValue = ((Integer) obj).intValue();
        } else {
            intValue = 0;
        }
        if (intValue < this.mMinValue || intValue > this.mMaxValue) {
            intValue = (this.mMinValue + this.mMaxValue) / 2;
        }
        return (int) ((((float) (intValue - this.mMinValue)) / this.mGapValue) + 0.5f);
    }

    public int getMaximumLength() {
        int length = Integer.toString(Math.max(Math.abs(this.mMaxValue), Math.abs(this.mMinValue))).length();
        if (this.mMinValue < 0) {
            return length + 1;
        }
        return length;
    }
}
