package com.bumptech.glide.load.model;

import android.content.res.AssetManager;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.h;
import com.bumptech.glide.load.a.m;
import com.bumptech.glide.load.f;
import java.io.InputStream;

/* compiled from: AssetUriLoader */
public class a<Data> implements m<Uri, Data> {
    private static final String iG = "android_asset";
    private static final String iH = "file:///android_asset/";
    private static final int iI = iH.length();
    private final AssetManager da;
    private final a<Data> iJ;

    /* compiled from: AssetUriLoader */
    public interface a<Data> {
        d<Data> d(AssetManager assetManager, String str);
    }

    /* compiled from: AssetUriLoader */
    public static class b implements a<ParcelFileDescriptor>, n<Uri, ParcelFileDescriptor> {
        private final AssetManager da;

        public b(AssetManager assetManager) {
            this.da = assetManager;
        }

        @NonNull
        public m<Uri, ParcelFileDescriptor> a(q qVar) {
            return new a(this.da, this);
        }

        public void bR() {
        }

        public d<ParcelFileDescriptor> d(AssetManager assetManager, String str) {
            return new h(assetManager, str);
        }
    }

    /* compiled from: AssetUriLoader */
    public static class c implements a<InputStream>, n<Uri, InputStream> {
        private final AssetManager da;

        public c(AssetManager assetManager) {
            this.da = assetManager;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new a(this.da, this);
        }

        public void bR() {
        }

        public d<InputStream> d(AssetManager assetManager, String str) {
            return new m(assetManager, str);
        }
    }

    public a(AssetManager assetManager, a<Data> aVar) {
        this.da = assetManager;
        this.iJ = aVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(uri), this.iJ.d(this.da, uri.toString().substring(iI)));
    }

    /* renamed from: k */
    public boolean o(@NonNull Uri uri) {
        if ("file".equals(uri.getScheme()) && !uri.getPathSegments().isEmpty() && iG.equals(uri.getPathSegments().get(0))) {
            return true;
        }
        return false;
    }
}
