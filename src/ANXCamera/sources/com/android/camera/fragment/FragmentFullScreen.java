package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.app.AlertDialog.Builder;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.util.Pair;
import android.view.TextureView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewStub;
import android.view.animation.Animation;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.log.Log;
import com.android.camera.module.LiveModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.LiveVideoEditor;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.ui.CameraSnapView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.ss.android.vesdk.VECommonCallback;
import com.ss.android.vesdk.VECommonCallbackInfo;
import io.reactivex.Completable;
import io.reactivex.Single;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import java.util.List;
import miui.view.animation.CubicEaseInInterpolator;

public class FragmentFullScreen extends BaseFragment implements OnClickListener, FullScreenProtocol, HandleBackTrace, Consumer<Pair<String, String>> {
    public static final int FRAGMENT_INFO = 4086;
    private static final String TAG = "FragmentFullScreen";
    private ViewGroup mBottomActionView;
    private ViewGroup mBottomLayout;
    private CameraSnapView mCameraSnapView;
    private VECommonCallback mCombineListener;
    private ProgressBar mCombineProgress;
    private boolean mCombineReady;
    private Disposable mConcatDisposable;
    private ProgressBar mConcatProgress;
    private boolean mConcatReady;
    private VECommonCallback mErrorListener;
    private Handler mHandler;
    private boolean mIsPlaying;
    private View mLiveViewLayout;
    private ViewStub mLiveViewStub;
    private boolean mPendingShare;
    private ImageView mPreviewBack;
    private ImageView mPreviewCombine;
    private FrameLayout mPreviewLayout;
    private ImageView mPreviewShare;
    private ImageView mPreviewStart;
    private TextureView mPreviewTextureView;
    private View mRootView;
    private ContentValues mSaveContentValues;
    private Uri mSavedUri;
    private View mScreenLightIndicator;
    private ProgressBar mShareProgress;
    private TextView mTimeView;

    protected void initView(View view) {
        this.mRootView = view;
        this.mScreenLightIndicator = view.findViewById(R.id.screen_light_indicator);
        this.mLiveViewStub = (ViewStub) view.findViewById(R.id.live_record_preview);
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(196, this);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(196, this);
        unRegisterBackStack(modeCoordinator, this);
    }

    public void showScreenLight() {
        if (this.mScreenLightIndicator.getVisibility() != 0) {
            this.mScreenLightIndicator.setVisibility(0);
            Completable.create(new AlphaInOnSubscribe(this.mRootView).setDurationTime(100)).subscribe();
        }
    }

    public void hideScreenLight() {
        if (this.mScreenLightIndicator.getVisibility() != 8) {
            Completable.create(new AlphaOutOnSubscribe(this.mRootView).setDurationTime(200)).subscribe(new Action() {
                public void run() throws Exception {
                    FragmentFullScreen.this.mScreenLightIndicator.setVisibility(8);
                    FragmentFullScreen.this.mRootView.setVisibility(8);
                }
            });
        }
    }

    public void setScreenLightColor(int i) {
        this.mRootView.setBackgroundColor(i);
    }

    protected Animation provideEnterAnimation(int i) {
        return null;
    }

    protected Animation provideExitAnimation() {
        return null;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_full_screen;
    }

