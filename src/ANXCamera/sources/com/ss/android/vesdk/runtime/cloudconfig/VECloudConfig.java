package com.ss.android.vesdk.runtime.cloudconfig;

import com.android.camera.Util;

public class VECloudConfig {
    public int mCameraPreviewResolutionHeight = 1280;
    public int mCameraPreviewResolutionWidth = Util.LIMIT_SURFACE_WIDTH;
    public int mCompileEncodeGOP = 35;
    public int mCompileEncodeHWBPS = 4096;
    public int mCompileEncodeMode = 0;
    public int mCompileEncodeSWCRF = 15;
    public int mCompileEncodeSWCRFMax = 5000000;
    public int mCompileEncodeSWCRFPreset = 0;
    public int mImportEncodeMode = 0;
    public int mImportHWEncodeBPS = 4096;
    public int mImportSWEncodeCRF = 15;
    public int mImportShortEdgeValue = 576;
    public int mRecordCameraType = 1;
    public int mRecordEncodeMode = 0;
    public int mRecordHWEncodeBPS = 4096;
    public int mRecordResolutionHeight = 1024;
    public int mRecordResolutionWidth = 576;
    public int mRecordSWEncodeCRF = 15;
}
