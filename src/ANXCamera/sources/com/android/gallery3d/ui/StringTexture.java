package com.android.gallery3d.ui;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Typeface;
import android.os.Build.VERSION;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;

public class StringTexture extends CanvasTexture {
    public static final int TYPE_NORMAL = 0;
    public static final int TYPE_WATER_MARK = 1;
    public static final int TYPE_WATER_MARK_NEW_STYLE = 2;
    public static final float WATER_MARK_SHADOW_D = 5.0f;
    public static final float WATER_MARK_SHADOW_Y = 3.0f;
    public static final int WATER_MARK_SHADOW_Y_COLOR = 771751936;
    private final FontMetricsInt mMetrics;
    private final TextPaint mPaint;
    private final String mText;

    private StringTexture(String str, TextPaint textPaint, FontMetricsInt fontMetricsInt, int i, int i2) {
        super(i, i2);
        this.mText = str;
        this.mPaint = textPaint;
        this.mMetrics = fontMetricsInt;
    }

    public static TextPaint getDefaultPaint(float f, int i, int i2) {
        TextPaint textPaint = new TextPaint();
        textPaint.setTextSize(f);
        textPaint.setAntiAlias(true);
        textPaint.setColor(i);
        if (i2 == 1) {
            textPaint.setTypeface(Util.getMiuiTypeface(CameraAppImpl.getAndroidContext()));
            textPaint.setShadowLayer(0.1f, 5.0f, 5.0f, -16777216);
            setLongshotMode(textPaint, 0.1f);
        } else if (i2 == 2) {
            textPaint.setTypeface(Util.getMiuiTimeTypeface(CameraAppImpl.getAndroidContext()));
            textPaint.setShadowLayer(0.1f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 3.0f, 771751936);
            setLongshotMode(textPaint, 0.1f);
        } else {
            textPaint.setShadowLayer(2.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, -16777216);
        }
        return textPaint;
    }

    private static void setLongshotMode(TextPaint textPaint, float f) {
        if (VERSION.SDK_INT >= 21) {
            CompatibilityUtils.setTextPaintLetterSpacing(textPaint, f);
        }
    }

    public static StringTexture newInstance(String str, float f, int i, int i2) {
        return newInstance(str, getDefaultPaint(f, i, i2), i2);
    }

    public static StringTexture newInstance(String str, float f, int i, float f2, boolean z) {
        return newInstance(str, f, i, f2, z, 0);
    }

    public static StringTexture newInstance(String str, float f, int i, float f2, boolean z, int i2) {
        TextPaint defaultPaint = getDefaultPaint(f, i, i2);
        if (z) {
            defaultPaint.setTypeface(Typeface.defaultFromStyle(1));
        }
        if (f2 > PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
            str = TextUtils.ellipsize(str, defaultPaint, f2, TruncateAt.END).toString();
        }
        return newInstance(str, defaultPaint, i2);
    }

    private static StringTexture newInstance(String str, TextPaint textPaint, int i) {
        FontMetricsInt fontMetricsInt = textPaint.getFontMetricsInt();
        int ceil = ((int) Math.ceil((double) textPaint.measureText(str))) + (i == 1 ? 5 : 0);
        i = fontMetricsInt.descent - fontMetricsInt.ascent;
        return new StringTexture(str, textPaint, fontMetricsInt, ceil <= 0 ? 1 : ceil, i <= 0 ? 1 : i);
    }

    protected void onDraw(Canvas canvas, Bitmap bitmap) {
        canvas.translate(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) (-this.mMetrics.ascent));
        canvas.drawText(this.mText, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, this.mPaint);
    }
}
