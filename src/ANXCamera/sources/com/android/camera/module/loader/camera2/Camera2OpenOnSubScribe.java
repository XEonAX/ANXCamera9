package com.android.camera.module.loader.camera2;

import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.module.loader.SurfaceCreatedCallback;
import com.android.camera.module.loader.SurfaceStateListener;
import io.reactivex.Observer;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.disposables.Disposable;

public class Camera2OpenOnSubScribe implements SurfaceCreatedCallback, Observer<Camera2Result>, SingleOnSubscribe<Camera2Result> {
    private Camera2Result mCamera2Result;
    private SingleEmitter<Camera2Result> mSingleEmitter;
    private SurfaceStateListener mSurfaceStateListener;

    public Camera2OpenOnSubScribe(SurfaceStateListener surfaceStateListener) {
        this.mSurfaceStateListener = surfaceStateListener;
    }

    public void subscribe(SingleEmitter<Camera2Result> singleEmitter) throws Exception {
        this.mCamera2Result = null;
        this.mSingleEmitter = singleEmitter;
        openCamera();
    }

    /* JADX WARNING: Missing block: B:8:0x0017, code:
            return;
     */
    public void onGlSurfaceCreated() {
        /*
        r1 = this;
        r0 = r1.mSingleEmitter;
        if (r0 == 0) goto L_0x0017;
    L_0x0004:
        r0 = r1.mSingleEmitter;
        r0 = r0.isDisposed();
        if (r0 == 0) goto L_0x000d;
    L_0x000c:
        goto L_0x0017;
    L_0x000d:
        r0 = r1.mCamera2Result;
        if (r0 == 0) goto L_0x0016;
    L_0x0011:
        r0 = r1.mCamera2Result;
        r1.submitResult(r0);
    L_0x0016:
        return;
    L_0x0017:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.camera2.Camera2OpenOnSubScribe.onGlSurfaceCreated():void");
    }

    private void openCamera() {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        Camera2OpenManager.getInstance().openCamera(dataItemGlobal.getCurrentCameraId(), dataItemGlobal.getCurrentMode(), this, false);
    }

    private void submitResult(Camera2Result camera2Result) {
        if (this.mSingleEmitter != null) {
            this.mSingleEmitter.onSuccess(camera2Result);
            this.mSingleEmitter = null;
        }
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void onNext(Camera2Result camera2Result) {
        this.mCamera2Result = camera2Result;
        if (this.mSurfaceStateListener.hasSurface()) {
            submitResult(camera2Result);
        }
    }

    public void onError(Throwable th) {
        this.mCamera2Result = Camera2Result.create(3);
        submitResult(this.mCamera2Result);
    }

    public void onComplete() {
    }
}
