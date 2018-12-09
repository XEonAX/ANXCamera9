package com.android.camera.module.encoder;

import android.annotation.TargetApi;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.os.Build.VERSION;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import com.android.camera.log.Log;

@TargetApi(18)
public class EGLBase {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    private static final String TAG = EGLBase.class.getSimpleName();
    private EGLContext mDefaultContext = EGL14.EGL_NO_CONTEXT;
    private EGLConfig mEglConfig = null;
    private EGLContext mEglContext = EGL14.EGL_NO_CONTEXT;
    private EGLDisplay mEglDisplay = EGL14.EGL_NO_DISPLAY;

    public static class EglSurface {
        private final EGLBase mEgl;
        private EGLSurface mEglSurface = EGL14.EGL_NO_SURFACE;
        private final int mHeight;
        private final int mWidth;

        EglSurface(EGLBase eGLBase, Object obj) {
            Log.v(EGLBase.TAG, "EglSurface");
            if ((obj instanceof SurfaceView) || (obj instanceof Surface) || (obj instanceof SurfaceHolder) || (obj instanceof SurfaceTexture)) {
                this.mEgl = eGLBase;
                this.mEglSurface = this.mEgl.createWindowSurface(obj);
                this.mWidth = this.mEgl.querySurface(this.mEglSurface, 12375);
                this.mHeight = this.mEgl.querySurface(this.mEglSurface, 12374);
                Log.v(EGLBase.TAG, String.format("EglSurface: size(%d, %d)", new Object[]{Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight)}));
                return;
            }
            throw new IllegalArgumentException("unsupported surface");
        }

        EglSurface(EGLBase eGLBase, int i, int i2) {
            Log.v(EGLBase.TAG, "EglSurface");
            this.mEgl = eGLBase;
            this.mEglSurface = this.mEgl.createOffscreenSurface(i, i2);
            this.mWidth = i;
            this.mHeight = i2;
        }

        public void makeCurrent() {
            this.mEgl.makeCurrent(this.mEglSurface);
        }

        public void swap() {
            this.mEgl.swap(this.mEglSurface);
        }

        public EGLContext getContext() {
            return this.mEgl.getContext();
        }

        public void release() {
            Log.v(EGLBase.TAG, "EglSurface:release");
            this.mEgl.makeDefault();
            this.mEgl.destroyWindowSurface(this.mEglSurface);
            this.mEglSurface = EGL14.EGL_NO_SURFACE;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public int getHeight() {
            return this.mHeight;
        }
    }

    public EGLBase(EGLContext eGLContext, boolean z, boolean z2) {
        Log.v(TAG, "EGLBase");
        init(eGLContext, z, z2);
    }

