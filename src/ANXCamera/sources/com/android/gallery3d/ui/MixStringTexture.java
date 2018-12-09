package com.android.gallery3d.ui;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint.FontMetricsInt;
import android.os.Build.VERSION;
import android.text.TextPaint;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MixStringTexture extends CanvasTexture {
    private static final String TAG = MixStringTexture.class.getSimpleName();
    public static final int TYPE_CN = 1;
    public static final int TYPE_EN = 2;
    public static final float WATER_MARK_SHADOW_Y = 3.0f;
    public static final int WATER_MARK_SHADOW_Y_COLOR = 771751936;
    private final TextPaint mCNPaint;
    private final TextPaint mENPaint;
    private final FontMetricsInt mMetrics;
    private final String mText;

    private MixStringTexture(String str, TextPaint textPaint, TextPaint textPaint2, FontMetricsInt fontMetricsInt, int i, int i2) {
        super(i, i2);
        this.mText = str;
        this.mCNPaint = textPaint;
        this.mENPaint = textPaint2;
        this.mMetrics = fontMetricsInt;
    }

    public static TextPaint getDefaultPaint(float f, int i, int i2) {
        TextPaint textPaint = new TextPaint(1);
        textPaint.setTextSize(f);
        textPaint.setAntiAlias(true);
        textPaint.setColor(i);
        if (i2 == 1) {
            textPaint.setTypeface(Util.getLanTineGBTypeface(CameraAppImpl.getAndroidContext()));
        } else if (i2 == 2) {
            textPaint.setFakeBoldText(true);
            textPaint.setTypeface(Util.getMFYueYuanTypeface(CameraAppImpl.getAndroidContext()));
        }
        textPaint.setShadowLayer(0.1f, 3.0f, 3.0f, 771751936);
        setLongshotMode(textPaint, 0.1f);
        return textPaint;
    }

    private static void setLongshotMode(TextPaint textPaint, float f) {
        if (VERSION.SDK_INT >= 21) {
            CompatibilityUtils.setTextPaintLetterSpacing(textPaint, f);
        }
    }

    public static MixStringTexture newInstance(String str, float f, int i) {
        return newInstance(str, getDefaultPaint(f, i, 1), getDefaultPaint(f, i, 2));
    }

    private static MixStringTexture newInstance(String str, TextPaint textPaint, TextPaint textPaint2) {
        FontMetricsInt fontMetricsInt = textPaint2.getFontMetricsInt();
        int ceil = (int) (Math.ceil((double) textPaint2.measureText(str)) * 1.5d);
        int i = fontMetricsInt.descent - fontMetricsInt.ascent;
        return new MixStringTexture(str, textPaint, textPaint2, fontMetricsInt, ceil <= 0 ? 1 : ceil, i <= 0 ? 1 : i);
    }

    protected void onDraw(Canvas canvas, Bitmap bitmap) {
        long nanoTime = System.nanoTime();
        canvas.translate(0.0f, (float) (-this.mMetrics.ascent));
        Matcher matcher = Pattern.compile("([\\sa-zA-Z0-9]+)|([^\\sa-zA-Z0-9]+)").matcher(this.mText);
        int i = 0;
        while (matcher.find()) {
            float f;
            float measureText;
            String group = matcher.group();
            if (group.matches("[\\sa-zA-Z0-9]+")) {
                f = (float) i;
                canvas.drawText(group, f, 0.0f, this.mENPaint);
                measureText = this.mENPaint.measureText(group);
            } else {
                f = (float) i;
                canvas.drawText(group, f, 0.0f, this.mCNPaint);
                measureText = this.mCNPaint.measureText(group);
            }
            i = (int) (f + measureText);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Custom watermark cost time = ");
        stringBuilder.append(System.nanoTime() - nanoTime);
        Log.v(str, stringBuilder.toString());
    }
}
