package com.android.camera.module.encoder;

import android.graphics.SurfaceTexture;
import android.opengl.EGLContext;
import android.text.TextUtils;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.android.camera.effect.VideoRecorderCanvas;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.encoder.EGLBase.EglSurface;
import java.util.Locale;

public final class RenderHandler implements Runnable {
    private static final String TAG = RenderHandler.class.getSimpleName();
    private VideoRecorderCanvas mCanvas;
    private EGLBase mEgl;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private EglSurface mInputSurface;
    private boolean mIsReady;
    private boolean mIsRecordable;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private int mRequestDraw;
    private boolean mRequestRelease;
    private boolean mRequestSetEglContext;
    private EGLContext mShardContext;
    private Object mSurface;
    private final Object mSync = new Object();

    public static final RenderHandler createHandler(String str, int i, int i2) {
        Log.v(TAG, String.format(Locale.ENGLISH, "init: previewSize=%dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2)}));
        RenderHandler renderHandler = new RenderHandler(i, i2);
        synchronized (renderHandler.mSync) {
            renderHandler.mIsReady = false;
            if (TextUtils.isEmpty(str)) {
                str = TAG;
            }
            new Thread(renderHandler, str).start();
            if (!renderHandler.mIsReady) {
                try {
                    renderHandler.mSync.wait();
                } catch (Throwable e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        }
        return renderHandler;
    }

    private RenderHandler(int i, int i2) {
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
    }

    public final void setEglContext(EGLContext eGLContext, Object obj, boolean z) {
        Log.v(TAG, "setEglContext");
        if ((obj instanceof Surface) || (obj instanceof SurfaceTexture) || (obj instanceof SurfaceHolder)) {
            synchronized (this.mSync) {
                if (this.mRequestRelease) {
                    return;
                }
                this.mShardContext = eGLContext;
                this.mSurface = obj;
                this.mIsRecordable = z;
                this.mRequestSetEglContext = true;
                this.mSync.notifyAll();
                try {
                    this.mSync.wait();
                } catch (Throwable e) {
                    Log.e(TAG, e.getMessage(), e);
                }
            }
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("unsupported window type:");
            stringBuilder.append(obj);
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    public final void draw(DrawExtTexAttribute drawExtTexAttribute) {
        synchronized (this.mSync) {
            if (this.mRequestRelease) {
                return;
            }
            this.mExtTexture.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mPreviewWidth, this.mPreviewHeight);
            this.mRequestDraw++;
            this.mSync.notifyAll();
        }
    }

    public boolean isValid() {
        boolean z;
        synchronized (this.mSync) {
            z = !(this.mSurface instanceof Surface) || ((Surface) this.mSurface).isValid();
        }
        return z;
    }

    public final void release() {
        Log.v(TAG, "release");
        synchronized (this.mSync) {
            if (this.mRequestRelease) {
                return;
            }
            this.mRequestRelease = true;
            this.mSync.notifyAll();
            try {
                this.mSync.wait();
            } catch (InterruptedException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    /* JADX WARNING: Missing block: B:22:0x003c, code:
            if (r0 == false) goto L_0x0058;
     */
    /* JADX WARNING: Missing block: B:24:0x0040, code:
            if (r5.mEgl == null) goto L_0x001a;
     */
    /* JADX WARNING: Missing block: B:26:0x0044, code:
            if (r5.mExtTexture == null) goto L_0x001a;
     */
    /* JADX WARNING: Missing block: B:27:0x0046, code:
            r5.mInputSurface.makeCurrent();
            r5.mCanvas.draw(r5.mExtTexture);
            r5.mInputSurface.swap();
     */
    /* JADX WARNING: Missing block: B:28:0x0058, code:
            r0 = r5.mSync;
     */
    /* JADX WARNING: Missing block: B:29:0x005a, code:
            monitor-enter(r0);
     */
    /* JADX WARNING: Missing block: B:31:?, code:
            r5.mSync.wait();
     */
    /* JADX WARNING: Missing block: B:33:?, code:
            monitor-exit(r0);
     */
    public final void run() {
        /*
        r5 = this;
        r0 = TAG;
        r1 = "renderHandlerThread>>>";
        com.android.camera.log.Log.d(r0, r1);
        r0 = r5.mSync;
        monitor-enter(r0);
        r1 = 0;
        r5.mRequestSetEglContext = r1;	 Catch:{ all -> 0x0085 }
        r5.mRequestRelease = r1;	 Catch:{ all -> 0x0085 }
        r5.mRequestDraw = r1;	 Catch:{ all -> 0x0085 }
        r2 = 1;
        r5.mIsReady = r2;	 Catch:{ all -> 0x0085 }
        r3 = r5.mSync;	 Catch:{ all -> 0x0085 }
        r3.notifyAll();	 Catch:{ all -> 0x0085 }
        monitor-exit(r0);	 Catch:{ all -> 0x0085 }
    L_0x001a:
        r3 = r5.mSync;
        monitor-enter(r3);
        r0 = r5.mRequestRelease;	 Catch:{ all -> 0x0082 }
        if (r0 == 0) goto L_0x0023;
    L_0x0021:
        monitor-exit(r3);	 Catch:{ all -> 0x0082 }
        goto L_0x0067;
    L_0x0023:
        r0 = r5.mRequestSetEglContext;	 Catch:{ all -> 0x0082 }
        if (r0 == 0) goto L_0x002c;
    L_0x0027:
        r5.mRequestSetEglContext = r1;	 Catch:{ all -> 0x0082 }
        r5.internalPrepare();	 Catch:{ all -> 0x0082 }
    L_0x002c:
        r0 = r5.mRequestDraw;	 Catch:{ all -> 0x0082 }
        if (r0 <= 0) goto L_0x0032;
    L_0x0030:
        r0 = r2;
        goto L_0x0034;
        r0 = r1;
    L_0x0034:
        if (r0 == 0) goto L_0x003b;
    L_0x0036:
        r4 = r5.mRequestDraw;	 Catch:{ all -> 0x0082 }
        r4 = r4 - r2;
        r5.mRequestDraw = r4;	 Catch:{ all -> 0x0082 }
    L_0x003b:
        monitor-exit(r3);	 Catch:{ all -> 0x0082 }
        if (r0 == 0) goto L_0x0058;
    L_0x003e:
        r0 = r5.mEgl;
        if (r0 == 0) goto L_0x001a;
    L_0x0042:
        r0 = r5.mExtTexture;
        if (r0 == 0) goto L_0x001a;
    L_0x0046:
        r0 = r5.mInputSurface;
        r0.makeCurrent();
        r0 = r5.mCanvas;
        r3 = r5.mExtTexture;
        r0.draw(r3);
        r0 = r5.mInputSurface;
        r0.swap();
        goto L_0x001a;
    L_0x0058:
        r0 = r5.mSync;
        monitor-enter(r0);
        r3 = r5.mSync;	 Catch:{ InterruptedException -> 0x0065 }
        r3.wait();	 Catch:{ InterruptedException -> 0x0065 }
        monitor-exit(r0);	 Catch:{ all -> 0x0063 }
        goto L_0x001a;
    L_0x0063:
        r1 = move-exception;
        goto L_0x0080;
    L_0x0065:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0063 }
    L_0x0067:
        r1 = r5.mSync;
        monitor-enter(r1);
        r5.mRequestRelease = r2;	 Catch:{ all -> 0x007d }
        r5.internalRelease();	 Catch:{ all -> 0x007d }
        r0 = r5.mSync;	 Catch:{ all -> 0x007d }
        r0.notifyAll();	 Catch:{ all -> 0x007d }
        monitor-exit(r1);	 Catch:{ all -> 0x007d }
        r0 = TAG;
        r1 = "renderHandlerThread<<<";
        com.android.camera.log.Log.d(r0, r1);
        return;
    L_0x007d:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x007d }
        throw r0;
    L_0x0080:
        monitor-exit(r0);	 Catch:{ all -> 0x0063 }
        throw r1;
    L_0x0082:
        r0 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x0082 }
        throw r0;
    L_0x0085:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x0085 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.encoder.RenderHandler.run():void");
    }

    private final void internalPrepare() {
        Log.v(TAG, "internalPrepare");
        internalRelease();
        this.mEgl = new EGLBase(this.mShardContext, false, this.mIsRecordable);
        this.mInputSurface = this.mEgl.createFromSurface(this.mSurface);
        this.mInputSurface.makeCurrent();
        this.mCanvas = new VideoRecorderCanvas();
        this.mCanvas.setSize(this.mPreviewWidth, this.mPreviewHeight);
        this.mSurface = null;
        this.mSync.notifyAll();
    }

    private final void internalRelease() {
        Log.v(TAG, "internalRelease");
        if (this.mInputSurface != null) {
            this.mInputSurface.release();
            this.mInputSurface = null;
        }
        if (this.mCanvas != null) {
            this.mCanvas.deleteProgram();
            this.mCanvas.recycledResources();
            this.mCanvas = null;
        }
        if (this.mEgl != null) {
            this.mEgl.release();
            this.mEgl = null;
        }
    }
}
