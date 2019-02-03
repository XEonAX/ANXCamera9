package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class FrontBeautyLevelFragment extends BeautyLevelFragment {
    protected List<LevelItem> initBeautyItems() {
        String[] stringArray = getResources().getStringArray(R.array.beauty_level_list);
        List<LevelItem> arrayList = new ArrayList();
        arrayList.add(new LevelItem((int) R.drawable.ic_config_front_beauty_off));
        arrayList.add(new LevelItem(stringArray[0]));
        arrayList.add(new LevelItem(stringArray[1]));
        arrayList.add(new LevelItem(stringArray[2]));
        arrayList.add(new LevelItem(stringArray[3]));
        arrayList.add(new LevelItem(stringArray[4]));
        return arrayList;
    }

    protected void onLevelClick(AdapterView<?> adapterView, View view, int i, long j) {
        setBeautyLevel(i);
    }

    private void setBeautyLevel(int i) {
        if (!b.hG()) {
            boolean isFaceBeautyOn = BeautyParameters.isFaceBeautyOn();
            BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
            if (bottomMenuProtocol != null) {
                if (!isFaceBeautyOn && i > 0) {
                    bottomMenuProtocol.onBottomMenuAnimate(1, 160);
                } else if (isFaceBeautyOn && i == 0) {
                    bottomMenuProtocol.onBottomMenuAnimate(1, 161);
                }
            }
        }
        CameraSettings.setFaceBeautyLevel(i);
        BeautyHelper.onBeautyChanged();
    }
}
