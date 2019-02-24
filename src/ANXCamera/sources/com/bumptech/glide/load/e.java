package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.util.i;
import java.security.MessageDigest;

/* compiled from: Option */
public final class e<T> {
    private static final a<Object> cW = new a<Object>() {
        public void a(@NonNull byte[] bArr, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        }
    };
    private final a<T> cX;
    private volatile byte[] cY;
    private final T defaultValue;
    private final String key;

    /* compiled from: Option */
    public interface a<T> {
        void a(@NonNull byte[] bArr, @NonNull T t, @NonNull MessageDigest messageDigest);
    }

    @NonNull
    public static <T> e<T> g(@NonNull String str) {
        return new e(str, null, ac());
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull T t) {
        return new e(str, t, ac());
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull a<T> aVar) {
        return new e(str, null, aVar);
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        return new e(str, t, aVar);
    }

    private e(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        this.key = i.y(str);
        this.defaultValue = t;
        this.cX = (a) i.checkNotNull(aVar);
    }

    @Nullable
    public T getDefaultValue() {
        return this.defaultValue;
    }

    public void a(@NonNull T t, @NonNull MessageDigest messageDigest) {
        this.cX.a(ab(), t, messageDigest);
    }

    @NonNull
    private byte[] ab() {
        if (this.cY == null) {
            this.cY = this.key.getBytes(c.cU);
        }
        return this.cY;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        return this.key.equals(((e) obj).key);
    }

    public int hashCode() {
        return this.key.hashCode();
    }

    @NonNull
    private static <T> a<T> ac() {
        return cW;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Option{key='");
        stringBuilder.append(this.key);
        stringBuilder.append('\'');
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
