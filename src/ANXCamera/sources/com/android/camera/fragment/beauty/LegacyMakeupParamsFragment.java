package com.android.camera.fragment.beauty;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.R;
import com.android.camera.fragment.beauty.MakeupSingleCheckAdapter.MakeupItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.ArrayList;
import java.util.List;

@Deprecated
public class LegacyMakeupParamsFragment extends MakeupParamsFragment {
    protected List<MakeupItem> initItems() {
        List<MakeupItem> arrayList = new ArrayList();
        arrayList.add(new MakeupItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender));
        arrayList.add(new MakeupItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white));
        arrayList.add(new MakeupItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth));
        return arrayList;
    }

    protected OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                BeautyParameterType beautyParameterType;
                LegacyMakeupParamsFragment.this.mSelectedParam = i;
                switch (i) {
                    case 0:
                        beautyParameterType = BeautyParameterType.SHRINK_FACE_RATIO;
                        break;
                    case 1:
                        beautyParameterType = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                    case 2:
                        beautyParameterType = BeautyParameterType.SMOOTH_STRENGTH;
                        break;
                    default:
                        beautyParameterType = BeautyParameterType.WHITEN_STRENGTH;
                        break;
                }
                BeautyHelper.setType(beautyParameterType);
                MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
                if (makeupProtocol != null) {
                    makeupProtocol.onMakeupItemSelected();
                }
            }
        };
    }
}
