package com.android.camera.module.loader;

import com.android.camera.module.Camera2Module;
import io.reactivex.functions.Predicate;
import java.lang.ref.WeakReference;

public class PredicateFilterAiScene implements Predicate<Integer> {
    private static final String TAG = "PredicateFilterAiScene";
    private int mCurrentDetectedScene;
    private long mLastChangeSceneTime = 0;
    private WeakReference<Camera2Module> mModuleWeakReference;

    public PredicateFilterAiScene(Camera2Module camera2Module) {
        this.mModuleWeakReference = new WeakReference(camera2Module);
    }

    /* JADX WARNING: Missing block: B:12:0x003b, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean test(Integer num) {
        Camera2Module camera2Module = (Camera2Module) this.mModuleWeakReference.get();
        if (camera2Module == null || camera2Module.isDoingAction() || !camera2Module.isAlive() || this.mCurrentDetectedScene == num.intValue() || System.currentTimeMillis() - this.mLastChangeSceneTime <= 300) {
            return false;
        }
        this.mCurrentDetectedScene = num.intValue();
        this.mLastChangeSceneTime = System.currentTimeMillis();
        return true;
    }
}
