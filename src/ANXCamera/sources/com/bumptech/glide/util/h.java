package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> pq;
    private Class<?> pr;
    private Class<?> ps;

    public h(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        j(cls, cls2);
    }

    public h(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        f(cls, cls2, cls3);
    }

    public void j(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        f(cls, cls2, null);
    }

    public void f(@NonNull Class<?> cls, @NonNull Class<?> cls2, @Nullable Class<?> cls3) {
        this.pq = cls;
        this.pr = cls2;
        this.ps = cls3;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MultiClassKey{first=");
        stringBuilder.append(this.pq);
        stringBuilder.append(", second=");
        stringBuilder.append(this.pr);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        h hVar = (h) obj;
        if (this.pq.equals(hVar.pq) && this.pr.equals(hVar.pr) && k.b(this.ps, hVar.ps)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return (31 * ((this.pq.hashCode() * 31) + this.pr.hashCode())) + (this.ps != null ? this.ps.hashCode() : 0);
    }
}
