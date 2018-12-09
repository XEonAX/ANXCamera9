package com.bumptech.glide.load.engine.a;

import android.content.Context;
import com.bumptech.glide.load.engine.a.a.a;
import java.io.File;

/* compiled from: InternalCacheDiskCacheFactory */
public final class h extends d {
    public h(Context context) {
        this(context, a.a, 262144000);
    }

    public h(Context context, long j) {
        this(context, a.a, j);
    }

    public h(final Context context, final String str, long j) {
        super(new d.a() {
            public File bv() {
                File cacheDir = context.getCacheDir();
                if (cacheDir == null) {
                    return null;
                }
                if (str != null) {
                    return new File(cacheDir, str);
                }
                return cacheDir;
            }
        }, j);
    }
}
