package com.bumptech.glide.request;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.request.target.n;

/* compiled from: RequestListener */
public interface e<R> {
    boolean a(@Nullable GlideException glideException, Object obj, n<R> nVar, boolean z);

    boolean a(R r, Object obj, n<R> nVar, DataSource dataSource, boolean z);
}
