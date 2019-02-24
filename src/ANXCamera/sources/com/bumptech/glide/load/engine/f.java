package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.resource.d.e;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.List;

/* compiled from: DecodePath */
public class f<DataType, ResourceType, Transcode> {
    private static final String TAG = "DecodePath";
    private final Class<DataType> dataClass;
    private final List<? extends g<DataType, ResourceType>> fg;
    private final e<ResourceType, Transcode> fh;
    private final Pool<List<Throwable>> fi;
    private final String fj;

    /* compiled from: DecodePath */
    interface a<ResourceType> {
        @NonNull
        p<ResourceType> c(@NonNull p<ResourceType> pVar);
    }

    public f(Class<DataType> cls, Class<ResourceType> cls2, Class<Transcode> cls3, List<? extends g<DataType, ResourceType>> list, e<ResourceType, Transcode> eVar, Pool<List<Throwable>> pool) {
        this.dataClass = cls;
        this.fg = list;
        this.fh = eVar;
        this.fi = pool;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Failed DecodePath{");
        stringBuilder.append(cls.getSimpleName());
        stringBuilder.append("->");
        stringBuilder.append(cls2.getSimpleName());
        stringBuilder.append("->");
        stringBuilder.append(cls3.getSimpleName());
        stringBuilder.append("}");
        this.fj = stringBuilder.toString();
    }

    public p<Transcode> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, a<ResourceType> aVar) throws GlideException {
        return this.fh.a(aVar.c(a(eVar, i, i2, fVar)), fVar);
    }

    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) throws GlideException {
        List list = (List) i.checkNotNull(this.fi.acquire());
        try {
            p<ResourceType> a = a((com.bumptech.glide.load.a.e) eVar, i, i2, fVar, list);
            return a;
        } finally {
            this.fi.release(list);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:8:0x0027 A:{ExcHandler: java.io.IOException (r4_4 'e' java.lang.Throwable), Splitter: B:3:0x0013} */
    /* JADX WARNING: Removed duplicated region for block: B:8:0x0027 A:{ExcHandler: java.io.IOException (r4_4 'e' java.lang.Throwable), Splitter: B:3:0x0013} */
    /* JADX WARNING: Missing block: B:8:0x0027, code:
            r4 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x002f, code:
            if (android.util.Log.isLoggable(TAG, 2) != false) goto L_0x0031;
     */
    /* JADX WARNING: Missing block: B:11:0x0031, code:
            r5 = TAG;
            r6 = new java.lang.StringBuilder();
            r6.append("Failed to decode data for ");
            r6.append(r3);
            android.util.Log.v(r5, r6.toString(), r4);
     */
    /* JADX WARNING: Missing block: B:12:0x0047, code:
            r13.add(r4);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @NonNull
    private p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> eVar, int i, int i2, @NonNull com.bumptech.glide.load.f fVar, List<Throwable> list) throws GlideException {
        int size = this.fg.size();
        p<ResourceType> pVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            g gVar = (g) this.fg.get(i3);
            try {
                if (gVar.a(eVar.ag(), fVar)) {
                    pVar = gVar.a(eVar.ag(), i, i2, fVar);
                }
            } catch (Throwable e) {
            }
            if (pVar != null) {
                break;
            }
        }
        if (pVar != null) {
            return pVar;
        }
        throw new GlideException(this.fj, new ArrayList(list));
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("DecodePath{ dataClass=");
        stringBuilder.append(this.dataClass);
        stringBuilder.append(", decoders=");
        stringBuilder.append(this.fg);
        stringBuilder.append(", transcoder=");
        stringBuilder.append(this.fh);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
