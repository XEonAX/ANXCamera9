package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.g;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: ResourceDecoderRegistry */
public class e {
    private final List<String> mT = new ArrayList();
    private final Map<String, List<a<?, ?>>> mU = new HashMap();

    /* compiled from: ResourceDecoderRegistry */
    private static class a<T, R> {
        private final Class<T> dataClass;
        final Class<R> ei;
        final g<T, R> jR;

        public a(@NonNull Class<T> cls, @NonNull Class<R> cls2, g<T, R> gVar) {
            this.dataClass = cls;
            this.ei = cls2;
            this.jR = gVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return this.dataClass.isAssignableFrom(cls) && cls2.isAssignableFrom(this.ei);
        }
    }

    public synchronized void d(@NonNull List<String> list) {
        List<String> arrayList = new ArrayList(this.mT);
        this.mT.clear();
        this.mT.addAll(list);
        for (String str : arrayList) {
            if (!list.contains(str)) {
                this.mT.add(str);
            }
        }
    }

    @NonNull
    public synchronized <T, R> List<g<T, R>> h(@NonNull Class<T> cls, @NonNull Class<R> cls2) {
        List<g<T, R>> arrayList;
        arrayList = new ArrayList();
        for (String str : this.mT) {
            List<a> list = (List) this.mU.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2)) {
                        arrayList.add(aVar.jR);
                    }
                }
            }
        }
        return arrayList;
    }

    @NonNull
    public synchronized <T, R> List<Class<R>> i(@NonNull Class<T> cls, @NonNull Class<R> cls2) {
        List<Class<R>> arrayList;
        arrayList = new ArrayList();
        for (String str : this.mT) {
            List<a> list = (List) this.mU.get(str);
            if (list != null) {
                for (a aVar : list) {
                    if (aVar.d(cls, cls2) && !arrayList.contains(aVar.ei)) {
                        arrayList.add(aVar.ei);
                    }
                }
            }
        }
        return arrayList;
    }

    public synchronized <T, R> void a(@NonNull String str, @NonNull g<T, R> gVar, @NonNull Class<T> cls, @NonNull Class<R> cls2) {
        t(str).add(new a(cls, cls2, gVar));
    }

    public synchronized <T, R> void b(@NonNull String str, @NonNull g<T, R> gVar, @NonNull Class<T> cls, @NonNull Class<R> cls2) {
        t(str).add(0, new a(cls, cls2, gVar));
    }

    @NonNull
    private synchronized List<a<?, ?>> t(@NonNull String str) {
        List<a<?, ?>> list;
        if (!this.mT.contains(str)) {
            this.mT.add(str);
        }
        list = (List) this.mU.get(str);
        if (list == null) {
            list = new ArrayList();
            this.mU.put(str, list);
        }
        return list;
    }
}
