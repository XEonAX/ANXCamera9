package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.bumptech.glide.f.b;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.target.m;
import java.util.Arrays;

/* compiled from: ViewPreloadSizeProvider */
public class l<T> implements b<T>, m {
    private int[] pk;
    private a pw;

    /* compiled from: ViewPreloadSizeProvider */
    private static final class a extends ViewTarget<View, Object> {
        a(@NonNull View view, @NonNull m mVar) {
            super(view);
            a(mVar);
        }

        public void a(@NonNull Object obj, @Nullable f<? super Object> fVar) {
        }
    }

    public l(@NonNull View view) {
        this.pw = new a(view, this);
    }

    @Nullable
    public int[] b(@NonNull T t, int i, int i2) {
        if (this.pk == null) {
            return null;
        }
        return Arrays.copyOf(this.pk, this.pk.length);
    }

    public void m(int i, int i2) {
        this.pk = new int[]{i, i2};
        this.pw = null;
    }

    public void setView(@NonNull View view) {
        if (this.pk == null && this.pw == null) {
            this.pw = new a(view, this);
        }
    }
}
