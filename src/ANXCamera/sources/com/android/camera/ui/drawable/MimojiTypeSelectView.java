package com.android.camera.ui.drawable;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.global.ComponentMimojiConfigList;
import com.android.camera.ui.ColorActivateTextView;

public class MimojiTypeSelectView extends LinearLayout implements OnClickListener {
    private ColorActivateTextView mLastActivateTextView;

    public MimojiTypeSelectView(Context context) {
        super(context);
    }

    public void init(ComponentMimojiConfigList componentMimojiConfigList, int i) {
        for (ComponentDataItem componentDataItem : componentMimojiConfigList.getItems()) {
            ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(getContext()).inflate(R.layout.fragment_top_alert, this, false);
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) viewGroup.findViewById(R.id.eye_light_item_icon);
            viewGroup.setOnClickListener(this);
            colorActivateTextView.setNormalCor(ColorConstant.WHITE_ALPHA_99);
        }
    }

    public void onClick(View view) {
    }
}
