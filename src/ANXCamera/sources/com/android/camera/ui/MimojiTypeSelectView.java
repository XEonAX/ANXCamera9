package com.android.camera.ui;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.TranslateXOnSubscribe;
import com.android.camera.constant.ColorConstant;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.arcsoft.avatar.AvatarConfig.d;
import io.reactivex.Completable;
import java.util.Iterator;
import java.util.List;

public class MimojiTypeSelectView extends LinearLayout implements OnClickListener {
    private ColorActivateTextView mLastActivateTextView;
    private OnMimojiTypeClickedListener mOnMimojiTypeClickedListener;

    public interface OnMimojiTypeClickedListener {
        void onMimojiTypeClicked(int i);
    }

    public MimojiTypeSelectView(Context context) {
        super(context);
        initView();
    }

    public MimojiTypeSelectView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public MimojiTypeSelectView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
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

    private void setSelection(int i, List<Completable> list) {
        int i2 = 0;
        if (this.mLastActivateTextView != null) {
            this.mLastActivateTextView.setActivated(false);
        }
        ViewGroup viewGroup = (ViewGroup) getChildAt(i);
        View findViewById = viewGroup.findViewById(R.id.top_config_06);
        if (findViewById.getVisibility() == 0) {
            findViewById.setVisibility(4);
        }
        ColorActivateTextView colorActivateTextView = (ColorActivateTextView) viewGroup.findViewById(R.id.eye_light_item_icon);
        colorActivateTextView.setActivated(true);
        if (Util.isAccessible()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(colorActivateTextView.getText().toString());
            stringBuilder.append(getContext().getString(R.string.accessibility_front_preview_status));
            colorActivateTextView.setContentDescription(stringBuilder.toString());
            colorActivateTextView.sendAccessibilityEvent(128);
        }
        this.mLastActivateTextView = colorActivateTextView;
        int i3 = 0;
        while (i2 < i) {
            i3 += Util.getChildMeasureWidth(getChildAt(i2));
            i2++;
        }
        i = (getResources().getDisplayMetrics().widthPixels / 2) - (i3 + (getChildMeasureWidth(viewGroup) / 2));
        if (Util.isLayoutRTL(getContext())) {
            i = -i;
        }
        scrollTo(i, list);
    }

    public void init() {
        Iterator it = AvatarEngineManager.getInstance().getConfigTypeList().iterator();
        int i = 0;
        while (it.hasNext()) {
            d dVar = (d) it.next();
            ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(getContext()).inflate(R.layout.v9_smart_camera_control, this, false);
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) viewGroup.findViewById(R.id.eye_light_item_icon);
            colorActivateTextView.setActivateColor(ColorConstant.COLOR_COMMON_SELECTED);
            viewGroup.setOnClickListener(this);
            colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
            colorActivateTextView.setText(dVar.ao);
            int i2 = i + 1;
            viewGroup.setTag(Integer.valueOf(i));
            addView(viewGroup);
            i = i2;
        }
        setSelection(AvatarEngineManager.getInstance().getSelectTypeIndex(), null);
    }

    public void initView() {
    }

    public void onClick(View view) {
        int intValue = ((Integer) view.getTag()).intValue();
        setSelection(intValue, null);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.onTypeConfigSelect(intValue);
        }
    }

    public void setOnModeClickedListener(OnMimojiTypeClickedListener onMimojiTypeClickedListener) {
        this.mOnMimojiTypeClickedListener = onMimojiTypeClickedListener;
    }
}
