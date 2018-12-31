package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;
import com.ss.android.ttve.common.TECommonCallback;
import com.ss.android.ttve.nativePort.NativeCallbacks.IOpenGLCallback;

@Keep
public class TENativeServiceBase {
    protected TECommonCallback mOnErrorListener = null;
    protected TECommonCallback mOnInfoListener = null;
    protected IOpenGLCallback mOpenGLCallback = null;

    public void setErrorListener(TECommonCallback tECommonCallback) {
        this.mOnErrorListener = tECommonCallback;
    }

    public void setInfoListener(TECommonCallback tECommonCallback) {
        this.mOnInfoListener = tECommonCallback;
    }

    public TECommonCallback getErrorListener() {
        return this.mOnErrorListener;
    }

    public TECommonCallback getInfoListener() {
        return this.mOnInfoListener;
    }

    public void setOpenGLListeners(IOpenGLCallback iOpenGLCallback) {
        this.mOpenGLCallback = iOpenGLCallback;
    }

    public IOpenGLCallback getOpenGLListeners() {
        return this.mOpenGLCallback;
    }

    public void nativeCallback_onOpenGLCreate(int i) {
        if (this.mOpenGLCallback != null) {
            this.mOpenGLCallback.onOpenGLCreate(i);
        }
    }

    public void nativeCallback_onOpenGLDrawBefore(int i, double d) {
        if (this.mOpenGLCallback != null) {
            this.mOpenGLCallback.onOpenGLDrawBefore(i, d);
        }
    }

    public void nativeCallback_onOpenGLDrawAfter(int i, double d) {
        if (this.mOpenGLCallback != null) {
            this.mOpenGLCallback.onOpenGLDrawAfter(i, d);
        }
    }

    public void nativeCallback_onOpenGLDestroy(int i) {
        if (this.mOpenGLCallback != null) {
            this.mOpenGLCallback.onOpenGLDestroy(i);
        }
    }

    public void nativeCallback_onPreviewSurface(int i) {
        if (this.mOpenGLCallback != null) {
            this.mOpenGLCallback.onPreviewSurface(i);
        }
    }

    public void nativeCallback_onErrorListener(int i, int i2, float f, String str) {
        if (this.mOnErrorListener != null) {
            this.mOnErrorListener.onCallback(i, i2, f, str);
        }
    }

    public void nativeCallback_onInfoListener(int i, int i2, float f) {
        if (this.mOnInfoListener != null) {
            this.mOnInfoListener.onCallback(i, i2, f, null);
        }
    }
}
