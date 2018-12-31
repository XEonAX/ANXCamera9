package com.android.camera.groupshot;

import android.media.Image;
import android.media.Image.Plane;
import com.android.camera.log.Log;
import java.nio.ByteBuffer;
import java.util.Locale;

public class GroupShot {
    private static final String TAG = GroupShot.class.getSimpleName();
    private int mHeight;
    private int mMaxImageNum;
    private long mNative = 0;
    private boolean mStart;
    private int mWidth;

    private final native int addTargetRect(long j, int[] iArr);

    private final native int attach(long j, byte[] bArr);

    private final native int attachYuv(long j, ByteBuffer byteBuffer, ByteBuffer byteBuffer2, int i, int i2);

    private final native int changeMaxNum(long j, int i, int i2);

    private final native int clearImages(long j);

    private final native long createNativeObject();

    private final native void deleteNativeObject(long j);

    private final native int end(long j);

    private final native int getImage(long j, byte[] bArr);

    private final native int getImageAndSaveJpeg(long j, String str);

    private final native int getImageNum(long j);

    private final native int getJpegData(long j, int i, byte[] bArr);

    private final native int getJpegSize(long j, int i);

    private final native int getPreviewImage(long j, int i, int i2, int i3, byte[] bArr);

    private final native int getRawData(long j, int i, byte[] bArr);

    private final native int getRecommendedImageIndex(long j, int[] iArr, int i);

    private final native int getRecommendedRect(long j, int i, int i2, int[] iArr);

    private final native int getScaledImageAndSaveJpeg(long j, int i, int i2, String str);

    private final native int getScaledOutputImage(long j, int i, int i2, byte[] bArr);

    private final native int getTargetImage(long j, int i, int i2, int i3, int i4, byte[] bArr);

    private final native int getTargetNum(long j);

    private final native int getTargetRects(long j, int[] iArr);

    private final native int getYuvImage(long j, ByteBuffer byteBuffer, ByteBuffer byteBuffer2, int i, int i2);

    private final native int initializeNativeObject(long j, int i, int i2, int i3, int i4, int i5, int i6, int i7);

    private final native int saveInputImages(long j, String str);

    private final native int selectTarget(long j, int i, int i2);

    private final native int setBaseImage(long j, int i);

    private final native int setBestFace(long j);

    private final native int start(long j, int i);

    private final native int updateTargetRect(long j, int i, int[] iArr);

    public final native String getVersion();

