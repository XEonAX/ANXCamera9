package com.bumptech.glide;

import android.support.annotation.NonNull;
import com.bumptech.glide.request.a.g;
import com.bumptech.glide.request.a.j.a;

/* compiled from: GenericTransitionOptions */
public final class b<TranscodeType> extends j<b<TranscodeType>, TranscodeType> {
    @NonNull
    public static <TranscodeType> b<TranscodeType> c() {
        return (b) new b().G();
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> a(int i) {
        return (b) new b().d(i);
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> a(@NonNull a aVar) {
        return (b) new b().b(aVar);
    }

    @NonNull
    public static <TranscodeType> b<TranscodeType> a(@NonNull g<? super TranscodeType> gVar) {
        return (b) new b().b((g) gVar);
    }
}
