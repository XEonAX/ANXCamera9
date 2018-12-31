package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.a;
import com.bumptech.glide.load.f;
import java.io.File;
import java.nio.ByteBuffer;

/* compiled from: ByteBufferEncoder */
public class c implements a<ByteBuffer> {
    private static final String TAG = "ByteBufferEncoder";

    public boolean a(@NonNull ByteBuffer byteBuffer, @NonNull File file, @NonNull f fVar) {
        try {
            com.bumptech.glide.util.a.a(byteBuffer, file);
            return true;
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to write data", e);
            }
            return false;
        }
    }
}
