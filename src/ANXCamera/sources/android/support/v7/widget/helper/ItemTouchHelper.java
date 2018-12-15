package android.support.v7.widget.helper;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.v4.animation.AnimatorCompatHelper;
import android.support.v4.animation.AnimatorListenerCompat;
import android.support.v4.animation.AnimatorUpdateListenerCompat;
import android.support.v4.animation.ValueAnimatorCompat;
import android.support.v4.view.GestureDetectorCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.recyclerview.R;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ChildDrawingOrderCallback;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnChildAttachStateChangeListener;
import android.support.v7.widget.RecyclerView.OnItemTouchListener;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.Log;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.List;

public class ItemTouchHelper extends ItemDecoration implements OnChildAttachStateChangeListener {
    private static final int ACTION_MODE_DRAG_MASK = 16711680;
    private static final int ACTION_MODE_IDLE_MASK = 255;
    private static final int ACTION_MODE_SWIPE_MASK = 65280;
    public static final int ACTION_STATE_DRAG = 2;
    public static final int ACTION_STATE_IDLE = 0;
    public static final int ACTION_STATE_SWIPE = 1;
    private static final int ACTIVE_POINTER_ID_NONE = -1;
    public static final int ANIMATION_TYPE_DRAG = 8;
    public static final int ANIMATION_TYPE_SWIPE_CANCEL = 4;
    public static final int ANIMATION_TYPE_SWIPE_SUCCESS = 2;
    private static final boolean DEBUG = false;
    private static final int DIRECTION_FLAG_COUNT = 8;
    public static final int DOWN = 2;
    public static final int END = 32;
    public static final int LEFT = 4;
    public static final int RIGHT = 8;
    public static final int START = 16;
    private static final String TAG = "ItemTouchHelper";
    public static final int UP = 1;
    int mActionState = 0;
    int mActivePointerId = -1;
    Callback mCallback;
    private ChildDrawingOrderCallback mChildDrawingOrderCallback = null;
    private List<Integer> mDistances;
    private long mDragScrollStartTimeInMs;
    float mDx;
    float mDy;
    private GestureDetectorCompat mGestureDetector;
    float mInitialTouchX;
    float mInitialTouchY;
    private final OnItemTouchListener mOnItemTouchListener = new OnItemTouchListener() {
        public boolean onInterceptTouchEvent(RecyclerView recyclerView, MotionEvent event) {
            ItemTouchHelper.this.mGestureDetector.onTouchEvent(event);
            int action = MotionEventCompat.getActionMasked(event);
            if (action == 0) {
                ItemTouchHelper.this.mActivePointerId = MotionEventCompat.getPointerId(event, 0);
                ItemTouchHelper.this.mInitialTouchX = event.getX();
                ItemTouchHelper.this.mInitialTouchY = event.getY();
                ItemTouchHelper.this.obtainVelocityTracker();
                if (ItemTouchHelper.this.mSelected == null) {
                    RecoverAnimation animation = ItemTouchHelper.this.findAnimation(event);
                    if (animation != null) {
                        ItemTouchHelper itemTouchHelper = ItemTouchHelper.this;
                        itemTouchHelper.mInitialTouchX -= animation.mX;
                        itemTouchHelper = ItemTouchHelper.this;
                        itemTouchHelper.mInitialTouchY -= animation.mY;
                        ItemTouchHelper.this.endRecoverAnimation(animation.mViewHolder, true);
                        if (ItemTouchHelper.this.mPendingCleanup.remove(animation.mViewHolder.itemView)) {
                            ItemTouchHelper.this.mCallback.clearView(ItemTouchHelper.this.mRecyclerView, animation.mViewHolder);
                        }
                        ItemTouchHelper.this.select(animation.mViewHolder, animation.mActionState);
                        ItemTouchHelper.this.updateDxDy(event, ItemTouchHelper.this.mSelectedFlags, 0);
                    }
                }
            } else if (action == 3 || action == 1) {
                ItemTouchHelper.this.mActivePointerId = -1;
                ItemTouchHelper.this.select(null, 0);
            } else if (ItemTouchHelper.this.mActivePointerId != -1) {
                int index = MotionEventCompat.findPointerIndex(event, ItemTouchHelper.this.mActivePointerId);
                if (index >= 0) {
                    ItemTouchHelper.this.checkSelectForSwipe(action, event, index);
                }
            }
            if (ItemTouchHelper.this.mVelocityTracker != null) {
                ItemTouchHelper.this.mVelocityTracker.addMovement(event);
            }
            if (ItemTouchHelper.this.mSelected != null) {
                return true;
            }
            return false;
        }

        public void onTouchEvent(RecyclerView recyclerView, MotionEvent event) {
            ItemTouchHelper.this.mGestureDetector.onTouchEvent(event);
            if (ItemTouchHelper.this.mVelocityTracker != null) {
                ItemTouchHelper.this.mVelocityTracker.addMovement(event);
            }
            if (ItemTouchHelper.this.mActivePointerId != -1) {
                int action = MotionEventCompat.getActionMasked(event);
                int activePointerIndex = MotionEventCompat.findPointerIndex(event, ItemTouchHelper.this.mActivePointerId);
                if (activePointerIndex >= 0) {
                    ItemTouchHelper.this.checkSelectForSwipe(action, event, activePointerIndex);
                }
                ViewHolder viewHolder = ItemTouchHelper.this.mSelected;
                if (viewHolder != null) {
                    int newPointerIndex = 0;
                    if (action != 6) {
                        switch (action) {
                            case 1:
                            case 3:
                                if (ItemTouchHelper.this.mVelocityTracker != null) {
                                    ItemTouchHelper.this.mVelocityTracker.computeCurrentVelocity(1000, (float) ItemTouchHelper.this.mRecyclerView.getMaxFlingVelocity());
                                }
                                ItemTouchHelper.this.select(null, 0);
                                ItemTouchHelper.this.mActivePointerId = -1;
                                break;
                            case 2:
                                if (activePointerIndex >= 0) {
                                    ItemTouchHelper.this.updateDxDy(event, ItemTouchHelper.this.mSelectedFlags, activePointerIndex);
                                    ItemTouchHelper.this.moveIfNecessary(viewHolder);
                                    ItemTouchHelper.this.mRecyclerView.removeCallbacks(ItemTouchHelper.this.mScrollRunnable);
                                    ItemTouchHelper.this.mScrollRunnable.run();
                                    ItemTouchHelper.this.mRecyclerView.invalidate();
                                    break;
                                }
                                break;
                        }
                    }
                    int pointerIndex = MotionEventCompat.getActionIndex(event);
                    if (MotionEventCompat.getPointerId(event, pointerIndex) == ItemTouchHelper.this.mActivePointerId) {
                        if (ItemTouchHelper.this.mVelocityTracker != null) {
                            ItemTouchHelper.this.mVelocityTracker.computeCurrentVelocity(1000, (float) ItemTouchHelper.this.mRecyclerView.getMaxFlingVelocity());
                        }
                        if (pointerIndex == 0) {
                            newPointerIndex = 1;
                        }
                        ItemTouchHelper.this.mActivePointerId = MotionEventCompat.getPointerId(event, newPointerIndex);
                        ItemTouchHelper.this.updateDxDy(event, ItemTouchHelper.this.mSelectedFlags, pointerIndex);
                    }
                }
            }
        }

        public void onRequestDisallowInterceptTouchEvent(boolean disallowIntercept) {
            if (disallowIntercept) {
                ItemTouchHelper.this.select(null, 0);
            }
        }
    };
    private View mOverdrawChild = null;
    private int mOverdrawChildPosition = -1;
    final List<View> mPendingCleanup = new ArrayList();
    List<RecoverAnimation> mRecoverAnimations = new ArrayList();
    private RecyclerView mRecyclerView;
    private final Runnable mScrollRunnable = new Runnable() {
        public void run() {
            if (ItemTouchHelper.this.mSelected != null && ItemTouchHelper.this.scrollIfNecessary()) {
                if (ItemTouchHelper.this.mSelected != null) {
                    ItemTouchHelper.this.moveIfNecessary(ItemTouchHelper.this.mSelected);
                }
                ItemTouchHelper.this.mRecyclerView.removeCallbacks(ItemTouchHelper.this.mScrollRunnable);
                ViewCompat.postOnAnimation(ItemTouchHelper.this.mRecyclerView, this);
            }
        }
    };
    ViewHolder mSelected = null;
    int mSelectedFlags;
    float mSelectedStartX;
    float mSelectedStartY;
    private int mSlop;
    private List<ViewHolder> mSwapTargets;
    private final float[] mTmpPosition = new float[2];
    private Rect mTmpRect;
    private VelocityTracker mVelocityTracker;

