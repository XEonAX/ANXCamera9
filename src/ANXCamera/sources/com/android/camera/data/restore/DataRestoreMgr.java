package com.android.camera.data.restore;

public class DataRestoreMgr {
    private DataRestore dataRestore = new DataRestoreImpl();

    public final class DataRestoreImpl implements DataRestore {
    }

    public DataRestore restore() {
        return this.dataRestore;
    }
}
