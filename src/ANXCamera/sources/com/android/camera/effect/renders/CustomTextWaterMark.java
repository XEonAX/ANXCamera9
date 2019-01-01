package com.android.camera.effect.renders;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint.FontMetricsInt;
import android.os.Build.VERSION;
import android.text.TextPaint;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomTextWaterMark {
    private static final int SIZE_CN = 70;
    private static final int SIZE_EN = 77;
    private static final String TAG = CustomTextWaterMark.class.getSimpleName();
    private static final int TEXT_COLOR = -1;
    private static final int TYPE_CN = 1;
    private static final int TYPE_EN = 2;
    private static final float WATER_MARK_SHADOW_Y = 3.0f;
    private static final int WATER_MARK_SHADOW_Y_COLOR = 771751936;
    private final TextPaint mCNPaint;
    private final TextPaint mENPaint;
    private Bitmap mInputBitmap;
    private final FontMetricsInt mMetrics;
    private float mStartX;
    private float mStartY;
    private String mText;

    public CustomTextWaterMark(Bitmap bitmap, float f, float f2, String str, TextPaint textPaint, TextPaint textPaint2, FontMetricsInt fontMetricsInt) {
        this.mInputBitmap = bitmap;
        this.mStartX = f;
        this.mStartY = f2;
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
        setLongshotMode(textPaint, 0.05f);
        return textPaint;
    }

    private static void setLongshotMode(TextPaint textPaint, float f) {
        if (VERSION.SDK_INT >= 21) {
            CompatibilityUtils.setTextPaintLetterSpacing(textPaint, f);
        }
    }

    public static CustomTextWaterMark newInstance(Bitmap bitmap, float f, float f2, String str) {
        float resourceFloat = CameraSettings.getResourceFloat(R.dimen.custom_watermark_text_size_ratio, 1.0f);
        TextPaint defaultPaint = getDefaultPaint((float) ((int) (70.0f * resourceFloat)), -1, 1);
        TextPaint defaultPaint2 = getDefaultPaint((float) ((int) (77.0f * resourceFloat)), -1, 2);
        return new CustomTextWaterMark(bitmap, f, f2, str, defaultPaint, defaultPaint2, defaultPaint2.getFontMetricsInt());
    }

    public Bitmap drawToBitmap() {
        Bitmap copy = this.mInputBitmap.copy(Config.ARGB_8888, true);
        this.mInputBitmap.recycle();
        copy.setPremultiplied(true);
        onDraw(new Canvas(copy), copy);
        return copy;
    }

    protected void onDraw(Canvas canvas, Bitmap bitmap) {
        long nanoTime = System.nanoTime();
        canvas.translate(this.mStartX, this.mStartY - ((float) this.mMetrics.ascent));
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
