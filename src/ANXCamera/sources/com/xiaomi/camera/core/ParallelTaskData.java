package com.xiaomi.camera.core;

import com.android.camera.log.Log;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import com.xiaomi.protocol.ICustomCaptureResult;

public class ParallelTaskData {
    private static final String GROUPSHOT_ORIGINAL_SUFFIX = "_ORG";
    private static final String TAG = ParallelTaskData.class.getSimpleName();
    private int currentModuleIndex = -1;
    private boolean isLiveShotTask;
    private boolean isNeedThumbnail;
    private int mAlgoType;
    private int mBurstNum;
    private ICustomCaptureResult mCaptureResult;
    private long mCoverFrameTimestamp;
    private ParallelTaskDataParameter mDataParameter;
    private byte[] mJpegImageData;
    private int mParallelType;
    private byte[] mPortraitDepthData;
    private byte[] mPortraitRawData;
    private String mSavePath;
    private long mTimestamp;
    private byte[] mVideoRawData = null;
    private int previewThumbnailHash;

    public ParallelTaskData(long j, int i, String str) {
        this.mTimestamp = j;
        this.mParallelType = i;
        this.mSavePath = str;
    }

    public ParallelTaskData(ParallelTaskData parallelTaskData) {
        this.mParallelType = parallelTaskData.mParallelType;
        this.mTimestamp = parallelTaskData.mTimestamp;
        this.mCaptureResult = parallelTaskData.mCaptureResult;
        this.mJpegImageData = parallelTaskData.mJpegImageData;
        this.mPortraitRawData = parallelTaskData.mPortraitRawData;
        this.mPortraitDepthData = parallelTaskData.mPortraitDepthData;
        this.mSavePath = parallelTaskData.mSavePath;
        this.mDataParameter = parallelTaskData.mDataParameter;
        this.isNeedThumbnail = parallelTaskData.isNeedThumbnail;
        this.mVideoRawData = parallelTaskData.mVideoRawData;
        this.mCoverFrameTimestamp = parallelTaskData.mCoverFrameTimestamp;
        this.isLiveShotTask = parallelTaskData.isLiveShotTask;
    }

    public void checkThread() {
    }

