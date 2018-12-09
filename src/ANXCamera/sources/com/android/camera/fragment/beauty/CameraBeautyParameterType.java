package com.android.camera.fragment.beauty;

import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.miui.filtersdk.beauty.BeautyParameterType;

public class CameraBeautyParameterType {
    public static final CameraBeautyParameterType BLUSHER_RATIO = new CameraBeautyParameterType(3, Type.BLUSHER_RATIO);
    public static final CameraBeautyParameterType BODY_SLIM_RATIO = new CameraBeautyParameterType(5, Type.BODY_SLIM_RATIO);
    public static final CameraBeautyParameterType BRIGHT_EYE_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.BRIGHT_EYE_RATIO);
    public static final CameraBeautyParameterType CONTRAST_STRENGTH = new CameraBeautyParameterType(2, BeautyParameterType.CONTRAST_STRENGTH);
    public static final CameraBeautyParameterType DEBLEMISH = new CameraBeautyParameterType(2, BeautyParameterType.DEBLEMISH);
    public static final CameraBeautyParameterType DEPOUCH_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.DEPOUCH_RATIO);
    public static final CameraBeautyParameterType ENLARGE_EYE_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.ENLARGE_EYE_RATIO);
    public static final CameraBeautyParameterType EYEBROW_DYE_RATIO = new CameraBeautyParameterType(3, Type.EYEBROW_DYE_RATIO);
    public static final CameraBeautyParameterType EYE_LIGHT = new CameraBeautyParameterType(4, 1);
    public static final CameraBeautyParameterType FACE_3D_CHIN_RATIO = new CameraBeautyParameterType(2, Type.CHIN_RATIO);
    public static final CameraBeautyParameterType FACE_3D_ENLARGE_EYE_RATIO = new CameraBeautyParameterType(2, Type.ENLARGE_EYE_RATIO);
    public static final CameraBeautyParameterType FACE_3D_LIPS_RATIO = new CameraBeautyParameterType(2, Type.LIPS_RATIO);
    public static final CameraBeautyParameterType FACE_3D_NECK_RATIO = new CameraBeautyParameterType(2, Type.NECK_RATIO);
    public static final CameraBeautyParameterType FACE_3D_NOSE_RATIO = new CameraBeautyParameterType(2, Type.NOSE_RATIO);
    public static final CameraBeautyParameterType FACE_3D_RISORIUS_RATIO = new CameraBeautyParameterType(2, Type.RISORIUS_RATIO);
    public static final CameraBeautyParameterType FACE_3D_SHRINK_FACE_RATIO = new CameraBeautyParameterType(2, Type.SHRINK_FACE_RATIO);
    public static final CameraBeautyParameterType FACE_3D_SLIM_NOSE_RATIO = new CameraBeautyParameterType(2, Type.SLIM_NOSE_RATIO);
    public static final CameraBeautyParameterType FACE_3D_SMILE_RATIO = new CameraBeautyParameterType(2, Type.SMILE_RATIO);
    public static final CameraBeautyParameterType HEAD_SLIM_RATIO = new CameraBeautyParameterType(5, Type.HEAD_SLIM_RATIO);
    public static final CameraBeautyParameterType IRIS_SHINE_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.IRIS_SHINE_RATIO);
    public static final CameraBeautyParameterType JELLY_LIPS_RATIO = new CameraBeautyParameterType(3, Type.JELLY_LIPS_RATIO);
    public static final CameraBeautyParameterType LEG_SLIM_RATIO = new CameraBeautyParameterType(5, Type.LEG_SLIM_RATIO);
    public static final CameraBeautyParameterType LIP_BEAUTY_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.LIP_BEAUTY_RATIO);
    public static final CameraBeautyParameterType PUPIL_LINE_RATIO = new CameraBeautyParameterType(3, Type.PUPIL_LINE_RATIO);
    public static final CameraBeautyParameterType RELIGHTING_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.RELIGHTING_RATIO);
    public static final CameraBeautyParameterType RUDDY_STRENGTH = new CameraBeautyParameterType(2, BeautyParameterType.RUDDY_STRENGTH);
    public static final CameraBeautyParameterType SHOULDER_SLIM_RATIO = new CameraBeautyParameterType(5, Type.SHOULDER_SLIM_RATIO);
    public static final CameraBeautyParameterType SHRINK_FACE_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.SHRINK_FACE_RATIO);
    public static final CameraBeautyParameterType SHRINK_JAW_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.SHRINK_JAW_RATIO);
    public static final CameraBeautyParameterType SHRINK_NOSE_RATIO = new CameraBeautyParameterType(2, BeautyParameterType.SHRINK_NOSE_RATIO);
    public static final CameraBeautyParameterType SMOOTH_STRENGTH = new CameraBeautyParameterType(2, BeautyParameterType.SMOOTH_STRENGTH);
    public static final CameraBeautyParameterType WHITEN_STRENGTH = new CameraBeautyParameterType(2, BeautyParameterType.WHITEN_STRENGTH);
    public BeautyParameterType beautyModelParameterType;
    public Type beautyParamType;
    public int beautyType;
    public int customParameterType;

    private CameraBeautyParameterType(int i, BeautyParameterType beautyParameterType) {
        this.beautyType = i;
        this.beautyModelParameterType = beautyParameterType;
    }

    private CameraBeautyParameterType(int i, int i2) {
        this.beautyType = i;
        this.customParameterType = i2;
    }

    private CameraBeautyParameterType(int i, Type type) {
        this.beautyType = i;
        this.beautyParamType = type;
    }
}
