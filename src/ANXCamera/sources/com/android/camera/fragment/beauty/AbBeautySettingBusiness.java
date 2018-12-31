package com.android.camera.fragment.beauty;

import com.android.camera.CameraSettings;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import com.android.camera.log.Log;
import com.mi.config.b;
import com.miui.filtersdk.beauty.BeautyParameterType;
import java.util.HashMap;
import java.util.Map;

public abstract class AbBeautySettingBusiness implements IBeautySettingBusiness {
    protected static final int DEF_BEAUTY_CLOSE_VALUE = 0;
    private static final String TAG = AbBeautySettingBusiness.class.getSimpleName();
    protected int mBeautyLevel;
    private int[] mBeautyValueRange = CameraSettings.getBeautifyValueRange();
    protected Type mCurrentBeautyItemType;
    protected CameraBeautyParameterType mCurrentBeautyParameterType;
    protected Map<Type, Integer> mExtraTable = new HashMap();

    public AbBeautySettingBusiness() {
        initBeauty();
    }

    public Object operate(Object obj) {
        return null;
    }

    public void initBeauty() {
        this.mCurrentBeautyItemType = (Type) getTypeArray().get(0);
        updateParameters();
    }

    private void updateParameters() {
        this.mBeautyLevel = CameraSettings.intelligentValueToBeautyLevel(CameraSettings.getFaceBeautifyValue());
        updateExtraTable();
    }

    private void updateExtraTable() {
        for (Type type : getTypeArray()) {
            String beautyRatioSettingKey = BeautyParameters.getBeautyRatioSettingKey(type);
            int i = 0;
            if (!"".equals(beautyRatioSettingKey)) {
                int faceBeautyRatio = CameraSettings.getFaceBeautyRatio(beautyRatioSettingKey, 0);
                if (faceBeautyRatio == 0) {
                    faceBeautyRatio = this.mBeautyValueRange[1] - this.mBeautyValueRange[0];
                    if (b.hr() && faceBeautyRatio != 0) {
                        int beautifyDefaultValue = CameraSettings.getBeautifyDefaultValue(beautyRatioSettingKey);
                        i = (100 * (beautifyDefaultValue - this.mBeautyValueRange[0])) / faceBeautyRatio;
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("updateExtraTable: ");
                        stringBuilder.append(beautifyDefaultValue);
                        stringBuilder.append("->");
                        stringBuilder.append(i);
                        stringBuilder.append("%");
                        Log.d(str, stringBuilder.toString());
                    }
                } else {
                    i = faceBeautyRatio;
                }
            }
            this.mExtraTable.put(type, Integer.valueOf(i));
        }
    }

    public void setProgress(int i) {
        int i2;
        if (this.mExtraTable.get(this.mCurrentBeautyItemType) == null) {
            i2 = 0;
        } else {
            i2 = ((Integer) this.mExtraTable.get(this.mCurrentBeautyItemType)).intValue();
        }
        this.mExtraTable.put(this.mCurrentBeautyItemType, Integer.valueOf(i));
        if (i2 != i || i == 0) {
            String beautyRatioSettingKey = BeautyParameters.getBeautyRatioSettingKey(this.mCurrentBeautyItemType);
            CameraSettings.setFaceBeautyRatio(beautyRatioSettingKey, i);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onBeautyParameterChanged: ");
            stringBuilder.append(beautyRatioSettingKey);
            stringBuilder.append("=");
            stringBuilder.append(i);
            Log.v(str, stringBuilder.toString());
            BeautyHelper.onBeautyChanged();
        }
    }

    public int getProgress() {
        if (this.mExtraTable.get(this.mCurrentBeautyItemType) == null) {
            return 0;
        }
        return ((Integer) this.mExtraTable.get(this.mCurrentBeautyItemType)).intValue();
    }

    public void resetBeauty() {
        for (Type type : getTypeArray()) {
            CameraSettings.setFaceBeautyRatio(BeautyParameters.getBeautyRatioSettingKey(type), 0);
            this.mExtraTable.put(type, Integer.valueOf(0));
        }
        setProgress(0);
    }

    public void setType(BeautyParameterType beautyParameterType) {
        this.mCurrentBeautyItemType = BeautyParameters.convert(beautyParameterType);
    }

    public void setType(Type type) {
        this.mCurrentBeautyItemType = type;
    }

    public void setCurrentBeautyParameterType(CameraBeautyParameterType cameraBeautyParameterType) {
        this.mCurrentBeautyParameterType = cameraBeautyParameterType;
    }

    public CameraBeautyParameterType getCurrentBeautyParameterType() {
        return this.mCurrentBeautyParameterType;
    }
}
