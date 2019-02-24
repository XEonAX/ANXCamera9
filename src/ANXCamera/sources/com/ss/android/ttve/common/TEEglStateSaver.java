package com.ss.android.ttve.common;

import android.annotation.TargetApi;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.util.Log;

@TargetApi(18)
public class TEEglStateSaver {
    private static final boolean DEBUG = true;
    private static final String TAG = "TEEglStateSaver";
    private EGLContext mSavedContext = EGL14.EGL_NO_CONTEXT;
    private EGLDisplay mSavedDisplay = EGL14.EGL_NO_DISPLAY;
    private EGLSurface mSavedDrawSurface = EGL14.EGL_NO_SURFACE;
    private EGLSurface mSavedReadSurface = EGL14.EGL_NO_SURFACE;

    public void saveEGLState() {
        this.mSavedContext = EGL14.eglGetCurrentContext();
        if (this.mSavedContext.equals(EGL14.EGL_NO_CONTEXT)) {
            Log.e(TAG, "Saved EGL_NO_CONTEXT");
        }
        this.mSavedReadSurface = EGL14.eglGetCurrentSurface(12378);
        if (this.mSavedReadSurface.equals(EGL14.EGL_NO_SURFACE)) {
            Log.e(TAG, "Saved EGL_NO_SURFACE");
        }
        this.mSavedDrawSurface = EGL14.eglGetCurrentSurface(12377);
        if (this.mSavedDrawSurface.equals(EGL14.EGL_NO_SURFACE)) {
            Log.e(TAG, "Saved EGL_NO_SURFACE");
        }
        this.mSavedDisplay = EGL14.eglGetCurrentDisplay();
        if (this.mSavedDisplay.equals(EGL14.EGL_NO_DISPLAY)) {
            Log.e(TAG, "Saved EGL_NO_DISPLAY");
        }
    }

    public EGLContext getSavedEGLContext() {
        return this.mSavedContext;
    }

    public void makeSavedStateCurrent() {
        EGL14.eglMakeCurrent(this.mSavedDisplay, this.mSavedReadSurface, this.mSavedDrawSurface, this.mSavedContext);
    }

    public void makeNothingCurrent() {
        EGL14.eglMakeCurrent(this.mSavedDisplay, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT);
    }

    public void logState() {
        if (this.mSavedContext.equals(EGL14.eglGetCurrentContext())) {
            Log.i(TAG, "Saved context DOES equal current.");
        } else {
            Log.i(TAG, "Saved context DOES NOT equal current.");
        }
        if (this.mSavedReadSurface.equals(EGL14.eglGetCurrentSurface(12378))) {
            Log.i(TAG, "Saved read surface DOES equal current.");
        } else if (this.mSavedReadSurface.equals(EGL14.EGL_NO_SURFACE)) {
            Log.i(TAG, "Saved read surface is EGL_NO_SURFACE");
        } else {
            Log.i(TAG, "Saved read surface DOES NOT equal current.");
        }
        if (this.mSavedDrawSurface.equals(EGL14.eglGetCurrentSurface(12377))) {
            Log.i(TAG, "Saved draw surface DOES equal current.");
        } else if (this.mSavedDrawSurface.equals(EGL14.EGL_NO_SURFACE)) {
            Log.i(TAG, "Saved draw surface is EGL_NO_SURFACE");
        } else {
            Log.i(TAG, "Saved draw surface DOES NOT equal current.");
        }
        if (this.mSavedDisplay.equals(EGL14.eglGetCurrentDisplay())) {
            Log.i(TAG, "Saved display DOES equal current.");
        } else {
            Log.i(TAG, "Saved display DOES NOT equal current.");
        }
    }
}
