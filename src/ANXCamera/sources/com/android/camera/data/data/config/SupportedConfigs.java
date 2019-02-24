package com.android.camera.data.data.config;

import java.util.ArrayList;
import java.util.List;

public class SupportedConfigs {
    private List<TopConfigItem> mConfigs;
    private List<Integer> mSupportedConfigs;

    public SupportedConfigs() {
        this.mSupportedConfigs = new ArrayList();
        this.mConfigs = new ArrayList();
    }

    public SupportedConfigs(int i) {
        this.mConfigs = new ArrayList(i);
        this.mSupportedConfigs = new ArrayList(i);
    }

    public void add(int... iArr) {
        for (int valueOf : iArr) {
            this.mSupportedConfigs.add(Integer.valueOf(valueOf));
        }
    }

    public SupportedConfigs add(int i) {
        this.mSupportedConfigs.add(Integer.valueOf(i));
        return this;
    }

    public int getLength() {
        return this.mSupportedConfigs.size();
    }

    public int getConfig(int i) {
        return ((Integer) this.mSupportedConfigs.get(i)).intValue();
    }

    public int getConfigsSize() {
        if (this.mConfigs.isEmpty()) {
            return 0;
        }
        return ((TopConfigItem) this.mConfigs.get(this.mConfigs.size() - 1)).index + 1;
    }

    public void add(TopConfigItem topConfigItem) {
        this.mSupportedConfigs.add(Integer.valueOf(topConfigItem.configItem));
        this.mConfigs.add(topConfigItem);
    }

    public void set(int i, TopConfigItem topConfigItem) {
        this.mSupportedConfigs.set(i, Integer.valueOf(topConfigItem.configItem));
        this.mConfigs.set(i, topConfigItem);
    }

    public TopConfigItem getConfigItem(int i) {
        return (TopConfigItem) this.mConfigs.get(i);
    }
}
