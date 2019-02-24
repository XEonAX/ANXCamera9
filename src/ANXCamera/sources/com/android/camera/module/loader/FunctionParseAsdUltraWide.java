package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera2.Camera2Proxy.UltraWideCheckCallback;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdUltraWide implements Function<CaptureResult, CaptureResult> {
    private static final int[] ULTRA_WIDE_RECOM = new int[]{2, 1};
    public static final int ULTRA_WIDE_SIDEFACE_TYPE = 2;
    public static final int ULTRA_WIDE_TOWER_BUILDING_TYPE = 1;
    private boolean mIsOpenUltraWide;
    private boolean mIsSupportUltraWide = DataRepository.dataItemFeature().isSupportUltraWide();
    private boolean mUltraWideStatus = CameraSettings.isUltraWideConfigOpen(DataRepository.dataItemGlobal().getCurrentMode());
    private WeakReference<UltraWideCheckCallback> mUltrawidecheckcallback;

    public FunctionParseAsdUltraWide(UltraWideCheckCallback ultraWideCheckCallback) {
        this.mUltrawidecheckcallback = new WeakReference(ultraWideCheckCallback);
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        if (!this.mIsSupportUltraWide || this.mUltraWideStatus) {
            return captureResult;
        }
        UltraWideCheckCallback ultraWideCheckCallback = (UltraWideCheckCallback) this.mUltrawidecheckcallback.get();
        if (ultraWideCheckCallback == null || !ultraWideCheckCallback.isUltraWideDetectStarted()) {
            return captureResult;
        }
        int ultraWideDetectedResult = CaptureResultParser.getUltraWideDetectedResult(captureResult);
        boolean isOpenUltraWide = isOpenUltraWide(ultraWideDetectedResult);
        if (this.mIsOpenUltraWide == isOpenUltraWide) {
            return captureResult;
        }
        this.mIsOpenUltraWide = isOpenUltraWide;
        ultraWideCheckCallback.onUltraWideChanged(isOpenUltraWide, ultraWideDetectedResult);
        return captureResult;
    }

    private boolean isOpenUltraWide(int i) {
        int i2 = 0;
        boolean z = i2;
        while (i2 < ULTRA_WIDE_RECOM.length) {
            z = ULTRA_WIDE_RECOM[i2] == i;
            if (z) {
                return z;
            }
            i2++;
        }
        return z;
    }
}
