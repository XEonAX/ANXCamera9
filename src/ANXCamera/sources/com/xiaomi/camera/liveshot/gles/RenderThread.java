package com.xiaomi.camera.liveshot.gles;

import android.graphics.SurfaceTexture;
import android.opengl.EGLContext;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Surface;
import android.view.SurfaceHolder;
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
    private EglCore mEglCore;
    private EglSurfaceBase mEglSurfaceBase;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private RenderHandler mHandler;
    private boolean mIsRecordable;
    private final Object mLock = new Object();
    private final int mPreviewHeight;
    private final int mPreviewWidth;
    private volatile boolean mReady = false;
    private volatile int mRequestDraw;
    private volatile boolean mRequestRelease = false;
    private final EGLContext mShardContext;
    private Object mSurface;

    public class RenderHandler extends Handler {
        private final WeakReference<RenderThread> mRenderThread;

        public RenderHandler(RenderThread renderThread) {
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

    public RenderThread(String str, int i, int i2, EGLContext eGLContext, Object obj, boolean z) {
        super(str);
        if ((obj instanceof Surface) || (obj instanceof SurfaceTexture) || (obj instanceof SurfaceHolder)) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            this.mShardContext = eGLContext;
            this.mSurface = obj;
            this.mIsRecordable = z;
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unsupported surface type:");
        stringBuilder.append(obj);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public void run() {
        Looper.prepare();
        this.mHandler = new RenderHandler(this);
        Log.d(TAG, "encoder thread ready");
        synchronized (this.mLock) {
            this.mReady = true;
            this.mLock.notify();
        }
        release();
        prepare();
        Looper.loop();
        synchronized (this.mLock) {
            this.mReady = false;
            this.mHandler = null;
        }
        Log.d(TAG, "looper quit");
    }

    public void waitUntilReady() {
        synchronized (this.mLock) {
            if (!this.mReady) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException e) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("start() interrupted: ");
                    stringBuilder.append(e);
                    Log.e(str, stringBuilder.toString());
                }
            }
        }
    }

    public RenderHandler getHandler() {
        synchronized (this.mLock) {
            if (this.mReady) {
            } else {
                throw new RuntimeException("not ready");
            }
        }
        return this.mHandler;
    }

    public void draw(DrawExtTexAttribute drawExtTexAttribute) {
        synchronized (this.mLock) {
            if (this.mRequestRelease) {
                return;
            }
            this.mExtTexture.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mPreviewWidth, this.mPreviewHeight);
            this.mRequestDraw++;
            this.mHandler.obtainMessage(16).sendToTarget();
        }
    }

    public void quit() {
        this.mHandler.obtainMessage(48).sendToTarget();
    }

    public void setFilterId(int i) {
        Message obtainMessage = this.mHandler.obtainMessage(32);
        obtainMessage.arg1 = i;
        obtainMessage.sendToTarget();
    }

    private void doQuit() {
        if (!this.mRequestRelease) {
            this.mRequestRelease = true;
            release();
            Looper.myLooper().quit();
        }
    }

    private void doDraw() {
        if (!this.mRequestRelease) {
            int i;
            synchronized (this.mLock) {
                if (this.mRequestDraw > 0) {
                    i = 1;
                } else {
                    i = 0;
                }
                if (i != 0) {
                    this.mRequestDraw--;
                }
            }
            if (!(i == 0 || this.mEglCore == null || this.mExtTexture == null)) {
                this.mEglSurfaceBase.makeCurrent();
                this.mCanvas.draw(this.mExtTexture);
                this.mEglSurfaceBase.swapBuffers();
            }
        }
    }

    private void applyFilterId(int i) {
        if (this.mCanvas != null) {
            this.mCanvas.applyFilterId(i);
        }
    }

    private void prepare() {
        int i;
        if (this.mIsRecordable) {
            i = 3;
        } else {
            i = 2;
        }
        this.mEglCore = new EglCore(this.mShardContext, i);
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
}
