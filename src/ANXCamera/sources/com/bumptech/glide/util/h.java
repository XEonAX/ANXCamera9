package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

/* compiled from: MultiClassKey */
public class h {
    private Class<?> pp;
    private Class<?> pq;
    private Class<?> pr;

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
        this.pp = cls;
        this.pq = cls2;
        this.pr = cls3;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MultiClassKey{first=");
        stringBuilder.append(this.pp);
        stringBuilder.append(", second=");
        stringBuilder.append(this.pq);
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
        if (this.pp.equals(hVar.pp) && this.pq.equals(hVar.pq) && k.b(this.pr, hVar.pr)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return (31 * ((this.pp.hashCode() * 31) + this.pq.hashCode())) + (this.pr != null ? this.pr.hashCode() : 0);
    }
}
