package com.android.camera.module.loader;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;

public class SurfaceCreatedOnSubScribe implements SurfaceCreatedCallback, SingleOnSubscribe<Boolean> {
    private SingleEmitter<Boolean> mSingleEmitter;
    private SurfaceStateListener mSurfaceStateListener;

    public SurfaceCreatedOnSubScribe(SurfaceStateListener surfaceStateListener) {
        this.mSurfaceStateListener = surfaceStateListener;
    }

    public void subscribe(SingleEmitter<Boolean> singleEmitter) throws Exception {
        if (this.mSurfaceStateListener.hasSurface()) {
            this.mSingleEmitter = null;
            onSurfaceCreated(singleEmitter);
            return;
        }
        this.mSingleEmitter = singleEmitter;
    }

    public void onGlSurfaceCreated() {
        if (this.mSingleEmitter != null && !this.mSingleEmitter.isDisposed()) {
            onSurfaceCreated(this.mSingleEmitter);
            this.mSingleEmitter = null;
        }
    }

    private void onSurfaceCreated(SingleEmitter<Boolean> singleEmitter) {
        this.mSingleEmitter = singleEmitter;
        openCamera2();
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0030 A:{LOOP_END, LOOP:0: B:10:0x002e->B:11:0x0030} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @SuppressLint({"MissingPermission"})
    @TargetApi(21)
    private void openCamera2() {
        String[] cameraIdList;
        CameraAccessException e;
        int length;
        CameraManager cameraManager = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        int i = 0;
        String[] strArr = new String[0];
        try {
            cameraIdList = cameraManager.getCameraIdList();
            try {
                cameraManager.openCamera(cameraIdList[0], new StateCallback() {
                    public void onOpened(@NonNull CameraDevice cameraDevice) {
                        SurfaceCreatedOnSubScribe.this.mSingleEmitter.onSuccess(Boolean.valueOf(true));
                    }

                    public void onDisconnected(@NonNull CameraDevice cameraDevice) {
                    }

                    public void onError(@NonNull CameraDevice cameraDevice, int i) {
                    }
                }, Camera2OpenManager.getInstance().getCameraHandler());
            } catch (CameraAccessException e2) {
                e = e2;
            }
        } catch (CameraAccessException e3) {
            e = e3;
            cameraIdList = strArr;
            e.printStackTrace();
            length = cameraIdList.length;
            while (i < length) {
            }
        }
        length = cameraIdList.length;
        while (i < length) {
            String str = cameraIdList[i];
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("");
            Log.e("ids:", stringBuilder.toString());
            i++;
        }
    }
}
