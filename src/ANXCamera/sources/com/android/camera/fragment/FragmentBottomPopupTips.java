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
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.MiBeauty;
import com.android.camera.fragment.top.FragmentTopAlert;
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
import com.android.camera.snap.SnapService;
import com.android.camera.statistic.CameraStat;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
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
        ObjectAnimator.ofFloat(this.mBeautyIntroText, "alpha", new float[]{1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}).setDuration(250);
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
                    i = SnapService.MAX_DELAY;
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

    public void setLightingPattern(java.lang.String r3) {
        /*
        r2 = this;
        r0 = -2;
        r2.stringLightingRes = r0;
        r1 = r3.hashCode();
        switch(r1) {
            case 48: goto L_0x0051;
            case 49: goto L_0x0047;
            case 50: goto L_0x003d;
            case 51: goto L_0x0033;
            case 52: goto L_0x0029;
            case 53: goto L_0x001f;
            case 54: goto L_0x0015;
            case 55: goto L_0x000b;
            default: goto L_0x000a;
        };
    L_0x000a:
        goto L_0x005b;
    L_0x000b:
        r1 = "7";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x0013:
        r3 = 7;
        goto L_0x005c;
    L_0x0015:
        r1 = "6";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x001d:
        r3 = 6;
        goto L_0x005c;
    L_0x001f:
        r1 = "5";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x0027:
        r3 = 5;
        goto L_0x005c;
    L_0x0029:
        r1 = "4";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x0031:
        r3 = 4;
        goto L_0x005c;
    L_0x0033:
        r1 = "3";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x003b:
        r3 = 3;
        goto L_0x005c;
    L_0x003d:
        r1 = "2";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x0045:
        r3 = 2;
        goto L_0x005c;
    L_0x0047:
        r1 = "1";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x004f:
        r3 = 1;
        goto L_0x005c;
    L_0x0051:
        r1 = "0";
        r3 = r3.equals(r1);
        if (r3 == 0) goto L_0x005b;
    L_0x0059:
        r3 = 0;
        goto L_0x005c;
    L_0x005b:
        r3 = -1;
    L_0x005c:
        switch(r3) {
            case 0: goto L_0x008a;
            case 1: goto L_0x0084;
            case 2: goto L_0x007e;
            case 3: goto L_0x0078;
            case 4: goto L_0x0072;
            case 5: goto L_0x006c;
            case 6: goto L_0x0066;
            case 7: goto L_0x0060;
            default: goto L_0x005f;
        };
    L_0x005f:
        goto L_0x008d;
    L_0x0060:
        r3 = 2131427843; // 0x7f0b0203 float:1.8477314E38 double:1.053065274E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x0066:
        r3 = 2131427844; // 0x7f0b0204 float:1.8477316E38 double:1.0530652743E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x006c:
        r3 = 2131427845; // 0x7f0b0205 float:1.8477318E38 double:1.053065275E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x0072:
        r3 = 2131427842; // 0x7f0b0202 float:1.8477312E38 double:1.0530652733E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x0078:
        r3 = 2131427841; // 0x7f0b0201 float:1.847731E38 double:1.053065273E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x007e:
        r3 = 2131427840; // 0x7f0b0200 float:1.8477308E38 double:1.0530652723E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x0084:
        r3 = 2131427839; // 0x7f0b01ff float:1.8477306E38 double:1.053065272E-314;
        r2.stringLightingRes = r3;
        goto L_0x008d;
    L_0x008a:
        r2.stringLightingRes = r0;
    L_0x008d:
        r3 = r2.stringLightingRes;
        if (r3 != r0) goto L_0x0097;
    L_0x0091:
        r3 = r2.mLightingPattern;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r3);
        goto L_0x00c2;
    L_0x0097:
        r3 = 12;
        r2.mCurrentTipType = r3;
        r3 = r2.mTipMessage;
        r2.hideTip(r3);
        r3 = r2.mPortraitSuccessHint;
        r2.hideTip(r3);
        r2.directHideTipImage();
        r2.hideTipBeautyIntro();
        r3 = r2.mLightingPattern;
        r2.reIntTipViewMarginBottom(r3);
        r3 = r2.mLightingPattern;
        r0 = r2.stringLightingRes;
        r3.setText(r0);
        r3 = r2.isLandScape();
        if (r3 != 0) goto L_0x00c2;
    L_0x00bd:
        r3 = r2.mLightingPattern;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r3);
    L_0x00c2:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentBottomPopupTips.setLightingPattern(java.lang.String):void");
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
    public boolean onBackEvent(int r4) {
        /*
        r3 = this;
        r0 = 9;
        r1 = 0;
        switch(r4) {
            case 1: goto L_0x0022;
            case 2: goto L_0x0042;
            case 3: goto L_0x0007;
            default: goto L_0x0006;
        };
    L_0x0006:
        goto L_0x0027;
    L_0x0007:
        r4 = r3.mCurrentTipType;
        r2 = 6;
        if (r4 == r2) goto L_0x0021;
    L_0x000c:
        r4 = r3.mCurrentTipType;
        r2 = 7;
        if (r4 == r2) goto L_0x0021;
    L_0x0011:
        r4 = r3.mCurrentTipType;
        r2 = 11;
        if (r4 == r2) goto L_0x0021;
    L_0x0017:
        r4 = r3.mCurrentTipType;
        if (r4 == r0) goto L_0x0021;
    L_0x001b:
        r4 = r3.mCurrentTipType;
        r2 = 12;
        if (r4 != r2) goto L_0x0022;
    L_0x0021:
        return r1;
    L_0x0022:
        r4 = r3.mCurrentTipType;
        if (r4 != r0) goto L_0x0027;
    L_0x0026:
        return r1;
    L_0x0027:
        r4 = r3.mTipMessage;
        r3.hideTip(r4);
        r4 = r3.mPortraitSuccessHint;
        r3.hideTip(r4);
        r4 = r3.mQrCodeButton;
        r3.hideTip(r4);
        r4 = r3.mLightingPattern;
        r3.hideTip(r4);
        r4 = r3.mHandler;
        r0 = 0;
        r4.removeCallbacksAndMessages(r0);
    L_0x0042:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentBottomPopupTips.onBackEvent(int):boolean");
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
    private void updateTipImage(int r11, int r12, java.util.List<io.reactivex.Completable> r13) {
        /*
        r10 = this;
        r0 = -1;
        r1 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        r2 = 3;
        if (r11 == r1) goto L_0x0049;
    L_0x0007:
        r3 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        if (r11 == r3) goto L_0x0036;
    L_0x000b:
        switch(r11) {
            case 161: goto L_0x000f;
            case 162: goto L_0x000f;
            case 163: goto L_0x0049;
            default: goto L_0x000e;
        };
    L_0x000e:
        goto L_0x0056;
    L_0x000f:
        r3 = com.android.camera.CameraSettings.isFrontCamera();
        if (r3 != 0) goto L_0x001b;
    L_0x0015:
        r3 = com.android.camera.Util.UI_DEBUG();
        if (r3 == 0) goto L_0x0056;
    L_0x001b:
        r3 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance();
        r4 = com.android.camera.CameraSettings.getCameraId();
        r3 = r3.getCapabilitiesByBogusCameraId(r4, r11);
        if (r3 == 0) goto L_0x002f;
    L_0x0029:
        r3 = r3.isSupportVideoBeauty();
        if (r3 != 0) goto L_0x0035;
    L_0x002f:
        r3 = com.android.camera.Util.UI_DEBUG();
        if (r3 == 0) goto L_0x0056;
    L_0x0035:
        goto L_0x0059;
    L_0x0036:
        r3 = com.android.camera.CameraSettings.isFrontCamera();
        if (r3 == 0) goto L_0x0042;
    L_0x003c:
        r3 = com.mi.config.b.hb();
        if (r3 != 0) goto L_0x0048;
    L_0x0042:
        r3 = com.android.camera.Util.UI_DEBUG();
        if (r3 == 0) goto L_0x0056;
    L_0x0048:
        goto L_0x0059;
    L_0x0049:
        r3 = com.android.camera.CameraSettings.isFrontCamera();
        if (r3 != 0) goto L_0x0058;
    L_0x004f:
        r3 = com.android.camera.Util.UI_DEBUG();
        if (r3 == 0) goto L_0x0056;
    L_0x0055:
        goto L_0x0058;
    L_0x0056:
        r3 = r0;
        goto L_0x005a;
    L_0x0059:
        r3 = r2;
        r4 = 1;
        r5 = 0;
        if (r3 == r0) goto L_0x008e;
    L_0x0060:
        switch(r3) {
            case 2: goto L_0x0087;
            case 3: goto L_0x0067;
            default: goto L_0x0063;
        };
    L_0x0063:
        r8 = r4;
        r6 = r5;
        r7 = r6;
        goto L_0x0093;
    L_0x0067:
        r6 = com.android.camera.Util.UI_DEBUG();
        if (r6 != 0) goto L_0x0071;
    L_0x006d:
        r6 = 2130837679; // 0x7f0200af float:1.7280319E38 double:1.052773694E-314;
        goto L_0x0082;
    L_0x0071:
        r6 = com.android.camera.CameraSettings.getFaceBeautifyValue();
        r6 = com.android.camera.CameraSettings.isFaceBeautyOn(r6);
        if (r6 == 0) goto L_0x007f;
    L_0x007b:
        r6 = 2130837681; // 0x7f0200b1 float:1.7280323E38 double:1.052773695E-314;
        goto L_0x0082;
    L_0x007f:
        r6 = 2130837680; // 0x7f0200b0 float:1.728032E38 double:1.0527736946E-314;
    L_0x0082:
        r7 = 2131427567; // 0x7f0b00ef float:1.8476754E38 double:1.0530651375E-314;
        r8 = r4;
        goto L_0x0093;
    L_0x0087:
        r6 = 2130837683; // 0x7f0200b3 float:1.7280327E38 double:1.052773696E-314;
        r8 = r4;
        r7 = r5;
        goto L_0x0093;
        r6 = r5;
        r7 = r6;
        r8 = r7;
    L_0x0093:
        if (r6 <= 0) goto L_0x009a;
    L_0x0095:
        r9 = r10.mTipImage;
        r9.setImageResource(r6);
    L_0x009a:
        if (r7 <= 0) goto L_0x00ab;
    L_0x009c:
        r6 = com.android.camera.Util.isAccessible();
        if (r6 == 0) goto L_0x00ab;
    L_0x00a2:
        r6 = r10.mTipImage;
        r7 = r10.getString(r7);
        r6.setContentDescription(r7);
    L_0x00ab:
        r6 = r10.mTipImage;
        r10.updateImageBgColor(r11, r6);
        r6 = r10.mTipImage;
        r6 = r6.getTag();
        if (r6 == 0) goto L_0x00c7;
    L_0x00b8:
        r6 = r10.mTipImage;
        r6 = r6.getTag();
        r6 = (java.lang.Integer) r6;
        r6 = r6.intValue();
        if (r6 != r3) goto L_0x00c7;
    L_0x00c6:
        return;
    L_0x00c7:
        if (r8 == 0) goto L_0x00d1;
    L_0x00c9:
        r6 = r10.mTipImage;
        r7 = r10.mDegree;
        r7 = (float) r7;
        android.support.v4.view.ViewCompat.setRotation(r6, r7);
    L_0x00d1:
        r6 = r10.mTipImage;
        r7 = java.lang.Integer.valueOf(r3);
        r6.setTag(r7);
        r10.mShowBeautyIntro = r5;
        r6 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r13 != 0) goto L_0x00e8;
    L_0x00e0:
        if (r8 == 0) goto L_0x00e5;
        r11 = r5;
        goto L_0x0118;
    L_0x00e6:
        r11 = r4;
        goto L_0x0118;
    L_0x00e8:
        if (r8 == 0) goto L_0x010e;
    L_0x00ea:
        if (r12 != r1) goto L_0x00f8;
    L_0x00ec:
        r12 = com.mi.config.b.isSupportedOpticalZoom();
        if (r12 == 0) goto L_0x00f5;
        r12 = r5;
        goto L_0x00f9;
        r12 = r2;
        goto L_0x00f9;
    L_0x00f8:
        r12 = 2;
    L_0x00f9:
        if (r3 != r2) goto L_0x0109;
    L_0x00fb:
        r1 = com.android.camera.CameraSettings.isPopupTipBeautyIntroEnable();
        if (r1 == 0) goto L_0x0109;
    L_0x0101:
        if (r11 == r6) goto L_0x0109;
    L_0x0103:
        r1 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        if (r11 == r1) goto L_0x0109;
    L_0x0107:
        r11 = r4;
        goto L_0x010a;
    L_0x0109:
        r11 = r5;
    L_0x010a:
        r10.mShowBeautyIntro = r11;
        r11 = r12;
        goto L_0x0118;
    L_0x010e:
        if (r12 == r1) goto L_0x0117;
    L_0x0110:
        r11 = r10.mCurrentMode;
        if (r11 != r1) goto L_0x0115;
    L_0x0114:
        goto L_0x0117;
    L_0x0115:
        r11 = 4;
        goto L_0x0118;
    L_0x0117:
        goto L_0x00e6;
    L_0x0118:
        switch(r11) {
            case 0: goto L_0x0193;
            case 1: goto L_0x017a;
            case 2: goto L_0x0167;
            case 3: goto L_0x014a;
            case 4: goto L_0x011d;
            default: goto L_0x011b;
        };
    L_0x011b:
        goto L_0x01bd;
    L_0x011d:
        r11 = r10.mBeautyIntroButton;
        r11 = r11.isShown();
        if (r11 == 0) goto L_0x013a;
    L_0x0125:
        r11 = r10.mBeautyIntroShowAnimator;
        r11.pause();
        r11 = new com.android.camera.animation.type.AlphaOutOnSubscribe;
        r12 = r10.mBeautyIntroButton;
        r11.<init>(r12);
        r11 = io.reactivex.Completable.create(r11);
        r13.add(r11);
        goto L_0x01bd;
    L_0x013a:
        r11 = new com.android.camera.animation.type.AlphaOutOnSubscribe;
        r12 = r10.mTipImage;
        r11.<init>(r12);
        r11 = io.reactivex.Completable.create(r11);
        r13.add(r11);
        goto L_0x01bd;
    L_0x014a:
        r11 = r10.mShowBeautyIntro;
        if (r11 != 0) goto L_0x01bd;
    L_0x014e:
        r11 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r12 = r10.mTipImage;
        r11.<init>(r12);
        r12 = 150; // 0x96 float:2.1E-43 double:7.4E-322;
        r11 = r11.setStartDelayTime(r12);
        r11 = r11.setDurationTime(r12);
        r11 = io.reactivex.Completable.create(r11);
        r13.add(r11);
        goto L_0x01bd;
    L_0x0167:
        r11 = r10.mShowBeautyIntro;
        if (r11 != 0) goto L_0x01bd;
    L_0x016b:
        r11 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r12 = r10.mTipImage;
        r11.<init>(r12);
        r11 = io.reactivex.Completable.create(r11);
        r13.add(r11);
        goto L_0x01bd;
    L_0x017a:
        r11 = r10.mBeautyIntroButton;
        r11 = r11.isShown();
        if (r11 == 0) goto L_0x018d;
    L_0x0182:
        r11 = r10.mBeautyIntroShowAnimator;
        r11.pause();
        r11 = r10.mBeautyIntroButton;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r11);
        goto L_0x01bd;
    L_0x018d:
        r11 = r10.mTipImage;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r11);
        goto L_0x01bd;
    L_0x0193:
        r11 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r11 = r11.getAttachProtocol(r6);
        r11 = (com.android.camera.protocol.ModeProtocol.ActionProcessing) r11;
        if (r11 == 0) goto L_0x01a6;
    L_0x019f:
        r11 = r11.isShowLightingView();
        if (r11 == 0) goto L_0x01a6;
    L_0x01a5:
        goto L_0x01a7;
    L_0x01a6:
        r4 = r5;
    L_0x01a7:
        if (r4 == 0) goto L_0x01b2;
    L_0x01a9:
        r11 = r10.mTipImage;
        r12 = java.lang.Integer.valueOf(r0);
        r11.setTag(r12);
    L_0x01b2:
        r11 = r10.mShowBeautyIntro;
        if (r11 != 0) goto L_0x01bd;
    L_0x01b6:
        if (r4 != 0) goto L_0x01bd;
    L_0x01b8:
        r11 = r10.mTipImage;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r11);
    L_0x01bd:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentBottomPopupTips.updateTipImage(int, int, java.util.List):void");
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
    private void updateLeftTipImage(int r8, int r9, java.util.List<io.reactivex.Completable> r10) {
        /*
        r7 = this;
        r0 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        r1 = -1;
        r2 = 17;
        r3 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        if (r8 == r0) goto L_0x0022;
    L_0x000a:
        r0 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        if (r8 == r0) goto L_0x0020;
    L_0x000e:
        if (r8 == r3) goto L_0x0020;
    L_0x0010:
        r0 = 171; // 0xab float:2.4E-43 double:8.45E-322;
        if (r8 == r0) goto L_0x001e;
    L_0x0014:
        r0 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        if (r8 == r0) goto L_0x001a;
    L_0x0018:
        r2 = r1;
        goto L_0x0024;
    L_0x001a:
        r0 = 18;
        r2 = r0;
        goto L_0x0024;
        goto L_0x0024;
        goto L_0x0024;
        r0 = 1;
        r4 = 0;
        if (r2 == r1) goto L_0x0064;
    L_0x002a:
        switch(r2) {
            case 17: goto L_0x0044;
            case 18: goto L_0x0030;
            default: goto L_0x002d;
        };
    L_0x002d:
        r5 = r0;
        r1 = r4;
        goto L_0x0068;
    L_0x0030:
        r1 = com.android.camera.CameraSettings.getCurrentLiveSticker();
        r5 = "";
        r1 = r5.equals(r1);
        if (r1 == 0) goto L_0x0040;
    L_0x003c:
        r1 = 2130837760; // 0x7f020100 float:1.7280483E38 double:1.052773734E-314;
        goto L_0x0062;
    L_0x0040:
        r1 = 2130837761; // 0x7f020101 float:1.7280485E38 double:1.0527737346E-314;
        goto L_0x0062;
    L_0x0044:
        r1 = com.android.camera.data.DataRepository.dataItemRunning();
        r1 = r1.getComponentConfigFilter();
        r1 = r1.getComponentValue(r8);
        r1 = java.lang.Integer.parseInt(r1);
        r5 = com.android.camera.effect.FilterInfo.FILTER_ID_NONE;
        if (r1 == r5) goto L_0x005f;
    L_0x0058:
        if (r1 > 0) goto L_0x005b;
    L_0x005a:
        goto L_0x005f;
    L_0x005b:
        r1 = 2130837729; // 0x7f0200e1 float:1.728042E38 double:1.052773719E-314;
        goto L_0x0062;
    L_0x005f:
        r1 = 2130837728; // 0x7f0200e0 float:1.7280418E38 double:1.0527737183E-314;
    L_0x0062:
        r5 = r0;
        goto L_0x0068;
        r1 = r4;
        r5 = r1;
    L_0x0068:
        if (r1 <= 0) goto L_0x006f;
    L_0x006a:
        r6 = r7.mLeftTipImage;
        r6.setImageResource(r1);
    L_0x006f:
        r1 = r7.mLeftTipImage;
        r7.updateImageBgColor(r8, r1);
        r8 = r7.mLeftTipImage;
        r8 = r8.getTag();
        if (r8 == 0) goto L_0x008b;
    L_0x007c:
        r8 = r7.mLeftTipImage;
        r8 = r8.getTag();
        r8 = (java.lang.Integer) r8;
        r8 = r8.intValue();
        if (r8 != r2) goto L_0x008b;
    L_0x008a:
        return;
    L_0x008b:
        if (r5 == 0) goto L_0x0095;
    L_0x008d:
        r8 = r7.mLeftTipImage;
        r1 = r7.mDegree;
        r1 = (float) r1;
        android.support.v4.view.ViewCompat.setRotation(r8, r1);
    L_0x0095:
        r8 = r7.mLeftTipImage;
        r1 = java.lang.Integer.valueOf(r2);
        r8.setTag(r1);
        if (r10 != 0) goto L_0x00a6;
    L_0x00a0:
        if (r5 == 0) goto L_0x00a5;
    L_0x00a3:
        r0 = r4;
        goto L_0x00bf;
    L_0x00a5:
        goto L_0x00bf;
    L_0x00a6:
        if (r5 == 0) goto L_0x00b5;
    L_0x00a8:
        if (r9 != r3) goto L_0x00b3;
    L_0x00aa:
        r8 = com.mi.config.b.isSupportedOpticalZoom();
        if (r8 == 0) goto L_0x00b1;
    L_0x00b0:
        goto L_0x00a3;
    L_0x00b1:
        r0 = 3;
        goto L_0x00bf;
    L_0x00b3:
        r0 = 2;
        goto L_0x00bf;
    L_0x00b5:
        if (r9 == r3) goto L_0x00be;
    L_0x00b7:
        r8 = r7.mCurrentMode;
        if (r8 != r3) goto L_0x00bc;
    L_0x00bb:
        goto L_0x00be;
    L_0x00bc:
        r0 = 4;
        goto L_0x00bf;
    L_0x00bf:
        switch(r0) {
            case 0: goto L_0x0100;
            case 1: goto L_0x00fa;
            case 2: goto L_0x00eb;
            case 3: goto L_0x00d2;
            case 4: goto L_0x00c3;
            default: goto L_0x00c2;
        };
    L_0x00c2:
        goto L_0x0106;
    L_0x00c3:
        r8 = new com.android.camera.animation.type.AlphaOutOnSubscribe;
        r9 = r7.mLeftTipImage;
        r8.<init>(r9);
        r8 = io.reactivex.Completable.create(r8);
        r10.add(r8);
        goto L_0x0106;
    L_0x00d2:
        r8 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r9 = r7.mLeftTipImage;
        r8.<init>(r9);
        r9 = 150; // 0x96 float:2.1E-43 double:7.4E-322;
        r8 = r8.setStartDelayTime(r9);
        r8 = r8.setDurationTime(r9);
        r8 = io.reactivex.Completable.create(r8);
        r10.add(r8);
        goto L_0x0106;
    L_0x00eb:
        r8 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r9 = r7.mLeftTipImage;
        r8.<init>(r9);
        r8 = io.reactivex.Completable.create(r8);
        r10.add(r8);
        goto L_0x0106;
    L_0x00fa:
        r8 = r7.mLeftTipImage;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r8);
        goto L_0x0106;
    L_0x0100:
        r8 = r7.mLeftTipImage;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r8);
    L_0x0106:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentBottomPopupTips.updateLeftTipImage(int, int, java.util.List):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:43:0x00d9  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x00d3  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00c4  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00ab  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x009c  */
    /* JADX WARNING: Missing block: B:28:0x0080, code:
            if (r4 != 0) goto L_0x0083;
     */
    private void updateCenterTipImage(int r10, int r11, java.util.List<io.reactivex.Completable> r12) {
        /*
        r9 = this;
        r0 = -1;
        r1 = 33;
        r2 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        if (r10 == r2) goto L_0x000a;
    L_0x0008:
        r10 = r0;
        goto L_0x000c;
        r10 = r1;
        r2 = 1;
        r3 = 0;
        if (r10 == r0) goto L_0x001b;
    L_0x0011:
        if (r10 == r1) goto L_0x0016;
    L_0x0013:
        r4 = r2;
        r0 = r3;
        goto L_0x001f;
    L_0x0016:
        r0 = 2130968579; // 0x7f040003 float:1.7545816E38 double:1.0528383673E-314;
        r4 = r2;
        goto L_0x001f;
        r0 = r3;
        r4 = r0;
    L_0x001f:
        r5 = r9.mCenterTipImage;
        r5 = r5.getTag();
        if (r5 == 0) goto L_0x0038;
    L_0x0027:
        r5 = r9.mCenterTipImage;
        r5 = r5.getTag();
        r5 = (java.lang.Integer) r5;
        r5 = r5.intValue();
        if (r5 != r10) goto L_0x0038;
        r5 = r3;
        goto L_0x0039;
    L_0x0038:
        r5 = r2;
    L_0x0039:
        if (r5 == 0) goto L_0x0054;
    L_0x003b:
        r6 = r9.mCenterTipImage;
        r6.removeAllViews();
        if (r0 <= 0) goto L_0x0054;
    L_0x0042:
        r6 = r9.mCenterTipImage;
        r7 = r9.getContext();
        r7 = android.view.LayoutInflater.from(r7);
        r8 = 0;
        r0 = r7.inflate(r0, r8);
        r6.addView(r0);
    L_0x0054:
        if (r10 != r1) goto L_0x0068;
    L_0x0056:
        r0 = com.android.camera.CameraSettings.getCurrentLiveSpeedText();
        r1 = r9.mCenterTipImage;
        r6 = 2131558414; // 0x7f0d000e float:1.8742143E38 double:1.0531297845E-314;
        r1 = r1.findViewById(r6);
        r1 = (android.widget.TextView) r1;
        r1.setText(r0);
    L_0x0068:
        if (r5 != 0) goto L_0x006b;
    L_0x006a:
        return;
    L_0x006b:
        if (r4 == 0) goto L_0x0075;
    L_0x006d:
        r0 = r9.mCenterTipImage;
        r1 = r9.mDegree;
        r1 = (float) r1;
        android.support.v4.view.ViewCompat.setRotation(r0, r1);
    L_0x0075:
        r0 = r9.mCenterTipImage;
        r10 = java.lang.Integer.valueOf(r10);
        r0.setTag(r10);
        if (r12 != 0) goto L_0x0086;
    L_0x0080:
        if (r4 == 0) goto L_0x0085;
    L_0x0083:
        r2 = r3;
        goto L_0x0098;
    L_0x0085:
        goto L_0x0098;
    L_0x0086:
        if (r4 == 0) goto L_0x0097;
    L_0x0088:
        r10 = 163; // 0xa3 float:2.28E-43 double:8.05E-322;
        if (r11 != r10) goto L_0x0095;
    L_0x008c:
        r10 = com.mi.config.b.isSupportedOpticalZoom();
        if (r10 == 0) goto L_0x0093;
    L_0x0092:
        goto L_0x0083;
    L_0x0093:
        r2 = 3;
        goto L_0x0098;
    L_0x0095:
        r2 = 2;
        goto L_0x0098;
    L_0x0097:
        r2 = 4;
    L_0x0098:
        switch(r2) {
            case 0: goto L_0x00d9;
            case 1: goto L_0x00d3;
            case 2: goto L_0x00c4;
            case 3: goto L_0x00ab;
            case 4: goto L_0x009c;
            default: goto L_0x009b;
        };
    L_0x009b:
        goto L_0x00df;
    L_0x009c:
        r10 = new com.android.camera.animation.type.AlphaOutOnSubscribe;
        r11 = r9.mCenterTipImage;
        r10.<init>(r11);
        r10 = io.reactivex.Completable.create(r10);
        r12.add(r10);
        goto L_0x00df;
    L_0x00ab:
        r10 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r11 = r9.mCenterTipImage;
        r10.<init>(r11);
        r11 = 150; // 0x96 float:2.1E-43 double:7.4E-322;
        r10 = r10.setStartDelayTime(r11);
        r10 = r10.setDurationTime(r11);
        r10 = io.reactivex.Completable.create(r10);
        r12.add(r10);
        goto L_0x00df;
    L_0x00c4:
        r10 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r11 = r9.mCenterTipImage;
        r10.<init>(r11);
        r10 = io.reactivex.Completable.create(r10);
        r12.add(r10);
        goto L_0x00df;
    L_0x00d3:
        r10 = r9.mCenterTipImage;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r10);
        goto L_0x00df;
    L_0x00d9:
        r10 = r9.mCenterTipImage;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r10);
    L_0x00df:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentBottomPopupTips.updateCenterTipImage(int, int, java.util.List):void");
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
