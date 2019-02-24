package com.android.camera.network.resource;

public interface OnLiveDownloadListener {
    void onFinish(String str, int i);

    void onProgressUpdate(String str, int i);
}