    static {
        try {
            System.loadLibrary("morpho_groupshot");
        } catch (UnsatisfiedLinkError e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("can't loadLibrary, ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
        }
    }

    public int initialize(int i, int i2, int i3, int i4, int i5, int i6) {
        int i7 = i;
        int i8 = i3;
        int i9 = i4;
        if (!this.mStart && this.mWidth == i8 && this.mHeight == i9 && this.mMaxImageNum == i7) {
            return 0;
        }
        if (this.mStart && !(this.mWidth == 0 && this.mHeight == 0 && this.mMaxImageNum == 0)) {
            clearImages();
            finish();
        }
        if (this.mNative == 0) {
            this.mNative = createNativeObject();
            if (this.mNative == 0) {
                return -1;
            }
        }
        Log.v(TAG, String.format(Locale.ENGLISH, "initialize imageNum=%d, width=%d, height=%d, mStart=%b, mWidth=%d, mHeight=%d, mMaxImageNum=%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i3), Integer.valueOf(i4), Boolean.valueOf(this.mStart), Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight), Integer.valueOf(this.mMaxImageNum)}));
        initializeNativeObject(this.mNative, i7, i2, i8, i9, i5, i6, 0);
        this.mMaxImageNum = i7;
        this.mWidth = i8;
        this.mHeight = i9;
        this.mStart = false;
        return 0;
    }

    public boolean isUsed() {
        return this.mStart;
    }

    public void finish() {
        if (this.mNative != 0) {
            Log.v(TAG, String.format("finish mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
            deleteNativeObject(this.mNative);
            this.mWidth = 0;
            this.mHeight = 0;
            this.mMaxImageNum = 0;
            this.mStart = false;
            this.mNative = 0;
        }
    }

    public int clearImages() {
        Log.v(TAG, String.format("clearImages mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
        if (this.mNative == 0) {
            return -1;
        }
        return clearImages(this.mNative);
    }

    public int changeMaxNum(int i, int i2) {
        if (this.mNative == 0) {
            return -1;
        }
        return changeMaxNum(this.mNative, i, i2);
    }

    public int attach_start(int i) {
        Log.v(TAG, String.format("GroupShot attach start mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
        if (this.mNative == 0) {
            return -1;
        }
        this.mStart = true;
        return start(this.mNative, i);
    }

    public int attach(byte[] bArr) {
        Log.v(TAG, String.format("GroupShot attach mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
        if (this.mNative == 0) {
            return -1;
        }
        return attach(this.mNative, bArr);
    }

    public int attach(Image image) {
        Log.v(TAG, String.format("GroupShot attach mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
        if (this.mNative == 0) {
            return -1;
        }
        if (35 == image.getFormat()) {
            Plane[] planes = image.getPlanes();
            Log.d(TAG, String.format(Locale.ENGLISH, "attach: size=%dx%d stride=%dx%d", new Object[]{Integer.valueOf(image.getWidth()), Integer.valueOf(image.getHeight()), Integer.valueOf(planes[0].getRowStride()), Integer.valueOf(planes[1].getRowStride())}));
            return attachYuv(this.mNative, planes[0].getBuffer(), planes[1].getBuffer(), planes[0].getRowStride(), planes[1].getRowStride());
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("unexpected image format ");
        stringBuilder.append(image.getFormat());
        Log.e(str, stringBuilder.toString());
        return -1;
    }

    public int attach_end() {
        Log.v(TAG, String.format("GroupShot attach end, mNative=%x", new Object[]{Long.valueOf(this.mNative)}));
        if (this.mNative == 0) {
            return -1;
        }
        return end(this.mNative);
    }

    public int setBaseImage(int i) {
        if (this.mNative == 0) {
            return -1;
        }
        return setBaseImage(this.mNative, i);
    }

    public int getImageData(int i, byte[] bArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getRawData(this.mNative, i, bArr);
    }

    public int getJpegData(int i, byte[] bArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getJpegData(this.mNative, i, bArr);
    }

    public int getJpegSize(int i) {
        if (this.mNative == 0) {
            return -1;
        }
        return getJpegSize(this.mNative, i);
    }

    public int getTargetNum() {
        if (this.mNative == 0) {
            return -1;
        }
        return getTargetNum(this.mNative);
    }

    public int getTargetRects(int[] iArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getTargetRects(this.mNative, iArr);
    }

    public int getPreviewImage(int i, int i2, int i3, byte[] bArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getPreviewImage(this.mNative, i, i2, i3, bArr);
    }

    public int getScaledOutputImage(int i, int i2, byte[] bArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getScaledOutputImage(this.mNative, i, i2, bArr);
    }

    public int getTargetImage(int i, int i2, int i3, int i4, byte[] bArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getTargetImage(this.mNative, i, i2, i3, i4, bArr);
    }

    public int getRecommendedRect(int i, int i2, int[] iArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return getRecommendedRect(this.mNative, i, i2, iArr);
    }

    public int addTargetRect(int[] iArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return addTargetRect(this.mNative, iArr);
    }

    public int updateTargetRect(int i, int[] iArr) {
        if (this.mNative == 0) {
            return -1;
        }
        return updateTargetRect(this.mNative, i, iArr);
    }

    public int selectImage(int i, int i2) {
        if (this.mNative == 0) {
            return -1;
        }
        return selectTarget(this.mNative, i, i2);
    }

    public int getImageAndSaveJpeg(String str) {
        if (this.mNative == 0) {
            return -1;
        }
        Log.v(TAG, String.format("getImageAndSaveJpeg: mNative=%x filename=%s", new Object[]{Long.valueOf(this.mNative), str}));
        return getImageAndSaveJpeg(this.mNative, str);
    }

    public int getYuvImage(Image image) {
        String str;
        StringBuilder stringBuilder;
        if (image == null || 35 != image.getFormat()) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("getYuvImage: invalid image ");
            stringBuilder.append(image);
            Log.e(str, stringBuilder.toString());
            return -1;
        }
        Plane[] planes = image.getPlanes();
        int yuvImage = getYuvImage(this.mNative, planes[0].getBuffer(), planes[1].getBuffer(), planes[0].getRowStride(), planes[1].getRowStride());
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("getYuvImage: result=");
        stringBuilder.append(yuvImage);
        Log.d(str, stringBuilder.toString());
        return yuvImage;
    }

    public int getScaledImageAndSaveJpeg(int i, int i2, String str) {
        if (this.mNative == 0) {
            return -1;
        }
        Log.v(TAG, String.format("GroupShot getScaledImageAndSaveJpeg, mNative=%x filename=%s", new Object[]{Long.valueOf(this.mNative), str}));
        return getScaledImageAndSaveJpeg(this.mNative, i, i2, str);
    }

    public int saveInputImages(String str) {
        if (this.mNative == 0) {
            return -1;
        }
        return saveInputImages(this.mNative, str);
    }

    public int getRecommendedImageIndex(int[] iArr, int i) {
        if (this.mNative == 0) {
            return -1;
        }
        return getRecommendedImageIndex(this.mNative, iArr, i);
    }

    public int setBestFace() {
        if (this.mNative == 0) {
            return -1;
        }
        return setBestFace(this.mNative);
    }
}
