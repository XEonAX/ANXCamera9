package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

@Deprecated
public class LegacyBeautyLevelFragment extends BeautyLevelFragment {
    protected List<LevelItem> initBeautyItems() {
        List<LevelItem> arrayList = new ArrayList();
        arrayList.add(new LevelItem((int) R.drawable.ic_config_front_beauty_off));
        arrayList.add(new LevelItem((int) R.drawable.f1));
        arrayList.add(new LevelItem((int) R.drawable.f2));
        arrayList.add(new LevelItem((int) R.drawable.f3));
        return arrayList;
    }

    protected int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.legacy_beauty_level_item_margin);
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                LegacyBeautyLevelFragment.this.onLevelClick(adapterView, view, i, j);
            }
        };
    }

    protected int beautyLevelToPosition(int i, int i2) {
        return Util.clamp(i, 0, i2);
    }

    void onLevelClick(AdapterView<?> adapterView, View view, int i, long j) {
        CameraSettings.setFaceBeautyLevel(i);
        BeautyHelper.onBeautyChanged();
    }
}
