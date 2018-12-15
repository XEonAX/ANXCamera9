package com.android.camera.fragment;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemAnimator;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.ComponentRunningLighting;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.ui.ColorImageView;

public class FragmentLighting extends BaseFragment implements OnClickListener {
    private ComponentRunningLighting mComponentRunningLighting;
    private int mCurrentIndex = 0;
    private int mHolderWidth;
    private int mLastIndex = 0;
    private LinearLayoutManager mLayoutManager;
    private LightingAdapter mLightingAdapter;
    private RecyclerView mRecyclerView;
    private int mTotalWidth;

    private static class LightingAdapter extends Adapter<CommonRecyclerViewHolder> {
        private int mBgAlpha = 255;
        private Drawable mBgNormal;
        private Drawable mBgSelected;
        private ComponentRunningLighting mComponentRunningLighting;
        private String[] mContent;
        private int mCount;
        private int mCurrentMode;
        private int mMargin;
        private OnClickListener mOnClickListener;

        public LightingAdapter(Context context, int i, OnClickListener onClickListener, ComponentRunningLighting componentRunningLighting) {
            this.mCurrentMode = i;
            this.mOnClickListener = onClickListener;
            this.mComponentRunningLighting = componentRunningLighting;
            this.mCount = this.mComponentRunningLighting.getItems().size();
            this.mMargin = context.getResources().getDimensionPixelSize(R.dimen.lighting_item_margin);
            this.mBgNormal = context.getResources().getDrawable(R.drawable.bg_lighting_normal);
            this.mBgSelected = context.getResources().getDrawable(R.drawable.bg_lighting_selected);
            updateContent(context);
        }

        public void updateLightingData(Context context, ComponentRunningLighting componentRunningLighting) {
            this.mComponentRunningLighting = componentRunningLighting;
            this.mCount = this.mComponentRunningLighting.getItems().size();
            updateContent(context);
            notifyDataSetChanged();
        }

        private void updateContent(Context context) {
            if (Util.isAccessible() || Util.isSetContentDesc()) {
                this.mContent = new String[this.mCount];
                for (int i = 0; i < this.mCount; i++) {
                    this.mContent[i] = context.getString(((ComponentDataItem) this.mComponentRunningLighting.getItems().get(i)).mDisplayNameRes);
                }
            }
        }

        public void setBgMode(boolean z) {
            if (z) {
                this.mBgAlpha = 102;
            } else {
                this.mBgAlpha = 255;
            }
            this.mBgNormal.setAlpha(this.mBgAlpha);
        }

