package com.android.camera.storage;

import android.content.Context;

public interface SaveRequest extends Runnable {
    int getSize();

    boolean isFinal();

    void onFinish();

    void save();

    void setContextAndCallback(Context context, SaverCallback saverCallback);
}
