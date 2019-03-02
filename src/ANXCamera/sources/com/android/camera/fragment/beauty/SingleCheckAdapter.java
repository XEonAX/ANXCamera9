package com.android.camera.fragment.beauty;

import android.animation.ArgbEvaluator;
import android.animation.FloatEvaluator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.ui.ColorImageView;
import com.oneplus.camera.R;
import java.util.List;

public class SingleCheckAdapter extends Adapter<SingleCheckViewHolder> {
    private ArgbEvaluator mArgbEvaluator;
    private int mColorNormal;
    private int mColorSelected;
    private Context mContext;
    private boolean mEnableClick = true;
    private FloatEvaluator mFloatEvaluator;
    private int mItemHorizontalMargin = 0;
    private OnItemClickListener mOnItemClickListener;
    private int mPreSelectedItem = 0;
    private RecyclerView mRecyclerView;
    private int mSelectedItem = 0;
    private List<LevelItem> mSingleCheckList;

    public static class LevelItem {
        private String mText;
        private int mTextResource;

        public LevelItem(int i) {
            this.mTextResource = i;
        }

        public LevelItem(String str) {
            this.mText = str;
        }

        public int getTextResource() {
            return this.mTextResource;
        }

        public String getText() {
            return this.mText;
        }
    }

    class SingleCheckViewHolder extends ViewHolder implements OnClickListener {
        private SingleCheckAdapter mAdapter;
        private ColorImageView mBase;
        private TextView mText;

        public SingleCheckViewHolder(View view, SingleCheckAdapter singleCheckAdapter) {
            super(view);
            this.mAdapter = singleCheckAdapter;
            this.mText = (TextView) view.findViewById(R.id.second_text);
            this.mBase = (ColorImageView) view.findViewById(R.id.second_base);
            this.mBase.setIsNeedTransparent(false);
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mBase.getLayoutParams();
            marginLayoutParams.setMarginStart(SingleCheckAdapter.this.mItemHorizontalMargin);
            marginLayoutParams.setMarginEnd(SingleCheckAdapter.this.mItemHorizontalMargin);
            view.setOnClickListener(this);
        }

        public void setDateToView(LevelItem levelItem, int i) throws Exception {
            if (TextUtils.isEmpty(levelItem.mText)) {
                this.mText.setBackgroundResource(levelItem.getTextResource());
            } else {
                this.mText.setTextSize(0, (float) SingleCheckAdapter.this.mContext.getResources().getDimensionPixelSize(R.dimen.beauty_level_text_size));
                this.mText.setText(levelItem.getText());
            }
            this.mText.setAlpha(i == SingleCheckAdapter.this.mSelectedItem ? 1.0f : 0.6f);
            this.mBase.setColor(i == SingleCheckAdapter.this.mSelectedItem ? SingleCheckAdapter.this.mColorSelected : SingleCheckAdapter.this.mColorNormal);
            if (!Util.isAccessible()) {
                return;
            }
            TextView textView;
            CharSequence string;
            if (i == 0) {
                textView = this.mText;
                if (i == SingleCheckAdapter.this.mSelectedItem) {
                    string = SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_closed);
                } else {
                    string = SingleCheckAdapter.this.mContext.getString(R.string.accessibility_beauty_switch_open);
                }
                textView.setContentDescription(string);
                return;
            }
            textView = this.mText;
            StringBuilder stringBuilder;
            if (i == SingleCheckAdapter.this.mSelectedItem) {
                stringBuilder = new StringBuilder();
                stringBuilder.append(i);
                stringBuilder.append(SingleCheckAdapter.this.mContext.getString(R.string.accessibility_open));
                string = stringBuilder.toString();
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append(i);
                stringBuilder.append(SingleCheckAdapter.this.mContext.getString(R.string.accessibility_closed));
                string = stringBuilder.toString();
            }
            textView.setContentDescription(string);
        }

