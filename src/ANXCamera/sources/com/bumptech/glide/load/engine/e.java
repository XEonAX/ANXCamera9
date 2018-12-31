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
    private Class<Transcode> aH;
    private Object aK;
    private final List<c> dV = new ArrayList();
    private c ee;
    private f eg;
    private final List<a<?>> eh = new ArrayList();
    private Class<?> ei;
    private d ej;
    private Map<Class<?>, i<?>> ek;
    private boolean el;
    private boolean em;
    private Priority en;
    private g eo;
    private boolean ep;
    private boolean eq;
    private int height;
    private com.bumptech.glide.e o;
    private int width;

    e() {
    }

    <R> void a(com.bumptech.glide.e eVar, Object obj, c cVar, int i, int i2, g gVar, Class<?> cls, Class<R> cls2, Priority priority, f fVar, Map<Class<?>, i<?>> map, boolean z, boolean z2, d dVar) {
        this.o = eVar;
        this.aK = obj;
        this.ee = cVar;
        this.width = i;
        this.height = i2;
        this.eo = gVar;
        this.ei = cls;
        this.ej = dVar;
        this.aH = cls2;
        this.en = priority;
        this.eg = fVar;
        this.ek = map;
        this.ep = z;
        this.eq = z2;
    }

    void clear() {
        this.o = null;
        this.aK = null;
        this.ee = null;
        this.ei = null;
        this.aH = null;
        this.eg = null;
        this.en = null;
        this.ek = null;
        this.eo = null;
        this.eh.clear();
        this.el = false;
        this.dV.clear();
        this.em = false;
    }

    com.bumptech.glide.load.engine.a.a aq() {
        return this.ej.aq();
    }

    g ar() {
        return this.eo;
    }

    Priority as() {
        return this.en;
    }

    f at() {
        return this.eg;
    }

    c au() {
        return this.ee;
    }

    int getWidth() {
        return this.width;
    }

    int getHeight() {
        return this.height;
    }

    b f() {
        return this.o.f();
    }

    Class<?> av() {
        return this.aH;
    }

    Class<?> aw() {
        return this.aK.getClass();
    }

    List<Class<?>> ax() {
        return this.o.l().c(this.aK.getClass(), this.ei, this.aH);
    }

    boolean c(Class<?> cls) {
        return d(cls) != null;
    }

    <Data> n<Data, ?, Transcode> d(Class<Data> cls) {
        return this.o.l().a((Class) cls, this.ei, this.aH);
    }

    boolean ay() {
        return this.eq;
    }

    <Z> i<Z> e(Class<Z> cls) {
        i<Z> iVar = (i) this.ek.get(cls);
        if (iVar == null) {
            for (Entry entry : this.ek.entrySet()) {
                if (((Class) entry.getKey()).isAssignableFrom(cls)) {
                    iVar = (i) entry.getValue();
                    break;
                }
            }
        }
        if (iVar != null) {
            return iVar;
        }
        if (!this.ek.isEmpty() || !this.ep) {
            return com.bumptech.glide.load.resource.b.cf();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Missing transformation for ");
        stringBuilder.append(cls);
        stringBuilder.append(". If you wish to ignore unknown resource types, use the optional transformation methods.");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    boolean a(p<?> pVar) {
        return this.o.l().a((p) pVar);
    }

    <Z> h<Z> b(p<Z> pVar) {
        return this.o.l().b((p) pVar);
    }

    List<m<File, ?>> g(File file) throws NoModelLoaderAvailableException {
        return this.o.l().d(file);
    }

    boolean c(c cVar) {
        List az = az();
        int size = az.size();
        for (int i = 0; i < size; i++) {
            if (((a) az.get(i)).dZ.equals(cVar)) {
                return true;
            }
        }
        return false;
    }

    List<a<?>> az() {
        if (!this.el) {
            this.el = true;
            this.eh.clear();
            List d = this.o.l().d(this.aK);
            int size = d.size();
            for (int i = 0; i < size; i++) {
                a b = ((m) d.get(i)).b(this.aK, this.width, this.height, this.eg);
                if (b != null) {
                    this.eh.add(b);
                }
            }
        }
        return this.eh;
    }

    List<c> aA() {
        if (!this.em) {
            this.em = true;
            this.dV.clear();
            List az = az();
            int size = az.size();
            for (int i = 0; i < size; i++) {
                a aVar = (a) az.get(i);
                if (!this.dV.contains(aVar.dZ)) {
                    this.dV.add(aVar.dZ);
                }
                for (int i2 = 0; i2 < aVar.jo.size(); i2++) {
                    if (!this.dV.contains(aVar.jo.get(i2))) {
                        this.dV.add(aVar.jo.get(i2));
                    }
                }
            }
        }
        return this.dV;
    }

    <X> com.bumptech.glide.load.a<X> b(X x) throws NoSourceEncoderAvailableException {
        return this.o.l().b((Object) x);
    }
}
