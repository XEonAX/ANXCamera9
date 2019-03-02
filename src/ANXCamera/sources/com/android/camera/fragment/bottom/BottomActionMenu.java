package com.android.camera.fragment.bottom;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.log.Log;
import com.android.camera.ui.EdgeHorizonScrollView;
import com.android.camera.ui.ModeSelectView;
import com.oneplus.camera.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public class BottomActionMenu {
    public static final int ANIM_EXPAND = 160;
    public static final int ANIM_SHRINK = 161;
    public static final int BEAUTY_BOTTOM_MENU = 1;
    public static final int CAMERA_OPERATE_BOTTOM_MENU = 0;
    public static final int LIVE_BOTTOM_MENU = 2;
    private static final String TAG = BottomActionMenu.class.getSimpleName();
    private BeautyMenuGroupManager mBeautyOperateMenuView;
    private EdgeHorizonScrollView mCameraOperateMenuView;
    private ModeSelectView mCameraOperateSelectView;
    private FrameLayout mContainerView;
    private Context mContext;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BottomActionMenuAnimType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface BottomActionMode {
    }

    public BottomActionMenu(Context context, FrameLayout frameLayout) {
        this.mContext = context;
        initView(frameLayout);
    }

    private void initView(FrameLayout frameLayout) {
        this.mContainerView = frameLayout;
        this.mCameraOperateMenuView = (EdgeHorizonScrollView) this.mContainerView.findViewById(R.id.mode_select_scrollview);
        this.mCameraOperateSelectView = (ModeSelectView) this.mContainerView.findViewById(R.id.mode_select);
        switchMenuMode(0, false);
    }

    public void initBeautyMenuView() {
        if (this.mBeautyOperateMenuView == null) {
            LinearLayout linearLayout = (LinearLayout) this.mContainerView.findViewById(R.id.beauty_operate_menu);
            linearLayout.setVisibility(8);
            this.mBeautyOperateMenuView = new BeautyMenuGroupManager(this.mContext, linearLayout);
        }
    }

    public EdgeHorizonScrollView getCameraOperateMenuView() {
        return this.mCameraOperateMenuView;
    }

    public ModeSelectView getCameraOperateSelectView() {
        return this.mCameraOperateSelectView;
    }

    public void switchMenuMode(int i, int i2, boolean z) {
        switch (i) {
            case 0:
                Log.i(TAG, "switch menu mode:camera_operate");
                cameraOperateMenuHandle(z);
                return;
            case 1:
                Log.i(TAG, "switch menu mode:beauty_operate");
                beautyOperateMenuHandle(i2, z);
                return;
            case 2:
                Log.i(TAG, "switch menu mode:live_operate");
                beautyOperateMenuHandle(i2, z);
                return;
            default:
                Log.i(TAG, "default switch menu mode:camera_operate");
                cameraOperateMenuHandle(z);
                return;
        }
    }

    public void switchMenuMode(int i, boolean z) {
        switchMenuMode(i, 161, z);
    }

    private void beautyOperateMenuHandle(int i, boolean z) {
        if (this.mBeautyOperateMenuView != null) {
            this.mBeautyOperateMenuView.setCurrentBeautyMenuType(i);
            this.mBeautyOperateMenuView.switchMenu();
        }
        this.mCameraOperateMenuView.setVisibility(8);
        if (z) {
            exitAnim(this.mCameraOperateMenuView);
        }
        if (this.mBeautyOperateMenuView != null) {
            this.mBeautyOperateMenuView.setVisibility(0);
            if (z) {
                enterAnim(this.mBeautyOperateMenuView.getView());
            }
        }
    }

    private void cameraOperateMenuHandle(boolean z) {
        this.mCameraOperateMenuView.setVisibility(0);
        if (z) {
            enterAnim(this.mCameraOperateMenuView);
        }
        if (this.mBeautyOperateMenuView != null) {
            this.mBeautyOperateMenuView.setVisibility(8);
            if (z) {
                exitAnim(this.mBeautyOperateMenuView.getView());
            }
        }
    }

    private void enterAnim(@NonNull View view) {
        view.clearAnimation();
        view.setAlpha(0.0f);
        ViewCompat.animate(view).alpha(1.0f).setStartDelay(140).setInterpolator(new QuinticEaseOutInterpolator()).setDuration(300).start();
    }

    private void exitAnim(@NonNull View view) {
        view.clearAnimation();
        ViewCompat.animate(view).alpha(0.0f).setInterpolator(new QuinticEaseInInterpolator()).setDuration(140).start();
    }

    public void bottomMenuAnimate(int i, int i2) {
        if (i == 1) {
            if (160 == i2) {
                this.mBeautyOperateMenuView.animateExpanding(true);
            } else if (161 == i2) {
                this.mBeautyOperateMenuView.animateExpanding(false);
            }
        }
    }

    public View getView() {
        return this.mContainerView;
    }

    public SparseArray<MenuItem> getMenuData() {
        return this.mBeautyOperateMenuView.getBottomMenu().getMenuData();
    }
}