    public void release() {
        Log.v(TAG, "release");
        if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
            destroyContext();
            EGL14.eglTerminate(this.mEglDisplay);
            EGL14.eglReleaseThread();
        }
        this.mEglDisplay = EGL14.EGL_NO_DISPLAY;
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
    }

    public EglSurface createFromSurface(Object obj) {
        Log.v(TAG, "createFromSurface");
        EglSurface eglSurface = new EglSurface(this, obj);
        eglSurface.makeCurrent();
        return eglSurface;
    }

    public EglSurface createOffscreen(int i, int i2) {
        Log.v(TAG, "createOffscreen");
        EglSurface eglSurface = new EglSurface(this, i, i2);
        eglSurface.makeCurrent();
        return eglSurface;
    }

    public EGLContext getContext() {
        return this.mEglContext;
    }

    public int querySurface(EGLSurface eGLSurface, int i) {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.mEglDisplay, eGLSurface, i, iArr, 0);
        return iArr[0];
    }

    private void init(EGLContext eGLContext, boolean z, boolean z2) {
        Log.v(TAG, "init");
        if (this.mEglDisplay == EGL14.EGL_NO_DISPLAY) {
            this.mEglDisplay = EGL14.eglGetDisplay(0);
            if (this.mEglDisplay != EGL14.EGL_NO_DISPLAY) {
                int[] iArr = new int[2];
                if (EGL14.eglInitialize(this.mEglDisplay, iArr, 0, iArr, 1)) {
                    if (eGLContext == null) {
                        eGLContext = EGL14.EGL_NO_CONTEXT;
                    }
                    if (this.mEglContext == EGL14.EGL_NO_CONTEXT) {
                        this.mEglConfig = getConfig(z, z2);
                        if (this.mEglConfig != null) {
                            this.mEglContext = createContext(eGLContext);
                        } else {
                            throw new RuntimeException("chooseConfig failed");
                        }
                    }
                    int[] iArr2 = new int[1];
                    EGL14.eglQueryContext(this.mEglDisplay, this.mEglContext, 12440, iArr2, 0);
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("EGLContext created, client version ");
                    stringBuilder.append(iArr2[0]);
                    Log.d(str, stringBuilder.toString());
                    makeDefault();
                    return;
                }
                this.mEglDisplay = null;
                throw new RuntimeException("eglInitialize failed");
            }
            throw new RuntimeException("eglGetDisplay failed");
        }
        throw new RuntimeException("EGL already set up");
    }

    private boolean makeCurrent(EGLSurface eGLSurface) {
        if (this.mEglDisplay == null) {
            Log.e(TAG, "makeCurrent: eglDisplay not initialized");
        }
        if (eGLSurface == null || eGLSurface == EGL14.EGL_NO_SURFACE) {
            if (EGL14.eglGetError() == 12299) {
                Log.e(TAG, "makeCurrent: returned EGL_BAD_NATIVE_WINDOW.");
            }
            return false;
        } else if (EGL14.eglMakeCurrent(this.mEglDisplay, eGLSurface, eGLSurface, this.mEglContext)) {
            return true;
        } else {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("eglMakeCurrent: err=");
            stringBuilder.append(EGL14.eglGetError());
            Log.e(str, stringBuilder.toString());
            return false;
        }
    }

    private void makeDefault() {
        Log.v(TAG, "makeDefault");
        if (!EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("makeDefault: err=");
            stringBuilder.append(EGL14.eglGetError());
            Log.w(str, stringBuilder.toString());
        }
    }

    private int swap(EGLSurface eGLSurface) {
        if (EGL14.eglSwapBuffers(this.mEglDisplay, eGLSurface)) {
            return 12288;
        }
        int eglGetError = EGL14.eglGetError();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("swap: err=");
        stringBuilder.append(eglGetError);
        Log.w(str, stringBuilder.toString());
        return eglGetError;
    }

    private EGLContext createContext(EGLContext eGLContext) {
        Log.v(TAG, "createContext");
        eGLContext = EGL14.eglCreateContext(this.mEglDisplay, this.mEglConfig, eGLContext, new int[]{12440, 2, 12344}, 0);
        checkEglError("eglCreateContext");
        return eGLContext;
    }

    private void destroyContext() {
        String str;
        StringBuilder stringBuilder;
        Log.v(TAG, "destroyContext");
        if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mEglContext)) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("destroyContext: display=");
            stringBuilder.append(this.mEglDisplay);
            stringBuilder.append(" context=");
            stringBuilder.append(this.mEglContext);
            Log.e(str, stringBuilder.toString());
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("destroyContext: err=");
            stringBuilder.append(EGL14.eglGetError());
            Log.e(str, stringBuilder.toString());
        }
        this.mEglContext = EGL14.EGL_NO_CONTEXT;
        if (this.mDefaultContext != EGL14.EGL_NO_CONTEXT) {
            if (!EGL14.eglDestroyContext(this.mEglDisplay, this.mDefaultContext)) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("destroyDefaultContext: display=");
                stringBuilder.append(this.mEglDisplay);
                stringBuilder.append(" context=");
                stringBuilder.append(this.mDefaultContext);
                Log.e(str, stringBuilder.toString());
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("destroyDefaultContext: err=");
                stringBuilder.append(EGL14.eglGetError());
                Log.e(str, stringBuilder.toString());
            }
            this.mDefaultContext = EGL14.EGL_NO_CONTEXT;
        }
    }

    private EGLSurface createWindowSurface(Object obj) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("createWindowSurface: nativeWindow=");
        stringBuilder.append(obj);
        Log.v(str, stringBuilder.toString());
        try {
            return EGL14.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, obj, new int[]{12344}, 0);
        } catch (Throwable e) {
            Log.e(TAG, "eglCreateWindowSurface", e);
            return null;
        }
    }

    private EGLSurface createOffscreenSurface(int i, int i2) {
        EGLSurface eglCreatePbufferSurface;
        Throwable e;
        Throwable th;
        Log.v(TAG, "createOffscreenSurface");
        try {
            eglCreatePbufferSurface = EGL14.eglCreatePbufferSurface(this.mEglDisplay, this.mEglConfig, new int[]{12375, i, 12374, i2, 12344}, 0);
            try {
                checkEglError("eglCreatePbufferSurface");
                if (eglCreatePbufferSurface == null) {
                    throw new RuntimeException("surface was null");
                }
            } catch (IllegalArgumentException e2) {
                e = e2;
                Log.e(TAG, "createOffscreenSurface", e);
                return eglCreatePbufferSurface;
            } catch (RuntimeException e3) {
                e = e3;
                Log.e(TAG, "createOffscreenSurface", e);
                return eglCreatePbufferSurface;
            }
        } catch (Throwable e4) {
            th = e4;
            eglCreatePbufferSurface = null;
            e = th;
            Log.e(TAG, "createOffscreenSurface", e);
            return eglCreatePbufferSurface;
        } catch (Throwable e42) {
            th = e42;
            eglCreatePbufferSurface = null;
            e = th;
            Log.e(TAG, "createOffscreenSurface", e);
            return eglCreatePbufferSurface;
        }
        return eglCreatePbufferSurface;
    }

    private void destroyWindowSurface(EGLSurface eGLSurface) {
        Log.v(TAG, "destroySurface>>>");
        if (eGLSurface != EGL14.EGL_NO_SURFACE) {
            EGL14.eglMakeCurrent(this.mEglDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            EGL14.eglDestroySurface(this.mEglDisplay, eGLSurface);
        }
        eGLSurface = EGL14.EGL_NO_SURFACE;
        Log.v(TAG, "destroySurface<<<");
    }

    private void checkEglError(String str) {
        int eglGetError = EGL14.eglGetError();
        if (eglGetError != 12288) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": EGL error: 0x");
            stringBuilder.append(Integer.toHexString(eglGetError));
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    private EGLConfig getConfig(boolean z, boolean z2) {
        int i;
        int[] iArr = new int[]{12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12344, 12344, 12344, 12344, 12344, 12344, 12344};
        int i2 = 10;
        if (z) {
            iArr[10] = 12325;
            i2 = 12;
            iArr[11] = 16;
        }
        if (z2 && VERSION.SDK_INT >= 18) {
            i = i2 + 1;
            iArr[i2] = 12610;
            i2 = i + 1;
            iArr[i] = 1;
        }
        for (i = iArr.length - 1; i >= i2; i--) {
            iArr[i] = 12344;
        }
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        if (EGL14.eglChooseConfig(this.mEglDisplay, iArr, 0, eGLConfigArr, 0, eGLConfigArr.length, new int[1], 0)) {
            return eGLConfigArr[0];
        }
        Log.w(TAG, "unable to find RGBA8888 /  EGLConfig");
        return null;
    }
}
