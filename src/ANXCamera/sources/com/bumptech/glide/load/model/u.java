package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.f;

/* compiled from: UnitModelLoader */
public class u<Model> implements m<Model, Model> {
    private static final u<?> jH = new u();

    /* compiled from: UnitModelLoader */
    public static class a<Model> implements n<Model, Model> {
        private static final a<?> jI = new a();

        public static <T> a<T> ce() {
            return jI;
        }

        @NonNull
        public m<Model, Model> a(q qVar) {
            return u.cd();
        }

        public void bR() {
        }
    }

    /* compiled from: UnitModelLoader */
    private static class b<Model> implements d<Model> {
        private final Model resource;

        b(Model model) {
            this.resource = model;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Model> aVar) {
            aVar.i(this.resource);
        }

        public void cleanup() {
        }

        public void cancel() {
        }

        @NonNull
        public Class<Model> ad() {
            return this.resource.getClass();
        }

        @NonNull
        public DataSource ae() {
            return DataSource.LOCAL;
        }
    }

    public static <T> u<T> cd() {
        return jH;
    }

    public com.bumptech.glide.load.model.m.a<Model> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a(new com.bumptech.glide.e.d(model), new b(model));
    }

    public boolean o(@NonNull Model model) {
        return true;
    }
}
