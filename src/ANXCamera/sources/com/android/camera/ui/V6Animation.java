package com.android.camera.ui;

public interface V6Animation {
    void animateIn(Runnable runnable);

    void animateIn(Runnable runnable, int i);

    void animateIn(Runnable runnable, int i, boolean z);

    void animateOut(Runnable runnable);

    void animateOut(Runnable runnable, int i);

    void animateOut(Runnable runnable, int i, boolean z);
}
