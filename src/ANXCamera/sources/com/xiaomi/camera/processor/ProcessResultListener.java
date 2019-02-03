package com.xiaomi.camera.processor;

import com.xiaomi.camera.core.CaptureData;

public interface ProcessResultListener {
    void onProcessFinished(CaptureData captureData, boolean z);
}
