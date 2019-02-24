package com.bumptech.glide.load.model;

import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: FileLoader */
public class f<Data> implements m<File, Data> {
    private static final String TAG = "FileLoader";
    private final d<Data> iV;

    /* compiled from: FileLoader */
    public static class a<Data> implements n<File, Data> {
        private final d<Data> iW;

        public a(d<Data> dVar) {
            this.iW = dVar;
        }

        @NonNull
        public final m<File, Data> a(@NonNull q qVar) {
            return new f(this.iW);
        }

        public final void bR() {
        }
    }

    /* compiled from: FileLoader */
    public interface d<Data> {
        Class<Data> ad();

        void h(Data data) throws IOException;

        Data j(File file) throws FileNotFoundException;
    }

    /* compiled from: FileLoader */
    public static class b extends a<ParcelFileDescriptor> {
        public b() {
            super(new d<ParcelFileDescriptor>() {
                /* renamed from: i */
                public ParcelFileDescriptor j(File file) throws FileNotFoundException {
                    return ParcelFileDescriptor.open(file, 268435456);
                }

                /* renamed from: a */
                public void h(ParcelFileDescriptor parcelFileDescriptor) throws IOException {
                    parcelFileDescriptor.close();
                }

                public Class<ParcelFileDescriptor> ad() {
                    return ParcelFileDescriptor.class;
                }
            });
        }
    }

    /* compiled from: FileLoader */
    private static final class c<Data> implements com.bumptech.glide.load.a.d<Data> {
        private Data data;
        private final File file;
        private final d<Data> iW;

        c(File file, d<Data> dVar) {
            this.file = file;
            this.iW = dVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            try {
                this.data = this.iW.j(this.file);
                aVar.i(this.data);
            } catch (Throwable e) {
                if (Log.isLoggable(f.TAG, 3)) {
                    Log.d(f.TAG, "Failed to open file", e);
                }
                aVar.b(e);
            }
        }

        public void cleanup() {
            if (this.data != null) {
                try {
                    this.iW.h(this.data);
                } catch (IOException e) {
                }
            }
        }

        public void cancel() {
        }

        @NonNull
        public Class<Data> ad() {
            return this.iW.ad();
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    /* compiled from: FileLoader */
    public static class e extends a<InputStream> {
        public e() {
            super(new d<InputStream>() {
                /* renamed from: k */
                public InputStream j(File file) throws FileNotFoundException {
                    return new FileInputStream(file);
                }

                /* renamed from: d */
                public void h(InputStream inputStream) throws IOException {
                    inputStream.close();
                }

                public Class<InputStream> ad() {
                    return InputStream.class;
                }
            });
        }
    }

    public f(d<Data> dVar) {
        this.iV = dVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull File file, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(file), new c(file, this.iV));
    }

    /* renamed from: h */
    public boolean o(@NonNull File file) {
        return true;
    }
}
