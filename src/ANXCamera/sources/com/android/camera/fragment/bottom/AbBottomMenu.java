package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.LinearLayout;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.ui.ColorActivateTextView;

public abstract class AbBottomMenu {
    protected BeautyMenuAnimator mBeautyMenuAnimator;
    protected LinearLayout mContainerView;
    protected Context mContext;
    protected ColorActivateTextView mCurrentBeautyTextView;

    abstract void addAllView();

    abstract SparseArray<ColorActivateTextView> getChildMenuViewList();

    abstract int getDefaultType();

    abstract SparseArray<MenuItem> getMenuData();

    abstract boolean isRefreshUI();

    abstract void switchMenu();

    public AbBottomMenu(Context context, LinearLayout linearLayout, BeautyMenuAnimator beautyMenuAnimator) {
        this.mContext = context;
        this.mContainerView = linearLayout;
        this.mBeautyMenuAnimator = beautyMenuAnimator;
    }

    void selectBeautyType(int i) {
        if (this.mCurrentBeautyTextView != null) {
            this.mCurrentBeautyTextView.setActivated(false);
        }
        SparseArray childMenuViewList = getChildMenuViewList();
        if (childMenuViewList != null) {
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) childMenuViewList.get(i);
            if (colorActivateTextView != null) {
                colorActivateTextView.setActivated(true);
                this.mCurrentBeautyTextView = colorActivateTextView;
            }
        }
    }

    protected void hideAdvance() {
        this.mContainerView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                if (AbBottomMenu.this.mBeautyMenuAnimator != null) {
                    AbBottomMenu.this.mBeautyMenuAnimator.shrinkImmediately();
                    AbBottomMenu.this.mContainerView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
            }
        });
    }
}
