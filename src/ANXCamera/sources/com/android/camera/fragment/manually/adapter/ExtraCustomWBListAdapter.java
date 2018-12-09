package com.android.camera.fragment.manually.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.ui.ColorActivateTextView;
import com.android.camera.ui.ColorImageView;
import com.android.camera.ui.HorizontalListView;
import com.android.camera.ui.HorizontalListView.OnSingleTapDownListener;
import com.ss.android.medialib.Result.Error;

public class ExtraCustomWBListAdapter extends BaseAdapter implements OnItemClickListener, OnSingleTapDownListener {
    private static final int GAP_K_LONG_VALUE = 500;
    private static final int GAP_K_SHOT_VALUE = 200;
    private static final int MAX_K_VALUE = 8000;
    private static final int MIDDLE_K_VALUE = 6000;
    private static final int MIN_K_VALUE = 2000;
    private ManuallyListener mManuallyListener;
    private ComponentManuallyWB mManuallyWB;
    private boolean mOnCreated = true;

    private static class ViewHolder {
        private ColorImageView mColorImageView;
        private ColorActivateTextView mText;

        private ViewHolder() {
        }
    }

    public ExtraCustomWBListAdapter(ComponentManuallyWB componentManuallyWB, ManuallyListener manuallyListener) {
        this.mManuallyWB = componentManuallyWB;
        this.mManuallyListener = manuallyListener;
    }

    public int getCount() {
        return (getShotValueCount() + getLongValueCount()) + 1;
    }

    public int getShotValueCount() {
        return 20;
    }

    public int getLongValueCount() {
        return 4;
    }

    public long getItemId(int i) {
        return (long) i;
    }

    public Object getItem(int i) {
        return this.mManuallyWB.getItems().get(i);
    }

    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        CharSequence valueOf;
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
        int shotValueCount = getShotValueCount();
        if (i < shotValueCount) {
            valueOf = String.valueOf(2000 + (i * 200));
        } else {
            valueOf = String.valueOf(MIDDLE_K_VALUE + ((i - shotValueCount) * GAP_K_LONG_VALUE));
        }
        viewHolder.mText.setText(valueOf);
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
        adapterView.setSelection(i);
        changeValue(i);
    }

    private void changeValue(int i) {
        int shotValueCount = getShotValueCount();
        if (i < shotValueCount) {
            shotValueCount = 2000 + (i * 200);
        } else {
            shotValueCount = MIDDLE_K_VALUE + ((i - shotValueCount) * GAP_K_LONG_VALUE);
        }
        i = this.mManuallyWB.getCustomWB();
        if (shotValueCount != i) {
            this.mManuallyWB.setCustomWB(shotValueCount);
            if (this.mManuallyListener != null) {
                this.mManuallyListener.onManuallyDataChanged(this.mManuallyWB, String.valueOf(i), String.valueOf(shotValueCount), true);
            }
        }
    }

    public int getValuePosition() {
        int customWB = this.mManuallyWB.getCustomWB();
        if (customWB < MIDDLE_K_VALUE) {
            return (customWB + Error.SYN_UNINIT_FAILED) / 200;
        }
        return ((customWB - MIDDLE_K_VALUE) / GAP_K_LONG_VALUE) + getShotValueCount();
    }
}
