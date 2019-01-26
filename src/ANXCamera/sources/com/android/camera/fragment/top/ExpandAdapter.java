package com.android.camera.fragment.top;

import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.fragment.CommonRecyclerViewHolder;

public class ExpandAdapter extends Adapter<CommonRecyclerViewHolder> implements OnClickListener {
    private ComponentData mComponentData;
    private int mCurrentMode = ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode();
    private String mCurrentValue = this.mComponentData.getComponentValue(this.mCurrentMode);
    private ExpandListener mExpandListener;

    public interface ExpandListener {
        ImageView getTopImage(int i);

        void onExpandValueChange(ComponentData componentData, String str);
    }

    public ExpandAdapter(ComponentData componentData, ExpandListener expandListener) {
        this.mComponentData = componentData;
        this.mExpandListener = expandListener;
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new CommonRecyclerViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.grid_setting_expanded_text_item, viewGroup, false));
    }

    public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(i);
        String str = componentDataItem.mValue;
        commonRecyclerViewHolder.itemView.setOnClickListener(this);
        commonRecyclerViewHolder.itemView.setTag(str);
        final TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.text);
        textView.setText(commonRecyclerViewHolder.itemView.getResources().getString(componentDataItem.mDisplayNameRes));
        if (this.mCurrentValue.equals(componentDataItem.mValue)) {
            textView.setShadowLayer(0.0f, 0.0f, 0.0f, 0);
            textView.setBackgroundResource(R.drawable.bg_top_expanded_selected);
            if (Util.isAccessible()) {
                final String string = commonRecyclerViewHolder.itemView.getResources().getString(R.string.accessibility_selected);
                textView.postDelayed(new Runnable() {
                    public void run() {
                        TextView textView = textView;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append(textView.getText());
                        stringBuilder.append(", ");
                        stringBuilder.append(string);
                        textView.setContentDescription(stringBuilder.toString());
                        textView.sendAccessibilityEvent(128);
                    }
                }, 100);
                return;
            }
            return;
        }
        textView.setShadowLayer(4.0f, 0.0f, 0.0f, -1073741824);
        textView.setBackground(null);
    }

    public int getItemCount() {
        return this.mComponentData.getItems().size();
    }

    public void onClick(View view) {
        String str = (String) view.getTag();
        if (str != null && !str.equals(this.mCurrentValue)) {
            this.mCurrentValue = str;
            this.mComponentData.setComponentValue(this.mCurrentMode, str);
            notifyDataSetChanged();
            if (this.mExpandListener != null) {
                this.mExpandListener.onExpandValueChange(this.mComponentData, str);
                this.mExpandListener = null;
            }
        }
    }
}
