package com.android.camera.data.data.config;

import java.util.ArrayList;
import java.util.List;

public class SupportedConfigs {
    private List<TopConfigItem> mConfigs;
    private List<Integer> mSupportedConfigs;
    private List<Integer> mSupportedConfigsFilterInvalid;

    public SupportedConfigs() {
        this.mSupportedConfigs = new ArrayList();
        this.mConfigs = new ArrayList();
        this.mSupportedConfigsFilterInvalid = new ArrayList();
    }

    public SupportedConfigs(int i) {
        this.mConfigs = new ArrayList(i);
        this.mSupportedConfigs = new ArrayList(i);
        this.mSupportedConfigsFilterInvalid = new ArrayList(i);
    }

    public void add(int... iArr) {
        for (int i : iArr) {
            this.mSupportedConfigs.add(Integer.valueOf(i));
            if (i != 198) {
                this.mSupportedConfigsFilterInvalid.add(Integer.valueOf(i));
            }
        }
    }

    public SupportedConfigs add(int i) {
        this.mSupportedConfigs.add(Integer.valueOf(i));
        return this;
    }

    public int getLength() {
        return this.mSupportedConfigs.size();
    }

    public Integer[] getItemsArray() {
        Integer[] numArr = new Integer[getLength()];
        this.mSupportedConfigs.toArray(numArr);
        return numArr;
    }

    public int getConfig(int i) {
        return ((Integer) this.mSupportedConfigs.get(i)).intValue();
    }

    public int getConfigTypeForViewPosition(int i) {
        for (TopConfigItem topConfigItem : this.mConfigs) {
            if (topConfigItem.bindViewPosition == i) {
                return topConfigItem.configItem;
            }
        }
        return 198;
    }

    public int findConfigPosition(int i) {
        for (int i2 = 0; i2 < this.mSupportedConfigs.size(); i2++) {
            if (i == ((Integer) this.mSupportedConfigs.get(i2)).intValue()) {
                return i2;
            }
        }
        return -1;
    }

    public int getConfigsSize() {
        return this.mConfigs.size();
    }

    public int findConfigPositionFromType(int i) {
        for (int i2 = 0; i2 < this.mConfigs.size(); i2++) {
            if (i == ((TopConfigItem) this.mConfigs.get(i2)).configItem) {
                return i2;
            }
        }
        return -1;
    }

    public TopConfigItem findConfigItem(int i) {
        for (TopConfigItem topConfigItem : this.mConfigs) {
            if (i == topConfigItem.configItem) {
                return topConfigItem;
            }
        }
        return null;
    }

    public boolean hasConfig(int i) {
        for (Integer intValue : this.mSupportedConfigs) {
            if (intValue.intValue() == i) {
                return true;
            }
        }
        return false;
    }

    public void add(List<TopConfigItem> list) {
        this.mConfigs.clear();
        this.mConfigs.addAll(list);
    }

    public List<TopConfigItem> getConfigs() {
        return this.mConfigs;
    }

    public boolean isHasConfigItem(int i) {
        for (TopConfigItem topConfigItem : this.mConfigs) {
            if (topConfigItem.configItem == i) {
                return true;
            }
        }
        return false;
    }
}
