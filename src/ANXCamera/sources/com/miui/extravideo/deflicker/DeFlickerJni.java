package com.miui.extravideo.deflicker;

public class DeFlickerJni {
    private long mDstImage;
    private long mHandle;
    private long mSrcImage;

    private static native long nativeAllocImage(int i, int i2);

    private static native void nativeConfigImage(long j, byte[] bArr);

    private static native void nativeGetImage(long j, byte[] bArr);

    private static native long nativeInitHandle();

    private static native void nativeProcess(long j, long j2, long j3);

    private static native void nativeReleaseImage(long j);

    private static native void nativeUnInitHandle(long j);

    static {
        System.loadLibrary("camera_960_mpbase");
        System.loadLibrary("deflicker_jni");
    }

    public DeFlickerJni(int i, int i2) {
        init(i, i2);
    }

    private void init(int i, int i2) {
        this.mHandle = nativeInitHandle();
        this.mSrcImage = nativeAllocImage(i, i2);
        this.mDstImage = nativeAllocImage(i, i2);
    }

    public void process(byte[] bArr) {
        nativeConfigImage(this.mSrcImage, bArr);
        nativeProcess(this.mHandle, this.mSrcImage, this.mDstImage);
        nativeGetImage(this.mDstImage, bArr);
    }

    public void release() {
        nativeUnInitHandle(this.mHandle);
        nativeReleaseImage(this.mSrcImage);
        nativeReleaseImage(this.mDstImage);
    }
}
