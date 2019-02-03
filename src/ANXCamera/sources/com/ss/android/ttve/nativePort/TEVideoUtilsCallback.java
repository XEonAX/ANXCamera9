package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import com.ss.android.vesdk.VEFrameAvailableListener;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;

@Keep
public class TEVideoUtilsCallback {
    private VEFrameAvailableListener listener;

    public boolean onFrameAvailable(ByteBuffer byteBuffer, int i, int i2, int i3) {
        return this.listener != null && this.listener.processFrame(byteBuffer, i, i2, i3);
    }

    public static boolean onFrameAvailable(Object obj, ByteBuffer byteBuffer, int i, int i2, int i3) {
        TEVideoUtilsCallback tEVideoUtilsCallback = (TEVideoUtilsCallback) ((WeakReference) obj).get();
        return tEVideoUtilsCallback.listener != null && tEVideoUtilsCallback.listener.processFrame(byteBuffer, i, i2, i3);
    }

    public static ByteBuffer allocateFrame(int i, int i2) {
        return ByteBuffer.allocateDirect((i * i2) * 4);
    }

    public void setListener(Object obj) {
        this.listener = (VEFrameAvailableListener) obj;
    }
}
