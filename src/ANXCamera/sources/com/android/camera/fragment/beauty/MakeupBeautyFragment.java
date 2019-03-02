package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.ui.ColorImageView;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class MakeupBeautyFragment extends BaseBeautyMakeupFragment {
    private static final String TAG = "MakeupBeautyFragment";
    private ColorImageView mHeaderImageView;

    protected List<MakeupItem> initItems() {
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        List<MakeupItem> arrayList = new ArrayList();
        arrayList.add(new MakeupItem(R.drawable.icon_eyebrow_dye_n, R.string.edit_eyebrow_dye, CameraBeautyParameterType.EYEBROW_DYE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_pupil_line_n, R.string.edit_pupil_line, CameraBeautyParameterType.PUPIL_LINE_RATIO));
        arrayList.add(new MakeupItem(R.drawable.icon_jelly_lips_n, R.string.edit_jelly_lips, CameraBeautyParameterType.JELLY_LIPS_RATIO));
        if (1 == currentCameraId && DataRepository.dataItemFeature().fw()) {
            arrayList.add(new MakeupItem(R.drawable.icon_eye_light, R.string.eye_light, CameraBeautyParameterType.EYE_LIGHT));
        }
        arrayList.add(new MakeupItem(R.drawable.icon_blusher_n, R.string.edit_blusher, CameraBeautyParameterType.BLUSHER_RATIO));
        return arrayList;
    }

    protected void onAdapterItemClick(MakeupItem makeupItem) {
        if (makeupItem.getCameraBeautyParameterType().beautyType == 3) {
            BeautyHelper.setType(makeupItem.getCameraBeautyParameterType().beautyParamType);
            MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
            if (makeupProtocol != null) {
                makeupProtocol.onMakeupItemSelected();
            }
        } else if (makeupItem.getCameraBeautyParameterType().beautyType == 4 && makeupItem.getCameraBeautyParameterType().customParameterType == CameraBeautyParameterType.EYE_LIGHT.customParameterType) {
            ((MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194)).switchBeautyType(4);
        }
    }

    protected void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(0.0f);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    super.onAnimationEnd(view);
                    MakeupBeautyFragment.this.mHeaderImageView.setRotation(0.0f);
                }
            }).start();
        }
        CameraSettings.resetEyeLight();
        BeautyHelper.setType(CameraBeautyParameterType.EYEBROW_DYE_RATIO.beautyParamType);
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
        toast(getResources().getString(R.string.makeup_reset_toast));
    }

    protected View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        this.mHeaderImageView = (ColorImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        ((TextView) inflate.findViewById(R.id.makeup_item_name)).setText(R.string.beauty_reset);
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

    protected String getClassString() {
        return getClass().getSimpleName();
    }
}
