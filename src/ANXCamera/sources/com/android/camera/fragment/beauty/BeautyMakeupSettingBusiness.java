package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import java.util.ArrayList;
import java.util.List;

public class BeautyMakeupSettingBusiness extends AbBeautySettingBusiness {
    private static List<Type> sSupprotBeautyMakeupTypes;

    static {
        List arrayList = new ArrayList();
        arrayList.add(Type.EYEBROW_DYE_RATIO);
        arrayList.add(Type.PUPIL_LINE_RATIO);
        arrayList.add(Type.JELLY_LIPS_RATIO);
        arrayList.add(Type.BLUSHER_RATIO);
        sSupprotBeautyMakeupTypes = BeautyParameters.updateSupportedBeautyTypes(arrayList);
    }

    public List<Type> getTypeArray() {
        return sSupprotBeautyMakeupTypes;
    }

    public static List<Type> getSupportBeautyTypes() {
        return sSupprotBeautyMakeupTypes;
    }
}
