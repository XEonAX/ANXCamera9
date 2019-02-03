package com.xiaomi.camera.core;

import android.media.Image;
import android.support.annotation.NonNull;

public interface CaptureDataListener {
    void onCaptureDataAvailable(@NonNull CaptureData captureData);

    void onOriginalImageClosed(Image image);
}
