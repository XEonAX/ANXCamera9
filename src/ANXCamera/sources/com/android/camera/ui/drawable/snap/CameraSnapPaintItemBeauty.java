package com.android.camera.ui.drawable.snap;

import android.animation.ArgbEvaluator;
import android.graphics.Paint;
import android.support.annotation.ColorInt;
import com.android.camera.log.Log;
import com.facebook.rebound.SimpleSpringListener;
import com.facebook.rebound.Spring;
import com.facebook.rebound.SpringConfig;
import com.facebook.rebound.SpringSystem;
import com.facebook.rebound.SpringUtil;

public class CameraSnapPaintItemBeauty {
    private static final String TAG = "CameraSnapPaintItemBeau";
    private static final SpringConfig mCameraDownConfig = SpringConfig.fromOrigamiTensionAndFriction(100.0d, 15.0d);
    public static final SpringConfig mCameraUpConfig = SpringConfig.fromOrigamiTensionAndFriction(120.0d, 30.0d);
    public static final SpringConfig mCameraUpSplashConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 10.0d);
    public static final SpringConfig mRecordScaleConfig = SpringConfig.fromOrigamiTensionAndFriction(180.0d, 30.0d);
    private CameraSnapAnimateDrawable mCameraSnapAnimateDrawable;
    public int mCurrentAlpha;
    @ColorInt
    public int mCurrentColor;
    public float mCurrentWidth = 0.9f;
    private Spring mDownSpring;
    private int mDstAlpha;
    private int mDstColor;
    private float mDstWidth;
    public LongPressIncreaseListener mLongPressIncreaseListener = new LongPressIncreaseListener() {
        public void OnValueUp(float f) {
            CameraSnapPaintItemBeauty.this.mUpSpring.setEndValue((double) f);
            CameraSnapPaintItemBeauty.this.mRecordSpring.setEndValue((double) Math.max(0.3f, f));
        }

        public void OnTheValue(boolean z) {
            if (z) {
                CameraSnapPaintItemBeauty.this.mUpSpring.setSpringConfig(CameraSnapPaintItemBeauty.mCameraUpSplashConfig);
                CameraSnapPaintItemBeauty.this.mUpSpring.setEndValue(1.0d);
                CameraSnapPaintItemBeauty.this.mRecordSpring.setEndValue(0.6000000238418579d);
            }
        }

        public void OnIncrease(float f) {
            CameraSnapPaintItemBeauty.this.mRecordSpring.setEndValue(Math.min(1.1d, 0.6000000238418579d + ((((double) f) - 0.6d) / 1.0d)));
        }
    };
    public Paint mPaint;
    public Spring mRecordSpring;
    private SpringSystem mSpringSystem;
    private int mSrcAlpha;
    private int mSrcColor;
    private float mSrcWidth;
    public Spring mUpSpring;

    public interface LongPressIncreaseListener {
        void OnIncrease(float f);

        void OnTheValue(boolean z);

        void OnValueUp(float f);
    }

    public CameraSnapPaintItemBeauty(CameraSnapAnimateDrawable cameraSnapAnimateDrawable) {
        this.mCameraSnapAnimateDrawable = cameraSnapAnimateDrawable;
        initClickReboundSystem();
        initLongPressReboundSystem();
    }

    public void onUp() {
        this.mDownSpring.setEndValue(0.0d);
    }

    public void onDown() {
        this.mDownSpring.setEndValue(1.0d);
    }

    public void onLongPress() {
    }

    private void initClickReboundSystem() {
        this.mSpringSystem = SpringSystem.create();
        this.mDownSpring = this.mSpringSystem.createSpring();
        this.mDownSpring.setSpringConfig(mCameraDownConfig);
        this.mDownSpring.addListener(new SimpleSpringListener() {
            public void onSpringUpdate(Spring spring) {
                float mapValueFromRangeToRange = (float) SpringUtil.mapValueFromRangeToRange((double) ((float) spring.getCurrentValue()), 0.0d, 1.0d, 1.0d, 0.8d);
                String str = CameraSnapPaintItemBeauty.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("scaleValue = ");
                stringBuilder.append(mapValueFromRangeToRange);
                Log.e(str, stringBuilder.toString());
                CameraSnapPaintItemBeauty.this.mCurrentWidth = 1.0f * mapValueFromRangeToRange;
                CameraSnapPaintItemBeauty.this.mCameraSnapAnimateDrawable.invalidateSelf();
            }
        });
    }

    private void initLongPressReboundSystem() {
        this.mUpSpring = this.mSpringSystem.createSpring();
        this.mUpSpring.setSpringConfig(mCameraUpConfig);
        this.mUpSpring.addListener(new SimpleSpringListener() {
            public void onSpringUpdate(Spring spring) {
                SpringUtil.mapValueFromRangeToRange((double) ((float) spring.getCurrentValue()), 0.0d, 1.0d, 1.0d, 1.2d);
            }

            public void onSpringAtRest(Spring spring) {
                if (spring.getCurrentValue() == 0.0d) {
                    CameraSnapPaintItemBeauty.this.mUpSpring.setSpringConfig(CameraSnapPaintItemBeauty.mCameraUpConfig);
                }
            }
        });
        this.mRecordSpring = this.mSpringSystem.createSpring();
        this.mRecordSpring.setSpringConfig(mRecordScaleConfig);
        this.mRecordSpring.setCurrentValue(1.0d);
        this.mRecordSpring.addListener(new SimpleSpringListener() {
            public void onSpringUpdate(Spring spring) {
                CameraSnapPaintItemBeauty.this.mCurrentWidth = ((float) spring.getCurrentValue()) * 0.9f;
                CameraSnapPaintItemBeauty.this.mCameraSnapAnimateDrawable.invalidateSelf();
            }
        });
    }

    public void reInitValues(float f, @ColorInt int i, int i2) {
        this.mDstWidth = f;
        this.mDstColor = i;
        this.mDstAlpha = i2;
        this.mSrcWidth = this.mCurrentWidth;
        this.mSrcColor = this.mCurrentColor;
        this.mSrcAlpha = this.mCurrentAlpha;
    }

    public void updateValue(float f) {
        this.mCurrentWidth = this.mSrcWidth + ((this.mDstWidth - this.mSrcWidth) * f);
        if (this.mSrcColor != this.mDstColor) {
            this.mCurrentColor = ((Integer) new ArgbEvaluator().evaluate(f, Integer.valueOf(this.mSrcColor), Integer.valueOf(this.mDstColor))).intValue();
            this.mPaint.setColor(this.mCurrentColor);
        }
        if (this.mSrcAlpha != this.mDstAlpha) {
            this.mCurrentAlpha = (int) (((float) this.mSrcAlpha) + (((float) (this.mDstAlpha - this.mSrcAlpha)) * f));
            this.mPaint.setAlpha(this.mCurrentAlpha);
        }
    }

    public void setResult() {
        this.mCurrentWidth = this.mDstWidth;
        this.mCurrentAlpha = this.mDstAlpha;
        this.mCurrentColor = this.mDstColor;
        this.mPaint.setColor(this.mCurrentColor);
        this.mPaint.setAlpha(this.mCurrentAlpha);
        this.mSrcWidth = this.mCurrentWidth;
        this.mSrcColor = this.mCurrentColor;
        this.mSrcAlpha = this.mCurrentAlpha;
    }
}
