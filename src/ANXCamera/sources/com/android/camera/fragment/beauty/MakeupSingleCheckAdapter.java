package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.Resources;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.aeonax.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.ColorImageView;
import java.util.List;

public class MakeupSingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    private Context mContext;
    private boolean mIsCustomWidth;
    private int mItemHorizontalMargin = 0;
    private int mItemWidth;
    private int mPreSelectedItem = 0;
    private RecyclerView mRecyclerView;
    private int mSelectedItem = 0;
    private List<MakeupItem> mSingleCheckList;
    private OnItemClickListener onItemClickListener;

    public static class MakeupItem {
        private CameraBeautyParameterType cameraBeautyParameterType;
        private int mImageResource;
        private int mTextResource;

        public MakeupItem(int i, int i2, CameraBeautyParameterType cameraBeautyParameterType) {
            this.mImageResource = i;
            this.mTextResource = i2;
            this.cameraBeautyParameterType = cameraBeautyParameterType;
        }

        public MakeupItem(int i, int i2) {
            this.mImageResource = i;
            this.mTextResource = i2;
        }

        public int getTextResource() {
            return this.mTextResource;
        }

        public int getImageResource() {
            return this.mImageResource;
        }

        public CameraBeautyParameterType getCameraBeautyParameterType() {
            return this.cameraBeautyParameterType;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private View itemView;
        private MakeupSingleCheckAdapter mAdapter;
        private ColorImageView mBase;
        private TextView mText;

        public SingleCheckViewHolder(View view, MakeupSingleCheckAdapter makeupSingleCheckAdapter) {
            super(view);
            this.mAdapter = makeupSingleCheckAdapter;
            this.itemView = view;
            this.mText = (TextView) view.findViewById(R.id.makeup_item_name);
            this.mBase = (ColorImageView) view.findViewById(R.id.makeup_item_icon);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(MakeupSingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(MakeupSingleCheckAdapter.this.mItemHorizontalMargin);
            if (MakeupSingleCheckAdapter.this.mIsCustomWidth) {
                marginLayoutParams.width = MakeupSingleCheckAdapter.this.mItemWidth;
            }
            view.setOnClickListener(this);
        }

        public void setDataToView(MakeupItem makeupItem, int i) throws Exception {
            int color;
            this.itemView.setTag(makeupItem);
            Resources resources = MakeupSingleCheckAdapter.this.mContext.getResources();
            this.mText.setText(resources.getString(makeupItem.getTextResource()));
            TextView textView = this.mText;
            if (i == MakeupSingleCheckAdapter.this.mSelectedItem) {
                color = resources.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed);
            } else {
                color = resources.getColor(R.color.beautycamera_beauty_advanced_item_text_normal);
            }
            textView.setTextColor(color);
            if (Util.isAccessible()) {
                CharSequence stringBuilder;
                textView = this.mText;
                StringBuilder stringBuilder2;
                if (i == MakeupSingleCheckAdapter.this.mSelectedItem) {
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(resources.getString(makeupItem.getTextResource()));
                    stringBuilder2.append(resources.getString(R.string.accessibility_open));
                    stringBuilder = stringBuilder2.toString();
                } else {
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(resources.getString(makeupItem.getTextResource()));
                    stringBuilder2.append(resources.getString(R.string.accessibility_closed));
                    stringBuilder = stringBuilder2.toString();
                }
                textView.setContentDescription(stringBuilder);
            }
            this.mBase.setImageResource(makeupItem.getImageResource());
            ColorImageView colorImageView = this.mBase;
            if (i == MakeupSingleCheckAdapter.this.mSelectedItem) {
                i = resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed);
            } else {
                i = resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal);
            }
            colorImageView.setColor(i);
        }

        public void onClick(View view) {
            int adapterPosition = getAdapterPosition();
            if (adapterPosition == MakeupSingleCheckAdapter.this.mSelectedItem) {
                this.mAdapter.onItemHolderClick(this);
                return;
            }
            MakeupSingleCheckAdapter.this.mPreSelectedItem = MakeupSingleCheckAdapter.this.mSelectedItem;
            MakeupSingleCheckAdapter.this.mSelectedItem = adapterPosition;
            SingleCheckViewHolder singleCheckViewHolder = (SingleCheckViewHolder) MakeupSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(MakeupSingleCheckAdapter.this.mPreSelectedItem);
            SingleCheckViewHolder singleCheckViewHolder2 = (SingleCheckViewHolder) MakeupSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(MakeupSingleCheckAdapter.this.mSelectedItem);
            Resources resources = MakeupSingleCheckAdapter.this.mContext.getResources();
            if (singleCheckViewHolder != null) {
                colorAnimate(singleCheckViewHolder.mBase, resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed), resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
            }
            colorAnimate(singleCheckViewHolder2.mBase, resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal), resources.getColor(R.color.beautycamera_beauty_advanced_item_backgroud_pressed));
            if (singleCheckViewHolder != null) {
                textColorAnimate(singleCheckViewHolder.mText, resources.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed), resources.getColor(R.color.beautycamera_beauty_advanced_item_text_normal));
            }
            textColorAnimate(singleCheckViewHolder2.mText, resources.getColor(R.color.beautycamera_beauty_advanced_item_text_normal), resources.getColor(R.color.beautycamera_beauty_advanced_item_text_pressed));
            if (singleCheckViewHolder == null) {
                this.mAdapter.notifyItemChanged(MakeupSingleCheckAdapter.this.mPreSelectedItem);
            }
            this.mAdapter.onItemHolderClick(this);
        }

        private void textColorAnimate(final TextView textView, int i, int i2) {
            ValueAnimator ofObject = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
            ofObject.setDuration(200);
            ofObject.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    textView.setTextColor(((Integer) valueAnimator.getAnimatedValue()).intValue());
                }
            });
            ofObject.start();
        }

        private void colorAnimate(final ColorImageView colorImageView, int i, int i2) {
            ValueAnimator ofObject = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
            ofObject.setDuration(200);
            ofObject.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    colorImageView.setColorAndRefresh(((Integer) valueAnimator.getAnimatedValue()).intValue());
                }
            });
            ofObject.start();
        }
    }

    public MakeupSingleCheckAdapter(Context context, List<MakeupItem> list, int i) {
        this.mContext = context;
        this.mSingleCheckList = list;
        this.mItemHorizontalMargin = i;
    }

    public MakeupSingleCheckAdapter(Context context, List<MakeupItem> list, int i, boolean z, int i2) {
        this.mContext = context;
        this.mSingleCheckList = list;
        this.mItemHorizontalMargin = i;
        this.mIsCustomWidth = z;
        this.mItemWidth = i2;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.makeup_item, viewGroup, false), this);
    }

    public void onBindViewHolder(SingleCheckViewHolder singleCheckViewHolder, int i) {
        try {
            singleCheckViewHolder.setDataToView((MakeupItem) this.mSingleCheckList.get(i), i);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getItemCount() {
        return this.mSingleCheckList.size();
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.onItemClickListener = onItemClickListener;
    }

    public void onItemHolderClick(SingleCheckViewHolder singleCheckViewHolder) {
        if (this.onItemClickListener != null) {
            this.onItemClickListener.onItemClick(null, singleCheckViewHolder.itemView, singleCheckViewHolder.getAdapterPosition(), singleCheckViewHolder.getItemId());
        }
    }

    public void setSelectedPosition(int i) {
        this.mSelectedItem = i;
    }
}
