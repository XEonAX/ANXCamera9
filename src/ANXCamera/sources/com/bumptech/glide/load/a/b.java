package com.bumptech.glide.load.a;

import android.content.res.AssetManager;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import java.io.IOException;

/* compiled from: AssetPathFetcher */
public abstract class b<T> implements d<T> {
    private static final String TAG = "AssetPathFetcher";
    private final String da;
    private T data;
    private final AssetManager dc;

    protected abstract T a(AssetManager assetManager, String str) throws IOException;

    protected abstract void h(T t) throws IOException;

    public b(AssetManager assetManager, String str) {
        this.dc = assetManager;
        this.da = str;
    }

    public void a(@NonNull Priority priority, @NonNull a<? super T> aVar) {
        try {
            this.data = a(this.dc, this.da);
            aVar.i(this.data);
        } catch (Throwable e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to load data from asset manager", e);
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
