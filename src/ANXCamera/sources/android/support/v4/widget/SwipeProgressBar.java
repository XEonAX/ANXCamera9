package android.support.v4.widget;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import com.android.camera.fragment.top.FragmentTopAlert;

final class SwipeProgressBar {
    private static final int ANIMATION_DURATION_MS = 2000;
    private static final int COLOR1 = -1291845632;
    private static final int COLOR2 = Integer.MIN_VALUE;
    private static final int COLOR3 = 1291845632;
    private static final int COLOR4 = 436207616;
    private static final int FINISH_ANIMATION_DURATION_MS = 1000;
    private static final Interpolator INTERPOLATOR = new FastOutSlowInInterpolator();
    private Rect mBounds = new Rect();
    private final RectF mClipRect = new RectF();
    private int mColor1;
    private int mColor2;
    private int mColor3;
    private int mColor4;
    private long mFinishTime;
    private final Paint mPaint = new Paint();
    private View mParent;
    private boolean mRunning;
    private long mStartTime;
    private float mTriggerPercentage;

    public SwipeProgressBar(View parent) {
        this.mParent = parent;
        this.mColor1 = COLOR1;
        this.mColor2 = Integer.MIN_VALUE;
        this.mColor3 = COLOR3;
        this.mColor4 = COLOR4;
    }

    void setColorScheme(int color1, int color2, int color3, int color4) {
        this.mColor1 = color1;
        this.mColor2 = color2;
        this.mColor3 = color3;
        this.mColor4 = color4;
    }

    void setTriggerPercentage(float triggerPercentage) {
        this.mTriggerPercentage = triggerPercentage;
        this.mStartTime = 0;
        ViewCompat.postInvalidateOnAnimation(this.mParent, this.mBounds.left, this.mBounds.top, this.mBounds.right, this.mBounds.bottom);
    }

    void start() {
        if (!this.mRunning) {
            this.mTriggerPercentage = 0.0f;
            this.mStartTime = AnimationUtils.currentAnimationTimeMillis();
            this.mRunning = true;
            this.mParent.postInvalidate();
        }
    }

    void stop() {
        if (this.mRunning) {
            this.mTriggerPercentage = 0.0f;
            this.mFinishTime = AnimationUtils.currentAnimationTimeMillis();
            this.mRunning = false;
            this.mParent.postInvalidate();
        }
    }

    boolean isRunning() {
        return this.mRunning || this.mFinishTime > 0;
    }

    void draw(Canvas canvas) {
        Canvas canvas2 = canvas;
        int width = this.mBounds.width();
        int height = this.mBounds.height();
        int cx = width / 2;
        int cy = height / 2;
        int restoreCount = canvas.save();
        canvas2.clipRect(this.mBounds);
        if (this.mRunning || this.mFinishTime > 0) {
            Canvas canvas3;
            long now = AnimationUtils.currentAnimationTimeMillis();
            long elapsed = (now - this.mStartTime) % FragmentTopAlert.HINT_DELAY_TIME;
            long iterations = (now - this.mStartTime) / FragmentTopAlert.HINT_DELAY_TIME;
            float rawProgress = ((float) elapsed) / 20.0f;
            boolean drawTriggerWhileFinishing;
            long elapsed2;
            if (this.mRunning) {
                drawTriggerWhileFinishing = false;
                elapsed2 = elapsed;
            } else if (now - this.mFinishTime >= 1000) {
                this.mFinishTime = 0;
                return;
            } else {
                long finishElapsed = (now - this.mFinishTime) % 1000;
                float finishProgress = ((float) finishElapsed) / 10.0f;
                drawTriggerWhileFinishing = false;
                float clearRadius = ((float) (width / 2)) * INTERPOLATOR.getInterpolation(finishProgress / 100.0f);
                elapsed2 = elapsed;
                this.mClipRect.set(((float) cx) - clearRadius, 0, ((float) cx) + clearRadius, (float) height);
                canvas2.saveLayerAlpha(this.mClipRect, 0, 0);
                drawTriggerWhileFinishing = true;
            }
            if (iterations == 0) {
                canvas2.drawColor(this.mColor1);
            } else if (rawProgress >= 0.0f && rawProgress < 25.0f) {
                canvas2.drawColor(this.mColor4);
            } else if (rawProgress >= 25.0f && rawProgress < 50.0f) {
                canvas2.drawColor(this.mColor1);
            } else if (rawProgress < 50.0f || rawProgress >= 75.0f) {
                canvas2.drawColor(this.mColor3);
            } else {
                canvas2.drawColor(this.mColor2);
            }
            if (rawProgress < 0.0f || rawProgress > 25.0f) {
            } else {
                canvas3 = canvas2;
                drawCircle(canvas3, (float) cx, (float) cy, this.mColor1, ((rawProgress + 25.0f) * 2.0f) / 100.0f);
            }
            if (rawProgress >= 0.0f && rawProgress <= 50.0f) {
                canvas3 = canvas2;
                drawCircle(canvas3, (float) cx, (float) cy, this.mColor2, (rawProgress * 2.0f) / 100.0f);
            }
            if (rawProgress >= 25.0f && rawProgress <= 75.0f) {
                canvas3 = canvas2;
                drawCircle(canvas3, (float) cx, (float) cy, this.mColor3, ((rawProgress - 25.0f) * 2.0f) / 100.0f);
            }
            if (rawProgress >= 50.0f && rawProgress <= 100.0f) {
                canvas3 = canvas2;
                drawCircle(canvas3, (float) cx, (float) cy, this.mColor4, ((rawProgress - 50.0f) * 2.0f) / 100.0f);
            }
            if (rawProgress >= 75.0f && rawProgress <= 100.0f) {
                canvas3 = canvas2;
                drawCircle(canvas3, (float) cx, (float) cy, this.mColor1, ((rawProgress - 75.0f) * 2.0f) / 100.0f);
            }
            if (this.mTriggerPercentage > 0.0f && drawTriggerWhileFinishing) {
                canvas2.restoreToCount(restoreCount);
                int restoreCount2 = canvas.save();
                canvas2.clipRect(this.mBounds);
                drawTrigger(canvas2, cx, cy);
                restoreCount = restoreCount2;
            }
            ViewCompat.postInvalidateOnAnimation(this.mParent, this.mBounds.left, this.mBounds.top, this.mBounds.right, this.mBounds.bottom);
        } else if (this.mTriggerPercentage > 0.0f && ((double) this.mTriggerPercentage) <= 1.0d) {
            drawTrigger(canvas2, cx, cy);
        }
        canvas2.restoreToCount(restoreCount);
    }

    private void drawTrigger(Canvas canvas, int cx, int cy) {
        this.mPaint.setColor(this.mColor1);
        canvas.drawCircle((float) cx, (float) cy, ((float) cx) * this.mTriggerPercentage, this.mPaint);
    }

    private void drawCircle(Canvas canvas, float cx, float cy, int color, float pct) {
        this.mPaint.setColor(color);
        canvas.save();
        canvas.translate(cx, cy);
        float radiusScale = INTERPOLATOR.getInterpolation(pct);
        canvas.scale(radiusScale, radiusScale);
        canvas.drawCircle(0.0f, 0.0f, cx, this.mPaint);
        canvas.restore();
    }

    void setBounds(int left, int top, int right, int bottom) {
        this.mBounds.left = left;
        this.mBounds.top = top;
        this.mBounds.right = right;
        this.mBounds.bottom = bottom;
    }
}
