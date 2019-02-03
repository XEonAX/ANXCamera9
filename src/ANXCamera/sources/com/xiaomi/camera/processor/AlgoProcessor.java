package com.xiaomi.camera.processor;

import android.support.annotation.NonNull;
import com.xiaomi.camera.core.CaptureData;

public interface AlgoProcessor {
    void doProcess(@NonNull CaptureData captureData, ProcessResultListener processResultListener);
}
