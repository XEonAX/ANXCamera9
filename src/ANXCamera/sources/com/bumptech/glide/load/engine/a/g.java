package com.bumptech.glide.load.engine.a;

import android.content.Context;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.a.a.a;
import java.io.File;

/* compiled from: ExternalPreferredCacheDiskCacheFactory */
public final class g extends d {
    public g(Context context) {
        this(context, a.a, 262144000);
    }

    public g(Context context, long j) {
        this(context, a.a, j);
    }

    public g(final Context context, final String str, long j) {
        super(new d.a() {
            @Nullable
            private File by() {
                File cacheDir = context.getCacheDir();
                if (cacheDir == null) {
                    return null;
                }
                if (str != null) {
                    return new File(cacheDir, str);
                }
                return cacheDir;
            }

            public File bv() {
                File by = by();
                if (by != null && by.exists()) {
                    return by;
                }
                File externalCacheDir = context.getExternalCacheDir();
                if (externalCacheDir == null || !externalCacheDir.canWrite()) {
                    return by;
                }
                if (str != null) {
                    return new File(externalCacheDir, str);
                }
                return externalCacheDir;
            }
        }, j);
    }
}
