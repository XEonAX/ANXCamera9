package com.arcsoft.camera.wideselfie;

import android.graphics.Bitmap;
import java.nio.ByteBuffer;

public class WideSelfieEngine {
    public static final int MPAF_16BITS = 83886080;
    public static final int MPAF_32BITS = 117440512;
    public static final int MPAF_BGR = 4096;
    public static final int MPAF_OTHERS_NV21 = 1879048194;
    public static final int MPAF_RGB16_R5G6B5 = (MPAF_MAKE_B(5) | ((MPAF_MAKE_R(5) | 352321536) | MPAF_MAKE_G(6)));
    public static final int MPAF_RGB32_A8R8G8B8 = (MPAF_MAKE_B(8) | ((MPAF_MAKE_R(8) | 922746880) | MPAF_MAKE_G(8)));
    public static final int MPAF_RGB32_B8G8R8A8 = (MPAF_RGB32_A8R8G8B8 | 4096);
    public static final int MPAF_RGBA_BASE = 805306368;
    public static final int MPAF_RGB_BASE = 268435456;
    private static final String a = WideSelfieEngine.class.getName();
    private static WideSelfieEngine b = null;
    private AwsInitParameter c = null;
    private WideSelfieCallback d = null;
    private boolean e = false;

    private static final class a {
        int a;
        int b;
        int c;
        int d;
        String e;
        String f;
        String g;

        private a() {
        }
    }

    static {
        System.loadLibrary("camera_wideselfie_mpbase");
        System.loadLibrary("arcsoft_wideselfie");
        System.loadLibrary("jni_wideselfie");
    }

    private native byte[] ConvertCS(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6);

    private native Bitmap ConvertCS2Bitmap(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z);

    private native byte[] ConvertCSEx(ByteBuffer[] byteBufferArr, int i, int i2, int i3, int i4, int i5, int i6);

    private native byte[] ConvertCSExx(long j, int i, int i2, int i3);

    public static final int MPAF_MAKE_B(int i) {
        return (i - 1) << 0;
    }

    public static final int MPAF_MAKE_G(int i) {
        return (i - 1) << 4;
    }

    public static final int MPAF_MAKE_R(int i) {
        return (i - 1) << 8;
    }

    private native void SetLogLevel(int i);

    private a a() {
        return native_version();
    }

    private int b() {
        return native_capture();
    }

    private WideSelfieCallback c() {
        return this.d;
    }

    public static synchronized WideSelfieEngine getSingleInstance() {
        WideSelfieEngine wideSelfieEngine;
        synchronized (WideSelfieEngine.class) {
            if (b == null) {
                synchronized (WideSelfieEngine.class) {
                    if (b == null) {
                        b = new WideSelfieEngine();
                    }
                }
            }
            wideSelfieEngine = b;
        }
        return wideSelfieEngine;
    }

    private native int native_capture();

    private native int native_init(int i, int i2, float f, float f2, float f3, float f4, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, float f5, int i13, int i14, boolean z);

    private native int native_init_default(int i, int i2);

    private native int native_process(int i, byte[] bArr);

    private native int native_push_sensor_data_in(float[] fArr, long j, int i);

    private native void native_register_callback(WideSelfieCallback wideSelfieCallback);

    private native int native_uninit();

    private native a native_version();

    public synchronized byte[] convertCS(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6) {
        return ConvertCS(bArr, i, i2, i3, i4, i5, i6);
    }

    public synchronized Bitmap convertCS2Bitmap(byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
        return ConvertCS2Bitmap(bArr, i, i2, i3, i4, i5, i6, i7, i8, z);
    }

    public synchronized byte[] convertCSEx(ByteBuffer[] byteBufferArr, int i, int i2, int i3, int i4, int i5, int i6, boolean z) {
        return ConvertCSEx(byteBufferArr, i, i2, i3, i4, i5, i6);
    }

    public synchronized byte[] convertCSExx(long j, int i, int i2, int i3) {
        return ConvertCSExx(j, i, i2, i3);
    }

    public synchronized int init(AwsInitParameter awsInitParameter) {
        Throwable th;
        AwsInitParameter awsInitParameter2 = awsInitParameter;
        synchronized (this) {
            try {
                boolean z = false;
                if (this.e) {
                    return 0;
                } else if (awsInitParameter2 == null) {
                    return 2;
                } else {
                    this.c = awsInitParameter2;
                    try {
                        int native_init = native_init(this.c.getBufferSize(), this.c.mode, this.c.cameraViewAngleForWidth, this.c.cameraViewAngleForHeight, this.c.resultAngleForWidth, this.c.resultAngleForHeight, this.c.getSrcFormat(), this.c.getFullImageWidth(), this.c.getFullImageHeight(), this.c.getThumbForamt(), this.c.getThumbnailWidth(), this.c.getThumbnailHeight(), this.c.maxResultWidth, this.c.progressBarThumbHeight, this.c.guideStopBarThumbHeight, this.c.guideStableBarThumbHeight, this.c.progressBarThumbHeightCropRatio, this.c.changeDirectionThumbThreshold, this.c.getDeviceOrientation(), this.c.convertNV21);
                        if (native_init == 0) {
                            z = true;
                        }
                        try {
                            this.e = z;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("init res = ");
                            stringBuilder.append(native_init);
                            stringBuilder.append(" ,mIsInit = ");
                            stringBuilder.append(this.e);
                            b.a("Arcsoft_Log", stringBuilder.toString());
                            return native_init;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        throw th;
                    }
                }
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        }
    }

    public synchronized int process(int i, byte[] bArr) {
        return bArr != null ? native_process(i, bArr) : 2;
    }

    public synchronized void setOnCallback(WideSelfieCallback wideSelfieCallback) {
        this.d = wideSelfieCallback;
        if (this.d != null) {
            native_register_callback(this.d);
        }
    }

    public synchronized void setSensorData(float[] fArr, long j, int i) {
        native_push_sensor_data_in(fArr, j, i);
    }

    public synchronized int uninit() {
        boolean z = false;
        if (!this.e) {
            return 0;
        }
        int native_uninit = native_uninit();
        if (native_uninit != 0) {
            z = true;
        }
        this.e = z;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("uninit res = ");
        stringBuilder.append(native_uninit);
        stringBuilder.append(" ,mIsInit = ");
        stringBuilder.append(this.e);
        b.a("Arcsoft_Log", stringBuilder.toString());
        return native_uninit;
    }
}
