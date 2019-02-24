package com.android.camera.data.cloud;

public class DataCloudItemConfig extends DataCloudItemBase {
    public static final String KEY = "cloud_item_";
    private int mCameraId;

    public DataCloudItemConfig(int i) {
        this.mCameraId = i;
    }

    public String provideKey() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(KEY);
        stringBuilder.append(this.mCameraId);
        return stringBuilder.toString();
    }
}
