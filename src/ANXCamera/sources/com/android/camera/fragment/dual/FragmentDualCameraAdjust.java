package com.android.camera.fragment.dual;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.annotation.TargetApi;
import android.os.Handler;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.text.SpannableStringBuilder;
import android.text.style.TextAppearanceSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.animation.type.TranslateYAlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyDualZoom;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.fragment.manually.adapter.ExtraSlideZoomAdapter;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.SnapShotIndicator;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.HorizontalSlideView;
import com.mi.config.b;
import io.reactivex.Completable;
import io.reactivex.functions.Action;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;
import miui.view.animation.QuadraticEaseInOutInterpolator;
import miui.view.animation.QuadraticEaseOutInterpolator;

public class FragmentDualCameraAdjust extends BaseFragment implements OnClickListener, OnLongClickListener, ManuallyListener, DualController, HandleBackTrace, SnapShotIndicator {
    public static final int FRAGMENT_INFO = 4084;
    private static final int HIDE_POPUP = 1;
    private int mCurrentState = -1;
    private TextAppearanceSpan mDigitsTextStyle;
    private ViewGroup mDualParentLayout;
    private TextView mDualZoomButton;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                FragmentDualCameraAdjust.this.onBackEvent(5);
            }
        }
    };
    private ViewGroup mHorizontalSlideLayout;
    private HorizontalSlideView mHorizontalSlideView;
    private boolean mIsHiding;
    private boolean mIsZoomAnimationEnabled;
    private boolean mIsZoomTo2X;
    private boolean mPassTouchFromZoomButtonToSlide;
    private int mSlideLayoutHeight;
    private ExtraSlideZoomAdapter mSlidingAdapter;
    private TextAppearanceSpan mSnapStyle;
    private SpannableStringBuilder mStringBuilder;
    private TextAppearanceSpan mXTextStyle;
    private AnimatorSet mZoomInAnimator;
    private AnimatorSet mZoomInOutAnimator;
    private AnimatorSet mZoomOutAnimator;
    private OnTouchListener mZoomPopupTouchListener = new OnTouchListener() {
        private boolean mAnimated = false;

        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (motionEvent.getAction() == 2) {
                if (!this.mAnimated) {
                    FragmentDualCameraAdjust.this.mZoomInAnimator.start();
                    this.mAnimated = true;
                }
            } else if ((motionEvent.getAction() == 1 || motionEvent.getAction() == 3) && this.mAnimated) {
                FragmentDualCameraAdjust.this.mZoomOutAnimator.start();
                this.mAnimated = false;
            }
            FragmentDualCameraAdjust.this.sendHideMessage();
            return false;
        }
    };
    private float mZoomRatio;
    private int mZoomRatioTele;
    private int mZoomRatioWide;
    private ObjectAnimator mZoomRequestAnimator;

    protected void initView(View view) {
        this.mStringBuilder = new SpannableStringBuilder();
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mDualParentLayout = (ViewGroup) view.findViewById(R.id.dual_layout_parent);
        this.mDualZoomButton = (TextView) view.findViewById(R.id.dual_camera_zoom_button);
        this.mHorizontalSlideLayout = (ViewGroup) view.findViewById(R.id.dual_camera_zoom_slideview_layout);
        this.mHorizontalSlideView = (HorizontalSlideView) this.mHorizontalSlideLayout.findViewById(R.id.dual_camera_zoom_slideview);
        this.mHorizontalSlideView.setOnTouchListener(this.mZoomPopupTouchListener);
        this.mDualZoomButton.setOnClickListener(this);
        this.mDigitsTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonDigitsTextStyle);
        this.mXTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonXTextStyle);
        this.mZoomRatioWide = 1;
        this.mZoomRatioTele = 2;
        this.mIsZoomAnimationEnabled = Util.isZoomAnimationEnabled();
        this.mZoomRequestAnimator = (ObjectAnimator) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_request);
        this.mZoomRequestAnimator.setTarget(this.mDualZoomButton);
        if (!this.mIsZoomAnimationEnabled) {
            this.mZoomRequestAnimator.setDuration(0);
        }
        this.mZoomRequestAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                FragmentDualCameraAdjust.this.requestZoomRatio(((Float) valueAnimator.getAnimatedValue()).floatValue(), false);
            }
        });
        this.mZoomRequestAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(true);
                if (FragmentDualCameraAdjust.this.mIsZoomTo2X) {
                    FragmentDualCameraAdjust.this.notifyZoom2X(true);
                } else {
                    FragmentDualCameraAdjust.this.notifyZoom2X(false);
                }
            }

            public void onAnimationEnd(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationCancel(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mZoomInOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in_out);
        this.mZoomInOutAnimator.setTarget(this.mDualZoomButton);
        this.mZoomInOutAnimator.setInterpolator(new QuadraticEaseOutInterpolator());
        this.mZoomInAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in);
        this.mZoomInAnimator.setTarget(this.mDualZoomButton);
        this.mZoomInAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        this.mZoomOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_out);
        this.mZoomOutAnimator.setTarget(this.mDualZoomButton);
        this.mZoomOutAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        int i = getResources().getDisplayMetrics().widthPixels;
        float f = (float) i;
        this.mHorizontalSlideLayout.getLayoutParams().height = ((int) (((f / 0.75f) - f) / 2.0f)) + getResources().getDimensionPixelSize(R.dimen.square_mode_bottom_cover_extra_margin);
        this.mSlideLayoutHeight = this.mHorizontalSlideLayout.getLayoutParams().height;
        adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mDualZoomButton.setOnTouchListener(new OnTouchListener() {
            private int mMiddleX = (FragmentDualCameraAdjust.this.getResources().getDisplayMetrics().widthPixels / 2);
            private float mTouchDownX = -1.0f;

            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (!FragmentDualCameraAdjust.this.mPassTouchFromZoomButtonToSlide) {
                    return false;
                }
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                if (FragmentDualCameraAdjust.this.mDegree == 90) {
                    motionEvent.setLocation(-y, x);
                } else if (FragmentDualCameraAdjust.this.mDegree == 180) {
                    motionEvent.setLocation(-x, -y);
                } else if (FragmentDualCameraAdjust.this.mDegree == 270) {
                    motionEvent.setLocation(y, x);
                }
                switch (motionEvent.getAction()) {
                    case 1:
                    case 3:
                        motionEvent.setLocation(((float) this.mMiddleX) + (motionEvent.getX() - this.mTouchDownX), motionEvent.getY());
                        FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(motionEvent);
                        FragmentDualCameraAdjust.this.mZoomPopupTouchListener.onTouch(null, motionEvent);
                        FragmentDualCameraAdjust.this.mPassTouchFromZoomButtonToSlide = false;
                        this.mTouchDownX = -1.0f;
                        break;
                    case 2:
                        if (this.mTouchDownX != -1.0f) {
                            motionEvent.setLocation(((float) this.mMiddleX) + (motionEvent.getX() - this.mTouchDownX), motionEvent.getY());
                            FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(motionEvent);
                            FragmentDualCameraAdjust.this.mZoomPopupTouchListener.onTouch(null, motionEvent);
                            break;
                        }
                        this.mTouchDownX = motionEvent.getX();
                        motionEvent.setAction(0);
                        motionEvent.setLocation((float) this.mMiddleX, motionEvent.getY());
                        FragmentDualCameraAdjust.this.mHorizontalSlideView.onTouchEvent(motionEvent);
                        break;
                }
                return true;
            }
        });
    }

    private void sendHideMessage() {
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    private void resetZoomIcon() {
        if (!CameraSettings.isSwitchCameraZoomMode()) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else if (ComponentManuallyDualLens.LENS_WIDE.equals(CameraSettings.getCameraZoomMode(this.mCurrentMode))) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else {
            this.mZoomRatio = (float) this.mZoomRatioTele;
        }
        setZoomText();
    }

    @TargetApi(21)
    public void updateZoomValue() {
        if (!CameraSettings.isSwitchCameraZoomMode()) {
            this.mZoomRatio = CameraSettings.readZoom();
        } else if (ComponentManuallyDualLens.LENS_WIDE.equals(CameraSettings.getCameraZoomMode(this.mCurrentMode))) {
            this.mZoomRatio = (float) this.mZoomRatioWide;
        } else {
            this.mZoomRatio = (float) this.mZoomRatioTele;
        }
        if (!this.mZoomRequestAnimator.isRunning() || this.mZoomRatio == ((float) this.mZoomRatioWide) || this.mZoomRatio == ((float) this.mZoomRatioTele)) {
            setZoomText();
        }
    }

    @TargetApi(21)
    private void setZoomText() {
        this.mStringBuilder.clear();
        int i = (int) this.mZoomRatio;
        int i2 = (int) ((this.mZoomRatio - ((float) i)) * 10.0f);
        if (i2 == 0) {
            Util.appendInApi26(this.mStringBuilder, String.valueOf(i), this.mDigitsTextStyle, 33);
        } else {
            SpannableStringBuilder spannableStringBuilder = this.mStringBuilder;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(i);
            stringBuilder.append(".");
            stringBuilder.append(i2);
            Util.appendInApi26(spannableStringBuilder, stringBuilder.toString(), this.mDigitsTextStyle, 33);
        }
        if (Util.isAccessible()) {
            this.mDualZoomButton.setContentDescription(getString(R.string.accessibility_focus_status, this.mStringBuilder));
            this.mDualZoomButton.postDelayed(new Runnable() {
                public void run() {
                    if (FragmentDualCameraAdjust.this.isAdded()) {
                        FragmentDualCameraAdjust.this.mDualZoomButton.sendAccessibilityEvent(4);
                    }
                }
            }, 3000);
        }
        Util.appendInApi26(this.mStringBuilder, "X", this.mXTextStyle, 33);
        this.mDualZoomButton.setText(this.mStringBuilder);
    }

    public boolean isZoomVisible() {
        return this.mCurrentState == 1 && this.mDualZoomButton.getVisibility() == 0;
    }

    public int visibleHeight() {
        if (this.mCurrentState == -1) {
            return 0;
        }
        if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            return this.mSlideLayoutHeight + this.mDualZoomButton.getHeight();
        }
        return this.mDualZoomButton.getHeight();
    }

    public void hideZoomButton() {
        if (this.mCurrentState != -1) {
            this.mCurrentState = -1;
            Completable.create(new AlphaOutOnSubscribe(this.mDualZoomButton)).subscribe();
        }
    }

    public void showZoomButton() {
        if (this.mCurrentState != 1) {
            this.mCurrentState = 1;
            ViewCompat.setRotation(this.mDualZoomButton, (float) this.mDegree);
            Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton)).subscribe();
        }
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(182, this);
        registerBackStack(modeCoordinator, this);
        if (b.isSupportedOpticalZoom()) {
            modeCoordinator.attachProtocol(184, this);
        }
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(182, this);
        unRegisterBackStack(modeCoordinator, this);
        if (b.isSupportedOpticalZoom()) {
            modeCoordinator.detachProtocol(184, this);
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_dual_camera_adjust;
    }

    public int getFragmentInto() {
        return 4084;
    }

    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        int i2;
        int i3 = this.mCurrentMode;
        super.provideAnimateElement(i, list, z);
        if (!(i == 163 || i == 173)) {
            switch (i) {
                case 165:
                    break;
                case 166:
                    this.mDualZoomButton.setOnLongClickListener(null);
                    break;
                default:
                    i2 = -1;
                    break;
            }
        }
        ViewCompat.setRotation(this.mDualZoomButton, (float) this.mDegree);
        this.mDualZoomButton.setOnLongClickListener(this);
        i2 = 1;
        if (CameraSettings.isUltraWideConfigOpen(this.mCurrentMode)) {
            i2 = -1;
        }
        if (i2 == 1) {
            onBackEvent(4);
            if (DataRepository.dataItemGlobal().getCurrentCameraId() == 1) {
                i2 = -1;
            }
        }
        if (this.mCurrentState == i2) {
            if (i2 == 1) {
                resetZoomIcon();
            }
            return;
        }
        this.mCurrentState = i2;
        if (i2 != -1) {
            if (i2 == 1) {
                if (this.mDualParentLayout.getVisibility() != 0) {
                    SlideInOnSubscribe.directSetResult(this.mDualParentLayout, 80);
                }
                SlideOutOnSubscribe.directSetResult(this.mHorizontalSlideLayout, 80);
                ViewCompat.setTranslationY(this.mDualZoomButton, (float) this.mSlideLayoutHeight);
                resetZoomIcon();
                if (list == null || (i == 165 && i3 != 167)) {
                    AlphaInOnSubscribe.directSetResult(this.mDualZoomButton);
                } else if (i3 == 167) {
                    list.add(Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton).setStartDelayTime(150)));
                } else {
                    list.add(Completable.create(new AlphaInOnSubscribe(this.mDualZoomButton)));
                }
            }
        } else if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            if (list == null) {
                this.mHorizontalSlideLayout.setVisibility(8);
            } else {
                list.add(Completable.create(new SlideOutOnSubscribe(this.mDualParentLayout, 80)));
            }
        } else if (list == null || i3 == 165) {
            AlphaOutOnSubscribe.directSetResult(this.mDualZoomButton);
        } else {
            list.add(Completable.create(new AlphaOutOnSubscribe(this.mDualZoomButton)));
        }
    }

    public boolean onBackEvent(int i) {
        if (this.mDualParentLayout.getVisibility() != 0 || this.mIsHiding) {
            return false;
        }
        boolean z = i == 3 && this.mCurrentMode == 173;
        if (!z && this.mHorizontalSlideLayout.getVisibility() != 0) {
            return false;
        }
        if (z) {
            alphaOutZoomButtonAndSlideView();
        } else {
            hideSlideView();
        }
        return true;
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if ((cameraAction == null || !cameraAction.isDoingAction()) && view.getId() == R.id.dual_camera_zoom_button) {
                if (CameraSettings.isSwitchCameraZoomMode()) {
                    toggle();
                } else if (this.mZoomRatio == ((float) this.mZoomRatioWide)) {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, CameraStat.ZOOM_2X);
                    this.mIsZoomTo2X = true;
                    this.mZoomRequestAnimator.setFloatValues(new float[]{this.mZoomRatio, (float) this.mZoomRatioTele});
                    this.mZoomRequestAnimator.start();
                } else if (this.mZoomRatio <= ((float) this.mZoomRatioTele)) {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, CameraStat.ZOOM_1X);
                    this.mIsZoomTo2X = false;
                    this.mZoomRequestAnimator.setFloatValues(new float[]{this.mZoomRatio, (float) this.mZoomRatioWide});
                    this.mZoomRequestAnimator.start();
                } else {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, CameraStat.ZOOM_1X);
                    requestZoomRatio((float) this.mZoomRatioTele, true);
                    requestZoomRatio((float) this.mZoomRatioWide, false);
                }
                this.mZoomInOutAnimator.start();
                onBackEvent(5);
            }
        }
    }

    private void notifyZoom2X(boolean z) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged == null) {
            return;
        }
        if (this.mIsZoomAnimationEnabled || z) {
            manuallyValueChanged.onDualZoomHappened(z);
        }
    }

    private void notifyZooming(boolean z) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensZooming(z);
        }
    }

    private void toggle() {
        ComponentManuallyDualLens manuallyDualLens = DataRepository.dataItemConfig().getManuallyDualLens();
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensSwitch(manuallyDualLens, this.mCurrentMode);
            updateZoomValue();
        }
        CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, ComponentManuallyDualLens.LENS_WIDE.equals(manuallyDualLens.getComponentValue(this.mCurrentMode)) ? CameraStat.ZOOM_1X : CameraStat.ZOOM_2X);
    }

    public boolean onLongClick(View view) {
        if (!isEnableClick()) {
            return false;
        }
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if ((cameraAction != null && cameraAction.isDoingAction()) || view.getId() != R.id.dual_camera_zoom_button) {
            return false;
        }
        initSlideZoomView(new ComponentManuallyDualZoom(DataRepository.dataItemRunning()));
        showSlideView();
        this.mPassTouchFromZoomButtonToSlide = true;
        return true;
    }

    private void initSlideZoomView(ComponentData componentData) {
        this.mSlidingAdapter = new ExtraSlideZoomAdapter(getContext(), componentData, this.mCurrentMode, this);
        this.mHorizontalSlideView.setOnPositionSelectListener(this.mSlidingAdapter);
        this.mHorizontalSlideView.setJustifyEnabled(false);
        this.mHorizontalSlideView.setDrawAdapter(this.mSlidingAdapter);
        this.mHorizontalSlideView.setSelection(this.mSlidingAdapter.mapZoomRatioToPosition(CameraSettings.readZoom()) / ((float) (this.mSlidingAdapter.getCount() - 1)));
    }

    private void showSlideView() {
        this.mIsHiding = false;
        this.mSlidingAdapter.setEnable(true);
        this.mHorizontalSlideLayout.setVisibility(0);
        ViewCompat.setTranslationY(this.mHorizontalSlideLayout, (float) this.mSlideLayoutHeight);
        ViewCompat.setAlpha(this.mHorizontalSlideLayout, 1.0f);
        Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, 0).setInterpolator(new DecelerateInterpolator())).subscribe();
        ViewCompat.setTranslationY(this.mDualZoomButton, (float) this.mSlideLayoutHeight);
        Completable.create(new TranslateYOnSubscribe(this.mDualZoomButton, 0).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        notifyTipsMargin();
    }

    private void alphaOutZoomButtonAndSlideView() {
        if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            this.mIsHiding = true;
            this.mSlidingAdapter.setEnable(false);
            Completable.create(new TranslateYAlphaOutOnSubscribe(this.mHorizontalSlideLayout, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe(new Action() {
                public void run() throws Exception {
                    FragmentDualCameraAdjust.this.mIsHiding = false;
                    FragmentDualCameraAdjust.this.mHorizontalSlideLayout.setVisibility(4);
                }
            });
            this.mCurrentState = -1;
            ViewCompat.setTranslationY(this.mDualZoomButton, 0.0f);
            Completable.create(new TranslateYAlphaOutOnSubscribe(this.mDualZoomButton, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe();
        } else {
            hideZoomButton();
        }
        notifyTipsMargin();
    }

    private void hideSlideView() {
        this.mIsHiding = true;
        this.mSlidingAdapter.setEnable(false);
        Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe(new Action() {
            public void run() throws Exception {
                FragmentDualCameraAdjust.this.mIsHiding = false;
                FragmentDualCameraAdjust.this.mHorizontalSlideLayout.setVisibility(4);
            }
        });
        ViewCompat.setTranslationY(this.mDualZoomButton, 0.0f);
        Completable.create(new TranslateYOnSubscribe(this.mDualZoomButton, this.mSlideLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe();
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.reInitTipImage();
        }
    }

    private void notifyTipsMargin() {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directHideTipImage();
            bottomPopupTips.directlyHideTips();
            if (Util.UI_DEBUG()) {
                bottomPopupTips.directShowOrHideLeftTipImage(false);
            }
        }
    }

    public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
        if (!isInModeChanging()) {
            requestZoomRatio(Float.valueOf(str2).floatValue(), false);
        }
    }

    private void requestZoomRatio(float f, boolean z) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualZoomValueChanged(f, z);
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mDualZoomButton.getVisibility() == 0) {
            list.add(this.mDualZoomButton);
        }
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        if (i == 3) {
            adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
        }
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        provideAnimateElement(this.mCurrentMode, null, false);
    }

    private void adjustViewBackground(View view, int i) {
        view.setBackgroundResource(R.color.fullscreen_background);
    }

    public void setSnapNumVisible(boolean z, boolean z2) {
        if (this.mHorizontalSlideLayout != null) {
            if (z) {
                if (z2) {
                    if (this.mHorizontalSlideLayout.getVisibility() == 0) {
                        hideSlideView();
                    }
                    this.mZoomInAnimator.start();
                } else {
                    ViewCompat.setRotation(this.mDualZoomButton, (float) this.mDegree);
                    this.mDualZoomButton.setVisibility(0);
                }
            } else if (z2) {
                this.mZoomOutAnimator.start();
                updateZoomValue();
            } else {
                this.mDualZoomButton.setVisibility(4);
            }
        }
    }

    public void setSnapNumValue(int i) {
        if (this.mSnapStyle == null) {
            this.mSnapStyle = new TextAppearanceSpan(getContext(), R.style.SnapTipTextStyle);
        }
        this.mStringBuilder.clear();
        Util.appendInApi26(this.mStringBuilder, String.format("%02d", new Object[]{Integer.valueOf(i)}), this.mSnapStyle, 33);
        this.mDualZoomButton.setText(this.mStringBuilder);
    }
}
