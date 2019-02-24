package com.ss.android.vesdk;

import java.nio.ByteBuffer;

public interface VEFrameAvailableListener {
    boolean processFrame(ByteBuffer byteBuffer, int i, int i2, int i3);
}
