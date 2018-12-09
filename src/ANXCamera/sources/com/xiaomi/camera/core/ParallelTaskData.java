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
    public synchronized boolean isJpegDataReady() {
        /*
        r4 = this;
        monitor-enter(r4);
        r0 = r4.mDeparted;	 Catch:{ all -> 0x00a5 }
        r1 = 0;
        if (r0 == 0) goto L_0x0009;
    L_0x0007:
        monitor-exit(r4);
        return r1;
    L_0x0009:
        r0 = r4.mParallelType;	 Catch:{ all -> 0x00a5 }
        r2 = 1;
        switch(r0) {
            case -2: goto L_0x002b;
            case -1: goto L_0x002b;
            case 0: goto L_0x002b;
            case 1: goto L_0x001f;
            case 2: goto L_0x0010;
            case 3: goto L_0x000f;
            case 4: goto L_0x000f;
            case 5: goto L_0x002b;
            case 6: goto L_0x0010;
            default: goto L_0x000f;
        };	 Catch:{ all -> 0x00a5 }
    L_0x000f:
        goto L_0x0033;
    L_0x0010:
        r0 = r4.mJpegImageData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x001e;
    L_0x0014:
        r0 = r4.mPortraitRawData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x001e;
    L_0x0018:
        r0 = r4.mPortraitDepthData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x001e;
    L_0x001c:
        r1 = r2;
        goto L_0x0033;
    L_0x001e:
        goto L_0x0033;
    L_0x001f:
        r0 = r4.mJpegImageData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x0029;
    L_0x0023:
        r0 = r4.mVideoRawData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x0029;
    L_0x0027:
        r1 = r2;
        goto L_0x002a;
    L_0x002a:
        goto L_0x0033;
    L_0x002b:
        r0 = r4.mJpegImageData;	 Catch:{ all -> 0x00a5 }
        if (r0 == 0) goto L_0x0031;
    L_0x002f:
        r1 = r2;
        goto L_0x0032;
    L_0x0033:
        if (r1 == 0) goto L_0x0056;
    L_0x0035:
        r0 = TAG;	 Catch:{ all -> 0x00a5 }
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00a5 }
        r2.<init>();	 Catch:{ all -> 0x00a5 }
        r3 = "isJpegDataReady: object = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r2.append(r4);	 Catch:{ all -> 0x00a5 }
        r3 = "; mParallelType = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mParallelType;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r2 = r2.toString();	 Catch:{ all -> 0x00a5 }
        android.util.Log.d(r0, r2);	 Catch:{ all -> 0x00a5 }
        goto L_0x00a3;
    L_0x0056:
        r0 = TAG;	 Catch:{ all -> 0x00a5 }
        r2 = new java.lang.StringBuilder;	 Catch:{ all -> 0x00a5 }
        r2.<init>();	 Catch:{ all -> 0x00a5 }
        r3 = "isJpegDataReady: object = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r2.append(r4);	 Catch:{ all -> 0x00a5 }
        r3 = "; mParallelType = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mParallelType;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = "; mJpegImageData = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mJpegImageData;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = "; mPortraitRawData = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mPortraitRawData;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = "; mPortraitDepthData = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mPortraitDepthData;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = "; mVideoRawData = ";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = r4.mVideoRawData;	 Catch:{ all -> 0x00a5 }
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r3 = "; result = false";
        r2.append(r3);	 Catch:{ all -> 0x00a5 }
        r2 = r2.toString();	 Catch:{ all -> 0x00a5 }
        android.util.Log.d(r0, r2);	 Catch:{ all -> 0x00a5 }
    L_0x00a3:
        monitor-exit(r4);
        return r1;
    L_0x00a5:
        r0 = move-exception;
        monitor-exit(r4);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.core.ParallelTaskData.isJpegDataReady():boolean");
    }

    /* JADX WARNING: Missing block: B:19:0x001c, code:
            return r1;
     */
    /* JADX WARNING: Missing block: B:25:0x0028, code:
            return r1;
     */
    public synchronized boolean isFrameDataReady() {
        /*
        r4 = this;
        monitor-enter(r4);
        r0 = r4.mDeparted;	 Catch:{ all -> 0x0029 }
        r1 = 0;
        if (r0 == 0) goto L_0x0008;
    L_0x0006:
        monitor-exit(r4);
        return r1;
    L_0x0008:
        r0 = r4.mParallelType;	 Catch:{ all -> 0x0029 }
        r2 = 1;
        switch(r0) {
            case 5: goto L_0x001d;
            case 6: goto L_0x0010;
            default: goto L_0x000e;
        };
    L_0x000e:
        monitor-exit(r4);
        return r1;
    L_0x0010:
        r0 = r4.mResultFrameDataList;	 Catch:{ all -> 0x0029 }
        r0 = r0.size();	 Catch:{ all -> 0x0029 }
        r3 = 2;
        if (r0 != r3) goto L_0x001b;
    L_0x0019:
        r1 = r2;
    L_0x001b:
        monitor-exit(r4);
        return r1;
    L_0x001d:
        r0 = r4.mResultFrameDataList;	 Catch:{ all -> 0x0029 }
        r0 = r0.size();	 Catch:{ all -> 0x0029 }
        if (r0 != r2) goto L_0x0027;
    L_0x0025:
        r1 = r2;
    L_0x0027:
        monitor-exit(r4);
        return r1;
    L_0x0029:
        r0 = move-exception;
        monitor-exit(r4);
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.xiaomi.camera.core.ParallelTaskData.isFrameDataReady():boolean");
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
