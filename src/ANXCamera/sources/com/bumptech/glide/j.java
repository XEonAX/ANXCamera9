package com.bumptech.glide;

import android.support.annotation.NonNull;
import com.bumptech.glide.request.a.e;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.a.h;
import com.bumptech.glide.request.a.i;
import com.bumptech.glide.request.a.j.a;

/* compiled from: TransitionOptions */
public abstract class j<CHILD extends j<CHILD, TranscodeType>, TranscodeType> implements Cloneable {
    private g<? super TranscodeType> bh = e.ez();

    @NonNull
    public final CHILD G() {
        return b(e.ez());
    }

    @NonNull
    public final CHILD d(int i) {
        return b(new h(i));
    }

    @NonNull
    public final CHILD b(@NonNull a aVar) {
        return b(new i(aVar));
    }

    @NonNull
    public final CHILD b(@NonNull g<? super TranscodeType> gVar) {
        this.bh = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        return J();
    }

    /* renamed from: H */
    public final CHILD clone() {
        try {
            return (j) super.clone();
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    final g<? super TranscodeType> I() {
        return this.bh;
    }

    private CHILD J() {
        return this;
    }
}
