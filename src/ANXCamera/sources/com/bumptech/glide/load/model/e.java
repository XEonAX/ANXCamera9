package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Base64;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.f;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: DataUrlLoader */
public final class e<Model, Data> implements m<Model, Data> {
    private static final String iO = "data:image";
    private static final String iP = ";base64";
    private final a<Data> iQ;

    /* compiled from: DataUrlLoader */
    public interface a<Data> {
        Class<Data> ad();

        void h(Data data) throws IOException;

        Data m(String str) throws IllegalArgumentException;
    }

    /* compiled from: DataUrlLoader */
    private static final class b<Data> implements d<Data> {
        private Data data;
        private final String iR;
        private final a<Data> iS;

        b(String str, a<Data> aVar) {
            this.iR = str;
            this.iS = aVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            try {
                this.data = this.iS.m(this.iR);
                aVar.i(this.data);
            } catch (Exception e) {
                aVar.b(e);
            }
        }

        public void cleanup() {
            try {
                this.iS.h(this.data);
            } catch (IOException e) {
            }
        }

        public void cancel() {
        }

        @NonNull
        public Class<Data> ad() {
            return this.iS.ad();
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    /* compiled from: DataUrlLoader */
    public static final class c<Model> implements n<Model, InputStream> {
        private final a<InputStream> iT = new a<InputStream>() {
            /* renamed from: n */
            public InputStream m(String str) {
                if (str.startsWith(e.iO)) {
                    int indexOf = str.indexOf(44);
                    if (indexOf == -1) {
                        throw new IllegalArgumentException("Missing comma in data URL.");
                    } else if (str.substring(0, indexOf).endsWith(e.iP)) {
                        return new ByteArrayInputStream(Base64.decode(str.substring(indexOf + 1), 0));
                    } else {
                        throw new IllegalArgumentException("Not a base64 image data URL.");
                    }
                }
                throw new IllegalArgumentException("Not a valid image data URL.");
            }

            /* renamed from: d */
            public void h(InputStream inputStream) throws IOException {
                inputStream.close();
            }

            public Class<InputStream> ad() {
                return InputStream.class;
            }
        };

        @NonNull
        public m<Model, InputStream> a(@NonNull q qVar) {
            return new e(this.iT);
        }

        public void bR() {
        }
    }

    public e(a<Data> aVar) {
        this.iQ = aVar;
    }

    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(model), new b(model.toString(), this.iQ));
    }

    public boolean o(@NonNull Model model) {
        return model.toString().startsWith(iO);
    }
}
