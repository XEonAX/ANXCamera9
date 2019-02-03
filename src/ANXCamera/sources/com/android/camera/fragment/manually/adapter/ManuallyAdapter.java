package com.android.camera.fragment.manually.adapter;

import android.support.annotation.StringRes;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import java.util.List;

public class ManuallyAdapter extends Adapter<CommonRecyclerViewHolder> {
    private List<ComponentData> mComponentDataList;
    private int mCurrentMode;
    private OnClickListener mOnClickListener;
    @StringRes
    private int mSelectedTitle;

    public ManuallyAdapter(int i, OnClickListener onClickListener, List<ComponentData> list) {
        this.mCurrentMode = i;
        this.mOnClickListener = onClickListener;
        this.mComponentDataList = list;
    }

    public void setSelectedTitle(@StringRes int i) {
        this.mSelectedTitle = i;
        notifyDataSetChanged();
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_manually_item, viewGroup, false);
        inflate.getLayoutParams().width = inflate.getResources().getDisplayMetrics().widthPixels / getItemCount();
        return new CommonRecyclerViewHolder(inflate);
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        int i2;
        ComponentData componentData = (ComponentData) this.mComponentDataList.get(i);
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        commonRecyclerViewHolder.itemView.setTag(componentData);
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.manually_item_key);
        if (componentData.getDisplayTitleString() > 0) {
            textView.setText(componentData.getDisplayTitleString());
        }
        if (componentData.getDisplayTitleString() == this.mSelectedTitle) {
            i2 = ColorConstant.COLOR_COMMON_SELECTED;
        } else {
            i2 = ColorConstant.COLOR_COMMON_NORMAL;
        }
        textView.setTextColor(i2);
        textView = (TextView) commonRecyclerViewHolder.getView(R.id.manually_item_value);
        ImageView imageView = (ImageView) commonRecyclerViewHolder.getView(R.id.manually_item_value_image);
        i2 = componentData.getValueDisplayString(this.mCurrentMode);
        if (i2 != -2) {
            textView.setVisibility(0);
            textView.setText(i2);
            imageView.setVisibility(8);
            return;
        }
        textView.setVisibility(8);
        imageView.setImageResource(componentData.getValueSelectedDrawable(this.mCurrentMode));
        imageView.setVisibility(0);
    }

    public int getItemCount() {
        return this.mComponentDataList.size();
    }
}
