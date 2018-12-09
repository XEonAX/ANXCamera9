package com.ss.android.ttve.common;

import android.annotation.TargetApi;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.util.Log;

@TargetApi(17)
public class TESharedContext {
    public static final int EGL_RECORDABLE_ANDROID = 12610;
    private static final String LOG_TAG = TESharedContext.class.getSimpleName();
    private static int mBitsA = 8;
    private static int mBitsB = 8;
    private static int mBitsG = 8;
    private static int mBitsR = 8;
    private EGLConfig mConfig;
    private EGLContext mContext;
    private EGLDisplay mDisplay;
    private EGLSurface mSurface;

    TESharedContext() {
    }

    public static void setContextColorBits(int i, int i2, int i3, int i4) {
        mBitsR = i;
        mBitsG = i2;
        mBitsB = i3;
        mBitsA = i4;
    }

    public static TESharedContext create() {
        return create(EGL14.EGL_NO_CONTEXT, 64, 64, 1, null);
    }

    public static TESharedContext create(int i, int i2) {
        return create(EGL14.EGL_NO_CONTEXT, i, i2, 1, null);
    }

    public static TESharedContext create(EGLContext eGLContext, int i, int i2) {
        return create(eGLContext, i, i2, 1, null);
    }

    public static TESharedContext create(EGLContext eGLContext, int i, Object obj) {
        return create(eGLContext, 64, 64, i, obj);
    }

    public static TESharedContext create(EGLContext eGLContext, int i, int i2, int i3, Object obj) {
        TESharedContext tESharedContext = new TESharedContext();
        if (tESharedContext.initEGL(eGLContext, i, i2, i3, obj)) {
            return tESharedContext;
        }
        tESharedContext.release();
        return null;
    }

    public EGLContext getContext() {
        return this.mContext;
    }

    public EGLDisplay getDisplay() {
        return this.mDisplay;
    }

    public EGLSurface getSurface() {
        return this.mSurface;
    }

