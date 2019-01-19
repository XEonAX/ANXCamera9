package com.android.camera.fragment;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.BeautyEyeLightFragment;
import com.android.camera.fragment.beauty.BeautyHelper;
import com.android.camera.fragment.beauty.BeautyLevelFragment;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.fragment.beauty.CameraBeautyParameterType;
import com.android.camera.fragment.beauty.FrontBeautyLevelFragment;
import com.android.camera.fragment.beauty.LegacyBeautyLevelFragment;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.fragment.beauty.MiBeauty;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FaceBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.NoScrollViewPager;
import com.mi.config.b;
import com.miui.filtersdk.beauty.BeautyParameterType;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public class FragmentBeauty extends BaseFragment implements OnClickListener, HandleBackTrace, MiBeautyProtocol {
    public static final int FRAGMENT_INFO = 251;
    private View mBeautyExtraView;
    private BeautyPagerAdapter mBeautyPagerAdapter;
    private boolean mBeautyPanelShow;
    private int mCurrentBeautyType;
    private BeautyEyeLightFragment mEyeLightFragment;
    List<Fragment> mFragments;
    private int mLastSelectBeautyType;
    private MiBeauty mMiBeautyBusiness;
    private boolean mRemoveFragmentBeauty;
    private NoScrollViewPager mViewPager;

    private class BeautyPagerAdapter extends FragmentPagerAdapter {
        private List<Fragment> mFragmentList;

        public BeautyPagerAdapter(FragmentManager fragmentManager, List<Fragment> list) {
            super(fragmentManager);
            this.mFragmentList = list;
        }

        public Fragment getItem(int i) {
            String str = BeautyParameters.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("fragment item positon:");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
            Fragment fragment = (Fragment) this.mFragmentList.get(i);
            if (fragment == null) {
                if (b.hA()) {
                    fragment = new LegacyBeautyLevelFragment();
                } else if (b.hL()) {
                    fragment = new FrontBeautyLevelFragment();
                }
                Log.e(BeautyParameters.TAG, "beauty pager get fragment item is null!");
            }
            return fragment;
        }

        public int getCount() {
            return this.mFragmentList == null ? 0 : this.mFragmentList.size();
        }
    }

    private class ExitAnimationListener implements AnimationListener {
        private ExitAnimationListener() {
        }

        /* synthetic */ ExitAnimationListener(FragmentBeauty fragmentBeauty, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onAnimationStart(Animation animation) {
        }

        public void onAnimationEnd(Animation animation) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_beauty) == 4090) {
                baseDelegate.delegateEvent(10);
            }
            if (FragmentBeauty.this.mRemoveFragmentBeauty) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (!(BeautyParameters.isCurrentModeSupportVideoBeauty() && (cameraAction == null || cameraAction.isDoingAction()))) {
                    ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
                }
                FragmentBeauty.this.mRemoveFragmentBeauty = false;
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }
    }

    private class ViewPagerListener implements OnPageChangeListener {
        private ViewPagerListener() {
        }

        /* synthetic */ ViewPagerListener(FragmentBeauty fragmentBeauty, AnonymousClass1 anonymousClass1) {
            this();
        }

        public void onPageScrolled(int i, float f, int i2) {
        }

        public void onPageSelected(int i) {
            Object obj;
            switch (i) {
                case 1:
                case 2:
                    obj = 3;
                    break;
                default:
                    obj = 5;
                    break;
            }
            FaceBeautyProtocol faceBeautyProtocol = (FaceBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(185);
            if (faceBeautyProtocol != null) {
                faceBeautyProtocol.onFaceBeautySwitched(3 == obj);
            }
        }

        public void onPageScrollStateChanged(int i) {
        }
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(194, this);
        this.mBeautyPanelShow = true;
        this.mMiBeautyBusiness = new MiBeauty();
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(194, this);
        this.mBeautyPanelShow = false;
    }

    protected void initView(View view) {
        int beautyActionMenuType;
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (uiStyle == 3 || uiStyle == 1) {
            view.setBackgroundColor(getResources().getColor(R.color.beauty_panel_full_screen_bg));
        }
        this.mRemoveFragmentBeauty = false;
        this.mBeautyExtraView = view.findViewById(R.id.beauty_extra);
        this.mViewPager = (NoScrollViewPager) view.findViewById(R.id.viewPager);
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            beautyActionMenuType = bottomMenuProtocol.getBeautyActionMenuType();
        } else {
            beautyActionMenuType = 0;
        }
        this.mFragments = this.mMiBeautyBusiness.getCurrentShowFragmentList(beautyActionMenuType);
        this.mBeautyPagerAdapter = new BeautyPagerAdapter(getChildFragmentManager(), this.mFragments);
        this.mViewPager.setAdapter(this.mBeautyPagerAdapter);
        this.mViewPager.setFocusable(false);
        this.mViewPager.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                return true;
            }
        });
        this.mViewPager.setOnPageChangeListener(new ViewPagerListener(this, null));
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_beauty;
    }

    public int getFragmentInto() {
        return 251;
    }

    protected Animation provideEnterAnimation(int i) {
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(167, 161);
        wrapperAnimation.setDuration(280);
        wrapperAnimation.setInterpolator(new QuinticEaseOutInterpolator());
        return wrapperAnimation;
    }

    protected Animation provideExitAnimation() {
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(new ExitAnimationListener(this, null), 168, 162);
        wrapperAnimation.setDuration(140);
        wrapperAnimation.setInterpolator(new QuinticEaseInInterpolator());
        return wrapperAnimation;
    }

    private void showZoomTipImage() {
        int i = this.mCurrentMode;
        if (!(i == 163 || i == 173)) {
            switch (i) {
                case 165:
                    break;
                case 166:
                    if (!DataRepository.dataItemFeature().fI()) {
                        return;
                    }
                    break;
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (!(dualController == null || CameraSettings.isFrontCamera() || CameraSettings.isUltraWideConfigOpen(this.mCurrentMode) || CameraSettings.isRearMenuUltraPixelPhotographyOn())) {
            dualController.showZoomButton();
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.clearAlertStatus();
            }
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        onBackEvent(4);
    }

    public boolean onBackEvent(int i) {
        boolean removeFragmentBeauty = removeFragmentBeauty(i);
        if (removeFragmentBeauty) {
            notifyTipsMargin(0);
        }
        if (removeFragmentBeauty && i != 4 && this.mCurrentMode == 171) {
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (bokehFNumberController != null) {
                bokehFNumberController.showFNumberPanel();
            }
        }
        return removeFragmentBeauty;
    }

    private void notifyTipsMargin(int i) {
        if (ModuleManager.isSquareModule()) {
            i = 0;
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.updateTipBottomMargin(i, true);
        }
    }

    public void switchBeautyType(int i) {
        this.mMiBeautyBusiness.setCurrentBeautyType(i);
        this.mMiBeautyBusiness.setBeautyType(i);
        if (i != 4) {
            this.mViewPager.setCurrentItem(((MenuItem) BeautyHelper.getMenuData().get(i)).number, false);
        } else {
            showHideEyeLighting(true);
        }
        this.mCurrentBeautyType = i;
        if (this.mLastSelectBeautyType == 4) {
            showHideEyeLighting(false);
        }
        this.mLastSelectBeautyType = i;
    }

    public int getCurrentBeautyType() {
        return this.mCurrentBeautyType;
    }

    public void onClick(View view) {
    }

    public void onPause() {
        super.onPause();
        removeFragmentBeauty(4);
    }

    private boolean removeFragmentBeauty(int i) {
        boolean removeFragmentBeauty = this.mMiBeautyBusiness.removeFragmentBeauty(i);
        if (removeFragmentBeauty) {
            this.mRemoveFragmentBeauty = true;
        }
        return removeFragmentBeauty;
    }

    public void onDestroyView() {
        super.onDestroyView();
        notifyTipsMargin(0);
        showZoomTipImage();
    }

    private void showHideEyeLighting(boolean z) {
        if (DataRepository.dataItemFeature().fn() && CameraSettings.isSupportBeautyMakeup()) {
            if (this.mEyeLightFragment == null) {
                this.mEyeLightFragment = new BeautyEyeLightFragment();
            }
            if (z) {
                showHideExtraLayout(true, this.mEyeLightFragment, this.mEyeLightFragment.getFragmentTag());
                extraEnterAnim();
                this.mEyeLightFragment.enterAnim(this.mBeautyExtraView, new ViewPropertyAnimatorListener() {
                    public void onAnimationStart(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        FragmentBeauty.this.mEyeLightFragment.userVisibleHint();
                    }

                    public void onAnimationCancel(View view) {
                    }
                });
            } else {
                this.mEyeLightFragment.exitAnim(this.mBeautyExtraView, new ViewPropertyAnimatorListener() {
                    public void onAnimationStart(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        FragmentBeauty.this.showHideExtraLayout(false, FragmentBeauty.this.mEyeLightFragment, FragmentBeauty.this.mEyeLightFragment.getFragmentTag());
                        FragmentBeauty.this.mEyeLightFragment.userInvisibleHit();
                        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        if (bottomPopupTips != null) {
                            bottomPopupTips.directlyHideTips();
                        }
                    }

                    public void onAnimationCancel(View view) {
                    }
                });
                extraExitAnim();
            }
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                baseDelegate.delegateEvent(3);
            }
        }
    }

    private void showHideExtraLayout(boolean z, Fragment fragment, String str) {
        if (z) {
            FragmentUtils.addFragmentWithTag(getFragmentManager(), (int) R.id.beauty_extra, fragment, str);
        } else {
            FragmentUtils.removeFragmentByTag(getFragmentManager(), str);
        }
    }

    private void extraEnterAnim() {
        this.mViewPager.setTranslationX(0.0f);
        this.mViewPager.setAlpha(1.0f);
        ViewCompat.animate(this.mViewPager).translationX(-100.0f).alpha(0.0f).setDuration(120).setStartDelay(0).setInterpolator(new QuinticEaseInInterpolator()).start();
    }

    private void extraExitAnim() {
        this.mViewPager.setTranslationX(-100.0f);
        this.mViewPager.setAlpha(0.0f);
        ViewCompat.animate(this.mViewPager).translationX(0.0f).alpha(1.0f).setDuration(280).setInterpolator(new QuinticEaseOutInterpolator()).setStartDelay(120).start();
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        if (this.mFragments != null) {
            for (Fragment fragment : this.mFragments) {
                if (fragment instanceof BeautyLevelFragment) {
                    ((BeautyLevelFragment) fragment).setEnableClick(z);
                    return;
                }
            }
        }
    }

    public boolean isBeautyPanelShow() {
        return this.mBeautyPanelShow;
    }

    public void setProgress(int i) {
        this.mMiBeautyBusiness.setProgress(i);
    }

    public void resetBeauty() {
        this.mMiBeautyBusiness.resetBeauty();
    }

    public void setType(Type type) {
        this.mMiBeautyBusiness.setType(type);
    }

    public void setType(BeautyParameterType beautyParameterType) {
        this.mMiBeautyBusiness.setType(beautyParameterType);
    }

    public void setCurrentBeautyParameterType(CameraBeautyParameterType cameraBeautyParameterType) {
        this.mMiBeautyBusiness.setCurrentBeautyParameterType(cameraBeautyParameterType);
    }

    public List<Type> getBeautyItems() {
        return this.mMiBeautyBusiness.getTypeArray();
    }

    public int getProgress() {
        return this.mMiBeautyBusiness.getProgress();
    }

    public CameraBeautyParameterType getCurrentBeautyParameterType() {
        return this.mMiBeautyBusiness.getCurrentBeautyParameterType();
    }

    public int getBeautyType() {
        return this.mMiBeautyBusiness.getBeautyType();
    }

    public boolean needViewClear() {
        if (CameraSettings.isRearMenuUltraPixelPhotographyOn()) {
            return true;
        }
        return super.needViewClear();
    }
}
