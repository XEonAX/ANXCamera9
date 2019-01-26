package com.android.camera.fragment.manually.adapter;

import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.ui.ColorImageView;

public class ExtraRecyclerViewAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private int mItemWidth;
    private ManuallyListener mManuallyListener;

    public ExtraRecyclerViewAdapter(ComponentData componentData, int i, ManuallyListener manuallyListener, int i2) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mItemWidth = i2;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_manually_extra_item, viewGroup, false);
        inflate.getLayoutParams().width = this.mItemWidth;
        return new CommonRecyclerViewHolder(inflate);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        int i2;
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(i);
        String str = componentDataItem.mValue;
        commonRecyclerViewHolder.itemView.setOnClickListener(this);
        commonRecyclerViewHolder.itemView.setTag(str);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.extra_item_text);
        ColorImageView colorImageView = (ColorImageView) commonRecyclerViewHolder.getView(R.id.extra_item_image);
        if (componentDataItem.mIconRes != -1) {
            colorImageView.setVisibility(0);
            colorImageView.setImageResource(componentDataItem.mIconRes);
            textView.setTextSize(0, (float) commonRecyclerViewHolder.itemView.getResources().getDimensionPixelSize(R.dimen.grid_setting_item_textSize));
        } else {
            colorImageView.setVisibility(8);
            textView.setTextSize(0, (float) commonRecyclerViewHolder.itemView.getResources().getDimensionPixelSize(R.dimen.grid_text_only_setting_item_textSize));
        }
        if (componentDataItem.mDisplayNameRes != -2) {
            textView.setVisibility(0);
            textView.setText(componentDataItem.mDisplayNameRes);
            colorImageView.setPadding(0, 0, 0, commonRecyclerViewHolder.itemView.getResources().getDimensionPixelSize(R.dimen.manually_item_image_padding_bottom));
        } else {
            colorImageView.setPadding(0, 0, 0, 0);
            textView.setVisibility(8);
        }
        if (str.equals(this.mCurrentValue)) {
            i2 = ColorConstant.COLOR_COMMON_SELECTED;
        } else {
            i2 = ColorConstant.COLOR_COMMON_NORMAL;
        }
        colorImageView.setColor(i2);
        textView.setTextColor(i2);
    }

    public int getItemCount() {
        return this.mComponentData.getItems().size();
    }

    public int getValuePosition() {
        int itemCount = getItemCount();
        for (int i = 0; i < itemCount; i++) {
            if (this.mCurrentValue.equals(((ComponentDataItem) this.mComponentData.getItems().get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }

    public void onClick(View view) {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            String str = (String) view.getTag();
            if (couldNewValueTakeEffect(str)) {
                this.mComponentData.setComponentValue(this.mCurrentMode, str);
                notifyDataSetChanged();
                if (this.mManuallyListener != null) {
                    this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, str, false);
                }
                this.mCurrentValue = str;
            }
        }
    }

    protected boolean couldNewValueTakeEffect(String str) {
        return (str == null || str.equals(this.mCurrentValue)) ? false : true;
    }
}