        public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new CommonRecyclerViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_lighting_item, viewGroup, false));
        }

        public void onBindViewHolder(CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) commonRecyclerViewHolder.itemView.getLayoutParams();
            ColorImageView colorImageView = (ColorImageView) commonRecyclerViewHolder.getView(R.id.lighting_item_base);
            ColorImageView colorImageView2 = (ColorImageView) commonRecyclerViewHolder.getView(R.id.lighting_item_image);
            String componentValue = this.mComponentRunningLighting.getComponentValue(this.mCurrentMode);
            ComponentDataItem componentDataItem = (ComponentDataItem) this.mComponentRunningLighting.getItems().get(i);
            if (Util.isAccessible() || Util.isSetContentDesc()) {
                colorImageView2.setContentDescription(this.mContent[i]);
            }
            if (componentValue.equals(componentDataItem.mValue)) {
                colorImageView.setBackground(this.mBgSelected);
                colorImageView2.setImageResource(componentDataItem.mIconSelectedRes);
            } else {
                colorImageView.setBackground(this.mBgNormal);
                colorImageView2.setImageResource(componentDataItem.mIconRes);
            }
            marginLayoutParams.setMarginStart(this.mMargin);
            if (i < getItemCount() - 1) {
                marginLayoutParams.setMarginEnd(0);
            } else {
                marginLayoutParams.setMarginEnd(this.mMargin);
            }
            colorImageView.setOnClickListener(this.mOnClickListener);
            colorImageView.setTag(Integer.valueOf(i));
        }

        public int getItemCount() {
            return this.mCount;
        }
    }

    protected void initView(View view) {
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.lighting_list);
        this.mComponentRunningLighting = DataRepository.dataItemRunning().getComponentRunningLighting();
        this.mLightingAdapter = new LightingAdapter(getContext(), this.mCurrentMode, this, this.mComponentRunningLighting);
        this.mLayoutManager = new LinearLayoutManager(getContext(), 0, false);
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        this.mRecyclerView.setAdapter(this.mLightingAdapter);
        ItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mRecyclerView.setItemAnimator(defaultItemAnimator);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        this.mHolderWidth = getResources().getDimensionPixelSize(R.dimen.lighting_item_height);
        try {
            this.mCurrentIndex = Integer.valueOf(this.mComponentRunningLighting.getComponentValue(this.mCurrentMode)).intValue();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_lighting;
    }

    public int getFragmentInto() {
        return BaseFragmentDelegate.FRAGMENT_LIGHTING;
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                onItemSelected(((Integer) view.getTag()).intValue(), true);
            }
        }
    }

    public void reInit() {
        reInitAdapterBgMode(false);
        setItemInCenter(this.mComponentRunningLighting.findIndexOfValue(this.mComponentRunningLighting.getComponentValue(this.mCurrentMode)));
    }

    public void reInitAdapterBgMode(boolean z) {
        if (DataRepository.dataItemRunning().getUiStyle() != 0) {
            this.mLightingAdapter.setBgMode(true);
        } else {
            this.mLightingAdapter.setBgMode(false);
        }
        if (z) {
            this.mComponentRunningLighting = DataRepository.dataItemRunning().getComponentRunningLighting();
            this.mComponentRunningLighting.initItems();
            this.mLightingAdapter.updateLightingData(getContext(), this.mComponentRunningLighting);
        }
    }

    private void setItemInCenter(int i) {
        this.mCurrentIndex = i;
        this.mLastIndex = i;
        int i2 = (this.mTotalWidth / 2) - (this.mHolderWidth / 2);
        this.mLightingAdapter.notifyDataSetChanged();
        this.mLayoutManager.scrollToPositionWithOffset(i, i2);
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x002a  */
    /* JADX WARNING: Removed duplicated region for block: B:14:? A:{SYNTHETIC, RETURN} */
    public void switchLighting(int r3) {
        /*
        r2 = this;
        r0 = 3;
        r1 = -1;
        if (r3 == r0) goto L_0x001e;
    L_0x0005:
        r0 = 5;
        if (r3 == r0) goto L_0x0009;
    L_0x0008:
        goto L_0x0027;
    L_0x0009:
        r3 = r2.mCurrentIndex;
        r0 = r2.mComponentRunningLighting;
        r0 = r0.getItems();
        r0 = r0.size();
        r0 = r0 + -1;
        if (r3 >= r0) goto L_0x0027;
    L_0x0019:
        r3 = r2.mCurrentIndex;
        r3 = r3 + 1;
        goto L_0x0028;
    L_0x001e:
        r3 = r2.mCurrentIndex;
        if (r3 <= 0) goto L_0x0027;
    L_0x0022:
        r3 = r2.mCurrentIndex;
        r3 = r3 + -1;
        goto L_0x0028;
    L_0x0027:
        r3 = r1;
    L_0x0028:
        if (r3 <= r1) goto L_0x002e;
    L_0x002a:
        r0 = 0;
        r2.onItemSelected(r3, r0);
    L_0x002e:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentLighting.switchLighting(int):void");
    }

    private void onItemSelected(int i, boolean z) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            String componentValue = this.mComponentRunningLighting.getComponentValue(this.mCurrentMode);
            String str = ((ComponentDataItem) this.mComponentRunningLighting.getItems().get(i)).mValue;
            if (!componentValue.equals(str)) {
                this.mComponentRunningLighting.setComponentValue(this.mCurrentMode, str);
                configChanges.setLighting(false, componentValue, str, true);
                this.mLastIndex = this.mCurrentIndex;
                this.mCurrentIndex = i;
                scrollIfNeed(i);
                notifyItemChanged(this.mLastIndex, this.mCurrentIndex);
            }
        }
    }

    private void notifyItemChanged(int i, int i2) {
        if (i > -1) {
            this.mLightingAdapter.notifyItemChanged(i);
        }
        if (i2 > -1) {
            this.mLightingAdapter.notifyItemChanged(i2);
        }
    }

    private void scrollIfNeed(int i) {
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
        } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mLightingAdapter.getItemCount() - 1));
        }
    }
}
