package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigRatio extends ComponentData {
    public static final String RATIO_16X9 = "16x9";
    public static final String RATIO_1X1 = "1x1";
    public static final String RATIO_4X3 = "4x3";
    public static final String RATIO_FULL_18X9 = "18x9";
    public static final String RATIO_FULL_195X9 = "19.5x9";
    @CameraRatio
    private String mDefaultValue = RATIO_4X3;
    private String mForceValue;
    @CameraRatio
    private transient String mTempRatio;
    private ArrayList<String> sEntryValues = new ArrayList();
    private boolean sSupport18x9;
    private boolean sSupport195x9;

    public @interface CameraRatio {
    }

    public ComponentConfigRatio(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public String[] getCurrentlySupportRatioEntries() {
        List<ComponentDataItem> items = getItems();
        List arrayList = new ArrayList(items.size());
        for (ComponentDataItem componentDataItem : items) {
            arrayList.add(CameraSettings.getString(componentDataItem.mDisplayNameRes));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String[] getCurrentlySupportRatioValues() {
        List<ComponentDataItem> items = getItems();
        List arrayList = new ArrayList(items.size());
        for (ComponentDataItem componentDataItem : items) {
            arrayList.add(componentDataItem.mValue);
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    @NonNull
    public String getDefaultValue(int i) {
        return this.mDefaultValue;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String[] getFullSupportRatioValues() {
        this.sEntryValues.clear();
        this.sEntryValues.add(RATIO_4X3);
        this.sEntryValues.add(RATIO_16X9);
        if (b.hH()) {
            this.sEntryValues.add(RATIO_FULL_18X9);
        }
        if (DataRepository.dataItemFeature().gf()) {
            this.sEntryValues.add(RATIO_FULL_195X9);
        }
        String[] strArr = new String[this.sEntryValues.size()];
        this.sEntryValues.toArray(strArr);
        return strArr;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            reInit(DataRepository.dataItemGlobal().getCurrentMode(), DataRepository.dataItemGlobal().getCurrentCameraId(), null);
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_picturesize_key";
    }

    public int getMappingModeByRatio(int i) {
        if (i != 163 && i != 165) {
            return i;
        }
        String componentValue = this.mTempRatio != null ? this.mTempRatio : getComponentValue(160);
        Object obj = -1;
        if (componentValue.hashCode() == 50858 && componentValue.equals(RATIO_1X1)) {
            obj = null;
        }
        return obj != null ? 163 : 165;
    }

    public String getNextValue(int i) {
        CharSequence persistValue = getPersistValue(i);
        int size = this.mItems.size();
        for (int i2 = 0; i2 < size; i2++) {
            if (TextUtils.equals(((ComponentDataItem) this.mItems.get(i2)).mValue, persistValue)) {
                return ((ComponentDataItem) this.mItems.get((i2 + 1) % size)).mValue;
            }
        }
        return getDefaultValue(i);
    }

    public String getPictureSizeRatioString(int i) {
        return this.mForceValue != null ? this.mForceValue : getComponentValue(i);
    }

    public void initSensorRatio(List<CameraSize> list, int i, int i2) {
        if (b.xe || b.xl) {
            this.mDefaultValue = RATIO_16X9;
            return;
        }
        CameraSize cameraSize = new CameraSize();
        int i3 = 0;
        int i4 = -1;
        int i5 = 0;
        while (i3 < list.size()) {
            cameraSize.parseSize((CameraSize) list.get(i3));
            if (i5 < cameraSize.area()) {
                i5 = cameraSize.area();
                i4 = i3;
            }
            i3++;
        }
        cameraSize.parseSize((CameraSize) list.get(i4));
        if (((double) Math.abs(cameraSize.getRatio() - 1.33f)) < 0.02d) {
            this.mDefaultValue = RATIO_4X3;
        } else {
            this.mDefaultValue = RATIO_16X9;
        }
        reInit(i, i2, null);
    }

    /* JADX WARNING: Missing block: B:35:0x00de, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_picturesize_entry_195_9, RATIO_4X3));
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_high, RATIO_16X9));
     */
    /* JADX WARNING: Missing block: B:36:0x00f8, code:
            if (r6.sSupport18x9 == false) goto L_0x0107;
     */
    /* JADX WARNING: Missing block: B:37:0x00fa, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_normal, RATIO_FULL_18X9));
     */
    /* JADX WARNING: Missing block: B:39:0x0109, code:
            if (r6.sSupport195x9 == false) goto L_0x016c;
     */
    /* JADX WARNING: Missing block: B:40:0x010b, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_low, RATIO_FULL_195X9));
     */
    /* JADX WARNING: Missing block: B:42:0x011c, code:
            if (r8 != 0) goto L_0x0129;
     */
    /* JADX WARNING: Missing block: B:44:0x0122, code:
            if (com.android.camera.CameraSettings.isUltraPixelOn() == false) goto L_0x0133;
     */
    /* JADX WARNING: Missing block: B:45:0x0124, code:
            r6.mForceValue = RATIO_4X3;
     */
    /* JADX WARNING: Missing block: B:47:0x012d, code:
            if (com.android.camera.CameraSettings.isUltraPixelOn() == false) goto L_0x0133;
     */
    /* JADX WARNING: Missing block: B:48:0x012f, code:
            r6.mForceValue = RATIO_4X3;
     */
    /* JADX WARNING: Missing block: B:49:0x0133, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_picturesize_entry_195_9, RATIO_4X3));
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_high, RATIO_16X9));
     */
    /* JADX WARNING: Missing block: B:50:0x014d, code:
            if (r6.sSupport18x9 == false) goto L_0x015c;
     */
    /* JADX WARNING: Missing block: B:51:0x014f, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_normal, RATIO_FULL_18X9));
     */
    /* JADX WARNING: Missing block: B:53:0x015e, code:
            if (r6.sSupport195x9 == false) goto L_0x016c;
     */
    /* JADX WARNING: Missing block: B:54:0x0160, code:
            r6.mItems.add(new com.android.camera.data.data.ComponentDataItem(com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.drawable.ic_ai_scene_human, com.android.camera.R.string.pref_camera_jpegquality_value_low, RATIO_FULL_195X9));
     */
    /* JADX WARNING: Missing block: B:56:0x016e, code:
            return r6.mItems;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (b.hH()) {
            this.sSupport18x9 = true;
        } else {
            this.sSupport18x9 = false;
        }
        if (DataRepository.dataItemFeature().gf()) {
            this.sSupport195x9 = true;
        } else {
            this.sSupport195x9 = false;
        }
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        this.mForceValue = null;
        switch (i) {
            case 163:
            case 173:
                break;
            case 165:
            case 175:
                this.mForceValue = RATIO_4X3;
                break;
            case 166:
                break;
            case 167:
                if (CameraSettings.isUltraPixelOn()) {
                    this.mForceValue = RATIO_4X3;
                }
                this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_picturesize_entry_195_9, RATIO_4X3));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_high, RATIO_16X9));
                if (!this.sSupport18x9) {
                    if (this.sSupport195x9) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_low, RATIO_FULL_195X9));
                        break;
                    }
                }
                this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_normal, RATIO_FULL_18X9));
                break;
                break;
            case 171:
                this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_picturesize_entry_195_9, RATIO_4X3));
                this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_high, RATIO_16X9));
                if (i2 != 0 || !DataRepository.dataItemFeature().gz()) {
                    if (!this.sSupport18x9) {
                        if (this.sSupport195x9) {
                            this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_low, RATIO_FULL_195X9));
                            break;
                        }
                    }
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_ai_scene_human, R.drawable.ic_ai_scene_human, R.string.pref_camera_jpegquality_value_normal, RATIO_FULL_18X9));
                    break;
                }
                this.mForceValue = RATIO_4X3;
                break;
                break;
            case 176:
                this.mForceValue = RATIO_4X3;
                break;
        }
    }

    public void resetTempRatio() {
        this.mTempRatio = null;
    }

    public void setTempRatio(@CameraRatio String str) {
        this.mTempRatio = str;
    }
}
