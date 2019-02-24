package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.manager.i;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.c;

/* compiled from: Target */
public interface n<R> extends i {
    public static final int oC = Integer.MIN_VALUE;

    void a(@NonNull m mVar);

    void a(@NonNull R r, @Nullable f<? super R> fVar);

    void b(@NonNull m mVar);

    void d(@Nullable Drawable drawable);

    @Nullable
    c dj();

    void e(@Nullable Drawable drawable);

    void f(@Nullable Drawable drawable);

    void j(@Nullable c cVar);
}