        public void onClick(View view) {
            if (SingleCheckAdapter.this.mEnableClick) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && !cameraAction.isDoingAction()) {
                    int adapterPosition = getAdapterPosition();
                    if (adapterPosition != SingleCheckAdapter.this.mSelectedItem) {
                        SingleCheckAdapter.this.mPreSelectedItem = SingleCheckAdapter.this.mSelectedItem;
                        SingleCheckAdapter.this.mSelectedItem = adapterPosition;
                        SingleCheckViewHolder singleCheckViewHolder = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mPreSelectedItem);
                        SingleCheckViewHolder singleCheckViewHolder2 = (SingleCheckViewHolder) SingleCheckAdapter.this.mRecyclerView.findViewHolderForAdapterPosition(SingleCheckAdapter.this.mSelectedItem);
                        animateOut(singleCheckViewHolder.mBase, singleCheckViewHolder.mText);
                        animateIn(singleCheckViewHolder2.mBase, singleCheckViewHolder2.mText);
                        this.mAdapter.onItemHolderClick(this);
                    }
                }
            }
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

        private void animateOut(final ColorImageView colorImageView, final TextView textView) {
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(100);
            ofFloat.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    f = super.getInterpolation(f);
                    colorImageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(f, Integer.valueOf(SingleCheckAdapter.this.mColorSelected), Integer.valueOf(SingleCheckAdapter.this.mColorNormal))).intValue());
                    ViewCompat.setAlpha(textView, SingleCheckAdapter.this.mFloatEvaluator.evaluate(f, Float.valueOf(1.0f), Float.valueOf(0.6f)).floatValue());
                    return f;
                }
            });
            ofFloat.start();
        }

        private void animateIn(final ColorImageView colorImageView, final TextView textView) {
            ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
            ofFloat.setDuration(100);
            ofFloat.setInterpolator(new LinearInterpolator() {
                public float getInterpolation(float f) {
                    f = super.getInterpolation(f);
                    colorImageView.setColorAndRefresh(((Integer) SingleCheckAdapter.this.mArgbEvaluator.evaluate(f, Integer.valueOf(SingleCheckAdapter.this.mColorNormal), Integer.valueOf(SingleCheckAdapter.this.mColorSelected))).intValue());
                    ViewCompat.setAlpha(textView, SingleCheckAdapter.this.mFloatEvaluator.evaluate(f, Float.valueOf(0.6f), Float.valueOf(1.0f)).floatValue());
                    return f;
                }
            });
            ofFloat.start();
        }
    }

    public void setEnableClick(boolean z) {
        this.mEnableClick = z;
    }

    public SingleCheckAdapter(Context context, List<LevelItem> list, int i) {
        this.mSingleCheckList = list;
        this.mColorNormal = context.getResources().getColor(R.color.transparent);
        this.mColorSelected = context.getResources().getColor(R.color.beautycamera_beauty_level_item_backgroud_pressed);
        this.mItemHorizontalMargin = i;
        this.mArgbEvaluator = new ArgbEvaluator();
        this.mFloatEvaluator = new FloatEvaluator();
        this.mContext = context;
    }

    public void onAttachedToRecyclerView(RecyclerView recyclerView) {
        super.onAttachedToRecyclerView(recyclerView);
        this.mRecyclerView = recyclerView;
    }

    public SingleCheckViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new SingleCheckViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.beauty_level_item, viewGroup, false), this);
    }

    public void onBindViewHolder(SingleCheckViewHolder singleCheckViewHolder, int i) {
        try {
            singleCheckViewHolder.setDateToView((LevelItem) this.mSingleCheckList.get(i), i);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getItemCount() {
        return this.mSingleCheckList.size();
    }

    public void setOnItemClickListener(OnItemClickListener onItemClickListener) {
        this.mOnItemClickListener = onItemClickListener;
    }

    public void onItemHolderClick(SingleCheckViewHolder singleCheckViewHolder) {
        if (this.mOnItemClickListener != null) {
            this.mOnItemClickListener.onItemClick(null, singleCheckViewHolder.itemView, singleCheckViewHolder.getAdapterPosition(), singleCheckViewHolder.getItemId());
        }
    }

    public void setSelectedPosition(int i) {
        this.mSelectedItem = i;
    }
}
