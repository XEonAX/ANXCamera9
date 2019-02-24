package com.android.camera.effect.draw_mode;

import android.location.Location;
import android.net.Uri;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.watermark.WaterMarkData;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.core.PictureInfo;
import java.util.List;

public class DrawJPEGAttribute extends DrawAttribute {
    public String mAlgorithmName;
    public boolean mApplyWaterMark = true;
    public EffectRectAttribute mAttribute;
    public byte[] mData;
    public long mDate;
    public boolean mDualCameraWaterMarkEnabled;
    public int mEffectIndex;
    public ExifInterface mExif;
    public boolean mFinalImage;
    public int mHeight;
    public PictureInfo mInfo;
    public boolean mIsPortraitRawData;
    public int mJpegOrientation;
    public Location mLoc;
    public boolean mMirror;
    public boolean mNeedThumbnail;
    public int mOrientation;
    public int mPreviewHeight;
    public int mPreviewWidth;
    public float mShootRotation;
    public String mTimeWaterMarkText;
    public String mTitle;
    public Uri mUri;
    public List<WaterMarkData> mWaterInfos;
    public int mWidth;

    public DrawJPEGAttribute(byte[] bArr, boolean z, int i, int i2, int i3, int i4, int i5, EffectRectAttribute effectRectAttribute, Location location, String str, long j, int i6, int i7, float f, boolean z2, String str2, boolean z3, PictureInfo pictureInfo, List<WaterMarkData> list, boolean z4, String str3, boolean z5) {
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
        this.mWidth = i3;
        this.mHeight = i4;
        this.mData = bArr;
        this.mNeedThumbnail = z;
        this.mDate = j;
        this.mEffectIndex = i5;
        this.mAttribute = effectRectAttribute;
        this.mLoc = location;
        this.mTitle = str;
        this.mOrientation = i6;
        this.mJpegOrientation = i7;
        this.mShootRotation = f;
        this.mMirror = z2;
        this.mFinalImage = true;
        this.mAlgorithmName = str2;
        this.mApplyWaterMark = z3;
        this.mInfo = pictureInfo;
        this.mWaterInfos = list;
        this.mDualCameraWaterMarkEnabled = z4;
        this.mTimeWaterMarkText = str3;
        this.mIsPortraitRawData = z5;
        this.mTarget = 9;
    }

    protected void finalize() throws Throwable {
        super.finalize();
    }
}
