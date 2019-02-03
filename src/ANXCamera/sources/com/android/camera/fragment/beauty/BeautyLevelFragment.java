package com.android.camera.fragment.beauty;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import java.util.List;

public abstract class BeautyLevelFragment extends BaseBeautyFragment {
    private RecyclerView mLevelItemList;
    private SingleCheckAdapter mSingleCheckAdapter;

    public class MyLayoutManager extends LinearLayoutManager {
        public MyLayoutManager(Context context) {
            super(context);
        }

        public void onMeasure(Recycler recycler, State state, int i, int i2) {
            View viewForPosition = recycler.getViewForPosition(0);
            if (viewForPosition != null) {
                measureChild(viewForPosition, i, i2);
                setMeasuredDimension(MeasureSpec.getSize(i), viewForPosition.getMeasuredHeight());
            }
        }
    }

    abstract void onLevelClick(AdapterView<?> adapterView, View view, int i, long j);

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_beauty_level, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    private void initView(View view) {
        this.mLevelItemList = (RecyclerView) view.findViewById(R.id.beauty_level_item_list);
        LayoutManager myLayoutManager = new MyLayoutManager(getActivity());
        myLayoutManager.setOrientation(0);
        this.mLevelItemList.setLayoutManager(myLayoutManager);
        this.mLevelItemList.setFocusable(false);
        List initBeautyItems = initBeautyItems();
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mLevelItemList.getLayoutParams();
        int provideItemHorizontalMargin = provideItemHorizontalMargin();
        marginLayoutParams.setMarginStart((getResources().getDisplayMetrics().widthPixels - ((getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_size) + (provideItemHorizontalMargin * 2)) * initBeautyItems.size())) / 2);
        this.mSingleCheckAdapter = new SingleCheckAdapter(getActivity(), initBeautyItems, provideItemHorizontalMargin);
        this.mSingleCheckAdapter.setOnItemClickListener(initOnItemClickListener());
        this.mSingleCheckAdapter.setSelectedPosition(beautyLevelToPosition(CameraSettings.getBeautyShowLevel(), initBeautyItems.size() - 1));
        this.mLevelItemList.setAdapter(this.mSingleCheckAdapter);
        this.mSingleCheckAdapter.notifyDataSetChanged();
    }

    protected List<LevelItem> initBeautyItems() {
        return null;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_margin);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                BeautyLevelFragment.this.onLevelClick(adapterView, view, i, j);
            }
        };
    }

    protected int beautyLevelToPosition(int i, int i2) {
        return Util.clamp(i, 0, i2);
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z) {
            if (this.mSingleCheckAdapter != null) {
                this.mSingleCheckAdapter.setEnableClick(true);
            }
        } else if (this.mSingleCheckAdapter != null) {
            this.mSingleCheckAdapter.setEnableClick(false);
        }
    }

    protected View getAnimateView() {
        return this.mLevelItemList;
    }

    public void setEnableClick(boolean z) {
        if (this.mSingleCheckAdapter != null) {
            this.mSingleCheckAdapter.setEnableClick(z);
        }
    }
}
