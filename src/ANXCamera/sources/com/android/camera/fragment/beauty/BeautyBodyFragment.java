package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ColorImageView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import java.util.ArrayList;
import java.util.List;

public class BeautyBodyFragment extends BaseBeautyMakeupFragment {
    private ColorImageView mHeaderImageView;

    protected List<MakeupItem> initItems() {
        List<MakeupItem> arrayList = new ArrayList();
        arrayList.add(new MakeupItem(R.drawable.icon_head_slim, R.string.beauty_body_head, CameraBeautyParameterType.HEAD_SLIM_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_body_slim, R.string.beauty_body_body, CameraBeautyParameterType.BODY_SLIM_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_shoulder_slim, R.string.beauty_body_shoulder, CameraBeautyParameterType.SHOULDER_SLIM_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_leg_slim, R.string.beauty_body_legged, CameraBeautyParameterType.LEG_SLIM_RATIO));
        return arrayList;
    }

    protected void onAdapterItemClick(MakeupItem makeupItem) {
        BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyParamType);
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected();
        }
        CameraStatUtil.trackBeautyBodyCounter(makeupItem.getCameraBeautyParameterType().beautyParamType);
    }

    protected void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    super.onAnimationEnd(view);
                    BeautyBodyFragment.this.mHeaderImageView.setRotation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                }
            }).start();
        }
        BeautyHelper.resetBeauty();
        this.mSelectedParam = 0;
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mLayoutManager.scrollToPosition(this.mSelectedParam);
        reSelectItem();
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected();
        }
        this.mMakeupAdapter.notifyDataSetChanged();
        toast(getResources().getString(R.string.beauty_body_reset_tip));
        CameraStatUtil.trackBeautyBodyCounter(Type.BEAUTY_RESET);
    }

    protected View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        this.mHeaderImageView = (ColorImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        ((TextView) inflate.findViewById(R.id.makeup_item_name)).setText(R.string.beauty_reset);
        return inflate;
    }

    protected String getClassString() {
        return BeautyBodyFragment.class.getSimpleName();
    }

    private void reSelectItem() {
        if (this.mItemList != null && this.mSelectedParam < this.mItemList.size()) {
            MakeupItem makeupItem = (MakeupItem) this.mItemList.get(this.mSelectedParam);
            BeautyHelper.setCurrentBeautyParameterType(makeupItem.getCameraBeautyParameterType());
            BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyParamType);
        }
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            if (!z && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                baseDelegate.delegateEvent(3);
            } else if (z && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) != 252) {
                reSelectItem();
                baseDelegate.delegateEvent(3);
            }
        }
    }
}
