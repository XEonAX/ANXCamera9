package com.android.camera2;

import android.media.Image;
import android.util.Size;
import com.android.camera.CameraSize;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.parallel.AlgoConnector;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;

public abstract class MiCamera2ShotParallel<T> extends MiCamera2Shot<T> {
    private static final String TAG = "ShotParallelBase";
    CameraSize mCapturedImageSize;

    MiCamera2ShotParallel(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    void configParallelSession(Size size) {
        int i;
        GraphDescriptorBean graphDescriptorBean;
        if (ModuleManager.isPortraitModule()) {
            if (hasDualCamera()) {
                i = 2;
            } else {
                i = 1;
            }
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("configParallelSession: inputStreamNum = ");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
            graphDescriptorBean = new GraphDescriptorBean(32770, i, true, CameraDeviceUtil.getCameraCombinationMode(this.mMiCamera.getId()));
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, CameraDeviceUtil.getCameraCombinationMode(this.mMiCamera.getId()));
        }
        i = size.getWidth();
        int height = size.getHeight();
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("[QCFA] configParallelSession: pictureSize = ");
        stringBuilder2.append(size);
        Log.d(str2, stringBuilder2.toString());
        AlgoConnector.getInstance().getLocalBinder().configCaptureSession(new BufferFormat(i, height, 35, graphDescriptorBean));
        this.mCapturedImageSize = new CameraSize(size);
    }

    private boolean hasDualCamera() {
        return this.mMiCamera.getId() == Camera2DataContainer.getInstance().getMuxFrontCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getBokehFrontCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getMuxCameraId() || this.mMiCamera.getId() == Camera2DataContainer.getInstance().getBokehCameraId();
    }

    protected void onImageReceived(Image image, int i) {
    }

    protected void notifyResultData(T t) {
    }
}
