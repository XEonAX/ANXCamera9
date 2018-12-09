package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: MultiModelLoader */
class p<Model, Data> implements m<Model, Data> {
    private final List<m<Model, Data>> ea;
    private final Pool<List<Throwable>> ju;

    /* compiled from: MultiModelLoader */
    static class a<Data> implements com.bumptech.glide.load.a.d.a<Data>, d<Data> {
        private final Pool<List<Throwable>> aF;
        private Priority en;
        @Nullable
        private List<Throwable> exceptions;
        private final List<d<Data>> jv;
        private int jw = 0;
        private com.bumptech.glide.load.a.d.a<? super Data> jx;

        a(@NonNull List<d<Data>> list, @NonNull Pool<List<Throwable>> pool) {
            this.aF = pool;
            i.b(list);
            this.jv = list;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            this.en = priority;
            this.jx = aVar;
            this.exceptions = (List) this.aF.acquire();
            ((d) this.jv.get(this.jw)).a(priority, this);
        }

        public void cleanup() {
            if (this.exceptions != null) {
                this.aF.release(this.exceptions);
            }
            this.exceptions = null;
            for (d cleanup : this.jv) {
                cleanup.cleanup();
            }
        }

        public void cancel() {
            for (d cancel : this.jv) {
                cancel.cancel();
            }
        }

        @NonNull
        public Class<Data> ad() {
            return ((d) this.jv.get(0)).ad();
        }

        @NonNull
        public DataSource ae() {
            return ((d) this.jv.get(0)).ae();
        }

        public void i(@Nullable Data data) {
            if (data != null) {
                this.jx.i(data);
            } else {
                cb();
            }
        }

        public void b(@NonNull Exception exception) {
            ((List) i.checkNotNull(this.exceptions)).add(exception);
            cb();
        }

        private void cb() {
            if (this.jw < this.jv.size() - 1) {
                this.jw++;
                a(this.en, this.jx);
                return;
            }
            i.checkNotNull(this.exceptions);
            this.jx.b(new GlideException("Fetch failed", new ArrayList(this.exceptions)));
        }
    }

    p(@NonNull List<m<Model, Data>> list, @NonNull Pool<List<Throwable>> pool) {
        this.ea = list;
        this.ju = pool;
    }

    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        int size = this.ea.size();
        List arrayList = new ArrayList(size);
        c cVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            m mVar = (m) this.ea.get(i3);
            if (mVar.o(model)) {
                com.bumptech.glide.load.model.m.a b = mVar.b(model, i, i2, fVar);
                if (b != null) {
                    cVar = b.dZ;
                    arrayList.add(b.jp);
                }
            }
        }
        if (arrayList.isEmpty() || cVar == null) {
            return null;
        }
        return new com.bumptech.glide.load.model.m.a(cVar, new a(arrayList, this.ju));
    }

    public boolean o(@NonNull Model model) {
        for (m o : this.ea) {
            if (o.o(model)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MultiModelLoader{modelLoaders=");
        stringBuilder.append(Arrays.toString(this.ea.toArray()));
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
