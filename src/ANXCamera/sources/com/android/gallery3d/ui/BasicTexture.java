package com.android.gallery3d.ui;

import android.graphics.RectF;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawBlurTexAttribute;
import com.android.camera.effect.draw_mode.DrawRectFTexAttribute;
import com.android.camera.log.Log;
import java.util.Locale;
import java.util.WeakHashMap;

public abstract class BasicTexture implements Texture {
    private static final int MAX_TEXTURE_SIZE = 5760;
    protected static final int STATE_ERROR = -1;
    protected static final int STATE_LOADED = 1;
    protected static final int STATE_UNLOADED = 0;
    private static final String TAG = "BasicTexture";
    protected static final int UNSPECIFIED = -1;
    private static WeakHashMap<BasicTexture, Object> sAllTextures = new WeakHashMap();
    private static ThreadLocal<Object> sInFinalizer = new ThreadLocal();
    protected GLCanvas mCanvasRef;
    private boolean mHasBorder;
    protected int mHeight;
    protected int mId;
    protected int mState;
    private int mTextureHeight;
    private int mTextureWidth;
    protected int mWidth;

    public abstract int getTarget();

    public abstract boolean onBind(GLCanvas gLCanvas);

    protected BasicTexture(GLCanvas gLCanvas, int i, int i2) {
        this.mWidth = -1;
        this.mHeight = -1;
        this.mCanvasRef = null;
        setAssociatedCanvas(gLCanvas);
        this.mId = i;
        this.mState = i2;
        synchronized (sAllTextures) {
            sAllTextures.put(this, null);
        }
    }

    protected BasicTexture() {
        this(null, 0, 0);
    }

    protected void setAssociatedCanvas(GLCanvas gLCanvas) {
        this.mCanvasRef = gLCanvas;
    }

    public void setSize(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mTextureWidth = this.mWidth;
        this.mTextureHeight = this.mHeight;
        if (this.mTextureWidth > MAX_TEXTURE_SIZE || this.mTextureHeight > MAX_TEXTURE_SIZE) {
            Log.w(TAG, String.format(Locale.ENGLISH, "texture is too large: %d x %d", new Object[]{Integer.valueOf(this.mTextureWidth), Integer.valueOf(this.mTextureHeight)}), new Exception());
        }
    }

    public int getId() {
        return this.mId;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public int getTextureWidth() {
        return this.mTextureWidth;
    }

    public int getTextureHeight() {
        return this.mTextureHeight;
    }

    public boolean hasBorder() {
        return this.mHasBorder;
    }

    protected void setBorder(boolean z) {
        this.mHasBorder = z;
    }

    public void draw(GLCanvas gLCanvas, int i, int i2) {
        gLCanvas.draw(new DrawBasicTexAttribute(this, i, i2, getWidth(), getHeight()));
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        gLCanvas.draw(new DrawBasicTexAttribute(this, i, i2, i3, i4));
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        gLCanvas.draw(new DrawRectFTexAttribute(this, new RectF((float) i, (float) i2, (float) i3, (float) i4), new RectF((float) i5, (float) i6, (float) i7, (float) i8)));
    }

    public void drawBlur(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
        gLCanvas.prepareBlurRenders();
        gLCanvas.draw(new DrawBlurTexAttribute(this, i, i2, i3, i4));
    }

    public boolean isLoaded() {
        return this.mState == 1;
    }

    public void recycle() {
        freeResource();
    }

    public void yield() {
        freeResource();
    }

    private void freeResource() {
        GLCanvas gLCanvas = this.mCanvasRef;
        if (gLCanvas != null && isLoaded()) {
            gLCanvas.deleteTexture(this);
        }
        this.mState = 0;
        setAssociatedCanvas(null);
    }

    protected void finalize() {
        sInFinalizer.set(BasicTexture.class);
        recycle();
        sInFinalizer.set(null);
    }

    public static boolean inFinalizer() {
        return sInFinalizer.get() != null;
    }

    public static void yieldAllTextures() {
        synchronized (sAllTextures) {
            for (BasicTexture yield : sAllTextures.keySet()) {
                yield.yield();
            }
        }
    }

    public static void invalidateAllTextures() {
        synchronized (sAllTextures) {
            for (BasicTexture basicTexture : sAllTextures.keySet()) {
                basicTexture.mState = 0;
                basicTexture.setAssociatedCanvas(null);
            }
        }
    }

    public static void invalidateAllTextures(GLCanvas gLCanvas) {
        synchronized (sAllTextures) {
            for (BasicTexture basicTexture : sAllTextures.keySet()) {
                if (basicTexture.mCanvasRef == gLCanvas) {
                    basicTexture.mState = 0;
                    basicTexture.setAssociatedCanvas(null);
                }
            }
        }
    }
}
