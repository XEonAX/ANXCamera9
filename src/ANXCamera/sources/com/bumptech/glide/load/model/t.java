package com.bumptech.glide.load.model;

import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.f;
import java.io.File;
import java.io.InputStream;

/* compiled from: StringLoader */
public class t<Data> implements m<String, Data> {
    private final m<Uri, Data> jF;

    /* compiled from: StringLoader */
    public static final class a implements n<String, AssetFileDescriptor> {
        public m<String, AssetFileDescriptor> a(q qVar) {
            return new t(qVar.b(Uri.class, AssetFileDescriptor.class));
        }

        public void bR() {
        }
    }

    /* compiled from: StringLoader */
    public static class b implements n<String, ParcelFileDescriptor> {
        @NonNull
        public m<String, ParcelFileDescriptor> a(q qVar) {
            return new t(qVar.b(Uri.class, ParcelFileDescriptor.class));
        }

        public void bR() {
        }
    }

    /* compiled from: StringLoader */
    public static class c implements n<String, InputStream> {
        @NonNull
        public m<String, InputStream> a(q qVar) {
            return new t(qVar.b(Uri.class, InputStream.class));
        }

        public void bR() {
        }
    }

    public t(m<Uri, Data> mVar) {
        this.jF = mVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull String str, int i, int i2, @NonNull f fVar) {
        Uri q = q(str);
        return q == null ? null : this.jF.b(q, i, i2, fVar);
    }

    /* renamed from: p */
    public boolean o(@NonNull String str) {
        return true;
    }

    @Nullable
    private static Uri q(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        Uri r;
        if (str.charAt(0) == '/') {
            r = r(str);
        } else {
            Uri parse = Uri.parse(str);
            if (parse.getScheme() == null) {
                r = r(str);
            } else {
                r = parse;
            }
        }
        return r;
    }

    private static Uri r(String str) {
        return Uri.fromFile(new File(str));
    }
}
