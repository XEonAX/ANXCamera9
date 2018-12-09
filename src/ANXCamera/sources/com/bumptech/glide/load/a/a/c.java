package com.bumptech.glide.load.a.a;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore.Images.Thumbnails;
import android.provider.MediaStore.Video;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.g;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ThumbFetcher */
public class c implements d<InputStream> {
    private static final String TAG = "MediaStoreThumbFetcher";
    private final Uri dE;
    private final e dF;
    private InputStream inputStream;

    /* compiled from: ThumbFetcher */
    static class a implements d {
        private static final String[] dG = new String[]{"_data"};
        private static final String dH = "kind = 1 AND image_id = ?";
        private final ContentResolver dv;

        a(ContentResolver contentResolver) {
            this.dv = contentResolver;
        }

        public Cursor g(Uri uri) {
            String lastPathSegment = uri.getLastPathSegment();
            return this.dv.query(Thumbnails.EXTERNAL_CONTENT_URI, dG, dH, new String[]{lastPathSegment}, null);
        }
    }

    /* compiled from: ThumbFetcher */
    static class b implements d {
        private static final String[] dG = new String[]{"_data"};
        private static final String dH = "kind = 1 AND video_id = ?";
        private final ContentResolver dv;

        b(ContentResolver contentResolver) {
            this.dv = contentResolver;
        }

        public Cursor g(Uri uri) {
            String lastPathSegment = uri.getLastPathSegment();
            return this.dv.query(Video.Thumbnails.EXTERNAL_CONTENT_URI, dG, dH, new String[]{lastPathSegment}, null);
        }
    }

    public static c a(Context context, Uri uri) {
        return a(context, uri, new a(context.getContentResolver()));
    }

    public static c b(Context context, Uri uri) {
        return a(context, uri, new b(context.getContentResolver()));
    }

    private static c a(Context context, Uri uri, d dVar) {
        return new c(uri, new e(com.bumptech.glide.c.b(context).l().q(), dVar, com.bumptech.glide.c.b(context).f(), context.getContentResolver()));
    }

    @VisibleForTesting
    c(Uri uri, e eVar) {
        this.dE = uri;
        this.dF = eVar;
    }

    public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super InputStream> aVar) {
        try {
            this.inputStream = ai();
            aVar.i(this.inputStream);
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to find thumbnail file", e);
            }
            aVar.b(e);
        }
    }

    private InputStream ai() throws FileNotFoundException {
        int h;
        InputStream i = this.dF.i(this.dE);
        if (i != null) {
            h = this.dF.h(this.dE);
        } else {
            h = -1;
        }
        if (h != -1) {
            return new g(i, h);
        }
        return i;
    }

    public void cleanup() {
        if (this.inputStream != null) {
            try {
                this.inputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public void cancel() {
    }

    @NonNull
    public Class<InputStream> ad() {
        return InputStream.class;
    }

    @NonNull
    public DataSource ae() {
        return DataSource.LOCAL;
    }
}
