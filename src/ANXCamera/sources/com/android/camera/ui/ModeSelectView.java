package com.android.camera.ui;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.global.ComponentModuleList;
import io.reactivex.Completable;
import java.util.Iterator;
import java.util.List;

public class ModeSelectView extends LinearLayout implements OnClickListener {
    private ColorActivateTextView mLastActivateTextView;
    private onModeClickedListener mOnModeClickedListener;

    public interface onModeClickedListener {
        void onModeClicked(int i);
    }

    public ModeSelectView(Context context) {
        super(context);
        initView();
    }

    public ModeSelectView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public ModeSelectView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    public void initView() {
    }

    public void setOnModeClickedListener(onModeClickedListener onmodeclickedlistener) {
        this.mOnModeClickedListener = onmodeclickedlistener;
    }

    public void init(ComponentModuleList componentModuleList, int i) {
        int i2;
        removeAllViews();
        List items = componentModuleList.getItems();
        Iterator it = items.iterator();
        while (true) {
            i2 = 0;
            if (!it.hasNext()) {
                break;
            }
            ComponentDataItem componentDataItem = (ComponentDataItem) it.next();
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) LayoutInflater.from(getContext()).inflate(R.layout.fragment_mode_select_item, this, false);
            colorActivateTextView.setOnClickListener(this);
            colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
            int intValue = Integer.valueOf(componentDataItem.mValue).intValue();
            colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
            colorActivateTextView.setText(componentDataItem.mDisplayNameRes);
            colorActivateTextView.setTag(Integer.valueOf(intValue));
            addView(colorActivateTextView);
        }
        if (i == 168 || i == 170 || i == 169) {
            i = 162;
        }
        while (i2 < items.size()) {
            if (Integer.valueOf(((ComponentDataItem) items.get(i2)).mValue).intValue() == i) {
                setSelection(i2, null);
                return;
            }
            i2++;
        }
    }

    private void setSelection(int i, List<Completable> list) {
        int i2 = 0;
        if (this.mLastActivateTextView != null) {
            this.mLastActivateTextView.setActivated(false);
        }
        ColorActivateTextView colorActivateTextView = (ColorActivateTextView) getChildAt(i);
        colorActivateTextView.setActivated(true);
        if (Util.isAccessible()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(colorActivateTextView.getText().toString());
            stringBuilder.append(getContext().getString(R.string.accessibility_selected));
            colorActivateTextView.setContentDescription(stringBuilder.toString());
            colorActivateTextView.sendAccessibilityEvent(128);
        }
        this.mLastActivateTextView = colorActivateTextView;
        int i3 = 0;
        while (i2 < i) {
            i3 += Util.getChildMeasureWidth(getChildAt(i2));
            i2++;
        }
        i = (getResources().getDisplayMetrics().widthPixels / 2) - (i3 + (getChildMeasureWidth(colorActivateTextView) / 2));
        if (Util.isLayoutRTL(getContext())) {
            i = -i;
        }
        scrollTo(i, list);
    }

    private static final int getChildMeasureWidth(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int i = marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
        int measuredWidth = view.getMeasuredWidth();
        if (measuredWidth > 0) {
            return measuredWidth + i;
        }
        measuredWidth = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(measuredWidth, measuredWidth);
        return view.getMeasuredWidth() + i;
    }

    private void scrollTo(int i, List<Completable> list) {
        if (list == null) {
            TranslateXOnSubscribe.directSetResult(this, i);
        } else {
            list.add(Completable.create(new TranslateXOnSubscribe(this, i).setDurationTime(300)));
        }
    }

    public void onClick(View view) {
        if (isEnabled() && this.mOnModeClickedListener != null) {
            this.mOnModeClickedListener.onModeClicked(((Integer) view.getTag()).intValue());
        }
    }

    public void judgePosition(int i, List<Completable> list) {
        if (this.mLastActivateTextView != null && ((Integer) this.mLastActivateTextView.getTag()).intValue() != i) {
            if (i == 168 || i == 170 || i == 169) {
                i = 162;
            }
            for (int i2 = 0; i2 < getChildCount(); i2++) {
                if (i == ((Integer) getChildAt(i2).getTag()).intValue()) {
                    setSelection(i2, list);
                } else {
                    ColorActivateTextView colorActivateTextView = (ColorActivateTextView) getChildAt(i2);
                    if (Util.isAccessible()) {
                        colorActivateTextView.setContentDescription(colorActivateTextView.getText().toString());
                    }
                }
            }
        }
    }
}
