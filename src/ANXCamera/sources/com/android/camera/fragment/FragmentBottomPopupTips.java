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
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
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
import com.android.camera.constant.DurationConstant;
import com.android.camera.constant.LightingConstant;
import com.android.camera.data.DataRepository;
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
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.VerticalProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
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
    private static final int CALL_TYPE_NOTIFY = 1;
    private static final int CALL_TYPE_PROVIDE = 0;
    private static final int CENTER_TIP_IMAGE_SPEED = 33;
    public static final int FRAGMENT_INFO = 4081;
    private static final int LEFT_TIP_IMAGE_CLOSE = 20;
    private static final int LEFT_TIP_IMAGE_LIGHTING = 19;
    private static final int LEFT_TIP_IMAGE_STICKER = 18;
    private static final int LEFT_TIP_IMAGE_ULTRA_WIDE = 21;
    private static final long MAX_RED_DOT_TIME = 86400000;
    private static final int MSG_HIDE_TIP = 1;
    private static final int TIP_BACK_FACING_IMAGE_BEAUTY = 4;
    private static final int TIP_IMAGE_BEAUTY = 3;
    private static final int TIP_IMAGE_INVALID = -1;
    private static final int TIP_IMAGE_STICKER = 2;
    private int mBottomTipHeight;
    private View mCenterRedDot;
    private ImageView mCenterTipImage;
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
                } else if (FragmentBottomPopupTips.this.mLastTipType == 10 && CameraSettings.isEyeLightOpen()) {
                    FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                }
                FragmentBottomPopupTips.this.mLastTipType = 4;
            }
        }
    };
    private boolean mIsShowLeftImageIntro;
    @StringRes
    private int mLastTipMessage;
    private int mLastTipType;
    private FrameLayout mLeftImageIntro;
    private AnimatorSet mLeftImageIntroAnimator;
    private TextView mLeftImageIntroContent;
    private int mLeftImageIntroRadius;
    private int mLeftImageIntroWidth;
    private ImageView mLeftTipImage;
    private TextView mLightingPattern;
    private View mPortraitSuccessHint;
    private TextView mQrCodeButton;
    private View mRootView;
    private ViewGroup mSpeedTipImage;
    private ImageView mTipImage;
    private TextView mTipMessage;
    private int stringLightingRes;

    @Retention(RetentionPolicy.SOURCE)
    @interface TipImageType {
    }

    protected void initView(View view) {
        this.mRootView = view;
        this.mTipImage = (ImageView) view.findViewById(R.id.popup_tip_image);
        if (Util.UI_DEBUG()) {
            ((LayoutParams) this.mTipImage.getLayoutParams()).gravity = 8388693;
            this.mLeftTipImage = (ImageView) view.findViewById(R.id.popup_left_tip_image);
            ((LayoutParams) this.mLeftTipImage.getLayoutParams()).gravity = 8388691;
            this.mLeftTipImage.setImageResource(R.drawable.ic_new_effect_button_normal);
            this.mLeftTipImage.setOnClickListener(this);
            this.mSpeedTipImage = (ViewGroup) view.findViewById(R.id.popup_speed_tip_image);
            this.mSpeedTipImage.setOnClickListener(this);
            LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.popup_center_tip_layout);
            this.mCenterTipImage = (ImageView) linearLayout.findViewById(R.id.popup_center_tip_image);
            this.mCenterRedDot = linearLayout.findViewById(R.id.popup_center_red_dot);
            ((LayoutParams) linearLayout.getLayoutParams()).gravity = 81;
            this.mCenterTipImage.setOnClickListener(this);
            this.mLeftImageIntro = (FrameLayout) view.findViewById(R.id.popup_left_tip_intro);
            this.mLeftImageIntro.setOnClickListener(this);
            this.mLeftImageIntroContent = (TextView) view.findViewById(R.id.popup_left_tip_intro_text);
            this.mLeftImageIntroRadius = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_radius);
            this.mLeftImageIntroWidth = getLeftImageIntroWide();
        }
        this.mQrCodeButton = (TextView) view.findViewById(R.id.popup_tips_qrcode);
        this.mTipMessage = (TextView) view.findViewById(R.id.popup_tips_message);
        this.mPortraitSuccessHint = view.findViewById(R.id.portrait_success_hint);
        this.mLightingPattern = (TextView) view.findViewById(R.id.lighting_pattern);
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mTipImage.setOnClickListener(this);
        this.mQrCodeButton.setOnClickListener(this);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, 2);
        if (((ActivityBase) getContext()).getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            Util.startScreenSlideAlphaInAnimation(this.mTipImage);
        }
        this.mCloseIv = (ImageView) view.findViewById(R.id.close_iv);
        this.mCloseIv.setOnClickListener(this);
        if (!Util.UI_DEBUG()) {
            this.mCloseIv.setBackground(null);
        }
        this.mBottomTipHeight = getResources().getDimensionPixelSize(R.dimen.portrait_hint_height);
    }

    private int getLeftImageIntroWide() {
        this.mLeftImageIntroContent.measure(0, 0);
        int measuredWidth = this.mLeftImageIntroContent.getMeasuredWidth();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_left_padding);
        return ((measuredWidth + dimensionPixelSize) + getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_right_padding)) + ((this.mLeftImageIntroRadius - dimensionPixelSize) * 2);
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
        boolean z = DataRepository.dataItemGlobal().getBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", true);
        if (CameraSettings.isShowUltraWideIntro() && !z) {
            this.mIsShowLeftImageIntro = true;
        }
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(175, this);
        unRegisterBackStack(modeCoordinator, this);
        this.mIsShowLeftImageIntro = false;
    }

    /* JADX WARNING: Missing block: B:25:0x0095, code:
            if (((java.lang.Integer) r3.getTag()).intValue() == 18) goto L_0x0099;
     */
    /* JADX WARNING: Missing block: B:26:0x0099, code:
            hideAllTipImage();
            showLiveSticker();
     */
    /* JADX WARNING: Missing block: B:27:0x00a1, code:
            if (r2.mCenterRedDot == null) goto L_0x010e;
     */
    /* JADX WARNING: Missing block: B:28:0x00a3, code:
            r2.mCenterRedDot.setVisibility(8);
            com.android.camera.CameraSettings.setTTLiveStickerNeedRedDot(false);
     */
    /* JADX WARNING: Missing block: B:29:0x00af, code:
            onLeftImageClick(r3);
     */
    /* JADX WARNING: Missing block: B:40:0x010e, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null && cameraAction.isDoingAction()) {
                return;
            }
            if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                switch (view.getId()) {
                    case R.id.popup_tip_image /*2131558447*/:
                        int intValue = ((Integer) view.getTag()).intValue();
                        hideAllTipImage();
                        CameraSettings.setPopupTipBeautyIntroClicked();
                        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                        switch (intValue) {
                            case 2:
                                baseDelegate.delegateEvent(4);
                                break;
                            case 3:
                            case 4:
                                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BEAUTY_BUTTON);
                                showBeauty(this.mCurrentMode);
                                ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                                ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                                if (!(actionProcessing == null || !actionProcessing.isShowFilterView() || configChanges == null)) {
                                    configChanges.showOrHideFilter();
                                }
                                hideQrCodeTip();
                                break;
                        }
                        break;
                    case R.id.popup_left_tip_image /*2131558448*/:
                        break;
                    case R.id.popup_center_tip_image /*2131558450*/:
                        break;
                    case R.id.popup_left_tip_intro /*2131558452*/:
                        view.setTag(Integer.valueOf(21));
                        CameraSettings.setPopupUltraWideIntroClicked();
                        directHideLeftImageIntro();
                        break;
                    case R.id.popup_speed_tip_image /*2131558454*/:
                        if (((Integer) view.getTag()).intValue() == 33) {
                            hideAllTipImage();
                            showLiveSpeed();
                            break;
                        }
                        break;
                    case R.id.popup_tips_qrcode /*2131558456*/:
                        hideQrCodeTip();
                        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_QRCODE_DETECTED);
                        ((CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195)).showQRCodeResult();
                        break;
                    case R.id.close_iv /*2131558459*/:
                        switch (this.mCloseType) {
                            case 1:
                                closeFilter();
                                break;
                            case 2:
                                closeLight();
                                break;
                        }
                        break;
                }
            }
        }
    }

    private void onLeftImageClick(View view) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        switch (((Integer) view.getTag()).intValue()) {
            case 19:
                if (configChanges != null) {
                    configChanges.onConfigChanged(203);
                    return;
                }
                return;
            case 20:
                switch (this.mCloseType) {
                    case 1:
                        closeFilter();
                        return;
                    case 2:
                        closeLight();
                        return;
                    default:
                        return;
                }
            case 21:
                if (configChanges != null) {
                    configChanges.onConfigChanged(205);
                    return;
                }
                return;
            default:
                return;
        }
    }

    private void showBeauty(int i) {
        MiBeauty.showBeautyActionFromMode(i);
        if (this.mCurrentMode == 171) {
            BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
            if (bokehFNumberController != null) {
                bokehFNumberController.hideFNumberPanel(false, false);
            }
        }
    }

    private void hideZoomTipImage(int i) {
        if (!(i == 163 || i == 173)) {
            switch (i) {
                case 165:
                    break;
                case 166:
                    if (!DataRepository.dataItemFeature().fM()) {
                        return;
                    }
                    break;
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideZoomButton();
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertUpdateValue(2);
            }
        }
    }

    private void showLiveSticker() {
        CameraStatUtil.trackLiveClick(CameraStat.KEY_LIVE_STICKER);
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(164);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(12);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private void showLiveSpeed() {
        CameraStatUtil.trackLiveClick(CameraStat.KEY_LIVE_SPEED);
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
        if (Util.UI_DEBUG()) {
            updateLeftTipImage();
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
        if (Util.UI_DEBUG()) {
            hideLeftTipImage();
            hideSpeedTipImage();
            hideZoomTipImage(this.mCurrentMode);
            hideCenterTipImage();
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
    }

    public void reInitTipImage() {
        provideAnimateElement(this.mCurrentMode, null, 2);
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
        if (i == 6 && this.mCurrentMode != 171) {
            return;
        }
        if ((i != 10 || CameraSettings.getBogusCameraId() != 0) && !isLightingHintVisible()) {
            if (isPortraitSuccessHintVisible()) {
                hideTip(this.mPortraitSuccessHint);
            }
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = i;
            this.mCurrentTipMessage = i2;
            hideTip(this.mQrCodeButton);
            reIntTipViewMarginBottom(this.mTipMessage, this.mBottomTipHeight);
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
                    i = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
                    break;
                case 5:
                    i = 2000;
                    break;
                case 6:
                    i = 3000;
                    break;
                case 7:
                    i = DurationConstant.DURATION_LANDSCAPE_HINT;
                    break;
            }
            this.mHandler.removeCallbacksAndMessages(null);
            if (i > 0) {
                this.mHandler.sendEmptyMessageDelayed(1, (long) i);
            }
        }
    }

    public void showTips(final int i, final int i2, final int i3, int i4) {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                FragmentBottomPopupTips.this.showTips(i, i2, i3);
            }
        }, (long) i4);
    }

    public void showTipsWithOrientation(int i, int i2, int i3, int i4, int i5) {
        switch (i5) {
            case 0:
                showTips(i, i2, i3, i4);
                return;
            case 1:
                if (isLandScape()) {
                    showTips(i, i2, i3, i4);
                    return;
                }
                return;
            case 2:
                if (!isLandScape()) {
                    showTips(i, i2, i3, i4);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public int getCurrentBottomTipMsg() {
        return this.mCurrentTipType;
    }

    private boolean isPortraitSuccessHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    private void reIntTipViewMarginBottom(View view, int i) {
        int dimensionPixelSize;
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.beauty_extra_tip_bottom_margin);
        if (this.mCurrentMode == 165) {
            if (!CameraSettings.isUltraWideConfigOpen(this.mCurrentMode) || this.mCenterTipImage == null || this.mCenterTipImage.getVisibility() == 0) {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal) + ((((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2);
            } else {
                dimensionPixelSize = (getResources().getDimensionPixelSize(R.dimen.manually_indicator_layout_height) / 2) - (i / 2);
            }
        } else if (manuallyAdjust != null && manuallyAdjust.visibleHeight() > 0) {
            dimensionPixelSize = manuallyAdjust.visibleHeight();
        } else if (Util.UI_DEBUG() ? this.mCenterTipImage.getVisibility() != 0 : this.mTipImage.getVisibility() != 0) {
            if (dualController != null && dualController.isZoomVisible()) {
                dimensionPixelSize = dualController.visibleHeight();
            } else if (bokehFNumberController == null || !bokehFNumberController.isFNumberVisible()) {
                BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                    dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beautycamera_popup_fragment_height) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
                } else if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                    dimensionPixelSize = (getResources().getDimensionPixelSize(R.dimen.manually_indicator_layout_height) / 2) - (i / 2);
                } else {
                    dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + dimensionPixelSize2;
                }
            } else {
                dimensionPixelSize = ((int) this.mRootView.getTranslationY()) + bokehFNumberController.visibleHeight();
            }
        } else if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
            dimensionPixelSize = this.mTipImage.getHeight();
        } else {
            dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + dimensionPixelSize2;
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

    public void directlyShowTips(int i, @StringRes int i2) {
        ViewCompat.animate(this.mTipMessage).cancel();
        this.mHandler.removeCallbacksAndMessages(null);
        if (this.mTipMessage.getVisibility() != 0) {
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = i;
            this.mCurrentTipMessage = i2;
            AlphaInOnSubscribe.directSetResult(this.mTipMessage);
            this.mTipMessage.setText(i2);
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
                reIntTipViewMarginBottom(this.mPortraitSuccessHint, this.mBottomTipHeight);
            }
            this.mPortraitSuccessHint.setVisibility(i);
        }
    }

    public boolean isPortraitHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    public boolean isLightingHintVisible() {
        boolean isAnyViewVisible;
        VerticalProtocol verticalProtocol = (VerticalProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(198);
        if (verticalProtocol != null) {
            isAnyViewVisible = verticalProtocol.isAnyViewVisible();
        } else {
            isAnyViewVisible = false;
        }
        if (isAnyViewVisible || this.mLightingPattern.getVisibility() == 0) {
            return true;
        }
        return false;
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
            case 56:
                if (str.equals("8")) {
                    obj = 8;
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
            case 8:
                this.stringLightingRes = R.string.lighting_pattern_holi;
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
        reIntTipViewMarginBottom(this.mLightingPattern, this.mBottomTipHeight);
        this.mLightingPattern.setText(this.stringLightingRes);
        if (!isLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mLightingPattern);
        }
    }

    public void showQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 0) {
            hideTip(this.mTipMessage);
            reIntTipViewMarginBottom(this.mQrCodeButton, this.mQrCodeButton.getBackground().getIntrinsicHeight());
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

    /* JADX WARNING: Missing block: B:18:0x0030, code:
            if (r3.mCurrentTipType != 9) goto L_0x0033;
     */
    /* JADX WARNING: Missing block: B:19:0x0032, code:
            return false;
     */
    /* JADX WARNING: Missing block: B:20:0x0033, code:
            hideTip(r3.mTipMessage);
            hideTip(r3.mPortraitSuccessHint);
            hideTip(r3.mQrCodeButton);
            hideTip(r3.mLightingPattern);
            r3.mHandler.removeCallbacksAndMessages(null);
     */
    /* JADX WARNING: Missing block: B:21:0x004e, code:
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
                if (this.mCurrentTipType == 6 || this.mCurrentTipType == 7 || this.mCurrentTipType == 11 || this.mCurrentTipType == 9 || this.mCurrentTipType == 12 || this.mCurrentTipType == 13 || this.mCurrentTipType == 17) {
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

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        if (i2 == 3 || this.mCurrentMode != i) {
            this.mCloseIv.setVisibility(8);
            this.mCloseType = 0;
        }
        int i3 = this.mCurrentMode;
        super.provideAnimateElement(i, list, i2);
        onBackEvent(4);
        updateTipBottomMargin(0, false);
        updateTipImage(i, i3, list);
        if (Util.UI_DEBUG()) {
            updateLeftTipImage(0, i, i3, list);
            updateSpeedTipImage(i, i3, list);
            updateCenterTipImage(i, i3, list);
        }
    }

    private void setBeautyIntroButtonWidth(View view, int i) {
        if (view != null) {
            ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
            layoutParams.width = i;
            view.setLayoutParams(layoutParams);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0045  */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x003c  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x017a  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0174  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0165  */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x014c  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x013d  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00ca  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00d1  */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x0105  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0120  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0118  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x017a  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0174  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0165  */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x014c  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x013d  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0087  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x00ca  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00d1  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00f4  */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x0105  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0118  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0120  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x017a  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0174  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x0165  */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x014c  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x013d  */
    /* JADX WARNING: Missing block: B:7:0x0019, code:
            if (com.android.camera.CameraSettings.isRearMenuUltraPixelPhotographyOn() != false) goto L_0x0080;
     */
    /* JADX WARNING: Missing block: B:9:0x0027, code:
            if (com.android.camera.data.DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom") != false) goto L_0x0080;
     */
    /* JADX WARNING: Missing block: B:14:0x0042, code:
            if (r5.isSupportVideoBeauty() != false) goto L_0x0075;
     */
    /* JADX WARNING: Missing block: B:19:0x0051, code:
            if (r5.isSupportVideoBeauty() != false) goto L_0x007e;
     */
    /* JADX WARNING: Missing block: B:27:0x006b, code:
            if (com.android.camera.Util.UI_DEBUG() != false) goto L_0x007e;
     */
    /* JADX WARNING: Missing block: B:32:0x007b, code:
            if (com.android.camera.Util.UI_DEBUG() != false) goto L_0x007e;
     */
    /* JADX WARNING: Missing block: B:33:0x007e, code:
            r5 = 4;
     */
    /* JADX WARNING: Missing block: B:65:0x0118, code:
            if (r9 != 0) goto L_0x011b;
     */
    /* JADX WARNING: Missing block: B:76:0x0134, code:
            if (r11.mCurrentMode != 165) goto L_0x0139;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateTipImage(int i, int i2, List<Completable> list) {
        int i3;
        boolean z;
        int i4;
        int i5;
        int i6;
        boolean z2 = true;
        if (i != 165) {
            if (i != 171) {
                CameraCapabilities capabilitiesByBogusCameraId;
                if (i != 174) {
                    switch (i) {
                        case 162:
                            break;
                        case 161:
                            capabilitiesByBogusCameraId = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(CameraSettings.getBogusCameraId(), i);
                            if (!CameraSettings.isFrontCamera()) {
                                if (capabilitiesByBogusCameraId != null) {
                                    break;
                                }
                            } else if (Util.UI_DEBUG()) {
                                if (capabilitiesByBogusCameraId != null) {
                                    break;
                                }
                            }
                            break;
                        case 163:
                            break;
                    }
                }
                capabilitiesByBogusCameraId = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(CameraSettings.getBogusCameraId(), i);
                if (!CameraSettings.isFrontCamera()) {
                }
                i3 = -1;
                z = true;
                if (i3 != -1) {
                    switch (i3) {
                        case 2:
                            i4 = R.drawable.ic_beauty_sticker;
                            i5 = 1;
                            i6 = 0;
                            break;
                        case 3:
                        case 4:
                            boolean UI_DEBUG = Util.UI_DEBUG();
                            i5 = R.drawable.ic_beauty_normal;
                            if (UI_DEBUG) {
                                boolean isFaceBeautyOn;
                                if (this.mCurrentMode != 174) {
                                    isFaceBeautyOn = CameraSettings.isFaceBeautyOn(DataRepository.dataItemConfig().getComponentConfigBeauty().getComponentValue(this.mCurrentMode));
                                } else {
                                    isFaceBeautyOn = CameraSettings.isLiveBeautyOpen();
                                }
                                if (isFaceBeautyOn) {
                                    i5 = R.drawable.ic_beauty_on;
                                }
                            }
                            i6 = R.string.accessibility_beauty_panel_open;
                            i4 = i5;
                            i5 = 1;
                            break;
                        default:
                            i5 = 1;
                            i4 = 0;
                            i6 = i4;
                            break;
                    }
                }
                i4 = 0;
                i6 = i4;
                i5 = i6;
                if (i4 > 0) {
                    this.mTipImage.setImageResource(i4);
                }
                if (i6 > 0 && Util.isAccessible()) {
                    this.mTipImage.setContentDescription(getString(i6));
                }
                updateImageBgColor(i, this.mTipImage, false);
                if (this.mTipImage.getTag() != null || ((Integer) this.mTipImage.getTag()).intValue() != i3) {
                    if (i5 != 0) {
                        ViewCompat.setRotation(this.mTipImage, (float) this.mDegree);
                    }
                    this.mTipImage.setTag(Integer.valueOf(i3));
                    if (list != null) {
                        if (i5 == 0) {
                            if (i2 != 165) {
                            }
                            z2 = true;
                        } else if (i2 != 165) {
                            z2 = true;
                        } else if (!b.isSupportedOpticalZoom()) {
                            z2 = true;
                        }
                        switch (z2) {
                            case false:
                                ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                                if (actionProcessing == null || !actionProcessing.isShowLightingView()) {
                                    z = false;
                                }
                                if (z) {
                                    this.mTipImage.setTag(Integer.valueOf(-1));
                                }
                                if (!z) {
                                    AlphaInOnSubscribe.directSetResult(this.mTipImage);
                                    break;
                                }
                                break;
                            case true:
                                AlphaOutOnSubscribe.directSetResult(this.mTipImage);
                                break;
                            case true:
                                list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage)));
                                break;
                            case true:
                                list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage).setStartDelayTime(150).setDurationTime(150)));
                                break;
                            case true:
                                list.add(Completable.create(new AlphaOutOnSubscribe(this.mTipImage)));
                                break;
                        }
                    }
                    z2 = false;
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
                return;
            }
            if (!((CameraSettings.isFrontCamera() && b.hC()) || Util.UI_DEBUG())) {
            }
            i3 = 3;
            z = true;
            if (i3 != -1) {
            }
            if (i4 > 0) {
            }
            this.mTipImage.setContentDescription(getString(i6));
            updateImageBgColor(i, this.mTipImage, false);
            if (this.mTipImage.getTag() != null) {
            }
            if (i5 != 0) {
            }
            this.mTipImage.setTag(Integer.valueOf(i3));
            if (list != null) {
            }
            z2 = false;
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
        if (!CameraSettings.isFrontCamera()) {
        }
        i3 = 3;
        z = true;
        if (i3 != -1) {
        }
        if (i4 > 0) {
        }
        this.mTipImage.setContentDescription(getString(i6));
        updateImageBgColor(i, this.mTipImage, false);
        if (this.mTipImage.getTag() != null) {
        }
        if (i5 != 0) {
        }
        this.mTipImage.setTag(Integer.valueOf(i3));
        if (list != null) {
        }
        z2 = false;
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

    private void updateImageBgColor(int i, View view, boolean z) {
        int i2;
        int i3;
        if (z) {
            i2 = R.drawable.bg_popup_indicator;
            i3 = R.drawable.square_module_bg_popup_indicator;
        } else {
            i2 = R.drawable.bg_popup_indicator_no_stroke;
            i3 = R.drawable.square_module_bg_popup_indicator_no_stroke;
        }
        if (i != 165) {
            view.setBackgroundResource(i2);
        } else {
            view.setBackgroundResource(i3);
        }
    }

    /* JADX WARNING: Missing block: B:6:0x003a, code:
            if (com.android.camera.data.DataRepository.dataItemFeature().fb() != false) goto L_0x0083;
     */
    /* JADX WARNING: Missing block: B:8:0x0045, code:
            if (com.android.camera.data.DataRepository.dataItemFeature().fa() != false) goto L_0x0083;
     */
    /* JADX WARNING: Missing block: B:13:0x0054, code:
            if (com.android.camera.CameraSettings.isRearMenuUltraPixelPhotographyOn() != false) goto L_0x0082;
     */
    /* JADX WARNING: Missing block: B:29:0x0080, code:
            r8 = 21;
     */
    /* JADX WARNING: Missing block: B:30:0x0082, code:
            r8 = -1;
     */
    /* JADX WARNING: Missing block: B:31:0x0083, code:
            r8 = checkLeftImageTipClose(r8);
            r0 = true;
     */
    /* JADX WARNING: Missing block: B:32:0x008c, code:
            if (r8 == -1) goto L_0x00d3;
     */
    /* JADX WARNING: Missing block: B:33:0x008e, code:
            if (r8 == 21) goto L_0x00b6;
     */
    /* JADX WARNING: Missing block: B:34:0x0090, code:
            switch(r8) {
                case 18: goto L_0x00a0;
                case 19: goto L_0x0097;
                default: goto L_0x0093;
            };
     */
    /* JADX WARNING: Missing block: B:35:0x0093, code:
            r4 = 1;
            r2 = 0;
            r3 = r2;
     */
    /* JADX WARNING: Missing block: B:36:0x0097, code:
            r2 = com.android.camera.R.drawable.ic_light;
            r3 = com.android.camera.R.string.accessibility_lighting_panel_on;
            r4 = 1;
     */
    /* JADX WARNING: Missing block: B:38:0x00aa, code:
            if ("".equals(com.android.camera.CameraSettings.getCurrentLiveSticker()) == false) goto L_0x00b2;
     */
    /* JADX WARNING: Missing block: B:39:0x00ac, code:
            r2 = com.android.camera.R.drawable.ic_live_sticker_normal;
     */
    /* JADX WARNING: Missing block: B:40:0x00af, code:
            r4 = 1;
            r3 = 0;
     */
    /* JADX WARNING: Missing block: B:41:0x00b2, code:
            r2 = com.android.camera.R.drawable.ic_live_sticker_on;
     */
    /* JADX WARNING: Missing block: B:42:0x00b6, code:
            r2 = com.android.camera.CameraSettings.isUltraWideConfigOpen(r7.mCurrentMode);
     */
    /* JADX WARNING: Missing block: B:43:0x00bc, code:
            if (r2 == false) goto L_0x00c2;
     */
    /* JADX WARNING: Missing block: B:44:0x00be, code:
            r3 = com.android.camera.R.drawable.icon_config_ultra_wide_on;
     */
    /* JADX WARNING: Missing block: B:45:0x00c2, code:
            r3 = com.android.camera.R.drawable.icon_config_ultra_wide_off;
     */
    /* JADX WARNING: Missing block: B:46:0x00c5, code:
            if (r2 == false) goto L_0x00cb;
     */
    /* JADX WARNING: Missing block: B:47:0x00c7, code:
            r2 = com.android.camera.R.string.accessibility_ultra_wide_on;
     */
    /* JADX WARNING: Missing block: B:48:0x00cb, code:
            r2 = com.android.camera.R.string.accessibility_ultra_wide_off;
     */
    /* JADX WARNING: Missing block: B:49:0x00ce, code:
            r4 = 1;
            r6 = r3;
            r3 = r2;
            r2 = r6;
     */
    /* JADX WARNING: Missing block: B:50:0x00d3, code:
            r2 = 0;
            r3 = r2;
            r4 = r3;
     */
    /* JADX WARNING: Missing block: B:51:0x00d8, code:
            if (r2 <= 0) goto L_0x00df;
     */
    /* JADX WARNING: Missing block: B:52:0x00da, code:
            r7.mLeftTipImage.setImageResource(r2);
     */
    /* JADX WARNING: Missing block: B:53:0x00df, code:
            if (r3 <= 0) goto L_0x00f0;
     */
    /* JADX WARNING: Missing block: B:55:0x00e5, code:
            if (com.android.camera.Util.isAccessible() == false) goto L_0x00f0;
     */
    /* JADX WARNING: Missing block: B:56:0x00e7, code:
            r7.mLeftTipImage.setContentDescription(getString(r3));
     */
    /* JADX WARNING: Missing block: B:57:0x00f0, code:
            updateImageBgColor(r9, r7.mLeftTipImage, false);
     */
    /* JADX WARNING: Missing block: B:58:0x00fb, code:
            if (r7.mLeftTipImage.getTag() == null) goto L_0x010c;
     */
    /* JADX WARNING: Missing block: B:60:0x0109, code:
            if (((java.lang.Integer) r7.mLeftTipImage.getTag()).intValue() != r8) goto L_0x010c;
     */
    /* JADX WARNING: Missing block: B:61:0x010b, code:
            return;
     */
    /* JADX WARNING: Missing block: B:62:0x010c, code:
            if (r4 == 0) goto L_0x0116;
     */
    /* JADX WARNING: Missing block: B:63:0x010e, code:
            android.support.v4.view.ViewCompat.setRotation(r7.mLeftTipImage, (float) r7.mDegree);
     */
    /* JADX WARNING: Missing block: B:64:0x0116, code:
            r7.mLeftTipImage.setTag(java.lang.Integer.valueOf(r8));
     */
    /* JADX WARNING: Missing block: B:65:0x011f, code:
            if (r11 != null) goto L_0x0127;
     */
    /* JADX WARNING: Missing block: B:66:0x0121, code:
            if (r4 == 0) goto L_0x0148;
     */
    /* JADX WARNING: Missing block: B:67:0x0123, code:
            r0 = false;
     */
    /* JADX WARNING: Missing block: B:69:0x0129, code:
            if (r4 == 0) goto L_0x013e;
     */
    /* JADX WARNING: Missing block: B:70:0x012b, code:
            if (r10 != 165) goto L_0x0138;
     */
    /* JADX WARNING: Missing block: B:72:0x0131, code:
            if (com.mi.config.b.isSupportedOpticalZoom() == false) goto L_0x0136;
     */
    /* JADX WARNING: Missing block: B:73:0x0133, code:
            r0 = false;
     */
    /* JADX WARNING: Missing block: B:74:0x0136, code:
            r8 = true;
     */
    /* JADX WARNING: Missing block: B:75:0x0138, code:
            r8 = true;
     */
    /* JADX WARNING: Missing block: B:76:0x0139, code:
            r0 = r8;
     */
    /* JADX WARNING: Missing block: B:77:0x013a, code:
            directHideLeftImageIntro();
     */
    /* JADX WARNING: Missing block: B:78:0x013e, code:
            if (r10 == 165) goto L_0x0148;
     */
    /* JADX WARNING: Missing block: B:80:0x0142, code:
            if (r7.mCurrentMode != 165) goto L_0x0145;
     */
    /* JADX WARNING: Missing block: B:81:0x0145, code:
            r0 = true;
     */
    /* JADX WARNING: Missing block: B:82:0x0148, code:
            switch(r0) {
                case 0: goto L_0x0189;
                case 1: goto L_0x0183;
                case 2: goto L_0x0174;
                case 3: goto L_0x015b;
                case 4: goto L_0x014c;
                default: goto L_0x014b;
            };
     */
    /* JADX WARNING: Missing block: B:83:0x014c, code:
            r11.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r7.mLeftTipImage)));
     */
    /* JADX WARNING: Missing block: B:84:0x015b, code:
            r11.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaInOnSubscribe(r7.mLeftTipImage).setStartDelayTime(150).setDurationTime(150)));
     */
    /* JADX WARNING: Missing block: B:85:0x0174, code:
            r11.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaInOnSubscribe(r7.mLeftTipImage)));
     */
    /* JADX WARNING: Missing block: B:86:0x0183, code:
            com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r7.mLeftTipImage);
     */
    /* JADX WARNING: Missing block: B:87:0x0189, code:
            com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r7.mLeftTipImage);
     */
    /* JADX WARNING: Missing block: B:88:0x018f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateLeftTipImage(int i, int i2, int i3, List<Completable> list) {
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        boolean isNormalIntent = DataRepository.dataItemGlobal().isNormalIntent();
        boolean isSupportUltraWide = DataRepository.dataItemFeature().isSupportUltraWide();
        CameraCapabilities capabilitiesByBogusCameraId = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, this.mCurrentMode);
        switch (i2) {
            case 161:
            case 165:
                if (isSupportUltraWide && currentCameraId == 0) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 162:
            case 168:
            case 169:
            case 170:
                if (currentCameraId == 0 && isNormalIntent && isSupportUltraWide && !DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom")) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 163:
            case 174:
                if (CameraSettings.isSupportedUltraPixelPhotography(capabilitiesByBogusCameraId)) {
                    break;
                }
            case 171:
                if (isNormalIntent) {
                    i = 19;
                    switch (currentCameraId) {
                        case 0:
                            break;
                        case 1:
                            break;
                        default:
                            i = -1;
                            break;
                    }
                }
        }
    }

    private int checkLeftImageTipClose(int i) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing == null || !actionProcessing.isShowLightingView()) {
            return i;
        }
        return 20;
    }

    /* JADX WARNING: Removed duplicated region for block: B:54:0x00f8  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x00f2  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00e3  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00ca  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00bb  */
    /* JADX WARNING: Missing block: B:36:0x0096, code:
            if (r1 != 0) goto L_0x0099;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateCenterTipImage(int i, int i2, List<Completable> list) {
        int i3;
        int i4;
        int i5 = i != 174 ? -1 : 18;
        boolean z = true;
        if (i5 == -1) {
            if (this.mCenterRedDot != null) {
                this.mCenterRedDot.setVisibility(8);
            }
            i3 = 0;
            i4 = i3;
        } else if (i5 != 18) {
            i4 = 1;
            i3 = 0;
        } else {
            if ("".equals(CameraSettings.getCurrentLiveSticker())) {
                i3 = R.drawable.ic_live_sticker_normal;
            } else {
                i3 = R.drawable.ic_live_sticker_on;
            }
            if (this.mCenterRedDot != null) {
                boolean tTLiveStickerNeedRedDot = CameraSettings.getTTLiveStickerNeedRedDot();
                long liveStickerRedDotTime = CameraSettings.getLiveStickerRedDotTime();
                long currentTimeMillis = System.currentTimeMillis();
                if ((liveStickerRedDotTime <= 0 || currentTimeMillis - liveStickerRedDotTime < MAX_RED_DOT_TIME) && tTLiveStickerNeedRedDot) {
                    this.mCenterRedDot.setVisibility(0);
                }
            }
            i4 = 1;
        }
        if (i3 > 0) {
            this.mCenterTipImage.setImageResource(i3);
        }
        updateImageBgColor(i, this.mCenterTipImage, false);
        if (this.mCenterTipImage.getTag() == null || ((Integer) this.mCenterTipImage.getTag()).intValue() != i5) {
            if (i4 != 0) {
                ViewCompat.setRotation(this.mCenterTipImage, (float) this.mDegree);
            }
            this.mCenterTipImage.setTag(Integer.valueOf(i5));
            if (list != null) {
                if (i4 != 0) {
                    if (i2 != 165) {
                        z = true;
                    } else if (!b.isSupportedOpticalZoom()) {
                        z = true;
                    }
                } else if (!(i2 == 165 || this.mCurrentMode == 165)) {
                    z = true;
                }
                switch (z) {
                    case false:
                        AlphaInOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case true:
                        AlphaOutOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case true:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mCenterTipImage)));
                        break;
                    case true:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case true:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)));
                        break;
                }
            }
            z = false;
            switch (z) {
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

    /* JADX WARNING: Removed duplicated region for block: B:49:0x010f  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00fa  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00d2  */
    /* JADX WARNING: Missing block: B:34:0x00b5, code:
            if (r4 != 0) goto L_0x00b8;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateSpeedTipImage(int i, int i2, List<Completable> list) {
        int i3;
        int i4;
        i = i != 174 ? -1 : 33;
        int i5 = 1;
        int i6;
        if (i == -1) {
            i6 = 1;
            i3 = 0;
            i4 = i3;
        } else if (i != 33) {
            i4 = 1;
            i6 = i4;
            i3 = 0;
        } else {
            i3 = R.layout.bottom_popup_tips_center_live_speed;
            i4 = 1;
            i6 = 0;
        }
        Object obj = (this.mSpeedTipImage.getTag() == null || ((Integer) this.mSpeedTipImage.getTag()).intValue() != i) ? 1 : null;
        if (obj != null) {
            this.mSpeedTipImage.removeAllViews();
            if (i3 > 0) {
                this.mSpeedTipImage.addView(LayoutInflater.from(getContext()).inflate(i3, null));
            }
        }
        if (i == 33) {
            ((TextView) this.mSpeedTipImage.findViewById(R.id.live_speed_text)).setText(CameraSettings.getCurrentLiveSpeedText());
            ImageView imageView = (ImageView) this.mSpeedTipImage.findViewById(R.id.icon);
            if (CameraSettings.getCurrentLiveSpeed().equals(String.valueOf(2))) {
                imageView.setImageResource(R.drawable.ic_live_speed_normal);
            } else {
                imageView.setImageResource(R.drawable.ic_live_speed_mod);
            }
        }
        if (obj != null) {
            if (i4 == 0 || i6 == 0) {
                ViewCompat.setRotation(this.mSpeedTipImage, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            } else {
                ViewCompat.setRotation(this.mSpeedTipImage, (float) this.mDegree);
            }
            this.mSpeedTipImage.setTag(Integer.valueOf(i));
            if (list != null) {
                if (i4 == 0) {
                    i5 = 4;
                } else if (i2 != 163) {
                    i5 = 2;
                } else if (!b.isSupportedOpticalZoom()) {
                    i5 = 3;
                }
                switch (i5) {
                    case 0:
                        AlphaInOnSubscribe.directSetResult(this.mSpeedTipImage);
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mSpeedTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mSpeedTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mSpeedTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mSpeedTipImage)));
                        break;
                }
            }
            i5 = 0;
            switch (i5) {
                case 0:
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
        if (Util.UI_DEBUG()) {
            if (this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() == 0) {
                list.add(this.mLeftTipImage);
            }
            if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() == 0) {
                list.add(this.mCenterTipImage);
            }
            if (!(this.mSpeedTipImage == null || this.mSpeedTipImage.getVisibility() != 0 || ((Integer) this.mSpeedTipImage.getTag()).intValue() == 33)) {
                list.add(this.mSpeedTipImage);
            }
            if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() == 0) {
                list.add(this.mCenterTipImage);
            }
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
            updateLeftTipImage(1, this.mCurrentMode, this.mCurrentMode, null);
            updateSpeedTipImage(this.mCurrentMode, this.mCurrentMode, null);
            updateCenterTipImage(this.mCurrentMode, this.mCurrentMode, null);
        }
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        reConfigBottomTipOfUltraWide();
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
        if (Util.UI_DEBUG()) {
            if (!z) {
                this.mCloseType = 0;
            } else if (this.mCurrentMode != 167) {
                this.mCloseType = i;
            } else {
                return;
            }
            showOrHideCloseImage(z);
        } else if (!z) {
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

    public void hideSpeedTipImage() {
        if (this.mSpeedTipImage != null && this.mSpeedTipImage.getVisibility() != 4) {
            this.mSpeedTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mSpeedTipImage)).subscribe();
        }
    }

    public void hideCenterTipImage() {
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() != 4) {
            this.mCenterTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)).subscribe();
            if (this.mCenterRedDot != null) {
                this.mCenterRedDot.setVisibility(8);
            }
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
        if (this.mLeftTipImage != null) {
            if (z) {
                updateLeftTipImage();
                this.mLeftTipImage.setVisibility(0);
            } else {
                this.mLeftTipImage.setTag(Integer.valueOf(-1));
                this.mLeftTipImage.setVisibility(4);
            }
        }
    }

    public void showOrHideCloseImage(boolean z) {
        if (this.mLeftTipImage != null) {
            this.mLeftTipImage.setImageResource(R.drawable.ic_manually_indicator);
            if (z) {
                if (Util.isAccessible() && this.mCloseType == 2) {
                    this.mLeftTipImage.setContentDescription(getString(R.string.accessibility_lighting_panel_off));
                }
                this.mLeftTipImage.setTag(Integer.valueOf(20));
                Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage)).subscribe();
            } else {
                this.mLeftTipImage.setTag(Integer.valueOf(-1));
                Completable.create(new AlphaOutOnSubscribe(this.mLeftTipImage)).subscribe();
            }
        }
    }

    public void updateLeftTipImage() {
        updateLeftTipImage(1, this.mCurrentMode, this.mCurrentMode, null);
    }

    private void startLeftImageIntroAnim(int i) {
        if (i != 1) {
            directShowOrHideLeftTipImage(false);
            this.mLeftImageIntro.setVisibility(0);
            if (this.mLeftImageIntroAnimator == null) {
                ValueAnimator ofInt = ValueAnimator.ofInt(new int[]{this.mLeftImageIntroWidth, this.mLeftImageIntroRadius * 2});
                ofInt.setDuration(300);
                ObjectAnimator.ofFloat(this.mLeftImageIntroContent, "alpha", new float[]{1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO}).setDuration(250);
                ofInt.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        FragmentBottomPopupTips.this.setBeautyIntroButtonWidth(FragmentBottomPopupTips.this.mLeftImageIntro, ((Integer) valueAnimator.getAnimatedValue()).intValue());
                    }
                });
                this.mLeftImageIntroAnimator = new AnimatorSet();
                this.mLeftImageIntroAnimator.playTogether(new Animator[]{ofInt, r3});
                this.mLeftImageIntroAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
                this.mLeftImageIntroAnimator.setStartDelay(FragmentTopAlert.HINT_DELAY_TIME);
                this.mLeftImageIntroAnimator.addListener(new AnimatorListenerAdapter() {
                    private boolean cancelled;

                    public void onAnimationStart(Animator animator) {
                        this.cancelled = false;
                    }

                    public void onAnimationCancel(Animator animator) {
                        this.cancelled = true;
                    }

                    public void onAnimationEnd(Animator animator) {
                        if (FragmentBottomPopupTips.this.canProvide() && !this.cancelled) {
                            FragmentBottomPopupTips.this.directHideLeftImageIntro();
                            FragmentBottomPopupTips.this.updateLeftTipImage();
                        }
                    }
                });
            } else {
                this.mLeftImageIntro.setAlpha(1.0f);
                this.mLeftImageIntroContent.clearAnimation();
                this.mLeftImageIntroAnimator.cancel();
            }
            this.mLeftImageIntroAnimator.start();
            CameraSettings.addPopupUltraWideIntroShowTimes();
        }
    }

    private void directHideLeftImageIntro() {
        this.mIsShowLeftImageIntro = false;
        if (this.mLeftImageIntro.getVisibility() == 0) {
            AlphaOutOnSubscribe.directSetResult(this.mLeftImageIntro);
        }
    }

    public void directShowLeftImageIntro() {
        if (CameraSettings.isShowUltraWideIntro()) {
            this.mIsShowLeftImageIntro = true;
        }
        updateLeftTipImage(0, this.mCurrentMode, this.mCurrentMode, null);
    }

    public void updateTipImage() {
        updateTipImage(this.mCurrentMode, this.mCurrentMode, null);
    }

    public void reConfigBottomTipOfUltraWide() {
        if (163 == this.mCurrentMode || 162 == this.mCurrentMode) {
            boolean isSwitchOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom");
            if (!(162 == this.mCurrentMode && isSwitchOn) && CameraSettings.isUltraWideConfigOpen(this.mCurrentMode)) {
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                    showTips(13, R.string.ultra_wide_open_tip, 4);
                }
            }
        }
    }
}
