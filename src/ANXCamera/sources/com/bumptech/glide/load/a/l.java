package com.bumptech.glide.load.a;

import android.content.ContentResolver;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import java.io.FileNotFoundException;
import java.io.IOException;

/* compiled from: LocalUriFetcher */
public abstract class l<T> implements d<T> {
    private static final String TAG = "LocalUriFetcher";
    private T data;
    private final ContentResolver dw;
    private final Uri uri;

    protected abstract T b(Uri uri, ContentResolver contentResolver) throws FileNotFoundException;

    protected abstract void h(T t) throws IOException;

    public l(ContentResolver contentResolver, Uri uri) {
        this.dw = contentResolver;
        this.uri = uri;
    }

    public final void a(@NonNull Priority priority, @NonNull a<? super T> aVar) {
        try {
            this.data = b(this.uri, this.dw);
            aVar.i(this.data);
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to open Uri", e);
            }
            aVar.b(e);
        }
    }

    public void cleanup() {
        if (this.data != null) {
            try {
                h(this.data);
            } catch (IOException e) {
            }
        }
    }

    public void cancel() {
    }

    @NonNull
    public DataSource ae() {
        return DataSource.LOCAL;
    }
}
