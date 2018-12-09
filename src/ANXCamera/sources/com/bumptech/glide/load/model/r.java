package com.bumptech.glide.load.model;

import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.load.f;
import java.io.InputStream;

/* compiled from: ResourceLoader */
public class r<Data> implements m<Integer, Data> {
    private static final String TAG = "ResourceLoader";
    private final m<Uri, Data> jF;
    private final Resources jG;

    /* compiled from: ResourceLoader */
    public static final class a implements n<Integer, AssetFileDescriptor> {
        private final Resources jG;

        public a(Resources resources) {
            this.jG = resources;
        }

        public m<Integer, AssetFileDescriptor> a(q qVar) {
            return new r(this.jG, qVar.b(Uri.class, AssetFileDescriptor.class));
        }

        public void bR() {
        }
    }

    /* compiled from: ResourceLoader */
    public static class b implements n<Integer, ParcelFileDescriptor> {
        private final Resources jG;

        public b(Resources resources) {
            this.jG = resources;
        }

        @NonNull
        public m<Integer, ParcelFileDescriptor> a(q qVar) {
            return new r(this.jG, qVar.b(Uri.class, ParcelFileDescriptor.class));
        }

        public void bR() {
        }
    }

    /* compiled from: ResourceLoader */
    public static class c implements n<Integer, InputStream> {
        private final Resources jG;

        public c(Resources resources) {
            this.jG = resources;
        }

        @NonNull
        public m<Integer, InputStream> a(q qVar) {
            return new r(this.jG, qVar.b(Uri.class, InputStream.class));
        }

        public void bR() {
        }
    }

    /* compiled from: ResourceLoader */
    public static class d implements n<Integer, Uri> {
        private final Resources jG;

        public d(Resources resources) {
            this.jG = resources;
        }

        @NonNull
        public m<Integer, Uri> a(q qVar) {
            return new r(this.jG, u.cd());
        }

        public void bR() {
        }
    }

    public r(Resources resources, m<Uri, Data> mVar) {
        this.jG = resources;
        this.jF = mVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Integer num, int i, int i2, @NonNull f fVar) {
        Uri d = d(num);
        return d == null ? null : this.jF.b(d, i, i2, fVar);
    }

    @Nullable
    private Uri d(Integer num) {
        try {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("android.resource://");
            stringBuilder.append(this.jG.getResourcePackageName(num.intValue()));
            stringBuilder.append('/');
            stringBuilder.append(this.jG.getResourceTypeName(num.intValue()));
            stringBuilder.append('/');
            stringBuilder.append(this.jG.getResourceEntryName(num.intValue()));
            return Uri.parse(stringBuilder.toString());
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 5)) {
                String str = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("Received invalid resource id: ");
                stringBuilder2.append(num);
                Log.w(str, stringBuilder2.toString(), e);
            }
            return null;
        }
    }

    /* renamed from: e */
    public boolean o(@NonNull Integer num) {
        return true;
    }
}
