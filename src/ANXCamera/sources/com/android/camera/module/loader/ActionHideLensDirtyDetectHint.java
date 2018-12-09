package com.android.camera.module.loader;

import com.android.camera.Camera;
import com.android.camera.module.BaseModule;
import io.reactivex.functions.Action;
import java.lang.ref.WeakReference;

public class ActionHideLensDirtyDetectHint implements Action {
    private WeakReference<BaseModule> mModuleWeakReference;

    public ActionHideLensDirtyDetectHint(BaseModule baseModule) {
        this.mModuleWeakReference = new WeakReference(baseModule);
    }

    public void run() throws Exception {
        BaseModule baseModule = (BaseModule) this.mModuleWeakReference.get();
        if (baseModule != null) {
            Camera activity = baseModule.getActivity();
            if (activity != null) {
                activity.hideLensDirtyDetectedHint();
            }
        }
    }
}
