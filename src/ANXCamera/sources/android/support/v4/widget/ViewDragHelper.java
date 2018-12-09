package android.support.v4.widget;

import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import java.util.Arrays;

public class ViewDragHelper {
    private static final int BASE_SETTLE_DURATION = 256;
    public static final int DIRECTION_ALL = 3;
    public static final int DIRECTION_HORIZONTAL = 1;
    public static final int DIRECTION_VERTICAL = 2;
    public static final int EDGE_ALL = 15;
    public static final int EDGE_BOTTOM = 8;
    public static final int EDGE_LEFT = 1;
    public static final int EDGE_RIGHT = 2;
    private static final int EDGE_SIZE = 20;
    public static final int EDGE_TOP = 4;
    public static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SETTLING = 2;
    private static final String TAG = "ViewDragHelper";
    private static final Interpolator sInterpolator = new Interpolator() {
        public float getInterpolation(float t) {
            t -= 1.0f;
            return ((((t * t) * t) * t) * t) + 1.0f;
        }
    };
    private int mActivePointerId = -1;
    private final Callback mCallback;
    private View mCapturedView;
    private int mDragState;
    private int[] mEdgeDragsInProgress;
    private int[] mEdgeDragsLocked;
    private int mEdgeSize;
    private int[] mInitialEdgesTouched;
    private float[] mInitialMotionX;
    private float[] mInitialMotionY;
    private float[] mLastMotionX;
    private float[] mLastMotionY;
    private float mMaxVelocity;
    private float mMinVelocity;
    private final ViewGroup mParentView;
    private int mPointersDown;
    private boolean mReleaseInProgress;
    private ScrollerCompat mScroller;
    private final Runnable mSetIdleRunnable = new Runnable() {
        public void run() {
            ViewDragHelper.this.setDragState(0);
        }
    };
    private int mTouchSlop;
    private int mTrackingEdges;
    private VelocityTracker mVelocityTracker;

    public static abstract class Callback {
        public abstract boolean tryCaptureView(View view, int i);

        public void onViewDragStateChanged(int state) {
        }

        public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
        }

        public void onViewCaptured(View capturedChild, int activePointerId) {
        }

        public void onViewReleased(View releasedChild, float xvel, float yvel) {
        }

        public void onEdgeTouched(int edgeFlags, int pointerId) {
        }

        public boolean onEdgeLock(int edgeFlags) {
            return false;
        }

        public void onEdgeDragStarted(int edgeFlags, int pointerId) {
        }

        public int getOrderedChildIndex(int index) {
            return index;
        }

        public int getViewHorizontalDragRange(View child) {
            return 0;
        }

        public int getViewVerticalDragRange(View child) {
            return 0;
        }

        public int clampViewPositionHorizontal(View child, int left, int dx) {
            return 0;
        }

