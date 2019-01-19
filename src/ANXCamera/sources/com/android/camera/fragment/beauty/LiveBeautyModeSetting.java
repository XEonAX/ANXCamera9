package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import java.util.ArrayList;
import java.util.List;

public class LiveBeautyModeSetting extends AbBeautySettingBusiness {
    public static final int LIVE_BEAUTY_MODE_DEF_VALUE = 40;
    private static List<Type> sLiveBeautyModeTypes = new ArrayList();

    static {
        sLiveBeautyModeTypes.add(Type.LIVE_SHRINK_FACE_RATIO);
        sLiveBeautyModeTypes.add(Type.LIVE_ENLARGE_EYE_RATIO);
        sLiveBeautyModeTypes.add(Type.LIVE_SMOOTH_STRENGTH);
    }

    public List<Type> getTypeArray() {
        return sLiveBeautyModeTypes;
    }

    protected int getProgressDefValue() {
        return 40;
    }
}