    public interface ViewDropHandler {
        void prepareForDrop(View view, View view2, int i, int i2);
    }

    private class RecoverAnimation implements AnimatorListenerCompat {
        final int mActionState;
        private final int mAnimationType;
        private boolean mEnded = false;
        private float mFraction;
        public boolean mIsPendingCleanup;
        boolean mOverridden = false;
        final float mStartDx;
        final float mStartDy;
        final float mTargetX;
        final float mTargetY;
        private final ValueAnimatorCompat mValueAnimator;
        final ViewHolder mViewHolder;
        float mX;
        float mY;

        public RecoverAnimation(ViewHolder viewHolder, int animationType, int actionState, float startDx, float startDy, float targetX, float targetY) {
            this.mActionState = actionState;
            this.mAnimationType = animationType;
            this.mViewHolder = viewHolder;
            this.mStartDx = startDx;
            this.mStartDy = startDy;
            this.mTargetX = targetX;
            this.mTargetY = targetY;
            this.mValueAnimator = AnimatorCompatHelper.emptyValueAnimator();
            this.mValueAnimator.addUpdateListener(new AnimatorUpdateListenerCompat(ItemTouchHelper.this) {
                public void onAnimationUpdate(ValueAnimatorCompat animation) {
                    RecoverAnimation.this.setFraction(animation.getAnimatedFraction());
                }
            });
            this.mValueAnimator.setTarget(viewHolder.itemView);
            this.mValueAnimator.addListener(this);
            setFraction(0.0f);
        }

        public void setDuration(long duration) {
            this.mValueAnimator.setDuration(duration);
        }

        public void start() {
            this.mViewHolder.setIsRecyclable(false);
            this.mValueAnimator.start();
        }

        public void cancel() {
            this.mValueAnimator.cancel();
        }

        public void setFraction(float fraction) {
            this.mFraction = fraction;
        }

        public void update() {
            if (this.mStartDx == this.mTargetX) {
                this.mX = ViewCompat.getTranslationX(this.mViewHolder.itemView);
            } else {
                this.mX = this.mStartDx + (this.mFraction * (this.mTargetX - this.mStartDx));
            }
            if (this.mStartDy == this.mTargetY) {
                this.mY = ViewCompat.getTranslationY(this.mViewHolder.itemView);
            } else {
                this.mY = this.mStartDy + (this.mFraction * (this.mTargetY - this.mStartDy));
            }
        }

        public void onAnimationStart(ValueAnimatorCompat animation) {
        }

        public void onAnimationEnd(ValueAnimatorCompat animation) {
            this.mEnded = true;
        }

        public void onAnimationCancel(ValueAnimatorCompat animation) {
            setFraction(1.0f);
        }

        public void onAnimationRepeat(ValueAnimatorCompat animation) {
        }
    }

    public static abstract class Callback {
        private static final int ABS_HORIZONTAL_DIR_FLAGS = 789516;
        public static final int DEFAULT_DRAG_ANIMATION_DURATION = 200;
        public static final int DEFAULT_SWIPE_ANIMATION_DURATION = 250;
        private static final long DRAG_SCROLL_ACCELERATION_LIMIT_TIME_MS = 2000;
        static final int RELATIVE_DIR_FLAGS = 3158064;
        private static final Interpolator sDragScrollInterpolator = new Interpolator() {
            public float getInterpolation(float t) {
                return (((t * t) * t) * t) * t;
            }
        };
        private static final Interpolator sDragViewScrollCapInterpolator = new Interpolator() {
            public float getInterpolation(float t) {
                t -= 1.0f;
                return ((((t * t) * t) * t) * t) + 1.0f;
            }
        };
        private static final ItemTouchUIUtil sUICallback;
        private int mCachedMaxScrollSpeed = -1;

        public abstract int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder);

        public abstract boolean onMove(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2);

        public abstract void onSwiped(ViewHolder viewHolder, int i);

        static {
            if (VERSION.SDK_INT >= 21) {
                sUICallback = new Lollipop();
            } else if (VERSION.SDK_INT >= 11) {
                sUICallback = new Honeycomb();
            } else {
                sUICallback = new Gingerbread();
            }
        }

        public static ItemTouchUIUtil getDefaultUIUtil() {
            return sUICallback;
        }

        public static int convertToRelativeDirection(int flags, int layoutDirection) {
            int masked = flags & ABS_HORIZONTAL_DIR_FLAGS;
            if (masked == 0) {
                return flags;
            }
            flags &= ~masked;
            if (layoutDirection == 0) {
                return flags | (masked << 2);
            }
            return (flags | ((masked << 1) & -789517)) | ((ABS_HORIZONTAL_DIR_FLAGS & (masked << 1)) << 2);
        }

        public static int makeMovementFlags(int dragFlags, int swipeFlags) {
            return (makeFlag(0, swipeFlags | dragFlags) | makeFlag(1, swipeFlags)) | makeFlag(2, dragFlags);
        }

        public static int makeFlag(int actionState, int directions) {
            return directions << (actionState * 8);
        }

        public int convertToAbsoluteDirection(int flags, int layoutDirection) {
            int masked = flags & RELATIVE_DIR_FLAGS;
            if (masked == 0) {
                return flags;
            }
            flags &= ~masked;
            if (layoutDirection == 0) {
                return flags | (masked >> 2);
            }
            return (flags | ((masked >> 1) & -3158065)) | ((RELATIVE_DIR_FLAGS & (masked >> 1)) >> 2);
        }

