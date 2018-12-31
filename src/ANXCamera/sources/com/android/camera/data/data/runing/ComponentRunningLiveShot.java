package com.android.camera.data.data.runing;

import android.util.SparseBooleanArray;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.List;

public class ComponentRunningLiveShot extends ComponentData {
    private static final String TAG = ComponentRunningLiveShot.class.getSimpleName();
    private SparseBooleanArray mIsClosed;

    public ComponentRunningLiveShot(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    public boolean isClosed(int i) {
        if (this.mIsClosed == null) {
            return false;
        }
        return this.mIsClosed.get(i);
    }

    public void setClosed(int i, boolean z) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(i, z);
    }

    public boolean isLiveShotOn(int i) {
        if (!isClosed(i) && i == 163) {
            return this.mParentDataItem.getBoolean("pref_live_shot_enabled", false);
        }
        return false;
    }

    public void setLiveShotOn(int i, boolean z) {
        setClosed(i, false);
        if (i == 163) {
            this.mParentDataItem.putBoolean("pref_live_shot_enabled", z);
        }
    }

    public int getDisplayTitleString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(TAG);
        stringBuilder.append("#getDisplayTitleString() not supported");
        throw new UnsupportedOperationException(stringBuilder.toString());
    }

    public String getKey(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(TAG);
        stringBuilder.append("#getKey() not supported");
        throw new UnsupportedOperationException(stringBuilder.toString());
    }

    public String getDefaultValue(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(TAG);
        stringBuilder.append("#getDefaultValue() not supported");
        throw new UnsupportedOperationException(stringBuilder.toString());
    }

    public List<ComponentDataItem> getItems() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(TAG);
        stringBuilder.append("#getItems() not supported");
        throw new UnsupportedOperationException(stringBuilder.toString());
    }
}
