package com.android.camera2.autozoom;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.util.Size;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.AutoZoomModuleProtocol;
import com.android.camera.protocol.ModeProtocol.AutoZoomViewProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class AutoZoomView extends View implements OnTouchListener, IObjectView {
    public static final float TOLERATE_Y = 10.0f;
    private int[] mAutoZoomActiveObjects;
    private RectF mAutoZoomBound;
    private int[] mAutoZoomPausedObjects;
    private int mAutoZoomStatus;
    private AtomicBoolean mBeginLost;
    private float mBoundWidth;
    private AtomicBoolean mEndLost;
    private Paint mPathPaint;
    private Size mPreviewSize;
    private Paint mRectPaint;
    private int mTolerateY;
    List<AutoZoomTracker> mTrackers;
    private AtomicBoolean mViewActive;
    private AtomicBoolean mViewEnabled;

    public AutoZoomView(Context context) {
        this(context, null);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public AutoZoomView(Context context, @Nullable AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        this.mTrackers = new ArrayList();
        this.mBoundWidth = 1.0f;
        init();
    }

    private void init() {
        this.mViewEnabled = new AtomicBoolean(false);
        this.mViewActive = new AtomicBoolean(false);
        this.mBeginLost = new AtomicBoolean(false);
        this.mEndLost = new AtomicBoolean(false);
        this.mRectPaint = new Paint();
        this.mRectPaint.setAntiAlias(true);
        this.mRectPaint.setXfermode(new PorterDuffXfermode(Mode.CLEAR));
        this.mPathPaint = new Paint();
        this.mPathPaint.setAntiAlias(true);
        this.mPathPaint.setStrokeWidth(this.mBoundWidth);
        this.mPathPaint.setStyle(Style.STROKE);
        this.mPathPaint.setColor(getContext().getColor(R.color.white_80));
        this.mTolerateY = AutoZoomUtils.dp2px(getContext(), 10.0f);
        setWillNotDraw(false);
        setOnTouchListener(this);
        setLayerType(2, null);
    }

    public void setViewEnable(boolean z) {
        this.mViewEnabled.getAndSet(z);
    }

    public boolean isViewEnabled() {
        return this.mViewEnabled.get();
    }

    public void setViewVisibility(final int i) {
        post(new Runnable() {
            public void run() {
                AutoZoomView.this.setVisibility(i);
            }
        });
    }

    public boolean isViewVisibile() {
        return getVisibility() == 0;
    }

    public void setViewActive(boolean z) {
        this.mBeginLost.getAndSet(false);
        this.mEndLost.getAndSet(false);
        this.mViewActive.getAndSet(z);
    }

    public boolean isViewActive() {
        return this.mViewActive.get();
    }

    public void clear(final int i) {
        if (i != -1) {
            post(new Runnable() {
                public void run() {
                    AutoZoomView.this.mTrackers.clear();
                    AutoZoomView.this.mAutoZoomStatus = 0;
                    AutoZoomView.this.mAutoZoomBound = null;
                    AutoZoomView.this.mAutoZoomPausedObjects = null;
                    AutoZoomView.this.mAutoZoomActiveObjects = null;
                    if (AutoZoomView.this.getVisibility() != i) {
                        AutoZoomView.this.setVisibility(i);
                    }
                }
            });
        }
        postInvalidate();
    }

    public boolean isMoving() {
        return (this.mAutoZoomStatus & 32) == 32;
    }

    public void feedData(AutoZoomCaptureResult autoZoomCaptureResult) {
        if (this.mViewEnabled.get() && this.mViewActive.get() && this.mPreviewSize != null) {
            float[] autoZoomBounds = autoZoomCaptureResult.getAutoZoomBounds();
            if (autoZoomBounds != null) {
                this.mAutoZoomStatus = autoZoomCaptureResult.getAutoZoomStatus();
                int[] autoZoomActiveObjects = autoZoomCaptureResult.getAutoZoomActiveObjects();
                List arrayList = new ArrayList();
                if (autoZoomActiveObjects != null) {
                    for (int i = 0; i < autoZoomActiveObjects.length; i++) {
                        arrayList.add(new AutoZoomTracker(autoZoomActiveObjects[i], fillBoundsInOverlay(i, autoZoomCaptureResult.getAutoZoomObjectBoundsStabilized())));
                    }
                }
                this.mTrackers = arrayList;
                this.mAutoZoomPausedObjects = autoZoomCaptureResult.getAutoZoomPausedObjects();
                this.mAutoZoomActiveObjects = autoZoomCaptureResult.getAutoZoomActiveObjects();
                if (isLosting() && !this.mBeginLost.get()) {
                    this.mBeginLost.getAndSet(true);
                }
                if (isLost() && this.mBeginLost.get() && !this.mEndLost.get()) {
                    this.mEndLost.getAndSet(true);
                    AutoZoomModuleProtocol autoZoomModuleProtocol = (AutoZoomModuleProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(215);
                    if (autoZoomModuleProtocol != null) {
                        autoZoomModuleProtocol.onTrackLost();
                    }
                }
                this.mAutoZoomBound = fillBoundsInOverlay(0, autoZoomBounds);
                if (this.mAutoZoomBound != null) {
                    postInvalidate();
                }
            }
        }
    }

    public void setPreviewSize(Size size) {
        this.mPreviewSize = size;
    }

    public Size getPreviewSize() {
        return this.mPreviewSize;
    }

    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null && topAlert.isExtraMenuShowing()) {
                return false;
            }
        }
        return onViewTouchEvent(motionEvent);
    }

    public boolean onViewTouchEvent(MotionEvent motionEvent) {
        if (!this.mViewEnabled.get() || !ModuleManager.isVideoModule() || motionEvent.getY() < ((float) this.mTolerateY)) {
            return false;
        }
        switch (motionEvent.getAction()) {
            case 0:
                if (this.mViewEnabled.get()) {
                    return true;
                }
                break;
            case 1:
                tapAt(motionEvent.getX(), motionEvent.getY());
                return true;
        }
        return false;
    }

    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mViewEnabled.get() && this.mViewActive.get() && this.mAutoZoomBound != null) {
            canvas.drawColor(getContext().getColor(R.color.semi_transparent_dark));
            canvas.drawRect(this.mAutoZoomBound, this.mRectPaint);
            if (!isLost()) {
                canvas.drawRect(this.mAutoZoomBound, this.mPathPaint);
            }
        }
    }

    private RectF fillBoundsInOverlay(int i, float[] fArr) {
        if (this.mPreviewSize == null || fArr == null) {
            return null;
        }
        i *= 4;
        int i2 = i + 3;
        if (fArr.length <= i2) {
            return null;
        }
        float f = fArr[i];
        float f2 = fArr[i + 1];
        RectF rectF = new RectF(f / ((float) this.mPreviewSize.getWidth()), f2 / ((float) this.mPreviewSize.getHeight()), (f + fArr[i + 2]) / ((float) this.mPreviewSize.getWidth()), (f2 + fArr[i2]) / ((float) this.mPreviewSize.getHeight()));
        AutoZoomUtils.fromVidhanceCoordinateSystem(rectF);
        AutoZoomUtils.rotateFromVidhance(getContext(), rectF);
        AutoZoomUtils.normalizedRectToSize(rectF, new Size(getWidth(), getHeight()));
        return rectF;
    }

    private RectF getTapedRect(float f, float f2) {
        f = (f / ((float) getWidth())) - 0.1f;
        f2 = (f2 / ((float) getHeight())) - 0.1f;
        return new RectF(f, f2, f + 0.2f, 0.2f + f2);
    }

    private void tapAt(float f, float f2) {
        if (this.mViewEnabled.get() && this.mPreviewSize != null) {
            AutoZoomModuleProtocol autoZoomModuleProtocol = (AutoZoomModuleProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(215);
            if (this.mTrackers.size() >= 1 && autoZoomModuleProtocol != null) {
                autoZoomModuleProtocol.setAutoZoomStopCapture(0);
            }
            RectF tapedRect = getTapedRect(f, f2);
            AutoZoomUtils.rotateToVidhance(getContext(), tapedRect);
            AutoZoomUtils.toVidhanceCoordinateSystem(tapedRect);
            AutoZoomUtils.normalizedRectToSize(tapedRect, this.mPreviewSize);
            AutoZoomViewProtocol autoZoomViewProtocol = (AutoZoomViewProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(214);
            if (autoZoomViewProtocol != null) {
                setViewActive(true);
                if (!isViewVisibile()) {
                    setVisibility(0);
                }
                autoZoomViewProtocol.onTrackingStarted(tapedRect);
            }
        }
    }

    private boolean isTrackingNotLost() {
        if (this.mAutoZoomActiveObjects == null || this.mAutoZoomPausedObjects != null) {
            return false;
        }
        return true;
    }

    private boolean isLosting() {
        if (isMoving()) {
            if (this.mAutoZoomActiveObjects == null || this.mAutoZoomPausedObjects == null) {
                if (this.mAutoZoomActiveObjects == null && this.mAutoZoomPausedObjects == null) {
                    return true;
                }
                return false;
            } else if (this.mAutoZoomActiveObjects[0] == this.mAutoZoomPausedObjects[0]) {
                return true;
            }
        }
        return false;
    }

    private boolean isLost() {
        if (this.mAutoZoomActiveObjects == null && this.mAutoZoomPausedObjects == null && !isMoving()) {
            return true;
        }
        return false;
    }
}
