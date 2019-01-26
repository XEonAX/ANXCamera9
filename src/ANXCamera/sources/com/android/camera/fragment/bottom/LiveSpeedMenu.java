package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.aeonax.camera.R;
import com.android.camera.CameraAppImpl;
import com.android.camera.constant.ColorConstant;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.ui.ColorActivateTextView;

public class LiveSpeedMenu extends AbBottomMenu implements OnClickListener {
    private static final int LIVE_SPEED_TYPE = 0;
    private SparseArray<MenuItem> mLiveSpeedMenuTabList;
    private SparseArray<ColorActivateTextView> mMenuTextViewList;

    public LiveSpeedMenu(Context context, LinearLayout linearLayout, BeautyMenuAnimator beautyMenuAnimator) {
        super(context, linearLayout, beautyMenuAnimator);
    }

    void addAllView() {
        this.mMenuTextViewList = new SparseArray();
        SparseArray menuData = getMenuData();
        for (int i = 0; i < menuData.size(); i++) {
            MenuItem menuItem = (MenuItem) menuData.valueAt(i);
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) LayoutInflater.from(this.mContext).inflate(R.layout.beauty_menu_select_item, this.mContainerView, false);
            colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
            colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_NORMAL);
            colorActivateTextView.setText(menuItem.text);
            colorActivateTextView.setTag(Integer.valueOf(menuItem.type));
            colorActivateTextView.setOnClickListener(this);
            if (menuItem.type == 0) {
                colorActivateTextView.setActivated(true);
                this.mCurrentBeautyTextView = colorActivateTextView;
            } else {
                colorActivateTextView.setActivated(false);
            }
            this.mMenuTextViewList.put(menuItem.type, colorActivateTextView);
            this.mContainerView.addView(colorActivateTextView);
        }
    }

    SparseArray<ColorActivateTextView> getChildMenuViewList() {
        return this.mMenuTextViewList;
    }

    SparseArray<MenuItem> getMenuData() {
        if (this.mLiveSpeedMenuTabList != null) {
            return this.mLiveSpeedMenuTabList;
        }
        this.mLiveSpeedMenuTabList = new SparseArray();
        MenuItem menuItem = new MenuItem();
        menuItem.type = 0;
        menuItem.text = CameraAppImpl.getAndroidContext().getString(R.string.live_speed_fragment_tab_name);
        menuItem.number = 0;
        this.mLiveSpeedMenuTabList.put(0, menuItem);
        return this.mLiveSpeedMenuTabList;
    }

    void switchMenu() {
        this.mContainerView.removeAllViews();
        addAllView();
        selectBeautyType(getDefaultType());
    }

    int getDefaultType() {
        return 0;
    }

    boolean isRefreshUI() {
        return true;
    }

    public void onClick(View view) {
    }
}
