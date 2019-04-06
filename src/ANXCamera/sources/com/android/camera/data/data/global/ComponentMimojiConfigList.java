package com.android.camera.data.data.global;

import android.support.annotation.NonNull;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import java.util.ArrayList;
import java.util.List;

public class ComponentMimojiConfigList extends ComponentData {
    public ComponentMimojiConfigList(DataItemGlobal dataItemGlobal) {
        super(dataItemGlobal);
    }

    private List<ComponentDataItem> initItems() {
        return new ArrayList();
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        if (this.mItems == null) {
            this.mItems = initItems();
        }
        return this.mItems;
    }

    public String getKey(int i) {
        return null;
    }
}
