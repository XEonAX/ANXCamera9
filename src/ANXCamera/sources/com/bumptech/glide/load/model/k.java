package com.bumptech.glide.load.model;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.f;
import java.io.File;
import java.io.FileNotFoundException;

/* compiled from: MediaStoreFileLoader */
public final class k implements m<Uri, File> {
    private final Context context;

    /* compiled from: MediaStoreFileLoader */
    public static final class a implements n<Uri, File> {
        private final Context context;

        public a(Context context) {
            this.context = context;
        }

        @NonNull
        public m<Uri, File> a(q qVar) {
            return new k(this.context);
        }

        public void bR() {
        }
    }

    /* compiled from: MediaStoreFileLoader */
    private static class b implements d<File> {
        private static final String[] PROJECTION = new String[]{"_data"};
        private final Context context;
        private final Uri uri;

        b(Context context, Uri uri) {
            this.context = context;
            this.uri = uri;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super File> aVar) {
            Cursor query = this.context.getContentResolver().query(this.uri, PROJECTION, null, null, null);
            Object obj = null;
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        obj = query.getString(query.getColumnIndexOrThrow("_data"));
                    }
                    query.close();
                } catch (Throwable th) {
                    query.close();
                }
            }
            if (TextUtils.isEmpty(obj)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to find file path for: ");
                stringBuilder.append(this.uri);
                aVar.b(new FileNotFoundException(stringBuilder.toString()));
                return;
            }
            aVar.i(new File(obj));
        }

        public void cleanup() {
        }

        public void cancel() {
        }

        @NonNull
        public Class<File> ad() {
            return File.class;
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    public k(Context context) {
        this.context = context;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<File> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(uri), new b(this.context, uri));
    }

    /* renamed from: k */
    public boolean o(@NonNull Uri uri) {
        return com.bumptech.glide.load.a.a.b.c(uri);
    }
}
