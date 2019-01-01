package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import java.util.ArrayList;
import java.util.List;

public class LiveBeautyModeFragment extends BaseBeautyMakeupFragment {
    private ImageView mHeaderImageView;

    protected List<MakeupItem> initItems() {
        List<MakeupItem> arrayList = new ArrayList();
        arrayList.add(new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender, CameraBeautyParameterType.LIVE_SHRINK_FACE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large, CameraBeautyParameterType.LIVE_ENLARGE_EYE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white, CameraBeautyParameterType.LIVE_WHITEN_STRENGTH));
        return arrayList;
    }

    protected void onAdapterItemClick(MakeupItem makeupItem) {
        if (makeupItem.getCameraBeautyParameterType().beautyType == 7) {
            BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyParamType);
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
                    LiveBeautyModeFragment.this.mHeaderImageView.setRotation(0.0f);
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
        toast(getResources().getString(R.string.beauty_reset_toast));
    }

    protected View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        LayoutParams layoutParams = (LayoutParams) ((LinearLayout) inflate.findViewById(R.id.makeup_item)).getLayoutParams();
        layoutParams.width = getResources().getDimensionPixelSize(R.dimen.live_beauty_list_heard_width);
        inflate.setLayoutParams(layoutParams);
        this.mHeaderImageView = (ImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        TextView textView = (TextView) inflate.findViewById(R.id.makeup_item_name);
        textView.setText(R.string.beauty_reset);
        textView.setTextColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_text_normal));
        return inflate;
    }

    protected String getClassString() {
        return LiveBeautyModeFragment.class.getSimpleName();
    }

    protected int getListItemMargin() {
        return super.getListItemMargin();
    }

    protected void setListPadding(RecyclerView recyclerView) {
        super.setListPadding(recyclerView);
        if (recyclerView != null) {
            recyclerView.setPadding(0, 0, 0, 0);
        }
    }

    protected boolean isCustomWidth() {
        return true;
    }

    protected int customItemWidth() {
        return getResources().getDimensionPixelSize(R.dimen.live_beauty_list_item_width);
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

    private void reSelectItem() {
        if (this.mItemList != null && this.mSelectedParam < this.mItemList.size()) {
            MakeupItem makeupItem = (MakeupItem) this.mItemList.get(this.mSelectedParam);
            BeautyHelper.setCurrentBeautyParameterType(makeupItem.getCameraBeautyParameterType());
            BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyParamType);
        }
    }
}