    public ParallelTaskData cloneTaskData(int i) {
        String stringBuilder;
        ParallelTaskData parallelTaskData = new ParallelTaskData(this);
        String savePath = getSavePath();
        String str = GROUPSHOT_ORIGINAL_SUFFIX;
        if (i > 0) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(str);
            stringBuilder2.append("_");
            stringBuilder2.append(i);
            str = stringBuilder2.toString();
        }
        i = savePath.lastIndexOf(".");
        if (i > 0) {
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(savePath.substring(0, i));
            stringBuilder3.append(str);
            stringBuilder3.append(savePath.substring(i));
            stringBuilder = stringBuilder3.toString();
        } else {
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append(savePath);
            stringBuilder4.append(str);
            stringBuilder = stringBuilder4.toString();
        }
        savePath = TAG;
        StringBuilder stringBuilder5 = new StringBuilder();
        stringBuilder5.append("[1] cloneTaskData: path=");
        stringBuilder5.append(stringBuilder);
        Log.d(savePath, stringBuilder5.toString());
        parallelTaskData.setSavePath(stringBuilder);
        parallelTaskData.setNeedThumbnail(false);
        Builder builder = new Builder(getDataParameter());
        builder.setHasDualWaterMark(false);
        builder.setTimeWaterMarkString(null);
        builder.setSaveGroupshotPrimitive(false);
        parallelTaskData.fillParameter(builder.build());
        return parallelTaskData;
    }

    public synchronized void fillJpegData(byte[] bArr, int i) {
        checkThread();
        switch (i) {
            case 0:
                if (this.mJpegImageData == null) {
                    this.mJpegImageData = bArr;
                    break;
                }
                throw new RuntimeException("algo fillJpegData: jpeg already set");
            case 1:
                if (this.mPortraitRawData == null) {
                    this.mPortraitRawData = bArr;
                    break;
                }
                throw new RuntimeException("algo fillJpegData: raw already set");
            case 2:
                if (this.mPortraitDepthData == null) {
                    this.mPortraitDepthData = new byte[bArr.length];
                    System.arraycopy(bArr, 0, this.mPortraitDepthData, 0, bArr.length);
                    break;
                }
                throw new RuntimeException("algo fillJpegData: depth already set");
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("fillJpegData: jpegData=");
        stringBuilder.append(bArr);
        stringBuilder.append("; imageType=");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
    }

    public void fillParameter(ParallelTaskDataParameter parallelTaskDataParameter) {
        this.mDataParameter = parallelTaskDataParameter;
    }

    public synchronized void fillVideoData(byte[] bArr, long j) {
        checkThread();
        if (this.mVideoRawData == null) {
            this.mVideoRawData = bArr;
            this.mCoverFrameTimestamp = j;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("fillVideoData: video = ");
            stringBuilder.append(bArr);
            stringBuilder.append(", timestamp = ");
            stringBuilder.append(j);
            Log.d(str, stringBuilder.toString());
        } else {
            throw new IllegalStateException("algo fillVideoData: microvideo already set");
        }
    }

    public int getAlgoType() {
        return this.mAlgoType;
    }

    public int getBurstNum() {
        return this.mBurstNum;
    }

    public ICustomCaptureResult getCaptureResult() {
        return this.mCaptureResult;
    }

    public synchronized long getCoverFrameTimestamp() {
        return this.mCoverFrameTimestamp;
    }

    public int getCurrentModuleIndex() {
        return this.currentModuleIndex;
    }

    public ParallelTaskDataParameter getDataParameter() {
        return this.mDataParameter;
    }

    public byte[] getJpegImageData() {
        return this.mJpegImageData;
    }

    public synchronized byte[] getMicroVideoData() {
        return this.mVideoRawData;
    }

    public int getParallelType() {
        return this.mParallelType;
    }

    public byte[] getPortraitDepthData() {
        return this.mPortraitDepthData;
    }

    public byte[] getPortraitRawData() {
        return this.mPortraitRawData;
    }

    public int getPreviewThumbnailHash() {
        return this.previewThumbnailHash;
    }

    public String getSavePath() {
        return this.mSavePath;
    }

    public long getTimestamp() {
        return this.mTimestamp;
    }

    public synchronized boolean isJpegDataReady() {
        boolean z;
        z = false;
        switch (this.mParallelType) {
            case -3:
            case 2:
            case 6:
            case 7:
                if (!(this.mJpegImageData == null || this.mPortraitRawData == null || this.mPortraitDepthData == null)) {
                    z = true;
                    break;
                }
            case -2:
            case -1:
            case 0:
            case 5:
            case 8:
            case 9:
                if (this.mJpegImageData != null) {
                    z = true;
                    break;
                }
                break;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("isJpegDataReady: object = ");
        stringBuilder.append(this);
        stringBuilder.append("; mParallelType = ");
        stringBuilder.append(this.mParallelType);
        stringBuilder.append("; mJpegImageData = ");
        stringBuilder.append(this.mJpegImageData);
        stringBuilder.append("; mPortraitRawData = ");
        stringBuilder.append(this.mPortraitRawData);
        stringBuilder.append("; mPortraitDepthData = ");
        stringBuilder.append(this.mPortraitDepthData);
        stringBuilder.append("; mVideoRawData = ");
        stringBuilder.append(this.mVideoRawData);
        stringBuilder.append("; result = ");
        stringBuilder.append(z);
        Log.d(str, stringBuilder.toString());
        return z;
    }

    public synchronized boolean isLiveShotTask() {
        return this.isLiveShotTask;
    }

    public boolean isNeedThumbnail() {
        return this.isNeedThumbnail;
    }

    public void refillJpegData(byte[] bArr) {
        this.mJpegImageData = bArr;
    }

    public void releaseImageData() {
        this.mVideoRawData = null;
        this.mJpegImageData = null;
        this.mPortraitRawData = null;
        this.mPortraitDepthData = null;
    }

    public void setAlgoType(int i) {
        this.mAlgoType = i;
    }

    public void setBurstNum(int i) {
        this.mBurstNum = i;
    }

    public void setCaptureResult(ICustomCaptureResult iCustomCaptureResult) {
        this.mCaptureResult = iCustomCaptureResult;
    }

    public void setCurrentModuleIndex(int i) {
        this.currentModuleIndex = i;
    }

    public synchronized void setLiveShotTask(boolean z) {
        this.isLiveShotTask = z;
    }

    public void setNeedThumbnail(boolean z) {
        this.isNeedThumbnail = z;
    }

    public void setPreviewThumbnailHash(int i) {
        this.previewThumbnailHash = i;
    }

    public void setSavePath(String str) {
        this.mSavePath = str;
    }

    public void setTimestamp(long j) {
        this.mTimestamp = j;
    }
}
