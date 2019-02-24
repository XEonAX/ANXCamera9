package com.miui.extravideo.common;

import android.media.MediaFormat;

public class MediaParamsHolder {
    private static final String KEY_FORMAT_CROP_BOTTOM = "crop-bottom";
    private static final String KEY_FORMAT_CROP_LEFT = "crop-left";
    private static final String KEY_FORMAT_CROP_TOP = "crop-top";
    public int intervalPaddingSize = 0;
    public int leftPaddingSize = 0;
    public String mimeType;
    public int stride = 0;
    public int topPaddingSize = 0;
    public int videoDegree = 0;
    public int videoHeight = 0;
    public int videoWidth = 0;

    public void setFormat(MediaFormat mediaFormat) {
        this.stride = mediaFormat.getInteger("stride");
        this.topPaddingSize = mediaFormat.getInteger(KEY_FORMAT_CROP_TOP);
        int integer = mediaFormat.getInteger(KEY_FORMAT_CROP_BOTTOM);
        this.leftPaddingSize = mediaFormat.getInteger(KEY_FORMAT_CROP_LEFT);
        this.intervalPaddingSize = (mediaFormat.getInteger("height") - ((integer - this.topPaddingSize) + 1)) - this.topPaddingSize;
    }
}
