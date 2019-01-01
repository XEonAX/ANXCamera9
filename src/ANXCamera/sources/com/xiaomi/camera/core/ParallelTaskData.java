package com.xiaomi.camera.core;

import android.location.Location;
import android.util.Log;
import com.android.camera.watermark.WaterMarkData;
import com.xiaomi.engine.FrameData;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class ParallelTaskData {
    private static final String TAG = ParallelTaskData.class.getSimpleName();
    private boolean mAgeGenderAndMagicMirrorWater;
    private String mAlgorithmName;
    private boolean mBokehFrontCamera;
    private ICustomCaptureResult mCaptureResult;
    private long mCoverFrameTimestamp;
    private boolean mDeparted;
    private List<WaterMarkData> mFaceWaterMarkList;
    private int mFilterId;
    private boolean mHasDualWaterMark;
    private boolean mIsFrontCamera;
    private byte[] mJpegImageData;
    private int mJpegRotation;
    private int mLightingPattern;
    private Location mLocation;
    private boolean mMirror;
    private boolean mNeedCrateThumbnail;
    private int mOrientation;
    private int mOutputHeight;
    private int mOutputWidth;
    private int mParallelType;
    private int mPictureHeight;
    private PictureInfo mPictureInfo;
    private int mPictureWidth;
    private byte[] mPortraitDepthData;
    private byte[] mPortraitRawData;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private List<FrameData> mResultFrameDataList;
    private String mSavePath;
    private int mShootOrientation;
    private float mShootRotation;
    private String mSuffix;
    private long mTimeStamp;
    private String mTimeWaterMarkString;
    private byte[] mVideoRawData = null;

    public ParallelTaskData(long j, int i, String str) {
        this.mTimeStamp = j;
        this.mParallelType = i;
        this.mSavePath = str;
        this.mResultFrameDataList = new ArrayList(2);
    }

    public void setCaptureResult(ICustomCaptureResult iCustomCaptureResult) {
        this.mCaptureResult = iCustomCaptureResult;
    }

    public void checkThread() {
    }

    public synchronized void fillMp4Data(byte[] bArr, long j) {
        checkThread();
        if (this.mVideoRawData == null) {
            this.mVideoRawData = bArr;
            this.mCoverFrameTimestamp = j;
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("fillMp4Data: video = ");
            stringBuilder.append(bArr);
            stringBuilder.append("; timestamp = ");
            stringBuilder.append(j);
            Log.d(str, stringBuilder.toString());
        } else {
            throw new IllegalStateException("algo fillMp4Data: microvideo already set");
        }
    }

    public void refillJpegData(byte[] bArr) {
        this.mJpegImageData = bArr;
    }

    public synchronized void fillJpegData(byte[] bArr, int i) {
        checkThread();
        switch (i) {
            case 1:
                if (this.mJpegImageData == null) {
                    this.mJpegImageData = bArr;
                    break;
                }
                throw new RuntimeException("algo fillJpegData: jpeg already set");
            case 2:
                if (this.mPortraitRawData == null) {
                    this.mPortraitRawData = bArr;
                    break;
                }
                throw new RuntimeException("algo fillJpegData: raw already set");
            case 3:
                if (this.mPortraitDepthData == null) {
                    this.mPortraitDepthData = new byte[bArr.length];
                    System.arraycopy(bArr, 0, this.mPortraitDepthData, 0, bArr.length);
                    break;
                }
                throw new RuntimeException("algo fillJpegData: depth already set");
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("fillJpegData: jpegData");
        stringBuilder.append(bArr);
        stringBuilder.append("; result = ");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
    }

    public synchronized void fillFrameData(FrameData frameData, ICustomCaptureResult iCustomCaptureResult) {
        checkThread();
        this.mResultFrameDataList.add(frameData);
        this.mCaptureResult = iCustomCaptureResult;
    }

    /* JADX WARNING: Missing block: B:29:0x00a4, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean isJpegDataReady() {
        boolean z = false;
        if (this.mDeparted) {
            return false;
        }
        switch (this.mParallelType) {
            case -2:
            case -1:
            case 0:
            case 5:
                if (this.mJpegImageData != null) {
                    z = true;
                    break;
                }
                break;
            case 1:
                if (!(this.mJpegImageData == null || this.mVideoRawData == null)) {
                    z = true;
                    break;
                }
            case 2:
            case 6:
                if (!(this.mJpegImageData == null || this.mPortraitRawData == null || this.mPortraitDepthData == null)) {
                    z = true;
                    break;
                }
        }
        String str;
        StringBuilder stringBuilder;
        if (z) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("isJpegDataReady: object = ");
            stringBuilder.append(this);
            stringBuilder.append("; mParallelType = ");
            stringBuilder.append(this.mParallelType);
            Log.d(str, stringBuilder.toString());
        } else {
            str = TAG;
            stringBuilder = new StringBuilder();
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
            stringBuilder.append("; result = false");
            Log.d(str, stringBuilder.toString());
        }
    }

    /* JADX WARNING: Missing block: B:19:0x001c, code:
            return r1;
     */
    /* JADX WARNING: Missing block: B:25:0x0028, code:
            return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean isFrameDataReady() {
        boolean z = false;
        if (this.mDeparted) {
            return false;
        }
        switch (this.mParallelType) {
            case 5:
                if (this.mResultFrameDataList.size() == 1) {
                    z = true;
                    break;
                }
                break;
            case 6:
                if (this.mResultFrameDataList.size() == 2) {
                    z = true;
                    break;
                }
                break;
            default:
                return false;
        }
    }

    public void fillParameter(boolean z, boolean z2, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, float f, int i9, Location location, String str, List<WaterMarkData> list, boolean z3, boolean z4, int i10, int i11, boolean z5, String str2, PictureInfo pictureInfo, String str3, boolean z6) {
        this.mHasDualWaterMark = z;
        this.mMirror = z2;
        this.mLightingPattern = i;
        this.mPreviewWidth = i2;
        this.mPreviewHeight = i3;
        this.mPictureWidth = i4;
        this.mPictureHeight = i5;
        this.mFilterId = i6;
        this.mOrientation = i7;
        this.mJpegRotation = i8;
        this.mShootRotation = f;
        this.mShootOrientation = i9;
        this.mLocation = location;
        this.mTimeWaterMarkString = str;
        this.mFaceWaterMarkList = list;
        this.mAgeGenderAndMagicMirrorWater = z3;
        this.mIsFrontCamera = z4;
        this.mOutputWidth = i10;
        this.mOutputHeight = i11;
        this.mBokehFrontCamera = z5;
        this.mAlgorithmName = str2;
        this.mPictureInfo = pictureInfo;
        this.mSuffix = str3;
        this.mNeedCrateThumbnail = z6;
    }

    public void setDeparted() {
        this.mDeparted = true;
        this.mJpegImageData = null;
        this.mPortraitRawData = null;
        this.mPortraitDepthData = null;
        if (this.mResultFrameDataList.size() > 0) {
            for (FrameData bufferImage : this.mResultFrameDataList) {
                bufferImage.getBufferImage().close();
            }
            this.mResultFrameDataList.clear();
        }
    }

    public int getProcessUsedMemorySize() {
        if (this.mParallelType != 6) {
            return 12192768;
        }
        return 24385536;
    }

    public void copyParameter(ParallelTaskData parallelTaskData) {
    }

    public synchronized byte[] getMicroVideoData() {
        if (this.mVideoRawData != null) {
        } else {
            throw new IllegalStateException("algo fillMp4Data: microvideo not set yet");
        }
        return this.mVideoRawData;
    }

    public synchronized long getCoverFrameTimestamp() {
        return this.mCoverFrameTimestamp;
    }

    public byte[] getJpegImageData() {
        return this.mJpegImageData;
    }

    public long getTimeStamp() {
        return this.mTimeStamp;
    }

    public byte[] getPortraitRawData() {
        return this.mPortraitRawData;
    }

    public byte[] getPortraitDepthData() {
        return this.mPortraitDepthData;
    }

    public List<FrameData> getResultFrameDataList() {
        return this.mResultFrameDataList;
    }

    public ICustomCaptureResult getCaptureResult() {
        return this.mCaptureResult;
    }

    public boolean isHasDualWaterMark() {
        return this.mHasDualWaterMark;
    }

    public int getLightingPattern() {
        return this.mLightingPattern;
    }

    public String getTimeWaterMarkString() {
        return this.mTimeWaterMarkString;
    }

    public int getParallelType() {
        return this.mParallelType;
    }

    public int getPreviewWidth() {
        return this.mPreviewWidth;
    }

    public int getPreviewHeight() {
        return this.mPreviewHeight;
    }

    public int getPictureWidth() {
        return this.mPictureWidth;
    }

    public int getPictureHeight() {
        return this.mPictureHeight;
    }

    public Location getLocation() {
        return this.mLocation;
    }

    public int getJpegRotation() {
        return this.mJpegRotation;
    }

    public String getSavePath() {
        return this.mSavePath;
    }

    public int getFilterId() {
        return this.mFilterId;
    }

    public boolean isMirror() {
        return this.mMirror;
    }

    public boolean isBokehFrontCamera() {
        return this.mBokehFrontCamera;
    }

    public float getShootRotation() {
        return this.mShootRotation;
    }

    public int getShootOrientation() {
        return this.mShootOrientation;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public boolean isAgeGenderAndMagicMirrorWater() {
        return this.mAgeGenderAndMagicMirrorWater;
    }

    public List<WaterMarkData> getFaceWaterMarkList() {
        return this.mFaceWaterMarkList;
    }

    public boolean isFrontCamera() {
        return this.mIsFrontCamera;
    }

    public int getOutputWidth() {
        return this.mOutputWidth;
    }

    public int getOutputHeight() {
        return this.mOutputHeight;
    }

    public String getAlgorithmName() {
        return this.mAlgorithmName;
    }

    public PictureInfo getPictureInfo() {
        return this.mPictureInfo;
    }

    public String getSuffix() {
        return this.mSuffix;
    }

    public void setNeedCreateThumbnail(boolean z) {
        this.mNeedCrateThumbnail = z;
    }

    public boolean isNeedCrateThumbnail() {
        return this.mNeedCrateThumbnail;
    }
}
