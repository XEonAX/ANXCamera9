package com.android.camera.effect.draw_mode;

import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.watermark.WaterMarkData;
import java.nio.ByteBuffer;
import java.util.List;

public class DrawYuvAttribute extends DrawAttribute {
    public boolean mApplyWaterMark;
    public EffectRectAttribute mAttribute;
    public long mDate;
    public int mEffectIndex;
    public int mHeight;
    public boolean mIsGradienterOn;
    public int mJpegRotation;
    public boolean mMirror;
    public int mOrientation;
    public int mOriginalHeight;
    public int mOriginalWidth;
    public int mPreviewHeight;
    public int mPreviewWidth;
    public float mShootRotation;
    public String mTiltShiftMode;
    public String mTimeWatermark;
    public ByteBuffer mUVBuffer;
    private List<WaterMarkData> mWaterInfos;
    public int mWidth;
    public ByteBuffer mYBuffer;

    public DrawYuvAttribute(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, int i, int i2, int i3, int i4, int i5, int i6, int i7, float f, long j, boolean z, boolean z2, boolean z3, String str, String str2, EffectRectAttribute effectRectAttribute, List<WaterMarkData> list) {
        this.mYBuffer = byteBuffer;
        this.mUVBuffer = byteBuffer2;
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
        this.mWidth = i3;
        this.mHeight = i4;
        this.mEffectIndex = i5;
        this.mOrientation = i6;
        this.mJpegRotation = i7;
        this.mShootRotation = f;
        this.mDate = j;
        this.mMirror = z;
        this.mApplyWaterMark = z2;
        this.mIsGradienterOn = z3;
        this.mTiltShiftMode = str;
        this.mTimeWatermark = str2;
        this.mAttribute = effectRectAttribute;
        this.mTarget = 11;
        this.mWaterInfos = list;
    }

    public List<WaterMarkData> getWaterInfos() {
        return this.mWaterInfos;
    }

    public void setWaterInfos(List<WaterMarkData> list) {
        this.mWaterInfos = list;
    }
}
