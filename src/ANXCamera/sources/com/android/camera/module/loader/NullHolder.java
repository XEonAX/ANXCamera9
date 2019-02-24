package com.android.camera.module.loader;

public final class NullHolder<T> {
    private int mException;
    private final T mValue;

    public static final <T> NullHolder<T> ofNullable(T t) {
        return of(t, 224);
    }

    public static final <T> NullHolder<T> ofNullable(T t, int i) {
        return of(t, i);
    }

    public T get() {
        return this.mValue;
    }

    private static <T> NullHolder<T> of(T t, int i) {
        return new NullHolder(t, i);
    }

    private NullHolder(T t, int i) {
        this.mValue = t;
        this.mException = i;
    }

    public boolean isPresent() {
        return this.mValue != null;
    }

    public int getException() {
        return this.mException;
    }

    public void setException(int i) {
        this.mException = i;
    }
}
