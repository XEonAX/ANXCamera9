package android.support.v4.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.ColorInt;
import android.support.annotation.DrawableRes;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.ViewDragHelper.Callback;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class SlidingPaneLayout extends ViewGroup {
    private static final int DEFAULT_FADE_COLOR = -858993460;
    private static final int DEFAULT_OVERHANG_SIZE = 32;
    static final SlidingPanelLayoutImpl IMPL;
    private static final int MIN_FLING_VELOCITY = 400;
    private static final String TAG = "SlidingPaneLayout";
    private boolean mCanSlide;
    private int mCoveredFadeColor;
    private final ViewDragHelper mDragHelper;
    private boolean mFirstLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsUnableToDrag;
    private final int mOverhangSize;
    private PanelSlideListener mPanelSlideListener;
    private int mParallaxBy;
    private float mParallaxOffset;
    private final ArrayList<DisableLayerRunnable> mPostedRunnables;
    private boolean mPreservedOpenState;
    private Drawable mShadowDrawableLeft;
    private Drawable mShadowDrawableRight;
    private float mSlideOffset;
    private int mSlideRange;
    private View mSlideableView;
    private int mSliderFadeColor;
    private final Rect mTmpRect;

    class AccessibilityDelegate extends AccessibilityDelegateCompat {
        private final Rect mTmpRect = new Rect();

        AccessibilityDelegate() {
        }

        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
            AccessibilityNodeInfoCompat superNode = AccessibilityNodeInfoCompat.obtain(info);
            super.onInitializeAccessibilityNodeInfo(host, superNode);
            copyNodeInfoNoChildren(info, superNode);
            superNode.recycle();
            info.setClassName(SlidingPaneLayout.class.getName());
            info.setSource(host);
            ViewParent parent = ViewCompat.getParentForAccessibility(host);
            if (parent instanceof View) {
                info.setParent((View) parent);
            }
            int childCount = SlidingPaneLayout.this.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = SlidingPaneLayout.this.getChildAt(i);
                if (!filter(child) && child.getVisibility() == 0) {
                    ViewCompat.setImportantForAccessibility(child, 1);
                    info.addChild(child);
                }
            }
        }

        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            event.setClassName(SlidingPaneLayout.class.getName());
        }

        public boolean onRequestSendAccessibilityEvent(ViewGroup host, View child, AccessibilityEvent event) {
            if (filter(child)) {
                return false;
            }
            return super.onRequestSendAccessibilityEvent(host, child, event);
        }

        public boolean filter(View child) {
            return SlidingPaneLayout.this.isDimmed(child);
        }

        private void copyNodeInfoNoChildren(AccessibilityNodeInfoCompat dest, AccessibilityNodeInfoCompat src) {
            Rect rect = this.mTmpRect;
            src.getBoundsInParent(rect);
            dest.setBoundsInParent(rect);
            src.getBoundsInScreen(rect);
            dest.setBoundsInScreen(rect);
            dest.setVisibleToUser(src.isVisibleToUser());
            dest.setPackageName(src.getPackageName());
            dest.setClassName(src.getClassName());
            dest.setContentDescription(src.getContentDescription());
            dest.setEnabled(src.isEnabled());
            dest.setClickable(src.isClickable());
            dest.setFocusable(src.isFocusable());
            dest.setFocused(src.isFocused());
            dest.setAccessibilityFocused(src.isAccessibilityFocused());
            dest.setSelected(src.isSelected());
            dest.setLongClickable(src.isLongClickable());
            dest.addAction(src.getActions());
            dest.setMovementGranularities(src.getMovementGranularities());
        }
    }

    private class DisableLayerRunnable implements Runnable {
        final View mChildView;

        DisableLayerRunnable(View childView) {
            this.mChildView = childView;
        }

        public void run() {
            if (this.mChildView.getParent() == SlidingPaneLayout.this) {
                ViewCompat.setLayerType(this.mChildView, 0, null);
                SlidingPaneLayout.this.invalidateChildRegion(this.mChildView);
            }
            SlidingPaneLayout.this.mPostedRunnables.remove(this);
        }
    }

    private class DragHelperCallback extends Callback {
        private DragHelperCallback() {
        }

        public boolean tryCaptureView(View child, int pointerId) {
            if (SlidingPaneLayout.this.mIsUnableToDrag) {
                return false;
            }
            return ((LayoutParams) child.getLayoutParams()).slideable;
        }

        public void onViewDragStateChanged(int state) {
            if (SlidingPaneLayout.this.mDragHelper.getViewDragState() != 0) {
                return;
            }
            if (SlidingPaneLayout.this.mSlideOffset == 0.0f) {
                SlidingPaneLayout.this.updateObscuredViewsVisibility(SlidingPaneLayout.this.mSlideableView);
                SlidingPaneLayout.this.dispatchOnPanelClosed(SlidingPaneLayout.this.mSlideableView);
                SlidingPaneLayout.this.mPreservedOpenState = false;
                return;
            }
            SlidingPaneLayout.this.dispatchOnPanelOpened(SlidingPaneLayout.this.mSlideableView);
            SlidingPaneLayout.this.mPreservedOpenState = true;
        }

        public void onViewCaptured(View capturedChild, int activePointerId) {
            SlidingPaneLayout.this.setAllChildrenVisible();
        }

        public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
            SlidingPaneLayout.this.onPanelDragged(left);
            SlidingPaneLayout.this.invalidate();
        }

        public void onViewReleased(View releasedChild, float xvel, float yvel) {
            int left;
            LayoutParams lp = (LayoutParams) releasedChild.getLayoutParams();
            int startToRight;
            if (SlidingPaneLayout.this.isLayoutRtlSupport()) {
                startToRight = SlidingPaneLayout.this.getPaddingRight() + lp.rightMargin;
                if (xvel < 0.0f || (xvel == 0.0f && SlidingPaneLayout.this.mSlideOffset > 0.5f)) {
                    startToRight += SlidingPaneLayout.this.mSlideRange;
                }
                left = (SlidingPaneLayout.this.getWidth() - startToRight) - SlidingPaneLayout.this.mSlideableView.getWidth();
            } else {
                startToRight = SlidingPaneLayout.this.getPaddingLeft() + lp.leftMargin;
                if (xvel > 0.0f || (xvel == 0.0f && SlidingPaneLayout.this.mSlideOffset > 0.5f)) {
                    left = startToRight + SlidingPaneLayout.this.mSlideRange;
                } else {
                    left = startToRight;
                }
            }
            SlidingPaneLayout.this.mDragHelper.settleCapturedViewAt(left, releasedChild.getTop());
            SlidingPaneLayout.this.invalidate();
        }

        public int getViewHorizontalDragRange(View child) {
            return SlidingPaneLayout.this.mSlideRange;
        }

        public int clampViewPositionHorizontal(View child, int left, int dx) {
            LayoutParams lp = (LayoutParams) SlidingPaneLayout.this.mSlideableView.getLayoutParams();
            int startBound;
            if (SlidingPaneLayout.this.isLayoutRtlSupport()) {
                startBound = SlidingPaneLayout.this.getWidth() - ((SlidingPaneLayout.this.getPaddingRight() + lp.rightMargin) + SlidingPaneLayout.this.mSlideableView.getWidth());
                return Math.max(Math.min(left, startBound), startBound - SlidingPaneLayout.this.mSlideRange);
            }
            startBound = SlidingPaneLayout.this.getPaddingLeft() + lp.leftMargin;
            return Math.min(Math.max(left, startBound), SlidingPaneLayout.this.mSlideRange + startBound);
        }

        public int clampViewPositionVertical(View child, int top, int dy) {
            return child.getTop();
        }

        public void onEdgeDragStarted(int edgeFlags, int pointerId) {
            SlidingPaneLayout.this.mDragHelper.captureChildView(SlidingPaneLayout.this.mSlideableView, pointerId);
        }
    }

    public static class LayoutParams extends MarginLayoutParams {
        private static final int[] ATTRS = new int[]{16843137};
        Paint dimPaint;
        boolean dimWhenOffset;
        boolean slideable;
        public float weight = 0.0f;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams source) {
            super(source);
        }

        public LayoutParams(MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(LayoutParams source) {
            super(source);
            this.weight = source.weight;
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, ATTRS);
            this.weight = a.getFloat(0, 0.0f);
            a.recycle();
        }
    }

    public interface PanelSlideListener {
        void onPanelClosed(View view);

        void onPanelOpened(View view);

        void onPanelSlide(View view, float f);
    }

    static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };
        boolean isOpen;

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.isOpen = in.readInt() != 0;
        }

        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.isOpen);
        }
    }

    public static class SimplePanelSlideListener implements PanelSlideListener {
        public void onPanelSlide(View panel, float slideOffset) {
        }

        public void onPanelOpened(View panel) {
        }

        public void onPanelClosed(View panel) {
        }
    }

    interface SlidingPanelLayoutImpl {
        void invalidateChildRegion(SlidingPaneLayout slidingPaneLayout, View view);
    }

    static class SlidingPanelLayoutImplBase implements SlidingPanelLayoutImpl {
        SlidingPanelLayoutImplBase() {
        }

        public void invalidateChildRegion(SlidingPaneLayout parent, View child) {
            ViewCompat.postInvalidateOnAnimation(parent, child.getLeft(), child.getTop(), child.getRight(), child.getBottom());
        }
    }

    static class SlidingPanelLayoutImplJB extends SlidingPanelLayoutImplBase {
        private Method mGetDisplayList;
        private Field mRecreateDisplayList;

        SlidingPanelLayoutImplJB() {
            try {
                this.mGetDisplayList = View.class.getDeclaredMethod("getDisplayList", (Class[]) null);
            } catch (NoSuchMethodException e) {
                Log.e(SlidingPaneLayout.TAG, "Couldn't fetch getDisplayList method; dimming won't work right.", e);
            }
            try {
                this.mRecreateDisplayList = View.class.getDeclaredField("mRecreateDisplayList");
                this.mRecreateDisplayList.setAccessible(true);
            } catch (NoSuchFieldException e2) {
                Log.e(SlidingPaneLayout.TAG, "Couldn't fetch mRecreateDisplayList field; dimming will be slow.", e2);
            }
        }

        public void invalidateChildRegion(SlidingPaneLayout parent, View child) {
            if (this.mGetDisplayList == null || this.mRecreateDisplayList == null) {
                child.invalidate();
                return;
            }
            try {
                this.mRecreateDisplayList.setBoolean(child, true);
                this.mGetDisplayList.invoke(child, (Object[]) null);
            } catch (Exception e) {
                Log.e(SlidingPaneLayout.TAG, "Error refreshing display list state", e);
            }
            super.invalidateChildRegion(parent, child);
        }
    }

    static class SlidingPanelLayoutImplJBMR1 extends SlidingPanelLayoutImplBase {
        SlidingPanelLayoutImplJBMR1() {
        }

        public void invalidateChildRegion(SlidingPaneLayout parent, View child) {
            ViewCompat.setLayerPaint(child, ((LayoutParams) child.getLayoutParams()).dimPaint);
        }
    }

    static {
        int deviceVersion = VERSION.SDK_INT;
        if (deviceVersion >= 17) {
            IMPL = new SlidingPanelLayoutImplJBMR1();
        } else if (deviceVersion >= 16) {
            IMPL = new SlidingPanelLayoutImplJB();
        } else {
            IMPL = new SlidingPanelLayoutImplBase();
        }
    }

    public SlidingPaneLayout(Context context) {
        this(context, null);
    }

    public SlidingPaneLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SlidingPaneLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mSliderFadeColor = DEFAULT_FADE_COLOR;
        this.mFirstLayout = true;
        this.mTmpRect = new Rect();
        this.mPostedRunnables = new ArrayList();
        float density = context.getResources().getDisplayMetrics().density;
        this.mOverhangSize = (int) ((32.0f * density) + 0.5f);
        ViewConfiguration viewConfig = ViewConfiguration.get(context);
        setWillNotDraw(false);
        ViewCompat.setAccessibilityDelegate(this, new AccessibilityDelegate());
        ViewCompat.setImportantForAccessibility(this, 1);
        this.mDragHelper = ViewDragHelper.create(this, 0.5f, new DragHelperCallback());
        this.mDragHelper.setMinVelocity(400.0f * density);
    }

    public void setParallaxDistance(int parallaxBy) {
        this.mParallaxBy = parallaxBy;
        requestLayout();
    }

    public int getParallaxDistance() {
        return this.mParallaxBy;
    }

    public void setSliderFadeColor(@ColorInt int color) {
        this.mSliderFadeColor = color;
    }

    @ColorInt
    public int getSliderFadeColor() {
        return this.mSliderFadeColor;
    }

    public void setCoveredFadeColor(@ColorInt int color) {
        this.mCoveredFadeColor = color;
    }

    @ColorInt
    public int getCoveredFadeColor() {
        return this.mCoveredFadeColor;
    }

    public void setPanelSlideListener(PanelSlideListener listener) {
        this.mPanelSlideListener = listener;
    }

    void dispatchOnPanelSlide(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelSlide(panel, this.mSlideOffset);
        }
    }

    void dispatchOnPanelOpened(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelOpened(panel);
        }
        sendAccessibilityEvent(32);
    }

    void dispatchOnPanelClosed(View panel) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelClosed(panel);
        }
        sendAccessibilityEvent(32);
    }

    void updateObscuredViewsVisibility(View panel) {
        int left;
        boolean z;
        View view = panel;
        boolean isLayoutRtl = isLayoutRtlSupport();
        int startBound = isLayoutRtl ? getWidth() - getPaddingRight() : getPaddingLeft();
        int endBound = isLayoutRtl ? getPaddingLeft() : getWidth() - getPaddingRight();
        int topBound = getPaddingTop();
        int bottomBound = getHeight() - getPaddingBottom();
        int bottom;
        int top;
        int right;
        if (view == null || !viewIsOpaque(panel)) {
            bottom = 0;
            top = 0;
            right = 0;
            left = 0;
        } else {
            left = panel.getLeft();
            right = panel.getRight();
            top = panel.getTop();
            bottom = panel.getBottom();
        }
        int i = 0;
        int childCount = getChildCount();
        while (i < childCount) {
            View child = getChildAt(i);
            if (child == view) {
                z = isLayoutRtl;
                return;
            }
            int vis;
            int clampedChildLeft = Math.max(isLayoutRtl ? endBound : startBound, child.getLeft());
            int clampedChildTop = Math.max(topBound, child.getTop());
            z = isLayoutRtl;
            int clampedChildRight = Math.min(isLayoutRtl ? startBound : endBound, child.getRight());
            int clampedChildBottom = Math.min(bottomBound, child.getBottom());
            if (clampedChildLeft < left || clampedChildTop < top || clampedChildRight > right || clampedChildBottom > bottom) {
                vis = 0;
            } else {
                vis = 4;
            }
            int i2 = clampedChildRight;
            child.setVisibility(vis);
            i++;
            isLayoutRtl = z;
            view = panel;
        }
        z = isLayoutRtl;
    }

    void setAllChildrenVisible() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 4) {
                child.setVisibility(0);
            }
        }
    }

    private static boolean viewIsOpaque(View v) {
        boolean z = true;
        if (ViewCompat.isOpaque(v)) {
            return true;
        }
        if (VERSION.SDK_INT >= 18) {
            return false;
        }
        Drawable bg = v.getBackground();
        if (bg == null) {
            return false;
        }
        if (bg.getOpacity() != -1) {
            z = false;
        }
        return z;
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mFirstLayout = true;
        int count = this.mPostedRunnables.size();
        for (int i = 0; i < count; i++) {
            ((DisableLayerRunnable) this.mPostedRunnables.get(i)).run();
        }
        this.mPostedRunnables.clear();
    }

    /* JADX WARNING: Missing block: B:35:0x00bb, code:
            if (r14.width == 0) goto L_0x00ac;
     */
    protected void onMeasure(int r33, int r34) {
        /*
        r32 = this;
        r0 = r32;
        r1 = android.view.View.MeasureSpec.getMode(r33);
        r2 = android.view.View.MeasureSpec.getSize(r33);
        r3 = android.view.View.MeasureSpec.getMode(r34);
        r4 = android.view.View.MeasureSpec.getSize(r34);
        r5 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r6 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        if (r1 == r6) goto L_0x0032;
    L_0x0018:
        r7 = r32.isInEditMode();
        if (r7 == 0) goto L_0x002a;
    L_0x001e:
        if (r1 != r5) goto L_0x0023;
    L_0x0020:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x0049;
    L_0x0023:
        if (r1 != 0) goto L_0x0049;
    L_0x0025:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r2 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        goto L_0x0049;
    L_0x002a:
        r5 = new java.lang.IllegalStateException;
        r6 = "Width must have an exact value or MATCH_PARENT";
        r5.<init>(r6);
        throw r5;
    L_0x0032:
        if (r3 != 0) goto L_0x0049;
    L_0x0034:
        r7 = r32.isInEditMode();
        if (r7 == 0) goto L_0x0041;
    L_0x003a:
        if (r3 != 0) goto L_0x0049;
    L_0x003c:
        r3 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r4 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        goto L_0x0049;
    L_0x0041:
        r5 = new java.lang.IllegalStateException;
        r6 = "Height must not be UNSPECIFIED";
        r5.<init>(r6);
        throw r5;
    L_0x0049:
        r7 = 0;
        r8 = -1;
        if (r3 == r5) goto L_0x005e;
    L_0x004d:
        if (r3 == r6) goto L_0x0050;
    L_0x004f:
        goto L_0x006a;
    L_0x0050:
        r9 = r32.getPaddingTop();
        r9 = r4 - r9;
        r10 = r32.getPaddingBottom();
        r9 = r9 - r10;
        r8 = r9;
        r7 = r9;
        goto L_0x006a;
    L_0x005e:
        r9 = r32.getPaddingTop();
        r9 = r4 - r9;
        r10 = r32.getPaddingBottom();
        r8 = r9 - r10;
    L_0x006a:
        r9 = 0;
        r10 = 0;
        r11 = r32.getPaddingLeft();
        r11 = r2 - r11;
        r12 = r32.getPaddingRight();
        r11 = r11 - r12;
        r12 = r11;
        r13 = r32.getChildCount();
        r14 = 2;
        if (r13 <= r14) goto L_0x0086;
    L_0x007f:
        r14 = "SlidingPaneLayout";
        r15 = "onMeasure: More than two child views are not supported.";
        android.util.Log.e(r14, r15);
    L_0x0086:
        r14 = 0;
        r0.mSlideableView = r14;
        r15 = r12;
        r12 = r7;
        r7 = 0;
    L_0x008c:
        r6 = 8;
        r17 = 1;
        r18 = 0;
        if (r7 >= r13) goto L_0x0142;
    L_0x0094:
        r5 = r0.getChildAt(r7);
        r19 = r5.getLayoutParams();
        r14 = r19;
        r14 = (android.support.v4.widget.SlidingPaneLayout.LayoutParams) r14;
        r20 = r1;
        r1 = r5.getVisibility();
        if (r1 != r6) goto L_0x00b0;
    L_0x00a8:
        r1 = 0;
        r14.dimWhenOffset = r1;
    L_0x00ac:
        r21 = r4;
        goto L_0x0136;
    L_0x00b0:
        r1 = r14.weight;
        r1 = (r1 > r18 ? 1 : (r1 == r18 ? 0 : -1));
        if (r1 <= 0) goto L_0x00be;
    L_0x00b6:
        r1 = r14.weight;
        r9 = r9 + r1;
        r1 = r14.width;
        if (r1 != 0) goto L_0x00be;
    L_0x00bd:
        goto L_0x00ac;
    L_0x00be:
        r1 = r14.leftMargin;
        r6 = r14.rightMargin;
        r1 = r1 + r6;
        r6 = r14.width;
        r21 = r4;
        r4 = -2;
        if (r6 != r4) goto L_0x00d3;
    L_0x00ca:
        r4 = r11 - r1;
        r6 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r4 = android.view.View.MeasureSpec.makeMeasureSpec(r4, r6);
    L_0x00d2:
        goto L_0x00e9;
    L_0x00d3:
        r4 = r14.width;
        r6 = -1;
        if (r4 != r6) goto L_0x00e1;
    L_0x00d8:
        r4 = r11 - r1;
        r6 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r4 = android.view.View.MeasureSpec.makeMeasureSpec(r4, r6);
        goto L_0x00d2;
    L_0x00e1:
        r6 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r4 = r14.width;
        r4 = android.view.View.MeasureSpec.makeMeasureSpec(r4, r6);
    L_0x00e9:
        r6 = r14.height;
        r22 = r1;
        r1 = -2;
        if (r6 != r1) goto L_0x00f7;
    L_0x00f0:
        r1 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r6 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r1);
    L_0x00f6:
        goto L_0x010b;
    L_0x00f7:
        r1 = r14.height;
        r6 = -1;
        if (r1 != r6) goto L_0x0103;
    L_0x00fc:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r6 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r1);
        goto L_0x00f6;
    L_0x0103:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r6 = r14.height;
        r6 = android.view.View.MeasureSpec.makeMeasureSpec(r6, r1);
    L_0x010b:
        r1 = r6;
        r5.measure(r4, r1);
        r6 = r5.getMeasuredWidth();
        r23 = r1;
        r1 = r5.getMeasuredHeight();
        r24 = r4;
        r4 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        if (r3 != r4) goto L_0x0125;
    L_0x011f:
        if (r1 <= r12) goto L_0x0125;
    L_0x0121:
        r12 = java.lang.Math.min(r1, r8);
    L_0x0125:
        r15 = r15 - r6;
        if (r15 >= 0) goto L_0x012b;
    L_0x0128:
        r4 = r17;
        goto L_0x012c;
    L_0x012b:
        r4 = 0;
    L_0x012c:
        r14.slideable = r4;
        r4 = r4 | r10;
        r10 = r14.slideable;
        if (r10 == 0) goto L_0x0135;
    L_0x0133:
        r0.mSlideableView = r5;
    L_0x0135:
        r10 = r4;
    L_0x0136:
        r7 = r7 + 1;
        r1 = r20;
        r4 = r21;
        r5 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r6 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x008c;
    L_0x0142:
        r20 = r1;
        r21 = r4;
        if (r10 != 0) goto L_0x0155;
    L_0x0148:
        r1 = (r9 > r18 ? 1 : (r9 == r18 ? 0 : -1));
        if (r1 <= 0) goto L_0x014d;
    L_0x014c:
        goto L_0x0155;
    L_0x014d:
        r26 = r3;
        r30 = r8;
        r27 = r13;
        goto L_0x0296;
    L_0x0155:
        r1 = r0.mOverhangSize;
        r1 = r11 - r1;
        r4 = 0;
    L_0x015a:
        if (r4 >= r13) goto L_0x0290;
    L_0x015c:
        r5 = r0.getChildAt(r4);
        r7 = r5.getVisibility();
        if (r7 != r6) goto L_0x0173;
    L_0x0167:
        r29 = r1;
        r26 = r3;
    L_0x016b:
        r30 = r8;
        r27 = r13;
    L_0x016f:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x0282;
    L_0x0173:
        r7 = r5.getLayoutParams();
        r7 = (android.support.v4.widget.SlidingPaneLayout.LayoutParams) r7;
        r14 = r5.getVisibility();
        if (r14 != r6) goto L_0x0180;
    L_0x017f:
        goto L_0x0167;
    L_0x0180:
        r14 = r7.width;
        if (r14 != 0) goto L_0x018d;
    L_0x0184:
        r14 = r7.weight;
        r14 = (r14 > r18 ? 1 : (r14 == r18 ? 0 : -1));
        if (r14 <= 0) goto L_0x018d;
    L_0x018a:
        r14 = r17;
        goto L_0x018e;
    L_0x018d:
        r14 = 0;
    L_0x018e:
        if (r14 == 0) goto L_0x0193;
    L_0x0190:
        r19 = 0;
        goto L_0x0197;
    L_0x0193:
        r19 = r5.getMeasuredWidth();
    L_0x0197:
        r25 = r19;
        if (r10 == 0) goto L_0x0204;
    L_0x019b:
        r6 = r0.mSlideableView;
        if (r5 == r6) goto L_0x0204;
    L_0x019f:
        r6 = r7.width;
        if (r6 >= 0) goto L_0x01f8;
    L_0x01a3:
        r6 = r25;
        if (r6 > r1) goto L_0x01b3;
    L_0x01a7:
        r26 = r3;
        r3 = r7.weight;
        r3 = (r3 > r18 ? 1 : (r3 == r18 ? 0 : -1));
        if (r3 <= 0) goto L_0x01b0;
    L_0x01af:
        goto L_0x01b5;
    L_0x01b0:
        r29 = r1;
        goto L_0x016b;
    L_0x01b3:
        r26 = r3;
    L_0x01b5:
        if (r14 == 0) goto L_0x01dc;
    L_0x01b7:
        r3 = r7.height;
        r27 = r13;
        r13 = -2;
        if (r3 != r13) goto L_0x01c7;
    L_0x01be:
        r3 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r13 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r3);
        r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x01e8;
    L_0x01c7:
        r3 = r7.height;
        r13 = -1;
        if (r3 != r13) goto L_0x01d3;
    L_0x01cc:
        r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r13 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r3);
    L_0x01d2:
        goto L_0x01e8;
    L_0x01d3:
        r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r13 = r7.height;
        r13 = android.view.View.MeasureSpec.makeMeasureSpec(r13, r3);
        goto L_0x01d2;
    L_0x01dc:
        r27 = r13;
        r3 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r13 = r5.getMeasuredHeight();
        r13 = android.view.View.MeasureSpec.makeMeasureSpec(r13, r3);
    L_0x01e8:
        r28 = r14;
        r14 = android.view.View.MeasureSpec.makeMeasureSpec(r1, r3);
        r5.measure(r14, r13);
        r29 = r1;
        r30 = r8;
        goto L_0x016f;
    L_0x01f8:
        r26 = r3;
        r27 = r13;
        r29 = r1;
        r30 = r8;
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        goto L_0x0282;
    L_0x0204:
        r26 = r3;
        r27 = r13;
        r28 = r14;
        r6 = r25;
        r3 = r7.weight;
        r3 = (r3 > r18 ? 1 : (r3 == r18 ? 0 : -1));
        if (r3 <= 0) goto L_0x027c;
    L_0x0212:
        r3 = r7.width;
        if (r3 != 0) goto L_0x023c;
    L_0x0216:
        r3 = r7.height;
        r13 = -2;
        if (r3 != r13) goto L_0x0223;
    L_0x021b:
        r3 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r14 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r3);
        r3 = r14;
        goto L_0x0247;
    L_0x0223:
        r3 = -2147483648; // 0xffffffff80000000 float:-0.0 double:NaN;
        r14 = r7.height;
        r3 = -1;
        if (r14 != r3) goto L_0x0233;
    L_0x022a:
        r14 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r16 = android.view.View.MeasureSpec.makeMeasureSpec(r8, r14);
        r3 = r16;
        goto L_0x0247;
    L_0x0233:
        r14 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r3 = r7.height;
        r3 = android.view.View.MeasureSpec.makeMeasureSpec(r3, r14);
        goto L_0x0247;
    L_0x023c:
        r13 = -2;
        r14 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r3 = r5.getMeasuredHeight();
        r3 = android.view.View.MeasureSpec.makeMeasureSpec(r3, r14);
    L_0x0247:
        if (r10 == 0) goto L_0x0261;
    L_0x0249:
        r14 = r7.leftMargin;
        r13 = r7.rightMargin;
        r14 = r14 + r13;
        r13 = r11 - r14;
        r29 = r1;
        r30 = r8;
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r8 = android.view.View.MeasureSpec.makeMeasureSpec(r13, r1);
        if (r6 == r13) goto L_0x025f;
    L_0x025c:
        r5.measure(r8, r3);
    L_0x025f:
        goto L_0x016f;
    L_0x0261:
        r29 = r1;
        r30 = r8;
        r1 = 0;
        r8 = java.lang.Math.max(r1, r15);
        r13 = r7.weight;
        r14 = (float) r8;
        r13 = r13 * r14;
        r13 = r13 / r9;
        r13 = (int) r13;
        r14 = r6 + r13;
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        r14 = android.view.View.MeasureSpec.makeMeasureSpec(r14, r1);
        r5.measure(r14, r3);
        goto L_0x0282;
    L_0x027c:
        r29 = r1;
        r30 = r8;
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
    L_0x0282:
        r4 = r4 + 1;
        r3 = r26;
        r13 = r27;
        r1 = r29;
        r8 = r30;
        r6 = 8;
        goto L_0x015a;
    L_0x0290:
        r26 = r3;
        r30 = r8;
        r27 = r13;
    L_0x0296:
        r1 = r2;
        r3 = r32.getPaddingTop();
        r3 = r3 + r12;
        r4 = r32.getPaddingBottom();
        r3 = r3 + r4;
        r0.setMeasuredDimension(r1, r3);
        r0.mCanSlide = r10;
        r4 = r0.mDragHelper;
        r4 = r4.getViewDragState();
        if (r4 == 0) goto L_0x02b5;
    L_0x02ae:
        if (r10 != 0) goto L_0x02b5;
    L_0x02b0:
        r4 = r0.mDragHelper;
        r4.abort();
    L_0x02b5:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.SlidingPaneLayout.onMeasure(int, int):void");
    }

    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        boolean isLayoutRtl = isLayoutRtlSupport();
        if (isLayoutRtl) {
            this.mDragHelper.setEdgeTrackingEnabled(2);
        } else {
            this.mDragHelper.setEdgeTrackingEnabled(1);
        }
        int width = r - l;
        int paddingStart = isLayoutRtl ? getPaddingRight() : getPaddingLeft();
        int paddingEnd = isLayoutRtl ? getPaddingLeft() : getPaddingRight();
        int paddingTop = getPaddingTop();
        int childCount = getChildCount();
        int xStart = paddingStart;
        int nextXStart = xStart;
        if (this.mFirstLayout) {
            float f = (this.mCanSlide && this.mPreservedOpenState) ? 1.0f : 0.0f;
            this.mSlideOffset = f;
        }
        int xStart2 = xStart;
        xStart = 0;
        while (xStart < childCount) {
            int paddingStart2;
            View child = getChildAt(xStart);
            if (child.getVisibility() == 8) {
                paddingStart2 = paddingStart;
            } else {
                int range;
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int childWidth = child.getMeasuredWidth();
                int offset = 0;
                if (lp.slideable) {
                    int margin = lp.leftMargin + lp.rightMargin;
                    range = (Math.min(nextXStart, (width - paddingEnd) - this.mOverhangSize) - xStart2) - margin;
                    this.mSlideRange = range;
                    int lpMargin = isLayoutRtl ? lp.rightMargin : lp.leftMargin;
                    paddingStart2 = paddingStart;
                    lp.dimWhenOffset = ((xStart2 + lpMargin) + range) + (childWidth / 2) > width - paddingEnd ? 1 : 0;
                    paddingStart = (int) (((float) range) * this.mSlideOffset);
                    xStart2 += paddingStart + lpMargin;
                    this.mSlideOffset = ((float) paddingStart) / ((float) this.mSlideRange);
                } else {
                    paddingStart2 = paddingStart;
                    if (!this.mCanSlide || this.mParallaxBy == 0) {
                        xStart2 = nextXStart;
                    } else {
                        xStart2 = nextXStart;
                        offset = (int) ((1.0f - this.mSlideOffset) * ((float) this.mParallaxBy));
                    }
                }
                if (isLayoutRtl) {
                    range = (width - xStart2) + offset;
                    paddingStart = range - childWidth;
                } else {
                    paddingStart = xStart2 - offset;
                    range = paddingStart + childWidth;
                }
                child.layout(paddingStart, paddingTop, range, paddingTop + child.getMeasuredHeight());
                nextXStart += child.getWidth();
            }
            xStart++;
            paddingStart = paddingStart2;
        }
        if (this.mFirstLayout) {
            if (this.mCanSlide) {
                if (this.mParallaxBy != 0) {
                    parallaxOtherViews(this.mSlideOffset);
                }
                if (((LayoutParams) this.mSlideableView.getLayoutParams()).dimWhenOffset) {
                    dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
                }
            } else {
                for (int i = 0; i < childCount; i++) {
                    dimChildView(getChildAt(i), 0.0f, this.mSliderFadeColor);
                }
            }
            updateObscuredViewsVisibility(this.mSlideableView);
        }
        this.mFirstLayout = false;
    }

    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w != oldw) {
            this.mFirstLayout = true;
        }
    }

    public void requestChildFocus(View child, View focused) {
        super.requestChildFocus(child, focused);
        if (!isInTouchMode() && !this.mCanSlide) {
            this.mPreservedOpenState = child == this.mSlideableView;
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent ev) {
        int action = MotionEventCompat.getActionMasked(ev);
        boolean z = true;
        if (!this.mCanSlide && action == 0 && getChildCount() > 1) {
            View secondChild = getChildAt(1);
            if (secondChild != null) {
                this.mPreservedOpenState = this.mDragHelper.isViewUnder(secondChild, (int) ev.getX(), (int) ev.getY()) ^ true;
            }
        }
        if (!this.mCanSlide || (this.mIsUnableToDrag && action != 0)) {
            this.mDragHelper.cancel();
            return super.onInterceptTouchEvent(ev);
        } else if (action == 3 || action == 1) {
            this.mDragHelper.cancel();
            return false;
        } else {
            boolean interceptTap = false;
            float x;
            float y;
            if (action == 0) {
                this.mIsUnableToDrag = false;
                x = ev.getX();
                y = ev.getY();
                this.mInitialMotionX = x;
                this.mInitialMotionY = y;
                if (this.mDragHelper.isViewUnder(this.mSlideableView, (int) x, (int) y) && isDimmed(this.mSlideableView)) {
                    interceptTap = true;
                }
            } else if (action == 2) {
                x = ev.getX();
                y = ev.getY();
                float adx = Math.abs(x - this.mInitialMotionX);
                float ady = Math.abs(y - this.mInitialMotionY);
                if (adx > ((float) this.mDragHelper.getTouchSlop()) && ady > adx) {
                    this.mDragHelper.cancel();
                    this.mIsUnableToDrag = true;
                    return false;
                }
            }
            if (!(this.mDragHelper.shouldInterceptTouchEvent(ev) || interceptTap)) {
                z = false;
            }
            return z;
        }
    }

    public boolean onTouchEvent(MotionEvent ev) {
        if (!this.mCanSlide) {
            return super.onTouchEvent(ev);
        }
        this.mDragHelper.processTouchEvent(ev);
        float x;
        float y;
        switch (ev.getAction() & 255) {
            case 0:
                x = ev.getX();
                y = ev.getY();
                this.mInitialMotionX = x;
                this.mInitialMotionY = y;
                break;
            case 1:
                if (isDimmed(this.mSlideableView)) {
                    x = ev.getX();
                    y = ev.getY();
                    float dx = x - this.mInitialMotionX;
                    float dy = y - this.mInitialMotionY;
                    int slop = this.mDragHelper.getTouchSlop();
                    if ((dx * dx) + (dy * dy) < ((float) (slop * slop)) && this.mDragHelper.isViewUnder(this.mSlideableView, (int) x, (int) y)) {
                        closePane(this.mSlideableView, 0);
                        break;
                    }
                }
                break;
        }
        return true;
    }

    private boolean closePane(View pane, int initialVelocity) {
        if (!this.mFirstLayout && !smoothSlideTo(0.0f, initialVelocity)) {
            return false;
        }
        this.mPreservedOpenState = false;
        return true;
    }

    private boolean openPane(View pane, int initialVelocity) {
        if (!this.mFirstLayout && !smoothSlideTo(1.0f, initialVelocity)) {
            return false;
        }
        this.mPreservedOpenState = true;
        return true;
    }

    @Deprecated
    public void smoothSlideOpen() {
        openPane();
    }

    public boolean openPane() {
        return openPane(this.mSlideableView, 0);
    }

    @Deprecated
    public void smoothSlideClosed() {
        closePane();
    }

    public boolean closePane() {
        return closePane(this.mSlideableView, 0);
    }

    public boolean isOpen() {
        return !this.mCanSlide || this.mSlideOffset == 1.0f;
    }

    @Deprecated
    public boolean canSlide() {
        return this.mCanSlide;
    }

    public boolean isSlideable() {
        return this.mCanSlide;
    }

    private void onPanelDragged(int newLeft) {
        if (this.mSlideableView == null) {
            this.mSlideOffset = 0.0f;
            return;
        }
        boolean isLayoutRtl = isLayoutRtlSupport();
        LayoutParams lp = (LayoutParams) this.mSlideableView.getLayoutParams();
        this.mSlideOffset = ((float) ((isLayoutRtl ? (getWidth() - newLeft) - this.mSlideableView.getWidth() : newLeft) - ((isLayoutRtl ? getPaddingRight() : getPaddingLeft()) + (isLayoutRtl ? lp.rightMargin : lp.leftMargin)))) / ((float) this.mSlideRange);
        if (this.mParallaxBy != 0) {
            parallaxOtherViews(this.mSlideOffset);
        }
        if (lp.dimWhenOffset) {
            dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
        }
        dispatchOnPanelSlide(this.mSlideableView);
    }

    private void dimChildView(View v, float mag, int fadeColor) {
        LayoutParams lp = (LayoutParams) v.getLayoutParams();
        if (mag > 0.0f && fadeColor != 0) {
            int color = (((int) (((float) ((ViewCompat.MEASURED_STATE_MASK & fadeColor) >>> 24)) * mag)) << 24) | (ViewCompat.MEASURED_SIZE_MASK & fadeColor);
            if (lp.dimPaint == null) {
                lp.dimPaint = new Paint();
            }
            lp.dimPaint.setColorFilter(new PorterDuffColorFilter(color, Mode.SRC_OVER));
            if (ViewCompat.getLayerType(v) != 2) {
                ViewCompat.setLayerType(v, 2, lp.dimPaint);
            }
            invalidateChildRegion(v);
        } else if (ViewCompat.getLayerType(v) != 0) {
            if (lp.dimPaint != null) {
                lp.dimPaint.setColorFilter(null);
            }
            DisableLayerRunnable dlr = new DisableLayerRunnable(v);
            this.mPostedRunnables.add(dlr);
            ViewCompat.postOnAnimation(this, dlr);
        }
    }

    protected boolean drawChild(Canvas canvas, View child, long drawingTime) {
        boolean result;
        LayoutParams lp = (LayoutParams) child.getLayoutParams();
        int save = canvas.save(2);
        if (!(!this.mCanSlide || lp.slideable || this.mSlideableView == null)) {
            canvas.getClipBounds(this.mTmpRect);
            if (isLayoutRtlSupport()) {
                this.mTmpRect.left = Math.max(this.mTmpRect.left, this.mSlideableView.getRight());
            } else {
                this.mTmpRect.right = Math.min(this.mTmpRect.right, this.mSlideableView.getLeft());
            }
            canvas.clipRect(this.mTmpRect);
        }
        if (VERSION.SDK_INT >= 11) {
            result = super.drawChild(canvas, child, drawingTime);
        } else if (!lp.dimWhenOffset || this.mSlideOffset <= 0.0f) {
            if (child.isDrawingCacheEnabled()) {
                child.setDrawingCacheEnabled(false);
            }
            result = super.drawChild(canvas, child, drawingTime);
        } else {
            boolean result2;
            if (!child.isDrawingCacheEnabled()) {
                child.setDrawingCacheEnabled(true);
            }
            Bitmap cache = child.getDrawingCache();
            if (cache != null) {
                canvas.drawBitmap(cache, (float) child.getLeft(), (float) child.getTop(), lp.dimPaint);
                result2 = false;
            } else {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("drawChild: child view ");
                stringBuilder.append(child);
                stringBuilder.append(" returned null drawing cache");
                Log.e(str, stringBuilder.toString());
                result2 = super.drawChild(canvas, child, drawingTime);
            }
            result = result2;
        }
        canvas.restoreToCount(save);
        return result;
    }

    private void invalidateChildRegion(View v) {
        IMPL.invalidateChildRegion(this, v);
    }

    boolean smoothSlideTo(float slideOffset, int velocity) {
        if (!this.mCanSlide) {
            return false;
        }
        int x;
        LayoutParams lp = (LayoutParams) this.mSlideableView.getLayoutParams();
        if (isLayoutRtlSupport()) {
            x = (int) (((float) getWidth()) - ((((float) (getPaddingRight() + lp.rightMargin)) + (((float) this.mSlideRange) * slideOffset)) + ((float) this.mSlideableView.getWidth())));
        } else {
            x = (int) (((float) (getPaddingLeft() + lp.leftMargin)) + (((float) this.mSlideRange) * slideOffset));
        }
        if (!this.mDragHelper.smoothSlideViewTo(this.mSlideableView, x, this.mSlideableView.getTop())) {
            return false;
        }
        setAllChildrenVisible();
        ViewCompat.postInvalidateOnAnimation(this);
        return true;
    }

    public void computeScroll() {
        if (this.mDragHelper.continueSettling(true)) {
            if (this.mCanSlide) {
                ViewCompat.postInvalidateOnAnimation(this);
            } else {
                this.mDragHelper.abort();
            }
        }
    }

    @Deprecated
    public void setShadowDrawable(Drawable d) {
        setShadowDrawableLeft(d);
    }

    public void setShadowDrawableLeft(Drawable d) {
        this.mShadowDrawableLeft = d;
    }

    public void setShadowDrawableRight(Drawable d) {
        this.mShadowDrawableRight = d;
    }

    @Deprecated
    public void setShadowResource(@DrawableRes int resId) {
        setShadowDrawable(getResources().getDrawable(resId));
    }

    public void setShadowResourceLeft(int resId) {
        setShadowDrawableLeft(getResources().getDrawable(resId));
    }

    public void setShadowResourceRight(int resId) {
        setShadowDrawableRight(getResources().getDrawable(resId));
    }

    public void draw(Canvas c) {
        Drawable shadowDrawable;
        super.draw(c);
        if (isLayoutRtlSupport()) {
            shadowDrawable = this.mShadowDrawableRight;
        } else {
            shadowDrawable = this.mShadowDrawableLeft;
        }
        View shadowView = getChildCount() > 1 ? getChildAt(1) : null;
        if (shadowView != null && shadowDrawable != null) {
            int left;
            int right;
            int top = shadowView.getTop();
            int bottom = shadowView.getBottom();
            int shadowWidth = shadowDrawable.getIntrinsicWidth();
            if (isLayoutRtlSupport()) {
                left = shadowView.getRight();
                right = left + shadowWidth;
            } else {
                right = shadowView.getLeft();
                left = right - shadowWidth;
            }
            shadowDrawable.setBounds(left, top, right, bottom);
            shadowDrawable.draw(c);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0024  */
    private void parallaxOtherViews(float r12) {
        /*
        r11 = this;
        r0 = r11.isLayoutRtlSupport();
        r1 = r11.mSlideableView;
        r1 = r1.getLayoutParams();
        r1 = (android.support.v4.widget.SlidingPaneLayout.LayoutParams) r1;
        r2 = r1.dimWhenOffset;
        r3 = 0;
        if (r2 == 0) goto L_0x001c;
    L_0x0011:
        if (r0 == 0) goto L_0x0016;
    L_0x0013:
        r2 = r1.rightMargin;
        goto L_0x0018;
    L_0x0016:
        r2 = r1.leftMargin;
    L_0x0018:
        if (r2 > 0) goto L_0x001c;
    L_0x001a:
        r2 = 1;
        goto L_0x001d;
    L_0x001c:
        r2 = r3;
    L_0x001d:
        r4 = r11.getChildCount();
    L_0x0022:
        if (r3 >= r4) goto L_0x005f;
    L_0x0024:
        r5 = r11.getChildAt(r3);
        r6 = r11.mSlideableView;
        if (r5 != r6) goto L_0x002d;
    L_0x002c:
        goto L_0x005c;
    L_0x002d:
        r6 = r11.mParallaxOffset;
        r7 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r6 = r7 - r6;
        r8 = r11.mParallaxBy;
        r8 = (float) r8;
        r6 = r6 * r8;
        r6 = (int) r6;
        r11.mParallaxOffset = r12;
        r8 = r7 - r12;
        r9 = r11.mParallaxBy;
        r9 = (float) r9;
        r8 = r8 * r9;
        r8 = (int) r8;
        r9 = r6 - r8;
        if (r0 == 0) goto L_0x0047;
    L_0x0045:
        r10 = -r9;
        goto L_0x0048;
    L_0x0047:
        r10 = r9;
    L_0x0048:
        r5.offsetLeftAndRight(r10);
        if (r2 == 0) goto L_0x005c;
    L_0x004d:
        if (r0 == 0) goto L_0x0053;
    L_0x004f:
        r10 = r11.mParallaxOffset;
        r10 = r10 - r7;
        goto L_0x0057;
    L_0x0053:
        r10 = r11.mParallaxOffset;
        r10 = r7 - r10;
    L_0x0057:
        r7 = r11.mCoveredFadeColor;
        r11.dimChildView(r5, r10, r7);
    L_0x005c:
        r3 = r3 + 1;
        goto L_0x0022;
    L_0x005f:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.SlidingPaneLayout.parallaxOtherViews(float):void");
    }

    /* JADX WARNING: Missing block: B:22:0x006f, code:
            if (android.support.v4.view.ViewCompat.canScrollHorizontally(r0, isLayoutRtlSupport() ? r17 : -r17) != false) goto L_0x0075;
     */
    protected boolean canScroll(android.view.View r15, boolean r16, int r17, int r18, int r19) {
        /*
        r14 = this;
        r0 = r15;
        r1 = r0 instanceof android.view.ViewGroup;
        r2 = 1;
        if (r1 == 0) goto L_0x005c;
    L_0x0006:
        r1 = r0;
        r1 = (android.view.ViewGroup) r1;
        r3 = r0.getScrollX();
        r4 = r0.getScrollY();
        r5 = r1.getChildCount();
        r6 = r5 + -1;
    L_0x0017:
        if (r6 < 0) goto L_0x005c;
    L_0x0019:
        r13 = r1.getChildAt(r6);
        r7 = r18 + r3;
        r8 = r13.getLeft();
        if (r7 < r8) goto L_0x0059;
    L_0x0025:
        r7 = r18 + r3;
        r8 = r13.getRight();
        if (r7 >= r8) goto L_0x0059;
    L_0x002d:
        r7 = r19 + r4;
        r8 = r13.getTop();
        if (r7 < r8) goto L_0x0059;
    L_0x0035:
        r7 = r19 + r4;
        r8 = r13.getBottom();
        if (r7 >= r8) goto L_0x0059;
    L_0x003d:
        r9 = 1;
        r7 = r18 + r3;
        r8 = r13.getLeft();
        r11 = r7 - r8;
        r7 = r19 + r4;
        r8 = r13.getTop();
        r12 = r7 - r8;
        r7 = r14;
        r8 = r13;
        r10 = r17;
        r7 = r7.canScroll(r8, r9, r10, r11, r12);
        if (r7 == 0) goto L_0x0059;
    L_0x0058:
        return r2;
    L_0x0059:
        r6 = r6 + -1;
        goto L_0x0017;
    L_0x005c:
        if (r16 == 0) goto L_0x0072;
    L_0x005e:
        r3 = r14.isLayoutRtlSupport();
        if (r3 == 0) goto L_0x0068;
    L_0x0064:
        r3 = r17;
        r4 = r3;
        goto L_0x006b;
    L_0x0068:
        r3 = r17;
        r4 = -r3;
    L_0x006b:
        r4 = android.support.v4.view.ViewCompat.canScrollHorizontally(r0, r4);
        if (r4 == 0) goto L_0x0074;
    L_0x0071:
        goto L_0x0075;
    L_0x0072:
        r3 = r17;
    L_0x0074:
        r2 = 0;
    L_0x0075:
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.SlidingPaneLayout.canScroll(android.view.View, boolean, int, int, int):boolean");
    }

    boolean isDimmed(View child) {
        boolean z = false;
        if (child == null) {
            return false;
        }
        LayoutParams lp = (LayoutParams) child.getLayoutParams();
        if (this.mCanSlide && lp.dimWhenOffset && this.mSlideOffset > 0.0f) {
            z = true;
        }
        return z;
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams p) {
        return p instanceof MarginLayoutParams ? new LayoutParams((MarginLayoutParams) p) : new LayoutParams(p);
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams p) {
        return (p instanceof LayoutParams) && super.checkLayoutParams(p);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    protected Parcelable onSaveInstanceState() {
        SavedState ss = new SavedState(super.onSaveInstanceState());
        ss.isOpen = isSlideable() ? isOpen() : this.mPreservedOpenState;
        return ss;
    }

    protected void onRestoreInstanceState(Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        if (ss.isOpen) {
            openPane();
        } else {
            closePane();
        }
        this.mPreservedOpenState = ss.isOpen;
    }

    private boolean isLayoutRtlSupport() {
        return ViewCompat.getLayoutDirection(this) == 1;
    }
}
