package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.util.SparseBooleanArray;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigAi extends ComponentData {
    private SparseBooleanArray mIsClosed;

    public ComponentConfigAi(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public void clearClosed() {
        if (this.mIsClosed != null) {
            this.mIsClosed.clear();
        }
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_camera_ai_scene_mode_key";
    }

    public boolean isAiSceneOn(int i) {
        return (isEmpty() || isClosed(i)) ? false : this.mParentDataItem.getBoolean(getKey(i), DataRepository.dataItemFeature().fT());
    }

    public boolean isClosed(int i) {
        return this.mIsClosed == null ? false : this.mIsClosed.get(i);
    }

    public List<ComponentDataItem> reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if (i == 163 || i == 165) {
            if (i2 == 0) {
                if (DataRepository.dataItemFeature().fZ()) {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_focusmode_normal, R.drawable.ic_gallery_play_big, R.string.accessibility_closed, "on"));
                }
            } else if (DataRepository.dataItemFeature().ga()) {
                this.mItems.add(new ComponentDataItem(R.drawable.ic_focusmode_normal, R.drawable.ic_gallery_play_big, R.string.accessibility_closed, "on"));
            }
        } else if (i == 171) {
            if (i2 == 0) {
                if (DataRepository.dataItemFeature().gb()) {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_focusmode_normal, R.drawable.ic_gallery_play_big, R.string.accessibility_closed, "on"));
                }
            } else if (DataRepository.dataItemFeature().ga()) {
                this.mItems.add(new ComponentDataItem(R.drawable.ic_focusmode_normal, R.drawable.ic_gallery_play_big, R.string.accessibility_closed, "on"));
            }
        }
        return this.mItems;
    }

    public void setAiScene(int i, boolean z) {
        if (!isEmpty()) {
            setClosed(false, i);
            this.mParentDataItem.editor().putBoolean(getKey(i), z).apply();
        }
    }

    public void setClosed(boolean z, int i) {
        if (this.mIsClosed == null) {
            this.mIsClosed = new SparseBooleanArray();
        }
        this.mIsClosed.put(i, z);
    }
}
