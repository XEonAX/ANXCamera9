package com.bumptech.glide.load.resource.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.gif.b;
import com.bumptech.glide.util.a;

/* compiled from: GifDrawableBytesTranscoder */
public class d implements e<b, byte[]> {
    @Nullable
    public p<byte[]> a(@NonNull p<b> pVar, @NonNull f fVar) {
        return new com.bumptech.glide.load.resource.a.b(a.f(((b) pVar.get()).getBuffer()));
    }
}
