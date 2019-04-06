package com.arcsoft.camera.utils;

/* compiled from: MSize */
public class f implements Comparable<f> {
    private int a;
    private int b;

    public f(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    /* renamed from: a */
    public int b(f fVar) {
        return fVar == null ? 1 : this.a == fVar.a ? this.b - fVar.b : this.a - fVar.a;
    }

    public String a() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        stringBuilder.append(this.a);
        stringBuilder.append(",");
        stringBuilder.append(this.b);
        stringBuilder.append("]");
        return new String(stringBuilder.toString());
    }

    public boolean a(Object obj) {
        if (this == obj) {
            return true;
        }
        boolean z = false;
        if (obj == null || !(obj instanceof f)) {
            return false;
        }
        if (obj != null) {
            f fVar = (f) obj;
            z = d(fVar.a, fVar.b);
        }
        return z;
    }

    public int b() {
        return (this.a * 31) + this.b;
    }

    public boolean d(int i, int i2) {
        return this.a == i && this.b == i2;
    }
}
