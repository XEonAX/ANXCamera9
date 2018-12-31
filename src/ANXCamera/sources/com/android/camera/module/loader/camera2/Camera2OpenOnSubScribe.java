package com.android.camera.module.loader.camera2;

import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.log.Log;
import com.android.camera.module.loader.SurfaceCreatedCallback;
import com.android.camera.module.loader.SurfaceStateListener;
import com.android.camera.snap.SnapTrigger;
import io.reactivex.Observer;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.disposables.Disposable;

public class Camera2OpenOnSubScribe implements SurfaceCreatedCallback, Observer<Camera2Result>, SingleOnSubscribe<Camera2Result> {
    private static final String TAG = "Camera2OpenOnSubScribe";
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

    /* JADX WARNING: Missing block: B:8:0x002f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onGlSurfaceCreated() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onGlSurfaceCreated: mSingleEmitter = ");
        stringBuilder.append(this.mSingleEmitter);
        Log.d(str, stringBuilder.toString());
        if (!(this.mSingleEmitter == null || this.mSingleEmitter.isDisposed() || this.mCamera2Result == null)) {
            submitResult(this.mCamera2Result);
        }
    }

    private void openCamera() {
        if (SnapTrigger.getInstance().isRunning()) {
            SnapTrigger.getInstance();
            SnapTrigger.destroy();
        }
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
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onNext: mSurfaceStateListener = ");
        stringBuilder.append(this.mSurfaceStateListener.hasSurface());
        Log.d(str, stringBuilder.toString());
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
