package com.android.camera.ui;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.GLDebugHelper;
import android.opengl.GLSurfaceView.Renderer;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import com.android.camera.log.Log;
import java.io.Writer;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;
import javax.microedition.khronos.opengles.GL10;

public class GLTextureView extends TextureView implements SurfaceTextureListener {
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean LOG_ATTACH_DETACH = false;
    private static final boolean LOG_EGL = false;
    private static final boolean LOG_PAUSE_RESUME = false;
    private static final boolean LOG_RENDERER = false;
    private static final boolean LOG_RENDERER_DRAW_FRAME = false;
    private static final boolean LOG_SURFACE = false;
    private static final boolean LOG_THREADS = false;
    public static final int RENDERMODE_CONTINUOUSLY = 1;
    public static final int RENDERMODE_WHEN_DIRTY = 0;
    private static final String TAG = "GLTextureView";
    private static final GLThreadManager sGLThreadManager = new GLThreadManager();
    private int mDebugFlags;
    private boolean mDetached;
    private EGLConfigChooser mEGLConfigChooser;
    private int mEGLContextClientVersion;
    private EGLContextFactory mEGLContextFactory;
    private EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private GLThread mGLThread;
    private GLWrapper mGLWrapper;
    private boolean mPreserveEGLContextOnPause;
    private int mPreservedHeight;
    private int mPreservedWidth;
    private Renderer mRenderer;
    private EGLShareContextGetter mShareContextGetter;
    private final WeakReference<GLTextureView> mThisWeakRef = new WeakReference(this);

    public interface EGLShareContextGetter {
        EGLContext getShareContext();
    }

