package com.bumptech.glide.load.model;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.i;
import com.bumptech.glide.load.a.n;
import com.bumptech.glide.load.f;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* compiled from: UriLoader */
public class v<Data> implements m<Uri, Data> {
    private static final Set<String> jJ = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[]{ComposerHelper.COMPOSER_PATH, "android.resource", ComposerHelper.COMPOSER_CONTENT})));
    private final c<Data> jK;

    /* compiled from: UriLoader */
    public interface c<Data> {
        com.bumptech.glide.load.a.d<Data> l(Uri uri);
    }

    /* compiled from: UriLoader */
    public static final class a implements n<Uri, AssetFileDescriptor>, c<AssetFileDescriptor> {
        private final ContentResolver dw;

        public a(ContentResolver contentResolver) {
            this.dw = contentResolver;
        }

        public m<Uri, AssetFileDescriptor> a(q qVar) {
            return new v(this);
        }

        public void bR() {
        }

        public com.bumptech.glide.load.a.d<AssetFileDescriptor> l(Uri uri) {
            return new com.bumptech.glide.load.a.a(this.dw, uri);
        }
    }

    /* compiled from: UriLoader */
    public static class b implements n<Uri, ParcelFileDescriptor>, c<ParcelFileDescriptor> {
        private final ContentResolver dw;

        public b(ContentResolver contentResolver) {
            this.dw = contentResolver;
        }

        public com.bumptech.glide.load.a.d<ParcelFileDescriptor> l(Uri uri) {
            return new i(this.dw, uri);
        }

        @NonNull
        public m<Uri, ParcelFileDescriptor> a(q qVar) {
            return new v(this);
        }

        public void bR() {
        }
    }

    /* compiled from: UriLoader */
    public static class d implements n<Uri, InputStream>, c<InputStream> {
        private final ContentResolver dw;

        public d(ContentResolver contentResolver) {
            this.dw = contentResolver;
        }

        public com.bumptech.glide.load.a.d<InputStream> l(Uri uri) {
            return new n(this.dw, uri);
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new v(this);
        }

        public void bR() {
        }
    }

    public v(c<Data> cVar) {
        this.jK = cVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(uri), this.jK.l(uri));
    }

    /* renamed from: k */
    public boolean o(@NonNull Uri uri) {
        return jJ.contains(uri.getScheme());
    }
}
