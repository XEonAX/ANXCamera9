package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.data.DataRepository;
import com.android.camera2.Camera2Proxy.UltraWideCheckCallback;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdUltraWide implements Function<CaptureResult, CaptureResult> {
    private boolean mIsOpenUltraWide;
    private WeakReference<UltraWideCheckCallback> mUltrawidecheckcallback;

    public FunctionParseAsdUltraWide(UltraWideCheckCallback ultraWideCheckCallback) {
        this.mUltrawidecheckcallback = new WeakReference(ultraWideCheckCallback);
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        if (!DataRepository.dataItemFeature().fu()) {
            return captureResult;
        }
        UltraWideCheckCallback ultraWideCheckCallback = (UltraWideCheckCallback) this.mUltrawidecheckcallback.get();
        if (ultraWideCheckCallback == null || !ultraWideCheckCallback.isUltraWideDetectStarted()) {
            return captureResult;
        }
        boolean z = true;
        if (CaptureResultParser.getUltraWideDetectedResult(captureResult) != 1) {
            z = false;
        }
        if (this.mIsOpenUltraWide == z) {
            return captureResult;
        }
        this.mIsOpenUltraWide = z;
        ultraWideCheckCallback.onUltraWideChanged(z);
        return captureResult;
    }
}
