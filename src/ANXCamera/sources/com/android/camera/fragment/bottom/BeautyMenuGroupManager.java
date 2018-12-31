package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import android.widget.LinearLayout;

public class BeautyMenuGroupManager {
    private BeautyMenuAnimator mBeautyMenuAnimator;
    private SparseArray<AbBottomMenu> mBeautyMenuList;
    private AbBottomMenu mBottomMenu;
    private LinearLayout mContainerView;
    private Context mContext;
    private int mCurrentMenuGroupType = 160;

    public BeautyMenuGroupManager(Context context, LinearLayout linearLayout) {
        this.mContainerView = linearLayout;
        this.mContext = context;
        this.mBeautyMenuAnimator = BeautyMenuAnimator.animator(this.mContainerView);
        initView();
    }

    public void setCurrentBeautyMenuType(int i) {
        this.mCurrentMenuGroupType = i;
        updateCurrentMenu(i);
    }

    public int getCurrentBeautyMenuType() {
        return this.mCurrentMenuGroupType;
    }

    private void initView() {
        updateCurrentMenu(getCurrentBeautyMenuType());
        this.mBottomMenu.addAllView();
    }

    private void updateCurrentMenu(int i) {
        AbBottomMenu abBottomMenu;
        if (this.mBeautyMenuList != null) {
            abBottomMenu = (AbBottomMenu) this.mBeautyMenuList.get(i);
            if (abBottomMenu != null) {
                this.mBottomMenu = abBottomMenu;
                return;
            }
        }
        this.mBeautyMenuList = new SparseArray();
        switch (i) {
            case 161:
                abBottomMenu = new FrontBeautyMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
            case 162:
                abBottomMenu = new BackBeautyMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
            case 163:
                abBottomMenu = new LiveBeautyMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
            case 164:
                abBottomMenu = new LiveStickerMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
            case 165:
                abBottomMenu = new LiveSpeedMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
            default:
                abBottomMenu = new FrontBeautyMenu(this.mContext, this.mContainerView, this.mBeautyMenuAnimator);
                this.mBottomMenu = abBottomMenu;
                this.mBeautyMenuList.put(i, abBottomMenu);
                break;
        }
    }

    public void switchMenu() {
        this.mBottomMenu.switchMenu();
    }

    public void animateExpanding(boolean z) {
        if (z) {
            this.mBeautyMenuAnimator.expandAnimate();
        } else {
            this.mBeautyMenuAnimator.shrinkAnimate();
        }
    }

    public void setVisibility(int i) {
        if (this.mContainerView != null) {
            this.mContainerView.setVisibility(i);
        }
    }

    public View getView() {
        return this.mContainerView;
    }

    public AbBottomMenu getBottomMenu() {
        return this.mBottomMenu;
    }
}
