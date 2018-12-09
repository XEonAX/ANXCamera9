package com.android.camera.fragment;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.ContentValues;
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
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.log.Log;
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

public class FragmentFullScreen extends BaseFragment implements OnClickListener, FullScreenProtocol, HandleBackTrace, Consumer<Pair<String, String>> {
    public static final int FRAGMENT_INFO = 4086;
    private static final String TAG = "FragmentFullScreen";
    private ViewGroup mBottomActionView;
    private ViewGroup mBottomLayout;
    private CameraSnapView mCameraSnapView;
    private VECommonCallback mCombineListener;
    private Disposable mConcatDisposable;
    private ProgressBar mConcatProgress;
    private boolean mConcatReady;
    private VECommonCallback mErrorListener;
    private Handler mHandler;
    private View mLiveViewLayout;
    private ViewStub mLiveViewStub;
    private ImageView mPreviewBack;
    private ImageView mPreviewSave;
    private ImageView mPreviewShare;
    private ImageView mPreviewStart;
    private FrameLayout mPreviewSurface;
    private View mRootView;
    private ContentValues mSaveContentValues;
    private ProgressBar mSaveProgress;
    private View mScreenLightIndicator;

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
        if (z && this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0) {
            this.mLiveViewLayout.setVisibility(8);
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0) {
            list.add(this.mPreviewStart);
            list.add(this.mCameraSnapView);
            list.add(this.mPreviewSave);
            list.add(this.mPreviewBack);
            list.add(this.mPreviewShare);
        }
    }

    public void startLiveRecordPreview(ContentValues contentValues) {
        this.mSaveContentValues = contentValues;
        if (this.mLiveViewLayout == null) {
            this.mLiveViewLayout = this.mLiveViewStub.inflate();
            initLiveView(this.mLiveViewLayout);
        }
        this.mPreviewSurface.setVisibility(8);
        this.mPreviewSurface.removeAllViews();
        this.mLiveViewLayout.setVisibility(0);
        this.mSaveProgress.setVisibility(8);
        this.mConcatProgress.setVisibility(8);
        Completable.create(new AlphaInOnSubscribe(this.mCameraSnapView)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewSave)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewBack)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewShare)).subscribe();
        Completable.create(new AlphaInOnSubscribe(this.mPreviewStart)).subscribe();
        startConcatVideo();
    }

    private void startConcatVideo() {
        this.mConcatReady = false;
        this.mConcatDisposable = Single.create(new SingleOnSubscribe<Pair<String, String>>() {
            public void subscribe(SingleEmitter<Pair<String, String>> singleEmitter) throws Exception {
                LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
                liveConfigChanges.onRecordConcat();
                singleEmitter.onSuccess(liveConfigChanges.getConcatResult());
            }
        }).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer) this);
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
            View textureView = new TextureView(getContext());
            this.mPreviewSurface.addView(textureView);
            liveVideoEditor.init(textureView, str, str2, this.mCombineListener, this.mErrorListener);
            if (this.mConcatProgress.getVisibility() == 0) {
                Log.d(TAG, "concat finish and start preview");
                this.mConcatProgress.setVisibility(8);
                startPlay();
            }
            if (this.mSaveProgress.getVisibility() == 0) {
                Log.d(TAG, "concat finish and start save");
                startSave();
            }
        }
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
        this.mPreviewSurface = (FrameLayout) view.findViewById(R.id.live_preview_surface);
        this.mConcatProgress = (ProgressBar) view.findViewById(R.id.live_concat_progress);
        this.mSaveProgress = (ProgressBar) view.findViewById(R.id.live_save_progress);
        this.mCameraSnapView = (CameraSnapView) view.findViewById(R.id.live_preview_save_circle);
        this.mCameraSnapView.setParameters(this.mCurrentMode, false, false);
        this.mCameraSnapView.hideRoundPaintItem();
        this.mCameraSnapView.setEnabled(false);
        this.mPreviewSave = (ImageView) view.findViewById(R.id.live_preview_save);
        this.mPreviewBack = (ImageView) view.findViewById(R.id.live_preview_back);
        this.mPreviewShare = (ImageView) view.findViewById(R.id.live_preview_share);
        this.mPreviewStart = (ImageView) view.findViewById(R.id.live_preview_play);
        this.mCameraSnapView.setOnClickListener(this);
        this.mPreviewSave.setOnClickListener(this);
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
                    FragmentFullScreen.this.onPlayCompleted();
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
                FragmentFullScreen.this.onCombineError();
            }
        };
    }

    private void onCombineError() {
        Log.d(TAG, "combineError");
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentFullScreen.this.quitLiveRecordPreview(false);
            }
        });
    }

    private void onCombineSuccess() {
        Log.d(TAG, "combineSuccess");
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentFullScreen.this.quitLiveRecordPreview(true);
            }
        });
    }

    private void onPlayCompleted() {
        this.mHandler.post(new Runnable() {
            public void run() {
                FragmentFullScreen.this.mPreviewStart.setVisibility(0);
            }
        });
    }

    public void onClick(View view) {
        int id = view.getId();
        if (id != R.id.live_preview_play) {
            switch (id) {
                case R.id.live_preview_back /*2131558490*/:
                    quitLiveRecordPreview(false);
                    return;
                case R.id.live_preview_save_circle /*2131558491*/:
                case R.id.live_preview_save /*2131558492*/:
                    if (this.mConcatReady) {
                        setProgressBarVisible();
                        startSave();
                        return;
                    }
                    Log.d(TAG, "concat not finished, show save progress and wait to save");
                    this.mPreviewSave.setVisibility(8);
                    setProgressBarVisible();
                    return;
                default:
                    return;
            }
        } else if (this.mConcatReady) {
            startPlay();
        } else {
            Log.d(TAG, "concat not finished, show play progress");
            this.mPreviewStart.setVisibility(8);
            this.mConcatProgress.setVisibility(0);
        }
    }

    private void startPlay() {
        this.mPreviewStart.setVisibility(8);
        this.mPreviewSurface.setVisibility(0);
        ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).startPlay();
    }

    private void startSave() {
        this.mPreviewSave.setVisibility(8);
        setProgressBarVisible();
        ((LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209)).combineVideoAudio(this.mSaveContentValues.getAsString("_data"), this.mCombineListener, this.mErrorListener);
    }

    private void setProgressBarVisible() {
        this.mSaveProgress.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        this.mSaveProgress.setVisibility(0);
        ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f});
        ofFloat.setDuration(300);
        ofFloat.setStartDelay(160);
        ofFloat.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f));
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Float f = (Float) valueAnimator.getAnimatedValue();
                FragmentFullScreen.this.mSaveProgress.setAlpha(f.floatValue());
                FragmentFullScreen.this.mSaveProgress.setScaleX((f.floatValue() * 0.1f) + 0.9f);
                FragmentFullScreen.this.mSaveProgress.setScaleY(0.9f + (0.1f * f.floatValue()));
            }
        });
        ofFloat.start();
    }

    public boolean onBackEvent(int i) {
        if (i == 2 || this.mLiveViewLayout == null || this.mLiveViewLayout.getVisibility() != 0) {
            return false;
        }
        quitLiveRecordPreview(false);
        return true;
    }

    public boolean isLiveRecordPreviewShown() {
        return this.mLiveViewLayout != null && this.mLiveViewLayout.getVisibility() == 0;
    }
}
