package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import java.util.ArrayList;
import java.util.List;

public class BackBeautyLevelFragment extends BeautyLevelFragment {
    protected List<LevelItem> initBeautyItems() {
        String[] stringArray = getResources().getStringArray(R.array.beauty_level_list);
        List<LevelItem> arrayList = new ArrayList();
        arrayList.add(new LevelItem((int) R.drawable.ff));
        arrayList.add(new LevelItem(stringArray[0]));
        arrayList.add(new LevelItem(stringArray[1]));
        arrayList.add(new LevelItem(stringArray[2]));
        arrayList.add(new LevelItem(stringArray[3]));
        arrayList.add(new LevelItem(stringArray[4]));
        return arrayList;
    }

    protected void onLevelClick(AdapterView<?> adapterView, View view, int i, long j) {
        CameraSettings.setFaceBeautyLevel(i);
        BeautyHelper.onBeautyChanged();
    }
}
