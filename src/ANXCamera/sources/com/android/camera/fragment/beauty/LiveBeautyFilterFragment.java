package com.android.camera.fragment.beauty;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.ui.RoundImageView;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class LiveBeautyFilterFragment extends Fragment implements OnClickListener {
    public static final int LIVE_FILTER_NONE_ID = 0;
    private static final String TAG = LiveBeautyFilterFragment.class.getSimpleName();
    private boolean isAnimation = false;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private int mCurrentIndex = 0;
    private FilterItemAdapter mFilterItemAdapter;
    private List<LiveFilterItem> mFilters;
    private int mHolderWidth;
    private int mLastIndex = -1;
    private LinearLayoutManager mLayoutManager;
    private RecyclerView mRecyclerView;
    private int mTotalWidth;
    private View mView;

    protected class EffectItemPadding extends ItemDecoration {
        protected int mEffectListLeft;
        protected int mHorizontalPadding;
        protected int mVerticalPadding;

        public EffectItemPadding() {
            this.mHorizontalPadding = LiveBeautyFilterFragment.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_horizontal);
            this.mVerticalPadding = LiveBeautyFilterFragment.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_vertical);
            this.mEffectListLeft = LiveBeautyFilterFragment.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_list_padding_left);
        }

        public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
            rect.set(recyclerView.getChildPosition(view) == 0 ? this.mEffectListLeft : 0, this.mVerticalPadding, this.mHorizontalPadding, this.mVerticalPadding);
        }
    }

    protected class FilterItemAdapter extends Adapter {
        protected LayoutInflater mLayoutInflater;

        public FilterItemAdapter(Context context) {
            this.mLayoutInflater = LayoutInflater.from(context);
        }

        public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            View inflate = this.mLayoutInflater.inflate(R.layout.live_filter_item, viewGroup, false);
            FilterStillItemHolder filterStillItemHolder = new FilterStillItemHolder(inflate);
            inflate.setOnClickListener(LiveBeautyFilterFragment.this);
            return filterStillItemHolder;
        }

        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            LiveFilterItem liveFilterItem = (LiveFilterItem) LiveBeautyFilterFragment.this.mFilters.get(i);
            FilterItemHolder filterItemHolder = (FilterItemHolder) viewHolder;
            filterItemHolder.itemView.setTag(Integer.valueOf(i));
            filterItemHolder.bindEffectIndex(i, liveFilterItem);
        }

        public int getItemCount() {
            return LiveBeautyFilterFragment.this.mFilters.size();
        }
    }

    protected abstract class FilterItemHolder extends ViewHolder {
        protected int mEffectIndex;
        protected TextView mTextView;

        public FilterItemHolder(View view) {
            super(view);
            this.mTextView = (TextView) view.findViewById(R.id.effect_item_text);
        }

        public void bindEffectIndex(int i, LiveFilterItem liveFilterItem) {
            this.mEffectIndex = i;
            this.mTextView.setText(liveFilterItem.name);
        }
    }

    protected class FilterStillItemHolder extends FilterItemHolder {
        private RoundImageView mImageView;
        private ImageView mSelectedInnerIndicator;
        private ImageView mSelectedOuterIndicator;

        public FilterStillItemHolder(View view) {
            super(view);
            this.mImageView = (RoundImageView) view.findViewById(R.id.effect_item_image);
            this.mSelectedOuterIndicator = (ImageView) view.findViewById(R.id.effect_item_selected_indicator);
            this.mSelectedInnerIndicator = (ImageView) view.findViewById(R.id.effect_item_selected_inner_indicator);
        }

        public void bindEffectIndex(int i, LiveFilterItem liveFilterItem) {
            super.bindEffectIndex(i, liveFilterItem);
            this.mImageView.setImageDrawable(liveFilterItem.imageViewRes);
            if (i == LiveBeautyFilterFragment.this.mCurrentIndex) {
                this.itemView.setActivated(true);
                if (Util.isAccessible() || Util.isSetContentDesc()) {
                    this.itemView.postDelayed(new Runnable() {
                        public void run() {
                            if (LiveBeautyFilterFragment.this.isAdded()) {
                                FilterStillItemHolder.this.itemView.sendAccessibilityEvent(128);
                            }
                        }
                    }, 100);
                }
                if (LiveBeautyFilterFragment.this.isAnimation) {
                    selectAnim(this.mSelectedOuterIndicator);
                    selectAnim(this.mSelectedInnerIndicator);
                    return;
                }
                this.mSelectedOuterIndicator.setVisibility(0);
                this.mSelectedOuterIndicator.setAlpha(1.0f);
                this.mSelectedInnerIndicator.setVisibility(0);
                this.mSelectedInnerIndicator.setAlpha(1.0f);
                return;
            }
            this.itemView.setActivated(false);
            if (LiveBeautyFilterFragment.this.isAnimation && i == LiveBeautyFilterFragment.this.mLastIndex) {
                normalAnim(this.mSelectedOuterIndicator);
                normalAnim(this.mSelectedInnerIndicator);
                return;
            }
            this.mSelectedOuterIndicator.setVisibility(8);
            this.mSelectedOuterIndicator.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            this.mSelectedInnerIndicator.setVisibility(8);
            this.mSelectedInnerIndicator.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        }

        private void normalAnim(View view) {
            ViewCompat.setAlpha(view, 1.0f);
            ViewCompat.animate(view).setDuration(500).alpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO).setInterpolator(LiveBeautyFilterFragment.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                }

                public void onAnimationEnd(View view) {
                    view.setVisibility(8);
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
        }

        private void selectAnim(View view) {
            ViewCompat.setAlpha(this.mSelectedOuterIndicator, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            ViewCompat.animate(view).setDuration(500).alpha(1.0f).setInterpolator(LiveBeautyFilterFragment.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                public void onAnimationStart(View view) {
                    view.setVisibility(0);
                }

                public void onAnimationEnd(View view) {
                }

                public void onAnimationCancel(View view) {
                }
            }).start();
        }
    }

    public static class LiveFilterItem {
        public String directoryName;
        public int id;
        public Drawable imageViewRes;
        public String name;
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        if (this.mView == null) {
            this.mView = LayoutInflater.from(getContext()).inflate(R.layout.live_fragment_filter, null);
            initView();
            initData();
        }
        return this.mView;
    }

    private void initView() {
        this.mRecyclerView = (RecyclerView) this.mView.findViewById(R.id.effect_list);
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
        this.mFilterItemAdapter = new FilterItemAdapter(getContext());
        this.mLayoutManager = new LinearLayoutManager(getContext());
        this.mLayoutManager.setOrientation(0);
        this.mRecyclerView.getRecycledViewPool().setMaxRecycledViews(0, EffectController.getInstance().getEffectCount(1));
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        this.mRecyclerView.addItemDecoration(new EffectItemPadding());
        this.mRecyclerView.setAdapter(this.mFilterItemAdapter);
        this.mRecyclerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                super.onScrollStateChanged(recyclerView, i);
                LiveBeautyFilterFragment.this.isAnimation = false;
            }
        });
        DefaultItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mRecyclerView.setItemAnimator(defaultItemAnimator);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        this.mHolderWidth = getResources().getDimensionPixelSize(R.dimen.effect_item_width);
    }

    private void initData() {
        this.mFilters = EffectController.getInstance().getLiveFilterList(getContext());
        this.mCurrentIndex = findIndex(DataRepository.dataItemLive().getLiveFilter());
    }

    public void onViewCreated(@NonNull View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        int i = (this.mTotalWidth / 2) - (this.mHolderWidth / 2);
        this.mFilterItemAdapter.notifyDataSetChanged();
        this.mLayoutManager.scrollToPositionWithOffset(this.mCurrentIndex, i);
    }

    private int findIndex(int i) {
        for (int i2 = 0; i2 < this.mFilters.size(); i2++) {
            if (((LiveFilterItem) this.mFilters.get(i2)).id == i) {
                return i2;
            }
        }
        return 0;
    }

    public void onClick(View view) {
        if (this.mRecyclerView.isEnabled()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                int intValue = ((Integer) view.getTag()).intValue();
                if (this.mCurrentIndex != intValue) {
                    this.isAnimation = false;
                    LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
                    if (liveConfigChanges != null) {
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("filter_path:");
                        stringBuilder.append(((LiveFilterItem) this.mFilters.get(intValue)).directoryName);
                        Log.e(str, stringBuilder.toString());
                        if (intValue != 0) {
                            liveConfigChanges.setFilter(true, ((LiveFilterItem) this.mFilters.get(intValue)).directoryName);
                        } else {
                            liveConfigChanges.setFilter(false, null);
                        }
                        DataRepository.dataItemLive().setLiveFilter(((LiveFilterItem) this.mFilters.get(intValue)).id);
                    }
                    onItemSelected(intValue, true);
                }
            }
        }
    }

    private void onItemSelected(int i, boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onItemSelected: index = ");
        stringBuilder.append(i);
        stringBuilder.append(", fromClick = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        if (((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)) == null) {
            Log.e(TAG, "onItemSelected: configChanges = null");
            return;
        }
        try {
            selectItem(i);
        } catch (NumberFormatException e) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("invalid filter id: ");
            stringBuilder2.append(e.getMessage());
            Log.e(str2, stringBuilder2.toString());
        }
    }

    private void selectItem(int i) {
        if (i != -1) {
            this.mLastIndex = this.mCurrentIndex;
            this.mCurrentIndex = i;
            scrollIfNeed(i);
            notifyItemChanged(this.mLastIndex, this.mCurrentIndex);
        }
    }

    private void notifyItemChanged(int i, int i2) {
        if (i > -1) {
            this.mFilterItemAdapter.notifyItemChanged(i);
        }
        if (i2 > -1) {
            this.mFilterItemAdapter.notifyItemChanged(i2);
        }
    }

    private void scrollIfNeed(int i) {
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
        } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mFilterItemAdapter.getItemCount() - 1));
        }
    }

    private void showSelected(ImageView imageView, int i) {
        float dimension = getResources().getDimension(R.dimen.live_filter_item_mask_size);
        float dimension2 = getResources().getDimension(R.dimen.live_filter_item_corners_size);
        int i2 = (int) dimension;
        Bitmap createBitmap = Bitmap.createBitmap(i2, i2, Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        Paint paint = new Paint();
        paint.setColor(-16777216);
        canvas.drawRoundRect(new RectF(4.0f, 4.0f, dimension, dimension), dimension2, dimension2, paint);
        Bitmap decodeResource = BitmapFactory.decodeResource(getResources(), i);
        Bitmap createBitmap2 = Bitmap.createBitmap(createBitmap.getWidth(), createBitmap.getHeight(), Config.ARGB_8888);
        Canvas canvas2 = new Canvas(createBitmap2);
        Paint paint2 = new Paint();
        canvas2.drawBitmap(createBitmap, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, paint2);
        paint2.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
        canvas2.drawBitmap(decodeResource, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, paint2);
        paint2.setXfermode(null);
        imageView.setImageBitmap(createBitmap2);
    }
}
