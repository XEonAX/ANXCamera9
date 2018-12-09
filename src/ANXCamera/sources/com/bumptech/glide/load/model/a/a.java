package com.bumptech.glide.load.model.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.ModelCache;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.load.model.h;
import com.bumptech.glide.load.model.m;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* compiled from: BaseGlideUrlLoader */
public abstract class a<Model> implements m<Model, InputStream> {
    private final m<g, InputStream> jM;
    @Nullable
    private final ModelCache<Model, g> jN;

    protected abstract String c(Model model, int i, int i2, f fVar);

    protected a(m<g, InputStream> mVar) {
        this(mVar, null);
    }

    protected a(m<g, InputStream> mVar, @Nullable ModelCache<Model, g> modelCache) {
        this.jM = mVar;
        this.jN = modelCache;
    }

    @Nullable
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        Object obj;
        if (this.jN != null) {
            obj = (g) this.jN.c(model, i, i2);
        } else {
            obj = null;
        }
        if (obj == null) {
            String c = c(model, i, i2, fVar);
            if (TextUtils.isEmpty(c)) {
                return null;
            }
            g gVar = new g(c, e(model, i, i2, fVar));
            if (this.jN != null) {
                this.jN.a(model, i, i2, gVar);
            }
            obj = gVar;
        }
        Collection d = d(model, i, i2, fVar);
        com.bumptech.glide.load.model.m.a<InputStream> b = this.jM.b(obj, i, i2, fVar);
        if (b == null || d.isEmpty()) {
            return b;
        }
        return new com.bumptech.glide.load.model.m.a(b.dZ, a(d), b.jp);
    }

    private static List<c> a(Collection<String> collection) {
        List<c> arrayList = new ArrayList(collection.size());
        for (String gVar : collection) {
            arrayList.add(new g(gVar));
        }
        return arrayList;
    }

    protected List<String> d(Model model, int i, int i2, f fVar) {
        return Collections.emptyList();
    }

    @Nullable
    protected h e(Model model, int i, int i2, f fVar) {
        return h.je;
    }
}
