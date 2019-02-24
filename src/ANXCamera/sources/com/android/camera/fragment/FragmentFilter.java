package com.android.camera.fragment;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
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
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.config.ComponentConfigFilter;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

public class FragmentFilter extends BaseFragment implements OnClickListener {
    public static final int FRAGMENT_INFO = 250;
    private static final String TAG = FragmentFilter.class.getSimpleName();
    private boolean isAnimation = false;
    private ComponentConfigFilter mComponentConfigFilter;
    private CubicEaseOutInterpolator mCubicEaseOut;
    private int mCurrentIndex = -1;
    private EffectItemAdapter mEffectItemAdapter;
    private EffectItemPadding mEffectItemPadding;
    private int mHolderWidth;
    private boolean mIgnoreSameItemClick = true;
    private int mIsShowIndex = -1;
    private int mLastIndex = -1;
    private LinearLayoutManager mLayoutManager;
    private RecyclerView mRecyclerView;
    private int mTotalWidth;

    protected class EffectItemAdapter extends Adapter {
        protected ComponentConfigFilter mFilters;
        protected LayoutInflater mLayoutInflater;

        public EffectItemAdapter(Context context, ComponentConfigFilter componentConfigFilter) {
            this.mFilters = componentConfigFilter;
            this.mLayoutInflater = LayoutInflater.from(context);
        }

