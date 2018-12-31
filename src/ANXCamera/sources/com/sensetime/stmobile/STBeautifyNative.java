package com.sensetime.stmobile;

import com.sensetime.stmobile.model.STMobile106;

public class STBeautifyNative {
    private long nativeHandle;

    public native int createInstance(int i, int i2);

    public native void destroyBeautify();

    public native int processBufferInGLContext(byte[] bArr, int i, int i2, int i3, STMobile106[] sTMobile106Arr, byte[] bArr2, int i4, STMobile106[] sTMobile106Arr2);

    public native int processBufferNotInGLContext(byte[] bArr, int i, int i2, int i3, STMobile106[] sTMobile106Arr, byte[] bArr2, int i4, STMobile106[] sTMobile106Arr2);

    public native int processTexture(int i, int i2, int i3, STMobile106[] sTMobile106Arr, int i4, STMobile106[] sTMobile106Arr2);

    public native int processTextureAndOutputTexture(int i, int i2, int i3, STMobile106[] sTMobile106Arr, int i4, byte[] bArr, int i5, STMobile106[] sTMobile106Arr2);

    public native int setParam(int i, float f);

    static {
        System.loadLibrary("st_mobile");
        System.loadLibrary("stmobile_jni");
    }
}
