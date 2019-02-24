package com.android.camera.fragment.beauty;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.widget.SeekBar;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.ui.SeekBarCompat;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatChangeListener;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatTouchListener;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.List;

public class FragmentPopupMakeup extends BaseFragment implements MakeupProtocol, Consumer<Integer> {
    public static final int FRAGMENT_INFO = 252;
    private static final int INTERVAL = 5;
    private static int SEEKBAR_PROGRESS_MAX = 100;
    private static final int SEEKBAR_PROGRESS_RATIO = 1;
    private int mActiveProgress;
    private Disposable mDisposable;
    private FlowableEmitter<Integer> mFlowableEmitter;
    private boolean mIsRTL;
    private boolean mIsShow;
    private View mRootView;
    private SeekBarCompat mSeekBar;

    protected void initView(View view) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mRootView = view;
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources()) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
        view.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
            }
        });
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> flowableEmitter) throws Exception {
                FragmentPopupMakeup.this.mFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.computation()).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer num) throws Exception {
                String str = Log.VIEW_TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("seekbar change too fast :");
                stringBuilder.append(num.toString());
                Log.e(str, stringBuilder.toString());
            }
        }).subscribe((Consumer) this);
        this.mActiveProgress = BeautyHelper.getProgress() * 1;
        this.mSeekBar = (SeekBarCompat) view.findViewById(R.id.makeup_params_level);
        CameraBeautyParameterType currentBeautyParameterType = BeautyHelper.getCurrentBeautyParameterType();
        Type type = currentBeautyParameterType.beautyParamType;
        if (type != null ? BeautyParameters.isSupportTwoWayAdjustable(type) : false) {
            setSeekBarMode(2);
        } else {
            setSeekBarMode(1);
        }
        if (currentBeautyParameterType.beautyType == 4) {
            view.setVisibility(8);
        }
        this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
        this.mSeekBar.setOnSeekBarChangeListener(new OnSeekBarCompatChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                if (i == 0 || i == FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX || Math.abs(i - FragmentPopupMakeup.this.mActiveProgress) > 5) {
                    FragmentPopupMakeup.this.mActiveProgress = i;
                    FragmentPopupMakeup.this.mFlowableEmitter.onNext(Integer.valueOf(i / 1));
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        this.mSeekBar.setOnSeekBarCompatTouchListener(new OnSeekBarCompatTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                switch (motionEvent.getAction()) {
                    case 0:
                        if (!FragmentPopupMakeup.this.mSeekBar.getThumb().getBounds().contains((int) motionEvent.getX(), (int) motionEvent.getY())) {
                            return true;
                        }
                        break;
                    case 1:
                    case 2:
                        break;
                    default:
                        return false;
                }
                FragmentPopupMakeup.this.mSeekBar.setProgress(getNextProgress(motionEvent));
                return true;
            }

            private int getNextProgress(MotionEvent motionEvent) {
                int width = FragmentPopupMakeup.this.mSeekBar.getWidth();
                width = (int) (((FragmentPopupMakeup.this.mIsRTL ? ((float) width) - motionEvent.getX() : motionEvent.getX()) / ((float) width)) * ((float) FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX));
                if (!FragmentPopupMakeup.this.mSeekBar.isCenterSeekBarMode()) {
                    return Util.clamp(width, 0, FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX);
                }
                if (motionEvent.getAction() == 2 || motionEvent.getAction() == 1) {
                    if (width >= FragmentPopupMakeup.this.centerSeekbarValueMap(-5) && width <= FragmentPopupMakeup.this.centerSeekbarValueMap(5) && width != FragmentPopupMakeup.this.centerSeekbarValueMap(0)) {
                        width = FragmentPopupMakeup.this.centerSeekbarValueMap(0);
                    } else if (width <= FragmentPopupMakeup.this.centerSeekbarValueMap(-95) && width != FragmentPopupMakeup.this.centerSeekbarValueMap(-100)) {
                        width = FragmentPopupMakeup.this.centerSeekbarValueMap(-100);
                    } else if (width >= FragmentPopupMakeup.this.centerSeekbarValueMap(95) && width != FragmentPopupMakeup.this.centerSeekbarValueMap(100)) {
                        width = FragmentPopupMakeup.this.centerSeekbarValueMap(100);
                    }
                }
                return Util.clamp(width, 0, FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX) - (FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX / 2);
            }
        });
    }

    private int centerSeekbarValueMap(int i) {
        return i + (SEEKBAR_PROGRESS_MAX / 2);
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(180, this);
        this.mIsShow = true;
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(180, this);
        if (!(this.mDisposable == null || this.mDisposable.isDisposed())) {
            this.mDisposable.dispose();
        }
        this.mIsShow = false;
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_popup_makeup;
    }

    public int getFragmentInto() {
        return 252;
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        i = (i == 163 || i == 165) ? 1 : -1;
        if (getView().getTag() == null || ((Integer) getView().getTag()).intValue() != i) {
            getView().setTag(Integer.valueOf(i));
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                i = -1;
            }
            if (i == 1) {
                if (getView().getVisibility() != 0) {
                    getView().setVisibility(0);
                }
                if (list == null) {
                    SlideInOnSubscribe.directSetResult(this.mSeekBar, 80);
                } else {
                    list.add(Completable.create(new SlideInOnSubscribe(this.mSeekBar, 80)));
                }
            } else if (list == null) {
                SlideOutOnSubscribe.directSetResult(this.mSeekBar, 80);
            } else {
                list.add(Completable.create(new SlideOutOnSubscribe(this.mSeekBar, 80)));
            }
        }
    }

    protected Animation provideEnterAnimation(int i) {
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(162);
    }

    public void onMakeupItemSelected() {
        CameraBeautyParameterType currentBeautyParameterType = BeautyHelper.getCurrentBeautyParameterType();
        if (BeautyParameters.isSupportTwoWayAdjustable(currentBeautyParameterType.beautyParamType)) {
            setSeekBarMode(2);
        } else {
            setSeekBarMode(1);
        }
        if (currentBeautyParameterType.beautyType == 4) {
            this.mRootView.setVisibility(8);
        } else {
            this.mRootView.setVisibility(0);
        }
    }

    public void setSeekBarMode(int i) {
        boolean z = false;
        switch (i) {
            case 1:
                SEEKBAR_PROGRESS_MAX = 100;
                this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
                break;
            case 2:
                SEEKBAR_PROGRESS_MAX = 200;
                this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.center_seekbar_style));
                z = true;
                break;
        }
        this.mSeekBar.setMax(SEEKBAR_PROGRESS_MAX);
        this.mSeekBar.setCenterSeekbarMode(z);
        this.mSeekBar.setProgress(BeautyHelper.getProgress() * 1);
    }

    public void accept(@NonNull Integer num) throws Exception {
        BeautyHelper.setProgress(num.intValue());
    }

    public boolean isShow() {
        return this.mIsShow;
    }
}
