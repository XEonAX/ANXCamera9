package com.android.camera.network.resource;

public interface OnDownloadListener {
    void onFinish(long j, int i);

    void onProgressUpdate(long j, int i);
}
