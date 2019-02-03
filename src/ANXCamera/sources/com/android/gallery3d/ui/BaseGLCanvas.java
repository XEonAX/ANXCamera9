package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.GLCanvasState;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.RenderGroup;
import com.xiaomi.engine.CameraCombinationMode;
import java.util.ArrayList;

public class BaseGLCanvas implements GLCanvas {
    public static int sMaxTextureSize = 4096;
    private final IntArray mDeleteBuffers = new IntArray();
    private final IntArray mDeleteFrameBuffers = new IntArray();
    private final ArrayList<Integer> mDeletePrograms = new ArrayList();
    private final IntArray mDeleteTextures = new IntArray();
    private int mHeight;
    protected RenderGroup mRenderCaches;
    protected RenderGroup mRenderGroup;
    protected GLCanvasState mState = new GLCanvasState();
    private int mWidth;

    public BaseGLCanvas() {
        int[] iArr = new int[1];
        GLES20.glGetIntegerv(3379, iArr, 0);
        sMaxTextureSize = iArr[0];
    }

    protected void initialize() {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glClearStencil(0);
        GLES20.glEnable(3042);
        GLES20.glBlendFunc(CameraCombinationMode.CAM_COMBINATION_MODE_REAR_BOKEH_WU, CameraCombinationMode.CAM_COMBINATION_MODE_FRONT_BOKEH);
        GLES20.glPixelStorei(3317, 1);
        GLES20.glPixelStorei(3333, 1);
    }

    public int getWidth() {
        return this.mWidth;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public void setSize(int i, int i2) {
        boolean z = i >= 0 && i2 >= 0;
        Utils.assertTrue(z);
        this.mWidth = i;
        this.mHeight = i2;
        this.mRenderGroup.setViewportSize(i, i2);
        this.mRenderGroup.setPreviewSize(i, i2);
        this.mState.identityAllM();
        this.mState.setAlpha(1.0f);
        this.mState.translate(0.0f, (float) i2, 0.0f);
        this.mState.scale(1.0f, -1.0f, 1.0f);
    }

    public void setPreviewSize(int i, int i2) {
        this.mRenderGroup.setPreviewSize(i, i2);
    }

    public void clearBuffer() {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glClear(16384);
    }

    public GLCanvasState getState() {
        return this.mState;
    }

    public boolean deleteTexture(BasicTexture basicTexture) {
        synchronized (this.mDeleteTextures) {
            if (basicTexture.isLoaded()) {
                this.mDeleteTextures.add(basicTexture.getId());
                return true;
            }
            return false;
        }
    }

    public boolean deleteTexture(int i) {
        synchronized (this.mDeleteTextures) {
            if (i == 0) {
                return false;
            }
            this.mDeleteTextures.add(i);
            return true;
        }
    }

    public void deleteFrameBuffer(int i) {
        synchronized (this.mDeleteFrameBuffers) {
            this.mDeleteFrameBuffers.add(i);
        }
    }

    public void deleteBuffer(int i) {
        synchronized (this.mDeleteBuffers) {
            this.mDeleteBuffers.add(i);
        }
    }

    public void deleteProgram(int i) {
        synchronized (this.mDeletePrograms) {
            this.mDeletePrograms.add(Integer.valueOf(i));
        }
    }

    public void recycledResources() {
        synchronized (this.mDeleteTextures) {
            IntArray intArray = this.mDeleteTextures;
            if (intArray.size() > 0) {
                GLES20.glDeleteTextures(intArray.size(), intArray.getInternalArray(), 0);
                intArray.clear();
            }
            intArray = this.mDeleteBuffers;
            if (intArray.size() > 0) {
                GLES20.glDeleteBuffers(intArray.size(), intArray.getInternalArray(), 0);
                intArray.clear();
            }
            intArray = this.mDeleteFrameBuffers;
            if (intArray.size() > 0) {
                GLES20.glDeleteFramebuffers(intArray.size(), intArray.getInternalArray(), 0);
                intArray.clear();
            }
        }
        synchronized (this.mDeletePrograms) {
            while (this.mDeletePrograms.size() > 0) {
                GLES20.glDeleteProgram(((Integer) this.mDeletePrograms.remove(0)).intValue());
            }
        }
    }

    public void draw(DrawAttribute drawAttribute) {
        this.mRenderGroup.draw(drawAttribute);
    }

    public void beginBindFrameBuffer(FrameBuffer frameBuffer) {
        this.mRenderGroup.beginBindFrameBuffer(frameBuffer);
    }

    public void endBindFrameBuffer() {
        this.mRenderGroup.endBindFrameBuffer();
    }

    public RenderGroup getEffectRenderGroup() {
        return this.mRenderCaches;
    }

    public void prepareEffectRenders(boolean z, int i) {
        if (this.mRenderCaches.isNeedInit(i)) {
            EffectController.getInstance().getEffectGroup(this, this.mRenderCaches, z, true, i);
        }
    }

    public void prepareBlurRenders() {
    }

    public void deleteProgram() {
    }
}
