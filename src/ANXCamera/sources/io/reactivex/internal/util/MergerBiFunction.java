package io.reactivex.internal.util;

import io.reactivex.functions.BiFunction;
import java.util.Comparator;
import java.util.List;

public final class MergerBiFunction<T> implements BiFunction<List<T>, List<T>, List<T>> {
    final Comparator<? super T> comparator;

    public MergerBiFunction(Comparator<? super T> comparator) {
        this.comparator = comparator;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0053  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0075  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0064  */
    public java.util.List<T> apply(java.util.List<T> r6, java.util.List<T> r7) throws java.lang.Exception {
        /*
        r5 = this;
        r0 = r6.size();
        r1 = r7.size();
        r0 = r0 + r1;
        if (r0 != 0) goto L_0x0011;
    L_0x000b:
        r6 = new java.util.ArrayList;
        r6.<init>();
        return r6;
    L_0x0011:
        r1 = new java.util.ArrayList;
        r1.<init>(r0);
        r6 = r6.iterator();
        r7 = r7.iterator();
        r0 = r6.hasNext();
        r2 = 0;
        if (r0 == 0) goto L_0x002a;
    L_0x0025:
        r0 = r6.next();
        goto L_0x002b;
    L_0x002a:
        r0 = r2;
    L_0x002b:
        r3 = r7.hasNext();
        if (r3 == 0) goto L_0x0036;
    L_0x0031:
        r3 = r7.next();
        goto L_0x0037;
    L_0x0036:
        r3 = r2;
    L_0x0037:
        if (r0 == 0) goto L_0x0062;
    L_0x0039:
        if (r3 == 0) goto L_0x0062;
    L_0x003b:
        r4 = r5.comparator;
        r4 = r4.compare(r0, r3);
        if (r4 >= 0) goto L_0x0053;
    L_0x0043:
        r1.add(r0);
        r0 = r6.hasNext();
        if (r0 == 0) goto L_0x0051;
    L_0x004c:
        r0 = r6.next();
        goto L_0x0037;
    L_0x0051:
        r0 = r2;
        goto L_0x0037;
    L_0x0053:
        r1.add(r3);
        r3 = r7.hasNext();
        if (r3 == 0) goto L_0x0061;
    L_0x005c:
        r3 = r7.next();
        goto L_0x0037;
    L_0x0061:
        goto L_0x0036;
    L_0x0062:
        if (r0 == 0) goto L_0x0075;
    L_0x0064:
        r1.add(r0);
    L_0x0067:
        r7 = r6.hasNext();
        if (r7 == 0) goto L_0x0088;
    L_0x006d:
        r7 = r6.next();
        r1.add(r7);
        goto L_0x0067;
    L_0x0075:
        if (r3 == 0) goto L_0x0088;
    L_0x0077:
        r1.add(r3);
    L_0x007a:
        r6 = r7.hasNext();
        if (r6 == 0) goto L_0x0088;
    L_0x0080:
        r6 = r7.next();
        r1.add(r6);
        goto L_0x007a;
    L_0x0088:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.util.MergerBiFunction.apply(java.util.List, java.util.List):java.util.List<T>");
    }
}
