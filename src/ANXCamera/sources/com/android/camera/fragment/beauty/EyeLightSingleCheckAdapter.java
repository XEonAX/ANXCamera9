package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.ColorStateList;
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
import android.widget.ImageView;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.oneplus.camera.R;
import java.util.List;

public class EyeLightSingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    private int mBackgroundColorNormal;
    private int mBackgroundColorPressed;
    private Context mContext;
    private int mItemHorizontalMargin = 0;
    private int mPreSelectedItem = 0;
    private RecyclerView mRecyclerView;
    private int mSelectedItem = 0;
    private List<EyeLightItem> mSingleCheckList;
    private OnItemClickListener onItemClickListener;

    public static class EyeLightItem {
        private int mImageResource;
        private int mTextResource;
        private String mType;

        public EyeLightItem(String str, int i, int i2) {
            this.mImageResource = i;
            this.mTextResource = i2;
            this.mType = str;
        }

        public int getImageResource() {
            return this.mImageResource;
        }

        public int getTextResource() {
            return this.mTextResource;
        }

        public String getType() {
            return this.mType;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private View itemView;
        private EyeLightSingleCheckAdapter mAdapter;
        private ImageView mBase;

        public SingleCheckViewHolder(View view, EyeLightSingleCheckAdapter eyeLightSingleCheckAdapter) {
            super(view);
            this.mAdapter = eyeLightSingleCheckAdapter;
            this.itemView = view;
            this.mBase = (ImageView) view.findViewById(R.id.eye_light_item_icon);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(EyeLightSingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(EyeLightSingleCheckAdapter.this.mItemHorizontalMargin);
            view.setOnClickListener(this);
        }

        public void setDataToView(EyeLightItem eyeLightItem, int i) throws Exception {
            this.itemView.setTag(eyeLightItem);
            Resources resources = EyeLightSingleCheckAdapter.this.mContext.getResources();
            if (Util.isAccessible()) {
                CharSequence stringBuilder;
                View view = this.itemView;
                StringBuilder stringBuilder2;
                if (i == EyeLightSingleCheckAdapter.this.mSelectedItem) {
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(resources.getString(eyeLightItem.getTextResource()));
                    stringBuilder2.append(resources.getString(R.string.accessibility_open));
                    stringBuilder = stringBuilder2.toString();
                } else {
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(resources.getString(eyeLightItem.getTextResource()));
                    stringBuilder2.append(resources.getString(R.string.accessibility_closed));
                    stringBuilder = stringBuilder2.toString();
                }
                view.setContentDescription(stringBuilder);
            }
            this.mBase.setImageResource(eyeLightItem.getImageResource());
            ImageView imageView = this.mBase;
            if (i == EyeLightSingleCheckAdapter.this.mSelectedItem) {
                i = EyeLightSingleCheckAdapter.this.mBackgroundColorPressed;
            } else {
                i = EyeLightSingleCheckAdapter.this.mBackgroundColorNormal;
            }
            imageView.setBackgroundTintList(ColorStateList.valueOf(i));
        }

        public void onClick(View view) {
            int adapterPosition = getAdapterPosition();
            if (adapterPosition != EyeLightSingleCheckAdapter.this.mSelectedItem) {
                EyeLightSingleCheckAdapter.this.mPreSelectedItem = EyeLightSingleCheckAdapter.this.mSelectedItem;
                EyeLightSingleCheckAdapter.this.mSelectedItem = adapterPosition;
                SingleCheckViewHolder singleCheckViewHolder = (SingleCheckViewHolder) EyeLightSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(EyeLightSingleCheckAdapter.this.mPreSelectedItem);
                SingleCheckViewHolder singleCheckViewHolder2 = (SingleCheckViewHolder) EyeLightSingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(EyeLightSingleCheckAdapter.this.mSelectedItem);
                EyeLightSingleCheckAdapter.this.mContext.getResources();
                if (singleCheckViewHolder != null) {
                    colorAnimate(singleCheckViewHolder.mBase, EyeLightSingleCheckAdapter.this.mBackgroundColorPressed, EyeLightSingleCheckAdapter.this.mBackgroundColorNormal);
                }
                colorAnimate(singleCheckViewHolder2.mBase, EyeLightSingleCheckAdapter.this.mBackgroundColorNormal, EyeLightSingleCheckAdapter.this.mBackgroundColorPressed);
                if (singleCheckViewHolder == null) {
                    this.mAdapter.notifyItemChanged(EyeLightSingleCheckAdapter.this.mPreSelectedItem);
                }
                this.mAdapter.onItemHolderClick(this);
            }
        }

        private void colorAnimate(final ImageView imageView, int i, int i2) {
            ValueAnimator ofObject = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[]{Integer.valueOf(i), Integer.valueOf(i2)});
            ofObject.setDuration(200);
            ofObject.addUpdateListener(new AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    imageView.setBackgroundTintList(ColorStateList.valueOf(((Integer) valueAnimator.getAnimatedValue()).intValue()));
                }
            });
            ofObject.start();
        }
    }

    public EyeLightSingleCheckAdapter(Context context, List<EyeLightItem> list, int i) {
        this.mContext = context;
        this.mSingleCheckList = list;
        this.mItemHorizontalMargin = i;
        this.mBackgroundColorPressed = this.mContext.getResources().getColor(R.color.beautycamera_eye_light_item_background_pressed);
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (uiStyle == 1 || uiStyle == 3) {
            this.mBackgroundColorNormal = this.mContext.getResources().getColor(R.color.beautycamera_eye_light_item_background_normal_full_screen);
        } else {
            this.mBackgroundColorNormal = this.mContext.getResources().getColor(R.color.beautycamera_eye_light_item_background_normal_half_screen);
        }
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(this.mContext).inflate(R.layout.eye_light_item, viewGroup, false), this);
    }

    public void onBindViewHolder(SingleCheckViewHolder singleCheckViewHolder, int i) {
        try {
            singleCheckViewHolder.setDataToView((EyeLightItem) this.mSingleCheckList.get(i), i);
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
