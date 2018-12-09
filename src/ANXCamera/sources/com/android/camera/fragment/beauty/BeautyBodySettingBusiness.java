package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import java.util.ArrayList;
import java.util.List;

public class BeautyBodySettingBusiness extends AbBeautySettingBusiness {
    private static List<Type> sSupprotBeautyBodyTypes;

    static {
        List arrayList = new ArrayList();
        arrayList.add(Type.HEAD_SLIM_RATIO);
        arrayList.add(Type.BODY_SLIM_RATIO);
        arrayList.add(Type.SHOULDER_SLIM_RATIO);
        arrayList.add(Type.LEG_SLIM_RATIO);
        sSupprotBeautyBodyTypes = BeautyParameters.updateSupportedBeautyTypes(arrayList);
    }

    public List<Type> getTypeArray() {
        return sSupprotBeautyBodyTypes;
    }

    public static List<Type> getSupportBeautyTypes() {
        return sSupprotBeautyBodyTypes;
    }
}