        public int clampViewPositionVertical(View child, int top, int dy) {
            return 0;
        }
    }

    public static ViewDragHelper create(ViewGroup forParent, Callback cb) {
        return new ViewDragHelper(forParent.getContext(), forParent, cb);
    }

    public static ViewDragHelper create(ViewGroup forParent, float sensitivity, Callback cb) {
        ViewDragHelper helper = create(forParent, cb);
        helper.mTouchSlop = (int) (((float) helper.mTouchSlop) * (1.0f / sensitivity));
        return helper;
    }

    private ViewDragHelper(Context context, ViewGroup forParent, Callback cb) {
        if (forParent == null) {
            throw new IllegalArgumentException("Parent view may not be null");
        } else if (cb != null) {
            this.mParentView = forParent;
            this.mCallback = cb;
            ViewConfiguration vc = ViewConfiguration.get(context);
            this.mEdgeSize = (int) ((20.0f * context.getResources().getDisplayMetrics().density) + 0.5f);
            this.mTouchSlop = vc.getScaledTouchSlop();
            this.mMaxVelocity = (float) vc.getScaledMaximumFlingVelocity();
            this.mMinVelocity = (float) vc.getScaledMinimumFlingVelocity();
            this.mScroller = ScrollerCompat.create(context, sInterpolator);
        } else {
            throw new IllegalArgumentException("Callback may not be null");
        }
    }

    public void setMinVelocity(float minVel) {
        this.mMinVelocity = minVel;
    }

    public float getMinVelocity() {
        return this.mMinVelocity;
    }

    public int getViewDragState() {
        return this.mDragState;
    }

    public void setEdgeTrackingEnabled(int edgeFlags) {
        this.mTrackingEdges = edgeFlags;
    }

    public int getEdgeSize() {
        return this.mEdgeSize;
    }

    public void captureChildView(View childView, int activePointerId) {
        if (childView.getParent() == this.mParentView) {
            this.mCapturedView = childView;
            this.mActivePointerId = activePointerId;
            this.mCallback.onViewCaptured(childView, activePointerId);
            setDragState(1);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("captureChildView: parameter must be a descendant of the ViewDragHelper's tracked parent view (");
        stringBuilder.append(this.mParentView);
        stringBuilder.append(")");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public View getCapturedView() {
        return this.mCapturedView;
    }

    public int getActivePointerId() {
        return this.mActivePointerId;
    }

    public int getTouchSlop() {
        return this.mTouchSlop;
    }

    public void cancel() {
        this.mActivePointerId = -1;
        clearMotionHistory();
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    public void abort() {
        cancel();
        if (this.mDragState == 2) {
            int oldX = this.mScroller.getCurrX();
            int oldY = this.mScroller.getCurrY();
            this.mScroller.abortAnimation();
            int newX = this.mScroller.getCurrX();
            int newY = this.mScroller.getCurrY();
            this.mCallback.onViewPositionChanged(this.mCapturedView, newX, newY, newX - oldX, newY - oldY);
        }
        setDragState(0);
    }

    public boolean smoothSlideViewTo(View child, int finalLeft, int finalTop) {
        this.mCapturedView = child;
        this.mActivePointerId = -1;
        boolean continueSliding = forceSettleCapturedViewAt(finalLeft, finalTop, 0, 0);
        if (!(continueSliding || this.mDragState != 0 || this.mCapturedView == null)) {
            this.mCapturedView = null;
        }
        return continueSliding;
    }

    public boolean settleCapturedViewAt(int finalLeft, int finalTop) {
        if (this.mReleaseInProgress) {
            return forceSettleCapturedViewAt(finalLeft, finalTop, (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId));
        }
        throw new IllegalStateException("Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased");
    }

    private boolean forceSettleCapturedViewAt(int finalLeft, int finalTop, int xvel, int yvel) {
        int startLeft = this.mCapturedView.getLeft();
        int startTop = this.mCapturedView.getTop();
        int dx = finalLeft - startLeft;
        int dy = finalTop - startTop;
        if (dx == 0 && dy == 0) {
            this.mScroller.abortAnimation();
            setDragState(0);
            return false;
        }
        this.mScroller.startScroll(startLeft, startTop, dx, dy, computeSettleDuration(this.mCapturedView, dx, dy, xvel, yvel));
        setDragState(2);
        return true;
    }

    private int computeSettleDuration(View child, int dx, int dy, int xvel, int yvel) {
        float xweight;
        float f;
        float f2;
        View view = child;
        int xvel2 = clampMag(xvel, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int yvel2 = clampMag(yvel, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int absDx = Math.abs(dx);
        int absDy = Math.abs(dy);
        int absXVel = Math.abs(xvel2);
        int absYVel = Math.abs(yvel2);
        int addedVel = absXVel + absYVel;
        int addedDistance = absDx + absDy;
        if (xvel2 != 0) {
            xweight = (float) absXVel;
            f = (float) addedVel;
        } else {
            xweight = (float) absDx;
            f = (float) addedDistance;
        }
        xweight /= f;
        if (yvel2 != 0) {
            f = (float) absYVel;
            f2 = (float) addedVel;
        } else {
            f = (float) absDy;
            f2 = (float) addedDistance;
        }
        f /= f2;
        return (int) ((((float) computeAxisDuration(dx, xvel2, this.mCallback.getViewHorizontalDragRange(view))) * xweight) + (((float) computeAxisDuration(dy, yvel2, this.mCallback.getViewVerticalDragRange(view))) * f));
    }

    private int computeAxisDuration(int delta, int velocity, int motionRange) {
        if (delta == 0) {
            return 0;
        }
        int duration;
        int width = this.mParentView.getWidth();
        int halfWidth = width / 2;
        float distance = ((float) halfWidth) + (((float) halfWidth) * distanceInfluenceForSnapDuration(Math.min(1.0f, ((float) Math.abs(delta)) / ((float) width))));
        velocity = Math.abs(velocity);
        if (velocity > 0) {
            duration = 4 * Math.round(1000.0f * Math.abs(distance / ((float) velocity)));
        } else {
            duration = (int) ((1.0f + (((float) Math.abs(delta)) / ((float) motionRange))) * 256.0f);
        }
        return Math.min(duration, MAX_SETTLE_DURATION);
    }

    private int clampMag(int value, int absMin, int absMax) {
        int absValue = Math.abs(value);
        if (absValue < absMin) {
            return 0;
        }
        if (absValue <= absMax) {
            return value;
        }
        return value > 0 ? absMax : -absMax;
    }

    private float clampMag(float value, float absMin, float absMax) {
        float absValue = Math.abs(value);
        if (absValue < absMin) {
            return 0.0f;
        }
        if (absValue <= absMax) {
            return value;
        }
        return value > 0.0f ? absMax : -absMax;
    }

    private float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((double) ((float) (((double) (f - 0.5f)) * 0.4712389167638204d)));
    }

    public void flingCapturedView(int minLeft, int minTop, int maxLeft, int maxTop) {
        if (this.mReleaseInProgress) {
            this.mScroller.fling(this.mCapturedView.getLeft(), this.mCapturedView.getTop(), (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), minLeft, maxLeft, minTop, maxTop);
            setDragState(2);
            return;
        }
        throw new IllegalStateException("Cannot flingCapturedView outside of a call to Callback#onViewReleased");
    }

    public boolean continueSettling(boolean deferCallbacks) {
        if (this.mDragState == 2) {
            boolean keepGoing = this.mScroller.computeScrollOffset();
            int x = this.mScroller.getCurrX();
            int y = this.mScroller.getCurrY();
            int dx = x - this.mCapturedView.getLeft();
            int dy = y - this.mCapturedView.getTop();
            if (dx != 0) {
                this.mCapturedView.offsetLeftAndRight(dx);
            }
            if (dy != 0) {
                this.mCapturedView.offsetTopAndBottom(dy);
            }
            if (!(dx == 0 && dy == 0)) {
                this.mCallback.onViewPositionChanged(this.mCapturedView, x, y, dx, dy);
            }
            if (keepGoing && x == this.mScroller.getFinalX() && y == this.mScroller.getFinalY()) {
                this.mScroller.abortAnimation();
                keepGoing = false;
            }
            if (!keepGoing) {
                if (deferCallbacks) {
                    this.mParentView.post(this.mSetIdleRunnable);
                } else {
                    setDragState(0);
                }
            }
        }
        if (this.mDragState == 2) {
            return true;
        }
        return false;
    }

    private void dispatchViewReleased(float xvel, float yvel) {
        this.mReleaseInProgress = true;
        this.mCallback.onViewReleased(this.mCapturedView, xvel, yvel);
        this.mReleaseInProgress = false;
        if (this.mDragState == 1) {
            setDragState(0);
        }
    }

    private void clearMotionHistory() {
        if (this.mInitialMotionX != null) {
            Arrays.fill(this.mInitialMotionX, 0.0f);
            Arrays.fill(this.mInitialMotionY, 0.0f);
            Arrays.fill(this.mLastMotionX, 0.0f);
            Arrays.fill(this.mLastMotionY, 0.0f);
            Arrays.fill(this.mInitialEdgesTouched, 0);
            Arrays.fill(this.mEdgeDragsInProgress, 0);
            Arrays.fill(this.mEdgeDragsLocked, 0);
            this.mPointersDown = 0;
        }
    }

    private void clearMotionHistory(int pointerId) {
        if (this.mInitialMotionX != null) {
            this.mInitialMotionX[pointerId] = 0.0f;
            this.mInitialMotionY[pointerId] = 0.0f;
            this.mLastMotionX[pointerId] = 0.0f;
            this.mLastMotionY[pointerId] = 0.0f;
            this.mInitialEdgesTouched[pointerId] = 0;
            this.mEdgeDragsInProgress[pointerId] = 0;
            this.mEdgeDragsLocked[pointerId] = 0;
            this.mPointersDown &= ~(1 << pointerId);
        }
    }

    private void ensureMotionHistorySizeForId(int pointerId) {
        if (this.mInitialMotionX == null || this.mInitialMotionX.length <= pointerId) {
            float[] imx = new float[(pointerId + 1)];
            float[] imy = new float[(pointerId + 1)];
            float[] lmx = new float[(pointerId + 1)];
            float[] lmy = new float[(pointerId + 1)];
            int[] iit = new int[(pointerId + 1)];
            int[] edip = new int[(pointerId + 1)];
            int[] edl = new int[(pointerId + 1)];
            if (this.mInitialMotionX != null) {
                System.arraycopy(this.mInitialMotionX, 0, imx, 0, this.mInitialMotionX.length);
                System.arraycopy(this.mInitialMotionY, 0, imy, 0, this.mInitialMotionY.length);
                System.arraycopy(this.mLastMotionX, 0, lmx, 0, this.mLastMotionX.length);
                System.arraycopy(this.mLastMotionY, 0, lmy, 0, this.mLastMotionY.length);
                System.arraycopy(this.mInitialEdgesTouched, 0, iit, 0, this.mInitialEdgesTouched.length);
                System.arraycopy(this.mEdgeDragsInProgress, 0, edip, 0, this.mEdgeDragsInProgress.length);
                System.arraycopy(this.mEdgeDragsLocked, 0, edl, 0, this.mEdgeDragsLocked.length);
            }
            this.mInitialMotionX = imx;
            this.mInitialMotionY = imy;
            this.mLastMotionX = lmx;
            this.mLastMotionY = lmy;
            this.mInitialEdgesTouched = iit;
            this.mEdgeDragsInProgress = edip;
            this.mEdgeDragsLocked = edl;
        }
    }

    private void saveInitialMotion(float x, float y, int pointerId) {
        ensureMotionHistorySizeForId(pointerId);
        float[] fArr = this.mInitialMotionX;
        this.mLastMotionX[pointerId] = x;
        fArr[pointerId] = x;
        fArr = this.mInitialMotionY;
        this.mLastMotionY[pointerId] = y;
        fArr[pointerId] = y;
        this.mInitialEdgesTouched[pointerId] = getEdgesTouched((int) x, (int) y);
        this.mPointersDown |= 1 << pointerId;
    }

    private void saveLastMotion(MotionEvent ev) {
        int pointerCount = MotionEventCompat.getPointerCount(ev);
        for (int i = 0; i < pointerCount; i++) {
            int pointerId = MotionEventCompat.getPointerId(ev, i);
            float x = MotionEventCompat.getX(ev, i);
            float y = MotionEventCompat.getY(ev, i);
            this.mLastMotionX[pointerId] = x;
            this.mLastMotionY[pointerId] = y;
        }
    }

    public boolean isPointerDown(int pointerId) {
        return (this.mPointersDown & (1 << pointerId)) != 0;
    }

    void setDragState(int state) {
        this.mParentView.removeCallbacks(this.mSetIdleRunnable);
        if (this.mDragState != state) {
            this.mDragState = state;
            this.mCallback.onViewDragStateChanged(state);
            if (this.mDragState == 0) {
                this.mCapturedView = null;
            }
        }
    }

    boolean tryCaptureViewForDrag(View toCapture, int pointerId) {
        if (toCapture == this.mCapturedView && this.mActivePointerId == pointerId) {
            return true;
        }
        if (toCapture == null || !this.mCallback.tryCaptureView(toCapture, pointerId)) {
            return false;
        }
        this.mActivePointerId = pointerId;
        captureChildView(toCapture, pointerId);
        return true;
    }

    /* JADX WARNING: Missing block: B:20:0x0074, code:
            if (android.support.v4.view.ViewCompat.canScrollVertically(r0, -r20) != false) goto L_0x007f;
     */
    protected boolean canScroll(android.view.View r17, boolean r18, int r19, int r20, int r21, int r22) {
        /*
        r16 = this;
        r0 = r17;
        r1 = r0 instanceof android.view.ViewGroup;
        r2 = 1;
        if (r1 == 0) goto L_0x0062;
    L_0x0007:
        r1 = r0;
        r1 = (android.view.ViewGroup) r1;
        r3 = r17.getScrollX();
        r4 = r17.getScrollY();
        r5 = r1.getChildCount();
        r6 = r5 + -1;
    L_0x0018:
        if (r6 < 0) goto L_0x0062;
    L_0x001a:
        r13 = r1.getChildAt(r6);
        r7 = r21 + r3;
        r8 = r13.getLeft();
        if (r7 < r8) goto L_0x005f;
    L_0x0026:
        r7 = r21 + r3;
        r8 = r13.getRight();
        if (r7 >= r8) goto L_0x005f;
    L_0x002e:
        r7 = r22 + r4;
        r8 = r13.getTop();
        if (r7 < r8) goto L_0x005f;
    L_0x0036:
        r7 = r22 + r4;
        r8 = r13.getBottom();
        if (r7 >= r8) goto L_0x005f;
    L_0x003e:
        r9 = 1;
        r7 = r21 + r3;
        r8 = r13.getLeft();
        r12 = r7 - r8;
        r7 = r22 + r4;
        r8 = r13.getTop();
        r14 = r7 - r8;
        r7 = r16;
        r8 = r13;
        r10 = r19;
        r11 = r20;
        r15 = r13;
        r13 = r14;
        r7 = r7.canScroll(r8, r9, r10, r11, r12, r13);
        if (r7 == 0) goto L_0x005f;
    L_0x005e:
        return r2;
    L_0x005f:
        r6 = r6 + -1;
        goto L_0x0018;
    L_0x0062:
        if (r18 == 0) goto L_0x007a;
    L_0x0064:
        r3 = r19;
        r4 = -r3;
        r4 = android.support.v4.view.ViewCompat.canScrollHorizontally(r0, r4);
        if (r4 != 0) goto L_0x0077;
    L_0x006d:
        r4 = r20;
        r5 = -r4;
        r5 = android.support.v4.view.ViewCompat.canScrollVertically(r0, r5);
        if (r5 == 0) goto L_0x007e;
    L_0x0076:
        goto L_0x0079;
    L_0x0077:
        r4 = r20;
    L_0x0079:
        goto L_0x007f;
    L_0x007a:
        r3 = r19;
        r4 = r20;
    L_0x007e:
        r2 = 0;
    L_0x007f:
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.ViewDragHelper.canScroll(android.view.View, boolean, int, int, int, int):boolean");
    }

    /* JADX WARNING: Missing block: B:8:0x0024, code:
            r16 = r2;
            r17 = r3;
            r5 = false;
     */
    /* JADX WARNING: Missing block: B:10:0x0033, code:
            r16 = r2;
            r17 = r3;
     */
    /* JADX WARNING: Missing block: B:37:0x00df, code:
            if (r2 != r15) goto L_0x00ee;
     */
    /* JADX WARNING: Missing block: B:51:0x011b, code:
            r5 = false;
     */
    /* JADX WARNING: Missing block: B:61:0x0156, code:
            if (r0.mDragState != 1) goto L_0x0159;
     */
    /* JADX WARNING: Missing block: B:70:?, code:
            return r5;
     */
    /* JADX WARNING: Missing block: B:71:?, code:
            return true;
     */
    public boolean shouldInterceptTouchEvent(android.view.MotionEvent r22) {
        /*
        r21 = this;
        r0 = r21;
        r1 = r22;
        r2 = android.support.v4.view.MotionEventCompat.getActionMasked(r22);
        r3 = android.support.v4.view.MotionEventCompat.getActionIndex(r22);
        if (r2 != 0) goto L_0x0011;
    L_0x000e:
        r21.cancel();
    L_0x0011:
        r4 = r0.mVelocityTracker;
        if (r4 != 0) goto L_0x001b;
    L_0x0015:
        r4 = android.view.VelocityTracker.obtain();
        r0.mVelocityTracker = r4;
    L_0x001b:
        r4 = r0.mVelocityTracker;
        r4.addMovement(r1);
        r4 = 2;
        switch(r2) {
            case 0: goto L_0x011d;
            case 1: goto L_0x0114;
            case 2: goto L_0x0070;
            case 3: goto L_0x0114;
            case 4: goto L_0x0024;
            case 5: goto L_0x0039;
            case 6: goto L_0x002b;
            default: goto L_0x0024;
        };
    L_0x0024:
        r16 = r2;
        r17 = r3;
        r5 = 0;
        goto L_0x0153;
    L_0x002b:
        r4 = android.support.v4.view.MotionEventCompat.getPointerId(r1, r3);
        r0.clearMotionHistory(r4);
    L_0x0033:
        r16 = r2;
        r17 = r3;
        goto L_0x011b;
    L_0x0039:
        r7 = android.support.v4.view.MotionEventCompat.getPointerId(r1, r3);
        r8 = android.support.v4.view.MotionEventCompat.getX(r1, r3);
        r9 = android.support.v4.view.MotionEventCompat.getY(r1, r3);
        r0.saveInitialMotion(r8, r9, r7);
        r10 = r0.mDragState;
        if (r10 != 0) goto L_0x005e;
    L_0x004c:
        r4 = r0.mInitialEdgesTouched;
        r4 = r4[r7];
        r10 = r0.mTrackingEdges;
        r10 = r10 & r4;
        if (r10 == 0) goto L_0x005d;
    L_0x0055:
        r10 = r0.mCallback;
        r11 = r0.mTrackingEdges;
        r11 = r11 & r4;
        r10.onEdgeTouched(r11, r7);
    L_0x005d:
        goto L_0x0033;
    L_0x005e:
        r10 = r0.mDragState;
        if (r10 != r4) goto L_0x0033;
    L_0x0062:
        r4 = (int) r8;
        r10 = (int) r9;
        r4 = r0.findTopChildUnder(r4, r10);
        r10 = r0.mCapturedView;
        if (r4 != r10) goto L_0x006f;
    L_0x006c:
        r0.tryCaptureViewForDrag(r4, r7);
    L_0x006f:
        goto L_0x0033;
    L_0x0070:
        r4 = r0.mInitialMotionX;
        if (r4 == 0) goto L_0x0024;
    L_0x0074:
        r4 = r0.mInitialMotionY;
        if (r4 != 0) goto L_0x0079;
    L_0x0078:
        goto L_0x0033;
    L_0x0079:
        r4 = android.support.v4.view.MotionEventCompat.getPointerCount(r22);
        r7 = 0;
    L_0x007e:
        if (r7 >= r4) goto L_0x010a;
    L_0x0080:
        r8 = android.support.v4.view.MotionEventCompat.getPointerId(r1, r7);
        r9 = android.support.v4.view.MotionEventCompat.getX(r1, r7);
        r10 = android.support.v4.view.MotionEventCompat.getY(r1, r7);
        r11 = r0.mInitialMotionX;
        r11 = r11[r8];
        r11 = r9 - r11;
        r12 = r0.mInitialMotionY;
        r12 = r12[r8];
        r12 = r10 - r12;
        r13 = (int) r9;
        r14 = (int) r10;
        r13 = r0.findTopChildUnder(r13, r14);
        if (r13 == 0) goto L_0x00a8;
    L_0x00a0:
        r14 = r0.checkTouchSlop(r13, r11, r12);
        if (r14 == 0) goto L_0x00a8;
    L_0x00a6:
        r14 = 1;
        goto L_0x00a9;
    L_0x00a8:
        r14 = 0;
    L_0x00a9:
        if (r14 == 0) goto L_0x00e8;
    L_0x00ab:
        r15 = r13.getLeft();
        r5 = (int) r11;
        r5 = r5 + r15;
        r6 = r0.mCallback;
        r16 = r2;
        r2 = (int) r11;
        r2 = r6.clampViewPositionHorizontal(r13, r5, r2);
        r6 = r13.getTop();
        r17 = r3;
        r3 = (int) r12;
        r3 = r3 + r6;
        r18 = r4;
        r4 = r0.mCallback;
        r19 = r5;
        r5 = (int) r12;
        r4 = r4.clampViewPositionVertical(r13, r3, r5);
        r5 = r0.mCallback;
        r5 = r5.getViewHorizontalDragRange(r13);
        r20 = r3;
        r3 = r0.mCallback;
        r3 = r3.getViewVerticalDragRange(r13);
        if (r5 == 0) goto L_0x00e1;
    L_0x00dd:
        if (r5 <= 0) goto L_0x00ee;
    L_0x00df:
        if (r2 != r15) goto L_0x00ee;
    L_0x00e1:
        if (r3 == 0) goto L_0x0110;
    L_0x00e3:
        if (r3 <= 0) goto L_0x00ee;
    L_0x00e5:
        if (r4 != r6) goto L_0x00ee;
    L_0x00e7:
        goto L_0x0110;
    L_0x00e8:
        r16 = r2;
        r17 = r3;
        r18 = r4;
    L_0x00ee:
        r0.reportNewEdgeDrags(r11, r12, r8);
        r2 = r0.mDragState;
        r3 = 1;
        if (r2 != r3) goto L_0x00f7;
    L_0x00f6:
        goto L_0x0110;
    L_0x00f7:
        if (r14 == 0) goto L_0x0100;
    L_0x00f9:
        r2 = r0.tryCaptureViewForDrag(r13, r8);
        if (r2 == 0) goto L_0x0100;
    L_0x00ff:
        goto L_0x0110;
    L_0x0100:
        r7 = r7 + 1;
        r2 = r16;
        r3 = r17;
        r4 = r18;
        goto L_0x007e;
    L_0x010a:
        r16 = r2;
        r17 = r3;
        r18 = r4;
    L_0x0110:
        r21.saveLastMotion(r22);
        goto L_0x011b;
    L_0x0114:
        r16 = r2;
        r17 = r3;
        r21.cancel();
    L_0x011b:
        r5 = 0;
        goto L_0x0153;
    L_0x011d:
        r16 = r2;
        r17 = r3;
        r2 = r22.getX();
        r3 = r22.getY();
        r5 = 0;
        r6 = android.support.v4.view.MotionEventCompat.getPointerId(r1, r5);
        r0.saveInitialMotion(r2, r3, r6);
        r7 = (int) r2;
        r8 = (int) r3;
        r7 = r0.findTopChildUnder(r7, r8);
        r8 = r0.mCapturedView;
        if (r7 != r8) goto L_0x0142;
    L_0x013b:
        r8 = r0.mDragState;
        if (r8 != r4) goto L_0x0142;
    L_0x013f:
        r0.tryCaptureViewForDrag(r7, r6);
    L_0x0142:
        r4 = r0.mInitialEdgesTouched;
        r4 = r4[r6];
        r8 = r0.mTrackingEdges;
        r8 = r8 & r4;
        if (r8 == 0) goto L_0x0153;
    L_0x014b:
        r8 = r0.mCallback;
        r9 = r0.mTrackingEdges;
        r9 = r9 & r4;
        r8.onEdgeTouched(r9, r6);
    L_0x0153:
        r2 = r0.mDragState;
        r3 = 1;
        if (r2 != r3) goto L_0x0159;
    L_0x0158:
        goto L_0x015a;
    L_0x0159:
        r3 = r5;
    L_0x015a:
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.ViewDragHelper.shouldInterceptTouchEvent(android.view.MotionEvent):boolean");
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0063  */
    public void processTouchEvent(android.view.MotionEvent r13) {
        /*
        r12 = this;
        r0 = android.support.v4.view.MotionEventCompat.getActionMasked(r13);
        r1 = android.support.v4.view.MotionEventCompat.getActionIndex(r13);
        if (r0 != 0) goto L_0x000d;
    L_0x000a:
        r12.cancel();
    L_0x000d:
        r2 = r12.mVelocityTracker;
        if (r2 != 0) goto L_0x0017;
    L_0x0011:
        r2 = android.view.VelocityTracker.obtain();
        r12.mVelocityTracker = r2;
    L_0x0017:
        r2 = r12.mVelocityTracker;
        r2.addMovement(r13);
        r2 = 0;
        r3 = 1;
        switch(r0) {
            case 0: goto L_0x013c;
            case 1: goto L_0x0131;
            case 2: goto L_0x00b6;
            case 3: goto L_0x00a9;
            case 4: goto L_0x0021;
            case 5: goto L_0x006b;
            case 6: goto L_0x0023;
            default: goto L_0x0021;
        };
    L_0x0021:
        goto L_0x0165;
    L_0x0023:
        r4 = android.support.v4.view.MotionEventCompat.getPointerId(r13, r1);
        r5 = r12.mDragState;
        if (r5 != r3) goto L_0x0066;
    L_0x002b:
        r3 = r12.mActivePointerId;
        if (r4 != r3) goto L_0x0066;
    L_0x002f:
        r3 = -1;
        r5 = android.support.v4.view.MotionEventCompat.getPointerCount(r13);
    L_0x0035:
        if (r2 >= r5) goto L_0x0060;
    L_0x0037:
        r6 = android.support.v4.view.MotionEventCompat.getPointerId(r13, r2);
        r7 = r12.mActivePointerId;
        if (r6 != r7) goto L_0x0040;
    L_0x003f:
        goto L_0x005d;
    L_0x0040:
        r7 = android.support.v4.view.MotionEventCompat.getX(r13, r2);
        r8 = android.support.v4.view.MotionEventCompat.getY(r13, r2);
        r9 = (int) r7;
        r10 = (int) r8;
        r9 = r12.findTopChildUnder(r9, r10);
        r10 = r12.mCapturedView;
        if (r9 != r10) goto L_0x005d;
    L_0x0052:
        r9 = r12.mCapturedView;
        r9 = r12.tryCaptureViewForDrag(r9, r6);
        if (r9 == 0) goto L_0x005d;
    L_0x005a:
        r3 = r12.mActivePointerId;
        goto L_0x0060;
    L_0x005d:
        r2 = r2 + 1;
        goto L_0x0035;
    L_0x0060:
        r2 = -1;
        if (r3 != r2) goto L_0x0066;
    L_0x0063:
        r12.releaseViewForPointerUp();
    L_0x0066:
        r12.clearMotionHistory(r4);
        goto L_0x0165;
    L_0x006b:
        r2 = android.support.v4.view.MotionEventCompat.getPointerId(r13, r1);
        r3 = android.support.v4.view.MotionEventCompat.getX(r13, r1);
        r4 = android.support.v4.view.MotionEventCompat.getY(r13, r1);
        r12.saveInitialMotion(r3, r4, r2);
        r5 = r12.mDragState;
        if (r5 != 0) goto L_0x009a;
    L_0x007e:
        r5 = (int) r3;
        r6 = (int) r4;
        r5 = r12.findTopChildUnder(r5, r6);
        r12.tryCaptureViewForDrag(r5, r2);
        r6 = r12.mInitialEdgesTouched;
        r6 = r6[r2];
        r7 = r12.mTrackingEdges;
        r7 = r7 & r6;
        if (r7 == 0) goto L_0x0098;
    L_0x0090:
        r7 = r12.mCallback;
        r8 = r12.mTrackingEdges;
        r8 = r8 & r6;
        r7.onEdgeTouched(r8, r2);
    L_0x0098:
        goto L_0x0165;
    L_0x009a:
        r5 = (int) r3;
        r6 = (int) r4;
        r5 = r12.isCapturedViewUnder(r5, r6);
        if (r5 == 0) goto L_0x0165;
    L_0x00a2:
        r5 = r12.mCapturedView;
        r12.tryCaptureViewForDrag(r5, r2);
        goto L_0x0165;
    L_0x00a9:
        r2 = r12.mDragState;
        if (r2 != r3) goto L_0x00b1;
    L_0x00ad:
        r2 = 0;
        r12.dispatchViewReleased(r2, r2);
    L_0x00b1:
        r12.cancel();
        goto L_0x0165;
    L_0x00b6:
        r4 = r12.mDragState;
        if (r4 != r3) goto L_0x00f0;
    L_0x00ba:
        r2 = r12.mActivePointerId;
        r2 = android.support.v4.view.MotionEventCompat.findPointerIndex(r13, r2);
        r3 = android.support.v4.view.MotionEventCompat.getX(r13, r2);
        r4 = android.support.v4.view.MotionEventCompat.getY(r13, r2);
        r5 = r12.mLastMotionX;
        r6 = r12.mActivePointerId;
        r5 = r5[r6];
        r5 = r3 - r5;
        r5 = (int) r5;
        r6 = r12.mLastMotionY;
        r7 = r12.mActivePointerId;
        r6 = r6[r7];
        r6 = r4 - r6;
        r6 = (int) r6;
        r7 = r12.mCapturedView;
        r7 = r7.getLeft();
        r7 = r7 + r5;
        r8 = r12.mCapturedView;
        r8 = r8.getTop();
        r8 = r8 + r6;
        r12.dragTo(r7, r8, r5, r6);
        r12.saveLastMotion(r13);
        goto L_0x0165;
    L_0x00f0:
        r4 = android.support.v4.view.MotionEventCompat.getPointerCount(r13);
    L_0x00f5:
        if (r2 >= r4) goto L_0x012d;
    L_0x00f7:
        r5 = android.support.v4.view.MotionEventCompat.getPointerId(r13, r2);
        r6 = android.support.v4.view.MotionEventCompat.getX(r13, r2);
        r7 = android.support.v4.view.MotionEventCompat.getY(r13, r2);
        r8 = r12.mInitialMotionX;
        r8 = r8[r5];
        r8 = r6 - r8;
        r9 = r12.mInitialMotionY;
        r9 = r9[r5];
        r9 = r7 - r9;
        r12.reportNewEdgeDrags(r8, r9, r5);
        r10 = r12.mDragState;
        if (r10 != r3) goto L_0x0117;
    L_0x0116:
        goto L_0x012d;
    L_0x0117:
        r10 = (int) r6;
        r11 = (int) r7;
        r10 = r12.findTopChildUnder(r10, r11);
        r11 = r12.checkTouchSlop(r10, r8, r9);
        if (r11 == 0) goto L_0x012a;
    L_0x0123:
        r11 = r12.tryCaptureViewForDrag(r10, r5);
        if (r11 == 0) goto L_0x012a;
    L_0x0129:
        goto L_0x012d;
    L_0x012a:
        r2 = r2 + 1;
        goto L_0x00f5;
    L_0x012d:
        r12.saveLastMotion(r13);
        goto L_0x0165;
    L_0x0131:
        r2 = r12.mDragState;
        if (r2 != r3) goto L_0x0138;
    L_0x0135:
        r12.releaseViewForPointerUp();
    L_0x0138:
        r12.cancel();
        goto L_0x0165;
    L_0x013c:
        r3 = r13.getX();
        r4 = r13.getY();
        r2 = android.support.v4.view.MotionEventCompat.getPointerId(r13, r2);
        r5 = (int) r3;
        r6 = (int) r4;
        r5 = r12.findTopChildUnder(r5, r6);
        r12.saveInitialMotion(r3, r4, r2);
        r12.tryCaptureViewForDrag(r5, r2);
        r6 = r12.mInitialEdgesTouched;
        r6 = r6[r2];
        r7 = r12.mTrackingEdges;
        r7 = r7 & r6;
        if (r7 == 0) goto L_0x0165;
    L_0x015d:
        r7 = r12.mCallback;
        r8 = r12.mTrackingEdges;
        r8 = r8 & r6;
        r7.onEdgeTouched(r8, r2);
    L_0x0165:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.widget.ViewDragHelper.processTouchEvent(android.view.MotionEvent):void");
    }

    private void reportNewEdgeDrags(float dx, float dy, int pointerId) {
        int dragsStarted = 0;
        if (checkNewEdgeDrag(dx, dy, pointerId, 1)) {
            dragsStarted = 0 | 1;
        }
        if (checkNewEdgeDrag(dy, dx, pointerId, 4)) {
            dragsStarted |= 4;
        }
        if (checkNewEdgeDrag(dx, dy, pointerId, 2)) {
            dragsStarted |= 2;
        }
        if (checkNewEdgeDrag(dy, dx, pointerId, 8)) {
            dragsStarted |= 8;
        }
        if (dragsStarted != 0) {
            int[] iArr = this.mEdgeDragsInProgress;
            iArr[pointerId] = iArr[pointerId] | dragsStarted;
            this.mCallback.onEdgeDragStarted(dragsStarted, pointerId);
        }
    }

    private boolean checkNewEdgeDrag(float delta, float odelta, int pointerId, int edge) {
        float absDelta = Math.abs(delta);
        float absODelta = Math.abs(odelta);
        boolean z = false;
        if ((this.mInitialEdgesTouched[pointerId] & edge) != edge || (this.mTrackingEdges & edge) == 0 || (this.mEdgeDragsLocked[pointerId] & edge) == edge || (this.mEdgeDragsInProgress[pointerId] & edge) == edge || (absDelta <= ((float) this.mTouchSlop) && absODelta <= ((float) this.mTouchSlop))) {
            return false;
        }
        if (absDelta >= 0.5f * absODelta || !this.mCallback.onEdgeLock(edge)) {
            if ((this.mEdgeDragsInProgress[pointerId] & edge) == 0 && absDelta > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
        int[] iArr = this.mEdgeDragsLocked;
        iArr[pointerId] = iArr[pointerId] | edge;
        return false;
    }

    private boolean checkTouchSlop(View child, float dx, float dy) {
        boolean z = false;
        if (child == null) {
            return false;
        }
        boolean checkHorizontal = this.mCallback.getViewHorizontalDragRange(child) > 0;
        boolean checkVertical = this.mCallback.getViewVerticalDragRange(child) > 0;
        if (checkHorizontal && checkVertical) {
            if ((dx * dx) + (dy * dy) > ((float) (this.mTouchSlop * this.mTouchSlop))) {
                z = true;
            }
            return z;
        } else if (checkHorizontal) {
            if (Math.abs(dx) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        } else if (!checkVertical) {
            return false;
        } else {
            if (Math.abs(dy) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
    }

    public boolean checkTouchSlop(int directions) {
        int count = this.mInitialMotionX.length;
        for (int i = 0; i < count; i++) {
            if (checkTouchSlop(directions, i)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkTouchSlop(int directions, int pointerId) {
        boolean z = false;
        if (!isPointerDown(pointerId)) {
            return false;
        }
        boolean checkHorizontal = (directions & 1) == 1;
        boolean checkVertical = (directions & 2) == 2;
        float dx = this.mLastMotionX[pointerId] - this.mInitialMotionX[pointerId];
        float dy = this.mLastMotionY[pointerId] - this.mInitialMotionY[pointerId];
        if (checkHorizontal && checkVertical) {
            if ((dx * dx) + (dy * dy) > ((float) (this.mTouchSlop * this.mTouchSlop))) {
                z = true;
            }
            return z;
        } else if (checkHorizontal) {
            if (Math.abs(dx) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        } else if (!checkVertical) {
            return false;
        } else {
            if (Math.abs(dy) > ((float) this.mTouchSlop)) {
                z = true;
            }
            return z;
        }
    }

    public boolean isEdgeTouched(int edges) {
        int count = this.mInitialEdgesTouched.length;
        for (int i = 0; i < count; i++) {
            if (isEdgeTouched(edges, i)) {
                return true;
            }
        }
        return false;
    }

    public boolean isEdgeTouched(int edges, int pointerId) {
        return isPointerDown(pointerId) && (this.mInitialEdgesTouched[pointerId] & edges) != 0;
    }

    private void releaseViewForPointerUp() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaxVelocity);
        dispatchViewReleased(clampMag(VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity), clampMag(VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity));
    }

    private void dragTo(int left, int top, int dx, int dy) {
        int i = dx;
        int i2 = dy;
        int clampedX = left;
        int clampedY = top;
        int oldLeft = this.mCapturedView.getLeft();
        int oldTop = this.mCapturedView.getTop();
        if (i != 0) {
            clampedX = this.mCallback.clampViewPositionHorizontal(this.mCapturedView, left, i);
            this.mCapturedView.offsetLeftAndRight(clampedX - oldLeft);
        } else {
            int i3 = left;
        }
        if (i2 != 0) {
            clampedY = this.mCallback.clampViewPositionVertical(this.mCapturedView, top, i2);
            this.mCapturedView.offsetTopAndBottom(clampedY - oldTop);
        } else {
            int i4 = top;
        }
        if (i != 0 || i2 != 0) {
            this.mCallback.onViewPositionChanged(this.mCapturedView, clampedX, clampedY, clampedX - oldLeft, clampedY - oldTop);
        }
    }

    public boolean isCapturedViewUnder(int x, int y) {
        return isViewUnder(this.mCapturedView, x, y);
    }

    public boolean isViewUnder(View view, int x, int y) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        if (x >= view.getLeft() && x < view.getRight() && y >= view.getTop() && y < view.getBottom()) {
            z = true;
        }
        return z;
    }

    public View findTopChildUnder(int x, int y) {
        for (int i = this.mParentView.getChildCount() - 1; i >= 0; i--) {
            View child = this.mParentView.getChildAt(this.mCallback.getOrderedChildIndex(i));
            if (x >= child.getLeft() && x < child.getRight() && y >= child.getTop() && y < child.getBottom()) {
                return child;
            }
        }
        return null;
    }

    private int getEdgesTouched(int x, int y) {
        int result = 0;
        if (x < this.mParentView.getLeft() + this.mEdgeSize) {
            result = 0 | 1;
        }
        if (y < this.mParentView.getTop() + this.mEdgeSize) {
            result |= 4;
        }
        if (x > this.mParentView.getRight() - this.mEdgeSize) {
            result |= 2;
        }
        if (y > this.mParentView.getBottom() - this.mEdgeSize) {
            return result | 8;
        }
        return result;
    }
}
