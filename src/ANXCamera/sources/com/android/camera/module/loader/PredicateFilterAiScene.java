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
    public boolean test(java.lang.Integer r7) {
        /*
        r6 = this;
        r0 = r6.mModuleWeakReference;
        r0 = r0.get();
        r0 = (com.android.camera.module.Camera2Module) r0;
        r1 = 0;
        if (r0 == 0) goto L_0x003c;
    L_0x000b:
        r2 = r0.isDoingAction();
        if (r2 != 0) goto L_0x003b;
    L_0x0011:
        r0 = r0.isAlive();
        if (r0 != 0) goto L_0x0018;
    L_0x0017:
        goto L_0x003b;
    L_0x0018:
        r0 = r6.mCurrentDetectedScene;
        r2 = r7.intValue();
        if (r0 == r2) goto L_0x003c;
    L_0x0020:
        r2 = java.lang.System.currentTimeMillis();
        r4 = r6.mLastChangeSceneTime;
        r2 = r2 - r4;
        r4 = 300; // 0x12c float:4.2E-43 double:1.48E-321;
        r0 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1));
        if (r0 <= 0) goto L_0x003c;
    L_0x002d:
        r7 = r7.intValue();
        r6.mCurrentDetectedScene = r7;
        r0 = java.lang.System.currentTimeMillis();
        r6.mLastChangeSceneTime = r0;
        r7 = 1;
        return r7;
    L_0x003b:
        return r1;
    L_0x003c:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.PredicateFilterAiScene.test(java.lang.Integer):boolean");
    }
}
