package com.android.camera.data.data.config;

import android.util.SparseBooleanArray;
import com.aeonax.camera.R;
import com.android.camera.constant.ModeConstant;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.FilterInfo;
import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ComponentConfigFilter extends ComponentData {
    private SparseBooleanArray mIsClosed;

    public ComponentConfigFilter(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public boolean isClosed(int i) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        return this.mIsClosed.get(i);
    }

    public void setClosed(boolean z, int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setClosed: mode = ");
        stringBuilder.append(i);
        stringBuilder.append(", close = ");
        stringBuilder.append(z);
        Log.d("ComponentConfigFilter", stringBuilder.toString());
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(i, z);
    }

    public int getDisplayTitleString() {
        return R.string.pref_camera_coloreffect_title;
    }

    public String getKey(int i) {
        return "pref_camera_shader_coloreffect_key";
    }

    public String getDefaultValue(int i) {
        return String.valueOf(FilterInfo.FILTER_ID_NONE);
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getComponentValue(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getComponentValue: isClosed(mode) = ");
        stringBuilder.append(isClosed(i));
        stringBuilder.append(", mode = ");
        stringBuilder.append(i);
        Log.d("ComponentConfigFilter", stringBuilder.toString());
        if (isClosed(i)) {
            return String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        return super.getComponentValue(i);
    }

    public void mapToItems(ArrayList<FilterInfo> arrayList) {
        this.mItems = new ArrayList(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            FilterInfo filterInfo = (FilterInfo) it.next();
            this.mItems.add(new ComponentDataItem(filterInfo.getIconResId(), filterInfo.getIconResId(), filterInfo.getNameResId(), String.valueOf(filterInfo.getId())));
        }
    }

    public void clearFilterSelected(ProviderEditor providerEditor) {
        if (providerEditor != null) {
            for (int i : ModeConstant.getAllModes()) {
                providerEditor.putString(getKey(i), getDefaultValue(i));
            }
        }
    }
}
