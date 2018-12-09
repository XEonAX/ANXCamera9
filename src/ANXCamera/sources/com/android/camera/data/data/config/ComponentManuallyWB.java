package com.android.camera.data.data.config;

import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class ComponentManuallyWB extends ComponentData {
    public static final String MANUAL_WHITEBALANCE_VALUE = "pref_qc_manual_whitebalance_k_value_key";

    public ComponentManuallyWB(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_whitebalance_title;
    }

    public String getKey(int i) {
        return CameraSettings.KEY_WHITE_BALANCE;
    }

    public String getDefaultValue(int i) {
        return "1";
    }

    protected boolean checkValueValid(String str) {
        for (ComponentDataItem componentDataItem : getItems()) {
            if (TextUtils.equals(str, componentDataItem.mValue)) {
                return true;
            }
        }
        return false;
    }

    protected void resetComponentValue(int i) {
        setComponentValue(i, getDefaultValue(i));
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    private List<ComponentDataItem> initItems() {
        ArrayList arrayList = new ArrayList();
        List<ComponentDataItem> arrayList2 = new ArrayList();
        arrayList2.add(new ComponentDataItem(-1, -1, R.string.pref_camera_whitebalance_entry_auto, "1"));
        arrayList2.add(new ComponentDataItem(R.drawable.bg_white_balance_incandescent, R.drawable.ic_white_balance_incandescent, -2, "2"));
        arrayList2.add(new ComponentDataItem(R.drawable.bg_white_balance_sunlight, R.drawable.ic_white_balance_sunlight, -2, "5"));
        arrayList2.add(new ComponentDataItem(R.drawable.bg_white_balance_fluorescent, R.drawable.ic_white_balance_fluorescent, -2, "3"));
        arrayList2.add(new ComponentDataItem(R.drawable.bg_white_balance_cloudy, R.drawable.ic_white_balance_cloudy, -2, "6"));
        if (b.gr() && DataRepository.dataItemFeature().fv()) {
            arrayList2.add(new ComponentDataItem(R.drawable.bg_white_balance_manual, R.drawable.ic_white_balance_manual, -2, "manual"));
        }
        return arrayList2;
    }

    public void setCustomWB(int i) {
        this.mParentDataItem.editor().putInt("pref_qc_manual_whitebalance_k_value_key", i).apply();
    }

    public int getCustomWB() {
        return this.mParentDataItem.getInt("pref_qc_manual_whitebalance_k_value_key", 4200);
    }
}
