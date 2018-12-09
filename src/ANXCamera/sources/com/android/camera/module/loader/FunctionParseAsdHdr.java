package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera2.Camera2Proxy.HDRCheckerCallback;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdHdr implements Function<CaptureResult, CaptureResult> {
    private static final String TAG = "FunctionParseAsdScene";
    private WeakReference<HDRCheckerCallback> mHdrCheckerCallback;

    public FunctionParseAsdHdr(HDRCheckerCallback hDRCheckerCallback) {
        this.mHdrCheckerCallback = new WeakReference(hDRCheckerCallback);
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        HDRCheckerCallback hDRCheckerCallback = (HDRCheckerCallback) this.mHdrCheckerCallback.get();
        if (hDRCheckerCallback == null || !hDRCheckerCallback.isHdrDetectStarted()) {
            return captureResult;
        }
        boolean z = true;
        if (CaptureResultParser.getHDRDetectedScene(captureResult) != 1) {
            z = false;
        }
        hDRCheckerCallback.onHDRSceneChanged(z);
        return captureResult;
    }
}
