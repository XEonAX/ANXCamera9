package com.android.camera.ui;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Message;
import android.os.SystemProperties;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.aeonax.camera.R;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import java.util.Locale;
import miui.view.animation.CubicEaseOutInterpolator;

public class V9EdgeShutterView extends View implements V6FunctionUI {
    private static final int CENTER_RADIUS = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_edge_shutter_center_radius);
    private static final int FLYINOUT_DURATION = 250;
    private static final int MOVE_DURATION = 300;
    private static final int MSG_CAPTURE_MOVING = 2;
    private static final int MSG_CAPTURE_POSTURE_CHANGED = 1;
    private static final int MSG_LONG_TIME_UNUSED = 0;
    private static final int NEAR_THRESHOLD = Util.dpToPixel(66.67f);
    private static int NORMAL_TAP_MAXY = ((Util.sWindowHeight * SystemProperties.getInt("camera_edge_max", 75)) / 100);
    private static int NORMAL_TOUCH_MAXY = (NORMAL_TAP_MAXY + (NEAR_THRESHOLD / 2));
    private static final int OUTER_CIRCLE_WIDTH = Util.dpToPixel(1.0f);
    private static final int OUT_RADIUS = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_edge_shutter_out_radius);
    private static final int PRESS_DURATION = 250;
    private static final String TAG = "CameraEdgeShutterView";
    private static final int UNUSED_TRIGGER_TIME = 5000;
    private static final int VIDEO_CENTER_COLOR = -1032447;
    private static final int VIDEO_OUTER_COLOR = -1862270977;
    private static final int VIEW_FLYOUT = 2;
    private static final int VIEW_INVISIBLE = 4;
    private static final int VIEW_MOVE = 3;
    private static final int VIEW_VISIBLE = 1;
    private static final int VIEW_WIDTH = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.v6_edge_shutter_width);
    private AnimatorListener mAnimatorListener;
    private Paint mCenterPaint;
    private ValueAnimator mClickAnim;
    private ValueAnimator mFlyOutAnim;
    private ValueAnimator mFlyinAnim;
    private Interpolator mFlyinInterpolator = new OvershootInterpolator();
    private Handler mHandler = new Handler() {
        public void dispatchMessage(Message message) {
            switch (message.what) {
                case 0:
                case 2:
                    V9EdgeShutterView.this.hideShutterView();
                    return;
                case 1:
                    V9EdgeShutterView.this.checkPosture();
                    return;
                default:
                    return;
            }
        }
    };
    private MessageDispatcher mMessageDispatcher;
    private ValueAnimator mMoveAnim;
    private Interpolator mMoveInterpolator = new CubicEaseOutInterpolator();
    private Paint mOuterPaint;
    private Interpolator mPressInterpolator = new ReverseInterpolator(this, null);
    private Rect mVisibleBounds = new Rect(0, 0, Util.sWindowWidth, Util.sWindowHeight);
    private int mVisibleState;

    private class CustomAnimatorListener extends AnimatorListenerAdapter {
        private CustomAnimatorListener() {
        }

        /* synthetic */ CustomAnimatorListener(V9EdgeShutterView v9EdgeShutterView, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onAnimationEnd(Animator animator) {
            String str = V9EdgeShutterView.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onAnimationEnd animation=");
            stringBuilder.append(animator);
            Log.v(str, stringBuilder.toString());
            if (animator == V9EdgeShutterView.this.mFlyOutAnim && V9EdgeShutterView.this.mVisibleState == 2) {
                V9EdgeShutterView.this.setRelateVisible(4);
                V9EdgeShutterView.this.mVisibleState = 4;
            } else if (animator == V9EdgeShutterView.this.mMoveAnim && V9EdgeShutterView.this.mVisibleState == 3) {
                V9EdgeShutterView.this.mVisibleState = 1;
            }
            V9EdgeShutterView.this.setX((float) V9EdgeShutterView.this.getLeft());
        }

        public void onAnimationStart(Animator animator) {
            if (animator == V9EdgeShutterView.this.mClickAnim) {
                V9EdgeShutterView.this.setX((float) V9EdgeShutterView.this.getLeft());
            }
        }

        public void onAnimationCancel(Animator animator) {
            String str = V9EdgeShutterView.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onAnimationCancel animation=");
            stringBuilder.append(animator);
            Log.v(str, stringBuilder.toString());
            V9EdgeShutterView.this.mVisibleState = 1;
        }
    }

    private class ReverseInterpolator implements Interpolator {
        private final Interpolator mInterpolator;

        private ReverseInterpolator(Interpolator interpolator) {
            if (interpolator == null) {
                interpolator = new AccelerateDecelerateInterpolator();
            }
            this.mInterpolator = interpolator;
        }

        private ReverseInterpolator(V9EdgeShutterView v9EdgeShutterView) {
            this(new AccelerateDecelerateInterpolator());
        }

        public float getInterpolation(float f) {
            if (((double) f) <= 0.5d) {
                return this.mInterpolator.getInterpolation(f * 2.0f);
            }
            return this.mInterpolator.getInterpolation(Math.abs(f - 1.0f) * 2.0f);
        }
    }

    protected void onFinishInflate() {
        this.mCenterPaint = new Paint();
        this.mCenterPaint.setAntiAlias(true);
        this.mCenterPaint.setColor(-1);
        this.mCenterPaint.setStyle(Style.FILL);
        this.mOuterPaint = new Paint();
        this.mOuterPaint.setAntiAlias(true);
        this.mOuterPaint.setColor(-1);
        this.mOuterPaint.setStyle(Style.STROKE);
        this.mOuterPaint.setStrokeWidth((float) OUTER_CIRCLE_WIDTH);
        this.mAnimatorListener = new CustomAnimatorListener(this, null);
    }

    public V9EdgeShutterView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void setMessageDispatcher(MessageDispatcher messageDispatcher) {
        this.mMessageDispatcher = messageDispatcher;
    }

    public void onCreate() {
        if (ModuleManager.isVideoModule()) {
            this.mCenterPaint.setColor(VIDEO_CENTER_COLOR);
            this.mOuterPaint.setColor(VIDEO_OUTER_COLOR);
            return;
        }
        this.mCenterPaint.setColor(-1);
        this.mOuterPaint.setColor(-1);
    }

    public void onCameraOpen() {
    }

    public void enableControls(boolean z) {
    }

    public void onResume() {
    }

    public void onPause() {
        this.mHandler.removeMessages(0);
        this.mHandler.removeMessages(1);
        this.mHandler.removeMessages(2);
        setRelateVisible(8);
    }

    public boolean onEdgeTap(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onEdgeTouch x=");
        stringBuilder.append(i);
        stringBuilder.append(" y=");
        stringBuilder.append(i2);
        stringBuilder.append(" viewstate:");
        stringBuilder.append(getViewState());
        Log.v(str, stringBuilder.toString());
        if (couldTouch(i, i2) || !isDeviceStateReady(i, i2, NORMAL_TAP_MAXY)) {
            return false;
        }
        flyto(i, i2);
        resendUnusedMessage();
        return true;
    }

    private boolean couldTouch(int i, int i2) {
        if (this.mVisibleState != 1 || Math.abs(i - getLeft()) > NEAR_THRESHOLD || Math.abs(i2 - ((getTop() + getBottom()) / 2)) > NEAR_THRESHOLD) {
            return false;
        }
        return true;
    }

    public boolean onEdgeTouch(int i, int i2) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onEdgeTouch x=");
        stringBuilder.append(i);
        stringBuilder.append(" y=");
        stringBuilder.append(i2);
        stringBuilder.append(" viewstate:");
        stringBuilder.append(getViewState());
        Log.v(str, stringBuilder.toString());
        if (!couldTouch(i, i2) || !isDeviceStateReady(i, i2, NORMAL_TOUCH_MAXY)) {
            return false;
        }
        if (this.mFlyinAnim != null && this.mFlyinAnim.isStarted()) {
            this.mFlyinAnim.cancel();
        }
        if (this.mMessageDispatcher != null) {
            this.mMessageDispatcher.dispatchMessage(0, R.id.v9_edge_shutter_view, 2, null, null);
        }
        this.mClickAnim = createClickAnimation();
        this.mClickAnim.start();
        resendUnusedMessage();
        return true;
    }

    private void flyto(int i, int i2) {
        Rect reviseLocation = reviseLocation(i, i2, this.mVisibleBounds);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("flyto ");
        stringBuilder.append(getVisibility());
        stringBuilder.append(" rec=");
        stringBuilder.append(reviseLocation);
        stringBuilder.append(" viewstate:");
        stringBuilder.append(getViewState());
        Log.v(str, stringBuilder.toString());
        if (getVisibility() != 0) {
            if (getVisibility() == 8) {
                setInitLayoutParameters(reviseLocation);
            }
            layout(reviseLocation.left, reviseLocation.top, reviseLocation.right, reviseLocation.bottom);
            this.mFlyinAnim = createFlyInAnimation();
            this.mFlyinAnim.start();
            this.mVisibleState = 1;
            setRelateVisible(0);
            return;
        }
        if (this.mFlyOutAnim != null && this.mFlyOutAnim.isStarted()) {
            this.mFlyOutAnim.cancel();
        }
        if (this.mFlyinAnim != null && this.mFlyinAnim.isStarted()) {
            this.mFlyinAnim.cancel();
        }
        this.mMoveAnim = createMoveAnimation(reviseLocation);
        this.mMoveAnim.start();
        this.mVisibleState = 3;
        layout(reviseLocation.left, reviseLocation.top, reviseLocation.right, reviseLocation.bottom);
        setX((float) reviseLocation.left);
    }

    private void setInitLayoutParameters(Rect rect) {
        LayoutParams layoutParams = (LayoutParams) getLayoutParams();
        layoutParams.leftMargin = rect.left;
        layoutParams.topMargin = rect.top;
        setLayoutParams(layoutParams);
    }

    private Rect reviseLocation(int i, int i2, Rect rect) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("flyto reviseLocation x");
        stringBuilder.append(i);
        stringBuilder.append(" y=");
        stringBuilder.append(i2);
        stringBuilder.append(" bounds=");
        stringBuilder.append(rect);
        stringBuilder.append(" viewstate:");
        stringBuilder.append(getViewState());
        Log.v(str, stringBuilder.toString());
        i2 -= (VIEW_WIDTH * i2) / Util.sWindowHeight;
        Rect rect2 = new Rect(i, i2, VIEW_WIDTH + i, VIEW_WIDTH + i2);
        if (rect.contains(rect2)) {
            return rect2;
        }
        if (rect2.left < rect.left) {
            rect2.right = rect.left + rect2.width();
            rect2.left = rect.left;
        } else if (rect2.right > rect.right) {
            rect2.left = rect.right - rect2.width();
            rect2.right = rect.right;
        }
        if (rect2.top < rect.top) {
            rect2.bottom = rect.top + rect2.height();
            rect2.top = rect.top;
        } else if (rect2.bottom > rect.bottom) {
            rect2.top = rect.bottom - rect2.height();
            rect2.bottom = rect.bottom;
        }
        return rect2;
    }

    protected void onMeasure(int i, int i2) {
        setMeasuredDimension(VIEW_WIDTH, VIEW_WIDTH);
    }

    protected void onDraw(Canvas canvas) {
        canvas.drawCircle((float) (VIEW_WIDTH / 2), (float) (VIEW_WIDTH / 2), (float) (OUT_RADIUS - 2), this.mOuterPaint);
        canvas.drawCircle((float) (VIEW_WIDTH / 2), (float) (VIEW_WIDTH / 2), (float) CENTER_RADIUS, this.mCenterPaint);
    }

    private ValueAnimator createFlyInAnimation() {
        int i;
        if (getLeft() < VIEW_WIDTH) {
            i = -VIEW_WIDTH;
        } else {
            i = VIEW_WIDTH;
        }
        ValueAnimator ofFloat = ObjectAnimator.ofFloat(this, "translationX", new float[]{(float) i, (float) null});
        ofFloat.setInterpolator(this.mFlyinInterpolator);
        ofFloat.setDuration(250);
        ofFloat.addListener(this.mAnimatorListener);
        return ofFloat;
    }

    private ValueAnimator createMoveAnimation(Rect rect) {
        PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat("x", new float[]{(float) rect.left});
        PropertyValuesHolder ofFloat2 = PropertyValuesHolder.ofFloat("y", new float[]{(float) rect.top});
        ValueAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[]{ofFloat, ofFloat2});
        ofPropertyValuesHolder.setInterpolator(this.mMoveInterpolator);
        ofPropertyValuesHolder.setDuration(300);
        ofPropertyValuesHolder.addListener(this.mAnimatorListener);
        return ofPropertyValuesHolder;
    }

    private ValueAnimator createFlyOutAnimation() {
        int i;
        if (getLeft() < VIEW_WIDTH) {
            i = -VIEW_WIDTH;
        } else {
            i = VIEW_WIDTH;
        }
        ValueAnimator ofFloat = ObjectAnimator.ofFloat(this, "translationX", new float[]{(float) null, (float) i});
        ofFloat.setInterpolator(this.mMoveInterpolator);
        ofFloat.setDuration(250);
        ofFloat.addListener(this.mAnimatorListener);
        return ofFloat;
    }

    private ValueAnimator createClickAnimation() {
        String str = "x";
        float[] fArr = new float[1];
        fArr[0] = (float) (getLeft() < VIEW_WIDTH ? getLeft() + (VIEW_WIDTH / 5) : getLeft() - (VIEW_WIDTH / 5));
        ValueAnimator ofFloat = ObjectAnimator.ofFloat(this, str, fArr);
        ofFloat.setInterpolator(this.mPressInterpolator);
        ofFloat.setDuration(250);
        ofFloat.addListener(this.mAnimatorListener);
        return ofFloat;
    }

    private void resendUnusedMessage() {
        this.mHandler.removeMessages(0);
        this.mHandler.sendEmptyMessageDelayed(0, 5000);
    }

    public void cancelAnimation() {
        animate().cancel();
        setX((float) getLeft());
        setY((float) getTop());
    }

    private String getViewState() {
        return String.format(Locale.ENGLISH, "View state mleft=%d mtop=%d width=%d height=%d mVisibleState=%d getVisibility()=%d", new Object[]{Integer.valueOf(getLeft()), Integer.valueOf(getTop()), Integer.valueOf(getWidth()), Integer.valueOf(getHeight()), Integer.valueOf(this.mVisibleState), Integer.valueOf(getVisibility())});
    }

    private void hideShutterView() {
        if (this.mVisibleState == 1) {
            this.mFlyOutAnim = createFlyOutAnimation();
            this.mFlyOutAnim.start();
            this.mVisibleState = 2;
        }
    }

    private void checkPosture() {
        int capturePosture = ((Camera) getContext()).getCapturePosture();
        if ((capturePosture == 1 && getLeft() != 0) || ((capturePosture == 2 && getLeft() == 0) || (capturePosture == 0 && getTop() > NORMAL_TAP_MAXY))) {
            hideShutterView();
        }
    }

    private boolean isDeviceStateReady(int i, int i2, int i3) {
        Camera camera = (Camera) getContext();
        if (camera.isStable()) {
            int capturePosture = camera.getCapturePosture();
            if (capturePosture == 0 && i2 > i3) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Device post wrong, y is too big, capturePosture=");
                stringBuilder.append(capturePosture);
                stringBuilder.append(" x=");
                stringBuilder.append(i);
                stringBuilder.append(" y=");
                stringBuilder.append(i2);
                stringBuilder.append(" maxY=");
                stringBuilder.append(i3);
                Log.v(str, stringBuilder.toString());
                return false;
            } else if ((capturePosture != 1 || i == 0) && (capturePosture != 2 || i != 0)) {
                return true;
            } else {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Device post wrong, touching bottom edge, capturePosture=");
                stringBuilder2.append(capturePosture);
                stringBuilder2.append(" x=");
                stringBuilder2.append(i);
                stringBuilder2.append(" y=");
                stringBuilder2.append(i2);
                Log.v(str2, stringBuilder2.toString());
                return false;
            }
        }
        Log.v(TAG, "Device is not stable, ignore edgetouch");
        return false;
    }

    public void onDevicePostureChanged() {
        this.mHandler.sendEmptyMessage(1);
    }

    public void onDeviceMoving() {
        this.mHandler.sendEmptyMessage(2);
    }

    private void setRelateVisible(int i) {
        RelativeLayout relativeLayout = (RelativeLayout) getParent();
        if (relativeLayout != null) {
            int i2 = 8;
            if (8 != i) {
                i2 = 0;
            }
            relativeLayout.setVisibility(i2);
        }
        setVisibility(i);
    }
}
