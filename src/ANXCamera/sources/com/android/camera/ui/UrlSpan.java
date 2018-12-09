package com.android.camera.ui;

import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;

public class UrlSpan extends ClickableSpan {
    private UrlSpanOnClickListener mOnClickListener;

    public interface UrlSpanOnClickListener {
        void onClick();
    }

    public UrlSpan(UrlSpanOnClickListener urlSpanOnClickListener) {
        this.mOnClickListener = urlSpanOnClickListener;
    }

    public void updateDrawState(TextPaint textPaint) {
        textPaint.setUnderlineText(true);
        textPaint.setColor(-16776961);
    }

    public void onClick(View view) {
        if (this.mOnClickListener != null) {
            this.mOnClickListener.onClick();
        }
    }
}
