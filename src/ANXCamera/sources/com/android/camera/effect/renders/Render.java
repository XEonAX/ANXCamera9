package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.nio.ByteBuffer;

public abstract class Render {
    private static final String TAG = "Render";
    private FrameBufferCallback mFrameBufferCallback;
    protected GLCanvas mGLCanvas;
    protected int mId = -1;
    protected int mJpegOrientation;
    protected boolean mMirror;
    protected int mOldViewportHeight;
    protected int mOldViewportWidth;
    protected int mOrientation;
    protected int mParentFrameBufferId;
    protected int mPreviewHeight;
    protected int mPreviewWidth;
    protected float mShootRotation;
    protected int mSnapshotOriginHeight;
    protected int mSnapshotOriginWidth;
    protected int mViewportHeight;
    protected int mViewportWidth;

    public interface FrameBufferCallback {
        void onFrameBuffer(ByteBuffer byteBuffer, int i, int i2);
    }

    public abstract void destroy();

    public abstract boolean draw(DrawAttribute drawAttribute);

    public Render(GLCanvas gLCanvas) {
        this.mGLCanvas = gLCanvas;
        this.mParentFrameBufferId = 0;
        this.mId = hashCode();
    }

    public Render(GLCanvas gLCanvas, int i) {
        this.mGLCanvas = gLCanvas;
        this.mParentFrameBufferId = 0;
        this.mId = i;
    }

    public void setViewportSize(int i, int i2) {
        this.mViewportWidth = i;
        this.mViewportHeight = i2;
        if (this.mOldViewportWidth == 0) {
            this.mOldViewportWidth = i;
            this.mOldViewportHeight = i2;
        }
    }

    public void setPreviewSize(int i, int i2) {
        this.mPreviewWidth = i;
        this.mPreviewHeight = i2;
    }

    public void setOrientation(int i) {
        this.mOrientation = i;
    }

    public void setJpegOrientation(int i) {
        this.mJpegOrientation = i;
    }

    public void setShootRotation(float f) {
        this.mShootRotation = f;
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
    }

    public void setSnapshotSize(int i, int i2) {
        this.mSnapshotOriginWidth = i;
        this.mSnapshotOriginHeight = i2;
    }

    protected void updateViewport() {
        GLES20.glViewport(0, 0, this.mViewportWidth, this.mViewportHeight);
        this.mGLCanvas.getState().ortho(0.0f, (float) this.mViewportWidth, 0.0f, (float) this.mViewportHeight);
    }

    protected void setParentFrameBufferId(int i) {
        this.mParentFrameBufferId = i;
    }

    public int getId() {
        return this.mId;
    }

    public void setFrameBufferCallback(FrameBufferCallback frameBufferCallback, int i) {
        if (i == this.mId || i < 0) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setFrameBufferCallback: id=0x");
            stringBuilder.append(Integer.toHexString(i));
            Log.v(str, stringBuilder.toString());
            synchronized (this) {
                this.mFrameBufferCallback = frameBufferCallback;
            }
        }
    }

    public FrameBufferCallback getFrameBufferCallback() {
        FrameBufferCallback frameBufferCallback;
        synchronized (this) {
            frameBufferCallback = this.mFrameBufferCallback;
        }
        return frameBufferCallback;
    }

    public void setSticker(String str) {
    }

    public void setPreviousFrameBufferInfo(int i, int i2, int i3) {
    }

    public void deleteBuffer() {
    }

    public void setEffectRangeAttribute(EffectRectAttribute effectRectAttribute) {
    }
}