    public int getFragmentInto() {
        return 4086;
    }

    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        super.provideAnimateElement(i, list, z);
        if (this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0) {
            if (z) {
                this.mLiveViewLayout.setVisibility(8);
            } else {
                this.mConcatReady = false;
            }
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0) {
            list.add(this.mPreviewStart);
            list.add(this.mCameraSnapView);
            list.add(this.mPreviewCombine);
            list.add(this.mPreviewBack);
            list.add(this.mPreviewShare);
        }
    }

    public void startLiveRecordPreview(ContentValues contentValues) {
        this.mSavedUri = null;
        this.mSaveContentValues = contentValues;
        if (this.mLiveViewLayout == null) {
            this.mLiveViewLayout = this.mLiveViewStub.inflate();
            initLiveView(this.mLiveViewLayout);
        }
        this.mPreviewLayout.setVisibility(8);
        this.mPreviewLayout.removeAllViews();
        this.mLiveViewLayout.setVisibility(0);
        this.mCombineProgress.setVisibility(8);
        this.mShareProgress.setVisibility(8);
        Completable.create(new AlphaInOnSubscribe(this.mCameraSnapView)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewCombine)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewBack)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewShare)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewStart)).subscribe();
        this.mTimeView.setText(((LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201)).getTimeValue());
        this.mTimeView.setVisibility(0);
        this.mPreviewStart.setVisibility(8);
        this.mConcatProgress.setVisibility(0);
        startConcatVideoIfNeed();
    }

    private void startConcatVideoIfNeed() {
        if (this.mConcatDisposable == null || this.mConcatDisposable.isDisposed()) {
            this.mConcatReady = false;
            this.mIsPlaying = false;
            this.mConcatDisposable = Single.create(new SingleOnSubscribe<Pair<String, String>>() {
                public void subscribe(SingleEmitter<Pair<String, String>> singleEmitter) throws Exception {
                    LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
                    liveConfigChanges.onRecordConcat();
                    singleEmitter.onSuccess(liveConfigChanges.getConcatResult());
                }
            }).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer) this);
        }
    }

    public void accept(Pair<String, String> pair) throws Exception {
        if (canProvide()) {
            this.mConcatReady = true;
            String str = (String) pair.first;
            String str2 = (String) pair.second;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(" | ");
            stringBuilder.append(str2);
            Log.e("concat:", stringBuilder.toString());
            LiveVideoEditor liveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
            initLiveListener();
            this.mPreviewTextureView = new TextureView(getContext());
            this.mPreviewLayout.addView(this.mPreviewTextureView);
            liveVideoEditor.init(this.mPreviewTextureView, str, str2, this.mCombineListener, this.mErrorListener);
            if (this.mConcatProgress.getVisibility() == 0) {
                Log.d(TAG, "concat finish and start preview");
                this.mConcatProgress.setVisibility(8);
                startPlay();
            } else if (this.mCombineProgress.getVisibility() == 0) {
                Log.d(TAG, "concat finish and start save");
                this.mPreviewCombine.setVisibility(8);
                setProgressBarVisible(0);
                startCombine();
            } else if (this.mShareProgress.getVisibility() == 0) {
                Log.d(TAG, "concat finish and pending share");
                startCombine();
            }
        }
    }

    public void onPause() {
        super.onPause();
        pausePlay();
    }

    private void showExitConfirm() {
        Builder builder = new Builder(getContext());
        builder.setMessage(R.string.live_edit_exit_message);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.live_edit_exit_confirm, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FragmentFullScreen.this.quitLiveRecordPreview(false);
            }
        });
        builder.setNegativeButton(R.string.snap_cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.show();
    }

    public void quitLiveRecordPreview(boolean z) {
        this.mLiveViewLayout.setVisibility(8);
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction != null) {
            if (z) {
                cameraAction.onReviewDoneClicked();
            } else {
                cameraAction.onReviewCancelClicked();
            }
            ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).onDestory();
        }
    }

    private void initLiveView(View view) {
        this.mPreviewLayout = (FrameLayout) view.findViewById(R.id.live_preview_layout);
        this.mConcatProgress = (ProgressBar) view.findViewById(R.id.live_concat_progress);
        this.mCombineProgress = (ProgressBar) view.findViewById(R.id.live_save_progress);
        this.mShareProgress = (ProgressBar) view.findViewById(R.id.live_share_progress);
        this.mTimeView = (TextView) view.findViewById(R.id.live_preview_recording_time_view);
        this.mCameraSnapView = (CameraSnapView) view.findViewById(R.id.live_preview_save_circle);
        this.mCameraSnapView.setParameters(this.mCurrentMode, false, false);
        this.mCameraSnapView.hideRoundPaintItem();
        this.mCameraSnapView.setEnabled(false);
        this.mPreviewCombine = (ImageView) view.findViewById(R.id.live_preview_save);
        this.mPreviewBack = (ImageView) view.findViewById(R.id.live_preview_back);
        this.mPreviewShare = (ImageView) view.findViewById(R.id.live_preview_share);
        this.mPreviewStart = (ImageView) view.findViewById(R.id.live_preview_play);
        this.mCameraSnapView.setOnClickListener(this);
        this.mPreviewCombine.setOnClickListener(this);
        this.mPreviewBack.setOnClickListener(this);
        this.mPreviewShare.setOnClickListener(this);
        this.mPreviewStart.setOnClickListener(this);
        this.mBottomActionView = (FrameLayout) view.findViewById(R.id.live_preview_bottom_action);
        ((MarginLayoutParams) this.mBottomActionView.getLayoutParams()).height = Util.getBottomHeight(getResources());
        this.mBottomLayout = (RelativeLayout) view.findViewById(R.id.live_preview_bottom_parent);
        ((MarginLayoutParams) this.mBottomLayout.getLayoutParams()).bottomMargin = getResources().getDimensionPixelSize(R.dimen.bottom_margin_bottom) + Util.sNavigationBarHeight;
        this.mBottomActionView.setBackgroundResource(R.color.fullscreen_background);
    }

    private void animateIn() {
    }

    private void initLiveListener() {
        this.mHandler = new Handler() {
            public void handleMessage(Message message) {
                super.handleMessage(message);
            }
        };
        this.mCombineListener = new VECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                if (i == 4098) {
                    Log.d(FragmentFullScreen.TAG, "play finished and loop");
                } else if (i == 4101) {
                } else {
                    if (i == 4103) {
                        FragmentFullScreen.this.onCombineSuccess();
                    } else if (i == VECommonCallbackInfo.TE_INFO_COMPILE_PROGRESS) {
                    } else {
                        if (i != 4112) {
                            String str2 = FragmentFullScreen.TAG;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("CombineCallback: ");
                            stringBuilder.append(i);
                            Log.d(str2, stringBuilder.toString());
                            return;
                        }
                        Log.d(FragmentFullScreen.TAG, "CombineStart");
                    }
                }
            }
        };
        this.mErrorListener = new VECommonCallback() {
            public void onCallback(int i, int i2, float f, String str) {
                String str2 = FragmentFullScreen.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("CombineError: ");
                stringBuilder.append(i);
                stringBuilder.append(" | ");
                stringBuilder.append(i2);
                stringBuilder.append(" | ");
                stringBuilder.append(f);
                stringBuilder.append(" | ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString());
                FragmentFullScreen.this.onCombineError();
            }
        };
    }

    private void onCombineError() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentFullScreen.this.quitLiveRecordPreview(false);
            }
        });
    }

    private void onCombineSuccess() {
        Log.d(TAG, "combineSuccess");
        this.mCombineReady = true;
        if (this.mPendingShare) {
            ((LiveModule) ((ActivityBase) getContext()).getCurrentModule()).startSaveToLocal();
        } else {
            this.mHandler.post(new Runnable() {
                public void run() {
                    FragmentFullScreen.this.quitLiveRecordPreview(true);
                }
            });
        }
    }

    private void onPlayCompleted() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentFullScreen.this.mIsPlaying = false;
                FragmentFullScreen.this.mPreviewStart.setVisibility(0);
            }
        });
    }

    public void onClick(View view) {
        if (this.mConcatProgress.getVisibility() != 0 && this.mCombineProgress.getVisibility() != 0 && this.mShareProgress.getVisibility() != 0) {
            int id = view.getId();
            if (id != R.id.live_preview_play) {
                if (id != R.id.live_preview_share) {
                    switch (id) {
                        case R.id.live_preview_back /*2131558498*/:
                            showExitConfirm();
                            break;
                        case R.id.live_preview_save_circle /*2131558499*/:
                        case R.id.live_preview_save /*2131558500*/:
                            if (this.mSavedUri == null) {
                                if (!this.mConcatReady) {
                                    Log.d(TAG, "concat not finished, show save progress and wait to save");
                                    this.mPreviewCombine.setVisibility(8);
                                    setProgressBarVisible(0);
                                    startConcatVideoIfNeed();
                                    break;
                                }
                                pausePlay();
                                this.mPreviewCombine.setVisibility(8);
                                setProgressBarVisible(0);
                                startCombine();
                                break;
                            }
                            onCombineSuccess();
                            break;
                    }
                } else if (!checkAndShare()) {
                    this.mPendingShare = true;
                    this.mPreviewShare.setVisibility(8);
                    this.mShareProgress.setVisibility(0);
                    if (this.mConcatReady) {
                        pausePlay();
                        startCombine();
                    } else {
                        Log.d(TAG, "concat not finished, show share progress and wait to share");
                        startConcatVideoIfNeed();
                    }
                }
            } else if (this.mConcatReady) {
                startPlay();
            } else {
                Log.d(TAG, "concat not finished, show play progress");
                this.mPreviewStart.setVisibility(8);
                this.mConcatProgress.setVisibility(0);
                startConcatVideoIfNeed();
            }
        }
    }

    private void startPlay() {
        this.mIsPlaying = true;
        this.mPreviewStart.setVisibility(8);
        this.mPreviewLayout.setVisibility(0);
        ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).startPlay();
    }

    private void pausePlay() {
        if (this.mIsPlaying) {
            this.mPreviewStart.setVisibility(0);
            this.mIsPlaying = false;
            LiveVideoEditor liveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
            if (liveVideoEditor != null) {
                liveVideoEditor.pausePlay();
            }
        }
    }

    private void startCombine() {
        this.mCombineReady = false;
        ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).combineVideoAudio(this.mSaveContentValues.getAsString("_data"), this.mCombineListener, this.mErrorListener);
    }

    private void setProgressBarVisible(int i) {
        if (this.mCombineProgress.getVisibility() != i) {
            ValueAnimator ofFloat;
            if (i == 0) {
                this.mCombineProgress.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                this.mCombineProgress.setVisibility(0);
                ofFloat = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
                ofFloat.setDuration(300);
                ofFloat.setStartDelay(160);
                ofFloat.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
                ofFloat.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        Float f = (Float) valueAnimator.getAnimatedValue();
                        FragmentFullScreen.this.mCombineProgress.setAlpha(f.floatValue());
                        FragmentFullScreen.this.mCombineProgress.setScaleX((f.floatValue() * 0.1f) + 0.9f);
                        FragmentFullScreen.this.mCombineProgress.setScaleY(0.9f + (0.1f * f.floatValue()));
                    }
                });
                ofFloat.start();
            } else {
                ofFloat = ValueAnimator.ofFloat(new float[]{1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO});
                ofFloat.setDuration(300);
                ofFloat.setInterpolator(new CubicEaseInInterpolator());
                ofFloat.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        FragmentFullScreen.this.mCombineProgress.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
                    }
                });
                ofFloat.addListener(new AnimatorListener() {
                    public void onAnimationStart(Animator animator) {
                    }

                    public void onAnimationEnd(Animator animator) {
                        FragmentFullScreen.this.mCombineProgress.setVisibility(8);
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

    public boolean onBackEvent(int i) {
        switch (i) {
            case 1:
            case 2:
                if (this.mLiveViewLayout == null || this.mLiveViewLayout.getVisibility() != 0) {
                    return false;
                }
                showExitConfirm();
                return true;
            default:
                return false;
        }
    }

    public boolean isLiveRecordPreviewShown() {
        return this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0;
    }

    public void onLiveSaveToLocalFinished(Uri uri) {
        this.mSavedUri = uri;
        if (this.mPendingShare) {
            this.mPreviewShare.setVisibility(0);
            this.mShareProgress.setVisibility(8);
            startShare();
        }
    }

    public ContentValues getSaveContentValues() {
        return this.mSaveContentValues;
    }

    private boolean checkAndShare() {
        if (this.mSavedUri == null) {
            return false;
        }
        startShare();
        return true;
    }

    private void startShare() {
        this.mPendingShare = false;
        Intent intent = new Intent("android.intent.action.SEND");
        intent.putExtra("android.intent.extra.STREAM", this.mSavedUri);
        intent.setType(Util.convertOutputFormatToMimeType(2));
        intent.addFlags(1);
        try {
            getContext().startActivity(Intent.createChooser(intent, getString(R.string.live_edit_share_title)));
        } catch (Throwable e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("failed to share video ");
            stringBuilder.append(this.mSavedUri);
            Log.e(str, stringBuilder.toString(), e);
        }
    }
}
