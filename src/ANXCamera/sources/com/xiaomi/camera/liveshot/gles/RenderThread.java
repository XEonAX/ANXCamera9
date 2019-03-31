package com.xiaomi.camera.liveshot.gles;

import android.opengl.EGLContext;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Surface;
import com.android.camera.effect.VideoRecorderCanvas;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import java.lang.ref.WeakReference;

public final class RenderThread extends Thread {
    public static final int MSG_DRAW_REQUESTED = 16;
    public static final int MSG_FILTER_CHANGED = 32;
    public static final int MSG_QUIT_REQUESTED = 48;
    private static final String TAG = RenderThread.class.getSimpleName();
    private VideoRecorderCanvas mCanvas;
    private DrawExtTexAttribute mDrawExtTexAttribute = new DrawExtTexAttribute();
    private volatile boolean mEglContextPrepared = false;
    private EglCore mEglCore;
    private EglSurfaceBase mEglSurfaceBase;
    private RenderHandler mHandler;
    private boolean mIsRecordable;
    private final Object mLock = new Object();
    private final int mPreviewHeight;
    private final int mPreviewWidth;
    private volatile boolean mReady = false;
    private volatile int mRequestDraw;
    private volatile boolean mRequestRelease = false;
    private final EGLContext mShardContext;
    private Surface mSurface;

    public static class RenderHandler extends Handler {
        private final WeakReference<RenderThread> mRenderThread;

        private RenderHandler(RenderThread renderThread) {
            this.mRenderThread = new WeakReference(renderThread);
        }

        public void handleMessage(Message message) {
            RenderThread renderThread = (RenderThread) this.mRenderThread.get();
            if (renderThread != null) {
                int i = message.what;
                if (i == 16) {
                    renderThread.doDraw();
                } else if (i == 32) {
                    renderThread.applyFilterId(message.arg1);
                } else if (i == 48) {
                    renderThread.doQuit();
                }
            }
        }
    }

    public RenderThread(String str, int i, int i2, EGLContext eGLContext, Surface surface, boolean z) {
        super(str);
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
        this.mShardContext = eGLContext;
        this.mSurface = surface;
        this.mIsRecordable = z;
    }

    private void applyFilterId(int i) {
        if (this.mCanvas != null && this.mEglContextPrepared) {
            this.mCanvas.applyFilterId(i);
        }
    }

    private void doDraw() {
        if (!this.mRequestRelease && this.mEglContextPrepared) {
            int i;
            synchronized (this.mLock) {
                i = this.mRequestDraw > 0 ? 1 : 0;
                if (i != 0) {
                    this.mRequestDraw--;
                }
            }
            if (!(i == 0 || this.mEglCore == null || this.mDrawExtTexAttribute == null)) {
                this.mEglSurfaceBase.makeCurrent();
                this.mCanvas.draw(this.mDrawExtTexAttribute);
                this.mEglSurfaceBase.swapBuffers();
            }
        }
    }

    private void doQuit() {
        if (!this.mRequestRelease) {
            this.mRequestRelease = true;
            release();
            Looper.myLooper().quit();
        }
    }

    private void prepare() {
        this.mEglCore = new EglCore(this.mShardContext, this.mIsRecordable ? 3 : 2);
        this.mEglSurfaceBase = new EglSurfaceBase(this.mEglCore);
        this.mEglSurfaceBase.createWindowSurface(this.mSurface);
        this.mEglSurfaceBase.makeCurrent();
        this.mCanvas = new VideoRecorderCanvas();
        this.mCanvas.setSize(this.mPreviewWidth, this.mPreviewHeight);
    }

    private void release() {
        if (this.mEglSurfaceBase != null) {
            this.mEglSurfaceBase.releaseEglSurface();
            this.mEglSurfaceBase = null;
        }
        if (this.mSurface != null) {
            this.mSurface.release();
            this.mSurface = null;
        }
        if (this.mCanvas != null) {
            this.mCanvas.deleteProgram();
            this.mCanvas.recycledResources();
            this.mCanvas = null;
        }
        if (this.mEglCore != null) {
            this.mEglCore.release();
            this.mEglCore = null;
        }
    }

    public void draw(DrawExtTexAttribute drawExtTexAttribute) {
        synchronized (this.mLock) {
            if (this.mRequestRelease) {
            } else if (this.mEglContextPrepared) {
                this.mDrawExtTexAttribute.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mPreviewWidth, this.mPreviewHeight);
                this.mRequestDraw++;
                this.mHandler.obtainMessage(16).sendToTarget();
            }
        }
    }

    public RenderHandler getHandler() {
        synchronized (this.mLock) {
            if (this.mReady) {
            } else {
                throw new IllegalStateException("render thread is not ready yet");
            }
        }
        return this.mHandler;
    }

    public void quit() {
        this.mHandler.obtainMessage(48).sendToTarget();
    }

    public void run() {
        Looper.prepare();
        this.mHandler = new RenderHandler();
        Log.d(TAG, "prepare render thread: E");
        try {
            this.mEglContextPrepared = false;
            prepare();
            this.mEglContextPrepared = true;
        } catch (Throwable e) {
            Log.d(TAG, "FATAL: failed to prepare render thread", e);
            release();
        }
        synchronized (this.mLock) {
            this.mReady = true;
            this.mLock.notify();
        }
        Looper.loop();
        synchronized (this.mLock) {
            this.mReady = false;
            this.mHandler = null;
        }
        Log.d(TAG, "prepare render thread: X");
    }

    public void setFilterId(int i) {
        Message obtainMessage = this.mHandler.obtainMessage(32);
        obtainMessage.arg1 = i;
        obtainMessage.sendToTarget();
    }

    public void waitUntilReady() {
        synchronized (this.mLock) {
            if (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("waitUntilReady() interrupted: ");
                    stringBuilder.append(e);
                    Log.e(str, stringBuilder.toString());
                }
            }
        }
    }
}
