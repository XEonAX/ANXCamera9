package com.android.camera.fragment.manually.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import com.aeonax.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.ui.ColorActivateTextView;
import com.android.camera.ui.ColorImageView;
import com.android.camera.ui.HorizontalListView;
import com.android.camera.ui.HorizontalListView.OnSingleTapDownListener;

public class ExtraHorizontalListAdapter extends BaseAdapter implements OnItemClickListener, OnSingleTapDownListener {
    private ComponentData mComponentData;
    private int mCurrentMode;
    private String mCurrentValue;
    private ManuallyListener mManuallyListener;
    private boolean mOnCreated = true;

    private static class ViewHolder {
        private ColorImageView mColorImageView;
        private ColorActivateTextView mText;

        private ViewHolder() {
        }
    }

    public ExtraHorizontalListAdapter(ComponentData componentData, int i, ManuallyListener manuallyListener) {
        this.mComponentData = componentData;
        this.mCurrentMode = i;
        this.mManuallyListener = manuallyListener;
        this.mCurrentValue = componentData.getComponentValue(this.mCurrentMode);
    }

    public int getCount() {
        return this.mComponentData.getItems().size();
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public Object getItem(int i) {
        return this.mComponentData.getItems().get(i);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        int i2 = ColorConstant.COLOR_COMMON_SELECTED;
        if (view == null) {
            view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_manually_extra_item, null);
            viewHolder = new ViewHolder();
            viewHolder.mColorImageView = (ColorImageView) view.findViewById(R.id.extra_item_image);
            viewHolder.mText = (ColorActivateTextView) view.findViewById(R.id.extra_item_text);
            viewHolder.mText.setNormalCor(ColorConstant.COLOR_COMMON_NORMAL);
            viewHolder.mText.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentData.getItems().get(i);
        String str = componentDataItem.mValue;
        if (componentDataItem.mIconRes != -1) {
            viewHolder.mColorImageView.setVisibility(0);
            viewHolder.mColorImageView.setImageResource(componentDataItem.mIconRes);
        } else {
            viewHolder.mColorImageView.setVisibility(8);
        }
        viewHolder.mText.setText(componentDataItem.mDisplayNameRes);
        if (!str.equals(this.mCurrentValue)) {
            i2 = ColorConstant.COLOR_COMMON_NORMAL;
        }
        viewHolder.mColorImageView.setColor(i2);
        return view;
    }

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        if (this.mOnCreated) {
            this.mOnCreated = false;
            return;
        }
        adapterView.setSelection(i);
        if (!((HorizontalListView) adapterView).isScrolling()) {
            changeValue(i);
        }
    }

    public void onSingleTapDown(AdapterView<?> adapterView, View view, int i, long j) {
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        if (cameraAction == null || !cameraAction.isDoingAction()) {
            adapterView.setSelection(i);
            changeValue(i);
        }
    }

    private void changeValue(int i) {
        String str = ((ComponentDataItem) this.mComponentData.getItems().get(i)).mValue;
        if (str != null && !str.equals(this.mCurrentValue)) {
            this.mComponentData.setComponentValue(this.mCurrentMode, str);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mComponentData, this.mCurrentValue, str, false);
            }
            this.mCurrentValue = str;
        }
    }

    public int getValuePosition() {
        int count = getCount();
        for (int i = 0; i < count; i++) {
            if (this.mCurrentValue.equals(((ComponentDataItem) this.mComponentData.getItems().get(i)).mValue)) {
                return i;
            }
        }
        return -1;
    }
}
