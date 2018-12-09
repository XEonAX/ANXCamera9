package com.android.camera.fragment.beauty;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class LiveBeautyFilterFragment extends Fragment {
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View textView = new TextView(getContext());
        textView.setTextSize(20.0f);
        textView.setText("Live:滤镜");
        return textView;
    }
}
