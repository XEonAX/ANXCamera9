package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import java.util.ArrayList;
import java.util.List;

public class MakeupParamsFragment extends BaseBeautyMakeupFragment {
    private ImageView mHeaderImageView;

    protected List<MakeupItem> initItems() {
        List<MakeupItem> arrayList = new ArrayList();
        arrayList.add(new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender, CameraBeautyParameterType.SHRINK_FACE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large, CameraBeautyParameterType.ENLARGE_EYE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white, CameraBeautyParameterType.WHITEN_STRENGTH));
        arrayList.add(new MakeupItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth, CameraBeautyParameterType.SMOOTH_STRENGTH));
        return arrayList;
    }

    protected void onAdapterItemClick(MakeupItem makeupItem) {
        if (makeupItem.getCameraBeautyParameterType().beautyType == 2) {
            BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyModelParameterType);
            MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
            if (makeupProtocol != null) {
                makeupProtocol.onMakeupItemSelected();
            }
        }
    }

    protected void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(0.0f);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    super.onAnimationEnd(view);
                    MakeupParamsFragment.this.mHeaderImageView.setRotation(0.0f);
                }
            }).start();
        }
        BeautyHelper.resetBeauty();
        BeautyHelper.setType(CameraBeautyParameterType.SHRINK_FACE_RATIO.beautyModelParameterType);
        this.mSelectedParam = 0;
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mLayoutManager.scrollToPosition(this.mSelectedParam);
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected();
        }
        this.mMakeupAdapter.notifyDataSetChanged();
        makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.setSeekBarMode(1);
        }
        toast(getResources().getString(R.string.beauty_mode_reset_toast));
    }

    protected View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        this.mHeaderImageView = (ImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        TextView textView = (TextView) inflate.findViewById(R.id.makeup_item_name);
        textView.setText(R.string.beauty_reset);
        textView.setTextColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_text_normal));
        return inflate;
    }

    protected void initView(View view) {
        super.initView(view);
        if (getUserVisibleHint()) {
            reSelectItem();
        }
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            if (!z && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) == 252) {
                baseDelegate.delegateEvent(3);
            } else if (z && baseDelegate.getActiveFragment(R.id.bottom_popup_beauty) != 252) {
                baseDelegate.delegateEvent(3);
            }
        }
    }

    protected void reSelectItem() {
        if (this.mItemList != null && this.mSelectedParam < this.mItemList.size()) {
            BeautyHelper.setType(((MakeupItem) this.mItemList.get(this.mSelectedParam)).getCameraBeautyParameterType().beautyModelParameterType);
        }
    }

    protected boolean isCustomWidth() {
        return true;
    }

    protected int customItemWidth() {
        if (isNeedScroll()) {
            return super.customItemWidth();
        }
        return getContext().getResources().getDimensionPixelSize(R.dimen.beautycamera_noscroll_makeup_item_width);
    }

    protected String getClassString() {
        return getClass().getSimpleName();
    }
}
