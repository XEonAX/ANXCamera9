package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Align;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Scroller;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;

public class HorizontalSlideView extends View {
    private HorizontalDrawAdapter mDrawAdapter;
    private GestureDetector mGestureDetector;
    private OnGestureListener mGestureListener = new SimpleOnGestureListener() {
        public boolean onDown(MotionEvent motionEvent) {
            HorizontalSlideView.this.mScroller.forceFinished(true);
            HorizontalSlideView.this.mNeedJustify = false;
            return true;
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            HorizontalSlideView.this.scroll((int) (motionEvent.getX() - HorizontalSlideView.this.mOriginX));
            return true;
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            HorizontalSlideView.this.mIsScrollingPerformed = true;
            if (HorizontalSlideView.this.mPositionX == HorizontalSlideView.this.mMinX && f < 0.0f) {
                return false;
            }
            if (HorizontalSlideView.this.mPositionX == HorizontalSlideView.this.mMaxX && f > 0.0f) {
                return false;
            }
            HorizontalSlideView.this.setPositionX((int) (((float) HorizontalSlideView.this.mPositionX) + f));
            return true;
        }

        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            HorizontalSlideView.this.flingX(-((int) f));
            return true;
        }
    };
    private boolean mIsScrollingPerformed;
    private boolean mJustifyEnabled = true;
    private int mMaxX = 0;
    private int mMinX = 0;
    private boolean mNeedJustify;
    private OnItemSelectListener mOnItemSelectListener;
    private OnPositionSelectListener mOnPositionSelectListener;
    protected float mOriginX;
    protected int mPositionX = 0;
    protected Scroller mScroller;
    protected int mSelectedItemIndex;
    private boolean mTouchDown;

    public static abstract class HorizontalDrawAdapter {
        public abstract void draw(int i, Canvas canvas, boolean z);

        public abstract Align getAlign(int i);

        public abstract int getCount();

        public abstract float measureGap(int i);

        public abstract float measureWidth(int i);
    }

    public interface OnPositionSelectListener {
        void onPositionSelect(HorizontalSlideView horizontalSlideView, float f);
    }

    public interface OnItemSelectListener {
        void onItemSelect(HorizontalSlideView horizontalSlideView, int i);
    }

    protected void init(Context context) {
        this.mGestureDetector = new GestureDetector(context, this.mGestureListener);
        this.mGestureDetector.setIsLongpressEnabled(false);
        this.mScroller = new Scroller(context);
    }

    public HorizontalSlideView(Context context) {
        super(context);
        init(context);
    }

    public HorizontalSlideView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public HorizontalSlideView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    public void setOnItemSelectListener(OnItemSelectListener onItemSelectListener) {
        this.mOnItemSelectListener = onItemSelectListener;
    }

    public void setOnPositionSelectListener(OnPositionSelectListener onPositionSelectListener) {
        this.mOnPositionSelectListener = onPositionSelectListener;
    }

    public void setJustifyEnabled(boolean z) {
        this.mJustifyEnabled = z;
    }

    private float calculateLength(int i, int i2) {
        float f;
        float f2 = this.mOriginX;
        float f3 = 0.0f;
        if (this.mDrawAdapter != null) {
            int count;
            int i3;
            int i4;
            boolean isLayoutRTL = Util.isLayoutRTL(getContext());
            if (isLayoutRTL) {
                count = this.mDrawAdapter.getCount() - 1;
            } else {
                count = 0;
            }
            if (isLayoutRTL) {
                i3 = 0;
            } else {
                i3 = this.mDrawAdapter.getCount() - 1;
            }
            if (isLayoutRTL) {
                i4 = -1;
            } else {
                i4 = 1;
            }
            f = 0.0f;
            float f4 = f;
            float f5 = f4;
            for (int i5 = 0; i5 < this.mDrawAdapter.getCount(); i5++) {
                float f6;
                int i6 = (i5 * i4) + count;
                int i7 = i6 == count ? 1 : 0;
                int i8 = i6 == i3 ? 1 : 0;
                float itemWidth = getItemWidth(i6);
                float f7 = itemWidth / 2.0f;
                if (i7 != 0) {
                    f5 = this.mOriginX - f7;
                }
                if (i7 != 0) {
                    f6 = f2;
                } else {
                    f6 = f5 + f7;
                }
                f5 += i8 != 0 ? 0.0f : getItemGap(i5) + itemWidth;
                if (i6 == i) {
                    int i9 = i2;
                    f = f6;
                } else if (i6 == i2) {
                    f4 = f6;
                }
            }
            f3 = f4;
        } else {
            f = 0.0f;
        }
        return Math.abs(f3 - f);
    }

    public void setDrawAdapter(HorizontalDrawAdapter horizontalDrawAdapter) {
        this.mDrawAdapter = horizontalDrawAdapter;
        this.mNeedJustify = false;
        this.mSelectedItemIndex = 0;
        this.mScroller.forceFinished(true);
        if (this.mDrawAdapter != null) {
            this.mMaxX = this.mMinX + ((int) calculateLength(0, this.mDrawAdapter.getCount() - 1));
        }
        if (Util.isLayoutRTL(getContext())) {
            this.mPositionX = this.mMaxX;
        } else {
            this.mPositionX = this.mMinX;
        }
        invalidate();
    }

    public void setSelection(int i) {
        if (this.mSelectedItemIndex != i) {
            this.mNeedJustify = false;
            this.mScroller.forceFinished(true);
            if (this.mDrawAdapter != null) {
                if (i >= this.mDrawAdapter.getCount()) {
                    i = this.mDrawAdapter.getCount() - 1;
                }
                if (Util.isLayoutRTL(getContext())) {
                    this.mPositionX = this.mMaxX - ((int) calculateLength(0, i));
                } else {
                    this.mPositionX = this.mMinX + ((int) calculateLength(0, i));
                }
            }
            select(i);
            invalidate();
        }
    }

    public void setSelection(float f) {
        if (Util.isLayoutRTL(getContext()) && this.mDrawAdapter != null) {
            f = 1.0f - f;
        }
        this.mNeedJustify = false;
        this.mScroller.forceFinished(true);
        this.mPositionX = (int) (f * ((float) (this.mMaxX - this.mMinX)));
        invalidate();
    }

    public int getSelectedItemIndex() {
        return this.mSelectedItemIndex;
    }

    private void select(int i) {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            if (!(this.mSelectedItemIndex == i && isScrolling())) {
                this.mSelectedItemIndex = i;
                if (this.mOnItemSelectListener != null) {
                    this.mOnItemSelectListener.onItemSelect(this, this.mSelectedItemIndex);
                }
            }
            if (this.mOnPositionSelectListener != null) {
                float f = ((float) this.mPositionX) / ((float) (this.mMaxX - this.mMinX));
                OnPositionSelectListener onPositionSelectListener = this.mOnPositionSelectListener;
                if (Util.isLayoutRTL(getContext())) {
                    f = 1.0f - f;
                }
                onPositionSelectListener.onPositionSelect(this, f);
            }
        }
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mOriginX = ((float) i) / 2.0f;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean onTouchEvent = this.mGestureDetector.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action != 3) {
            switch (action) {
                case 0:
                    this.mTouchDown = true;
                    break;
                case 1:
                    break;
            }
        }
        this.mTouchDown = false;
        this.mNeedJustify = true;
        invalidate();
        return onTouchEvent;
    }

    private void setPositionX(int i) {
        this.mPositionX = i;
        if (this.mPositionX < this.mMinX) {
            this.mPositionX = this.mMinX;
        } else if (this.mPositionX > this.mMaxX) {
            this.mPositionX = this.mMaxX;
        }
        invalidate();
    }

    private void flingX(int i) {
        this.mIsScrollingPerformed = true;
        this.mScroller.fling(this.mPositionX, 0, i, 0, this.mMinX, this.mMaxX, 0, 0);
        invalidate();
    }

    private void scroll(int i) {
        if (i != 0) {
            if (this.mPositionX + i < this.mMinX) {
                i = this.mMinX - this.mPositionX;
            } else if (this.mPositionX + i > this.mMaxX) {
                i = this.mMaxX - this.mPositionX;
            }
            this.mIsScrollingPerformed = true;
            this.mScroller.startScroll(this.mPositionX, 0, i, 0);
            invalidate();
        }
    }

    private float getItemGap(int i) {
        return this.mDrawAdapter.measureGap(i);
    }

    private float getItemWidth(int i) {
        return this.mDrawAdapter.measureWidth(i);
    }

    protected void onDraw(Canvas canvas) {
        float f;
        Canvas canvas2 = canvas;
        if (this.mScroller.computeScrollOffset()) {
            this.mPositionX = this.mScroller.getCurrX();
            invalidate();
        }
        boolean z = false;
        if (this.mScroller.isFinished() && !this.mTouchDown) {
            this.mIsScrollingPerformed = false;
        }
        float f2 = this.mOriginX - ((float) this.mPositionX);
        float f3 = 2.0f;
        float height = ((float) getHeight()) / 2.0f;
        float f4 = 0.0f;
        if (this.mDrawAdapter != null) {
            int count;
            int i;
            int i2;
            boolean isLayoutRTL = Util.isLayoutRTL(getContext());
            if (isLayoutRTL) {
                count = this.mDrawAdapter.getCount() - 1;
            } else {
                count = 0;
            }
            if (isLayoutRTL) {
                i = 0;
            } else {
                i = this.mDrawAdapter.getCount() - 1;
            }
            if (isLayoutRTL) {
                i2 = -1;
            } else {
                i2 = 1;
            }
            float f5 = f2;
            int i3 = 0;
            float f6 = 0.0f;
            float f7 = f6;
            float f8 = f7;
            int i4 = 1;
            while (i3 < this.mDrawAdapter.getCount()) {
                float f9;
                int i5 = (i3 * i2) + count;
                boolean z2 = i5 == count ? true : z;
                boolean z3 = i5 == i ? true : z;
                float itemWidth = getItemWidth(i5);
                float f10 = itemWidth / f3;
                if (z2) {
                    f6 = 0.0f;
                }
                if (z3) {
                    f9 = 0.0f;
                } else {
                    f9 = getItemGap(i5) / f3;
                }
                if (z2) {
                    f7 = f2 - f10;
                }
                if (z2) {
                    f5 = f2;
                } else {
                    f5 = f7 + f10;
                }
                if (i4 != 0) {
                    float f11 = f5 - this.mOriginX;
                    if ((f11 <= 0.0f && (-f11) <= f10 + f9) || (f11 > 0.0f && f11 <= f10 + r13)) {
                        select(i5);
                        f8 = f11;
                        i4 = 0;
                    }
                }
                f7 += z3 ? 0.0f : itemWidth + getItemGap(i5);
                i3++;
                f6 = f9;
                z = false;
                f3 = 2.0f;
            }
            this.mMaxX = (int) (f5 - f2);
            int i6 = 0;
            while (i6 < this.mDrawAdapter.getCount()) {
                float f12;
                int i7 = (i6 * i2) + count;
                Object obj = i7 == count ? 1 : null;
                Object obj2 = i7 == i ? 1 : null;
                f5 = getItemWidth(i7);
                float f13 = f5 / 2.0f;
                if (obj != null) {
                    f7 = f2 - f13;
                }
                if (obj != null) {
                    f12 = f2;
                } else {
                    f12 = f7 + f13;
                }
                f13 = f7 + f5;
                if (f13 >= f4 && f7 <= ((float) getWidth())) {
                    canvas.save();
                    if (this.mDrawAdapter.getAlign(i7) == Align.LEFT) {
                        canvas2.translate(f7, height);
                    } else if (this.mDrawAdapter.getAlign(i7) == Align.CENTER) {
                        canvas2.translate(f12, height);
                    } else {
                        canvas2.translate(f13, height);
                    }
                    this.mDrawAdapter.draw(i7, canvas2, this.mSelectedItemIndex == i7);
                    canvas.restore();
                }
                f7 += obj2 != null ? 0.0f : f5 + getItemGap(i7);
                i6++;
                f4 = 0.0f;
            }
            f = f8;
        } else {
            f = 0.0f;
        }
        if (this.mJustifyEnabled && this.mNeedJustify && this.mScroller.isFinished()) {
            this.mNeedJustify = false;
            scroll((int) f);
        }
    }

    public boolean isScrolling() {
        return this.mIsScrollingPerformed;
    }
}
