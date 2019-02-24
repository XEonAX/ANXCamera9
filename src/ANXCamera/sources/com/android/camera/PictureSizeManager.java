package com.android.camera;

import com.android.camera.data.DataRepository;
import com.android.camera.module.ModuleManager;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class PictureSizeManager {
    private static String sDefaultValue = "4x3";
    private static final ArrayList<String> sEntryValues = new ArrayList();
    private static final ArrayList<CameraSize> sPictureList = new ArrayList();

    static {
        sEntryValues.add("4x3");
        sEntryValues.add("16x9");
        if (b.gs()) {
            sEntryValues.add("18x9");
        }
        if (DataRepository.dataItemFeature().fh()) {
            sEntryValues.add("19.5x9");
        }
    }

    public static String[] getEntries() {
        if (ModuleManager.isPortraitModule() && CameraSettings.isBackCamera() && DataRepository.dataItemFeature().fB()) {
            return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3)};
        } else if (b.gs()) {
            return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3), CameraSettings.getString(R.string.pref_camera_picturesize_entry_16_9), CameraSettings.getString(R.string.pref_camera_picturesize_entry_18_9)};
        } else if (DataRepository.dataItemFeature().fh()) {
            return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3), CameraSettings.getString(R.string.pref_camera_picturesize_entry_16_9), CameraSettings.getString(R.string.pref_camera_picturesize_entry_195_9)};
        } else {
            return new String[]{CameraSettings.getString(R.string.pref_camera_picturesize_entry_4_3), CameraSettings.getString(R.string.pref_camera_picturesize_entry_16_9)};
        }
    }

    public static String[] getEntryValues() {
        if (ModuleManager.isPortraitModule() && CameraSettings.isBackCamera() && DataRepository.dataItemFeature().fB()) {
            return new String[]{"4x3"};
        }
        String[] strArr = new String[sEntryValues.size()];
        sEntryValues.toArray(strArr);
        return strArr;
    }

    public static String getDefaultValue() {
        return sDefaultValue;
    }

    public static String getPictureSizeRatioString() {
        if (CameraSettings.isUnsolicited4X3Ratio()) {
            return "4x3";
        }
        return CameraSettings.getPictureSizeRatioString(getDefaultValue());
    }

    public static String getUserPictureSizeRatioString() {
        return CameraSettings.getPictureSizeRatioString(getDefaultValue());
    }

    public static CameraSize getBestPictureSize(float f) {
        if (sPictureList == null || sPictureList.isEmpty()) {
            return new CameraSize();
        }
        CameraSize cameraSize = null;
        if (((double) Math.abs(f - 1.77f)) < 0.02d) {
            cameraSize = _findMaxRatio16_9(sPictureList);
        } else if (((double) Math.abs(f - 1.33f)) < 0.02d) {
            cameraSize = _findMaxRatio4_3(sPictureList);
        } else if (((double) Math.abs(f - 1.0f)) < 0.02d) {
            cameraSize = _findMaxRatio1_1(sPictureList);
        } else if (((double) Math.abs(f - 2.0f)) < 0.02d) {
            cameraSize = _findMaxRatio18_9(sPictureList);
        } else if (((double) Math.abs(f - 2.16f)) < 0.02d) {
            cameraSize = _findMaxRatio19_5_9(sPictureList);
        }
        if (cameraSize == null || cameraSize.isEmpty()) {
            cameraSize = new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height);
        }
        return cameraSize;
    }

    public static CameraSize getBestPictureSize() {
        return getBestPictureSize(sPictureList);
    }

    public static CameraSize getBestPictureSize(List<CameraSize> list) {
        if (list == null || list.isEmpty()) {
            return new CameraSize();
        }
        float ratio = Util.getRatio(getPictureSizeRatioString());
        CameraSize cameraSize = null;
        if (((double) Math.abs(ratio - 1.77f)) < 0.02d) {
            cameraSize = _findMaxRatio16_9(list);
        } else if (((double) Math.abs(ratio - 1.33f)) < 0.02d) {
            cameraSize = _findMaxRatio4_3(list);
        } else if (((double) Math.abs(ratio - 1.0f)) < 0.02d) {
            cameraSize = _findMaxRatio1_1(list);
        } else if (((double) Math.abs(ratio - 2.0f)) < 0.02d) {
            cameraSize = _findMaxRatio18_9(list);
        } else if (((double) Math.abs(ratio - 2.16f)) < 0.02d) {
            cameraSize = _findMaxRatio19_5_9(list);
        }
        if (cameraSize == null || cameraSize.isEmpty()) {
            cameraSize = new CameraSize(((CameraSize) list.get(0)).width, ((CameraSize) list.get(0)).height);
        }
        return cameraSize;
    }

    public static CameraSize getBestPanoPictureSize() {
        CameraSize _findMaxRatio4_3;
        if (CameraSettings.isAspectRatio4_3(Util.sWindowWidth, Util.sWindowHeight)) {
            _findMaxRatio4_3 = _findMaxRatio4_3(sPictureList);
        } else if (CameraSettings.isAspectRatio18_9(Util.sWindowWidth, Util.sWindowHeight)) {
            _findMaxRatio4_3 = _findMaxRatio18_9(sPictureList);
            if (_findMaxRatio4_3 == null || _findMaxRatio4_3.isEmpty()) {
                _findMaxRatio4_3 = _findMaxRatio16_9(sPictureList);
            }
        } else {
            _findMaxRatio4_3 = _findMaxRatio16_9(sPictureList);
        }
        if (_findMaxRatio4_3 == null || _findMaxRatio4_3.isEmpty()) {
            return new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height);
        }
        return _findMaxRatio4_3;
    }

    public static void initialize(List<CameraSize> list, int i) {
        sPictureList.clear();
        if (list == null || list.size() == 0) {
            throw new IllegalArgumentException("The supported picture size list return from hal is null!");
        }
        List list2;
        initSensorRatio(list2);
        if (i != 0) {
            ArrayList arrayList = new ArrayList();
            for (CameraSize cameraSize : list2) {
                if (cameraSize.area() <= i) {
                    arrayList.add(cameraSize);
                }
            }
            list2 = arrayList;
        }
        CameraSize _findMaxRatio4_3 = _findMaxRatio4_3(list2);
        if (_findMaxRatio4_3 != null) {
            sPictureList.add(_findMaxRatio4_3);
        }
        _findMaxRatio4_3 = _findMaxRatio1_1(list2);
        if (_findMaxRatio4_3 != null) {
            sPictureList.add(_findMaxRatio4_3);
        }
        _findMaxRatio4_3 = _findMaxRatio16_9(list2);
        if (_findMaxRatio4_3 != null) {
            sPictureList.add(_findMaxRatio4_3);
        }
        _findMaxRatio4_3 = _findMaxRatio18_9(list2);
        if (_findMaxRatio4_3 != null) {
            sPictureList.add(_findMaxRatio4_3);
        }
        CameraSize _findMaxRatio19_5_9 = _findMaxRatio19_5_9(list2);
        if (_findMaxRatio19_5_9 != null) {
            sPictureList.add(_findMaxRatio19_5_9);
        }
        if (sPictureList.size() == 0) {
            throw new IllegalArgumentException("Not find the desire picture sizes!");
        }
    }

    public static CameraSize getBestSquareSize(List<CameraSize> list) {
        int i = 0;
        if (list == null || list.isEmpty()) {
            return new CameraSize(0, 0);
        }
        for (CameraSize cameraSize : list) {
            if (cameraSize.getWidth() == cameraSize.getHeight()) {
                if (i < cameraSize.getWidth()) {
                    i = cameraSize.getWidth();
                }
            }
        }
        return new CameraSize(i, i);
    }

    private static CameraSize _findMaxRatio4_3(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.33f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio1_1(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.0f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio16_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.77f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio18_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 2.0f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio19_5_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 2.16f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static void initSensorRatio(List<CameraSize> list) {
        if (b.qj || b.qq) {
            sDefaultValue = "16x9";
            return;
        }
        CameraSize cameraSize = new CameraSize();
        int i = 0;
        int i2 = -1;
        int i3 = 0;
        while (i < list.size()) {
            cameraSize.parseSize((CameraSize) list.get(i));
            if (i3 < cameraSize.area()) {
                i3 = cameraSize.area();
                i2 = i;
            }
            i++;
        }
        cameraSize.parseSize((CameraSize) list.get(i2));
        if (((double) Math.abs(cameraSize.getRatio() - 1.33f)) < 0.02d) {
            sDefaultValue = "4x3";
        } else {
            sDefaultValue = "16x9";
        }
    }
}
