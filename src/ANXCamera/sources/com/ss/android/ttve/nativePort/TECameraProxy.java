package com.ss.android.ttve.nativePort;

import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.support.annotation.Keep;
import com.ss.android.ttve.common.TELogUtil;
import com.ss.android.ttve.utils.CameraInstance;
import com.ss.android.ttve.utils.CameraInstance.CameraOpenCallback;

@Keep
public class TECameraProxy extends CameraInstance {
    private static final String TAG = TECameraProxy.class.getSimpleName();
    private static long mNativeAddr = 0;
    private CameraOpenCallback mCameraOpenCallback = new CameraOpenCallback() {
        public void cameraReady() {
            TECameraProxy.this.nativeOnCameraCreate(TECameraProxy.mNativeAddr, 0);
        }
    };
    private int mCameraTextureID = 0;
    private SurfaceTexture mSurfaceTexture;
    private boolean mbSurfaceTextureReleased = false;

    private native int nativeOnCameraCreate(long j, int i);

    private native int nativeOnFrameAvailable(long j, SurfaceTexture surfaceTexture);

    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static TECameraProxy create(long j) {
        mNativeAddr = j;
        return new TECameraProxy();
    }

    public int setSurfaceTexture(Object obj, int i) {
        TELogUtil.d(TAG, "setSurfaceTexture...");
        if (i == 0) {
            TELogUtil.e(TAG, "Invalid Texture ID!");
            return -100;
        } else if (obj instanceof SurfaceTexture) {
            this.mSurfaceTexture = (SurfaceTexture) obj;
            this.mSurfaceTexture.setOnFrameAvailableListener(new OnFrameAvailableListener() {
                public synchronized void onFrameAvailable(SurfaceTexture surfaceTexture) {
                    if (!TECameraProxy.this.mbSurfaceTextureReleased) {
                        TECameraProxy.this.nativeOnFrameAvailable(TECameraProxy.mNativeAddr, surfaceTexture);
                    }
                }
            });
            return 0;
        } else {
            TELogUtil.e(TAG, "Invalid SurfaceTexture!");
            return -100;
        }
    }

    public synchronized boolean open(int i) {
        return tryOpenCamera(this.mCameraOpenCallback, i);
    }

    public synchronized void startPreview() {
        startPreview(this.mSurfaceTexture);
        this.mbSurfaceTextureReleased = false;
    }

    public synchronized void stopCamera() {
        this.mbSurfaceTextureReleased = true;
        this.mSurfaceTexture.setOnFrameAvailableListener(null);
        super.stopCamera();
    }

    public synchronized void getNextFrame() {
        this.mSurfaceTexture.updateTexImage();
    }

    public synchronized boolean switchCamera(int i) {
        if (!tryOpenCamera(this.mCameraOpenCallback, i)) {
            return false;
        }
        startPreview(this.mSurfaceTexture);
        return true;
    }
}
