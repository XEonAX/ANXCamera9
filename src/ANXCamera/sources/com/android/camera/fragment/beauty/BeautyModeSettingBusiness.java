package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class BeautyModeSettingBusiness extends AbBeautySettingBusiness {
    private static List<Type> sLegacyBeautyModeTypes = new ArrayList();
    private static List<Type> sSupportNewBeautyModeTypes;

    static {
        sLegacyBeautyModeTypes.add(Type.SHRINK_FACE_RATIO);
        sLegacyBeautyModeTypes.add(Type.ENLARGE_EYE_RATIO);
        sLegacyBeautyModeTypes.add(Type.WHITEN_STRENGTH);
        sLegacyBeautyModeTypes.add(Type.SMOOTH_STRENGTH);
        List arrayList = new ArrayList();
        arrayList.add(Type.SHRINK_FACE_RATIO);
        arrayList.add(Type.ENLARGE_EYE_RATIO);
        arrayList.add(Type.NOSE_RATIO);
        arrayList.add(Type.CHIN_RATIO);
        arrayList.add(Type.LIPS_RATIO);
        arrayList.add(Type.RISORIUS_RATIO);
        arrayList.add(Type.NECK_RATIO);
        arrayList.add(Type.SMILE_RATIO);
        arrayList.add(Type.SMOOTH_STRENGTH);
        arrayList.add(Type.SLIM_NOSE_RATIO);
        sSupportNewBeautyModeTypes = BeautyParameters.updateSupportedBeautyTypes(arrayList);
    }

    public List<Type> getTypeArray() {
        return b.hC() ? sSupportNewBeautyModeTypes : sLegacyBeautyModeTypes;
    }

    public static List<Type> getSupportBeautyTypes() {
        return sSupportNewBeautyModeTypes;
    }

    public static List<Type> getSupportLegacyBeautyModeTypes() {
        return sLegacyBeautyModeTypes;
    }
}
