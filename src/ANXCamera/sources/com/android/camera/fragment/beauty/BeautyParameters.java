package com.android.camera.fragment.beauty;

import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.filtersdk.beauty.BeautyProcessor;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class BeautyParameters {
    public static final int BACK_LEVEL_BEAUTY_TAB_ID = 0;
    public static final int BEAUTY_BODY_BEAUTY_TAB_ID = 1;
    public static final int BEAUTY_BODY_TYPE = 5;
    public static final int BEAUTY_FILTER_TYPE = 6;
    public static final int BEAUTY_LIVE_BEAUTY_MODE_TYPE = 7;
    public static final int BEAUTY_MODEL_BEAUTY_TAB_ID = 1;
    public static final int BEAUTY_MODEL_TYPE = 2;
    public static final int EYE_LIGHT_BEAUTY_TAB_ID = 3;
    public static final int EYE_LIGHT_BEAUTY_TYPE = 4;
    public static final int FRON_LEVEL_BEAUTY_TAB_ID = 0;
    public static final int LEVEL_BEAUTY_TYPE = 1;
    public static final int LIVE_BEAUTY_MODE_BEAUTY_TAB_ID = 1;
    public static final int LIVE_FILTER_BEAUTY_TAB_ID = 0;
    public static final int MAKE_UP_BEAUTY_TAB_ID = 2;
    public static final int MAKE_UP_TYPE = 3;
    public static final int SEEKBAR_MAX = 100;
    public static final String TAG = BeautyParameters.class.getSimpleName();
    private static BeautyParameters sInstance;
    public static List<Integer> sSupportSeekBarAdjustBeautyType = new ArrayList();
    private static final Type[] sSupportTwoWayAdjustableTypes = new Type[]{Type.CHIN_RATIO, Type.LIPS_RATIO};
    private float[][] mCameraLevelParameters = new float[][]{new float[]{0.0f, 0.0f, 0.0f, 0.0f}, new float[]{1.0f, 1.0f, 1.0f, 1.0f}, new float[]{3.0f, 3.0f, 3.0f, 3.0f}, new float[]{5.0f, 5.0f, 5.0f, 5.0f}, new float[]{7.0f, 7.0f, 7.0f, 7.0f}, new float[]{8.0f, 8.0f, 8.0f, 8.0f}};
    private IntelligentBeautyProcessor mMakeupProcessor;
    private IntelligentBeautyProcessor mStickerMakeupProcessor;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BeautyType {
    }

    public enum Type {
        BEAUTY_RESET,
        WHITEN_STRENGTH,
        SHRINK_FACE_RATIO,
        ENLARGE_EYE_RATIO,
        SMOOTH_STRENGTH,
        NOSE_RATIO,
        RISORIUS_RATIO,
        LIPS_RATIO,
        CHIN_RATIO,
        NECK_RATIO,
        SMILE_RATIO,
        SLIM_NOSE_RATIO,
        EYEBROW_DYE_RATIO,
        PUPIL_LINE_RATIO,
        JELLY_LIPS_RATIO,
        BLUSHER_RATIO,
        HEAD_SLIM_RATIO,
        BODY_SLIM_RATIO,
        SHOULDER_SLIM_RATIO,
        LEG_SLIM_RATIO,
        LIVE_SHRINK_FACE_RATIO,
        LIVE_ENLARGE_EYE_RATIO,
        LIVE_SMOOTH_STRENGTH
    }

    static {
        sSupportSeekBarAdjustBeautyType.add(Integer.valueOf(2));
        sSupportSeekBarAdjustBeautyType.add(Integer.valueOf(3));
        sSupportSeekBarAdjustBeautyType.add(Integer.valueOf(5));
        sSupportSeekBarAdjustBeautyType.add(Integer.valueOf(7));
    }

    private BeautyParameters() {
    }

    public static synchronized BeautyParameters getInstance() {
        BeautyParameters beautyParameters;
        synchronized (BeautyParameters.class) {
            if (sInstance == null) {
                sInstance = new BeautyParameters();
            }
            beautyParameters = sInstance;
        }
        return beautyParameters;
    }

    public static boolean isCurrentModeSupportVideoBeauty() {
        int currentMode = ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCurrentMode();
        return currentMode == 162 || currentMode == 161 || currentMode == 174;
    }

    public static List<Type> updateSupportedBeautyTypes(List<Type> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        CameraCapabilities capabilitiesByBogusCameraId = Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(dataItemGlobal.getCurrentCameraId(), dataItemGlobal.getCurrentMode());
        ArrayList arrayList = new ArrayList(list.size());
        if (capabilitiesByBogusCameraId == null) {
            Log.w(TAG, "updateSupportedTypes, but CameraCapabilities is null!");
        } else {
            for (Type type : list) {
                if (capabilitiesByBogusCameraId.isSupportBeautyType(type)) {
                    arrayList.add(type);
                }
            }
        }
        list = new ArrayList();
        for (int i = 0; i < arrayList.size(); i++) {
            list.add((Type) arrayList.get(i));
        }
        return list;
    }

    public static String getBeautyRatioSettingKey(Type type) {
        switch (type) {
            case SMOOTH_STRENGTH:
                return CameraSettings.KEY_BEAUTIFY_SKIN_SMOOTH_RATIO;
            case WHITEN_STRENGTH:
                return CameraSettings.KEY_BEAUTIFY_SKIN_COLOR_RATIO;
            case ENLARGE_EYE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_ENLARGE_EYE_RATIO;
            case SHRINK_FACE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_SLIM_FACE_RATIO;
            case NOSE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_NOSE_RATIO;
            case RISORIUS_RATIO:
                return CameraSettings.KEY_BEAUTIFY_RISORIUS_RATIO;
            case LIPS_RATIO:
                return CameraSettings.KEY_BEAUTIFY_LIPS_RATIO;
            case CHIN_RATIO:
                return CameraSettings.KEY_BEAUTIFY_CHIN_RATIO;
            case NECK_RATIO:
                return CameraSettings.KEY_BEAUTIFY_NECK_RATIO;
            case SMILE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_SMILE_RATIO;
            case SLIM_NOSE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_SLIM_NOSE_RATIO;
            case BLUSHER_RATIO:
                return CameraSettings.KEY_BEAUTIFY_BLUSHER_RATIO;
            case JELLY_LIPS_RATIO:
                return CameraSettings.KEY_BEAUTIFY_JELLY_LIPS_RATIO;
            case PUPIL_LINE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_PUPIL_LINE_RATIO;
            case EYEBROW_DYE_RATIO:
                return CameraSettings.KEY_BEAUTIFY_EYEBROW_DYE_RATIO;
            case HEAD_SLIM_RATIO:
                return CameraSettings.KEY_BEAUTY_HEAD_SLIM_RATIO;
            case BODY_SLIM_RATIO:
                return CameraSettings.KEY_BEAUTY_BODY_SLIM_RATIO;
            case SHOULDER_SLIM_RATIO:
                return CameraSettings.KEY_BEAUTY_SHOULDER_SLIM_RATIO;
            case LEG_SLIM_RATIO:
                return CameraSettings.KEY_BEAUTY_LEG_SLIM_RATIO;
            case LIVE_SHRINK_FACE_RATIO:
                return CameraSettings.KEY_LIVE_SHRINK_FACE_RATIO;
            case LIVE_ENLARGE_EYE_RATIO:
                return CameraSettings.KEY_LIVE_ENLARGE_EYE_RATIO;
            case LIVE_SMOOTH_STRENGTH:
                return CameraSettings.KEY_LIVE_SMOOTH_STRENGTH;
            default:
                return "";
        }
    }

    public static Type convert(BeautyParameterType beautyParameterType) {
        if (beautyParameterType != null) {
            switch (beautyParameterType) {
                case SMOOTH_STRENGTH:
                    return Type.SMOOTH_STRENGTH;
                case WHITEN_STRENGTH:
                    return Type.WHITEN_STRENGTH;
                case ENLARGE_EYE_RATIO:
                    return Type.ENLARGE_EYE_RATIO;
                case SHRINK_FACE_RATIO:
                    return Type.SHRINK_FACE_RATIO;
                default:
                    throw new IllegalArgumentException();
            }
        }
        throw new IllegalArgumentException();
    }

    public static boolean isFaceBeautyOn() {
        return CameraSettings.getBeautyShowLevel() > 0;
    }

    public List<Type> getAdjustableTypes() {
        return getSupportBeautyTypes();
    }

    public List<Type> getSupportBeautyTypes() {
        if (!b.hR()) {
            return BeautySettingManager.getLegacySupportedBeautyTypes();
        }
        if (CameraSettings.isFrontCamera()) {
            return BeautySettingManager.getFrontSupportedBeautyTypes();
        }
        return BeautySettingManager.getBackSupportedBeautyTypes();
    }

    public static boolean isSupportTwoWayAdjustable(Type type) {
        if (BeautyHelper.getBeautyType() != 2) {
            return false;
        }
        return Arrays.asList(sSupportTwoWayAdjustableTypes).contains(type);
    }

    public void setMakeupProcessor(IntelligentBeautyProcessor intelligentBeautyProcessor) {
        synchronized (this) {
            int beautyShowLevel = CameraSettings.getBeautyShowLevel();
            this.mMakeupProcessor = intelligentBeautyProcessor;
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(intelligentBeautyProcessor, beautyShowLevel));
        }
    }

    public BeautyProcessor getMakeupProcessor() {
        BeautyProcessor beautyProcessor;
        synchronized (this) {
            beautyProcessor = this.mMakeupProcessor;
        }
        return beautyProcessor;
    }

    public void setStickerMakeupProcessor(IntelligentBeautyProcessor intelligentBeautyProcessor) {
        synchronized (this) {
            int beautyShowLevel = CameraSettings.getBeautyShowLevel();
            this.mStickerMakeupProcessor = intelligentBeautyProcessor;
            this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(intelligentBeautyProcessor, beautyShowLevel));
        }
    }

    public BeautyProcessor getStickerMakeupProcessor() {
        BeautyProcessor beautyProcessor;
        synchronized (this) {
            beautyProcessor = this.mStickerMakeupProcessor;
        }
        return beautyProcessor;
    }

    private void setBeautyParameters() {
        int beautyShowLevel = CameraSettings.getBeautyShowLevel();
        if (EffectController.getInstance().isStickerEnable()) {
            if (this.mStickerMakeupProcessor != null) {
                this.mStickerMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mStickerMakeupProcessor, beautyShowLevel));
            }
        } else if (this.mMakeupProcessor != null) {
            this.mMakeupProcessor.setBeautyParamsDegree(getProcessorBeautyParams(this.mMakeupProcessor, beautyShowLevel));
        }
    }

    private Map<BeautyParameterType, Float> getProcessorBeautyParams(IntelligentBeautyProcessor intelligentBeautyProcessor, int i) {
        if (!b.hG()) {
            i--;
        }
        return intelligentBeautyProcessor.getIntelligentLevelParams(i);
    }
}