    public interface EGLConfigChooser {
        EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay);
    }

    private abstract class BaseConfigChooser implements EGLConfigChooser {
        protected int[] mConfigSpec;

        abstract EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr);

        public BaseConfigChooser(int[] iArr) {
            this.mConfigSpec = filterConfigSpec(iArr);
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
            int[] iArr = new int[1];
            if (egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, null, 0, iArr)) {
                int i = iArr[0];
                if (i > 0) {
                    EGLConfig[] eGLConfigArr = new EGLConfig[i];
                    if (egl10.eglChooseConfig(eGLDisplay, this.mConfigSpec, eGLConfigArr, i, iArr)) {
                        EGLConfig chooseConfig = chooseConfig(egl10, eGLDisplay, eGLConfigArr);
                        if (chooseConfig != null) {
                            return chooseConfig;
                        }
                        throw new IllegalArgumentException("No config chosen");
                    }
                    throw new IllegalArgumentException("eglChooseConfig#2 failed");
                }
                throw new IllegalArgumentException("No configs match configSpec");
            }
            throw new IllegalArgumentException("eglChooseConfig failed");
        }

        private int[] filterConfigSpec(int[] iArr) {
            if (GLTextureView.this.mEGLContextClientVersion != 2) {
                return iArr;
            }
            int length = iArr.length;
            Object obj = new int[(length + 2)];
            int i = length - 1;
            System.arraycopy(iArr, 0, obj, 0, i);
            obj[i] = 12352;
            obj[length] = 4;
            obj[length + 1] = 12344;
            return obj;
        }
    }

    private class ComponentSizeChooser extends BaseConfigChooser {
        protected int mAlphaSize;
        protected int mBlueSize;
        protected int mDepthSize;
        protected int mGreenSize;
        protected int mRedSize;
        protected int mStencilSize;
        private int[] mValue = new int[1];

        public ComponentSizeChooser(int i, int i2, int i3, int i4, int i5, int i6) {
            super(new int[]{12324, i, 12323, i2, 12322, i3, 12321, i4, 12325, i5, 12326, i6, 12344});
            this.mRedSize = i;
            this.mGreenSize = i2;
            this.mBlueSize = i3;
            this.mAlphaSize = i4;
            this.mDepthSize = i5;
            this.mStencilSize = i6;
        }

        public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig[] eGLConfigArr) {
            for (EGLConfig eGLConfig : eGLConfigArr) {
                EGL10 egl102 = egl10;
                EGLDisplay eGLDisplay2 = eGLDisplay;
                EGLConfig eGLConfig2 = eGLConfig;
                int findConfigAttrib = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12325, 0);
                int findConfigAttrib2 = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12326, 0);
                if (findConfigAttrib >= this.mDepthSize && findConfigAttrib2 >= this.mStencilSize) {
                    egl102 = egl10;
                    eGLDisplay2 = eGLDisplay;
                    eGLConfig2 = eGLConfig;
                    findConfigAttrib = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12324, 0);
                    int findConfigAttrib3 = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12323, 0);
                    int findConfigAttrib4 = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12322, 0);
                    findConfigAttrib2 = findConfigAttrib(egl102, eGLDisplay2, eGLConfig2, 12321, 0);
                    if (findConfigAttrib == this.mRedSize && findConfigAttrib3 == this.mGreenSize && findConfigAttrib4 == this.mBlueSize && findConfigAttrib2 == this.mAlphaSize) {
                        return eGLConfig;
                    }
                }
            }
            return null;
        }

        private int findConfigAttrib(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, int i, int i2) {
            if (egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, i, this.mValue)) {
                return this.mValue[0];
            }
            return i2;
        }
    }

    public interface EGLContextFactory {
        EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext);

        void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext);
    }

    private class DefaultContextFactory implements EGLContextFactory {
        private static final String TAG = "DefaultContextFactory";
        private int EGL_CONTEXT_CLIENT_VERSION;

        private DefaultContextFactory() {
            this.EGL_CONTEXT_CLIENT_VERSION = 12440;
        }

        public EGLContext createContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, EGLContext eGLContext) {
            int[] iArr = new int[]{this.EGL_CONTEXT_CLIENT_VERSION, GLTextureView.this.mEGLContextClientVersion, 12344};
            if (eGLContext == null) {
                eGLContext = EGL10.EGL_NO_CONTEXT;
            }
            if (GLTextureView.this.mEGLContextClientVersion == 0) {
                iArr = null;
            }
            return egl10.eglCreateContext(eGLDisplay, eGLConfig, eGLContext, iArr);
        }

        public void destroyContext(EGL10 egl10, EGLDisplay eGLDisplay, EGLContext eGLContext) {
            if (!egl10.eglDestroyContext(eGLDisplay, eGLContext)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("display:");
                stringBuilder.append(eGLDisplay);
                stringBuilder.append(" context: ");
                stringBuilder.append(eGLContext);
                Log.e(str, stringBuilder.toString());
                EglHelper.throwEglException("eglDestroyContex", egl10.eglGetError());
            }
        }
    }

    public interface EGLWindowSurfaceFactory {
        EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj);

        void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface);
    }

    private static class DefaultWindowSurfaceFactory implements EGLWindowSurfaceFactory {
        private DefaultWindowSurfaceFactory() {
        }

        public EGLSurface createWindowSurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLConfig eGLConfig, Object obj) {
            try {
                return egl10.eglCreateWindowSurface(eGLDisplay, eGLConfig, obj, null);
            } catch (Throwable e) {
                Log.e(GLTextureView.TAG, "eglCreateWindowSurface", e);
                return null;
            }
        }

        public void destroySurface(EGL10 egl10, EGLDisplay eGLDisplay, EGLSurface eGLSurface) {
            egl10.eglDestroySurface(eGLDisplay, eGLSurface);
        }
    }

    private static class EglHelper {
        private static final String TAG = "EglHelper";
        EGL10 mEgl;
        EGLConfig mEglConfig;
        EGLContext mEglContext;
        EGLDisplay mEglDisplay;
        EGLSurface mEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;

        public EglHelper(WeakReference<GLTextureView> weakReference) {
            this.mGLTextureViewWeakRef = weakReference;
        }

        public void start() {
            this.mEgl = (EGL10) EGLContext.getEGL();
            this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            if (this.mEglDisplay != EGL10.EGL_NO_DISPLAY) {
                if (this.mEgl.eglInitialize(this.mEglDisplay, new int[2])) {
                    GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                    if (gLTextureView == null) {
                        this.mEglConfig = null;
                        this.mEglContext = null;
                    } else {
                        EGLContext eGLContext;
                        this.mEglConfig = gLTextureView.mEGLConfigChooser.chooseConfig(this.mEgl, this.mEglDisplay);
                        if (gLTextureView.mShareContextGetter == null) {
                            eGLContext = null;
                        } else {
                            eGLContext = gLTextureView.mShareContextGetter.getShareContext();
                        }
                        this.mEglContext = gLTextureView.mEGLContextFactory.createContext(this.mEgl, this.mEglDisplay, this.mEglConfig, eGLContext);
                    }
                    if (this.mEglContext == null || this.mEglContext == EGL10.EGL_NO_CONTEXT) {
                        this.mEglContext = null;
                        throwEglException("createContext");
                    }
                    this.mEglSurface = null;
                    return;
                }
                throw new RuntimeException("eglInitialize failed");
            }
            throw new RuntimeException("eglGetDisplay failed");
        }

        public boolean createSurface() {
            if (this.mEgl == null) {
                throw new RuntimeException("egl not initialized");
            } else if (this.mEglDisplay == null) {
                throw new RuntimeException("eglDisplay not initialized");
            } else if (this.mEglConfig != null) {
                destroySurfaceImp();
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    this.mEglSurface = gLTextureView.mEGLWindowSurfaceFactory.createWindowSurface(this.mEgl, this.mEglDisplay, this.mEglConfig, gLTextureView.getSurfaceTexture());
                } else {
                    this.mEglSurface = null;
                }
                if (this.mEglSurface == null || this.mEglSurface == EGL10.EGL_NO_SURFACE) {
                    if (this.mEgl.eglGetError() == 12299) {
                        Log.e(TAG, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW.");
                    }
                    return false;
                } else if (this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext)) {
                    return true;
                } else {
                    logEglErrorAsWarning(TAG, "eglMakeCurrent", this.mEgl.eglGetError());
                    return false;
                }
            } else {
                throw new RuntimeException("mEglConfig not initialized");
            }
        }

        GL createGL() {
            GL gl = this.mEglContext.getGL();
            GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
            if (gLTextureView == null) {
                return gl;
            }
            if (gLTextureView.mGLWrapper != null) {
                gl = gLTextureView.mGLWrapper.wrap(gl);
            }
            if ((gLTextureView.mDebugFlags & 3) == 0) {
                return gl;
            }
            int i = 0;
            Writer writer = null;
            if ((gLTextureView.mDebugFlags & 1) != 0) {
                i = 1;
            }
            if ((gLTextureView.mDebugFlags & 2) != 0) {
                writer = new LogWriter();
            }
            return GLDebugHelper.wrap(gl, i, writer);
        }

        public int swap() {
            if (this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface)) {
                return 12288;
            }
            return this.mEgl.eglGetError();
        }

        public void destroySurface() {
            destroySurfaceImp();
        }

        private void destroySurfaceImp() {
            if (this.mEglSurface != null && this.mEglSurface != EGL10.EGL_NO_SURFACE) {
                this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    gLTextureView.mEGLWindowSurfaceFactory.destroySurface(this.mEgl, this.mEglDisplay, this.mEglSurface);
                }
                this.mEglSurface = null;
            }
        }

        public void finish() {
            if (this.mEglContext != null) {
                GLTextureView gLTextureView = (GLTextureView) this.mGLTextureViewWeakRef.get();
                if (gLTextureView != null) {
                    gLTextureView.mEGLContextFactory.destroyContext(this.mEgl, this.mEglDisplay, this.mEglContext);
                }
                this.mEglContext = null;
            }
            if (this.mEglDisplay != null) {
                this.mEgl.eglTerminate(this.mEglDisplay);
                this.mEglDisplay = null;
            }
        }

        private void throwEglException(String str) {
            throwEglException(str, this.mEgl.eglGetError());
        }

        public static void throwEglException(String str, int i) {
            throw new RuntimeException(formatEglError(str, i));
        }

        public static void logEglErrorAsWarning(String str, String str2, int i) {
            Log.w(str, formatEglError(str2, i));
        }

        public static String formatEglError(String str, int i) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(" failed");
            return stringBuilder.toString();
        }
    }

    static class GLThread extends Thread {
        private static final String TAG = "GLThread";
        private EglHelper mEglHelper;
        private ArrayList<Runnable> mEventQueue;
        private boolean mExited;
        private boolean mFinishedCreatingEglSurface;
        private WeakReference<GLTextureView> mGLTextureViewWeakRef;
        private boolean mHasSurface;
        private boolean mHaveEglContext;
        private boolean mHaveEglSurface;
        private int mHeight;
        private boolean mPaused;
        private boolean mRenderComplete;
        private int mRenderMode;
        private boolean mRequestPaused;
        private boolean mRequestRender;
        private boolean mShouldExit;
        private boolean mShouldReleaseEglContext;
        private boolean mSizeChanged;
        private boolean mSurfaceIsBad;
        private boolean mWaitingForSurface;
        private int mWidth;

        GLThread(WeakReference<GLTextureView> weakReference) {
            this.mEventQueue = new ArrayList();
            this.mSizeChanged = true;
            this.mWidth = 0;
            this.mHeight = 0;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mGLTextureViewWeakRef = weakReference;
        }

        GLThread(WeakReference<GLTextureView> weakReference, int i, int i2) {
            this.mEventQueue = new ArrayList();
            this.mSizeChanged = true;
            this.mWidth = i;
            this.mHeight = i2;
            this.mRequestRender = true;
            this.mRenderMode = 1;
            this.mGLTextureViewWeakRef = weakReference;
        }

        public void run() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("GLThread ");
            stringBuilder.append(getId());
            setName(stringBuilder.toString());
            try {
                guardedRun();
            } catch (InterruptedException e) {
            } catch (Throwable th) {
                GLTextureView.sGLThreadManager.threadExiting(this);
            }
            GLTextureView.sGLThreadManager.threadExiting(this);
        }

        private void stopEglSurfaceLocked() {
            if (this.mHaveEglSurface) {
                this.mHaveEglSurface = false;
                this.mEglHelper.destroySurface();
            }
        }

        private void stopEglContextLocked() {
            if (this.mHaveEglContext) {
                this.mEglHelper.finish();
                this.mHaveEglContext = false;
                GLTextureView.sGLThreadManager.releaseEglContextLocked(this);
            }
        }

        /* JADX WARNING: Missing block: B:95:0x0170, code:
            if (r10 == null) goto L_0x017a;
     */
        /* JADX WARNING: Missing block: B:98:0x017a, code:
            if (r12 == false) goto L_0x01b3;
     */
        /* JADX WARNING: Missing block: B:100:0x0182, code:
            if (r1.mEglHelper.createSurface() == false) goto L_0x019a;
     */
        /* JADX WARNING: Missing block: B:101:0x0184, code:
            r12 = com.android.camera.ui.GLTextureView.access$900();
     */
        /* JADX WARNING: Missing block: B:102:0x0188, code:
            monitor-enter(r12);
     */
        /* JADX WARNING: Missing block: B:105:?, code:
            r1.mFinishedCreatingEglSurface = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
     */
        /* JADX WARNING: Missing block: B:106:0x0193, code:
            monitor-exit(r12);
     */
        /* JADX WARNING: Missing block: B:107:0x0194, code:
            r12 = r2;
     */
        /* JADX WARNING: Missing block: B:112:0x019a, code:
            r15 = com.android.camera.ui.GLTextureView.access$900();
     */
        /* JADX WARNING: Missing block: B:113:0x019e, code:
            monitor-enter(r15);
     */
        /* JADX WARNING: Missing block: B:116:?, code:
            r1.mFinishedCreatingEglSurface = true;
            r1.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
     */
        /* JADX WARNING: Missing block: B:117:0x01ab, code:
            monitor-exit(r15);
     */
        /* JADX WARNING: Missing block: B:118:0x01ac, code:
            r0 = r2;
     */
        /* JADX WARNING: Missing block: B:123:0x01b3, code:
            if (r13 == false) goto L_0x01c7;
     */
        /* JADX WARNING: Missing block: B:124:0x01b5, code:
            r0 = (javax.microedition.khronos.opengles.GL10) r1.mEglHelper.createGL();
            com.android.camera.ui.GLTextureView.access$900().checkGLDriver(r0);
            r7 = r0;
            r13 = r2;
     */
        /* JADX WARNING: Missing block: B:125:0x01c7, code:
            if (r11 == false) goto L_0x01e0;
     */
        /* JADX WARNING: Missing block: B:126:0x01c9, code:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:127:0x01d1, code:
            if (r0 == null) goto L_0x01de;
     */
        /* JADX WARNING: Missing block: B:128:0x01d3, code:
            com.android.camera.ui.GLTextureView.access$1100(r0).onSurfaceCreated(r7, r1.mEglHelper.mEglConfig);
     */
        /* JADX WARNING: Missing block: B:129:0x01de, code:
            r11 = r2;
     */
        /* JADX WARNING: Missing block: B:130:0x01e0, code:
            if (r14 == false) goto L_0x01f5;
     */
        /* JADX WARNING: Missing block: B:131:0x01e2, code:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:132:0x01ea, code:
            if (r0 == null) goto L_0x01f3;
     */
        /* JADX WARNING: Missing block: B:133:0x01ec, code:
            com.android.camera.ui.GLTextureView.access$1100(r0).onSurfaceChanged(r7, r8, r9);
     */
        /* JADX WARNING: Missing block: B:134:0x01f3, code:
            r14 = r2;
     */
        /* JADX WARNING: Missing block: B:135:0x01f5, code:
            r0 = (com.android.camera.ui.GLTextureView) r1.mGLTextureViewWeakRef.get();
     */
        /* JADX WARNING: Missing block: B:136:0x01fd, code:
            if (r0 == null) goto L_0x0206;
     */
        /* JADX WARNING: Missing block: B:137:0x01ff, code:
            com.android.camera.ui.GLTextureView.access$1100(r0).onDrawFrame(r7);
     */
        /* JADX WARNING: Missing block: B:138:0x0206, code:
            r0 = r1.mEglHelper.swap();
     */
        /* JADX WARNING: Missing block: B:139:0x020e, code:
            if (r0 == 12288) goto L_0x0233;
     */
        /* JADX WARNING: Missing block: B:141:0x0212, code:
            if (r0 == 12302) goto L_0x022f;
     */
        /* JADX WARNING: Missing block: B:142:0x0214, code:
            com.android.camera.ui.GLTextureView.EglHelper.logEglErrorAsWarning(TAG, "eglSwapBuffers", r0);
            r2 = com.android.camera.ui.GLTextureView.access$900();
     */
        /* JADX WARNING: Missing block: B:143:0x021f, code:
            monitor-enter(r2);
     */
        /* JADX WARNING: Missing block: B:144:0x0220, code:
            r0 = true;
     */
        /* JADX WARNING: Missing block: B:146:?, code:
            r1.mSurfaceIsBad = true;
            com.android.camera.ui.GLTextureView.access$900().notifyAll();
     */
        /* JADX WARNING: Missing block: B:147:0x022a, code:
            monitor-exit(r2);
     */
        /* JADX WARNING: Missing block: B:152:0x022f, code:
            r0 = true;
            r5 = true;
     */
        /* JADX WARNING: Missing block: B:153:0x0233, code:
            r0 = true;
     */
        /* JADX WARNING: Missing block: B:154:0x0234, code:
            if (r6 == false) goto L_0x0238;
     */
        /* JADX WARNING: Missing block: B:155:0x0236, code:
            r3 = r0;
     */
        private void guardedRun() throws java.lang.InterruptedException {
            /*
            r17 = this;
            r1 = r17;
            r0 = new com.android.camera.ui.GLTextureView$EglHelper;
            r2 = r1.mGLTextureViewWeakRef;
            r0.<init>(r2);
            r1.mEglHelper = r0;
            r0 = 0;
            r1.mHaveEglContext = r0;
            r1.mHaveEglSurface = r0;
            r3 = r0;
            r4 = r3;
            r5 = r4;
            r6 = r5;
            r8 = r6;
            r9 = r8;
            r11 = r9;
            r12 = r11;
            r13 = r12;
            r14 = r13;
            r7 = 0;
        L_0x0027:
            r10 = 0;
        L_0x0028:
            r15 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x024c }
            monitor-enter(r15);	 Catch:{ RuntimeException -> 0x024c }
        L_0x002d:
            r2 = r1.mShouldExit;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x0042;
        L_0x0031:
            monitor-exit(r15);	 Catch:{ all -> 0x0247 }
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r2);
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x003f }
            r17.stopEglContextLocked();	 Catch:{ all -> 0x003f }
            monitor-exit(r2);	 Catch:{ all -> 0x003f }
            return;
        L_0x003f:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x003f }
            throw r0;
        L_0x0042:
            r2 = r1.mEventQueue;	 Catch:{ all -> 0x0247 }
            r2 = r2.isEmpty();	 Catch:{ all -> 0x0247 }
            if (r2 != 0) goto L_0x0058;
        L_0x004a:
            r2 = r1.mEventQueue;	 Catch:{ all -> 0x0247 }
            r10 = 0;
            r2 = r2.remove(r10);	 Catch:{ all -> 0x0247 }
            r2 = (java.lang.Runnable) r2;	 Catch:{ all -> 0x0247 }
            r10 = r2;
            r2 = 0;
            goto L_0x016f;
            r2 = r1.mPaused;	 Catch:{ all -> 0x0247 }
            r0 = r1.mRequestPaused;	 Catch:{ all -> 0x0247 }
            if (r2 == r0) goto L_0x006d;
        L_0x005f:
            r0 = r1.mRequestPaused;	 Catch:{ all -> 0x0247 }
            r2 = r1.mRequestPaused;	 Catch:{ all -> 0x0247 }
            r1.mPaused = r2;	 Catch:{ all -> 0x0247 }
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r2.notifyAll();	 Catch:{ all -> 0x0247 }
            goto L_0x006e;
        L_0x006d:
            r0 = 0;
        L_0x006e:
            r2 = r1.mShouldReleaseEglContext;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x007d;
        L_0x0072:
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0247 }
            r17.stopEglContextLocked();	 Catch:{ all -> 0x0247 }
            r2 = 0;
            r1.mShouldReleaseEglContext = r2;	 Catch:{ all -> 0x0247 }
            r4 = 1;
        L_0x007d:
            if (r5 == 0) goto L_0x0087;
        L_0x007f:
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0247 }
            r17.stopEglContextLocked();	 Catch:{ all -> 0x0247 }
            r5 = 0;
        L_0x0087:
            if (r0 == 0) goto L_0x0090;
        L_0x0089:
            r2 = r1.mHaveEglSurface;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x0090;
        L_0x008d:
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0247 }
        L_0x0090:
            if (r0 == 0) goto L_0x00b6;
        L_0x0092:
            r2 = r1.mHaveEglContext;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x00b6;
        L_0x0096:
            r2 = r1.mGLTextureViewWeakRef;	 Catch:{ all -> 0x0247 }
            r2 = r2.get();	 Catch:{ all -> 0x0247 }
            r2 = (com.android.camera.ui.GLTextureView) r2;	 Catch:{ all -> 0x0247 }
            if (r2 != 0) goto L_0x00a3;
            r2 = 0;
            goto L_0x00a7;
        L_0x00a3:
            r2 = r2.mPreserveEGLContextOnPause;	 Catch:{ all -> 0x0247 }
        L_0x00a7:
            if (r2 == 0) goto L_0x00b3;
        L_0x00a9:
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r2 = r2.shouldReleaseEGLContextWhenPausing();	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x00b6;
        L_0x00b3:
            r17.stopEglContextLocked();	 Catch:{ all -> 0x0247 }
        L_0x00b6:
            if (r0 == 0) goto L_0x00c7;
        L_0x00b8:
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0 = r0.shouldTerminateEGLWhenPausing();	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x00c7;
        L_0x00c2:
            r0 = r1.mEglHelper;	 Catch:{ all -> 0x0247 }
            r0.finish();	 Catch:{ all -> 0x0247 }
        L_0x00c7:
            r0 = r1.mHasSurface;	 Catch:{ all -> 0x0247 }
            if (r0 != 0) goto L_0x00e3;
        L_0x00cb:
            r0 = r1.mWaitingForSurface;	 Catch:{ all -> 0x0247 }
            if (r0 != 0) goto L_0x00e3;
        L_0x00cf:
            r0 = r1.mHaveEglSurface;	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x00d6;
        L_0x00d3:
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0247 }
        L_0x00d6:
            r0 = 1;
            r1.mWaitingForSurface = r0;	 Catch:{ all -> 0x0247 }
            r0 = 0;
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x0247 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0.notifyAll();	 Catch:{ all -> 0x0247 }
        L_0x00e3:
            r0 = r1.mHasSurface;	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x00f5;
        L_0x00e7:
            r0 = r1.mWaitingForSurface;	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x00f5;
        L_0x00eb:
            r0 = 0;
            r1.mWaitingForSurface = r0;	 Catch:{ all -> 0x0247 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0.notifyAll();	 Catch:{ all -> 0x0247 }
        L_0x00f5:
            if (r3 == 0) goto L_0x0105;
            r0 = 1;
            r1.mRenderComplete = r0;	 Catch:{ all -> 0x0247 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0.notifyAll();	 Catch:{ all -> 0x0247 }
            r3 = 0;
            r6 = 0;
        L_0x0105:
            r0 = r17.readyToDraw();	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x023c;
        L_0x010b:
            r0 = r1.mHaveEglContext;	 Catch:{ all -> 0x0247 }
            if (r0 != 0) goto L_0x013a;
        L_0x010f:
            if (r4 == 0) goto L_0x0114;
            r4 = 0;
            goto L_0x013a;
        L_0x0114:
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0 = r0.tryAcquireEglContextLocked(r1);	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x013a;
        L_0x011e:
            r0 = r1.mEglHelper;	 Catch:{ RuntimeException -> 0x0131 }
            r0.start();	 Catch:{ RuntimeException -> 0x0131 }
            r0 = 1;
            r1.mHaveEglContext = r0;	 Catch:{ all -> 0x0247 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0.notifyAll();	 Catch:{ all -> 0x0247 }
            r11 = 1;
            goto L_0x013a;
        L_0x0131:
            r0 = move-exception;
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r2.releaseEglContextLocked(r1);	 Catch:{ all -> 0x0247 }
            throw r0;	 Catch:{ all -> 0x0247 }
        L_0x013a:
            r0 = r1.mHaveEglContext;	 Catch:{ all -> 0x0247 }
            if (r0 == 0) goto L_0x014c;
        L_0x013e:
            r0 = r1.mHaveEglSurface;	 Catch:{ all -> 0x0247 }
            if (r0 != 0) goto L_0x014c;
        L_0x0142:
            r0 = 1;
            r1.mHaveEglSurface = r0;	 Catch:{ all -> 0x0247 }
            r0 = 1;
            r13 = 1;
            r14 = 1;
            goto L_0x014d;
        L_0x014c:
            r0 = r12;
        L_0x014d:
            r2 = r1.mHaveEglSurface;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x023b;
        L_0x0151:
            r2 = r1.mSizeChanged;	 Catch:{ all -> 0x0247 }
            if (r2 == 0) goto L_0x0163;
            r8 = r1.mWidth;	 Catch:{ all -> 0x0247 }
            r9 = r1.mHeight;	 Catch:{ all -> 0x0247 }
            r2 = 0;
            r1.mSizeChanged = r2;	 Catch:{ all -> 0x0247 }
            r0 = 1;
            r6 = 1;
            r14 = 1;
            goto L_0x0164;
        L_0x0163:
            r2 = 0;
        L_0x0164:
            r1.mRequestRender = r2;	 Catch:{ all -> 0x0247 }
            r12 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r12.notifyAll();	 Catch:{ all -> 0x0247 }
            r12 = r0;
        L_0x016f:
            monitor-exit(r15);	 Catch:{ all -> 0x0247 }
            if (r10 == 0) goto L_0x017a;
        L_0x0172:
            r10.run();	 Catch:{ RuntimeException -> 0x024c }
            r0 = r2;
            goto L_0x0027;
        L_0x017a:
            if (r12 == 0) goto L_0x01b3;
        L_0x017c:
            r0 = r1.mEglHelper;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.createSurface();	 Catch:{ RuntimeException -> 0x024c }
            if (r0 == 0) goto L_0x019a;
        L_0x0184:
            r12 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x024c }
            monitor-enter(r12);	 Catch:{ RuntimeException -> 0x024c }
            r0 = 1;
            r1.mFinishedCreatingEglSurface = r0;	 Catch:{ all -> 0x0197 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0197 }
            r0.notifyAll();	 Catch:{ all -> 0x0197 }
            monitor-exit(r12);	 Catch:{ all -> 0x0197 }
            r12 = r2;
            goto L_0x01b3;
        L_0x0197:
            r0 = move-exception;
            monitor-exit(r12);	 Catch:{ all -> 0x0197 }
            throw r0;	 Catch:{ RuntimeException -> 0x024c }
        L_0x019a:
            r15 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x024c }
            monitor-enter(r15);	 Catch:{ RuntimeException -> 0x024c }
            r0 = 1;
            r1.mFinishedCreatingEglSurface = r0;	 Catch:{ all -> 0x01b0 }
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x01b0 }
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x01b0 }
            r0.notifyAll();	 Catch:{ all -> 0x01b0 }
            monitor-exit(r15);	 Catch:{ all -> 0x01b0 }
            r0 = r2;
            goto L_0x0028;
        L_0x01b0:
            r0 = move-exception;
            monitor-exit(r15);	 Catch:{ all -> 0x01b0 }
            throw r0;	 Catch:{ RuntimeException -> 0x024c }
        L_0x01b3:
            if (r13 == 0) goto L_0x01c7;
        L_0x01b5:
            r0 = r1.mEglHelper;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.createGL();	 Catch:{ RuntimeException -> 0x024c }
            r0 = (javax.microedition.khronos.opengles.GL10) r0;	 Catch:{ RuntimeException -> 0x024c }
            r7 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x024c }
            r7.checkGLDriver(r0);	 Catch:{ RuntimeException -> 0x024c }
            r7 = r0;
            r13 = r2;
        L_0x01c7:
            if (r11 == 0) goto L_0x01e0;
        L_0x01c9:
            r0 = r1.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.get();	 Catch:{ RuntimeException -> 0x024c }
            r0 = (com.android.camera.ui.GLTextureView) r0;	 Catch:{ RuntimeException -> 0x024c }
            if (r0 == 0) goto L_0x01de;
        L_0x01d3:
            r0 = r0.mRenderer;	 Catch:{ RuntimeException -> 0x024c }
            r11 = r1.mEglHelper;	 Catch:{ RuntimeException -> 0x024c }
            r11 = r11.mEglConfig;	 Catch:{ RuntimeException -> 0x024c }
            r0.onSurfaceCreated(r7, r11);	 Catch:{ RuntimeException -> 0x024c }
            r11 = r2;
        L_0x01e0:
            if (r14 == 0) goto L_0x01f5;
        L_0x01e2:
            r0 = r1.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.get();	 Catch:{ RuntimeException -> 0x024c }
            r0 = (com.android.camera.ui.GLTextureView) r0;	 Catch:{ RuntimeException -> 0x024c }
            if (r0 == 0) goto L_0x01f3;
        L_0x01ec:
            r0 = r0.mRenderer;	 Catch:{ RuntimeException -> 0x024c }
            r0.onSurfaceChanged(r7, r8, r9);	 Catch:{ RuntimeException -> 0x024c }
            r14 = r2;
        L_0x01f5:
            r0 = r1.mGLTextureViewWeakRef;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.get();	 Catch:{ RuntimeException -> 0x024c }
            r0 = (com.android.camera.ui.GLTextureView) r0;	 Catch:{ RuntimeException -> 0x024c }
            if (r0 == 0) goto L_0x0206;
        L_0x01ff:
            r0 = r0.mRenderer;	 Catch:{ RuntimeException -> 0x024c }
            r0.onDrawFrame(r7);	 Catch:{ RuntimeException -> 0x024c }
        L_0x0206:
            r0 = r1.mEglHelper;	 Catch:{ RuntimeException -> 0x024c }
            r0 = r0.swap();	 Catch:{ RuntimeException -> 0x024c }
            r15 = 12288; // 0x3000 float:1.7219E-41 double:6.071E-320;
            if (r0 == r15) goto L_0x0233;
        L_0x0210:
            r15 = 12302; // 0x300e float:1.7239E-41 double:6.078E-320;
            if (r0 == r15) goto L_0x022f;
        L_0x0214:
            r15 = "GLThread";
            r2 = "eglSwapBuffers";
            com.android.camera.ui.GLTextureView.EglHelper.logEglErrorAsWarning(r15, r2, r0);	 Catch:{ RuntimeException -> 0x024c }
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ RuntimeException -> 0x024c }
            monitor-enter(r2);	 Catch:{ RuntimeException -> 0x024c }
            r0 = 1;
            r1.mSurfaceIsBad = r0;	 Catch:{ all -> 0x022c }
            r15 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x022c }
            r15.notifyAll();	 Catch:{ all -> 0x022c }
            monitor-exit(r2);	 Catch:{ all -> 0x022c }
            goto L_0x0234;
        L_0x022c:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x022c }
            throw r0;	 Catch:{ RuntimeException -> 0x024c }
        L_0x022f:
            r0 = 1;
            r5 = r0;
            goto L_0x0234;
        L_0x0233:
            r0 = 1;
        L_0x0234:
            if (r6 == 0) goto L_0x0238;
            r3 = r0;
        L_0x0238:
            r0 = 0;
            goto L_0x0028;
        L_0x023b:
            r12 = r0;
        L_0x023c:
            r0 = com.android.camera.ui.GLTextureView.sGLThreadManager;	 Catch:{ all -> 0x0247 }
            r0.wait();	 Catch:{ all -> 0x0247 }
            r0 = 0;
            goto L_0x002d;
        L_0x0247:
            r0 = move-exception;
            monitor-exit(r15);	 Catch:{ all -> 0x0247 }
            throw r0;	 Catch:{ RuntimeException -> 0x024c }
        L_0x024a:
            r0 = move-exception;
            goto L_0x0265;
        L_0x024c:
            r0 = move-exception;
            r2 = "GLThread";
            r3 = "got exception";
            com.android.camera.log.Log.d(r2, r3, r0);	 Catch:{ all -> 0x024a }
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r2);
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0262 }
            r17.stopEglContextLocked();	 Catch:{ all -> 0x0262 }
            monitor-exit(r2);	 Catch:{ all -> 0x0262 }
            return;
        L_0x0262:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x0262 }
            throw r0;
        L_0x0265:
            r2 = com.android.camera.ui.GLTextureView.sGLThreadManager;
            monitor-enter(r2);
            r17.stopEglSurfaceLocked();	 Catch:{ all -> 0x0272 }
            r17.stopEglContextLocked();	 Catch:{ all -> 0x0272 }
            monitor-exit(r2);	 Catch:{ all -> 0x0272 }
            throw r0;
        L_0x0272:
            r0 = move-exception;
            monitor-exit(r2);	 Catch:{ all -> 0x0272 }
            throw r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.ui.GLTextureView.GLThread.guardedRun():void");
        }

        public boolean ableToDraw() {
            return this.mHaveEglContext && this.mHaveEglSurface && readyToDraw();
        }

        private boolean readyToDraw() {
            return !this.mPaused && this.mHasSurface && !this.mSurfaceIsBad && this.mWidth > 0 && this.mHeight > 0 && (this.mRequestRender || this.mRenderMode == 1);
        }

        public void setRenderMode(int i) {
            if (i < 0 || i > 1) {
                throw new IllegalArgumentException("renderMode");
            }
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRenderMode = i;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public int getRenderMode() {
            int i;
            synchronized (GLTextureView.sGLThreadManager) {
                i = this.mRenderMode;
            }
            return i;
        }

        public void requestRender() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestRender = true;
                GLTextureView.sGLThreadManager.notifyAll();
            }
        }

        public void surfaceCreated() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = true;
                this.mFinishedCreatingEglSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (this.mWaitingForSurface && !this.mFinishedCreatingEglSurface && !this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void surfaceDestroyed() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mHasSurface = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mWaitingForSurface && !this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onPause() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onResume() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mRequestPaused = false;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && this.mPaused && !this.mRenderComplete) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void onWindowResize(int i, int i2) {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mWidth = i;
                this.mHeight = i2;
                this.mSizeChanged = true;
                this.mRequestRender = true;
                this.mRenderComplete = false;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited && !this.mPaused && !this.mRenderComplete && ableToDraw()) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestExitAndWait() {
            synchronized (GLTextureView.sGLThreadManager) {
                this.mShouldExit = true;
                GLTextureView.sGLThreadManager.notifyAll();
                while (!this.mExited) {
                    try {
                        GLTextureView.sGLThreadManager.wait();
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }

        public void requestReleaseEglContextLocked() {
            this.mShouldReleaseEglContext = true;
            GLTextureView.sGLThreadManager.notifyAll();
        }

        public void queueEvent(Runnable runnable) {
            if (runnable != null) {
                synchronized (GLTextureView.sGLThreadManager) {
                    this.mEventQueue.add(runnable);
                    GLTextureView.sGLThreadManager.notifyAll();
                }
                return;
            }
            throw new IllegalArgumentException("r must not be null");
        }
    }

    private static class GLThreadManager {
        private static String TAG = "GLThreadManager";
        private static final int kGLES_20 = 131072;
        private static final String kMSM7K_RENDERER_PREFIX = "Q3Dimension MSM7500 ";
        private GLThread mEglOwner;
        private boolean mGLESDriverCheckComplete;
        private int mGLESVersion;
        private boolean mGLESVersionCheckComplete;
        private boolean mLimitedGLESContexts;
        private boolean mMultipleGLESContextsAllowed;

        private GLThreadManager() {
        }

        public synchronized void threadExiting(GLThread gLThread) {
            gLThread.mExited = true;
            if (this.mEglOwner == gLThread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public boolean tryAcquireEglContextLocked(GLThread gLThread) {
            if (this.mEglOwner == gLThread || this.mEglOwner == null) {
                this.mEglOwner = gLThread;
                notifyAll();
                return true;
            }
            checkGLESVersion();
            if (this.mMultipleGLESContextsAllowed) {
                return true;
            }
            if (this.mEglOwner != null) {
                this.mEglOwner.requestReleaseEglContextLocked();
            }
            return false;
        }

        public void releaseEglContextLocked(GLThread gLThread) {
            if (this.mEglOwner == gLThread) {
                this.mEglOwner = null;
            }
            notifyAll();
        }

        public synchronized boolean shouldReleaseEGLContextWhenPausing() {
            return this.mLimitedGLESContexts;
        }

        public synchronized boolean shouldTerminateEGLWhenPausing() {
            checkGLESVersion();
            return this.mMultipleGLESContextsAllowed ^ 1;
        }

        public synchronized void checkGLDriver(GL10 gl10) {
            if (!this.mGLESDriverCheckComplete) {
                checkGLESVersion();
                String glGetString = gl10.glGetString(7937);
                if (this.mGLESVersion < 131072) {
                    this.mMultipleGLESContextsAllowed = glGetString.startsWith(kMSM7K_RENDERER_PREFIX) ^ true;
                    notifyAll();
                }
                this.mLimitedGLESContexts = this.mMultipleGLESContextsAllowed ^ true;
                this.mGLESDriverCheckComplete = true;
            }
        }

        private void checkGLESVersion() {
            if (!this.mGLESVersionCheckComplete) {
                this.mMultipleGLESContextsAllowed = true;
                this.mGLESVersionCheckComplete = true;
            }
        }
    }

    public interface GLWrapper {
        GL wrap(GL gl);
    }

    static class LogWriter extends Writer {
        private StringBuilder mBuilder = new StringBuilder();

        LogWriter() {
        }

        public void close() {
            flushBuilder();
        }

        public void flush() {
            flushBuilder();
        }

        public void write(char[] cArr, int i, int i2) {
            for (int i3 = 0; i3 < i2; i3++) {
                char c = cArr[i + i3];
                if (c == 10) {
                    flushBuilder();
                } else {
                    this.mBuilder.append(c);
                }
            }
        }

        private void flushBuilder() {
            if (this.mBuilder.length() > 0) {
                Log.v(Log.CONTINUAL, this.mBuilder.toString());
                this.mBuilder.delete(0, this.mBuilder.length());
            }
        }
    }

    private class SimpleEGLConfigChooser extends ComponentSizeChooser {
        public SimpleEGLConfigChooser(boolean z) {
            super(8, 8, 8, 0, z ? 16 : 0, 0);
        }
    }

    public GLTextureView(Context context) {
        super(context);
        init();
    }

    public GLTextureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    protected void finalize() throws Throwable {
        try {
            if (this.mGLThread != null) {
                this.mGLThread.requestExitAndWait();
            }
            super.finalize();
        } catch (Throwable th) {
            super.finalize();
        }
    }

    private void init() {
        setSurfaceTextureListener(this);
    }

    public void setGLWrapper(GLWrapper gLWrapper) {
        this.mGLWrapper = gLWrapper;
    }

    public void setDebugFlags(int i) {
        this.mDebugFlags = i;
    }

    public int getDebugFlags() {
        return this.mDebugFlags;
    }

    public void setPreserveEGLContextOnPause(boolean z) {
        this.mPreserveEGLContextOnPause = z;
    }

    public boolean getPreserveEGLContextOnPause() {
        return this.mPreserveEGLContextOnPause;
    }

    public void setRenderer(Renderer renderer) {
        checkRenderThreadState();
        if (this.mEGLConfigChooser == null) {
            this.mEGLConfigChooser = new SimpleEGLConfigChooser(true);
        }
        if (this.mEGLContextFactory == null) {
            this.mEGLContextFactory = new DefaultContextFactory();
        }
        if (this.mEGLWindowSurfaceFactory == null) {
            this.mEGLWindowSurfaceFactory = new DefaultWindowSurfaceFactory();
        }
        this.mRenderer = renderer;
        this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
        this.mGLThread.start();
    }

    public Renderer getRenderer() {
        return this.mRenderer;
    }

    public void setEGLShareContextGetter(EGLShareContextGetter eGLShareContextGetter) {
        this.mShareContextGetter = eGLShareContextGetter;
    }

    public void setEGLContextFactory(EGLContextFactory eGLContextFactory) {
        checkRenderThreadState();
        this.mEGLContextFactory = eGLContextFactory;
    }

    public void setEGLWindowSurfaceFactory(EGLWindowSurfaceFactory eGLWindowSurfaceFactory) {
        checkRenderThreadState();
        this.mEGLWindowSurfaceFactory = eGLWindowSurfaceFactory;
    }

    public void setEGLConfigChooser(EGLConfigChooser eGLConfigChooser) {
        checkRenderThreadState();
        this.mEGLConfigChooser = eGLConfigChooser;
    }

    public void setEGLConfigChooser(boolean z) {
        setEGLConfigChooser(new SimpleEGLConfigChooser(z));
    }

    public void setEGLConfigChooser(int i, int i2, int i3, int i4, int i5, int i6) {
        setEGLConfigChooser(new ComponentSizeChooser(i, i2, i3, i4, i5, i6));
    }

    public void setEGLContextClientVersion(int i) {
        checkRenderThreadState();
        this.mEGLContextClientVersion = i;
    }

    public void setRenderMode(int i) {
        this.mGLThread.setRenderMode(i);
    }

    public int getRenderMode() {
        return this.mGLThread.getRenderMode();
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
        this.mGLThread.surfaceCreated();
    }

    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
        this.mPreservedWidth = i;
        this.mPreservedHeight = i2;
        this.mGLThread.onWindowResize(i, i2);
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        this.mPreservedWidth = i;
        this.mPreservedHeight = i2;
        this.mGLThread.onWindowResize(i, i2);
    }

    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        this.mGLThread.surfaceDestroyed();
        return true;
    }

    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    public void on(SurfaceHolder surfaceHolder) {
        this.mGLThread.surfaceCreated();
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    public void queueEvent(Runnable runnable) {
        this.mGLThread.queueEvent(runnable);
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.mDetached && this.mRenderer != null) {
            int renderMode;
            if (this.mGLThread != null) {
                renderMode = this.mGLThread.getRenderMode();
            } else {
                renderMode = 1;
            }
            this.mGLThread = new GLThread(this.mThisWeakRef, this.mPreservedWidth, this.mPreservedHeight);
            if (renderMode != 1) {
                this.mGLThread.setRenderMode(renderMode);
            }
            this.mGLThread.start();
        }
        this.mDetached = false;
    }

    protected void onDetachedFromWindow() {
        if (this.mGLThread != null) {
            this.mGLThread.requestExitAndWait();
        }
        this.mDetached = true;
        super.onDetachedFromWindow();
    }

    private void checkRenderThreadState() {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
    }
}
