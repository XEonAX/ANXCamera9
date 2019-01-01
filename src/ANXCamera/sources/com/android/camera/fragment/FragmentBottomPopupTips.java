package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.StringRes;
import android.support.v4.view.ViewCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.OvershootInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.constant.LightingConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.MiBeauty;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.statistic.CameraStat;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;

public class FragmentBottomPopupTips extends BaseFragment implements OnClickListener, BottomPopupTips, HandleBackTrace {
    private static final int ANIM_DELAY_SHOW = 3;
    private static final int ANIM_DIRECT_HIDE = 1;
    private static final int ANIM_DIRECT_SHOW = 0;
    private static final int ANIM_HIDE = 4;
    private static final int ANIM_SHOW = 2;
    private static final int CENTER_TIP_IMAGE_SPEED = 33;
    public static final int FRAGMENT_INFO = 4081;
    private static final int LEFT_TIP_IAMAGE_FILETER = 17;
    private static final int LEFT_TIP_IMAGE_STICKER = 18;
    private static final int MSG_HIDE_TIP = 1;
    private static final int TIP_IMAGE_BEAUTY = 3;
    private static final int TIP_IMAGE_INVALID = -1;
    private static final int TIP_IMAGE_STICKER = 2;
    private View mBeautyIntroButton;
    private int mBeautyIntroRadius;
    private AnimatorSet mBeautyIntroShowAnimator;
    private TextView mBeautyIntroText;
    private int mBeautyIntroWidth;
    private ViewGroup mCenterTipImage;
    private ImageView mCloseIv;
    private int mCloseType = 0;
    @StringRes
    private int mCurrentTipMessage;
    private int mCurrentTipType;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                FragmentBottomPopupTips.this.mTipMessage.setVisibility(8);
                if (FragmentBottomPopupTips.this.mLastTipType == 6 && FragmentBottomPopupTips.this.mCurrentTipType != 8 && !FragmentBottomPopupTips.this.isPortraitHintVisible()) {
                    FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                } else if (FragmentBottomPopupTips.this.mLastTipType == 10) {
                    FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                }
                FragmentBottomPopupTips.this.mLastTipType = 4;
            }
        }
    };
    @StringRes
    private int mLastTipMessage;
    private int mLastTipType;
    private ImageView mLeftTipImage;
    private TextView mLightingPattern;
    private View mPortraitSuccessHint;
    private TextView mQrCodeButton;
    private View mRootView;
    private boolean mShowBeautyIntro;
    private ImageView mTipImage;
    private TextView mTipMessage;
    private int stringLightingRes;

    @Retention(RetentionPolicy.SOURCE)
    @interface TipImageType {
    }

    protected void initView(View view) {
        this.mRootView = view;
        this.mTipImage = (ImageView) view.findViewById(R.id.popup_tip_image);
        this.mBeautyIntroButton = view.findViewById(R.id.popup_tip_beauty_intro);
        if (Util.UI_DEBUG()) {
            ((LayoutParams) this.mTipImage.getLayoutParams()).gravity = 8388693;
            this.mLeftTipImage = (ImageView) view.findViewById(R.id.popup_left_tip_image);
            ((LayoutParams) this.mLeftTipImage.getLayoutParams()).gravity = 8388691;
            this.mLeftTipImage.setImageResource(R.drawable.ic_new_effect_button_normal);
            this.mLeftTipImage.setOnClickListener(this);
            this.mCenterTipImage = (ViewGroup) view.findViewById(R.id.popup_center_tip_image);
            ((LayoutParams) this.mCenterTipImage.getLayoutParams()).gravity = 81;
            this.mCenterTipImage.setOnClickListener(this);
            LayoutParams layoutParams = (LayoutParams) this.mBeautyIntroButton.getLayoutParams();
            layoutParams.gravity = 8388693;
            layoutParams.rightMargin = getResources().getDimensionPixelSize(R.dimen.beauty_intro_margin);
        }
        this.mBeautyIntroText = (TextView) view.findViewById(R.id.popup_tip_beauty_intro_text);
        this.mQrCodeButton = (TextView) view.findViewById(R.id.popup_tips_qrcode);
        this.mTipMessage = (TextView) view.findViewById(R.id.popup_tips_message);
        this.mPortraitSuccessHint = view.findViewById(R.id.portrait_success_hint);
        this.mLightingPattern = (TextView) view.findViewById(R.id.lighting_pattern);
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mTipImage.setOnClickListener(this);
        this.mQrCodeButton.setOnClickListener(this);
        this.mBeautyIntroButton.setOnClickListener(this);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mBeautyIntroRadius = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_radius);
        this.mBeautyIntroText.measure(0, 0);
        int measuredWidth = this.mBeautyIntroText.getMeasuredWidth();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_left_padding);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_right_padding);
        this.mBeautyIntroWidth = (((measuredWidth + dimensionPixelSize) + dimensionPixelSize2) + ((this.mBeautyIntroRadius - dimensionPixelSize) * 2)) + getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_text_margin_left);
        initBeautyIntroAnimator();
        resetBeautyIntro();
        if (((ActivityBase) getContext()).getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            Util.startScreenSlideAlphaInAnimation(this.mTipImage);
        }
        this.mCloseIv = (ImageView) view.findViewById(R.id.close_iv);
        this.mCloseIv.setOnClickListener(this);
        if (!Util.UI_DEBUG()) {
            this.mCloseIv.setBackground(null);
        }
    }

    private void resetBeautyIntro() {
        this.mBeautyIntroShowAnimator.cancel();
        setBeautyIntroButtonWidth(this.mBeautyIntroWidth);
        this.mBeautyIntroText.setAlpha(1.0f);
    }

    private void initBeautyIntroAnimator() {
        ValueAnimator ofInt = ValueAnimator.ofInt(new int[]{this.mBeautyIntroWidth, this.mBeautyIntroRadius * 2});
        ofInt.setDuration(300);
        ObjectAnimator.ofFloat(this.mBeautyIntroText, "alpha", new float[]{1.0f, 0.0f}).setDuration(250);
        ofInt.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                FragmentBottomPopupTips.this.setBeautyIntroButtonWidth(((Integer) valueAnimator.getAnimatedValue()).intValue());
            }
        });
        this.mBeautyIntroShowAnimator = new AnimatorSet();
        this.mBeautyIntroShowAnimator.playTogether(new Animator[]{ofInt, r2});
        this.mBeautyIntroShowAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
        this.mBeautyIntroShowAnimator.setStartDelay(FragmentTopAlert.HINT_DELAY_TIME);
        this.mBeautyIntroShowAnimator.addListener(new AnimatorListenerAdapter() {
            private boolean mCancelled;

            public void onAnimationStart(Animator animator) {
                this.mCancelled = false;
            }

            public void onAnimationCancel(Animator animator) {
                this.mCancelled = true;
            }

            public void onAnimationEnd(Animator animator) {
                if (!this.mCancelled) {
                    AlphaOutOnSubscribe.directSetResult(FragmentBottomPopupTips.this.mBeautyIntroButton);
                    AlphaInOnSubscribe.directSetResult(FragmentBottomPopupTips.this.mTipImage);
                }
            }
        });
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_popup_tips;
    }

    public int getFragmentInto() {
        return 4081;
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(175, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(175, this);
        unRegisterBackStack(modeCoordinator, this);
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null && cameraAction.isDoingAction()) {
                return;
            }
            if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                int id = view.getId();
                if (id != R.id.popup_tips_qrcode) {
                    if (id == R.id.close_iv) {
                        switch (this.mCloseType) {
                            case 1:
                                closeFilter();
                                break;
                            case 2:
                                closeLight();
                                break;
                        }
                    }
                    int intValue;
                    switch (id) {
                        case R.id.popup_tip_image /*2131558447*/:
                        case R.id.popup_tip_beauty_intro /*2131558450*/:
                            intValue = ((Integer) view.getTag()).intValue();
                            hideAllTipImage();
                            CameraSettings.setPopupTipBeautyIntroClicked();
                            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                            switch (intValue) {
                                case 2:
                                    baseDelegate.delegateEvent(4);
                                    break;
                                case 3:
                                    CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BEAUTY_BUTTON);
                                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                                    ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                                    if (!(actionProcessing == null || !actionProcessing.isShowFilterView() || configChanges == null)) {
                                        configChanges.showOrHideFilter();
                                    }
                                    showBeauty(this.mCurrentMode);
                                    break;
                            }
                            break;
                        case R.id.popup_left_tip_image /*2131558448*/:
                            intValue = ((Integer) view.getTag()).intValue();
                            if (intValue != 17) {
                                if (intValue == 18) {
                                    hideAllTipImage();
                                    showLiveSticker();
                                    break;
                                }
                            }
                            ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).onConfigChanged(196);
                            break;
                            break;
                        case R.id.popup_center_tip_image /*2131558449*/:
                            if (((Integer) view.getTag()).intValue() == 33) {
                                hideAllTipImage();
                                showLiveSpeed();
                                break;
                            }
                            break;
                    }
                }
                hideQrCodeTip();
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_QRCODE_DETECTED);
                ((CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195)).showQRCodeResult();
            }
        }
    }

    private void showBeauty(int i) {
        MiBeauty.showBeautyActionFromMode(i);
        if (this.mCurrentMode == 171) {
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (bokehFNumberController != null) {
                bokehFNumberController.hideFNumberPanel(false);
            }
        }
    }

    private void hideZoomTipImage(int i) {
        if (!(i == 163 || i == 173)) {
            switch (i) {
                case 165:
                case 166:
                    break;
                default:
                    return;
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideZoomButton();
        }
    }

    private void showLiveSticker() {
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(164);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(12);
        }
    }

    private void showLiveSpeed() {
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(165);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(13);
        }
    }

    private void closeLight() {
        showCloseTip(2, false);
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.showOrHideLighting(false);
        }
    }

    private void closeFilter() {
        showCloseTip(1, false);
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.showOrHideFilter();
        }
    }

    private void hideAllTipImage() {
        hideTipImage();
        hideTipBeautyIntro();
        if (Util.UI_DEBUG()) {
            hideLeftTipImage();
            hideCenterTipImage();
            hideZoomTipImage(this.mCurrentMode);
        }
    }

    public void hideTipImage() {
        if (this.mTipImage != null && this.mTipImage.getVisibility() != 4) {
            this.mTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mTipImage)).subscribe();
        }
    }

    public void directHideTipImage() {
        if (this.mTipImage.getVisibility() != 4) {
            this.mTipImage.setTag(Integer.valueOf(-1));
            this.mTipImage.setVisibility(4);
        }
        if (this.mBeautyIntroButton.getVisibility() != 4) {
            this.mBeautyIntroButton.setTag(Integer.valueOf(-1));
            this.mBeautyIntroButton.setVisibility(4);
        }
    }

    private void hideTipBeautyIntro() {
        if (this.mBeautyIntroButton.getVisibility() == 0) {
            this.mBeautyIntroButton.setTag(Integer.valueOf(-1));
            this.mTipImage.setTag(Integer.valueOf(-1));
            this.mBeautyIntroShowAnimator.pause();
            Completable.create(new AlphaOutOnSubscribe(this.mBeautyIntroButton)).subscribe();
        }
    }

    public void reInitTipImage() {
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    public void updateTipBottomMargin(int i, boolean z) {
        if (this.mRootView.getPaddingTop() < i) {
            this.mRootView.setPadding(0, (int) (((float) i) * 1.2f), 0, 0);
        }
        if (!z) {
            TranslateYOnSubscribe.directSetResult(this.mRootView, -i);
        } else if (((float) i) < ViewCompat.getTranslationY(this.mRootView)) {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -i).setInterpolator(new OvershootInterpolator())).subscribe();
        } else {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -i).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        }
    }

    public void showTips(int i, @StringRes int i2, int i3) {
        if ((i != 6 || this.mCurrentMode == 171) && !isLightingHintVisible()) {
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = i;
            this.mCurrentTipMessage = i2;
            hideTip(this.mQrCodeButton);
            reIntTipViewMarginBottom(this.mTipMessage);
            AlphaInOnSubscribe.directSetResult(this.mTipMessage);
            this.mTipMessage.setText(i2);
            if (Util.isAccessible()) {
                this.mTipMessage.setContentDescription(getString(this.mCurrentTipMessage));
                this.mTipMessage.postDelayed(new Runnable() {
                    public void run() {
                        if (FragmentBottomPopupTips.this.isAdded()) {
                            FragmentBottomPopupTips.this.mTipMessage.sendAccessibilityEvent(4);
                        }
                    }
                }, 3000);
            }
            i = 0;
            switch (i3) {
                case 1:
                    i = 1000;
                    break;
                case 2:
                    i = 5000;
                    break;
                case 3:
                    i = 15000;
                    break;
            }
            this.mHandler.removeCallbacksAndMessages(null);
            if (i > 0) {
                this.mHandler.sendEmptyMessageDelayed(1, (long) i);
            }
        }
    }

    private void reIntTipViewMarginBottom(View view) {
        int dimensionPixelSize;
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
        if (this.mCurrentMode == 165) {
            dimensionPixelSize = ((((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2) + getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal);
        } else if (manuallyAdjust != null && manuallyAdjust.visibleHeight() > 0) {
            dimensionPixelSize = manuallyAdjust.visibleHeight();
        } else if (this.mTipImage.getVisibility() == 0) {
            if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                dimensionPixelSize = this.mTipImage.getHeight();
            } else {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + 20;
            }
        } else if (dualController != null && dualController.isZoomVisible()) {
            dimensionPixelSize = dualController.visibleHeight();
        } else if (bokehFNumberController == null || !bokehFNumberController.isFNumberVisible()) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beautycamera_popup_fragment_height);
            } else if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal);
            } else {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + 20;
            }
        } else {
            dimensionPixelSize = bokehFNumberController.visibleHeight() + ((int) this.mRootView.getTranslationY());
        }
        if (marginLayoutParams.bottomMargin != dimensionPixelSize) {
            marginLayoutParams.bottomMargin = dimensionPixelSize;
            view.setLayoutParams(marginLayoutParams);
        }
    }

    public void directlyHideTips() {
        ViewCompat.animate(this.mTipMessage).cancel();
        this.mHandler.removeCallbacksAndMessages(null);
        if (this.mTipMessage.getVisibility() == 0) {
            this.mTipMessage.setVisibility(8);
            if (this.mLastTipType == 6 && !isPortraitHintVisible()) {
                showTips(this.mLastTipType, this.mLastTipMessage, 4);
            }
            this.mLastTipType = 4;
        }
    }

    public boolean containTips(@StringRes int i) {
        return this.mTipMessage.getVisibility() == 0 && getString(i).equals(this.mTipMessage.getText().toString());
    }

    public void setPortraitHintVisible(int i) {
        if (i != 0 || !isLightingHintVisible()) {
            this.mLastTipType = i == 0 ? 7 : 4;
            directlyHideTips();
            if (i == 0) {
                reIntTipViewMarginBottom(this.mPortraitSuccessHint);
            }
            this.mPortraitSuccessHint.setVisibility(i);
        }
    }

    public boolean isPortraitHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    public boolean isLightingHintVisible() {
        return this.mLightingPattern.getVisibility() == 0;
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setLightingPattern(String str) {
        Object obj;
        this.stringLightingRes = -2;
        switch (str.hashCode()) {
            case 48:
                if (str.equals("0")) {
                    obj = null;
                    break;
                }
            case 49:
                if (str.equals("1")) {
                    obj = 1;
                    break;
                }
            case 50:
                if (str.equals("2")) {
                    obj = 2;
                    break;
                }
            case 51:
                if (str.equals("3")) {
                    obj = 3;
                    break;
                }
            case 52:
                if (str.equals("4")) {
                    obj = 4;
                    break;
                }
            case 53:
                if (str.equals("5")) {
                    obj = 5;
                    break;
                }
            case 54:
                if (str.equals("6")) {
                    obj = 6;
                    break;
                }
            case 55:
                if (str.equals(LightingConstant.LIGHTING_LEAF)) {
                    obj = 7;
                    break;
                }
            default:
                obj = -1;
                break;
        }
        switch (obj) {
            case null:
                this.stringLightingRes = -2;
                break;
            case 1:
                this.stringLightingRes = R.string.lighting_pattern_nature;
                break;
            case 2:
                this.stringLightingRes = R.string.lighting_pattern_stage;
                break;
            case 3:
                this.stringLightingRes = R.string.lighting_pattern_movie;
                break;
            case 4:
                this.stringLightingRes = R.string.lighting_pattern_rainbow;
                break;
            case 5:
                this.stringLightingRes = R.string.lighting_pattern_shutter;
                break;
            case 6:
                this.stringLightingRes = R.string.lighting_pattern_dot;
                break;
            case 7:
                this.stringLightingRes = R.string.lighting_pattern_leaf;
                break;
        }
        if (this.stringLightingRes == -2) {
            AlphaOutOnSubscribe.directSetResult(this.mLightingPattern);
            return;
        }
        this.mCurrentTipType = 12;
        hideTip(this.mTipMessage);
        hideTip(this.mPortraitSuccessHint);
        directHideTipImage();
        hideTipBeautyIntro();
        reIntTipViewMarginBottom(this.mLightingPattern);
        this.mLightingPattern.setText(this.stringLightingRes);
        if (!isLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mLightingPattern);
        }
    }

    public void showQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 0) {
            hideTip(this.mTipMessage);
            reIntTipViewMarginBottom(this.mQrCodeButton);
            AlphaInOnSubscribe.directSetResult(this.mQrCodeButton);
            if (Util.isAccessible()) {
                this.mQrCodeButton.postDelayed(new Runnable() {
                    public void run() {
                        FragmentBottomPopupTips.this.mQrCodeButton.sendAccessibilityEvent(128);
                    }
                }, 100);
            }
        }
    }

    public void hideQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 8) {
            this.mQrCodeButton.setVisibility(8);
        }
    }

    /* JADX WARNING: Missing block: B:14:0x0024, code:
            if (r3.mCurrentTipType != 9) goto L_0x0027;
     */
    /* JADX WARNING: Missing block: B:15:0x0026, code:
            return false;
     */
    /* JADX WARNING: Missing block: B:16:0x0027, code:
            hideTip(r3.mTipMessage);
            hideTip(r3.mPortraitSuccessHint);
            hideTip(r3.mQrCodeButton);
            hideTip(r3.mLightingPattern);
            r3.mHandler.removeCallbacksAndMessages(null);
     */
    /* JADX WARNING: Missing block: B:17:0x0042, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onBackEvent(int i) {
        switch (i) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                if (this.mCurrentTipType == 6 || this.mCurrentTipType == 7 || this.mCurrentTipType == 11 || this.mCurrentTipType == 9 || this.mCurrentTipType == 12) {
                    return false;
                }
        }
    }

    private boolean hideTip(View view) {
        if (view.getVisibility() == 8) {
            return false;
        }
        view.setVisibility(8);
        return true;
    }

    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        if (z || this.mCurrentMode != i) {
            this.mCloseIv.setVisibility(8);
            this.mCloseType = 0;
        }
        int i2 = this.mCurrentMode;
        super.provideAnimateElement(i, list, z);
        onBackEvent(4);
        updateTipBottomMargin(0, false);
        updateTipImage(i, i2, list);
        if (Util.UI_DEBUG()) {
            updateLeftTipImage(i, i2, list);
            updateCenterTipImage(i, i2, list);
        }
    }

    private void setBeautyIntroButtonWidth(int i) {
        ViewGroup.LayoutParams layoutParams = this.mBeautyIntroButton.getLayoutParams();
        layoutParams.width = i;
        this.mBeautyIntroButton.setLayoutParams(layoutParams);
    }

    private void startBeautyIntroShowAnimation() {
        this.mBeautyIntroButton.setTag(Integer.valueOf(3));
        resetBeautyIntro();
        Completable.create(new AlphaInOnSubscribe(this.mBeautyIntroButton)).subscribe();
        CameraSettings.addPopupTipBeautyIntroShowTimes();
        this.mBeautyIntroShowAnimator.start();
    }

    /* JADX WARNING: Removed duplicated region for block: B:94:0x0193  */
    /* JADX WARNING: Removed duplicated region for block: B:90:0x017a  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x0167  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x014a  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x011d  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x0193  */
    /* JADX WARNING: Removed duplicated region for block: B:90:0x017a  */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x0167  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x014a  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x011d  */
    /* JADX WARNING: Missing block: B:12:0x002d, code:
            if (r3.isSupportVideoBeauty() != false) goto L_0x0059;
     */
    /* JADX WARNING: Missing block: B:14:0x0033, code:
            if (com.android.camera.Util.UI_DEBUG() != false) goto L_0x0059;
     */
    /* JADX WARNING: Missing block: B:18:0x0040, code:
            if (com.mi.config.b.hb() != false) goto L_0x0059;
     */
    /* JADX WARNING: Missing block: B:20:0x0046, code:
            if (com.android.camera.Util.UI_DEBUG() != false) goto L_0x0059;
     */
    /* JADX WARNING: Missing block: B:24:0x0053, code:
            if (com.android.camera.Util.UI_DEBUG() == false) goto L_0x0056;
     */
    /* JADX WARNING: Missing block: B:25:0x0056, code:
            r3 = -1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateTipImage(int i, int i2, List<Completable> list) {
        int i3;
        int i4;
        int i5;
        if (i != 165) {
            if (i != 171) {
                switch (i) {
                    case 161:
                    case 162:
                        if (CameraSettings.isFrontCamera() || Util.UI_DEBUG()) {
                            CameraCapabilities capabilitiesByBogusCameraId = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(CameraSettings.getCameraId(), i);
                            if (capabilitiesByBogusCameraId != null) {
                                break;
                            }
                            break;
                        }
                    case 163:
                        break;
                }
            } else if (CameraSettings.isFrontCamera()) {
            }
        }
        if (!CameraSettings.isFrontCamera()) {
        }
        int i6 = 3;
        boolean z = true;
        if (i6 != -1) {
            switch (i6) {
                case 2:
                    i3 = R.drawable.ic_beauty_sticker;
                    i4 = 1;
                    i5 = 0;
                    break;
                case 3:
                    if (!Util.UI_DEBUG()) {
                        i3 = R.drawable.ic_beauty_magic;
                    } else if (CameraSettings.isFaceBeautyOn(CameraSettings.getFaceBeautifyValue())) {
                        i3 = R.drawable.ic_beauty_on;
                    } else {
                        i3 = R.drawable.ic_beauty_normal;
                    }
                    i5 = R.string.accessibility_beauty_panel_open;
                    i4 = 1;
                    break;
                default:
                    i4 = 1;
                    i3 = 0;
                    i5 = i3;
                    break;
            }
        }
        i3 = 0;
        i5 = i3;
        i4 = i5;
        if (i3 > 0) {
            this.mTipImage.setImageResource(i3);
        }
        if (i5 > 0 && Util.isAccessible()) {
            this.mTipImage.setContentDescription(getString(i5));
        }
        updateImageBgColor(i, this.mTipImage);
        if (this.mTipImage.getTag() == null || ((Integer) this.mTipImage.getTag()).intValue() != i6) {
            boolean z2;
            if (i4 != 0) {
                ViewCompat.setRotation(this.mTipImage, (float) this.mDegree);
            }
            this.mTipImage.setTag(Integer.valueOf(i6));
            this.mShowBeautyIntro = false;
            if (list != null) {
                if (i4 != 0) {
                    boolean z3 = i2 == 165 ? b.isSupportedOpticalZoom() ? false : true : true;
                    z2 = i6 == 3 && CameraSettings.isPopupTipBeautyIntroEnable() && i != 162 && i != 161;
                    this.mShowBeautyIntro = z2;
                    z2 = z3;
                } else if (!(i2 == 165 || this.mCurrentMode == 165)) {
                    z2 = true;
                }
                switch (z2) {
                    case false:
                        break;
                    case true:
                        break;
                    case true:
                        break;
                    case true:
                        break;
                    case true:
                        break;
                }
            } else if (i4 != 0) {
                z2 = false;
                switch (z2) {
                    case false:
                        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                        if (actionProcessing == null || !actionProcessing.isShowLightingView()) {
                            z = false;
                        }
                        if (z) {
                            this.mTipImage.setTag(Integer.valueOf(-1));
                        }
                        if (!(this.mShowBeautyIntro || z)) {
                            AlphaInOnSubscribe.directSetResult(this.mTipImage);
                            break;
                        }
                    case true:
                        if (!this.mBeautyIntroButton.isShown()) {
                            AlphaOutOnSubscribe.directSetResult(this.mTipImage);
                            break;
                        }
                        this.mBeautyIntroShowAnimator.pause();
                        AlphaOutOnSubscribe.directSetResult(this.mBeautyIntroButton);
                        break;
                    case true:
                        if (!this.mShowBeautyIntro) {
                            list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage)));
                            break;
                        }
                        break;
                    case true:
                        if (!this.mShowBeautyIntro) {
                            list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage).setStartDelayTime(150).setDurationTime(150)));
                            break;
                        }
                        break;
                    case true:
                        if (!this.mBeautyIntroButton.isShown()) {
                            list.add(Completable.create(new AlphaOutOnSubscribe(this.mTipImage)));
                            break;
                        }
                        this.mBeautyIntroShowAnimator.pause();
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mBeautyIntroButton)));
                        break;
                }
            }
            z2 = true;
            switch (z2) {
                case false:
                    break;
                case true:
                    break;
                case true:
                    break;
                case true:
                    break;
                case true:
                    break;
            }
        }
    }

    private void updateImageBgColor(int i, View view) {
        if (i != 165) {
            view.setBackgroundResource(R.drawable.bg_popup_indicator_no_stroke);
        } else {
            view.setBackgroundResource(R.drawable.square_module_bg_popup_indicator_no_stroke);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:54:0x0100  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x00fa  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00eb  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00d2  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c3  */
    /* JADX WARNING: Missing block: B:37:0x00a0, code:
            if (r5 != 0) goto L_0x00a3;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateLeftTipImage(int i, int i2, List<Completable> list) {
        int parseInt;
        int i3;
        int i4 = 17;
        if (!(i == 161 || i == 163 || i == 165 || i == 171)) {
            i4 = i != 174 ? -1 : 18;
        }
        Object obj = 1;
        if (i4 != -1) {
            switch (i4) {
                case 17:
                    parseInt = Integer.parseInt(DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i));
                    if (parseInt != FilterInfo.FILTER_ID_NONE && parseInt > 0) {
                        parseInt = R.drawable.ic_filter_on;
                        break;
                    } else {
                        parseInt = R.drawable.ic_filter_normal;
                        break;
                    }
                    break;
                case 18:
                    if (!"".equals(CameraSettings.getCurrentLiveSticker())) {
                        parseInt = R.drawable.ic_live_sticker_on;
                        break;
                    } else {
                        parseInt = R.drawable.ic_live_sticker_normal;
                        break;
                    }
                default:
                    i3 = 1;
                    parseInt = 0;
                    break;
            }
            i3 = 1;
        } else {
            parseInt = 0;
            i3 = parseInt;
        }
        if (parseInt > 0) {
            this.mLeftTipImage.setImageResource(parseInt);
        }
        updateImageBgColor(i, this.mLeftTipImage);
        if (this.mLeftTipImage.getTag() == null || ((Integer) this.mLeftTipImage.getTag()).intValue() != i4) {
            if (i3 != 0) {
                ViewCompat.setRotation(this.mLeftTipImage, (float) this.mDegree);
            }
            this.mLeftTipImage.setTag(Integer.valueOf(i4));
            if (list != null) {
                if (i3 != 0) {
                    if (i2 != 165) {
                        obj = 2;
                    } else if (!b.isSupportedOpticalZoom()) {
                        obj = 3;
                    }
                } else if (!(i2 == 165 || this.mCurrentMode == 165)) {
                    obj = 4;
                }
                switch (obj) {
                    case null:
                        AlphaInOnSubscribe.directSetResult(this.mLeftTipImage);
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mLeftTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mLeftTipImage)));
                        break;
                }
            }
            obj = null;
            switch (obj) {
                case null:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:43:0x00d9  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00d3  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00c4  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00ab  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x009c  */
    /* JADX WARNING: Missing block: B:28:0x0080, code:
            if (r4 != 0) goto L_0x0083;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateCenterTipImage(int i, int i2, List<Completable> list) {
        int i3;
        int i4;
        i = i != 174 ? -1 : 33;
        Object obj = 1;
        if (i == -1) {
            i3 = 0;
            i4 = i3;
        } else if (i != 33) {
            i4 = 1;
            i3 = 0;
        } else {
            i3 = R.layout.bottom_popup_tips_center_live_speed;
            i4 = 1;
        }
        Object obj2 = (this.mCenterTipImage.getTag() == null || ((Integer) this.mCenterTipImage.getTag()).intValue() != i) ? 1 : null;
        if (obj2 != null) {
            this.mCenterTipImage.removeAllViews();
            if (i3 > 0) {
                this.mCenterTipImage.addView(LayoutInflater.from(getContext()).inflate(i3, null));
            }
        }
        if (i == 33) {
            ((TextView) this.mCenterTipImage.findViewById(R.id.live_speed_text)).setText(CameraSettings.getCurrentLiveSpeedText());
        }
        if (obj2 != null) {
            if (i4 != 0) {
                ViewCompat.setRotation(this.mCenterTipImage, (float) this.mDegree);
            }
            this.mCenterTipImage.setTag(Integer.valueOf(i));
            if (list != null) {
                if (i4 == 0) {
                    obj = 4;
                } else if (i2 != 163) {
                    obj = 2;
                } else if (!b.isSupportedOpticalZoom()) {
                    obj = 3;
                }
                switch (obj) {
                    case null:
                        AlphaInOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mCenterTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mCenterTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)));
                        break;
                }
            }
            obj = null;
            switch (obj) {
                case null:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        }
    }

    private boolean tipShowIntercept(int i) {
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_beauty) == 251 && i == R.drawable.ic_beauty_magic) {
            return true;
        }
        return false;
    }

    protected Animation provideEnterAnimation(int i) {
        if (i == 240 || i == getFragmentInto()) {
            return null;
        }
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mTipImage.getVisibility() == 0) {
            list.add(this.mTipImage);
        }
        if (Util.UI_DEBUG() && this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() == 0) {
            list.add(this.mLeftTipImage);
        }
        updateLightingPattern(false, true);
    }

    private void updateLightingPattern(boolean z, boolean z2) {
        if (z) {
            this.stringLightingRes = -2;
        }
        if (!DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171).equals("0")) {
            if (isLandScape()) {
                starAnimatetViewGone(this.mLightingPattern, z2);
            } else if (this.stringLightingRes > 0) {
                startAnimateViewVisible(this.mLightingPattern, z2);
            }
        }
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        switch (i) {
            case 2:
                directlyHideTips();
                break;
            case 3:
                adjustViewBackground(this.mCurrentMode);
                break;
        }
        updateTipImage(this.mCurrentMode, this.mCurrentMode, null);
        if (Util.UI_DEBUG()) {
            updateLeftTipImage(this.mCurrentMode, this.mCurrentMode, null);
            updateCenterTipImage(this.mCurrentMode, this.mCurrentMode, null);
        }
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mShowBeautyIntro) {
            startBeautyIntroShowAnimation();
        }
        this.mShowBeautyIntro = false;
    }

    private void adjustViewBackground(int i) {
        i = DataRepository.dataItemRunning().getUiStyle();
        if (i == 1 || i == 3) {
            this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit_full_screen);
        } else {
            this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit);
        }
    }

    public void showCloseTip(int i, boolean z) {
        if (!z) {
            this.mCloseIv.setVisibility(8);
            this.mCloseType = 0;
        } else if (this.mCurrentMode != 167) {
            this.mCloseType = i;
            this.mCloseIv.setVisibility(0);
        }
    }

    public void hideLeftTipImage() {
        if (this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() != 4) {
            this.mLeftTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mLeftTipImage)).subscribe();
        }
    }

    public void showLeftTipImage() {
        if (this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() != 4) {
            this.mLeftTipImage.setTag(Integer.valueOf(17));
            Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage)).subscribe();
        }
    }

    public void hideCenterTipImage() {
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() != 4) {
            this.mCenterTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)).subscribe();
        }
    }

    public void selectFilterTipImage(boolean z) {
        if (z) {
            this.mLeftTipImage.setImageResource(R.drawable.ic_filter_on);
        } else {
            this.mLeftTipImage.setImageResource(R.drawable.ic_filter_normal);
        }
    }

    public void selectBeautyTipImage(boolean z) {
        if (z) {
            this.mTipImage.setImageResource(R.drawable.ic_beauty_on);
        } else {
            this.mTipImage.setImageResource(R.drawable.ic_beauty_normal);
        }
    }

    public void directShowOrHideLeftTipImage(boolean z) {
        if (z) {
            this.mLeftTipImage.setTag(Integer.valueOf(17));
            this.mLeftTipImage.setVisibility(0);
            return;
        }
        this.mLeftTipImage.setTag(Integer.valueOf(-1));
        this.mLeftTipImage.setVisibility(4);
    }
}
