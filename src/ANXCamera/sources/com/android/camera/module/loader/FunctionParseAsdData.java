package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;

public class FunctionParseAsdData implements Function<CaptureResult, AsdDataHolder> {
    private AsdDataHolder mAsdDataHolder = new AsdDataHolder();

    public AsdDataHolder apply(CaptureResult captureResult) throws Exception {
        this.mAsdDataHolder.hdrMode = CaptureResultParser.getHDRDetectedScene(captureResult);
        return null;
    }
}
