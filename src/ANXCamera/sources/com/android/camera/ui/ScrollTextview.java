package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;

public class ScrollTextview extends TextView {
    public ScrollTextview(Context context) {
        super(context);
    }

    public ScrollTextview(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ScrollTextview(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public boolean isFocused() {
        return true;
    }
}
