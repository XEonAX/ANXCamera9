package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.f;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* compiled from: ByteArrayLoader */
public class b<Data> implements m<byte[], Data> {
    private final b<Data> iK;

    /* compiled from: ByteArrayLoader */
    public interface b<Data> {
        Class<Data> ad();

        Data h(byte[] bArr);
    }

    /* compiled from: ByteArrayLoader */
    public static class a implements n<byte[], ByteBuffer> {
        @NonNull
        public m<byte[], ByteBuffer> a(@NonNull q qVar) {
            return new b(new b<ByteBuffer>() {
                /* renamed from: g */
                public ByteBuffer h(byte[] bArr) {
                    return ByteBuffer.wrap(bArr);
                }

                public Class<ByteBuffer> ad() {
                    return ByteBuffer.class;
                }
            });
        }

        public void bR() {
        }
    }

    /* compiled from: ByteArrayLoader */
    private static class c<Data> implements com.bumptech.glide.load.a.d<Data> {
        private final b<Data> iK;
        private final byte[] iM;

        c(byte[] bArr, b<Data> bVar) {
            this.iM = bArr;
            this.iK = bVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            aVar.i(this.iK.h(this.iM));
        }

        public void cleanup() {
        }

        public void cancel() {
        }

        @NonNull
        public Class<Data> ad() {
            return this.iK.ad();
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    /* compiled from: ByteArrayLoader */
    public static class d implements n<byte[], InputStream> {
        @NonNull
        public m<byte[], InputStream> a(@NonNull q qVar) {
            return new b(new b<InputStream>() {
                /* renamed from: i */
                public InputStream h(byte[] bArr) {
                    return new ByteArrayInputStream(bArr);
                }

                public Class<InputStream> ad() {
                    return InputStream.class;
                }
            });
        }

        public void bR() {
        }
    }

    public b(b<Data> bVar) {
        this.iK = bVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull byte[] bArr, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(bArr), new c(bArr, this.iK));
    }

    /* renamed from: f */
    public boolean o(@NonNull byte[] bArr) {
        return true;
    }
}
