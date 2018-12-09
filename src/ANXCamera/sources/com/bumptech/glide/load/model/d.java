package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.f;
import java.io.File;
import java.nio.ByteBuffer;

/* compiled from: ByteBufferFileLoader */
public class d implements m<File, ByteBuffer> {
    private static final String TAG = "ByteBufferFileLoader";

    /* compiled from: ByteBufferFileLoader */
    private static final class a implements com.bumptech.glide.load.a.d<ByteBuffer> {
        private final File file;

        a(File file) {
            this.file = file;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super ByteBuffer> aVar) {
            try {
                aVar.i(com.bumptech.glide.util.a.l(this.file));
            } catch (Throwable e) {
                if (Log.isLoggable(d.TAG, 3)) {
                    Log.d(d.TAG, "Failed to obtain ByteBuffer for file", e);
                }
                aVar.b(e);
            }
        }

        public void cleanup() {
        }

        public void cancel() {
        }

        @NonNull
        public Class<ByteBuffer> ad() {
            return ByteBuffer.class;
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    /* compiled from: ByteBufferFileLoader */
    public static class b implements n<File, ByteBuffer> {
        @NonNull
        public m<File, ByteBuffer> a(@NonNull q qVar) {
            return new d();
        }

        public void bR() {
        }
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<ByteBuffer> b(@NonNull File file, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(file), new a(file));
    }

    /* renamed from: h */
    public boolean o(@NonNull File file) {
        return true;
    }
}
