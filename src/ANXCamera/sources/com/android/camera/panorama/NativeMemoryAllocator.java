package com.android.camera.panorama;

import com.android.camera.log.Log;
import java.nio.ByteBuffer;

public class NativeMemoryAllocator {
    public static final String TAG = "NativeMemoryAllocator";

    public static native ByteBuffer allocateBuffer(int i);

    public static native void freeBuffer(ByteBuffer byteBuffer);

    public static native long getAddress(ByteBuffer byteBuffer);

    static {
        try {
            System.loadLibrary("morpho_memory_allocator");
        } catch (Throwable e) {
            Log.w(TAG, "can't loadLibrary morpho_memory_allocator", e);
        }
    }
}