        public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            View inflate = this.mLayoutInflater.inflate(R.layout.effect_still_item, viewGroup, false);
            EffectStillItemHolder effectStillItemHolder = new EffectStillItemHolder(inflate);
            inflate.setOnClickListener(FragmentFilter.this);
            return effectStillItemHolder;
        }

        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            ComponentDataItem componentDataItem = (ComponentDataItem) this.mFilters.getItems().get(i);
            EffectItemHolder effectItemHolder = (EffectItemHolder) viewHolder;
            effectItemHolder.itemView.setTag(Integer.valueOf(i));
            effectItemHolder.bindEffectIndex(i, componentDataItem);
        }

        public int getItemCount() {
            return this.mFilters.getItems().size();
        }

        public void updateData(ComponentConfigFilter componentConfigFilter) {
            this.mFilters = componentConfigFilter;
            notifyDataSetChanged();
        }
    }

    protected abstract class EffectItemHolder extends ViewHolder {
        protected int mEffectIndex;
        protected TextView mTextView;

        public EffectItemHolder(View view) {
            super(view);
            this.mTextView = (TextView) view.findViewById(R.id.effect_item_text);
        }

        public void bindEffectIndex(int i, ComponentDataItem componentDataItem) {
            this.mEffectIndex = getRenderId(i, componentDataItem);
            this.mTextView.setText(componentDataItem.mDisplayNameRes);
        }

        protected int getRenderId(int i, ComponentDataItem componentDataItem) {
            return Integer.parseInt(componentDataItem.mValue);
        }
    }

    protected class EffectItemPadding extends ItemDecoration {
        protected int mEffectListLeft;
        protected int mHorizontalPadding;
        protected int mVerticalPadding;

        public EffectItemPadding() {
            this.mHorizontalPadding = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_horizontal);
            this.mVerticalPadding = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_item_padding_vertical);
            this.mEffectListLeft = FragmentFilter.this.getContext().getResources().getDimensionPixelSize(R.dimen.effect_list_padding_left);
        }

        public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
            rect.set(recyclerView.getChildPosition(view) == 0 ? this.mEffectListLeft : 0, this.mVerticalPadding, this.mHorizontalPadding, this.mVerticalPadding);
        }
    }

    protected class EffectStillItemHolder extends EffectItemHolder {
        private ImageView mImageView;
        private ImageView mSelectedIndicator;

        public EffectStillItemHolder(View view) {
            super(view);
            this.mImageView = (ImageView) view.findViewById(R.id.effect_item_image);
            this.mSelectedIndicator = (ImageView) view.findViewById(R.id.effect_item_selected_indicator);
        }

        public void bindEffectIndex(int i, ComponentDataItem componentDataItem) {
            super.bindEffectIndex(i, componentDataItem);
            this.mImageView.setImageResource(componentDataItem.mIconRes);
            if (i == FragmentFilter.this.mCurrentIndex) {
                this.itemView.setActivated(true);
                FragmentFilter.this.showSelected(this.mImageView, componentDataItem.mIconRes);
                if (Util.isAccessible() || Util.isSetContentDesc()) {
                    View view = this.itemView;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(FragmentFilter.this.getContext().getString(componentDataItem.mDisplayNameRes));
                    stringBuilder.append(FragmentFilter.this.getString(R.string.accessibility_selected));
                    view.setContentDescription(stringBuilder.toString());
                    this.itemView.postDelayed(new Runnable() {
                        public void run() {
                            if (FragmentFilter.this.isAdded()) {
                                EffectStillItemHolder.this.itemView.sendAccessibilityEvent(128);
                            }
                        }
                    }, 100);
                }
                if (FragmentFilter.this.isAnimation) {
                    ViewCompat.setAlpha(this.mSelectedIndicator, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
                    ViewCompat.animate(this.mSelectedIndicator).setDuration(500).alpha(1.0f).setInterpolator(FragmentFilter.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                        public void onAnimationStart(View view) {
                            EffectStillItemHolder.this.mSelectedIndicator.setVisibility(0);
                        }

                        public void onAnimationEnd(View view) {
                        }

                        public void onAnimationCancel(View view) {
                        }
                    }).start();
                    return;
                }
                this.mSelectedIndicator.setVisibility(0);
                this.mSelectedIndicator.setAlpha(1.0f);
                return;
            }
            this.itemView.setActivated(false);
            if (FragmentFilter.this.isAnimation && i == FragmentFilter.this.mLastIndex) {
                ViewCompat.setAlpha(this.mSelectedIndicator, 1.0f);
                ViewCompat.animate(this.mSelectedIndicator).setDuration(500).alpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO).setInterpolator(FragmentFilter.this.mCubicEaseOut).setListener(new ViewPropertyAnimatorListener() {
                    public void onAnimationStart(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        EffectStillItemHolder.this.mSelectedIndicator.setVisibility(8);
                    }

                    public void onAnimationCancel(View view) {
                    }
                }).start();
                return;
            }
            this.mSelectedIndicator.setVisibility(8);
            this.mSelectedIndicator.setAlpha(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        }
    }

    protected void initView(View view) {
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.effect_list);
        ArrayList filterInfo = getFilterInfo();
        this.mComponentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        this.mComponentConfigFilter.mapToItems(filterInfo);
        Context context = getContext();
        this.mTotalWidth = context.getResources().getDisplayMetrics().widthPixels;
        this.mHolderWidth = context.getResources().getDimensionPixelSize(R.dimen.effect_item_width);
        this.mEffectItemAdapter = new EffectItemAdapter(context, this.mComponentConfigFilter);
        this.mLayoutManager = new LinearLayoutManager(context);
        this.mLayoutManager.setOrientation(0);
        this.mRecyclerView.getRecycledViewPool().setMaxRecycledViews(0, EffectController.getInstance().getEffectCount(1));
        this.mRecyclerView.setLayoutManager(this.mLayoutManager);
        if (this.mEffectItemPadding == null) {
            this.mEffectItemPadding = new EffectItemPadding();
            this.mRecyclerView.addItemDecoration(this.mEffectItemPadding);
        }
        this.mRecyclerView.setAdapter(this.mEffectItemAdapter);
        this.mRecyclerView.addOnScrollListener(new OnScrollListener() {
            public void onScrollStateChanged(RecyclerView recyclerView, int i) {
                super.onScrollStateChanged(recyclerView, i);
                FragmentFilter.this.isAnimation = false;
            }
        });
        DefaultItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mRecyclerView.setItemAnimator(defaultItemAnimator);
        this.mCubicEaseOut = new CubicEaseOutInterpolator();
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        updateCurrentIndex();
    }

    private ArrayList<FilterInfo> getFilterInfo() {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        int i = 2;
        if (currentMode == 161) {
            i = 3;
        } else if (currentMode == 163 || currentMode == 165 ? !CameraSettings.isFrontCamera() : currentMode != 171) {
            i = 1;
        }
        return EffectController.getInstance().getFilterInfo(i);
    }

    public void isShowAnimation(List<Completable> list) {
        if (list == null) {
            this.isAnimation = false;
        } else {
            this.isAnimation = true;
        }
    }

    public void updateFilterData() {
        ArrayList filterInfo = getFilterInfo();
        this.mComponentConfigFilter = DataRepository.dataItemRunning().getComponentConfigFilter();
        this.mComponentConfigFilter.mapToItems(filterInfo);
        this.mEffectItemAdapter.updateData(this.mComponentConfigFilter);
        updateCurrentIndex();
    }

    private void updateCurrentIndex() {
        String componentValue = this.mComponentConfigFilter.getComponentValue(DataRepository.dataItemGlobal().getCurrentMode());
        int findIndexOfValue = this.mComponentConfigFilter.findIndexOfValue(componentValue);
        if (findIndexOfValue == -1) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid filter ");
            stringBuilder.append(componentValue);
            Log.w(str, stringBuilder.toString());
            findIndexOfValue = 0;
        }
        setItemInCenter(findIndexOfValue);
    }

    public void reInit() {
        setItemInCenter(this.mComponentConfigFilter.findIndexOfValue(this.mComponentConfigFilter.getComponentValue(this.mCurrentMode)));
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
    }

    private void setItemInCenter(int i) {
        this.mCurrentIndex = i;
        this.mIsShowIndex = i;
        int i2 = (this.mTotalWidth / 2) - (this.mHolderWidth / 2);
        this.mEffectItemAdapter.notifyDataSetChanged();
        this.mLayoutManager.scrollToPositionWithOffset(i, i2);
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
            this.mEffectItemAdapter.notifyItemChanged(i);
        }
        if (i2 > -1) {
            this.mEffectItemAdapter.notifyItemChanged(i2);
        }
    }

    private void scrollIfNeed(int i) {
        if (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.max(0, i - 1));
        } else if (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) {
            this.mLayoutManager.scrollToPosition(Math.min(i + 1, this.mEffectItemAdapter.getItemCount() - 1));
        }
    }

    public void onClick(View view) {
        Log.d(TAG, "onClick: ");
        if (this.mRecyclerView.isEnabled()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                int intValue = ((Integer) view.getTag()).intValue();
                if (this.mCurrentIndex != intValue || !this.mIgnoreSameItemClick) {
                    this.isAnimation = false;
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
        stringBuilder.append(", mCurrentMode = ");
        stringBuilder.append(this.mCurrentMode);
        stringBuilder.append(", DataRepository.dataItemGlobal().getCurrentMode() = ");
        stringBuilder.append(DataRepository.dataItemGlobal().getCurrentMode());
        Log.d(str, stringBuilder.toString());
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges == null) {
            Log.e(TAG, "onItemSelected: configChanges = null");
            return;
        }
        try {
            String str2 = ((ComponentDataItem) this.mComponentConfigFilter.getItems().get(i)).mValue;
            this.mComponentConfigFilter.setClosed(false, DataRepository.dataItemGlobal().getCurrentMode());
            int intValue = Integer.valueOf(str2).intValue();
            CameraStatUtil.trackFilterChanged(DataRepository.dataItemGlobal().getCurrentMode(), intValue, z);
            persistFilter(intValue);
            selectItem(i);
            configChanges.setFilter(intValue);
        } catch (NumberFormatException e) {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("invalid filter id: ");
            stringBuilder2.append(e.getMessage());
            Log.e(str3, stringBuilder2.toString());
        }
    }

    private void persistFilter(int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("persistFilter: filterId = ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        CameraSettings.setShaderEffect(i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:15:? A:{SYNTHETIC, RETURN} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void switchFilter(int i) {
        if (i != 3) {
            if (i != 5) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected gravity ");
                stringBuilder.append(i);
                Log.e(str, stringBuilder.toString());
            } else if (this.mCurrentIndex < this.mComponentConfigFilter.getItems().size() - 1) {
                i = this.mCurrentIndex + 1;
                if (i > -1) {
                    onItemSelected(i, false);
                    return;
                }
                return;
            }
        } else if (this.mCurrentIndex > 0) {
            i = this.mCurrentIndex - 1;
            if (i > -1) {
            }
        }
        i = -1;
        if (i > -1) {
        }
    }

    private void showSelected(ImageView imageView, int i) {
        Canvas canvas = new Canvas();
        Bitmap decodeResource = BitmapFactory.decodeResource(getResources(), R.drawable.filter_item_selected_view);
        Bitmap decodeResource2 = BitmapFactory.decodeResource(getResources(), i);
        Bitmap createBitmap = Bitmap.createBitmap(decodeResource.getWidth(), decodeResource.getHeight(), Config.ARGB_8888);
        canvas.setBitmap(createBitmap);
        Paint paint = new Paint();
        paint.setFilterBitmap(false);
        canvas.drawBitmap(decodeResource, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, paint);
        paint.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
        canvas.drawBitmap(decodeResource2, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, paint);
        paint.setXfermode(null);
        imageView.setImageBitmap(createBitmap);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_filter;
    }

    public int getFragmentInto() {
        return 250;
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
    }
}
