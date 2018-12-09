package com.android.camera.fragment.manually.adapter;

import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.fragment.manually.ManuallyListener;

public class ManuallySingleAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private ManuallyListener mManuallyListener;

    public ManuallySingleAdapter(ComponentData componentData, int i, ManuallyListener manuallyListener, int i2) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_manually_item, viewGroup, false);
        inflate.getLayoutParams().width = inflate.getResources().getDisplayMetrics().widthPixels / getItemCount();
        return new CommonRecyclerViewHolder(inflate);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        int i2;
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(i);
        String str = componentDataItem.mValue;
        commonRecyclerViewHolder.itemView.setOnClickListener(this);
        commonRecyclerViewHolder.itemView.setTag(str);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.manually_item_key);
        commonRecyclerViewHolder.getView(R.id.manually_item_value).setVisibility(8);
        commonRecyclerViewHolder.getView(R.id.manually_item_value_image).setVisibility(8);
        textView.setText(componentDataItem.mDisplayNameRes);
        if (str.equals(this.mCurrentValue)) {
            i2 = ColorConstant.COLOR_COMMON_SELECTED;
        } else {
            i2 = ColorConstant.COLOR_COMMON_NORMAL;
        }
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
        String str = (String) view.getTag();
        if (str != null && !str.equals(this.mCurrentValue)) {
            this.mComponentData.setComponentValue(this.mCurrentMode, str);
            notifyDataSetChanged();
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, str, false);
            }
            this.mCurrentValue = str;
        }
    }
}
