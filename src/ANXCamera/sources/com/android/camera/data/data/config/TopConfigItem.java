package com.android.camera.data.data.config;

public class TopConfigItem {
    public int bindViewPosition;
    public int configItem = 198;
    public boolean enable = true;
    public int gravity = 0;

    public TopConfigItem(int i) {
        this.configItem = i;
    }

    public TopConfigItem(int i, int i2) {
        this.configItem = i;
        this.gravity = i2;
    }

    public TopConfigItem(int i, int i2, int i3) {
        this.bindViewPosition = i;
        this.configItem = i2;
        this.gravity = i3;
    }
}
