package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.List;

public interface IBeautySettingBusiness extends IBeautyBusiness {
    CameraBeautyParameterType getCurrentBeautyParameterType();

    int getProgress();

    List<Type> getTypeArray();

    void resetBeauty();

    void setCurrentBeautyParameterType(CameraBeautyParameterType cameraBeautyParameterType);

    void setProgress(int i);

    void setType(Type type);

    void setType(BeautyParameterType beautyParameterType);
}
