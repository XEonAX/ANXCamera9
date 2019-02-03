package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.constant.AsdSceneConstant;
import com.android.camera.module.Camera2Module;
import com.android.camera2.Camera2Proxy;
import com.mi.config.b;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdScene implements Function<CaptureResult, Integer> {
    private static final String TAG = "FunctionParseAsdScene";
    private WeakReference<Camera2Module> mModuleWeakReference;

    public FunctionParseAsdScene(Camera2Module camera2Module) {
        this.mModuleWeakReference = new WeakReference(camera2Module);
    }

    public Integer apply(CaptureResult captureResult) {
        Camera2Module camera2Module = (Camera2Module) this.mModuleWeakReference.get();
        if (camera2Module != null) {
            boolean isScreenSlideOff;
            Camera2Proxy cameraDevice = camera2Module.getCameraDevice();
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
            boolean isFrontCamera = camera2Module.isFrontCamera();
            if (camera2Module.getActivity() != null) {
                isScreenSlideOff = camera2Module.getActivity().isScreenSlideOff();
            } else {
                isScreenSlideOff = false;
            }
            if (camera2Module.isPortraitMode() || isFrontCamera) {
                return Integer.valueOf(AsdSceneConstant.parseRtbSceneResult(captureResult, isFrontCamera, isScreenSlideOff));
            }
            if (num != null && num.intValue() == 4 && b.gB() && cameraDevice != null && 3 == cameraDevice.getFlashMode()) {
                return Integer.valueOf(0);
            }
        }
        return Integer.valueOf(-1);
    }
}
