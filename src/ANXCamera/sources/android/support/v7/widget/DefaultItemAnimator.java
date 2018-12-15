package android.support.v7.widget;

import android.support.v4.animation.AnimatorCompatHelper;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DefaultItemAnimator extends ItemAnimator {
    private static final boolean DEBUG = false;
    private ArrayList<ViewHolder> mAddAnimations = new ArrayList();
    private ArrayList<ArrayList<ViewHolder>> mAdditionsList = new ArrayList();
    private ArrayList<ViewHolder> mChangeAnimations = new ArrayList();
    private ArrayList<ArrayList<ChangeInfo>> mChangesList = new ArrayList();
    private ArrayList<ViewHolder> mMoveAnimations = new ArrayList();
    private ArrayList<ArrayList<MoveInfo>> mMovesList = new ArrayList();
    private ArrayList<ViewHolder> mPendingAdditions = new ArrayList();
    private ArrayList<ChangeInfo> mPendingChanges = new ArrayList();
    private ArrayList<MoveInfo> mPendingMoves = new ArrayList();
    private ArrayList<ViewHolder> mPendingRemovals = new ArrayList();
    private ArrayList<ViewHolder> mRemoveAnimations = new ArrayList();

    private static class VpaListenerAdapter implements ViewPropertyAnimatorListener {
        private VpaListenerAdapter() {
        }

        /* synthetic */ VpaListenerAdapter(AnonymousClass1 x0) {
            this();
        }

        public void onAnimationStart(View view) {
        }

        public void onAnimationEnd(View view) {
        }

        public void onAnimationCancel(View view) {
        }
    }

    private static class ChangeInfo {
        public int fromX;
        public int fromY;
        public ViewHolder newHolder;
        public ViewHolder oldHolder;
        public int toX;
        public int toY;

        /* synthetic */ ChangeInfo(ViewHolder x0, ViewHolder x1, int x2, int x3, int x4, int x5, AnonymousClass1 x6) {
            this(x0, x1, x2, x3, x4, x5);
        }

        private ChangeInfo(ViewHolder oldHolder, ViewHolder newHolder) {
            this.oldHolder = oldHolder;
            this.newHolder = newHolder;
        }

        private ChangeInfo(ViewHolder oldHolder, ViewHolder newHolder, int fromX, int fromY, int toX, int toY) {
            this(oldHolder, newHolder);
            this.fromX = fromX;
            this.fromY = fromY;
            this.toX = toX;
            this.toY = toY;
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("ChangeInfo{oldHolder=");
            stringBuilder.append(this.oldHolder);
            stringBuilder.append(", newHolder=");
            stringBuilder.append(this.newHolder);
            stringBuilder.append(", fromX=");
            stringBuilder.append(this.fromX);
            stringBuilder.append(", fromY=");
            stringBuilder.append(this.fromY);
            stringBuilder.append(", toX=");
            stringBuilder.append(this.toX);
            stringBuilder.append(", toY=");
            stringBuilder.append(this.toY);
            stringBuilder.append('}');
            return stringBuilder.toString();
        }
    }

    private static class MoveInfo {
        public int fromX;
        public int fromY;
        public ViewHolder holder;
        public int toX;
        public int toY;

        /* synthetic */ MoveInfo(ViewHolder x0, int x1, int x2, int x3, int x4, AnonymousClass1 x5) {
            this(x0, x1, x2, x3, x4);
        }

        private MoveInfo(ViewHolder holder, int fromX, int fromY, int toX, int toY) {
            this.holder = holder;
            this.fromX = fromX;
            this.fromY = fromY;
            this.toX = toX;
            this.toY = toY;
        }
    }

    public void runPendingAnimations() {
        boolean removalsPending = this.mPendingRemovals.isEmpty() ^ 1;
        boolean movesPending = this.mPendingMoves.isEmpty() ^ 1;
        boolean changesPending = this.mPendingChanges.isEmpty() ^ 1;
        boolean additionsPending = this.mPendingAdditions.isEmpty() ^ 1;
        if (removalsPending || movesPending || additionsPending || changesPending) {
            Runnable mover;
            Iterator i$ = this.mPendingRemovals.iterator();
            while (i$.hasNext()) {
                animateRemoveImpl((ViewHolder) i$.next());
            }
            this.mPendingRemovals.clear();
            if (movesPending) {
                final ArrayList<MoveInfo> moves = new ArrayList();
                moves.addAll(this.mPendingMoves);
                this.mMovesList.add(moves);
                this.mPendingMoves.clear();
                mover = new Runnable() {
                    public void run() {
                        Iterator i$ = moves.iterator();
                        while (i$.hasNext()) {
                            MoveInfo moveInfo = (MoveInfo) i$.next();
                            DefaultItemAnimator.this.animateMoveImpl(moveInfo.holder, moveInfo.fromX, moveInfo.fromY, moveInfo.toX, moveInfo.toY);
                        }
                        moves.clear();
                        DefaultItemAnimator.this.mMovesList.remove(moves);
                    }
                };
                if (removalsPending) {
                    ViewCompat.postOnAnimationDelayed(((MoveInfo) moves.get(0)).holder.itemView, mover, getRemoveDuration());
                } else {
                    mover.run();
                }
            }
            if (changesPending) {
                final ArrayList<ChangeInfo> changes = new ArrayList();
                changes.addAll(this.mPendingChanges);
                this.mChangesList.add(changes);
                this.mPendingChanges.clear();
                mover = new Runnable() {
                    public void run() {
                        Iterator i$ = changes.iterator();
                        while (i$.hasNext()) {
                            DefaultItemAnimator.this.animateChangeImpl((ChangeInfo) i$.next());
                        }
                        changes.clear();
                        DefaultItemAnimator.this.mChangesList.remove(changes);
                    }
                };
                if (removalsPending) {
                    ViewCompat.postOnAnimationDelayed(((ChangeInfo) changes.get(0)).oldHolder.itemView, mover, getRemoveDuration());
                } else {
                    mover.run();
                }
            }
            if (additionsPending) {
                final ArrayList<ViewHolder> additions = new ArrayList();
                additions.addAll(this.mPendingAdditions);
                this.mAdditionsList.add(additions);
                this.mPendingAdditions.clear();
                mover = new Runnable() {
                    public void run() {
                        Iterator i$ = additions.iterator();
                        while (i$.hasNext()) {
                            DefaultItemAnimator.this.animateAddImpl((ViewHolder) i$.next());
                        }
                        additions.clear();
                        DefaultItemAnimator.this.mAdditionsList.remove(additions);
                    }
                };
                if (removalsPending || movesPending || changesPending) {
                    long changeDuration = 0;
                    long removeDuration = removalsPending ? getRemoveDuration() : 0;
                    long moveDuration = movesPending ? getMoveDuration() : 0;
                    if (changesPending) {
                        changeDuration = getChangeDuration();
                    }
                    ViewCompat.postOnAnimationDelayed(((ViewHolder) additions.get(0)).itemView, mover, Math.max(moveDuration, changeDuration) + removeDuration);
                } else {
                    mover.run();
                }
            }
        }
    }

    public boolean animateRemove(ViewHolder holder) {
        resetAnimation(holder);
        this.mPendingRemovals.add(holder);
        return true;
    }

    private void animateRemoveImpl(final ViewHolder holder) {
        final ViewPropertyAnimatorCompat animation = ViewCompat.animate(holder.itemView);
        this.mRemoveAnimations.add(holder);
        animation.setDuration(getRemoveDuration()).alpha(0.0f).setListener(new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchRemoveStarting(holder);
            }

            public void onAnimationEnd(View view) {
                animation.setListener(null);
                ViewCompat.setAlpha(view, 1.0f);
                DefaultItemAnimator.this.dispatchRemoveFinished(holder);
                DefaultItemAnimator.this.mRemoveAnimations.remove(holder);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        }).start();
    }

    public boolean animateAdd(ViewHolder holder) {
        resetAnimation(holder);
        ViewCompat.setAlpha(holder.itemView, 0.0f);
        this.mPendingAdditions.add(holder);
        return true;
    }

    private void animateAddImpl(final ViewHolder holder) {
        final ViewPropertyAnimatorCompat animation = ViewCompat.animate(holder.itemView);
        this.mAddAnimations.add(holder);
        animation.alpha(1.0f).setDuration(getAddDuration()).setListener(new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchAddStarting(holder);
            }

            public void onAnimationCancel(View view) {
                ViewCompat.setAlpha(view, 1.0f);
            }

            public void onAnimationEnd(View view) {
                animation.setListener(null);
                DefaultItemAnimator.this.dispatchAddFinished(holder);
                DefaultItemAnimator.this.mAddAnimations.remove(holder);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        }).start();
    }

    public boolean animateMove(ViewHolder holder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = holder;
        View view = viewHolder.itemView;
        int fromX2 = (int) (((float) fromX) + ViewCompat.getTranslationX(viewHolder.itemView));
        int fromY2 = (int) (((float) fromY) + ViewCompat.getTranslationY(viewHolder.itemView));
        resetAnimation(holder);
        int deltaX = toX - fromX2;
        int deltaY = toY - fromY2;
        if (deltaX == 0 && deltaY == 0) {
            dispatchMoveFinished(holder);
            return false;
        }
        if (deltaX != 0) {
            ViewCompat.setTranslationX(view, (float) (-deltaX));
        }
        if (deltaY != 0) {
            ViewCompat.setTranslationY(view, (float) (-deltaY));
        }
        MoveInfo moveInfo = r0;
        ArrayList arrayList = this.mPendingMoves;
        MoveInfo moveInfo2 = new MoveInfo(viewHolder, fromX2, fromY2, toX, toY, null);
        arrayList.add(moveInfo);
        return true;
    }

    private void animateMoveImpl(ViewHolder holder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = holder;
        View view = viewHolder.itemView;
        int deltaX = toX - fromX;
        int deltaY = toY - fromY;
        if (deltaX != 0) {
            ViewCompat.animate(view).translationX(0.0f);
        }
        if (deltaY != 0) {
            ViewCompat.animate(view).translationY(0.0f);
        }
        ViewPropertyAnimatorCompat animation = ViewCompat.animate(view);
        this.mMoveAnimations.add(viewHolder);
        final ViewHolder viewHolder2 = viewHolder;
        final int i = deltaX;
        AnonymousClass6 anonymousClass6 = r0;
        final int i2 = deltaY;
        ViewPropertyAnimatorCompat duration = animation.setDuration(getMoveDuration());
        final ViewPropertyAnimatorCompat viewPropertyAnimatorCompat = animation;
        AnonymousClass6 anonymousClass62 = new VpaListenerAdapter() {
            public void onAnimationStart(View view) {
                DefaultItemAnimator.this.dispatchMoveStarting(viewHolder2);
            }

            public void onAnimationCancel(View view) {
                if (i != 0) {
                    ViewCompat.setTranslationX(view, 0.0f);
                }
                if (i2 != 0) {
                    ViewCompat.setTranslationY(view, 0.0f);
                }
            }

            public void onAnimationEnd(View view) {
                viewPropertyAnimatorCompat.setListener(null);
                DefaultItemAnimator.this.dispatchMoveFinished(viewHolder2);
                DefaultItemAnimator.this.mMoveAnimations.remove(viewHolder2);
                DefaultItemAnimator.this.dispatchFinishedWhenDone();
            }
        };
        duration.setListener(anonymousClass6).start();
    }

    public boolean animateChange(ViewHolder oldHolder, ViewHolder newHolder, int fromX, int fromY, int toX, int toY) {
        ViewHolder viewHolder = oldHolder;
        ViewHolder viewHolder2 = newHolder;
        float prevTranslationX = ViewCompat.getTranslationX(viewHolder.itemView);
        float prevTranslationY = ViewCompat.getTranslationY(viewHolder.itemView);
        float prevAlpha = ViewCompat.getAlpha(viewHolder.itemView);
        resetAnimation(oldHolder);
        int deltaX = (int) (((float) (toX - fromX)) - prevTranslationX);
        int deltaY = (int) (((float) (toY - fromY)) - prevTranslationY);
        ViewCompat.setTranslationX(viewHolder.itemView, prevTranslationX);
        ViewCompat.setTranslationY(viewHolder.itemView, prevTranslationY);
        ViewCompat.setAlpha(viewHolder.itemView, prevAlpha);
        if (!(viewHolder2 == null || viewHolder2.itemView == null)) {
            resetAnimation(viewHolder2);
            ViewCompat.setTranslationX(viewHolder2.itemView, (float) (-deltaX));
            ViewCompat.setTranslationY(viewHolder2.itemView, (float) (-deltaY));
            ViewCompat.setAlpha(viewHolder2.itemView, 0.0f);
        }
        ChangeInfo changeInfo = r1;
        ArrayList arrayList = this.mPendingChanges;
        ChangeInfo changeInfo2 = new ChangeInfo(viewHolder, viewHolder2, fromX, fromY, toX, toY, null);
        arrayList.add(changeInfo);
        return true;
    }

    private void animateChangeImpl(final ChangeInfo changeInfo) {
        final ViewPropertyAnimatorCompat oldViewAnim;
        ViewHolder holder = changeInfo.oldHolder;
        View newView = null;
        View view = holder == null ? null : holder.itemView;
        ViewHolder newHolder = changeInfo.newHolder;
        if (newHolder != null) {
            newView = newHolder.itemView;
        }
        if (view != null) {
            oldViewAnim = ViewCompat.animate(view).setDuration(getChangeDuration());
            this.mChangeAnimations.add(changeInfo.oldHolder);
            oldViewAnim.translationX((float) (changeInfo.toX - changeInfo.fromX));
            oldViewAnim.translationY((float) (changeInfo.toY - changeInfo.fromY));
            oldViewAnim.alpha(0.0f).setListener(new VpaListenerAdapter() {
                public void onAnimationStart(View view) {
                    DefaultItemAnimator.this.dispatchChangeStarting(changeInfo.oldHolder, true);
                }

                public void onAnimationEnd(View view) {
                    oldViewAnim.setListener(null);
                    ViewCompat.setAlpha(view, 1.0f);
                    ViewCompat.setTranslationX(view, 0.0f);
                    ViewCompat.setTranslationY(view, 0.0f);
                    DefaultItemAnimator.this.dispatchChangeFinished(changeInfo.oldHolder, true);
                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.oldHolder);
                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                }
            }).start();
        }
        if (newView != null) {
            oldViewAnim = ViewCompat.animate(newView);
            this.mChangeAnimations.add(changeInfo.newHolder);
            oldViewAnim.translationX(0.0f).translationY(0.0f).setDuration(getChangeDuration()).alpha(1.0f).setListener(new VpaListenerAdapter() {
                public void onAnimationStart(View view) {
                    DefaultItemAnimator.this.dispatchChangeStarting(changeInfo.newHolder, false);
                }

                public void onAnimationEnd(View view) {
                    oldViewAnim.setListener(null);
                    ViewCompat.setAlpha(newView, 1.0f);
                    ViewCompat.setTranslationX(newView, 0.0f);
                    ViewCompat.setTranslationY(newView, 0.0f);
                    DefaultItemAnimator.this.dispatchChangeFinished(changeInfo.newHolder, false);
                    DefaultItemAnimator.this.mChangeAnimations.remove(changeInfo.newHolder);
                    DefaultItemAnimator.this.dispatchFinishedWhenDone();
                }
            }).start();
        }
    }

    private void endChangeAnimation(List<ChangeInfo> infoList, ViewHolder item) {
        for (int i = infoList.size() - 1; i >= 0; i--) {
            ChangeInfo changeInfo = (ChangeInfo) infoList.get(i);
            if (endChangeAnimationIfNecessary(changeInfo, item) && changeInfo.oldHolder == null && changeInfo.newHolder == null) {
                infoList.remove(changeInfo);
            }
        }
    }

    private void endChangeAnimationIfNecessary(ChangeInfo changeInfo) {
        if (changeInfo.oldHolder != null) {
            endChangeAnimationIfNecessary(changeInfo, changeInfo.oldHolder);
        }
        if (changeInfo.newHolder != null) {
            endChangeAnimationIfNecessary(changeInfo, changeInfo.newHolder);
        }
    }

    private boolean endChangeAnimationIfNecessary(ChangeInfo changeInfo, ViewHolder item) {
        boolean oldItem = false;
        if (changeInfo.newHolder == item) {
            changeInfo.newHolder = null;
        } else if (changeInfo.oldHolder != item) {
            return false;
        } else {
            changeInfo.oldHolder = null;
            oldItem = true;
        }
        ViewCompat.setAlpha(item.itemView, 1.0f);
        ViewCompat.setTranslationX(item.itemView, 0.0f);
        ViewCompat.setTranslationY(item.itemView, 0.0f);
        dispatchChangeFinished(item, oldItem);
        return true;
    }

    public void endAnimation(ViewHolder item) {
        View view = item.itemView;
        ViewCompat.animate(view).cancel();
        int i = this.mPendingMoves.size();
        while (true) {
            i--;
            if (i < 0) {
                break;
            } else if (((MoveInfo) this.mPendingMoves.get(i)).holder == item) {
                ViewCompat.setTranslationY(view, 0.0f);
                ViewCompat.setTranslationX(view, 0.0f);
                dispatchMoveFinished(item);
                this.mPendingMoves.remove(i);
            }
        }
        endChangeAnimation(this.mPendingChanges, item);
        if (this.mPendingRemovals.remove(item)) {
            ViewCompat.setAlpha(view, 1.0f);
            dispatchRemoveFinished(item);
        }
        if (this.mPendingAdditions.remove(item)) {
            ViewCompat.setAlpha(view, 1.0f);
            dispatchAddFinished(item);
        }
        for (i = this.mChangesList.size() - 1; i >= 0; i--) {
            ArrayList<ChangeInfo> changes = (ArrayList) this.mChangesList.get(i);
            endChangeAnimation(changes, item);
            if (changes.isEmpty()) {
                this.mChangesList.remove(i);
            }
        }
        for (i = this.mMovesList.size() - 1; i >= 0; i--) {
            ArrayList<MoveInfo> moves = (ArrayList) this.mMovesList.get(i);
            int j = moves.size() - 1;
            while (j >= 0) {
                if (((MoveInfo) moves.get(j)).holder == item) {
                    ViewCompat.setTranslationY(view, 0.0f);
                    ViewCompat.setTranslationX(view, 0.0f);
                    dispatchMoveFinished(item);
                    moves.remove(j);
                    if (moves.isEmpty()) {
                        this.mMovesList.remove(i);
                    }
                } else {
                    j--;
                }
            }
        }
        for (i = this.mAdditionsList.size() - 1; i >= 0; i--) {
            ArrayList<ViewHolder> additions = (ArrayList) this.mAdditionsList.get(i);
            if (additions.remove(item)) {
                ViewCompat.setAlpha(view, 1.0f);
                dispatchAddFinished(item);
                if (additions.isEmpty()) {
                    this.mAdditionsList.remove(i);
                }
            }
        }
        this.mRemoveAnimations.remove(item);
        this.mAddAnimations.remove(item);
        this.mChangeAnimations.remove(item);
        this.mMoveAnimations.remove(item);
        dispatchFinishedWhenDone();
    }

    private void resetAnimation(ViewHolder holder) {
        AnimatorCompatHelper.clearInterpolator(holder.itemView);
        endAnimation(holder);
    }

    public boolean isRunning() {
        return (this.mPendingAdditions.isEmpty() && this.mPendingChanges.isEmpty() && this.mPendingMoves.isEmpty() && this.mPendingRemovals.isEmpty() && this.mMoveAnimations.isEmpty() && this.mRemoveAnimations.isEmpty() && this.mAddAnimations.isEmpty() && this.mChangeAnimations.isEmpty() && this.mMovesList.isEmpty() && this.mAdditionsList.isEmpty() && this.mChangesList.isEmpty()) ? false : true;
    }

    private void dispatchFinishedWhenDone() {
        if (!isRunning()) {
            dispatchAnimationsFinished();
        }
    }

    public void endAnimations() {
        int i;
        for (i = this.mPendingMoves.size() - 1; i >= 0; i--) {
            MoveInfo item = (MoveInfo) this.mPendingMoves.get(i);
            View view = item.holder.itemView;
            ViewCompat.setTranslationY(view, 0.0f);
            ViewCompat.setTranslationX(view, 0.0f);
            dispatchMoveFinished(item.holder);
            this.mPendingMoves.remove(i);
        }
        for (i = this.mPendingRemovals.size() - 1; i >= 0; i--) {
            dispatchRemoveFinished((ViewHolder) this.mPendingRemovals.get(i));
            this.mPendingRemovals.remove(i);
        }
        for (i = this.mPendingAdditions.size() - 1; i >= 0; i--) {
            ViewHolder item2 = (ViewHolder) this.mPendingAdditions.get(i);
            ViewCompat.setAlpha(item2.itemView, 1.0f);
            dispatchAddFinished(item2);
            this.mPendingAdditions.remove(i);
        }
        for (i = this.mPendingChanges.size() - 1; i >= 0; i--) {
            endChangeAnimationIfNecessary((ChangeInfo) this.mPendingChanges.get(i));
        }
        this.mPendingChanges.clear();
        if (isRunning()) {
            int i2;
            int i3;
            for (i2 = this.mMovesList.size() - 1; i2 >= 0; i2--) {
                ArrayList<MoveInfo> moves = (ArrayList) this.mMovesList.get(i2);
                for (int j = moves.size() - 1; j >= 0; j--) {
                    MoveInfo moveInfo = (MoveInfo) moves.get(j);
                    View view2 = moveInfo.holder.itemView;
                    ViewCompat.setTranslationY(view2, 0.0f);
                    ViewCompat.setTranslationX(view2, 0.0f);
                    dispatchMoveFinished(moveInfo.holder);
                    moves.remove(j);
                    if (moves.isEmpty()) {
                        this.mMovesList.remove(moves);
                    }
                }
            }
            for (i3 = this.mAdditionsList.size() - 1; i3 >= 0; i3--) {
                ArrayList<ViewHolder> additions = (ArrayList) this.mAdditionsList.get(i3);
                for (int j2 = additions.size() - 1; j2 >= 0; j2--) {
                    ViewHolder item3 = (ViewHolder) additions.get(j2);
                    ViewCompat.setAlpha(item3.itemView, 1.0f);
                    dispatchAddFinished(item3);
                    additions.remove(j2);
                    if (additions.isEmpty()) {
                        this.mAdditionsList.remove(additions);
                    }
                }
            }
            for (i3 = this.mChangesList.size() - 1; i3 >= 0; i3--) {
                ArrayList<ChangeInfo> changes = (ArrayList) this.mChangesList.get(i3);
                for (i2 = changes.size() - 1; i2 >= 0; i2--) {
                    endChangeAnimationIfNecessary((ChangeInfo) changes.get(i2));
                    if (changes.isEmpty()) {
                        this.mChangesList.remove(changes);
                    }
                }
            }
            cancelAll(this.mRemoveAnimations);
            cancelAll(this.mMoveAnimations);
            cancelAll(this.mAddAnimations);
            cancelAll(this.mChangeAnimations);
            dispatchAnimationsFinished();
        }
    }

    void cancelAll(List<ViewHolder> viewHolders) {
        for (int i = viewHolders.size() - 1; i >= 0; i--) {
            ViewCompat.animate(((ViewHolder) viewHolders.get(i)).itemView).cancel();
        }
    }
}
