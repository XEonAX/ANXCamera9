package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.load.g;
import com.bumptech.glide.load.resource.d.e;
import com.bumptech.glide.util.i;
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
    @android.support.annotation.NonNull
    private com.bumptech.glide.load.engine.p<ResourceType> a(com.bumptech.glide.load.a.e<DataType> r9, int r10, int r11, @android.support.annotation.NonNull com.bumptech.glide.load.f r12, java.util.List<java.lang.Throwable> r13) throws com.bumptech.glide.load.engine.GlideException {
        /*
        r8 = this;
        r0 = r8.fg;
        r0 = r0.size();
        r1 = 0;
        r2 = 0;
    L_0x0009:
        if (r2 >= r0) goto L_0x0050;
    L_0x000b:
        r3 = r8.fg;
        r3 = r3.get(r2);
        r3 = (com.bumptech.glide.load.g) r3;
        r4 = r9.ag();	 Catch:{ IOException -> 0x0027, IOException -> 0x0027, IOException -> 0x0027 }
        r4 = r3.a(r4, r12);	 Catch:{ IOException -> 0x0027, IOException -> 0x0027, IOException -> 0x0027 }
        if (r4 == 0) goto L_0x0026;
    L_0x001d:
        r4 = r9.ag();	 Catch:{ IOException -> 0x0027, IOException -> 0x0027, IOException -> 0x0027 }
        r4 = r3.a(r4, r10, r11, r12);	 Catch:{ IOException -> 0x0027, IOException -> 0x0027, IOException -> 0x0027 }
        r1 = r4;
    L_0x0026:
        goto L_0x004a;
    L_0x0027:
        r4 = move-exception;
        r5 = "DecodePath";
        r6 = 2;
        r5 = android.util.Log.isLoggable(r5, r6);
        if (r5 == 0) goto L_0x0047;
    L_0x0031:
        r5 = "DecodePath";
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r7 = "Failed to decode data for ";
        r6.append(r7);
        r6.append(r3);
        r3 = r6.toString();
        android.util.Log.v(r5, r3, r4);
    L_0x0047:
        r13.add(r4);
    L_0x004a:
        if (r1 == 0) goto L_0x004d;
    L_0x004c:
        goto L_0x0050;
    L_0x004d:
        r2 = r2 + 1;
        goto L_0x0009;
    L_0x0050:
        if (r1 == 0) goto L_0x0053;
    L_0x0052:
        return r1;
    L_0x0053:
        r9 = new com.bumptech.glide.load.engine.GlideException;
        r10 = r8.fj;
        r11 = new java.util.ArrayList;
        r11.<init>(r13);
        r9.<init>(r10, r11);
        throw r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.engine.f.a(com.bumptech.glide.load.a.e, int, int, com.bumptech.glide.load.f, java.util.List):com.bumptech.glide.load.engine.p<ResourceType>");
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
