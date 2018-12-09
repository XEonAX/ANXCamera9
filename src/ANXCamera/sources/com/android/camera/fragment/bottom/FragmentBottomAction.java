package com.android.camera.fragment.bottom;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.annotation.SuppressLint;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.util.SparseArray;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Thumbnail;
import com.android.camera.ThumbnailUpdater;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.ComponentModuleList;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentFilter;
import com.android.camera.fragment.FragmentLighting;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.VideoModule;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraActionTrack;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import com.android.camera.protocol.ModeProtocol.HandlerSwitcher;
import com.android.camera.protocol.ModeProtocol.ModeChangeController;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.ui.CameraSnapView;
import com.android.camera.ui.CameraSnapView.SnapListener;
import com.android.camera.ui.EdgeHorizonScrollView;
import com.android.camera.ui.ModeSelectView;
import com.android.camera.ui.ModeSelectView.onModeClickedListener;
import com.mi.config.b;
import io.reactivex.Completable;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseInInterpolator;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseOutInterpolator;

public class FragmentBottomAction extends BaseFragment implements OnClickListener, ActionProcessing, BottomMenuProtocol, HandleBackTrace, HandleBeautyRecording, HandlerSwitcher, ModeChangeController, SnapListener, onModeClickedListener {
    public static final int FRAGMENT_INFO = 241;
    private static final int MSG_SHOW_PROGRESS = 1;
    private static final String TAG = "FragmentBottomAction";
    private FrameLayout mBottomActionView;
    private ValueAnimator mBottomAnimator;
    private View mBottomMenuLayout;
    private ImageView mBottomRecordingCameraPicker;
    private TextView mBottomRecordingTime;
    private int mBottomRollDownHeight;
    private boolean mCameraPickEnable;
    private ImageView mCameraPicker;
    private int mCaptureProgressDelay;
    private ComponentModuleList mComponentModuleList;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private int mCurrentBeautyActionMenuType;
    private int mCurrentLiveActionMenuType;
    private EdgeHorizonScrollView mEdgeHorizonScrollView;
    private int mFilterListHeight;
    private FragmentFilter mFragmentFilter;
    private View mFragmentLayoutExtra;
    private View mFragmentLayoutExtra2;
    private FragmentLighting mFragmentLighting;
    @SuppressLint({"HandlerLeak"})
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                FragmentBottomAction.this.mThumbnailProgress.setVisibility(0);
            }
        }
    };
    private boolean mInLoading;
    private boolean mIsBottomRollDown = false;
    private boolean mIsIntentAction;
    private boolean mIsShowFilter = false;
    private boolean mIsShowLighting = false;
    private boolean mLongPressBurst;
    private BottomActionMenu mModeSelectLayout;
    private ModeSelectView mModeSelectView;
    private ProgressBar mPostProcess;
    private int mRecordProgressDelay;
    private ImageView mRecordingPause;
    private ImageView mRecordingReverse;
    private ImageView mRecordingSnap;
    private CameraSnapView mShutterButton;
    private SineEaseOutInterpolator mSineEaseOut;
    private ImageView mThumbnailImage;
    private ViewGroup mThumbnailImageLayout;
    private ProgressBar mThumbnailProgress;
    private RelativeLayout mV9bottomParentLayout;
    private boolean mVideoCaptureEnable;
    private boolean mVideoPauseSupported;
    private boolean mVideoRecordingStarted;
    private boolean mVideoReverseEnable;

    protected void initView(View view) {
        this.mBottomActionView = (FrameLayout) view.findViewById(R.id.bottom_action);
        ((MarginLayoutParams) this.mBottomActionView.getLayoutParams()).height = Util.getBottomHeight(getResources());
        this.mBottomRollDownHeight = getResources().getDimensionPixelSize(R.dimen.bottom_roll_down_height);
        this.mV9bottomParentLayout = (RelativeLayout) view.findViewById(R.id.v9_bottom_parent);
        ((MarginLayoutParams) this.mV9bottomParentLayout.getLayoutParams()).bottomMargin = getResources().getDimensionPixelSize(R.dimen.bottom_margin_bottom) + Util.sNavigationBarHeight;
        this.mComponentModuleList = DataRepository.dataItemGlobal().getComponentModuleList();
        if (this.mModeSelectLayout == null) {
            this.mModeSelectLayout = new BottomActionMenu(getContext(), (FrameLayout) view.findViewById(R.id.mode_select_layout));
        }
        this.mEdgeHorizonScrollView = this.mModeSelectLayout.getCameraOperateMenuView();
        this.mBottomMenuLayout = view.findViewById(R.id.bottom_menu_layout);
        this.mModeSelectView = this.mModeSelectLayout.getCameraOperateSelectView();
        this.mModeSelectView.init(this.mComponentModuleList, this.mCurrentMode);
        this.mModeSelectView.setOnModeClickedListener(this);
        this.mThumbnailImageLayout = (ViewGroup) view.findViewById(R.id.v9_thumbnail_layout);
        this.mThumbnailImage = (ImageView) this.mThumbnailImageLayout.findViewById(R.id.v9_thumbnail_image);
        this.mThumbnailProgress = (ProgressBar) view.findViewById(R.id.v9_recording_progress);
        this.mRecordingPause = (ImageView) view.findViewById(R.id.v9_recording_pause);
        this.mShutterButton = (CameraSnapView) view.findViewById(R.id.v9_shutter_button_internal);
        this.mCameraPicker = (ImageView) view.findViewById(R.id.v9_camera_picker);
        this.mRecordingSnap = (ImageView) view.findViewById(R.id.v9_recording_snap);
        this.mRecordingReverse = (ImageView) view.findViewById(R.id.v9_recording_reverse);
        this.mFragmentLayoutExtra = view.findViewById(R.id.fragment_bottom_extra);
        this.mFragmentLayoutExtra2 = view.findViewById(R.id.fragment_bottom_extra2);
        this.mPostProcess = (ProgressBar) view.findViewById(R.id.v9_post_processing);
        this.mBottomRecordingTime = (TextView) view.findViewById(R.id.bottom_recording_time_view);
        this.mBottomRecordingCameraPicker = (ImageView) view.findViewById(R.id.bottom_recording_camera_picker);
        this.mBottomRecordingCameraPicker.setOnClickListener(this);
        this.mShutterButton.setSnapListener(this);
        this.mShutterButton.setEnabled(false);
        this.mCaptureProgressDelay = getResources().getInteger(R.integer.capture_progress_delay_time);
        this.mRecordProgressDelay = getResources().getInteger(R.integer.record_progress_delay_time);
        this.mThumbnailImageLayout.setOnClickListener(this);
        this.mCameraPicker.setOnClickListener(this);
        this.mRecordingPause.setOnClickListener(this);
        this.mRecordingSnap.setOnClickListener(this);
        this.mRecordingReverse.setOnClickListener(this);
        adjustViewBackground(this.mModeSelectLayout.getView(), this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, false);
        this.mIsIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
        this.mSineEaseOut = new SineEaseOutInterpolator();
        this.mFilterListHeight = getContext().getResources().getDimensionPixelSize(R.dimen.filter_still_height);
        if (Util.isAccessible()) {
            Util.setAccessibilityFocusable(this.mV9bottomParentLayout, false);
        }
    }

    public void onResume() {
        super.onResume();
        initThumbLayoutByIntent();
    }

    private void initThumbLayoutByIntent() {
        if (this.mIsIntentAction) {
            this.mThumbnailImage.setBackground(null);
            ((MarginLayoutParams) this.mThumbnailImage.getLayoutParams()).setMargins(0, 0, 0, 0);
            this.mThumbnailImage.setImageResource(R.drawable.v6_ic_image_capture_cancel_normal);
        } else {
            ActivityBase activityBase = (ActivityBase) getContext();
            if ((activityBase.startFromSecureKeyguard() || activityBase.isGalleryLocked()) && !activityBase.isJumpBack()) {
                activityBase.getThumbnailUpdater().setThumbnail(null, true, false);
            } else if (PermissionManager.checkStoragePermissions()) {
                activityBase.getThumbnailUpdater().getLastThumbnail();
            }
        }
    }

    public boolean onHandleSwitcher(int i) {
        if (!this.mIsShowFilter && !this.mIsShowLighting) {
            return false;
        }
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || cameraAction.isDoingAction()) {
            return true;
        }
        if (this.mIsShowFilter) {
            this.mFragmentFilter.switchFilter(i);
        } else if (this.mIsShowLighting) {
            this.mFragmentLighting.switchLighting(i);
        }
        return true;
    }

    public void filterUiChange() {
        this.mFragmentFilter.updateFilterData();
    }

    public boolean isShowFilterView() {
        return this.mIsShowFilter;
    }

    public boolean isShowLightingView() {
        return this.mIsShowLighting;
    }

    public void setLightingViewStatus(boolean z) {
        this.mIsShowLighting = z;
    }

    public void setRecordingTimeState(int i) {
        if (i != 5) {
            switch (i) {
                case 1:
                    if (this.mCurrentMode == 174) {
                        this.mBottomRecordingTime.setText("00:15");
                    }
                    Completable.create(new AlphaInOnSubscribe(this.mBottomRecordingTime)).subscribe();
                    return;
                case 2:
                    break;
                default:
                    return;
            }
        }
        if (this.mBottomRecordingTime.getVisibility() == 0) {
            Completable.create(new AlphaOutOnSubscribe(this.mBottomRecordingTime)).subscribe();
        }
        if (this.mBottomRecordingCameraPicker.getVisibility() == 0) {
            Completable.create(new AlphaOutOnSubscribe(this.mBottomRecordingCameraPicker)).subscribe();
        }
    }

    public void updateRecordingTime(String str) {
        this.mBottomRecordingTime.setText(str);
    }

    public boolean showOrHideFilterView() {
        if (this.mIsShowFilter) {
            startBottomAnimation(false);
            startExtraLayoutAnimation(this.mFragmentLayoutExtra, false);
            if (Util.isAccessible()) {
                this.mFragmentLayoutExtra.setContentDescription(getString(R.string.accessibility_filter_pad_close));
                this.mFragmentLayoutExtra.sendAccessibilityEvent(128);
            }
        } else {
            if (this.mIsShowLighting) {
                this.mIsShowLighting = false;
                startExtraLayoutExchangeAnimation(this.mFragmentLayoutExtra2);
            }
            if (this.mFragmentFilter.isAdded()) {
                this.mFragmentFilter.reInit();
            }
            startBottomAnimation(true);
            startExtraLayoutAnimation(this.mFragmentLayoutExtra, true);
        }
        this.mIsShowFilter ^= true;
        return this.mIsShowFilter;
    }

    public boolean showOrHideLightingView() {
        if (this.mIsShowLighting) {
            startBottomAnimation(false);
            startExtraLayoutAnimation(this.mFragmentLayoutExtra2, false);
        } else {
            if (this.mIsShowFilter) {
                this.mIsShowFilter = false;
                startExtraLayoutExchangeAnimation(this.mFragmentLayoutExtra);
            }
            if (this.mFragmentLighting.isAdded()) {
                this.mFragmentLighting.reInit();
            }
            startBottomAnimation(true);
            startExtraLayoutAnimation(this.mFragmentLayoutExtra2, true);
        }
        this.mIsShowLighting ^= true;
        return this.mIsShowLighting;
    }

    private void startBottomAnimation(boolean z) {
        if (this.mIsBottomRollDown != z) {
            this.mIsBottomRollDown = z;
            if (z) {
                ViewCompat.setAlpha(this.mBottomMenuLayout, 1.0f);
                ViewCompat.animate(this.mBottomMenuLayout).setDuration(150).alpha(0.0f).setInterpolator(this.mCubicEaseOut).start();
                ViewCompat.setTranslationY(this.mBottomMenuLayout, 0.0f);
                ViewCompat.animate(this.mBottomMenuLayout).setDuration(300).translationY((float) this.mFilterListHeight).setInterpolator(this.mCubicEaseOut).start();
                ViewCompat.setTranslationY(this.mV9bottomParentLayout, 0.0f);
                ViewCompat.animate(this.mV9bottomParentLayout).setDuration(300).translationY((float) this.mBottomRollDownHeight).setInterpolator(this.mCubicEaseOut).start();
                ViewCompat.setScaleX(this.mShutterButton, 1.0f);
                ViewCompat.setScaleY(this.mShutterButton, 1.0f);
                ViewCompat.animate(this.mShutterButton).setDuration(300).scaleX(0.9f).scaleY(0.9f).setInterpolator(this.mCubicEaseOut).start();
            } else {
                ViewCompat.setAlpha(this.mBottomMenuLayout, 0.0f);
                ViewCompat.animate(this.mBottomMenuLayout).setStartDelay(50).setDuration(250).alpha(1.0f).setInterpolator(this.mSineEaseOut).start();
                ViewCompat.setTranslationY(this.mBottomMenuLayout, (float) this.mFilterListHeight);
                ViewCompat.animate(this.mBottomMenuLayout).setDuration(300).translationY(0.0f).setInterpolator(this.mCubicEaseOut).start();
                ViewCompat.setTranslationY(this.mV9bottomParentLayout, (float) this.mBottomRollDownHeight);
                ViewCompat.animate(this.mV9bottomParentLayout).setDuration(300).translationY(0.0f).setInterpolator(this.mCubicEaseOut).start();
                ViewCompat.setScaleX(this.mShutterButton, 0.9f);
                ViewCompat.setScaleY(this.mShutterButton, 0.9f);
                ViewCompat.animate(this.mShutterButton).setDuration(300).scaleX(1.0f).scaleY(1.0f).setInterpolator(this.mCubicEaseOut).start();
            }
        }
    }

    private void startExtraLayoutAnimation(final View view, boolean z) {
        if (z) {
            ViewCompat.setTranslationY(view, (float) (-this.mFilterListHeight));
            ViewCompat.setAlpha(view, 0.0f);
            ViewCompat.animate(view).setDuration(300).translationY(0.0f).alpha(1.0f).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                    view.setVisibility(0);
                }

                public void onAnimationEnd(View view) {
                    FragmentBottomAction.this.mModeSelectView.setVisibility(8);
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
            return;
        }
        ViewCompat.setAlpha(view, 1.0f);
        ViewCompat.animate(view).setDuration(150).alpha(0.0f).setInterpolator(this.mSineEaseOut).start();
        ViewCompat.setTranslationY(view, 0.0f);
        ViewCompat.animate(view).setDuration(300).translationY((float) (-this.mFilterListHeight)).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
            public void onAnimationStart(View view) {
                FragmentBottomAction.this.mModeSelectView.setVisibility(0);
            }

            public void onAnimationEnd(View view) {
                view.setVisibility(8);
            }

            public void onAnimationCancel(View view) {
            }
        }).start();
    }

    private void startExtraLayoutExchangeAnimation(final View view) {
        ViewCompat.setAlpha(view, 1.0f);
        ViewCompat.setTranslationY(view, 0.0f);
        ViewCompat.animate(view).alpha(0.0f).translationY((float) this.mFilterListHeight).setDuration(250).setInterpolator(this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
            public void onAnimationStart(View view) {
            }

            public void onAnimationEnd(View view) {
                view.setVisibility(8);
            }

            public void onAnimationCancel(View view) {
            }
        }).start();
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        this.mShutterButton.setEnabled(z);
    }

    private void adjustViewBackground(View view, int i) {
        if (i == 165) {
            view.setBackgroundResource(R.color.black);
            return;
        }
        i = DataRepository.dataItemRunning().getUiStyle();
        if (i == 1 || i == 3) {
            view.setBackgroundResource(R.color.fullscreen_background);
        } else {
            view.setBackgroundResource(R.color.black);
        }
    }

    public void updateThumbnail(Thumbnail thumbnail, boolean z) {
        if (isAdded()) {
            ThumbnailUpdater thumbnailUpdater = ((ActivityBase) getContext()).getThumbnailUpdater();
            if (!(thumbnailUpdater == null || thumbnailUpdater.getThumbnail() == thumbnail)) {
                thumbnailUpdater.setThumbnail(thumbnail, false, false);
                Log.d(TAG, "inconsistent thumbnail");
            }
            this.mHandler.removeCallbacksAndMessages(null);
            this.mInLoading = false;
            if (this.mThumbnailProgress.getVisibility() != 8) {
                this.mThumbnailProgress.setVisibility(8);
            }
            if (!this.mIsIntentAction && !this.mVideoRecordingStarted) {
                if (thumbnail == null) {
                    this.mThumbnailImage.setImageResource(R.drawable.ic_thumbnail_background);
                    return;
                }
                Drawable create = RoundedBitmapDrawableFactory.create(getResources(), thumbnail.getBitmap());
                create.getPaint().setAntiAlias(true);
                create.setCircular(true);
                this.mThumbnailImage.setImageDrawable(create);
                if (z) {
                    ViewCompat.setAlpha(this.mThumbnailImageLayout, 0.3f);
                    ViewCompat.setScaleX(this.mThumbnailImageLayout, 0.5f);
                    ViewCompat.setScaleY(this.mThumbnailImageLayout, 0.5f);
                    ViewCompat.animate(this.mThumbnailImageLayout).alpha(1.0f).scaleX(1.0f).scaleY(1.0f).setDuration(80).start();
                }
            }
        }
    }

    private boolean isThumbLoading() {
        return this.mInLoading;
    }

    public void updateLoading(boolean z) {
        if (z) {
            this.mInLoading = false;
            this.mHandler.removeCallbacksAndMessages(null);
            this.mThumbnailProgress.setVisibility(8);
        } else if (!this.mIsIntentAction) {
            this.mInLoading = true;
            int i = this.mCurrentMode;
            if (!(i == 166 || i == 172 || i == 174)) {
                switch (i) {
                    case 161:
                    case 162:
                        break;
                    default:
                        this.mHandler.sendEmptyMessageDelayed(1, (long) this.mCaptureProgressDelay);
                        break;
                }
            }
            this.mHandler.sendEmptyMessageDelayed(1, (long) this.mRecordProgressDelay);
        }
    }

    public void processingStart() {
        this.mEdgeHorizonScrollView.setEnabled(false);
        this.mModeSelectView.setEnabled(false);
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 166:
            case 168:
            case 169:
            case 170:
            case 172:
            case 173:
            case 174:
                BottomAnimationConfig configVariables = BottomAnimationConfig.generate(false, this.mCurrentMode, true, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables();
                if (!this.mVideoRecordingStarted) {
                    prepareRecording(configVariables);
                    this.mVideoRecordingStarted = true;
                }
                this.mShutterButton.triggerAnimation(configVariables);
                return;
            default:
                return;
        }
    }

    public void processingPause() {
        int i = this.mCurrentMode;
        if (i != 172) {
            if (i != 174) {
                switch (i) {
                    case 161:
                    case 162:
                        break;
                    default:
                        switch (i) {
                            case 168:
                            case 169:
                            case 170:
                                break;
                            default:
                                return;
                        }
                }
            }
            this.mShutterButton.pauseRecording();
            this.mRecordingPause.setImageResource(R.drawable.ic_recording_resume);
            setRecordingTimeState(3);
            ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
            return;
        }
        this.mShutterButton.pauseRecording();
        this.mRecordingPause.setImageResource(R.drawable.ic_recording_resume);
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).setRecordingTimeState(3);
        this.mRecordingPause.setContentDescription(getString(R.string.accessibility_video_resume_button));
    }

    public void processingResume() {
        int i = this.mCurrentMode;
        if (i != 172) {
            if (i != 174) {
                switch (i) {
                    case 161:
                    case 162:
                        break;
                    default:
                        switch (i) {
                            case 168:
                            case 169:
                            case 170:
                                break;
                            default:
                                return;
                        }
                }
            }
            this.mShutterButton.resumeRecording();
            this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
            setRecordingTimeState(4);
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            bottomPopupTips.hideTipImage();
            bottomPopupTips.hideLeftTipImage();
            bottomPopupTips.hideCenterTipImage();
            return;
        }
        this.mShutterButton.resumeRecording();
        this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).setRecordingTimeState(4);
        this.mRecordingPause.setContentDescription(getString(R.string.accessibility_video_pause_button));
    }

    public void processingFinish() {
        this.mEdgeHorizonScrollView.setEnabled(true);
        this.mModeSelectView.setEnabled(true);
        this.mVideoRecordingStarted = false;
        setProgressBarGone();
        resetBottom(false);
    }

    public void processingFailed() {
        this.mEdgeHorizonScrollView.setEnabled(true);
        this.mModeSelectView.setEnabled(true);
        this.mVideoRecordingStarted = false;
        updateLoading(true);
        resetBottom(false);
    }

    public void processingWorkspace(boolean z) {
        if (z) {
            this.mShutterButton.showRoundPaintItem();
            this.mShutterButton.invalidate();
            this.mBottomRecordingTime.setVisibility(0);
            if (this.mRecordingPause.getVisibility() == 8) {
                this.mRecordingPause.setImageResource(R.drawable.ic_recording_resume);
                Completable.create(new AlphaInOnSubscribe(this.mRecordingPause).targetGone()).subscribe();
            }
            if (this.mRecordingReverse.getVisibility() == 8) {
                Completable.create(new AlphaInOnSubscribe(this.mRecordingReverse).targetGone()).subscribe();
            }
            if (this.mBottomRecordingCameraPicker.getVisibility() == 8) {
                Completable.create(new AlphaInOnSubscribe(this.mBottomRecordingCameraPicker).targetGone()).subscribe();
            }
            ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
            return;
        }
        this.mShutterButton.pauseRecording();
        this.mShutterButton.hideRoundPaintItem();
        this.mShutterButton.invalidate();
        this.mBottomRecordingTime.setVisibility(8);
        if (this.mRecordingPause.getVisibility() == 0) {
            Completable.create(new AlphaOutOnSubscribe(this.mRecordingPause).targetGone()).subscribe();
        }
        if (this.mRecordingReverse.getVisibility() == 0) {
            Completable.create(new AlphaOutOnSubscribe(this.mRecordingReverse).targetGone()).subscribe();
        }
        if (this.mBottomRecordingCameraPicker.getVisibility() == 0) {
            Completable.create(new AlphaOutOnSubscribe(this.mBottomRecordingCameraPicker).targetGone()).subscribe();
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideCenterTipImage();
    }

    public void processingPostAction() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentBottomAction.this.resetBottom(true);
                FragmentBottomAction.this.setProgressBarVisible();
            }
        });
    }

    public void setProgressBarVisible() {
        this.mPostProcess.setAlpha(0.0f);
        this.mPostProcess.setVisibility(0);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        ofFloat.setDuration(300);
        ofFloat.setStartDelay(160);
        ofFloat.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Float f = (Float) valueAnimator.getAnimatedValue();
                FragmentBottomAction.this.mPostProcess.setAlpha(f.floatValue());
                FragmentBottomAction.this.mPostProcess.setScaleX((f.floatValue() * 0.1f) + 0.9f);
                FragmentBottomAction.this.mPostProcess.setScaleY(0.9f + (0.1f * f.floatValue()));
            }
        });
        ofFloat.start();
    }

    public void setProgressBarGone() {
        if (this.mPostProcess.getVisibility() != 8) {
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{1.0f, 0.0f});
            ofFloat.setDuration(300);
            ofFloat.setInterpolator(new CubicEaseInInterpolator());
            ofFloat.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    FragmentBottomAction.this.mPostProcess.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
                }
            });
            ofFloat.addListener(new AnimatorListener() {
                public void onAnimationStart(Animator animator) {
                }

                public void onAnimationEnd(Animator animator) {
                    FragmentBottomAction.this.mPostProcess.setVisibility(8);
                }

                public void onAnimationCancel(Animator animator) {
                }

                public void onAnimationRepeat(Animator animator) {
                }
            });
            ofFloat.start();
        }
    }

    public void processingAudioCapture(boolean z) {
        if (z) {
            this.mShutterButton.startRing();
        } else {
            this.mShutterButton.stopRing();
        }
    }

    private void resetBottom(boolean z) {
        if (isAdded()) {
            switch (this.mCurrentMode) {
                case 161:
                case 162:
                case 166:
                case 168:
                case 169:
                case 170:
                case 172:
                case 173:
                case 174:
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    topAlert.showConfigMenu();
                    if (this.mCurrentMode == 174) {
                        setRecordingTimeState(2);
                    } else {
                        topAlert.setRecordingTimeState(2);
                    }
                    ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
                    if (this.mShutterButton.getVisibility() != 0) {
                        this.mShutterButton.setVisibility(0);
                    }
                    if (z) {
                        this.mShutterButton.hideRoundPaintItem();
                    } else {
                        this.mShutterButton.showRoundPaintItem();
                    }
                    this.mShutterButton.triggerAnimation(BottomAnimationConfig.generate(z, this.mCurrentMode, false, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables());
                    if (!isFPS960()) {
                        z = true;
                    }
                    updateBottomInRecording(false, z);
                    break;
            }
        }
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(179, this);
        modeCoordinator.attachProtocol(162, this);
        modeCoordinator.attachProtocol(183, this);
        modeCoordinator.attachProtocol(197, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(179, this);
        modeCoordinator.detachProtocol(162, this);
        modeCoordinator.detachProtocol(183, this);
        modeCoordinator.detachProtocol(197, this);
        unRegisterBackStack(modeCoordinator, this);
    }

    /* JADX WARNING: Removed duplicated region for block: B:83:0x017a  */
    public void onClick(android.view.View r6) {
        /*
        r5 = this;
        r0 = r5.isEnableClick();
        if (r0 != 0) goto L_0x0007;
    L_0x0006:
        return;
    L_0x0007:
        r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r1 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        r0 = r0.getAttachProtocol(r1);
        r0 = (com.android.camera.protocol.ModeProtocol.CameraAction) r0;
        if (r0 != 0) goto L_0x0016;
    L_0x0015:
        return;
    L_0x0016:
        r1 = r5.getContext();
        r1 = (com.android.camera.ActivityBase) r1;
        r1 = r1.getCurrentModule();
        r1 = r1.isIgnoreTouchEvent();
        if (r1 == 0) goto L_0x002e;
    L_0x0026:
        r6 = "FragmentBottomAction";
        r0 = "onClick: ignore click event, because module isn't ready";
        com.android.camera.log.Log.w(r6, r0);
        return;
    L_0x002e:
        r1 = r6.getId();
        r2 = 2131558434; // 0x7f0d0022 float:1.8742184E38 double:1.0531297943E-314;
        r3 = 0;
        r4 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r1 == r2) goto L_0x010d;
    L_0x003a:
        r2 = 2131558436; // 0x7f0d0024 float:1.8742188E38 double:1.0531297953E-314;
        if (r1 == r2) goto L_0x00f1;
    L_0x003f:
        r2 = 2131558438; // 0x7f0d0026 float:1.8742192E38 double:1.0531297963E-314;
        if (r1 == r2) goto L_0x0097;
    L_0x0044:
        switch(r1) {
            case 2131558442: goto L_0x0084;
            case 2131558443: goto L_0x0069;
            case 2131558444: goto L_0x0049;
            default: goto L_0x0047;
        };
    L_0x0047:
        goto L_0x01b0;
    L_0x0049:
        r6 = r5.mVideoReverseEnable;
        if (r6 == 0) goto L_0x0068;
    L_0x004d:
        r6 = r5.mVideoRecordingStarted;
        if (r6 != 0) goto L_0x0052;
    L_0x0051:
        goto L_0x0068;
    L_0x0052:
        r6 = r5.getContext();
        r6 = (com.android.camera.ActivityBase) r6;
        r6 = r6.getCurrentModule();
        r6 = (com.android.camera.module.LiveModule) r6;
        r6.doReverse();
        r6 = r5.mShutterButton;
        r6.removeLastSegment();
        goto L_0x01b0;
    L_0x0068:
        return;
    L_0x0069:
        r6 = r5.mVideoCaptureEnable;
        if (r6 == 0) goto L_0x0083;
    L_0x006d:
        r6 = r5.mVideoRecordingStarted;
        if (r6 != 0) goto L_0x0072;
    L_0x0071:
        goto L_0x0083;
    L_0x0072:
        r6 = r5.getContext();
        r6 = (com.android.camera.ActivityBase) r6;
        r6 = r6.getCurrentModule();
        r6 = (com.android.camera.module.VideoModule) r6;
        r6.takeVideoSnapShoot();
        goto L_0x01b0;
    L_0x0083:
        return;
    L_0x0084:
        r0 = r0.isDoingAction();
        if (r0 == 0) goto L_0x008b;
    L_0x008a:
        return;
    L_0x008b:
        r0 = r5.isThumbLoading();
        if (r0 == 0) goto L_0x0092;
    L_0x0091:
        return;
    L_0x0092:
        r5.hideExtra();
        goto L_0x010d;
    L_0x0097:
        r6 = r5.mVideoPauseSupported;
        if (r6 == 0) goto L_0x00f0;
    L_0x009b:
        r6 = r5.mVideoRecordingStarted;
        if (r6 != 0) goto L_0x00a0;
    L_0x009f:
        goto L_0x00f0;
    L_0x00a0:
        r6 = r5.mCurrentMode;
        if (r6 == r4) goto L_0x00de;
    L_0x00a4:
        r0 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        if (r6 == r0) goto L_0x00ac;
    L_0x00a8:
        switch(r6) {
            case 168: goto L_0x00de;
            case 169: goto L_0x00de;
            case 170: goto L_0x00de;
            default: goto L_0x00ab;
        };
    L_0x00ab:
        return;
    L_0x00ac:
        r6 = r5.getContext();
        r6 = (com.android.camera.ActivityBase) r6;
        r6 = r6.getCurrentModule();
        r6 = (com.android.camera.module.LiveModule) r6;
        r6.onPauseButtonClick();
        r6 = r5.mRecordingReverse;
        r6 = r6.getVisibility();
        r0 = 8;
        if (r6 != r0) goto L_0x00ca;
    L_0x00c5:
        r1 = r5.mShutterButton;
        r1.addSegmentNow();
    L_0x00ca:
        r1 = r5.mRecordingReverse;
        if (r6 != 0) goto L_0x00d0;
    L_0x00ce:
        r2 = r0;
        goto L_0x00d1;
    L_0x00d0:
        r2 = r3;
    L_0x00d1:
        r1.setVisibility(r2);
        r1 = r5.mBottomRecordingCameraPicker;
        if (r6 != 0) goto L_0x00d9;
    L_0x00d8:
        goto L_0x00da;
    L_0x00d9:
        r0 = r3;
    L_0x00da:
        r1.setVisibility(r0);
        goto L_0x00ee;
    L_0x00de:
        r6 = r5.getContext();
        r6 = (com.android.camera.ActivityBase) r6;
        r6 = r6.getCurrentModule();
        r6 = (com.android.camera.module.VideoModule) r6;
        r6.onPauseButtonClick();
    L_0x00ee:
        goto L_0x01b0;
    L_0x00f0:
        return;
    L_0x00f1:
        r6 = r5.isThumbLoading();
        if (r6 == 0) goto L_0x00f8;
    L_0x00f7:
        return;
    L_0x00f8:
        r6 = com.android.camera.data.DataRepository.dataItemGlobal();
        r6 = r6.isIntentAction();
        if (r6 != 0) goto L_0x0108;
    L_0x0102:
        r6 = 0;
        r0.onThumbnailClicked(r6);
        goto L_0x01b0;
    L_0x0108:
        r0.onReviewCancelClicked();
        goto L_0x01b0;
    L_0x010d:
        r6 = r5.changeCamera(r6);
        r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r1 = 172; // 0xac float:2.41E-43 double:8.5E-322;
        r0 = r0.getAttachProtocol(r1);
        r0 = (com.android.camera.protocol.ModeProtocol.TopAlert) r0;
        r1 = 4;
        r0.removeExtraMenu(r1);
        r0 = r5.mCurrentMode;
        r1 = 2;
        r2 = 1;
        if (r0 == r4) goto L_0x0151;
    L_0x0127:
        switch(r0) {
            case 168: goto L_0x0134;
            case 169: goto L_0x0134;
            case 170: goto L_0x0134;
            default: goto L_0x012a;
        };
    L_0x012a:
        r6 = r5.mCurrentMode;
        r0 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
        r5.mCurrentMode = r0;
        r5.changeMode(r6, r3);
        goto L_0x0196;
    L_0x0134:
        r6 = com.android.camera.data.DataRepository.dataItemGlobal();
        r6.setCurrentMode(r4);
        r6 = r5.getContext();
        r6 = (com.android.camera.Camera) r6;
        r0 = com.android.camera.module.loader.StartControl.create(r4);
        r0 = r0.setNeedBlurAnimation(r2);
        r0 = r0.setViewConfigType(r1);
        r6.onModeSelected(r0);
        goto L_0x0196;
        if (r6 != 0) goto L_0x0177;
    L_0x0154:
        r6 = com.android.camera.data.DataRepository.getInstance();
        r6 = r6.backUp();
        r0 = r6.isLastVideoFastMotion();
        if (r0 == 0) goto L_0x0165;
    L_0x0162:
        r6 = 169; // 0xa9 float:2.37E-43 double:8.35E-322;
        goto L_0x0178;
    L_0x0165:
        r0 = r6.isLastVideoSlowMotion();
        if (r0 == 0) goto L_0x016e;
    L_0x016b:
        r6 = 168; // 0xa8 float:2.35E-43 double:8.3E-322;
        goto L_0x0178;
    L_0x016e:
        r6 = r6.isLastVideoHFRMode();
        if (r6 == 0) goto L_0x0177;
    L_0x0174:
        r6 = 170; // 0xaa float:2.38E-43 double:8.4E-322;
        goto L_0x0178;
    L_0x0177:
        r6 = r4;
    L_0x0178:
        if (r6 == r4) goto L_0x0181;
    L_0x017a:
        r0 = com.android.camera.data.DataRepository.dataItemGlobal();
        r0.setCurrentMode(r6);
    L_0x0181:
        r0 = r5.getContext();
        r0 = (com.android.camera.Camera) r0;
        r6 = com.android.camera.module.loader.StartControl.create(r6);
        r6 = r6.setNeedBlurAnimation(r2);
        r6 = r6.setViewConfigType(r1);
        r0.onModeSelected(r6);
    L_0x0196:
        r6 = com.android.camera.Util.isAccessible();
        if (r6 == 0) goto L_0x01b0;
    L_0x019c:
        r6 = r5.mEdgeHorizonScrollView;
        r0 = 2131427572; // 0x7f0b00f4 float:1.8476764E38 double:1.05306514E-314;
        r0 = r5.getString(r0);
        r6.setContentDescription(r0);
        r6 = r5.mEdgeHorizonScrollView;
        r0 = 32768; // 0x8000 float:4.5918E-41 double:1.61895E-319;
        r6.sendAccessibilityEvent(r0);
    L_0x01b0:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.bottom.FragmentBottomAction.onClick(android.view.View):void");
    }

    private int changeCamera(View view) {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        int currentCameraId = dataItemGlobal.getCurrentCameraId();
        boolean z = false;
        int i = currentCameraId == 0 ? 1 : 0;
        dataItemGlobal.setCameraId(i);
        if (i == 1) {
            ViewCompat.animate(view).rotationBy(-180.0f).setDuration(300).start();
        } else {
            ViewCompat.animate(view).rotationBy(180.0f).setDuration(300).start();
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "switch camera from %d to %d, for module 0x%x", new Object[]{Integer.valueOf(currentCameraId), Integer.valueOf(i), Integer.valueOf(this.mCurrentMode)}));
        boolean z2 = currentCameraId == 1;
        if (i == 1) {
            z = true;
        }
        ScenarioTrackUtil.trackSwitchCameraStart(z2, z, this.mCurrentMode);
        return i;
    }

    private boolean isFPS960() {
        if (this.mCurrentMode == 172 && DataRepository.dataItemFeature().fp()) {
            return DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
        }
        return false;
    }

    private void prepareRecording(BottomAnimationConfig bottomAnimationConfig) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        topAlert.hideConfigMenu();
        int i = this.mCurrentMode;
        if (!(i == 166 || i == 173)) {
            if (this.mCurrentMode == 174) {
                setRecordingTimeState(1);
            } else if (isFPS960()) {
                topAlert.setRecordingTimeState(5);
            } else {
                topAlert.setRecordingTimeState(1);
            }
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.hideTipImage();
        bottomPopupTips.hideLeftTipImage();
        bottomPopupTips.hideCenterTipImage();
        updateBottomInRecording(true, true);
        this.mShutterButton.prepareRecording(bottomAnimationConfig);
    }

    private void updateBottomInRecording(final boolean z, boolean z2) {
        boolean z3 = true;
        if (z) {
            this.mHandler.removeMessages(1);
            if (this.mThumbnailProgress.getVisibility() != 8) {
                this.mThumbnailProgress.setVisibility(8);
            }
        } else if (isFPS960()) {
            ((VideoModule) ((ActivityBase) getContext()).getCurrentModule()).showFPS960Hint();
        }
        int i = this.mCurrentMode;
        if (i != 162) {
            if (i != 172) {
                if (i != 174) {
                    switch (i) {
                        case 168:
                        case 169:
                        case 170:
                            break;
                        default:
                            this.mVideoPauseSupported = false;
                            this.mVideoCaptureEnable = false;
                            this.mVideoReverseEnable = false;
                            break;
                    }
                }
                this.mVideoCaptureEnable = false;
                this.mVideoPauseSupported = true;
                this.mVideoReverseEnable = true;
            }
            this.mVideoReverseEnable = false;
            this.mVideoCaptureEnable = false;
            this.mVideoPauseSupported = false;
        } else {
            if (!DataRepository.dataItemGlobal().isIntentAction()) {
                this.mVideoCaptureEnable = CameraSettings.isVideoCaptureVisible();
            }
            if (!b.fT() || CameraSettings.isVideoBokehOn()) {
                z3 = false;
            }
            this.mVideoPauseSupported = z3;
            this.mVideoReverseEnable = false;
        }
        if (z) {
            if (this.mVideoCaptureEnable) {
                this.mRecordingSnap.setImageResource(R.drawable.bg_recording_snap);
                this.mRecordingSnap.setSoundEffectsEnabled(false);
                this.mRecordingSnap.setVisibility(0);
                ViewCompat.setAlpha(this.mRecordingSnap, 0.0f);
            }
            if (this.mVideoPauseSupported) {
                this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
                this.mRecordingPause.setSoundEffectsEnabled(false);
                this.mRecordingPause.setVisibility(0);
                ViewCompat.setAlpha(this.mRecordingPause, 0.0f);
            }
            if (this.mVideoPauseSupported) {
                this.mRecordingReverse.setImageResource(R.drawable.ic_live_record_delete);
                this.mRecordingReverse.setSoundEffectsEnabled(false);
                this.mRecordingReverse.setVisibility(8);
            }
        }
        if (this.mBottomAnimator != null && this.mBottomAnimator.isRunning()) {
            this.mBottomAnimator.cancel();
        }
        this.mBottomAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mBottomAnimator.setDuration(z2 ? 250 : 0);
        this.mBottomAnimator.setInterpolator(new DecelerateInterpolator() {
            public float getInterpolation(float f) {
                f = super.getInterpolation(f);
                View view = FragmentBottomAction.this.mModeSelectLayout.getView();
                float f2 = z ? 1.0f - f : FragmentBottomAction.this.mModeSelectLayout.getView().getAlpha() == 0.0f ? f : 1.0f;
                ViewCompat.setAlpha(view, f2);
                if (FragmentBottomAction.this.mCameraPickEnable) {
                    view = FragmentBottomAction.this.mCameraPicker;
                    f2 = z ? 1.0f - f : FragmentBottomAction.this.mCameraPicker.getAlpha() == 0.0f ? f : 1.0f;
                    ViewCompat.setAlpha(view, f2);
                }
                view = FragmentBottomAction.this.mThumbnailImageLayout;
                f2 = z ? 1.0f - f : FragmentBottomAction.this.mThumbnailImageLayout.getAlpha() == 0.0f ? f : 1.0f;
                ViewCompat.setAlpha(view, f2);
                if (FragmentBottomAction.this.mVideoPauseSupported) {
                    ViewCompat.setAlpha(FragmentBottomAction.this.mRecordingPause, z ? f : 1.0f - f);
                }
                if (FragmentBottomAction.this.mVideoCaptureEnable) {
                    ViewCompat.setAlpha(FragmentBottomAction.this.mRecordingSnap, z ? f : 1.0f - f);
                }
                if (FragmentBottomAction.this.mVideoReverseEnable) {
                    ViewCompat.setAlpha(FragmentBottomAction.this.mRecordingReverse, z ? f : 1.0f - f);
                }
                return f;
            }
        });
        this.mBottomAnimator.addListener(new AnimatorListener() {
            public void onAnimationStart(Animator animator) {
                if (!z) {
                    if (FragmentBottomAction.this.mCameraPickEnable) {
                        FragmentBottomAction.this.mCameraPicker.setVisibility(0);
                    }
                    FragmentBottomAction.this.mThumbnailImage.setVisibility(0);
                    FragmentBottomAction.this.mThumbnailImageLayout.setVisibility(0);
                }
            }

            public void onAnimationEnd(Animator animator) {
                if (FragmentBottomAction.this.canProvide()) {
                    int i = 0;
                    if (FragmentBottomAction.this.mVideoPauseSupported) {
                        FragmentBottomAction.this.mRecordingPause.setVisibility(z ? 0 : 8);
                    }
                    if (FragmentBottomAction.this.mVideoCaptureEnable) {
                        ImageView access$1100 = FragmentBottomAction.this.mRecordingSnap;
                        if (!z) {
                            i = 8;
                        }
                        access$1100.setVisibility(i);
                    }
                    if (FragmentBottomAction.this.mVideoReverseEnable && !z) {
                        FragmentBottomAction.this.mRecordingReverse.setVisibility(8);
                    }
                    if (z) {
                        FragmentBottomAction.this.mThumbnailImageLayout.setVisibility(8);
                        if (FragmentBottomAction.this.mCameraPickEnable) {
                            FragmentBottomAction.this.mCameraPicker.setVisibility(8);
                        }
                        FragmentBottomAction.this.mThumbnailImage.setVisibility(8);
                    }
                }
            }

            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationRepeat(Animator animator) {
            }
        });
        this.mBottomAnimator.start();
    }

    public void onModeClicked(int i) {
        changeMode(i, 0);
    }

    /* JADX WARNING: Missing block: B:9:0x0018, code:
            if (isThumbLoading() == false) goto L_0x001b;
     */
    /* JADX WARNING: Missing block: B:10:0x001a, code:
            return;
     */
    /* JADX WARNING: Missing block: B:11:0x001b, code:
            r0 = (com.android.camera.protocol.ModeProtocol.CameraAction) com.android.camera.protocol.ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
     */
    /* JADX WARNING: Missing block: B:12:0x0027, code:
            if (r0 == null) goto L_0x0030;
     */
    /* JADX WARNING: Missing block: B:14:0x002d, code:
            if (r0.isDoingAction() == false) goto L_0x0030;
     */
    /* JADX WARNING: Missing block: B:15:0x002f, code:
            return;
     */
    /* JADX WARNING: Missing block: B:16:0x0030, code:
            r2.mCurrentMode = r3;
            ((com.android.camera.data.data.global.DataItemGlobal) com.android.camera.data.DataRepository.provider().dataGlobal()).setCurrentMode(r3);
            ((com.android.camera.Camera) getContext()).onModeSelected(com.android.camera.module.loader.StartControl.create(r3).setStartDelay(r4).setResetType(3).setViewConfigType(2).setNeedBlurAnimation(true));
     */
    /* JADX WARNING: Missing block: B:17:0x005f, code:
            return;
     */
    public void changeMode(int r3, int r4) {
        /*
        r2 = this;
        r0 = r2.mCurrentMode;
        if (r3 != r0) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        r0 = r2.mCurrentMode;
        r1 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r0 == r1) goto L_0x000f;
    L_0x000b:
        switch(r0) {
            case 168: goto L_0x000f;
            case 169: goto L_0x000f;
            case 170: goto L_0x000f;
            default: goto L_0x000e;
        };
    L_0x000e:
        goto L_0x0014;
    L_0x000f:
        if (r3 == r1) goto L_0x0060;
    L_0x0011:
        switch(r3) {
            case 168: goto L_0x0060;
            case 169: goto L_0x0060;
            case 170: goto L_0x0060;
            default: goto L_0x0014;
        };
    L_0x0014:
        r0 = r2.isThumbLoading();
        if (r0 == 0) goto L_0x001b;
    L_0x001a:
        return;
    L_0x001b:
        r0 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r1 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        r0 = r0.getAttachProtocol(r1);
        r0 = (com.android.camera.protocol.ModeProtocol.CameraAction) r0;
        if (r0 == 0) goto L_0x0030;
    L_0x0029:
        r0 = r0.isDoingAction();
        if (r0 == 0) goto L_0x0030;
    L_0x002f:
        return;
    L_0x0030:
        r2.mCurrentMode = r3;
        r0 = com.android.camera.data.DataRepository.provider();
        r0 = r0.dataGlobal();
        r0 = (com.android.camera.data.data.global.DataItemGlobal) r0;
        r0.setCurrentMode(r3);
        r0 = r2.getContext();
        r0 = (com.android.camera.Camera) r0;
        r3 = com.android.camera.module.loader.StartControl.create(r3);
        r3 = r3.setStartDelay(r4);
        r4 = 3;
        r3 = r3.setResetType(r4);
        r4 = 2;
        r3 = r3.setViewConfigType(r4);
        r4 = 1;
        r3 = r3.setNeedBlurAnimation(r4);
        r0.onModeSelected(r3);
        return;
    L_0x0060:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.bottom.FragmentBottomAction.changeMode(int, int):void");
    }

    public boolean canSwipeChangeMode() {
        return this.mVideoRecordingStarted ^ 1;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x004b  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x005c A:{SKIP} */
    /* JADX WARNING: Missing block: B:7:0x001b, code:
            if (r8 == 5) goto L_0x0021;
     */
    /* JADX WARNING: Missing block: B:10:0x0023, code:
            if (r8 == 5) goto L_0x0019;
     */
    public void selectMode(int r8, int r9) {
        /*
        r7 = this;
        r0 = -1;
        if (r8 != r0) goto L_0x0004;
    L_0x0003:
        return;
    L_0x0004:
        r0 = r7.getContext();
        r0 = com.android.camera.Util.isLayoutRTL(r0);
        r1 = 5;
        r2 = 3;
        r3 = 8388611; // 0x800003 float:1.1754948E-38 double:4.1445245E-317;
        r4 = 8388613; // 0x800005 float:1.175495E-38 double:4.1445255E-317;
        if (r0 == 0) goto L_0x001e;
    L_0x0016:
        if (r8 != r2) goto L_0x001b;
    L_0x0019:
        r8 = r4;
        goto L_0x0026;
    L_0x001b:
        if (r8 != r1) goto L_0x0026;
    L_0x001d:
        goto L_0x0021;
    L_0x001e:
        if (r8 != r2) goto L_0x0023;
    L_0x0021:
        r8 = r3;
        goto L_0x0026;
    L_0x0023:
        if (r8 != r1) goto L_0x0026;
    L_0x0025:
        goto L_0x0019;
    L_0x0026:
        r0 = r7.mCurrentMode;
        r1 = r7.mCurrentMode;
        r2 = 169; // 0xa9 float:2.37E-43 double:8.35E-322;
        if (r1 == r2) goto L_0x003a;
    L_0x002e:
        r1 = r7.mCurrentMode;
        r2 = 168; // 0xa8 float:2.35E-43 double:8.3E-322;
        if (r1 == r2) goto L_0x003a;
    L_0x0034:
        r1 = r7.mCurrentMode;
        r2 = 170; // 0xaa float:2.38E-43 double:8.4E-322;
        if (r1 != r2) goto L_0x003c;
    L_0x003a:
        r0 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        r1 = r7.mComponentModuleList;
        r1 = r1.getItems();
        r1 = r1.size();
        r2 = 0;
        r5 = r2;
    L_0x0049:
        if (r5 >= r1) goto L_0x005a;
    L_0x004b:
        r6 = r7.mComponentModuleList;
        r6 = r6.getMode(r5);
        if (r6 != r0) goto L_0x0057;
        r2 = r5;
        goto L_0x005a;
    L_0x0057:
        r5 = r5 + 1;
        goto L_0x0049;
    L_0x005a:
        if (r8 == r3) goto L_0x0066;
    L_0x005c:
        if (r8 == r4) goto L_0x005f;
    L_0x005e:
        goto L_0x006a;
    L_0x005f:
        r1 = r1 + -1;
        if (r2 >= r1) goto L_0x006a;
    L_0x0063:
        r2 = r2 + 1;
        goto L_0x006a;
    L_0x0066:
        if (r2 <= 0) goto L_0x006a;
    L_0x0068:
        r2 = r2 + -1;
    L_0x006a:
        r8 = r7.mComponentModuleList;
        r8 = r8.getMode(r2);
        r7.changeMode(r8, r9);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.bottom.FragmentBottomAction.selectMode(int, int):void");
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_action;
    }

    public int getFragmentInto() {
        return 241;
    }

    public void provideAnimateElement(int r5, java.util.List<io.reactivex.Completable> r6, boolean r7) {
        /*
        r4 = this;
        if (r7 != 0) goto L_0x0006;
    L_0x0002:
        r0 = r4.mCurrentMode;
        if (r0 == r5) goto L_0x0015;
    L_0x0006:
        r0 = r4.mIsShowFilter;
        if (r0 == 0) goto L_0x000e;
    L_0x000a:
        r4.showOrHideFilterView();
        goto L_0x0015;
    L_0x000e:
        r0 = r4.mIsShowLighting;
        if (r0 == 0) goto L_0x0015;
    L_0x0012:
        r4.showOrHideLightingView();
    L_0x0015:
        super.provideAnimateElement(r5, r6, r7);
        r0 = r4.mCurrentMode;
        r1 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        if (r0 != r1) goto L_0x0028;
    L_0x001e:
        r0 = r4.mVideoRecordingStarted;
        if (r0 == 0) goto L_0x0028;
    L_0x0022:
        if (r7 != 0) goto L_0x0025;
    L_0x0024:
        return;
    L_0x0025:
        r4.processingFinish();
    L_0x0028:
        r7 = r4.mFragmentFilter;
        if (r7 == 0) goto L_0x0031;
    L_0x002c:
        r7 = r4.mFragmentFilter;
        r7.isShowAnimation(r6);
    L_0x0031:
        r7 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        if (r5 == r7) goto L_0x0036;
    L_0x0035:
        goto L_0x0042;
    L_0x0036:
        r7 = r4.mModeSelectLayout;
        r7 = r7.getView();
        r0 = 2131361854; // 0x7f0a003e float:1.8343472E38 double:1.053032671E-314;
        r7.setBackgroundResource(r0);
    L_0x0042:
        r7 = r4.mShutterButton;
        r0 = 0;
        r1 = 1;
        if (r6 == 0) goto L_0x004a;
    L_0x0048:
        r2 = r1;
        goto L_0x004b;
    L_0x004a:
        r2 = r0;
    L_0x004b:
        r3 = r4.isFPS960();
        r7.setParameters(r5, r2, r3);
        r7 = r4.mModeSelectView;
        r7.judgePosition(r5, r6);
        r7 = -1;
        switch(r5) {
            case 166: goto L_0x006f;
            case 167: goto L_0x006f;
            case 168: goto L_0x005b;
            case 169: goto L_0x005b;
            case 170: goto L_0x005b;
            case 171: goto L_0x0061;
            case 172: goto L_0x006f;
            case 173: goto L_0x006f;
            default: goto L_0x005b;
        };
        r4.mCameraPickEnable = r1;
    L_0x005f:
        r7 = r1;
        goto L_0x0072;
    L_0x0061:
        r5 = com.mi.config.b.hb();
        if (r5 == 0) goto L_0x006b;
        r4.mCameraPickEnable = r1;
        goto L_0x005f;
        r4.mCameraPickEnable = r0;
        goto L_0x0072;
        r4.mCameraPickEnable = r0;
    L_0x0072:
        r5 = r4.mCameraPicker;
        r5 = r5.getTag();
        if (r5 == 0) goto L_0x0089;
    L_0x007a:
        r5 = r4.mCameraPicker;
        r5 = r5.getTag();
        r5 = (java.lang.Integer) r5;
        r5 = r5.intValue();
        if (r5 != r7) goto L_0x0089;
    L_0x0088:
        return;
    L_0x0089:
        r5 = r4.mCameraPicker;
        r0 = java.lang.Integer.valueOf(r7);
        r5.setTag(r0);
        r5 = r4.mCameraPicker;
        r4.animateViews(r7, r6, r5);
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.bottom.FragmentBottomAction.provideAnimateElement(int, java.util.List, boolean):void");
    }

    private void animateViews(int i, List<Completable> list, View view) {
        if (i == 1) {
            if (list == null) {
                AlphaInOnSubscribe.directSetResult(view);
            } else {
                list.add(Completable.create(new AlphaInOnSubscribe(view)));
            }
        } else if (list == null) {
            AlphaOutOnSubscribe.directSetResult(view);
        } else {
            list.add(Completable.create(new AlphaOutOnSubscribe(view)));
        }
    }

    protected Animation provideEnterAnimation(int i) {
        if (i == 240) {
            return null;
        }
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(161);
        wrapperAnimation.setStartOffset(150);
        return wrapperAnimation;
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(162);
    }

    public void onAngleChanged(float f) {
    }

    public void onBeautyRecordingStart() {
        ViewCompat.animate(this.mModeSelectView).alpha(0.0f).start();
    }

    public void onBeautyRecordingStop() {
        ViewCompat.animate(this.mModeSelectView).alpha(1.0f).start();
    }

    public void showOrHideBottomViewWithAnim(boolean z) {
        float f = 0.0f;
        ViewCompat.animate(this.mModeSelectLayout.getView()).setInterpolator(new CubicEaseInInterpolator()).setDuration(300).alpha(z ? 1.0f : 0.0f).setListener(null).start();
        ViewCompat.animate(this.mThumbnailImage).setInterpolator(new CubicEaseInInterpolator()).setDuration(300).alpha(z ? 1.0f : 0.0f).setListener(null).start();
        ViewPropertyAnimatorCompat duration = ViewCompat.animate(this.mCameraPicker).setInterpolator(new CubicEaseInInterpolator()).setDuration(300);
        if (z) {
            f = 1.0f;
        }
        duration.alpha(f).setListener(null).start();
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        list.add(this.mThumbnailImageLayout);
        list.add(this.mShutterButton);
        list.add(this.mCameraPicker);
        list.add(this.mPostProcess);
        list.add(this.mRecordingPause);
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        boolean isIntentAction = DataRepository.dataItemGlobal().isIntentAction();
        if (isIntentAction != this.mIsIntentAction) {
            this.mIsIntentAction = isIntentAction;
            this.mModeSelectView.init(this.mComponentModuleList, this.mCurrentMode);
            initThumbLayoutByIntent();
        }
        this.mInLoading = false;
        adjustViewBackground(this.mModeSelectLayout.getView(), this.mCurrentMode);
        if (this.mFragmentLighting != null && this.mFragmentLighting.isAdded()) {
            this.mFragmentLighting.reInit();
        }
        if (!Util.isAccessible()) {
            return;
        }
        if (162 == this.mCurrentMode) {
            this.mShutterButton.setContentDescription(getString(R.string.accessibility_record_button));
        } else {
            this.mShutterButton.setContentDescription(getString(R.string.accessibility_shutter_button));
        }
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mFragmentFilter == null) {
            this.mFragmentFilter = new FragmentFilter();
            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.fragment_bottom_extra, this.mFragmentFilter, this.mFragmentFilter.getFragmentTag());
            this.mFragmentLighting = new FragmentLighting();
            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.fragment_bottom_extra2, this.mFragmentLighting, this.mFragmentLighting.getFragmentTag());
        } else {
            if (this.mFragmentFilter.isAdded()) {
                this.mFragmentFilter.updateFilterData();
            }
            if (this.mFragmentLighting.isAdded()) {
                this.mFragmentLighting.reInitAdapterBgMode(true);
            }
        }
        this.mModeSelectLayout.initBeautyMenuView();
    }

    public boolean canSnap() {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        return (cameraAction == null || cameraAction.isDoingAction()) ? false : true;
    }

    public void onSnapPrepare() {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d(TAG, "onSnapPrepare");
                cameraAction.onShutterButtonFocus(true, 2);
            }
        }
    }

    public void onTrackSnapMissTaken(long j) {
        if (isEnableClick()) {
            CameraActionTrack cameraActionTrack = (CameraActionTrack) ModeCoordinatorImpl.getInstance().getAttachProtocol(186);
            if (cameraActionTrack != null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onTrackSnapMissTaken ");
                stringBuilder.append(j);
                stringBuilder.append("ms");
                Log.d(str, stringBuilder.toString());
                cameraActionTrack.onTrackShutterButtonMissTaken(j);
            }
        }
    }

    public void onTrackSnapTaken(long j) {
        if (isEnableClick()) {
            CameraActionTrack cameraActionTrack = (CameraActionTrack) ModeCoordinatorImpl.getInstance().getAttachProtocol(186);
            if (cameraActionTrack != null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onTrackSnapTaken ");
                stringBuilder.append(j);
                stringBuilder.append("ms");
                Log.d(str, stringBuilder.toString());
                cameraActionTrack.onTrackShutterButtonTaken(j);
            }
        }
    }

    public void onSnapClick() {
        if (isEnableClick() && getContext() != null) {
            Camera camera = (Camera) getContext();
            Module currentModule = camera.getCurrentModule();
            if (currentModule != null && currentModule.isIgnoreTouchEvent()) {
                Log.w(TAG, "onSnapClick: ignore onSnapClick event, because module isn't ready");
            } else if (CameraSettings.isFrontCamera() && camera.isScreenSlideOff()) {
                Log.w(TAG, "onSnapClick: ignore onSnapClick event, because screen slide is off");
            } else {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null) {
                    Log.d(TAG, "onSnapClick");
                    switch (this.mCurrentMode) {
                        case 161:
                        case 162:
                        case 168:
                        case 169:
                        case 170:
                        case 172:
                        case 174:
                            break;
                        case 166:
                            if (cameraAction.isDoingAction()) {
                                return;
                            }
                            break;
                        default:
                            if (!cameraAction.isDoingAction()) {
                                cameraAction.onShutterButtonClick(10);
                                break;
                            }
                            return;
                    }
                    if (!this.mVideoRecordingStarted) {
                        prepareRecording(BottomAnimationConfig.generate(false, this.mCurrentMode, true, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables());
                        this.mVideoRecordingStarted = true;
                    }
                    cameraAction.onShutterButtonClick(10);
                    if (Util.isAccessible()) {
                        if (162 != this.mCurrentMode) {
                            this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_shutter_finish));
                        } else if (((Camera) getActivity()).isVideoRecording()) {
                            this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_record_start));
                        } else {
                            this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_record_stop));
                        }
                        this.mEdgeHorizonScrollView.sendAccessibilityEvent(32768);
                    }
                }
            }
        }
    }

    public void onSnapLongPress() {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null && !cameraAction.isDoingAction()) {
                if (getContext() != null) {
                    Camera camera = (Camera) getContext();
                    if (CameraSettings.isFrontCamera() && camera.isScreenSlideOff()) {
                        return;
                    }
                }
                Log.d(TAG, "onSnapLongPress");
                if (cameraAction.onShutterButtonLongClick()) {
                    this.mLongPressBurst = true;
                }
            }
        }
    }

    public void onSnapLongPressCancelOut() {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d(TAG, "onSnapLongPressCancelOut");
                cameraAction.onShutterButtonLongClickCancel(false);
                if (this.mLongPressBurst) {
                    this.mLongPressBurst = false;
                }
            }
        }
    }

    public void onSnapLongPressCancelIn() {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                Log.d(TAG, "onSnapLongPressCancelIn");
                cameraAction.onShutterButtonLongClickCancel(true);
                int i = this.mCurrentMode;
                if (i != 163) {
                    if (i == 165 || i == 167 || i == 171) {
                        onSnapClick();
                    }
                } else if (this.mLongPressBurst) {
                    this.mLongPressBurst = false;
                }
            }
        }
    }

    public boolean onBackEvent(int i) {
        boolean z = this.mCurrentMode == 161 && i == 3 && this.mIsShowFilter;
        if (((i != 1 && (!Util.UI_DEBUG() || i != 2)) || (!this.mIsShowFilter && !this.mIsShowLighting)) && !z) {
            return false;
        }
        hideExtra();
        if (Util.isAccessible()) {
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateContentDescription();
        }
        return true;
    }

    public void hideExtra() {
        ConfigChanges configChanges;
        if (this.mIsShowFilter) {
            configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                configChanges.showOrHideFilter();
            }
        } else if (this.mIsShowLighting) {
            configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                configChanges.showOrHideLighting(false);
            }
        }
    }

    public void onSwitchCameraActionMenu(int i) {
        this.mModeSelectLayout.switchMenuMode(i, true);
    }

    public void onSwitchLiveActionMenu(int i) {
        this.mCurrentLiveActionMenuType = i;
        this.mModeSelectLayout.switchMenuMode(2, i, true);
    }

    public void onSwitchBeautyActionMenu(int i) {
        this.mCurrentBeautyActionMenuType = i;
        this.mModeSelectLayout.switchMenuMode(1, i, true);
    }

    public int getBeautyActionMenuType() {
        return this.mCurrentBeautyActionMenuType;
    }

    public SparseArray<MenuItem> getMenuData() {
        return this.mModeSelectLayout.getMenuData();
    }

    public void onBottomMenuAnimate(int i, int i2) {
        this.mModeSelectLayout.bottomMenuAnimate(i, i2);
    }
}
