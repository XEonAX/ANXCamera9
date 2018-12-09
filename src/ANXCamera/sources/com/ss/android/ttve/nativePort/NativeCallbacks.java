package com.ss.android.ttve.nativePort;

public class NativeCallbacks {

    public interface IEncoderInitCallback {
        int onEncoderCreate(int i);
    }

    public interface INativeCreateCallback {
        int onNativeCreate(int i);
    }

    public interface IOpenGLCallback {
        int onOpenGLCreate(int i);

        int onOpenGLDestroy(int i);

        int onOpenGLDrawAfter(int i, double d);

        int onOpenGLDrawBefore(int i, double d);

        int onPreviewSurface(int i);
    }
}
