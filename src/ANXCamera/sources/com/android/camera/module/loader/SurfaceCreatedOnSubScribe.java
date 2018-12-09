package com.android.camera.module.loader;

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
    @android.annotation.SuppressLint({"MissingPermission"})
    @android.annotation.TargetApi(21)
    private void openCamera2() {
        /*
        r6 = this;
        r0 = com.android.camera.CameraAppImpl.getAndroidContext();
        r1 = "camera";
        r0 = r0.getSystemService(r1);
        r0 = (android.hardware.camera2.CameraManager) r0;
        r1 = 0;
        r2 = new java.lang.String[r1];
        r3 = r0.getCameraIdList();	 Catch:{ CameraAccessException -> 0x0028 }
        r2 = r3[r1];	 Catch:{ CameraAccessException -> 0x0026 }
        r4 = new com.android.camera.module.loader.SurfaceCreatedOnSubScribe$1;	 Catch:{ CameraAccessException -> 0x0026 }
        r4.<init>();	 Catch:{ CameraAccessException -> 0x0026 }
        r5 = com.android.camera.module.loader.camera2.Camera2OpenManager.getInstance();	 Catch:{ CameraAccessException -> 0x0026 }
        r5 = r5.getCameraHandler();	 Catch:{ CameraAccessException -> 0x0026 }
        r0.openCamera(r2, r4, r5);	 Catch:{ CameraAccessException -> 0x0026 }
        goto L_0x002d;
    L_0x0026:
        r0 = move-exception;
        goto L_0x002a;
    L_0x0028:
        r0 = move-exception;
        r3 = r2;
    L_0x002a:
        r0.printStackTrace();
    L_0x002d:
        r0 = r3.length;
    L_0x002e:
        if (r1 >= r0) goto L_0x004b;
    L_0x0030:
        r2 = r3[r1];
        r4 = "ids:";
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r5.append(r2);
        r2 = "";
        r5.append(r2);
        r2 = r5.toString();
        com.android.camera.log.Log.e(r4, r2);
        r1 = r1 + 1;
        goto L_0x002e;
    L_0x004b:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.loader.SurfaceCreatedOnSubScribe.openCamera2():void");
    }
}
