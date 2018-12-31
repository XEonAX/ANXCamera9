package com.android.camera.module.loader;

import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

public class FunctionResumeModule extends Func1Base<BaseModule, BaseModule> {
    public FunctionResumeModule(int i) {
        super(i);
    }

    public Scheduler getWorkThread() {
        return null;
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataRepository.getInstance().backUp().revertRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mTargetMode), dataItemGlobal.getCurrentCameraId());
        BaseModule baseModule = (BaseModule) nullHolder.get();
        baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
        baseModule.onCreate(this.mTargetMode, dataItemGlobal.getCurrentCameraId());
        baseModule.onResume();
        baseModule.registerProtocol();
        return nullHolder;
    }
}
