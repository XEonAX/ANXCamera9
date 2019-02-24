package com.bumptech.glide.load.engine;

import com.bumptech.glide.Priority;
import com.bumptech.glide.Registry.NoModelLoaderAvailableException;
import com.bumptech.glide.Registry.NoSourceEncoderAvailableException;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.m.a;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: DecodeHelper */
final class e<Transcode> {
    private Class<Transcode> aI;
    private Object aL;
    private final List<c> dW = new ArrayList();
    private c ef;
    private f eh;
    private final List<a<?>> ei = new ArrayList();
    private Class<?> ej;
    private d ek;
    private Map<Class<?>, i<?>> el;
    private boolean em;
    private boolean en;
    private Priority eo;
    private g ep;
    private boolean eq;
    private boolean er;
    private int height;
    private com.bumptech.glide.e q;
    private int width;

    e() {
    }

    <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.q = eVar;
        this.aL = obj;
        this.ef = cVar;
        this.width = i;
        this.height = i2;
        this.ep = gVar;
        this.ej = cls;
        this.ek = dVar;
        this.aI = cls2;
        this.eo = priority;
        this.eh = fVar;
        this.el = map;
        this.eq = z;
        this.er = z2;
    }

    void clear() {
        this.q = null;
        this.aL = null;
        this.ef = null;
        this.ej = null;
        this.aI = null;
        this.eh = null;
        this.eo = null;
        this.el = null;
        this.ep = null;
        this.ei.clear();
        this.em = false;
        this.dW.clear();
        this.en = false;
    }

    com.bumptech.glide.load.engine.a.a aq() {
        return this.ek.aq();
    }

    g ar() {
        return this.ep;
    }

    Priority as() {
        return this.eo;
    }

    f at() {
        return this.eh;
    }

    c au() {
        return this.ef;
    }

    int getWidth() {
        return this.width;
    }

    int getHeight() {
        return this.height;
    }

    b f() {
        return this.q.f();
    }

    Class<?> av() {
        return this.aI;
    }

    Class<?> aw() {
        return this.aL.getClass();
    }

    List<Class<?>> ax() {
        return this.q.l().c(this.aL.getClass(), this.ej, this.aI);
    }

    boolean c(Class<?> cls) {
        return d(cls) != null;
    }

    <Data> n<Data, ?, Transcode> d(Class<Data> cls) {
        return this.q.l().a((Class) cls, this.ej, this.aI);
    }

    boolean ay() {
        return this.er;
    }

    <Z> i<Z> e(Class<Z> cls) {
        i<Z> iVar = (i) this.el.get(cls);
        if (iVar == null) {
            for (Entry entry : this.el.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    iVar = (i) entry.getValue();
                    break;
                }
            }
        }
        if (iVar != null) {
            return iVar;
        }
        if (!this.el.isEmpty() || !this.eq) {
            return com.bumptech.glide.load.resource.b.cf();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Missing transformation for ");
        stringBuilder.append(cls);
        stringBuilder.append(". If you wish to ignore unknown resource types, use the optional transformation methods.");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    boolean a(p<?> pVar) {
        return this.q.l().a((p) pVar);
    }

    <Z> h<Z> b(p<Z> pVar) {
        return this.q.l().b((p) pVar);
    }

    List<m<File, ?>> g(File file) throws NoModelLoaderAvailableException {
        return this.q.l().d(file);
    }

    boolean c(c cVar) {
        List az = az();
        int size = az.size();
        for (int i = 0; i < size; i++) {
            if (((a) az.get(i)).ea.equals(cVar)) {
                return true;
            }
        }
        return false;
    }

    List<a<?>> az() {
        if (!this.em) {
            this.em = true;
            this.ei.clear();
            List d = this.q.l().d(this.aL);
            int size = d.size();
            for (int i = 0; i < size; i++) {
                a b = ((m) d.get(i)).b(this.aL, this.width, this.height, this.eh);
                if (b != null) {
                    this.ei.add(b);
                }
            }
        }
        return this.ei;
    }

    List<c> aA() {
        if (!this.en) {
            this.en = true;
            this.dW.clear();
            List az = az();
            int size = az.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) az.get(i);
                if (!this.dW.contains(aVar.ea)) {
                    this.dW.add(aVar.ea);
                }
                for (int i2 = 0; i2 < aVar.jo.size(); i2++) {
                    if (!this.dW.contains(aVar.jo.get(i2))) {
                        this.dW.add(aVar.jo.get(i2));
                    }
                }
            }
        }
        return this.dW;
    }

    <X> com.bumptech.glide.load.a<X> b(X x) throws NoSourceEncoderAvailableException {
        return this.q.l().b((Object) x);
    }
}
