package com.bumptech.glide.load.resource.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.e;
import java.nio.ByteBuffer;

/* compiled from: ByteBufferRewinder */
public class a implements e<ByteBuffer> {
    private final ByteBuffer buffer;

    /* compiled from: ByteBufferRewinder */
    public static class a implements com.bumptech.glide.load.a.e.a<ByteBuffer> {
        @NonNull
        /* renamed from: d */
        public e<ByteBuffer> j(ByteBuffer byteBuffer) {
            return new a(byteBuffer);
        }

        @NonNull
        public Class<ByteBuffer> ad() {
            return ByteBuffer.class;
        }
    }

    public a(ByteBuffer byteBuffer) {
        this.buffer = byteBuffer;
    }

    @NonNull
    /* renamed from: cw */
    public ByteBuffer ag() {
        this.buffer.position(0);
        return this.buffer;
    }

    public void cleanup() {
    }
}
