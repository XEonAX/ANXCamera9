package com.android.camera.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.fragment.bottom.BottomAnimationConfig;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.snap.CameraSnapAnimateDrawable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class CameraSnapView extends View {
    private static final int LONG_PRESS_TIME = 800;
    private static final int MSG_START_CLICK = 1;
    private static final int MSG_START_LONG_PRESS = 2;
    private static final int MSG_START_LONG_PRESS_CANCEL_IN = 4;
    private static final int MSG_START_LONG_PRESS_CANCEL_OUT = 3;
    private static final float RECT_WIDTH = 0.75f;
    private static final String TAG = CameraSnapView.class.getSimpleName();
    private CameraSnapAnimateDrawable cameraSnapAnimateDrawable;
    private int mCurrentMode;
    private boolean mEnableSnapClick = true;
    private Bitmap mExtraBitmap;
    private Matrix mExtraBitmapMatrix;
    private Paint mExtraBitmapPaint;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (CameraSnapView.this.mSnapListener != null) {
                switch (message.what) {
                    case 1:
                        CameraSnapView.this.mSnapListener.onSnapClick();
                        break;
                    case 2:
                        CameraSnapView.this.mSnapListener.onSnapLongPress();
                        break;
                    case 3:
                        CameraSnapView.this.mSnapListener.onSnapLongPressCancelOut();
                        break;
                    case 4:
                        CameraSnapView.this.mSnapListener.onSnapLongPressCancelIn();
                        break;
                }
            }
        }
    };
    private int mHeight;
    private boolean mMissTaken;
    private long mPressDownTime;
    private long mPressUpTime;
    private SnapListener mSnapListener;
    private int mWidth;

    public interface SnapListener {
        boolean canSnap();

        void onSnapClick();

        void onSnapLongPress();

        void onSnapLongPressCancelIn();

        void onSnapLongPressCancelOut();

        void onSnapPrepare();

        void onTrackSnapMissTaken(long j);

        void onTrackSnapTaken(long j);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SnapEvent {
    }

    public void setSnapListener(SnapListener snapListener) {
        this.mSnapListener = snapListener;
    }

    public CameraSnapView(Context context) {
        super(context);
        initView();
    }

    public CameraSnapView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public CameraSnapView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    protected void onMeasure(int i, int i2) {
        if (MeasureSpec.getMode(i) != 1073741824) {
            super.onMeasure(i, i2);
            return;
        }
        this.mWidth = MeasureSpec.getSize(i);
        this.mHeight = MeasureSpec.getSize(i2);
        setMeasuredDimension(this.mWidth, this.mHeight);
        if (this.cameraSnapAnimateDrawable != null) {
            this.cameraSnapAnimateDrawable.setWidthHeight((float) this.mWidth, (float) this.mHeight);
        }
    }

    private void initView() {
    }

    private void setImageBitmap(Bitmap bitmap) {
        float height;
        this.mExtraBitmap = bitmap;
        float width = ((float) getWidth()) * RECT_WIDTH;
        float height2 = ((float) getHeight()) * RECT_WIDTH;
        if (width / height2 > ((float) bitmap.getWidth()) / ((float) bitmap.getHeight())) {
            height = height2 / ((float) bitmap.getHeight());
        } else {
            height = width / ((float) bitmap.getWidth());
        }
        this.mExtraBitmapMatrix = new Matrix();
        this.mExtraBitmapMatrix.postScale(height, height);
        this.mExtraBitmapMatrix.postTranslate((((float) getWidth()) - width) / 2.0f, (((float) getHeight()) - height2) / 2.0f);
        this.mExtraBitmapPaint = new Paint();
        this.mExtraBitmapPaint.setAntiAlias(true);
        this.mExtraBitmapPaint.setFilterBitmap(true);
    }

    public void setParameters(int i, boolean z, boolean z2) {
        this.mPressUpTime = 0;
        this.mCurrentMode = i;
        if (this.cameraSnapAnimateDrawable == null) {
            this.cameraSnapAnimateDrawable = new CameraSnapAnimateDrawable(getContext());
            this.cameraSnapAnimateDrawable.setCallback(this);
            this.cameraSnapAnimateDrawable.initParameters(i, z2);
            return;
        }
        this.cameraSnapAnimateDrawable.resetRecordingState();
        if (z) {
            this.cameraSnapAnimateDrawable.initTargetValues(i, z2);
            this.cameraSnapAnimateDrawable.startModeChangeAnimation();
            return;
        }
        this.cameraSnapAnimateDrawable.initParameters(i, z2);
    }

    public void triggerAnimation(BottomAnimationConfig bottomAnimationConfig) {
        switch (this.mCurrentMode) {
            case 161:
            case 168:
            case 169:
            case 172:
            case 173:
            case 174:
                if (this.cameraSnapAnimateDrawable != null) {
                    this.cameraSnapAnimateDrawable.startRecordAnimation(bottomAnimationConfig);
                    return;
                }
                return;
            case 162:
            case 166:
            case 170:
                if ((bottomAnimationConfig.mIsVideoBokeh || !bottomAnimationConfig.mIsStart) && this.cameraSnapAnimateDrawable != null) {
                    this.cameraSnapAnimateDrawable.startRecordAnimation(bottomAnimationConfig);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void prepareRecording(BottomAnimationConfig bottomAnimationConfig) {
        this.cameraSnapAnimateDrawable.prepareRecording(bottomAnimationConfig);
    }

    public void pauseRecording() {
        this.cameraSnapAnimateDrawable.pauseRecording();
    }

    public void resumeRecording() {
        this.cameraSnapAnimateDrawable.resumeRecording();
    }

    public void directFinishRecord() {
        this.cameraSnapAnimateDrawable.directFinishRecord();
    }

    public void addSegmentNow() {
        this.cameraSnapAnimateDrawable.addSegmentNow();
    }

    public boolean hasSegments() {
        return this.cameraSnapAnimateDrawable.hasSegments();
    }

    public void removeLastSegment() {
        this.cameraSnapAnimateDrawable.removeLastSegment();
    }

    public void invalidateDrawable(Drawable drawable) {
        invalidate();
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (isSnapEnableClick()) {
            int action = motionEvent.getAction();
            long j = 0;
            if (action != 6) {
                switch (action) {
                    case 0:
                        switch (this.mCurrentMode) {
                            case 161:
                            case 162:
                            case 166:
                            case 168:
                            case 169:
                            case 170:
                            case 172:
                            case 173:
                            case 174:
                                break;
                            default:
                                if (this.mSnapListener.canSnap()) {
                                    this.cameraSnapAnimateDrawable.startScaleDownAnimation();
                                    break;
                                }
                                if (!this.mMissTaken) {
                                    this.mMissTaken = true;
                                    if (this.mPressUpTime > 0) {
                                        this.mSnapListener.onTrackSnapMissTaken(System.currentTimeMillis() - this.mPressUpTime);
                                    }
                                }
                                return false;
                        }
                        this.mMissTaken = false;
                        this.mSnapListener.onSnapPrepare();
                        this.mPressDownTime = System.currentTimeMillis();
                        if (this.mPressUpTime > 0) {
                            this.mSnapListener.onTrackSnapTaken(this.mPressDownTime - this.mPressUpTime);
                        }
                        this.mHandler.sendEmptyMessageDelayed(2, 800);
                        break;
                    case 1:
                    case 3:
                        this.mHandler.removeCallbacksAndMessages(null);
                        this.mPressUpTime = System.currentTimeMillis();
                        if (this.mPressUpTime - this.mPressDownTime < 800 && inRegion((int) motionEvent.getRawX(), (int) motionEvent.getRawY())) {
                            this.mHandler.sendEmptyMessage(1);
                            break;
                        }
                    case 2:
                        return false;
                }
            }
            this.mPressUpTime = System.currentTimeMillis();
            long j2 = this.mPressUpTime - this.mPressDownTime;
            if (j2 > 800) {
                if (inRegion((int) motionEvent.getRawX(), (int) motionEvent.getRawY())) {
                    this.mHandler.sendEmptyMessage(4);
                } else {
                    this.mHandler.sendEmptyMessage(3);
                }
            }
            if (j2 <= 120) {
                j = 120 - j2;
            }
            switch (this.mCurrentMode) {
                case 161:
                case 162:
                case 166:
                case 168:
                case 169:
                case 170:
                case 172:
                case 173:
                case 174:
                    break;
                default:
                    this.cameraSnapAnimateDrawable.startScaleUpAnimation(j, null);
                    break;
            }
            return true;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("this view is disabled. action=");
        stringBuilder.append(motionEvent.getAction());
        Log.d(str, stringBuilder.toString());
        return super.onTouchEvent(motionEvent);
    }

    private boolean inRegion(int i, int i2) {
        Rect rect = new Rect();
        getGlobalVisibleRect(rect);
        return rect.contains(i, i2);
    }

    public void startRing() {
        setImageBitmap(BitmapFactory.decodeResource(getResources(), R.drawable.v6_ic_audio_shutter_button_normal));
        this.cameraSnapAnimateDrawable.startRingAnimation();
    }

    public void stopRing() {
        recycleBitmap();
        this.cameraSnapAnimateDrawable.stopRingAnimation();
    }

    public void hideRoundPaintItem() {
        this.cameraSnapAnimateDrawable.hideRoundPaintItem();
    }

    public void showRoundPaintItem() {
        this.cameraSnapAnimateDrawable.showRoundPaintItem();
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.cameraSnapAnimateDrawable != null) {
            this.cameraSnapAnimateDrawable.draw(canvas);
        }
        if (this.mExtraBitmap != null) {
            canvas.drawBitmap(this.mExtraBitmap, this.mExtraBitmapMatrix, this.mExtraBitmapPaint);
        }
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.cameraSnapAnimateDrawable != null) {
            this.cameraSnapAnimateDrawable.cancelAnimation();
            this.cameraSnapAnimateDrawable.setCallback(null);
        }
        recycleBitmap();
    }

    private void recycleBitmap() {
        if (this.mExtraBitmap != null) {
            this.mExtraBitmap.recycle();
            this.mExtraBitmap = null;
        }
    }

    public boolean performClick() {
        if (!Util.isAccessible()) {
            return super.performClick();
        }
        super.performClick();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler.sendEmptyMessage(1);
        return true;
    }

    public void setSnapClickEnable(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setClickEnable: ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        this.mEnableSnapClick = z;
    }

    public boolean isSnapEnableClick() {
        return this.mEnableSnapClick;
    }
}
