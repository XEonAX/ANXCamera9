package com.bumptech.glide.load.model;

import android.content.res.AssetManager;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.h;
import com.bumptech.glide.load.a.m;
import com.bumptech.glide.load.f;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.InputStream;

/* compiled from: AssetUriLoader */
public class a<Data> implements m<Uri, Data> {
    private static final String iG = "android_asset";
    private static final String iH = "file:///android_asset/";
    private static final int iI = iH.length();
    private final AssetManager dc;
    private final a<Data> iJ;

    /* compiled from: AssetUriLoader */
    public interface a<Data> {
        d<Data> d(AssetManager assetManager, String str);
    }

    /* compiled from: AssetUriLoader */
    public static class b implements a<ParcelFileDescriptor>, n<Uri, ParcelFileDescriptor> {
        private final AssetManager dc;

        public b(AssetManager assetManager) {
            this.dc = assetManager;
        }

        @NonNull
        public m<Uri, ParcelFileDescriptor> a(q qVar) {
            return new a(this.dc, this);
        }

        public void bR() {
        }

        public d<ParcelFileDescriptor> d(AssetManager assetManager, String str) {
            return new h(assetManager, str);
        }
    }

    /* compiled from: AssetUriLoader */
    public static class c implements a<InputStream>, n<Uri, InputStream> {
        private final AssetManager dc;

        public c(AssetManager assetManager) {
            this.dc = assetManager;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new a(this.dc, this);
        }

        public void bR() {
        }

        public d<InputStream> d(AssetManager assetManager, String str) {
            return new m(assetManager, str);
        }
    }

    public a(AssetManager assetManager, a<Data> aVar) {
        this.dc = assetManager;
        this.iJ = aVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(uri), this.iJ.d(this.dc, uri.toString().substring(iI)));
    }

    /* renamed from: k */
    public boolean o(@NonNull Uri uri) {
        if (ComposerHelper.COMPOSER_PATH.equals(uri.getScheme()) && !uri.getPathSegments().isEmpty() && iG.equals(uri.getPathSegments().get(0))) {
            return true;
        }
        return false;
    }
}
