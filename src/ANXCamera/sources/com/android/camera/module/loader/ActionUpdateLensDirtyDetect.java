package com.android.camera.module.loader;

import com.android.camera.CameraSettings;
import com.android.camera.module.BaseModule;
import io.reactivex.functions.Action;
import java.lang.ref.WeakReference;

public class ActionUpdateLensDirtyDetect implements Action {
    private boolean mIsOnCreate;
    private WeakReference<BaseModule> mModuleWeakReference;

    public ActionUpdateLensDirtyDetect(BaseModule baseModule, boolean z) {
        this.mModuleWeakReference = new WeakReference(baseModule);
        this.mIsOnCreate = z;
    }

    public void run() throws Exception {
        BaseModule baseModule = (BaseModule) this.mModuleWeakReference.get();
        if (baseModule != null) {
            if (this.mIsOnCreate) {
                CameraSettings.setLensDirtyDetectEnable(false);
            } else {
                CameraSettings.addLensDirtyDetectedTimes();
            }
            baseModule.updateLensDirtyDetect(true);
        }
    }
}
