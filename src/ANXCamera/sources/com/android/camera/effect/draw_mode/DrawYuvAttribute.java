package com.android.camera.effect.draw_mode;

import android.media.Image;
import android.util.Size;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.watermark.WaterMarkData;
import java.util.List;

public class DrawYuvAttribute extends DrawAttribute {
    public boolean mApplyWaterMark;
    public EffectRectAttribute mAttribute;
    public long mDate;
    public int mEffectIndex;
    public Image mImage;
    public boolean mIsGradienterOn;
    public int mJpegRotation;
    public boolean mMirror;
    public int mOrientation;
    public Size mOriginalSize;
    public Size mPictureSize;
    public Size mPreviewSize;
    public float mShootRotation;
    public String mTiltShiftMode;
    public String mTimeWatermark;
    public List<WaterMarkData> mWaterInfos;

    public DrawYuvAttribute(Image image, Size size, Size size2, int i, int i2, int i3, float f, long j, boolean z, boolean z2, boolean z3, String str, String str2, EffectRectAttribute effectRectAttribute, List<WaterMarkData> list) {
        this.mImage = image;
        this.mPreviewSize = size;
        this.mPictureSize = size2;
        this.mEffectIndex = i;
        this.mOrientation = i2;
        this.mJpegRotation = i3;
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
}
