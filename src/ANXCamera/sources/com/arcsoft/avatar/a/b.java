package com.arcsoft.avatar.a;

import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.view.Surface;

/* compiled from: EGLWrapper */
public class b {
    private static final String a = "Arc_EGLWrapper";
    private static final int b = 12610;
    private EGLSurface cA;
    private EGLConfig[] cB;
    private EGLContext cC;
    private Surface cD;
    private EGLContext cy;
    private EGLDisplay cz;
    private int i;
    private int j;

    public b(Surface surface) {
        this.cy = EGL14.EGL_NO_CONTEXT;
        this.cz = EGL14.EGL_NO_DISPLAY;
        this.cA = EGL14.EGL_NO_SURFACE;
        this.cB = new EGLConfig[1];
        this.cC = EGL14.EGL_NO_CONTEXT;
        if (surface != null) {
            this.cD = surface;
            b();
            return;
        }
        throw new NullPointerException();
    }

    public b(Surface surface, EGLContext eGLContext) {
        this.cy = EGL14.EGL_NO_CONTEXT;
        this.cz = EGL14.EGL_NO_DISPLAY;
        this.cA = EGL14.EGL_NO_SURFACE;
        this.cB = new EGLConfig[1];
        this.cC = EGL14.EGL_NO_CONTEXT;
        if (surface != null) {
            this.cD = surface;
            this.cC = eGLContext;
            b();
            return;
        }
        throw new NullPointerException();
    }

    private void a() {
        this.cA = EGL14.eglCreateWindowSurface(this.cz, this.cB[0], this.cD, new int[]{12344}, 0);
        a("eglCreateWindowSurface");
        if (this.cA == null) {
            throw new RuntimeException("surface == null");
        }
    }

    private void a(String str) {
        int eglGetError = EGL14.eglGetError();
        if (eglGetError != 12288) {
            new Exception("NOT_ERROR_JUST_SEE_CALL_STACK").printStackTrace();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": EGL_ERROR_CODE: 0x");
            stringBuilder.append(Integer.toHexString(eglGetError));
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    private void b() {
        this.cz = EGL14.eglGetDisplay(0);
        if (this.cz != EGL14.EGL_NO_DISPLAY) {
            int[] iArr = new int[2];
            if (EGL14.eglInitialize(this.cz, iArr, 0, iArr, 1)) {
                if (EGL14.eglChooseConfig(this.cz, new int[]{12339, 4, 12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 16, 12610, 1, 12344}, 0, this.cB, 0, this.cB.length, new int[1], 0)) {
                    this.cy = EGL14.eglCreateContext(this.cz, this.cB[0], this.cC, new int[]{12440, 2, 12344}, 0);
                    a("eglCreateContext");
                    if (this.cy != null) {
                        a();
                        this.i = getWidth();
                        this.j = getHeight();
                        return;
                    }
                    throw new RuntimeException("eglCreateContext == null");
                }
                throw new RuntimeException("eglChooseConfig [RGBA888 + recordable] ES2 EGL_config_fail...");
            }
            this.cz = null;
            throw new RuntimeException("EGL14.eglInitialize fail...");
        }
        throw new RuntimeException("EGL14.eglGetDisplay fail...");
    }

    private void c() {
        if (this.cz != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.cz, this.cA);
            this.cA = EGL14.EGL_NO_SURFACE;
        }
    }

    public void b(int i, int i2) {
        if (i != this.i || i2 != this.j) {
            c();
            a();
            this.i = getWidth();
            this.j = getHeight();
        }
    }

    public int getHeight() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.cz, this.cA, 12374, iArr, 0);
        return iArr[0];
    }

    public Surface getSurface() {
        return this.cD;
    }

    public int getWidth() {
        int[] iArr = new int[1];
        EGL14.eglQuerySurface(this.cz, this.cA, 12375, iArr, 0);
        return iArr[0];
    }

    public void i() {
        if (!EGL14.eglMakeCurrent(this.cz, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)) {
            a("makeUnCurrent");
        }
    }

    public boolean makeCurrent() {
        if (this.cz == null || this.cA == null) {
            return false;
        }
        boolean eglMakeCurrent = EGL14.eglMakeCurrent(this.cz, this.cA, this.cA, this.cy);
        if (!eglMakeCurrent) {
            a("makeCurrent");
        }
        return eglMakeCurrent;
    }

    public void release() {
        if (this.cz != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglDestroySurface(this.cz, this.cA);
            EGL14.eglDestroyContext(this.cz, this.cy);
            EGL14.eglTerminate(this.cz);
        }
        this.cz = EGL14.EGL_NO_DISPLAY;
        this.cy = EGL14.EGL_NO_CONTEXT;
        this.cA = EGL14.EGL_NO_SURFACE;
        this.cC = EGL14.EGL_NO_CONTEXT;
        try {
            if (this.cD != null) {
                this.cD.release();
            }
        } catch (Exception e) {
        }
        this.cD = null;
    }

    public void setPresentationTime(long j) {
        EGLExt.eglPresentationTimeANDROID(this.cz, this.cA, j);
        a("eglPresentationTimeANDROID");
    }

    public boolean swapBuffers() {
        if (this.cz == null || this.cA == null) {
            return false;
        }
        boolean eglSwapBuffers = EGL14.eglSwapBuffers(this.cz, this.cA);
        if (!eglSwapBuffers) {
            a("makeCurrent");
        }
        return eglSwapBuffers;
    }
}
