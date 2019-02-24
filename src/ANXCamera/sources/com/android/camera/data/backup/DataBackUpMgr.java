package com.android.camera.data.backup;

public class DataBackUpMgr {
    DataBackUp mDataBackUp = new DataActionBackUpImpl();

    public DataBackUp backUp() {
        return this.mDataBackUp;
    }
}
