package com.android.camera.network.resource;

import com.android.camera.network.download.Request;

public interface LiveDownloadHelper<T extends LiveResource> {
    Request createDownloadRequest(T t);

    boolean isDownloaded(T t);
}
