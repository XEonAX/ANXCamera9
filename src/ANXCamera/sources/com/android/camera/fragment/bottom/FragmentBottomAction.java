package com.android.camera.fragment.bottom;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.support.v4.graphics.drawable.RoundedBitmapDrawableFactory;
import android.support.v4.view.GravityCompat;
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
import com.android.camera.data.backup.DataBackUp;
import com.android.camera.data.data.global.ComponentModuleList;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentFilter;
import com.android.camera.fragment.FragmentLighting;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.log.Log;
import com.android.camera.module.LiveModule;
import com.android.camera.module.Module;
import com.android.camera.module.VideoModule;
import com.android.camera.module.loader.StartControl;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraActionTrack;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import com.android.camera.protocol.ModeProtocol.HandlerSwitcher;
import com.android.camera.protocol.ModeProtocol.ModeChangeController;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
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
    private long mLastPauseTime;
    private boolean mLongPressBurst;
    private BottomActionMenu mModeSelectLayout;
    private ModeSelectView mModeSelectView;
    private ProgressBar mPostProcess;
    private int mRecordProgressDelay;
    private ImageView mRecordingPause;
    private ImageView mRecordingReverse;
    private ImageView mRecordingSnap;
    private AlertDialog mReverseDialog;
    private CameraSnapView mShutterButton;
    private SineEaseOutInterpolator mSineEaseOut;
    private ImageView mThumbnailImage;
    private ViewGroup mThumbnailImageLayout;
    private ProgressBar mThumbnailProgress;
    private RelativeLayout mV9bottomParentLayout;
    private boolean mVideoCaptureEnable;
    private boolean mVideoPauseSupported;
    private boolean mVideoRecordingPaused;
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
        this.mShutterButton.setSnapClickEnable(false);
        this.mCaptureProgressDelay = getResources().getInteger(R.integer.capture_progress_delay_time);
        this.mRecordProgressDelay = getResources().getInteger(R.integer.record_progress_delay_time);
        this.mThumbnailImageLayout.setOnClickListener(this);
        this.mCameraPicker.setOnClickListener(this);
        this.mRecordingPause.setOnClickListener(this);
        this.mRecordingSnap.setOnClickListener(this);
        this.mRecordingReverse.setOnClickListener(this);
        adjustViewBackground(this.mModeSelectLayout.getView(), this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, 2);
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

    private void setRecordingTimeState(int i) {
        switch (i) {
            case 1:
                if (this.mCurrentMode == 174) {
                    this.mBottomRecordingTime.setText("00:15");
                }
                Completable.create(new AlphaInOnSubscribe(this.mBottomRecordingTime)).subscribe();
                return;
            case 2:
                if (this.mBottomRecordingTime.getVisibility() == 0) {
                    Completable.create(new AlphaOutOnSubscribe(this.mBottomRecordingTime)).subscribe();
                }
                if (this.mBottomRecordingCameraPicker.getVisibility() == 0) {
                    Completable.create(new AlphaOutOnSubscribe(this.mBottomRecordingCameraPicker)).subscribe();
                    return;
                }
                return;
            case 3:
                Completable.create(new AlphaInOnSubscribe(this.mBottomRecordingCameraPicker)).subscribe();
                return;
            case 4:
                if (this.mBottomRecordingTime.getVisibility() != 0) {
                    this.mBottomRecordingTime.setVisibility(0);
                    return;
                }
                return;
            default:
                return;
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
        this.mShutterButton.setSnapClickEnable(z);
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
            if (!this.mIsIntentAction) {
                if (thumbnail == null) {
                    this.mThumbnailImage.setImageResource(R.drawable.ic_thumbnail_background);
                    return;
                }
                Drawable create = RoundedBitmapDrawableFactory.create(getResources(), thumbnail.getBitmap());
                create.getPaint().setAntiAlias(true);
                create.setCircular(true);
                this.mThumbnailImage.setImageDrawable(create);
                if (z && !this.mVideoRecordingStarted) {
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

    public void processingPrepare() {
        BottomAnimationConfig configVariables = BottomAnimationConfig.generate(false, this.mCurrentMode, true, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables();
        updateBottomInRecording(true, true);
        this.mShutterButton.prepareRecording(configVariables);
        if (this.mCurrentMode == 174) {
            setRecordingTimeState(1);
        }
    }

    public void processingStart() {
        this.mEdgeHorizonScrollView.setEnabled(false);
        this.mModeSelectView.setEnabled(false);
        this.mVideoRecordingStarted = true;
        this.mShutterButton.triggerAnimation(BottomAnimationConfig.generate(false, this.mCurrentMode, true, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables());
    }

    public void processingPause() {
        this.mVideoRecordingPaused = true;
        this.mShutterButton.pauseRecording();
        this.mRecordingPause.setImageResource(R.drawable.ic_recording_resume);
        this.mRecordingPause.setContentDescription(getString(R.string.accessibility_video_resume_button));
        if (this.mCurrentMode == 174) {
            setRecordingTimeState(3);
            this.mShutterButton.addSegmentNow();
            int i = 8;
            this.mModeSelectView.setVisibility(8);
            Completable.create(new AlphaInOnSubscribe(this.mModeSelectLayout.getView())).subscribe();
            int visibility = this.mRecordingReverse.getVisibility();
            ImageView imageView = this.mRecordingReverse;
            if (visibility != 0) {
                i = 0;
            }
            imageView.setVisibility(i);
        }
    }

    public void processingResume() {
        int i = 0;
        this.mVideoRecordingPaused = false;
        this.mShutterButton.resumeRecording();
        this.mRecordingPause.setImageResource(R.drawable.ic_recording_pause);
        this.mRecordingPause.setContentDescription(getString(R.string.accessibility_video_pause_button));
        if (this.mCurrentMode == 174) {
            setRecordingTimeState(4);
            Completable.create(new AlphaOutOnSubscribe(this.mModeSelectLayout.getView())).subscribe();
            int visibility = this.mRecordingReverse.getVisibility();
            this.mRecordingReverse.setVisibility(visibility == 0 ? 8 : 0);
            ImageView imageView = this.mBottomRecordingCameraPicker;
            if (visibility == 0) {
                i = 8;
            }
            imageView.setVisibility(i);
        }
    }

    public void processingFinish() {
        if (isAdded()) {
            if (this.mShutterButton.getVisibility() != 0) {
                this.mShutterButton.setVisibility(0);
            }
            this.mEdgeHorizonScrollView.setEnabled(true);
            this.mModeSelectView.setEnabled(true);
            this.mVideoRecordingStarted = false;
            this.mVideoRecordingPaused = false;
            setProgressBarVisible(8);
            this.mShutterButton.showRoundPaintItem();
            if (this.mCurrentMode == 174) {
                this.mModeSelectView.setVisibility(0);
                this.mModeSelectLayout.getView().setVisibility(0);
                setRecordingTimeState(2);
            }
            this.mShutterButton.triggerAnimation(BottomAnimationConfig.generate(false, this.mCurrentMode, false, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables());
            updateBottomInRecording(false, false);
        }
    }

    public void processingFailed() {
        updateLoading(true);
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
                return;
            }
            return;
        }
        this.mShutterButton.pauseRecording();
        this.mShutterButton.hideRoundPaintItem();
        this.mShutterButton.invalidate();
        this.mShutterButton.addSegmentNow();
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
    }

    public void processingPostAction() {
        if (this.mShutterButton.getVisibility() != 0) {
            this.mShutterButton.setVisibility(0);
        }
        this.mShutterButton.hideRoundPaintItem();
        this.mShutterButton.triggerAnimation(BottomAnimationConfig.generate(true, this.mCurrentMode, false, isFPS960(), CameraSettings.isVideoBokehOn()).configVariables());
        updateBottomInRecording(false, true);
        setProgressBarVisible(0);
    }

    private void setProgressBarVisible(int i) {
        if (this.mPostProcess.getVisibility() != i) {
            ValueAnimator ofFloat;
            if (i == 0) {
                this.mPostProcess.setAlpha(0.0f);
                this.mPostProcess.setVisibility(0);
                ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
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
            } else if (this.mPostProcess.getVisibility() != 8) {
                ofFloat = ValueAnimator.ofFloat(new float[]{1.0f, 0.0f});
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
    }

    public void processingAudioCapture(boolean z) {
        if (z) {
            this.mShutterButton.startRing();
        } else {
            this.mShutterButton.stopRing();
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

    /* JADX WARNING: Missing block: B:25:0x005d, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null) {
                if (((ActivityBase) getContext()).getCurrentModule().isIgnoreTouchEvent()) {
                    Log.w(TAG, "onClick: ignore click event, because module isn't ready");
                    return;
                }
                int id = view.getId();
                if (id != R.id.bottom_recording_camera_picker) {
                    if (id != R.id.v9_thumbnail_layout) {
                        if (id != R.id.v9_recording_pause) {
                            switch (id) {
                                case R.id.v9_camera_picker /*2131558444*/:
                                    if (!cameraAction.isDoingAction() && !isThumbLoading()) {
                                        hideExtra();
                                        changeCamera(view);
                                        break;
                                    }
                                    return;
                                    break;
                                case R.id.v9_recording_snap /*2131558445*/:
                                    if (this.mVideoCaptureEnable && this.mVideoRecordingStarted) {
                                        ActivityBase activityBase = (ActivityBase) getContext();
                                        if (activityBase != null && (activityBase.getCurrentModule() instanceof VideoModule)) {
                                            ((VideoModule) activityBase.getCurrentModule()).takeVideoSnapShoot();
                                            break;
                                        } else {
                                            Log.w(TAG, "onClick: recording snap is not allowed!!!");
                                            return;
                                        }
                                    }
                                    return;
                                    break;
                                case R.id.v9_recording_reverse /*2131558446*/:
                                    if (this.mVideoReverseEnable && this.mVideoRecordingStarted && this.mShutterButton.hasSegments()) {
                                        showReverseConfirmDialog();
                                        break;
                                    }
                                    return;
                                    break;
                            }
                        } else if (this.mVideoPauseSupported && this.mVideoRecordingStarted) {
                            int i = this.mCurrentMode;
                            if (i != 162) {
                                if (i != 174) {
                                    switch (i) {
                                        case 168:
                                        case 169:
                                        case 170:
                                            break;
                                        default:
                                            return;
                                    }
                                }
                                long currentTimeMillis = System.currentTimeMillis() - this.mLastPauseTime;
                                if (currentTimeMillis <= 0 || currentTimeMillis >= 500) {
                                    if (this.mVideoRecordingPaused) {
                                        CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_RESUME);
                                    } else {
                                        CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_PAUSE);
                                    }
                                    this.mLastPauseTime = System.currentTimeMillis();
                                    ((LiveModule) ((ActivityBase) getContext()).getCurrentModule()).onPauseButtonClick();
                                } else {
                                    return;
                                }
                            }
                            ((VideoModule) ((ActivityBase) getContext()).getCurrentModule()).onPauseButtonClick();
                        }
                    } else if (!isThumbLoading()) {
                        if (DataRepository.dataItemGlobal().isIntentAction()) {
                            cameraAction.onReviewCancelClicked();
                        } else {
                            cameraAction.onThumbnailClicked(null);
                        }
                    }
                } else if (this.mVideoRecordingPaused) {
                    CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_SWITCH);
                    changeCamera(view);
                }
            }
        }
    }

    private void showReverseConfirmDialog() {
        CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_REVERSE);
        Builder builder = new Builder(getContext());
        builder.setMessage(R.string.live_reverse_message);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.live_reverse_confirm, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FragmentBottomAction.this.mReverseDialog = null;
                FragmentBottomAction.this.mShutterButton.removeLastSegment();
                CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_REVERSE_CONFIRM);
                ((LiveModule) ((ActivityBase) FragmentBottomAction.this.getContext()).getCurrentModule()).doReverse();
            }
        });
        builder.setNegativeButton(R.string.snap_cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FragmentBottomAction.this.mReverseDialog = null;
            }
        });
        this.mReverseDialog = builder.show();
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x00f0  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void changeCamera(View view) {
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
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).removeExtraMenu(4);
        int i2 = this.mCurrentMode;
        if (i2 != 162) {
            switch (i2) {
                case 168:
                case 169:
                case 170:
                    DataRepository.dataItemGlobal().setCurrentMode(162);
                    ((Camera) getContext()).onModeSelected(StartControl.create(162).setNeedBlurAnimation(true).setViewConfigType(2));
                    break;
                default:
                    ((Camera) getContext()).onModeSelected(StartControl.create(this.mCurrentMode).setResetType(5).setViewConfigType(2).setNeedBlurAnimation(true));
                    break;
            }
        }
        if (i == 0) {
            DataBackUp backUp = DataRepository.getInstance().backUp();
            if (backUp.isLastVideoFastMotion()) {
                i2 = 169;
            } else if (backUp.isLastVideoSlowMotion()) {
                i2 = 168;
            } else if (backUp.isLastVideoHFRMode()) {
                i2 = 170;
            }
            if (i2 != 162) {
                DataRepository.dataItemGlobal().setCurrentMode(i2);
            }
            ((Camera) getContext()).onModeSelected(StartControl.create(i2).setResetType(5).setNeedBlurAnimation(true).setViewConfigType(2));
        }
        i2 = 162;
        if (i2 != 162) {
        }
        ((Camera) getContext()).onModeSelected(StartControl.create(i2).setResetType(5).setNeedBlurAnimation(true).setViewConfigType(2));
        if (Util.isAccessible()) {
            this.mEdgeHorizonScrollView.setContentDescription(getString(R.string.accessibility_camera_picker_finish));
            this.mEdgeHorizonScrollView.sendAccessibilityEvent(32768);
        }
    }

    private boolean isFPS960() {
        if (this.mCurrentMode == 172 && DataRepository.dataItemFeature().fs()) {
            return DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
        }
        return false;
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
            if (!b.gn() || CameraSettings.isVideoBokehOn()) {
                z3 = false;
            }
            this.mVideoPauseSupported = z3;
            this.mVideoReverseEnable = false;
        }
        if (z) {
            if (this.mVideoCaptureEnable) {
                this.mRecordingSnap.setImageResource(R.drawable.ic_recording_snap);
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
                        ImageView access$1200 = FragmentBottomAction.this.mRecordingSnap;
                        if (!z) {
                            i = 8;
                        }
                        access$1200.setVisibility(i);
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
        if (!isShowFilterView() && !isShowLightingView()) {
            changeMode(i, 0);
        }
    }

    /* JADX WARNING: Missing block: B:9:0x0016, code:
            if (r3 != 174) goto L_0x0021;
     */
    /* JADX WARNING: Missing block: B:11:0x001c, code:
            if (com.android.camera.CameraSettings.isLiveModuleClicked() != false) goto L_0x0021;
     */
    /* JADX WARNING: Missing block: B:12:0x001e, code:
            com.android.camera.CameraSettings.setLiveModuleClicked();
     */
    /* JADX WARNING: Missing block: B:14:0x0025, code:
            if (isThumbLoading() == false) goto L_0x0028;
     */
    /* JADX WARNING: Missing block: B:15:0x0027, code:
            return;
     */
    /* JADX WARNING: Missing block: B:16:0x0028, code:
            r0 = (com.android.camera.protocol.ModeProtocol.CameraAction) com.android.camera.protocol.ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
     */
    /* JADX WARNING: Missing block: B:17:0x0034, code:
            if (r0 == null) goto L_0x003d;
     */
    /* JADX WARNING: Missing block: B:19:0x003a, code:
            if (r0.isDoingAction() == false) goto L_0x003d;
     */
    /* JADX WARNING: Missing block: B:20:0x003c, code:
            return;
     */
    /* JADX WARNING: Missing block: B:21:0x003d, code:
            r2.mCurrentMode = r3;
            ((com.android.camera.data.data.global.DataItemGlobal) com.android.camera.data.DataRepository.provider().dataGlobal()).setCurrentMode(r3);
            ((com.android.camera.Camera) getContext()).onModeSelected(com.android.camera.module.loader.StartControl.create(r3).setStartDelay(r4).setResetType(4).setViewConfigType(2).setNeedBlurAnimation(true));
     */
    /* JADX WARNING: Missing block: B:22:0x006c, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void changeMode(int i, int i2) {
        if (i != this.mCurrentMode) {
            int i3 = this.mCurrentMode;
            if (i3 != 162) {
                switch (i3) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                }
            }
            if (i != 162) {
                switch (i) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                }
            }
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void selectMode(int i, int i2) {
        if (i != -1) {
            int i3;
            int size;
            int i4;
            int i5;
            if (!Util.isLayoutRTL(getContext())) {
                if (i != 3) {
                }
                i = 8388611;
                i3 = this.mCurrentMode;
                if (this.mCurrentMode == 169 || this.mCurrentMode == 168 || this.mCurrentMode == 170) {
                    i3 = 162;
                }
                size = this.mComponentModuleList.getItems().size();
                i4 = 0;
                for (i5 = 0; i5 < size; i5++) {
                    if (this.mComponentModuleList.getMode(i5) == i3) {
                        i4 = i5;
                        break;
                    }
                }
                if (i == 8388611) {
                    if (i == GravityCompat.END && i4 < size - 1) {
                        i4++;
                    }
                } else if (i4 > 0) {
                    i4--;
                }
                changeMode(this.mComponentModuleList.getMode(i4), i2);
            } else if (i != 3) {
            }
            i = GravityCompat.END;
            i3 = this.mCurrentMode;
            i3 = 162;
            size = this.mComponentModuleList.getItems().size();
            i4 = 0;
            while (i5 < size) {
            }
            if (i == 8388611) {
            }
            changeMode(this.mComponentModuleList.getMode(i4), i2);
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_action;
    }

    public int getFragmentInto() {
        return 241;
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        int i3 = this.mCurrentMode;
        boolean z = i2 == 3;
        if (z || i3 != i) {
            if (this.mReverseDialog != null) {
                this.mReverseDialog.dismiss();
            }
            if (this.mIsShowFilter) {
                showOrHideFilterView();
            } else if (this.mIsShowLighting) {
                showOrHideLightingView();
            }
        }
        if (i3 == 174 && this.mVideoRecordingStarted) {
            if (z) {
                processingFinish();
            } else {
                return;
            }
        }
        super.provideAnimateElement(i, list, i2);
        if (this.mFragmentFilter != null) {
            this.mFragmentFilter.isShowAnimation(list);
        }
        if (i == 165) {
            this.mModeSelectLayout.getView().setBackgroundResource(R.color.black);
        }
        this.mShutterButton.setParameters(i, list != null, isFPS960());
        if (this.mModeSelectView.getVisibility() != 0) {
            this.mModeSelectView.setVisibility(0);
        }
        this.mModeSelectView.judgePosition(i, list);
        i2 = -1;
        switch (i) {
            case 166:
            case 167:
            case 172:
            case 173:
                this.mCameraPickEnable = false;
                break;
            case 171:
                if (!b.ht()) {
                    this.mCameraPickEnable = false;
                    break;
                }
                this.mCameraPickEnable = true;
            default:
                this.mCameraPickEnable = true;
        }
        i2 = 1;
        if (this.mCameraPicker.getTag() == null || ((Integer) this.mCameraPicker.getTag()).intValue() != i2) {
            this.mCameraPicker.setTag(Integer.valueOf(i2));
            animateViews(i2, list, this.mCameraPicker);
        }
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
        list.add(this.mBottomRecordingCameraPicker);
        list.add(this.mRecordingReverse);
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
        adjustViewBackground(this.mModeSelectLayout.getView(), this.mCurrentMode);
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
        boolean z = i == 3 && this.mCurrentMode == 161 && this.mIsShowFilter;
        boolean z2 = i == 1 && (this.mIsShowFilter || this.mIsShowLighting);
        boolean z3 = i == 2 && this.mIsShowFilter && Util.UI_DEBUG();
        if (!z && !z2 && !z3) {
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
        if (this.mVideoRecordingStarted && this.mCurrentMode == 174 && this.mBottomRecordingTime.getVisibility() != 0) {
            this.mBottomRecordingTime.setVisibility(0);
        }
        this.mModeSelectLayout.switchMenuMode(i, true);
    }

    public void onSwitchLiveActionMenu(int i) {
        if (this.mBottomRecordingTime.getVisibility() == 0) {
            this.mBottomRecordingTime.setVisibility(8);
        }
        this.mCurrentLiveActionMenuType = i;
        this.mModeSelectLayout.switchMenuMode(2, i, true);
    }

    public void onSwitchBeautyActionMenu(int i) {
        if (this.mBottomRecordingTime.getVisibility() == 0) {
            this.mBottomRecordingTime.setVisibility(8);
        }
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
