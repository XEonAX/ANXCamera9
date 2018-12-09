package com.android.camera.module.loader;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public interface SurfaceStateListener {
    public static final int SURFACE_STATE_OK = 4;
    public static final int SURFACE_STATE_PAUSED = 2;
    public static final int SURFACE_STATE_UNCREATED = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface SurfaceState {
    }

    boolean hasSurface();

    void updateSurfaceState(int i);
}