        final int getAbsoluteMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
            return convertToAbsoluteDirection(getMovementFlags(recyclerView, viewHolder), ViewCompat.getLayoutDirection(recyclerView));
        }

        private boolean hasDragFlag(RecyclerView recyclerView, ViewHolder viewHolder) {
            return (ItemTouchHelper.ACTION_MODE_DRAG_MASK & getAbsoluteMovementFlags(recyclerView, viewHolder)) != 0;
        }

        private boolean hasSwipeFlag(RecyclerView recyclerView, ViewHolder viewHolder) {
            return (65280 & getAbsoluteMovementFlags(recyclerView, viewHolder)) != 0;
        }

        public boolean canDropOver(RecyclerView recyclerView, ViewHolder current, ViewHolder target) {
            return true;
        }

        public boolean isLongPressDragEnabled() {
            return true;
        }

        public boolean isItemViewSwipeEnabled() {
            return true;
        }

        public int getBoundingBoxMargin() {
            return 0;
        }

        public float getSwipeThreshold(ViewHolder viewHolder) {
            return 0.5f;
        }

        public float getMoveThreshold(ViewHolder viewHolder) {
            return 0.5f;
        }

        public ViewHolder chooseDropTarget(ViewHolder selected, List<ViewHolder> dropTargets, int curX, int curY) {
            ViewHolder viewHolder = selected;
            int right = curX + viewHolder.itemView.getWidth();
            int bottom = curY + viewHolder.itemView.getHeight();
            ViewHolder winner = null;
            int winnerScore = -1;
            int dx = curX - viewHolder.itemView.getLeft();
            int dy = curY - viewHolder.itemView.getTop();
            int targetsSize = dropTargets.size();
            for (int i = 0; i < targetsSize; i++) {
                int diff;
                int score;
                ViewHolder target = (ViewHolder) dropTargets.get(i);
                if (dx > 0) {
                    diff = target.itemView.getRight() - right;
                    if (diff < 0 && target.itemView.getRight() > viewHolder.itemView.getRight()) {
                        score = Math.abs(diff);
                        if (score > winnerScore) {
                            winnerScore = score;
                            winner = target;
                        }
                    }
                }
                if (dx < 0) {
                    diff = target.itemView.getLeft() - curX;
                    if (diff > 0 && target.itemView.getLeft() < viewHolder.itemView.getLeft()) {
                        score = Math.abs(diff);
                        if (score > winnerScore) {
                            winnerScore = score;
                            winner = target;
                        }
                    }
                }
                if (dy < 0) {
                    diff = target.itemView.getTop() - curY;
                    if (diff > 0 && target.itemView.getTop() < viewHolder.itemView.getTop()) {
                        score = Math.abs(diff);
                        if (score > winnerScore) {
                            winnerScore = score;
                            winner = target;
                        }
                    }
                }
                if (dy > 0) {
                    diff = target.itemView.getBottom() - bottom;
                    if (diff < 0 && target.itemView.getBottom() > viewHolder.itemView.getBottom()) {
                        score = Math.abs(diff);
                        if (score > winnerScore) {
                            winnerScore = score;
                            winner = target;
                        }
                    }
                }
            }
            List<ViewHolder> list = dropTargets;
            return winner;
        }

        public void onSelectedChanged(ViewHolder viewHolder, int actionState) {
            if (viewHolder != null) {
                sUICallback.onSelected(viewHolder.itemView);
            }
        }

        private int getMaxDragScroll(RecyclerView recyclerView) {
            if (this.mCachedMaxScrollSpeed == -1) {
                this.mCachedMaxScrollSpeed = recyclerView.getResources().getDimensionPixelSize(R.dimen.item_touch_helper_max_drag_scroll_per_frame);
            }
            return this.mCachedMaxScrollSpeed;
        }

        public void onMoved(RecyclerView recyclerView, ViewHolder viewHolder, int fromPos, ViewHolder target, int toPos, int x, int y) {
            LayoutManager layoutManager = recyclerView.getLayoutManager();
            if (layoutManager instanceof ViewDropHandler) {
                ((ViewDropHandler) layoutManager).prepareForDrop(viewHolder.itemView, target.itemView, x, y);
                return;
            }
            if (layoutManager.canScrollHorizontally()) {
                if (layoutManager.getDecoratedLeft(target.itemView) <= recyclerView.getPaddingLeft()) {
                    recyclerView.scrollToPosition(toPos);
                }
                if (layoutManager.getDecoratedRight(target.itemView) >= recyclerView.getWidth() - recyclerView.getPaddingRight()) {
                    recyclerView.scrollToPosition(toPos);
                }
            }
            if (layoutManager.canScrollVertically()) {
                if (layoutManager.getDecoratedTop(target.itemView) <= recyclerView.getPaddingTop()) {
                    recyclerView.scrollToPosition(toPos);
                }
                if (layoutManager.getDecoratedBottom(target.itemView) >= recyclerView.getHeight() - recyclerView.getPaddingBottom()) {
                    recyclerView.scrollToPosition(toPos);
                }
            }
        }

        private void onDraw(Canvas c, RecyclerView parent, ViewHolder selected, List<RecoverAnimation> recoverAnimationList, int actionState, float dX, float dY) {
            Canvas canvas = c;
            int recoverAnimSize = recoverAnimationList.size();
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= recoverAnimSize) {
                    break;
                }
                RecoverAnimation anim = (RecoverAnimation) recoverAnimationList.get(i2);
                anim.update();
                int count = canvas.save();
                onChildDraw(canvas, parent, anim.mViewHolder, anim.mX, anim.mY, anim.mActionState, false);
                canvas.restoreToCount(count);
                i = i2 + 1;
            }
            List<RecoverAnimation> list = recoverAnimationList;
            if (selected != null) {
                int count2 = canvas.save();
                onChildDraw(canvas, parent, selected, dX, dY, actionState, true);
                canvas.restoreToCount(count2);
            }
        }

        private void onDrawOver(Canvas c, RecyclerView parent, ViewHolder selected, List<RecoverAnimation> recoverAnimationList, int actionState, float dX, float dY) {
            Canvas canvas = c;
            List<RecoverAnimation> list = recoverAnimationList;
            int recoverAnimSize = recoverAnimationList.size();
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= recoverAnimSize) {
                    break;
                }
                RecoverAnimation anim = (RecoverAnimation) list.get(i2);
                int count = canvas.save();
                onChildDrawOver(canvas, parent, anim.mViewHolder, anim.mX, anim.mY, anim.mActionState, false);
                canvas.restoreToCount(count);
                i = i2 + 1;
            }
            if (selected != null) {
                int count2 = canvas.save();
                onChildDrawOver(canvas, parent, selected, dX, dY, actionState, true);
                canvas.restoreToCount(count2);
            }
            boolean hasRunningAnimation = false;
            for (int i3 = recoverAnimSize - 1; i3 >= 0; i3--) {
                RecoverAnimation anim2 = (RecoverAnimation) list.get(i3);
                if (anim2.mEnded && !anim2.mIsPendingCleanup) {
                    list.remove(i3);
                    anim2.mViewHolder.setIsRecyclable(true);
                } else if (!anim2.mEnded) {
                    hasRunningAnimation = true;
                }
            }
            if (hasRunningAnimation) {
                parent.invalidate();
            }
        }

        public void clearView(RecyclerView recyclerView, ViewHolder viewHolder) {
            sUICallback.clearView(viewHolder.itemView);
        }

        public void onChildDraw(Canvas c, RecyclerView recyclerView, ViewHolder viewHolder, float dX, float dY, int actionState, boolean isCurrentlyActive) {
            sUICallback.onDraw(c, recyclerView, viewHolder.itemView, dX, dY, actionState, isCurrentlyActive);
        }

        public void onChildDrawOver(Canvas c, RecyclerView recyclerView, ViewHolder viewHolder, float dX, float dY, int actionState, boolean isCurrentlyActive) {
            sUICallback.onDrawOver(c, recyclerView, viewHolder.itemView, dX, dY, actionState, isCurrentlyActive);
        }

        public long getAnimationDuration(RecyclerView recyclerView, int animationType, float animateDx, float animateDy) {
            ItemAnimator itemAnimator = recyclerView.getItemAnimator();
            if (itemAnimator == null) {
                return animationType == 8 ? 200 : 250;
            }
            return animationType == 8 ? itemAnimator.getMoveDuration() : itemAnimator.getRemoveDuration();
        }

        public int interpolateOutOfBoundsScroll(RecyclerView recyclerView, int viewSize, int viewSizeOutOfBounds, int totalSize, long msSinceStartScroll) {
            float timeRatio;
            int cappedScroll = (int) (((float) (((int) Math.signum((float) viewSizeOutOfBounds)) * getMaxDragScroll(recyclerView))) * sDragViewScrollCapInterpolator.getInterpolation(Math.min(1.0f, (((float) Math.abs(viewSizeOutOfBounds)) * 1.0f) / ((float) viewSize))));
            if (msSinceStartScroll > 2000) {
                timeRatio = 1.0f;
            } else {
                timeRatio = ((float) msSinceStartScroll) / 2000.0f;
            }
            int value = (int) (((float) cappedScroll) * sDragScrollInterpolator.getInterpolation(timeRatio));
            if (value != 0) {
                return value;
            }
            return viewSizeOutOfBounds > 0 ? 1 : -1;
        }
    }

    private class ItemTouchHelperGestureListener extends SimpleOnGestureListener {
        private ItemTouchHelperGestureListener() {
        }

        /* synthetic */ ItemTouchHelperGestureListener(ItemTouchHelper x0, AnonymousClass1 x1) {
            this();
        }

        public boolean onDown(MotionEvent e) {
            return true;
        }

        public void onLongPress(MotionEvent e) {
            View child = ItemTouchHelper.this.findChildView(e);
            if (child != null) {
                ViewHolder vh = ItemTouchHelper.this.mRecyclerView.getChildViewHolder(child);
                if (vh != null && ItemTouchHelper.this.mCallback.hasDragFlag(ItemTouchHelper.this.mRecyclerView, vh) && MotionEventCompat.getPointerId(e, 0) == ItemTouchHelper.this.mActivePointerId) {
                    int index = MotionEventCompat.findPointerIndex(e, ItemTouchHelper.this.mActivePointerId);
                    float x = MotionEventCompat.getX(e, index);
                    float y = MotionEventCompat.getY(e, index);
                    ItemTouchHelper.this.mInitialTouchX = x;
                    ItemTouchHelper.this.mInitialTouchY = y;
                    ItemTouchHelper itemTouchHelper = ItemTouchHelper.this;
                    ItemTouchHelper.this.mDy = 0.0f;
                    itemTouchHelper.mDx = 0.0f;
                    if (ItemTouchHelper.this.mCallback.isLongPressDragEnabled()) {
                        ItemTouchHelper.this.select(vh, 2);
                    }
                }
            }
        }
    }

    public static abstract class SimpleCallback extends Callback {
        private int mDefaultDragDirs;
        private int mDefaultSwipeDirs;

        public SimpleCallback(int dragDirs, int swipeDirs) {
            this.mDefaultSwipeDirs = swipeDirs;
            this.mDefaultDragDirs = dragDirs;
        }

        public void setDefaultSwipeDirs(int defaultSwipeDirs) {
            this.mDefaultSwipeDirs = defaultSwipeDirs;
        }

        public void setDefaultDragDirs(int defaultDragDirs) {
            this.mDefaultDragDirs = defaultDragDirs;
        }

        public int getSwipeDirs(RecyclerView recyclerView, ViewHolder viewHolder) {
            return this.mDefaultSwipeDirs;
        }

        public int getDragDirs(RecyclerView recyclerView, ViewHolder viewHolder) {
            return this.mDefaultDragDirs;
        }

        public int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
            return Callback.makeMovementFlags(getDragDirs(recyclerView, viewHolder), getSwipeDirs(recyclerView, viewHolder));
        }
    }

    public ItemTouchHelper(Callback callback) {
        this.mCallback = callback;
    }

    private static boolean hitTest(View child, float x, float y, float left, float top) {
        return x >= left && x <= ((float) child.getWidth()) + left && y >= top && y <= ((float) child.getHeight()) + top;
    }

    public void attachToRecyclerView(RecyclerView recyclerView) {
        if (this.mRecyclerView != recyclerView) {
            if (this.mRecyclerView != null) {
                destroyCallbacks();
            }
            this.mRecyclerView = recyclerView;
            if (this.mRecyclerView != null) {
                setupCallbacks();
            }
        }
    }

    private void setupCallbacks() {
        this.mSlop = ViewConfiguration.get(this.mRecyclerView.getContext()).getScaledTouchSlop();
        this.mRecyclerView.addItemDecoration(this);
        this.mRecyclerView.addOnItemTouchListener(this.mOnItemTouchListener);
        this.mRecyclerView.addOnChildAttachStateChangeListener(this);
        initGestureDetector();
    }

    private void destroyCallbacks() {
        this.mRecyclerView.removeItemDecoration(this);
        this.mRecyclerView.removeOnItemTouchListener(this.mOnItemTouchListener);
        this.mRecyclerView.removeOnChildAttachStateChangeListener(this);
        for (int i = this.mRecoverAnimations.size() - 1; i >= 0; i--) {
            this.mCallback.clearView(this.mRecyclerView, ((RecoverAnimation) this.mRecoverAnimations.get(0)).mViewHolder);
        }
        this.mRecoverAnimations.clear();
        this.mOverdrawChild = null;
        this.mOverdrawChildPosition = -1;
        releaseVelocityTracker();
    }

    private void initGestureDetector() {
        if (this.mGestureDetector == null) {
            this.mGestureDetector = new GestureDetectorCompat(this.mRecyclerView.getContext(), new ItemTouchHelperGestureListener(this, null));
        }
    }

    private void getSelectedDxDy(float[] outPosition) {
        if ((this.mSelectedFlags & 12) != 0) {
            outPosition[0] = (this.mSelectedStartX + this.mDx) - ((float) this.mSelected.itemView.getLeft());
        } else {
            outPosition[0] = ViewCompat.getTranslationX(this.mSelected.itemView);
        }
        if ((this.mSelectedFlags & 3) != 0) {
            outPosition[1] = (this.mSelectedStartY + this.mDy) - ((float) this.mSelected.itemView.getTop());
        } else {
            outPosition[1] = ViewCompat.getTranslationY(this.mSelected.itemView);
        }
    }

    public void onDrawOver(Canvas c, RecyclerView parent, State state) {
        float dx = 0.0f;
        float dy = 0.0f;
        if (this.mSelected != null) {
            getSelectedDxDy(this.mTmpPosition);
            dx = this.mTmpPosition[0];
            dy = this.mTmpPosition[1];
        }
        this.mCallback.onDrawOver(c, parent, this.mSelected, this.mRecoverAnimations, this.mActionState, dx, dy);
    }

    public void onDraw(Canvas c, RecyclerView parent, State state) {
        this.mOverdrawChildPosition = -1;
        float dx = 0.0f;
        float dy = 0.0f;
        if (this.mSelected != null) {
            getSelectedDxDy(this.mTmpPosition);
            dx = this.mTmpPosition[0];
            dy = this.mTmpPosition[1];
        }
        this.mCallback.onDraw(c, parent, this.mSelected, this.mRecoverAnimations, this.mActionState, dx, dy);
    }

    /* JADX WARNING: Removed duplicated region for block: B:42:0x0137  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x0142  */
    private void select(android.support.v7.widget.RecyclerView.ViewHolder r29, int r30) {
        /*
        r28 = this;
        r11 = r28;
        r12 = r29;
        r13 = r30;
        r0 = r11.mSelected;
        if (r12 != r0) goto L_0x000f;
    L_0x000a:
        r0 = r11.mActionState;
        if (r13 != r0) goto L_0x000f;
    L_0x000e:
        return;
    L_0x000f:
        r0 = -9223372036854775808;
        r11.mDragScrollStartTimeInMs = r0;
        r14 = r11.mActionState;
        r15 = 1;
        r11.endRecoverAnimation(r12, r15);
        r11.mActionState = r13;
        r10 = 2;
        if (r13 != r10) goto L_0x0025;
    L_0x001e:
        r0 = r12.itemView;
        r11.mOverdrawChild = r0;
        r28.addChildDrawingOrderCallback();
    L_0x0025:
        r9 = 8;
        r0 = r9 * r13;
        r0 = r0 + r9;
        r0 = r15 << r0;
        r16 = r0 + -1;
        r17 = 0;
        r0 = r11.mSelected;
        r8 = 0;
        if (r0 == 0) goto L_0x00f7;
    L_0x0035:
        r7 = r11.mSelected;
        r0 = r7.itemView;
        r0 = r0.getParent();
        if (r0 == 0) goto L_0x00de;
    L_0x003f:
        if (r14 != r10) goto L_0x0043;
    L_0x0041:
        r0 = r8;
        goto L_0x0047;
    L_0x0043:
        r0 = r11.swipeIfNecessary(r7);
    L_0x0047:
        r6 = r0;
        r28.releaseVelocityTracker();
        r0 = 4;
        if (r6 == r0) goto L_0x0072;
    L_0x004e:
        if (r6 == r9) goto L_0x0072;
    L_0x0050:
        r1 = 16;
        if (r6 == r1) goto L_0x0072;
    L_0x0054:
        r1 = 32;
        if (r6 == r1) goto L_0x0072;
    L_0x0058:
        switch(r6) {
            case 1: goto L_0x0062;
            case 2: goto L_0x0062;
            default: goto L_0x005b;
        };
    L_0x005b:
        r1 = 0;
        r2 = 0;
    L_0x005d:
        r18 = r1;
        r19 = r2;
        goto L_0x0086;
    L_0x0062:
        r1 = 0;
        r2 = r11.mDy;
        r2 = java.lang.Math.signum(r2);
        r3 = r11.mRecyclerView;
        r3 = r3.getHeight();
        r3 = (float) r3;
        r2 = r2 * r3;
        goto L_0x005d;
    L_0x0072:
        r1 = 0;
        r2 = r11.mDx;
        r2 = java.lang.Math.signum(r2);
        r3 = r11.mRecyclerView;
        r3 = r3.getWidth();
        r3 = (float) r3;
        r2 = r2 * r3;
        r19 = r1;
        r18 = r2;
    L_0x0086:
        if (r14 != r10) goto L_0x008b;
    L_0x0088:
        r0 = 8;
    L_0x008a:
        goto L_0x0090;
    L_0x008b:
        if (r6 <= 0) goto L_0x008f;
    L_0x008d:
        r0 = 2;
        goto L_0x008a;
    L_0x0090:
        r5 = r0;
        r0 = r11.mTmpPosition;
        r11.getSelectedDxDy(r0);
        r0 = r11.mTmpPosition;
        r20 = r0[r8];
        r0 = r11.mTmpPosition;
        r21 = r0[r15];
        r22 = new android.support.v7.widget.helper.ItemTouchHelper$3;
        r0 = r22;
        r1 = r11;
        r2 = r7;
        r3 = r5;
        r4 = r14;
        r15 = r5;
        r5 = r20;
        r23 = r6;
        r6 = r21;
        r24 = r7;
        r7 = r18;
        r25 = r14;
        r14 = r8;
        r8 = r19;
        r26 = r9;
        r9 = r23;
        r14 = r10;
        r10 = r24;
        r0.<init>(r2, r3, r4, r5, r6, r7, r8, r9, r10);
        r1 = r11.mCallback;
        r2 = r11.mRecyclerView;
        r3 = r18 - r20;
        r4 = r19 - r21;
        r1 = r1.getAnimationDuration(r2, r15, r3, r4);
        r0.setDuration(r1);
        r3 = r11.mRecoverAnimations;
        r3.add(r0);
        r0.start();
        r0 = 1;
        r17 = r0;
        r0 = r24;
        goto L_0x00f3;
    L_0x00de:
        r24 = r7;
        r26 = r9;
        r25 = r14;
        r14 = r10;
        r0 = r24;
        r1 = r0.itemView;
        r11.removeChildDrawingOrderCallbackIfNecessary(r1);
        r1 = r11.mCallback;
        r2 = r11.mRecyclerView;
        r1.clearView(r2, r0);
    L_0x00f3:
        r1 = 0;
        r11.mSelected = r1;
        goto L_0x00fc;
    L_0x00f7:
        r26 = r9;
        r25 = r14;
        r14 = r10;
    L_0x00fc:
        if (r12 == 0) goto L_0x012e;
    L_0x00fe:
        r0 = r11.mCallback;
        r1 = r11.mRecyclerView;
        r0 = r0.getAbsoluteMovementFlags(r1, r12);
        r0 = r0 & r16;
        r1 = r11.mActionState;
        r1 = r1 * 8;
        r0 = r0 >> r1;
        r11.mSelectedFlags = r0;
        r0 = r12.itemView;
        r0 = r0.getLeft();
        r0 = (float) r0;
        r11.mSelectedStartX = r0;
        r0 = r12.itemView;
        r0 = r0.getTop();
        r0 = (float) r0;
        r11.mSelectedStartY = r0;
        r11.mSelected = r12;
        if (r13 != r14) goto L_0x012e;
    L_0x0125:
        r0 = r11.mSelected;
        r0 = r0.itemView;
        r1 = 0;
        r0.performHapticFeedback(r1);
        goto L_0x012f;
    L_0x012e:
        r1 = 0;
    L_0x012f:
        r0 = r11.mRecyclerView;
        r0 = r0.getParent();
        if (r0 == 0) goto L_0x0140;
    L_0x0137:
        r2 = r11.mSelected;
        if (r2 == 0) goto L_0x013d;
    L_0x013b:
        r1 = 1;
    L_0x013d:
        r0.requestDisallowInterceptTouchEvent(r1);
    L_0x0140:
        if (r17 != 0) goto L_0x014b;
    L_0x0142:
        r1 = r11.mRecyclerView;
        r1 = r1.getLayoutManager();
        r1.requestSimpleAnimationsInNextLayout();
    L_0x014b:
        r1 = r11.mCallback;
        r2 = r11.mSelected;
        r3 = r11.mActionState;
        r1.onSelectedChanged(r2, r3);
        r1 = r11.mRecyclerView;
        r1.invalidate();
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.helper.ItemTouchHelper.select(android.support.v7.widget.RecyclerView$ViewHolder, int):void");
    }

    private void postDispatchSwipe(final RecoverAnimation anim, final int swipeDir) {
        this.mRecyclerView.post(new Runnable() {
            public void run() {
                if (ItemTouchHelper.this.mRecyclerView != null && ItemTouchHelper.this.mRecyclerView.isAttachedToWindow() && !anim.mOverridden && anim.mViewHolder.getAdapterPosition() != -1) {
                    ItemAnimator animator = ItemTouchHelper.this.mRecyclerView.getItemAnimator();
                    if ((animator == null || !animator.isRunning(null)) && !ItemTouchHelper.this.hasRunningRecoverAnim()) {
                        ItemTouchHelper.this.mCallback.onSwiped(anim.mViewHolder, swipeDir);
                    } else {
                        ItemTouchHelper.this.mRecyclerView.post(this);
                    }
                }
            }
        });
    }

    private boolean hasRunningRecoverAnim() {
        int size = this.mRecoverAnimations.size();
        for (int i = 0; i < size; i++) {
            if (!((RecoverAnimation) this.mRecoverAnimations.get(i)).mEnded) {
                return true;
            }
        }
        return false;
    }

    private boolean scrollIfNecessary() {
        if (this.mSelected == null) {
            this.mDragScrollStartTimeInMs = Long.MIN_VALUE;
            return false;
        }
        int curX;
        long now = System.currentTimeMillis();
        long scrollDuration = this.mDragScrollStartTimeInMs == Long.MIN_VALUE ? 0 : now - this.mDragScrollStartTimeInMs;
        LayoutManager lm = this.mRecyclerView.getLayoutManager();
        if (this.mTmpRect == null) {
            this.mTmpRect = new Rect();
        }
        int scrollX = 0;
        int scrollY = 0;
        lm.calculateItemDecorationsForChild(this.mSelected.itemView, this.mTmpRect);
        if (lm.canScrollHorizontally()) {
            curX = (int) (this.mSelectedStartX + this.mDx);
            int leftDiff = (curX - this.mTmpRect.left) - this.mRecyclerView.getPaddingLeft();
            if (this.mDx < 0.0f && leftDiff < 0) {
                scrollX = leftDiff;
            } else if (this.mDx > 0.0f) {
                int rightDiff = ((this.mSelected.itemView.getWidth() + curX) + this.mTmpRect.right) - (this.mRecyclerView.getWidth() - this.mRecyclerView.getPaddingRight());
                if (rightDiff > 0) {
                    scrollX = rightDiff;
                }
            }
        }
        if (lm.canScrollVertically()) {
            int curY = (int) (this.mSelectedStartY + this.mDy);
            curX = (curY - this.mTmpRect.top) - this.mRecyclerView.getPaddingTop();
            if (this.mDy < 0.0f && curX < 0) {
                scrollY = curX;
            } else if (this.mDy > 0.0f) {
                int bottomDiff = ((this.mSelected.itemView.getHeight() + curY) + this.mTmpRect.bottom) - (this.mRecyclerView.getHeight() - this.mRecyclerView.getPaddingBottom());
                if (bottomDiff > 0) {
                    scrollY = bottomDiff;
                }
            }
        }
        if (scrollX != 0) {
            scrollX = this.mCallback.interpolateOutOfBoundsScroll(this.mRecyclerView, this.mSelected.itemView.getWidth(), scrollX, this.mRecyclerView.getWidth(), scrollDuration);
        }
        if (scrollY != 0) {
            scrollY = this.mCallback.interpolateOutOfBoundsScroll(this.mRecyclerView, this.mSelected.itemView.getHeight(), scrollY, this.mRecyclerView.getHeight(), scrollDuration);
        }
        if (scrollX == 0 && scrollY == 0) {
            this.mDragScrollStartTimeInMs = Long.MIN_VALUE;
            return false;
        }
        if (this.mDragScrollStartTimeInMs == Long.MIN_VALUE) {
            this.mDragScrollStartTimeInMs = now;
        }
        this.mRecyclerView.scrollBy(scrollX, scrollY);
        return true;
    }

    private List<ViewHolder> findSwapTargets(ViewHolder viewHolder) {
        int left;
        ViewHolder viewHolder2 = viewHolder;
        if (this.mSwapTargets == null) {
            this.mSwapTargets = new ArrayList();
            this.mDistances = new ArrayList();
        } else {
            this.mSwapTargets.clear();
            this.mDistances.clear();
        }
        int margin = this.mCallback.getBoundingBoxMargin();
        int left2 = Math.round(this.mSelectedStartX + this.mDx) - margin;
        int top = Math.round(this.mSelectedStartY + this.mDy) - margin;
        int right = (viewHolder2.itemView.getWidth() + left2) + (2 * margin);
        int bottom = (viewHolder2.itemView.getHeight() + top) + (2 * margin);
        int centerX = (left2 + right) / 2;
        int centerY = (top + bottom) / 2;
        LayoutManager lm = this.mRecyclerView.getLayoutManager();
        int childCount = lm.getChildCount();
        int i = 0;
        while (i < childCount) {
            int margin2;
            View other = lm.getChildAt(i);
            if (other != viewHolder2.itemView) {
                if (other.getBottom() >= top && other.getTop() <= bottom && other.getRight() >= left2) {
                    if (other.getLeft() <= right) {
                        ViewHolder otherVh = this.mRecyclerView.getChildViewHolder(other);
                        if (this.mCallback.canDropOver(this.mRecyclerView, this.mSelected, otherVh)) {
                            int dx = Math.abs(centerX - ((other.getLeft() + other.getRight()) / 2));
                            int dy = Math.abs(centerY - ((other.getTop() + other.getBottom()) / 2));
                            int dist = (dx * dx) + (dy * dy);
                            dx = this.mSwapTargets.size();
                            margin2 = margin;
                            margin = 0;
                            int j = 0;
                            while (true) {
                                left = left2;
                                left2 = j;
                                if (left2 >= dx) {
                                    break;
                                }
                                int cnt = dx;
                                if (dist <= ((Integer) this.mDistances.get(left2)).intValue()) {
                                    break;
                                }
                                margin++;
                                j = left2 + 1;
                                left2 = left;
                                dx = cnt;
                            }
                            this.mSwapTargets.add(margin, otherVh);
                            this.mDistances.add(margin, Integer.valueOf(dist));
                            i++;
                            margin = margin2;
                            left2 = left;
                            viewHolder2 = viewHolder;
                        }
                    }
                }
                margin2 = margin;
                left = left2;
                i++;
                margin = margin2;
                left2 = left;
                viewHolder2 = viewHolder;
            }
            margin2 = margin;
            left = left2;
            i++;
            margin = margin2;
            left2 = left;
            viewHolder2 = viewHolder;
        }
        left = left2;
        return this.mSwapTargets;
    }

    private void moveIfNecessary(ViewHolder viewHolder) {
        ViewHolder viewHolder2 = viewHolder;
        if (!this.mRecyclerView.isLayoutRequested() && this.mActionState == 2) {
            float threshold = this.mCallback.getMoveThreshold(viewHolder2);
            int x = (int) (this.mSelectedStartX + this.mDx);
            int y = (int) (this.mSelectedStartY + this.mDy);
            if (((float) Math.abs(y - viewHolder2.itemView.getTop())) >= ((float) viewHolder2.itemView.getHeight()) * threshold || ((float) Math.abs(x - viewHolder2.itemView.getLeft())) >= ((float) viewHolder2.itemView.getWidth()) * threshold) {
                List<ViewHolder> swapTargets = findSwapTargets(viewHolder);
                if (swapTargets.size() != 0) {
                    ViewHolder target = this.mCallback.chooseDropTarget(viewHolder2, swapTargets, x, y);
                    if (target == null) {
                        this.mSwapTargets.clear();
                        this.mDistances.clear();
                        return;
                    }
                    int toPosition = target.getAdapterPosition();
                    int fromPosition = viewHolder.getAdapterPosition();
                    if (this.mCallback.onMove(this.mRecyclerView, viewHolder2, target)) {
                        this.mCallback.onMoved(this.mRecyclerView, viewHolder2, fromPosition, target, toPosition, x, y);
                    }
                }
            }
        }
    }

    public void onChildViewAttachedToWindow(View view) {
    }

    public void onChildViewDetachedFromWindow(View view) {
        removeChildDrawingOrderCallbackIfNecessary(view);
        ViewHolder holder = this.mRecyclerView.getChildViewHolder(view);
        if (holder != null) {
            if (this.mSelected == null || holder != this.mSelected) {
                endRecoverAnimation(holder, false);
                if (this.mPendingCleanup.remove(holder.itemView)) {
                    this.mCallback.clearView(this.mRecyclerView, holder);
                }
            } else {
                select(null, 0);
            }
        }
    }

    private int endRecoverAnimation(ViewHolder viewHolder, boolean override) {
        for (int i = this.mRecoverAnimations.size() - 1; i >= 0; i--) {
            RecoverAnimation anim = (RecoverAnimation) this.mRecoverAnimations.get(i);
            if (anim.mViewHolder == viewHolder) {
                anim.mOverridden |= override;
                if (!anim.mEnded) {
                    anim.cancel();
                }
                this.mRecoverAnimations.remove(i);
                anim.mViewHolder.setIsRecyclable(true);
                return anim.mAnimationType;
            }
        }
        return 0;
    }

    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, State state) {
        outRect.setEmpty();
    }

    private void obtainVelocityTracker() {
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
        }
        this.mVelocityTracker = VelocityTracker.obtain();
    }

    private void releaseVelocityTracker() {
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private ViewHolder findSwipedView(MotionEvent motionEvent) {
        LayoutManager lm = this.mRecyclerView.getLayoutManager();
        if (this.mActivePointerId == -1) {
            return null;
        }
        int pointerIndex = MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId);
        float dy = MotionEventCompat.getY(motionEvent, pointerIndex) - this.mInitialTouchY;
        float absDx = Math.abs(MotionEventCompat.getX(motionEvent, pointerIndex) - this.mInitialTouchX);
        float absDy = Math.abs(dy);
        if (absDx < ((float) this.mSlop) && absDy < ((float) this.mSlop)) {
            return null;
        }
        if (absDx > absDy && lm.canScrollHorizontally()) {
            return null;
        }
        if (absDy > absDx && lm.canScrollVertically()) {
            return null;
        }
        View child = findChildView(motionEvent);
        if (child == null) {
            return null;
        }
        return this.mRecyclerView.getChildViewHolder(child);
    }

    private boolean checkSelectForSwipe(int action, MotionEvent motionEvent, int pointerIndex) {
        MotionEvent motionEvent2 = motionEvent;
        if (this.mSelected != null) {
            int i = action;
        } else if (action != 2 || this.mActionState == 2 || !this.mCallback.isItemViewSwipeEnabled() || this.mRecyclerView.getScrollState() == 1) {
            return false;
        } else {
            ViewHolder vh = findSwipedView(motionEvent2);
            if (vh == null) {
                return false;
            }
            int swipeFlags = (65280 & this.mCallback.getAbsoluteMovementFlags(this.mRecyclerView, vh)) >> 8;
            if (swipeFlags == 0) {
                return false;
            }
            float x = MotionEventCompat.getX(motionEvent, pointerIndex);
            float dx = x - this.mInitialTouchX;
            float dy = MotionEventCompat.getY(motionEvent, pointerIndex) - this.mInitialTouchY;
            float absDx = Math.abs(dx);
            float absDy = Math.abs(dy);
            if (absDx < ((float) this.mSlop) && absDy < ((float) this.mSlop)) {
                return false;
            }
            if (absDx > absDy) {
                if (dx < 0.0f && (swipeFlags & 4) == 0) {
                    return false;
                }
                if (dx > 0.0f && (swipeFlags & 8) == 0) {
                    return false;
                }
            } else if (dy < 0.0f && (swipeFlags & 1) == 0) {
                return false;
            } else {
                if (dy > 0.0f && (swipeFlags & 2) == 0) {
                    return false;
                }
            }
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent2, 0);
            select(vh, 1);
            return true;
        }
        return false;
    }

    private View findChildView(MotionEvent event) {
        float x = event.getX();
        float y = event.getY();
        if (this.mSelected != null) {
            View selectedView = this.mSelected.itemView;
            if (hitTest(selectedView, x, y, this.mSelectedStartX + this.mDx, this.mSelectedStartY + this.mDy)) {
                return selectedView;
            }
        }
        for (int i = this.mRecoverAnimations.size() - 1; i >= 0; i--) {
            RecoverAnimation anim = (RecoverAnimation) this.mRecoverAnimations.get(i);
            View view = anim.mViewHolder.itemView;
            if (hitTest(view, x, y, anim.mX, anim.mY)) {
                return view;
            }
        }
        return this.mRecyclerView.findChildViewUnder(x, y);
    }

    public void startDrag(ViewHolder viewHolder) {
        if (!this.mCallback.hasDragFlag(this.mRecyclerView, viewHolder)) {
            Log.e(TAG, "Start drag has been called but swiping is not enabled");
        } else if (viewHolder.itemView.getParent() != this.mRecyclerView) {
            Log.e(TAG, "Start drag has been called with a view holder which is not a child of the RecyclerView which is controlled by this ItemTouchHelper.");
        } else {
            obtainVelocityTracker();
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            select(viewHolder, 2);
        }
    }

    public void startSwipe(ViewHolder viewHolder) {
        if (!this.mCallback.hasSwipeFlag(this.mRecyclerView, viewHolder)) {
            Log.e(TAG, "Start swipe has been called but dragging is not enabled");
        } else if (viewHolder.itemView.getParent() != this.mRecyclerView) {
            Log.e(TAG, "Start swipe has been called with a view holder which is not a child of the RecyclerView controlled by this ItemTouchHelper.");
        } else {
            obtainVelocityTracker();
            this.mDy = 0.0f;
            this.mDx = 0.0f;
            select(viewHolder, 1);
        }
    }

    private RecoverAnimation findAnimation(MotionEvent event) {
        if (this.mRecoverAnimations.isEmpty()) {
            return null;
        }
        View target = findChildView(event);
        for (int i = this.mRecoverAnimations.size() - 1; i >= 0; i--) {
            RecoverAnimation anim = (RecoverAnimation) this.mRecoverAnimations.get(i);
            if (anim.mViewHolder.itemView == target) {
                return anim;
            }
        }
        return null;
    }

    private void updateDxDy(MotionEvent ev, int directionFlags, int pointerIndex) {
        float x = MotionEventCompat.getX(ev, pointerIndex);
        float y = MotionEventCompat.getY(ev, pointerIndex);
        this.mDx = x - this.mInitialTouchX;
        this.mDy = y - this.mInitialTouchY;
        if ((directionFlags & 4) == 0) {
            this.mDx = Math.max(0.0f, this.mDx);
        }
        if ((directionFlags & 8) == 0) {
            this.mDx = Math.min(0.0f, this.mDx);
        }
        if ((directionFlags & 1) == 0) {
            this.mDy = Math.max(0.0f, this.mDy);
        }
        if ((directionFlags & 2) == 0) {
            this.mDy = Math.min(0.0f, this.mDy);
        }
    }

    private int swipeIfNecessary(ViewHolder viewHolder) {
        if (this.mActionState == 2) {
            return 0;
        }
        int originalMovementFlags = this.mCallback.getMovementFlags(this.mRecyclerView, viewHolder);
        int flags = (this.mCallback.convertToAbsoluteDirection(originalMovementFlags, ViewCompat.getLayoutDirection(this.mRecyclerView)) & 65280) >> 8;
        if (flags == 0) {
            return 0;
        }
        int originalFlags = (65280 & originalMovementFlags) >> 8;
        int checkHorizontalSwipe;
        int swipeDir;
        if (Math.abs(this.mDx) > Math.abs(this.mDy)) {
            checkHorizontalSwipe = checkHorizontalSwipe(viewHolder, flags);
            swipeDir = checkHorizontalSwipe;
            if (checkHorizontalSwipe <= 0) {
                checkHorizontalSwipe = checkVerticalSwipe(viewHolder, flags);
                swipeDir = checkHorizontalSwipe;
                if (checkHorizontalSwipe > 0) {
                    return swipeDir;
                }
            } else if ((originalFlags & swipeDir) == 0) {
                return Callback.convertToRelativeDirection(swipeDir, ViewCompat.getLayoutDirection(this.mRecyclerView));
            } else {
                return swipeDir;
            }
        }
        checkHorizontalSwipe = checkVerticalSwipe(viewHolder, flags);
        swipeDir = checkHorizontalSwipe;
        if (checkHorizontalSwipe > 0) {
            return swipeDir;
        }
        checkHorizontalSwipe = checkHorizontalSwipe(viewHolder, flags);
        swipeDir = checkHorizontalSwipe;
        if (checkHorizontalSwipe > 0) {
            if ((originalFlags & swipeDir) == 0) {
                return Callback.convertToRelativeDirection(swipeDir, ViewCompat.getLayoutDirection(this.mRecyclerView));
            }
            return swipeDir;
        }
        return 0;
    }

    private int checkHorizontalSwipe(ViewHolder viewHolder, int flags) {
        if ((flags & 12) != 0) {
            int i = 4;
            int dirFlag = this.mDx > 0.0f ? 8 : 4;
            if (this.mVelocityTracker != null && this.mActivePointerId > -1) {
                float xVelocity = VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId);
                if (xVelocity > 0.0f) {
                    i = 8;
                }
                int velDirFlag = i;
                if ((velDirFlag & flags) != 0 && dirFlag == velDirFlag && Math.abs(xVelocity) >= ((float) this.mRecyclerView.getMinFlingVelocity())) {
                    return velDirFlag;
                }
            }
            float threshold = ((float) this.mRecyclerView.getWidth()) * this.mCallback.getSwipeThreshold(viewHolder);
            if ((flags & dirFlag) != 0 && Math.abs(this.mDx) > threshold) {
                return dirFlag;
            }
        }
        return 0;
    }

    private int checkVerticalSwipe(ViewHolder viewHolder, int flags) {
        if ((flags & 3) != 0) {
            int i = 1;
            int dirFlag = this.mDy > 0.0f ? 2 : 1;
            if (this.mVelocityTracker != null && this.mActivePointerId > -1) {
                float yVelocity = VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId);
                if (yVelocity > 0.0f) {
                    i = 2;
                }
                int velDirFlag = i;
                if ((velDirFlag & flags) != 0 && velDirFlag == dirFlag && Math.abs(yVelocity) >= ((float) this.mRecyclerView.getMinFlingVelocity())) {
                    return velDirFlag;
                }
            }
            float threshold = ((float) this.mRecyclerView.getHeight()) * this.mCallback.getSwipeThreshold(viewHolder);
            if ((flags & dirFlag) != 0 && Math.abs(this.mDy) > threshold) {
                return dirFlag;
            }
        }
        return 0;
    }

    private void addChildDrawingOrderCallback() {
        if (VERSION.SDK_INT < 21) {
            if (this.mChildDrawingOrderCallback == null) {
                this.mChildDrawingOrderCallback = new ChildDrawingOrderCallback() {
                    public int onGetChildDrawingOrder(int childCount, int i) {
                        if (ItemTouchHelper.this.mOverdrawChild == null) {
                            return i;
                        }
                        int childPosition = ItemTouchHelper.this.mOverdrawChildPosition;
                        if (childPosition == -1) {
                            childPosition = ItemTouchHelper.this.mRecyclerView.indexOfChild(ItemTouchHelper.this.mOverdrawChild);
                            ItemTouchHelper.this.mOverdrawChildPosition = childPosition;
                        }
                        if (i == childCount - 1) {
                            return childPosition;
                        }
                        return i < childPosition ? i : i + 1;
                    }
                };
            }
            this.mRecyclerView.setChildDrawingOrderCallback(this.mChildDrawingOrderCallback);
        }
    }

    private void removeChildDrawingOrderCallbackIfNecessary(View view) {
        if (view == this.mOverdrawChild) {
            this.mOverdrawChild = null;
            if (this.mChildDrawingOrderCallback != null) {
                this.mRecyclerView.setChildDrawingOrderCallback(null);
            }
        }
    }
}
