package com.android.camera.module.loader;

import io.reactivex.Scheduler;
import io.reactivex.functions.Function;

public abstract class Func1Base<T, R> implements Function<NullHolder<T>, NullHolder<R>> {
    protected int mTargetMode;

    public abstract Scheduler getWorkThread();

    public Func1Base(int i) {
        this.mTargetMode = i;
    }
}
