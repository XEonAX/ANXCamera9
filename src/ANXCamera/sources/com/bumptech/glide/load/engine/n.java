package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.a.e;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: LoadPath */
public class n<Data, ResourceType, Transcode> {
    private final Class<Data> dataClass;
    private final Pool<List<Throwable>> fi;
    private final String fj;
    private final List<? extends f<Data, ResourceType, Transcode>> gg;

    public n(Class<Data> cls, Class<ResourceType> cls2, Class<Transcode> cls3, List<f<Data, ResourceType, Transcode>> list, Pool<List<Throwable>> pool) {
        this.dataClass = cls;
        this.fi = pool;
        this.gg = (List) i.b(list);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Failed LoadPath{");
        stringBuilder.append(cls.getSimpleName());
        stringBuilder.append("->");
        stringBuilder.append(cls2.getSimpleName());
        stringBuilder.append("->");
        stringBuilder.append(cls3.getSimpleName());
        stringBuilder.append("}");
        this.fj = stringBuilder.toString();
    }

    public p<Transcode> a(e<Data> eVar, @NonNull f fVar, int i, int i2, a<ResourceType> aVar) throws GlideException {
        List list = (List) i.checkNotNull(this.fi.acquire());
        try {
            p<Transcode> a = a(eVar, fVar, i, i2, aVar, list);
            return a;
        } finally {
            this.fi.release(list);
        }
    }

    private p<Transcode> a(e<Data> eVar, @NonNull f fVar, int i, int i2, a<ResourceType> aVar, List<Throwable> list) throws GlideException {
        List<Throwable> list2 = list;
        int size = this.gg.size();
        p<Transcode> pVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            try {
                pVar = ((f) this.gg.get(i3)).a((e) eVar, i, i2, fVar, (a) aVar);
            } catch (GlideException e) {
                list2.add(e);
            }
            if (pVar != null) {
                break;
            }
        }
        if (pVar != null) {
            return pVar;
        }
        throw new GlideException(this.fj, new ArrayList(list2));
    }

    public Class<Data> ad() {
        return this.dataClass;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("LoadPath{decodePaths=");
        stringBuilder.append(Arrays.toString(this.gg.toArray()));
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
