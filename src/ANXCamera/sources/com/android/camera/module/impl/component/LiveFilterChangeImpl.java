package com.android.camera.module.impl.component;

import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.ss.android.vesdk.TERecorder;

public class LiveFilterChangeImpl implements FilterProtocol {
    private TERecorder mRecorder;

    public LiveFilterChangeImpl(TERecorder tERecorder) {
        this.mRecorder = tERecorder;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
    }

    public void onFilterChanged(int i, int i2) {
    }
}
