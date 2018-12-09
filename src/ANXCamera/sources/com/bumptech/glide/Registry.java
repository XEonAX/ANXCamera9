package com.bumptech.glide;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.d.b;
import com.bumptech.glide.d.c;
import com.bumptech.glide.d.d;
import com.bumptech.glide.d.e;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.a.f;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.o;
import com.bumptech.glide.util.a.a;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Registry {
    public static final String ar = "Gif";
    public static final String as = "Bitmap";
    public static final String at = "BitmapDrawable";
    private static final String au = "legacy_prepend_all";
    private static final String av = "legacy_append";
    private final f aA = new f();
    private final com.bumptech.glide.load.resource.d.f aB = new com.bumptech.glide.load.resource.d.f();
    private final b aC = new b();
    private final d aD = new d();
    private final c aE = new c();
    private final Pool<List<Throwable>> aF = a.eJ();
    private final o aw = new o(this.aF);
    private final com.bumptech.glide.d.a ax = new com.bumptech.glide.d.a();
    private final e ay = new e();
    private final com.bumptech.glide.d.f az = new com.bumptech.glide.d.f();

    public static class MissingComponentException extends RuntimeException {
        public MissingComponentException(@NonNull String str) {
            super(str);
        }
    }

    public static final class NoImageHeaderParserException extends MissingComponentException {
        public NoImageHeaderParserException() {
            super("Failed to find image header parser.");
        }
    }

    public static class NoModelLoaderAvailableException extends MissingComponentException {
        public NoModelLoaderAvailableException(@NonNull Object obj) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to find any ModelLoaders for model: ");
            stringBuilder.append(obj);
            super(stringBuilder.toString());
        }

        public NoModelLoaderAvailableException(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to find any ModelLoaders for model: ");
            stringBuilder.append(cls);
            stringBuilder.append(" and data: ");
            stringBuilder.append(cls2);
            super(stringBuilder.toString());
        }
    }

    public static class NoResultEncoderAvailableException extends MissingComponentException {
        public NoResultEncoderAvailableException(@NonNull Class<?> cls) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to find result encoder for resource class: ");
            stringBuilder.append(cls);
            stringBuilder.append(", you may need to consider registering a new Encoder for the requested type or DiskCacheStrategy.DATA/DiskCacheStrategy.NONE if caching your transformed resource is unnecessary.");
            super(stringBuilder.toString());
        }
    }

    public static class NoSourceEncoderAvailableException extends MissingComponentException {
        public NoSourceEncoderAvailableException(@NonNull Class<?> cls) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to find source encoder for data class: ");
            stringBuilder.append(cls);
            super(stringBuilder.toString());
        }
    }

    public Registry() {
        a(Arrays.asList(new String[]{ar, as, at}));
    }

    @Deprecated
    @NonNull
    public <Data> Registry a(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        return b((Class) cls, (com.bumptech.glide.load.a) aVar);
    }

    @NonNull
    public <Data> Registry b(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.ax.d(cls, aVar);
        return this;
    }

    @NonNull
    public <Data> Registry c(@NonNull Class<Data> cls, @NonNull com.bumptech.glide.load.a<Data> aVar) {
        this.ax.e(cls, aVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        a(av, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry a(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.ay.a(str, gVar, cls, cls2);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        b(au, cls, cls2, gVar);
        return this;
    }

    @NonNull
    public <Data, TResource> Registry b(@NonNull String str, @NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull g<Data, TResource> gVar) {
        this.ay.b(str, gVar, cls, cls2);
        return this;
    }

    @NonNull
    public final Registry a(@NonNull List<String> list) {
        List arrayList = new ArrayList(list);
        arrayList.add(0, au);
        arrayList.add(av);
        this.ay.d(arrayList);
        return this;
    }

    @Deprecated
    @NonNull
    public <TResource> Registry a(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        return b((Class) cls, (h) hVar);
    }

    @NonNull
    public <TResource> Registry b(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.az.d(cls, hVar);
        return this;
    }

    @NonNull
    public <TResource> Registry c(@NonNull Class<TResource> cls, @NonNull h<TResource> hVar) {
        this.az.e(cls, hVar);
        return this;
    }

    @NonNull
    public Registry a(@NonNull com.bumptech.glide.load.a.e.a<?> aVar) {
        this.aA.b(aVar);
        return this;
    }

    @NonNull
    public <TResource, Transcode> Registry a(@NonNull Class<TResource> cls, @NonNull Class<Transcode> cls2, @NonNull com.bumptech.glide.load.resource.d.e<TResource, Transcode> eVar) {
        this.aB.b(cls, cls2, eVar);
        return this;
    }

    @NonNull
    public Registry a(@NonNull ImageHeaderParser imageHeaderParser) {
        this.aC.b(imageHeaderParser);
        return this;
    }

    @NonNull
    public <Model, Data> Registry a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.aw.d(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<Model, Data> nVar) {
        this.aw.e(cls, cls2, nVar);
        return this;
    }

    @NonNull
    public <Model, Data> Registry c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.aw.f(cls, cls2, nVar);
        return this;
    }

    @Nullable
    public <Data, TResource, Transcode> com.bumptech.glide.load.engine.n<Data, TResource, Transcode> a(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        com.bumptech.glide.load.engine.n<Data, TResource, Transcode> d = this.aE.d(cls, cls2, cls3);
        if (this.aE.a(d)) {
            return null;
        }
        if (d == null) {
            List b = b((Class) cls, (Class) cls2, (Class) cls3);
            if (b.isEmpty()) {
                d = null;
            } else {
                com.bumptech.glide.load.engine.n<Data, TResource, Transcode> nVar = new com.bumptech.glide.load.engine.n(cls, cls2, cls3, b, this.aF);
            }
            this.aE.a(cls, cls2, cls3, d);
        }
        return d;
    }

    @NonNull
    private <Data, TResource, Transcode> List<com.bumptech.glide.load.engine.f<Data, TResource, Transcode>> b(@NonNull Class<Data> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        List<com.bumptech.glide.load.engine.f<Data, TResource, Transcode>> arrayList = new ArrayList();
        for (Class cls4 : this.ay.i(cls, cls2)) {
            for (Class cls5 : this.aB.f(cls4, cls3)) {
                arrayList.add(new com.bumptech.glide.load.engine.f(cls, cls4, cls5, this.ay.h(cls, cls4), this.aB.e(cls4, cls5), this.aF));
            }
        }
        return arrayList;
    }

    @NonNull
    public <Model, TResource, Transcode> List<Class<?>> c(@NonNull Class<Model> cls, @NonNull Class<TResource> cls2, @NonNull Class<Transcode> cls3) {
        List<Class<?>> g = this.aD.g(cls, cls2);
        if (g == null) {
            g = new ArrayList();
            for (Class i : this.aw.h(cls)) {
                for (Class cls4 : this.ay.i(i, cls2)) {
                    if (!(this.aB.f(cls4, cls3).isEmpty() || g.contains(cls4))) {
                        g.add(cls4);
                    }
                }
            }
            this.aD.a(cls, cls2, Collections.unmodifiableList(g));
        }
        return g;
    }

    public boolean a(@NonNull p<?> pVar) {
        return this.az.n(pVar.aZ()) != null;
    }

    @NonNull
    public <X> h<X> b(@NonNull p<X> pVar) throws NoResultEncoderAvailableException {
        h<X> n = this.az.n(pVar.aZ());
        if (n != null) {
            return n;
        }
        throw new NoResultEncoderAvailableException(pVar.aZ());
    }

    @NonNull
    public <X> com.bumptech.glide.load.a<X> b(@NonNull X x) throws NoSourceEncoderAvailableException {
        com.bumptech.glide.load.a<X> m = this.ax.m(x.getClass());
        if (m != null) {
            return m;
        }
        throw new NoSourceEncoderAvailableException(x.getClass());
    }

    @NonNull
    public <X> com.bumptech.glide.load.a.e<X> c(@NonNull X x) {
        return this.aA.j(x);
    }

    @NonNull
    public <Model> List<m<Model, ?>> d(@NonNull Model model) {
        List<m<Model, ?>> d = this.aw.d(model);
        if (!d.isEmpty()) {
            return d;
        }
        throw new NoModelLoaderAvailableException(model);
    }

    @NonNull
    public List<ImageHeaderParser> q() {
        List<ImageHeaderParser> dc = this.aC.dc();
        if (!dc.isEmpty()) {
            return dc;
        }
        throw new NoImageHeaderParserException();
    }
}
