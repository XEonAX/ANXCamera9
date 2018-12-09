package com.android.camera.storage;

import android.net.Uri;
import com.android.camera.Thumbnail;

public interface SaverCallback {
    boolean needThumbnail(boolean z);

    void notifyNewImage(Uri uri, boolean z);

    void notifyNewVideo(Uri uri);

    void onSaveFinish(int i);

    void postHideThumbnailProgressing();

    void postUpdateThumbnail(Thumbnail thumbnail, boolean z);

    void updatePreviewThumbnailUri(Uri uri);
}
