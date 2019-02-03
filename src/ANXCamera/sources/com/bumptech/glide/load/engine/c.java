package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.a;
import com.bumptech.glide.load.engine.a.a.b;
import com.bumptech.glide.load.f;
import java.io.File;

/* compiled from: DataCacheWriter */
class c<DataType> implements b {
    private final DataType data;
    private final a<DataType> eg;
    private final f eh;

    c(a<DataType> aVar, DataType dataType, f fVar) {
        this.eg = aVar;
        this.data = dataType;
        this.eh = fVar;
    }

    public boolean f(@NonNull File file) {
        return this.eg.a(this.data, file, this.eh);
    }
}
