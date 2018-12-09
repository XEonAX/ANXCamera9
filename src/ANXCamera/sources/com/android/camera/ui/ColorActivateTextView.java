package com.android.camera.ui;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.widget.TextView;

public class ColorActivateTextView extends TextView {
    private int mActivateColor;
    private int mNormalCor;

    public void setActivateColor(int i) {
        this.mActivateColor = i;
    }

    public void setNormalCor(int i) {
        this.mNormalCor = i;
    }

    public ColorActivateTextView(Context context) {
        this(context, null);
    }

    public ColorActivateTextView(Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ColorActivateTextView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setActivated(boolean z) {
        setTextColor(z ? this.mActivateColor : this.mNormalCor);
        super.setActivated(z);
    }
}
