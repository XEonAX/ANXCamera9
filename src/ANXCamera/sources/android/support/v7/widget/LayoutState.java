package android.support.v7.widget;

import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

class LayoutState {
    static final int INVALID_LAYOUT = Integer.MIN_VALUE;
    static final int ITEM_DIRECTION_HEAD = -1;
    static final int ITEM_DIRECTION_TAIL = 1;
    static final int LAYOUT_END = 1;
    static final int LAYOUT_START = -1;
    static final int SCOLLING_OFFSET_NaN = Integer.MIN_VALUE;
    static final String TAG = "LayoutState";
    int mAvailable;
    int mCurrentPosition;
    int mEndLine = 0;
    int mItemDirection;
    int mLayoutDirection;
    int mStartLine = 0;

    LayoutState() {
    }

    boolean hasMore(State state) {
        return this.mCurrentPosition >= 0 && this.mCurrentPosition < state.getItemCount();
    }

    View next(Recycler recycler) {
        View view = recycler.getViewForPosition(this.mCurrentPosition);
        this.mCurrentPosition += this.mItemDirection;
        return view;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LayoutState{mAvailable=");
        stringBuilder.append(this.mAvailable);
        stringBuilder.append(", mCurrentPosition=");
        stringBuilder.append(this.mCurrentPosition);
        stringBuilder.append(", mItemDirection=");
        stringBuilder.append(this.mItemDirection);
        stringBuilder.append(", mLayoutDirection=");
        stringBuilder.append(this.mLayoutDirection);
        stringBuilder.append(", mStartLine=");
        stringBuilder.append(this.mStartLine);
        stringBuilder.append(", mEndLine=");
        stringBuilder.append(this.mEndLine);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