    public void release() {
        Log.i(LOG_TAG, "#### CGESharedGLContext Destroying context... ####");
        if (this.mDisplay != EGL14.EGL_NO_DISPLAY) {
            EGL14.eglMakeCurrent(this.mDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
            EGL14.eglDestroyContext(this.mDisplay, this.mContext);
            EGL14.eglDestroySurface(this.mDisplay, this.mSurface);
            EGL14.eglTerminate(this.mDisplay);
        }
        this.mDisplay = EGL14.EGL_NO_DISPLAY;
        this.mSurface = EGL14.EGL_NO_SURFACE;
        this.mContext = EGL14.EGL_NO_CONTEXT;
    }

    public boolean makeCurrent() {
        if (EGL14.eglMakeCurrent(this.mDisplay, this.mSurface, this.mSurface, this.mContext)) {
            return true;
        }
        checkEglError("eglMakeCurrent");
        return false;
    }

    public boolean updateSurface(int i, int i2, int i3, Object obj) {
        EGL14.eglDestroySurface(this.mDisplay, this.mSurface);
        int[] iArr = new int[]{12375, i, 12374, i2, 12344};
        if (i3 != 2) {
            if (i3 != 4) {
                if (i3 != EGL_RECORDABLE_ANDROID) {
                    this.mSurface = EGL14.eglCreatePbufferSurface(this.mDisplay, this.mConfig, iArr, 0);
                } else {
                    iArr[0] = 12344;
                    iArr[2] = 12344;
                }
            }
            this.mSurface = EGL14.eglCreateWindowSurface(this.mDisplay, this.mConfig, obj, iArr, 0);
        } else {
            this.mSurface = EGL14.eglCreatePixmapSurface(this.mDisplay, this.mConfig, 0, iArr, 0);
        }
        if (this.mSurface != EGL14.EGL_NO_SURFACE) {
            return makeCurrent();
        }
        checkEglError("eglCreateSurface");
        return false;
    }

    @TargetApi(18)
    public void setPresentationTime(long j) {
        EGLExt.eglPresentationTimeANDROID(this.mDisplay, this.mSurface, j);
        checkEglError("eglPresentationTimeANDROID");
    }

    public void makeNoCurrent() {
        EGL14.eglMakeCurrent(this.mDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
        checkEglError("makeNoCurrent");
    }

    public boolean swapBuffers() {
        return EGL14.eglSwapBuffers(this.mDisplay, this.mSurface);
    }

    private boolean initEGL(EGLContext eGLContext, int i, int i2, int i3, Object obj) {
        EGLContext eGLContext2;
        int i4 = i3;
        if (eGLContext == null) {
            eGLContext2 = EGL14.EGL_NO_CONTEXT;
        } else {
            eGLContext2 = eGLContext;
        }
        int[] iArr = new int[]{12440, 2, 12344};
        int[] iArr2 = new int[]{12352, 4, 12324, mBitsR, 12323, mBitsG, 12322, mBitsB, 12321, mBitsA, 12339, i4, 12344};
        if (i4 == EGL_RECORDABLE_ANDROID) {
            iArr2[iArr2.length - 3] = EGL_RECORDABLE_ANDROID;
            iArr2[iArr2.length - 2] = 1;
        }
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        int[] iArr3 = new int[1];
        int[] iArr4 = new int[]{0, 1};
        int[] iArr5 = new int[]{12375, i, 12374, i2, 12344};
        EGLDisplay eglGetDisplay = EGL14.eglGetDisplay(0);
        this.mDisplay = eglGetDisplay;
        if (eglGetDisplay == EGL14.EGL_NO_DISPLAY) {
            checkEglError("eglGetDisplay");
            return false;
        }
        int[] iArr6 = new int[2];
        if (!eGLContext2.equals(EGL14.EGL_NO_CONTEXT) && EGL14.eglQueryContext(this.mDisplay, eGLContext2, 12440, iArr6, 0)) {
            iArr[1] = iArr6[0];
        }
        if (EGL14.eglInitialize(this.mDisplay, iArr4, 0, iArr4, 1)) {
            Log.i(LOG_TAG, String.format("eglInitialize - major: %d, minor: %d", new Object[]{Integer.valueOf(iArr4[0]), Integer.valueOf(iArr4[1])}));
            int[] iArr7 = iArr5;
            int[] iArr8 = iArr3;
            EGLConfig[] eGLConfigArr2 = eGLConfigArr;
            if (EGL14.eglChooseConfig(this.mDisplay, iArr2, 0, eGLConfigArr, 0, eGLConfigArr.length, iArr8, 0)) {
                String str = LOG_TAG;
                String str2 = "Config num: %d, has sharedContext: %s";
                Object[] objArr = new Object[2];
                objArr[0] = Integer.valueOf(iArr8[0]);
                objArr[1] = eGLContext2 == EGL14.EGL_NO_CONTEXT ? "NO" : "YES";
                Log.i(str, String.format(str2, objArr));
                this.mConfig = eGLConfigArr2[0];
                this.mContext = EGL14.eglCreateContext(this.mDisplay, this.mConfig, eGLContext2, iArr, 0);
                if (this.mContext == EGL14.EGL_NO_CONTEXT) {
                    checkEglError("eglCreateContext");
                    return false;
                }
                if (i4 != 2) {
                    if (i4 != 4) {
                        if (i4 != EGL_RECORDABLE_ANDROID) {
                            this.mSurface = EGL14.eglCreatePbufferSurface(this.mDisplay, this.mConfig, iArr7, 0);
                        } else {
                            iArr7[0] = 12344;
                            iArr7[2] = 12344;
                        }
                    }
                    this.mSurface = EGL14.eglCreateWindowSurface(this.mDisplay, this.mConfig, obj, iArr7, 0);
                } else {
                    this.mSurface = EGL14.eglCreatePixmapSurface(this.mDisplay, this.mConfig, 0, iArr7, 0);
                }
                if (this.mSurface == EGL14.EGL_NO_SURFACE) {
                    checkEglError("eglCreateSurface");
                    return false;
                } else if (!makeCurrent()) {
                    return false;
                } else {
                    int[] iArr9 = new int[1];
                    EGL14.eglQueryContext(this.mDisplay, this.mContext, 12440, iArr9, 0);
                    String str3 = LOG_TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("EGLContext created, client version ");
                    stringBuilder.append(iArr9[0]);
                    Log.i(str3, stringBuilder.toString());
                    return true;
                }
            }
            checkEglError("eglChooseConfig");
            return false;
        }
        checkEglError("eglInitialize");
        return false;
    }

    private void checkEglError(String str) {
        int eglGetError = EGL14.eglGetError();
        if (eglGetError != 12288) {
            String str2 = LOG_TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(": EGL error: 0x");
            stringBuilder.append(Integer.toHexString(eglGetError));
            Log.e(str2, stringBuilder.toString());
            if (eglGetError == 12294) {
                Log.e(LOG_TAG, "gl error EGL_BAD_CONTEXT");
            }
        }
    }
}
