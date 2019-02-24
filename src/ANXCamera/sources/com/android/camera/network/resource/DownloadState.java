package com.android.camera.network.resource;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class DownloadState {
    public static final int STATE_DOWNLOADING = 2;
    public static final int STATE_DOWNLOAD_FAILED = 4;
    public static final int STATE_DOWNLOAD_SUCCESS = 3;
    public static final int STATE_EXIST = 1;
    public static final int STATE_NEED_DOWNLOAD = 0;
    public static final int STATE_VERIFIED = 5;

    @Retention(RetentionPolicy.SOURCE)
    public @interface StateDownload {
    }
}
