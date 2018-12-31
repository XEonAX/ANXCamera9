package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import com.ss.android.vesdk.VEFrameAvailableListener;
import java.nio.ByteBuffer;

@Keep
public class TEVideoUtilsCallback {
    private VEFrameAvailableListener listener;

    public boolean onFrameAvailable(ByteBuffer byteBuffer, int i, int i2, int i3) {
        return this.listener != null && this.listener.processFrame(byteBuffer, i, i2, i3);
    }

    public ByteBuffer allocateFrame(int i, int i2) {
        return ByteBuffer.allocateDirect((i * i2) * 4);
    }

    public void setListener(VEFrameAvailableListener vEFrameAvailableListener) {
        this.listener = vEFrameAvailableListener;
    }
}
