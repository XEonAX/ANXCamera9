package com.android.camera.fragment;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.widget.ImageView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.data.DataRepository;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;

public class FragmentBottomIntentDone extends BaseFragment implements OnClickListener, HandleBackTrace {
    public static final int FRAGMENT_INFO = 4083;
    private ImageView mApplyView;
    private View mMainView;
    private ImageView mRetryView;

    protected void initView(View view) {
        this.mMainView = view;
        ((MarginLayoutParams) view.getLayoutParams()).height = Util.getBottomHeight(getResources());
        adjustViewBackground(this.mMainView, this.mCurrentMode);
        this.mRetryView = (ImageView) view.findViewById(R.id.intent_done_retry);
        this.mApplyView = (ImageView) view.findViewById(R.id.intent_done_apply);
        this.mRetryView.setOnClickListener(this);
        this.mApplyView.setOnClickListener(this);
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

    protected int getLayoutResourceId() {
        return R.layout.fragment_bottom_intent_done;
    }

    public int getFragmentInto() {
        return 4083;
    }

    public void onClick(View view) {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction != null) {
            switch (view.getId()) {
                case R.id.intent_done_retry /*2131558445*/:
                    cameraAction.onReviewCancelClicked();
                    break;
                case R.id.intent_done_apply /*2131558446*/:
                    cameraAction.onReviewDoneClicked();
                    break;
            }
        }
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
    }

    protected Animation provideEnterAnimation(int i) {
        return FragmentAnimationFactory.wrapperAnimation(167, 161);
    }

    protected Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(168, 162);
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        switch (i) {
            case 2:
                adjustViewBackground(this.mMainView, this.mCurrentMode);
                return;
            case 3:
                adjustViewBackground(this.mMainView, this.mCurrentMode);
                return;
            default:
                return;
        }
    }

    public boolean onBackEvent(int i) {
        if (i != 1 || !canProvide()) {
            return false;
        }
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction != null) {
            cameraAction.onReviewCancelClicked();
            return true;
        }
        return false;
    }
}
