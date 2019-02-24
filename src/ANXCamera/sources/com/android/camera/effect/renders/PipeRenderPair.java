package com.android.camera.effect.renders;

import com.android.camera.effect.EffectController;
import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;
import com.android.gallery3d.ui.Utils;
import com.mi.config.b;
import java.util.ArrayList;

public final class PipeRenderPair extends RenderGroup {
    private static final int MIDDLE_BUFFER_RATIO = 12;
    private static final String TAG = PipeRenderPair.class.getSimpleName();
    private DrawBasicTexAttribute mBasicTextureAttr = new DrawBasicTexAttribute();
    private FrameBuffer mBlurFrameBuffer;
    private int mBufferHeight = -1;
    private int mBufferWidth = -1;
    private DrawExtTexAttribute mExtTexture = new DrawExtTexAttribute();
    private Render mFirstRender;
    private FrameBuffer mFrameBuffer;
    private ArrayList<FrameBuffer> mFrameBuffers = new ArrayList();
    private FrameBuffer mMiddleFrameBuffer;
    private Render mSecondRender;
    private boolean mTextureFilled = false;
    private boolean mUseMiddleBuffer = false;

    public PipeRenderPair(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public PipeRenderPair(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    public PipeRenderPair(GLCanvas gLCanvas, Render render, Render render2, boolean z) {
        super(gLCanvas);
        setRenderPairs(render, render2);
        this.mUseMiddleBuffer = z;
    }

    public PipeRenderPair(GLCanvas gLCanvas, int i, Render render, Render render2, boolean z) {
        super(gLCanvas, i);
        setRenderPairs(render, render2);
        this.mUseMiddleBuffer = z;
    }

    public void setRenderPairs(Render render, Render render2) {
        if (render != this.mFirstRender || render2 != this.mSecondRender) {
            clearRenders();
            if (render != null) {
                addRender(render);
            }
            if (render2 != null) {
                addRender(render2);
            }
            this.mFirstRender = render;
            this.mSecondRender = render2;
        }
    }

    public void setPreviewSize(int i, int i2) {
        super.setPreviewSize(i, i2);
        this.mBufferWidth = this.mUseMiddleBuffer ? this.mPreviewWidth / 12 : this.mPreviewWidth;
        this.mBufferHeight = this.mUseMiddleBuffer ? this.mPreviewHeight / 12 : this.mPreviewHeight;
    }

    public void setFirstRender(Render render) {
        clearRenders();
        if (render != null) {
            addRender(render);
        }
        this.mFirstRender = render;
        if (this.mSecondRender != null) {
            addRender(this.mSecondRender);
        }
    }

    public void setSecondRender(Render render) {
        clearRenders();
        if (this.mFirstRender != null) {
            addRender(this.mFirstRender);
        }
        if (render != null) {
            addRender(render);
        }
        this.mSecondRender = render;
    }

    public void addRender(Render render) {
        if (getRenderSize() < 2) {
            super.addRender(render);
            return;
        }
        throw new RuntimeException("At most 2 renders are supported in PipeRenderPair!");
    }

    public void copyBlurTexture(DrawExtTexAttribute drawExtTexAttribute) {
        if (EffectController.getInstance().isBackGroundBlur() && !this.mTextureFilled) {
            if (!(this.mBlurFrameBuffer != null && this.mBlurFrameBuffer.getWidth() == drawExtTexAttribute.mWidth && this.mBlurFrameBuffer.getHeight() == drawExtTexAttribute.mHeight)) {
                this.mBlurFrameBuffer = new FrameBuffer(this.mGLCanvas, drawExtTexAttribute.mWidth, drawExtTexAttribute.mHeight, this.mParentFrameBufferId);
            }
            beginBindFrameBuffer(this.mBlurFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init((this.mUseMiddleBuffer ? this.mMiddleFrameBuffer : this.mFrameBuffer).getTexture(), drawExtTexAttribute.mX, drawExtTexAttribute.mY, drawExtTexAttribute.mWidth, drawExtTexAttribute.mHeight));
            endBindFrameBuffer();
            this.mTextureFilled = true;
        }
    }

    public void drawBlurTexture(DrawExtTexAttribute drawExtTexAttribute) {
        if (EffectController.getInstance().isBackGroundBlur() && this.mTextureFilled) {
            this.mGLCanvas.draw(new DrawBasicTexAttribute(this.mBlurFrameBuffer.getTexture(), drawExtTexAttribute.mX, drawExtTexAttribute.mY, drawExtTexAttribute.mWidth, drawExtTexAttribute.mHeight));
        }
    }

    private void setFrameBufferInfo(Render render, FrameBuffer frameBuffer) {
        render.setPreviousFrameBufferInfo(frameBuffer.getId(), frameBuffer.getWidth(), frameBuffer.getHeight());
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (getRenderSize() == 0) {
            return false;
        }
        if (getRenderSize() == 1 || this.mFirstRender == this.mSecondRender) {
            return getRenderByIndex(0).draw(drawAttribute);
        }
        if (drawAttribute.getTarget() == 8) {
            DrawExtTexAttribute drawExtTexAttribute = (DrawExtTexAttribute) drawAttribute;
            this.mFrameBuffer = getFrameBuffer(this.mPreviewWidth, this.mPreviewHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(this.mExtTexture.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mFrameBuffer.getTexture().getTextureWidth(), this.mFrameBuffer.getTexture().getTextureHeight()));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            if (this.mUseMiddleBuffer) {
                updateMiddleBuffer(this.mPreviewWidth, this.mPreviewHeight);
                this.mMiddleFrameBuffer = getFrameBuffer(this.mBufferWidth, this.mBufferHeight);
                beginBindFrameBuffer(this.mMiddleFrameBuffer);
                this.mFirstRender.draw(this.mExtTexture.init(drawExtTexAttribute.mExtTexture, drawExtTexAttribute.mTextureTransform, 0, 0, this.mBufferWidth, this.mBufferHeight));
                endBindFrameBuffer();
            }
            if (EffectController.getInstance().isMainFrameDisplay()) {
                if (b.hc() && EffectController.getInstance().isBackGroundBlur()) {
                    copyBlurTexture(drawExtTexAttribute);
                    drawBlurTexture(drawExtTexAttribute);
                } else {
                    this.mSecondRender.draw(this.mBasicTextureAttr.init((this.mUseMiddleBuffer ? this.mMiddleFrameBuffer : this.mFrameBuffer).getTexture(), drawExtTexAttribute.mX, drawExtTexAttribute.mY, drawExtTexAttribute.mWidth, drawExtTexAttribute.mHeight));
                }
            }
            return true;
        } else if (drawAttribute.getTarget() == 5 || drawAttribute.getTarget() == 10) {
            DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute;
            if (drawAttribute.getTarget() == 10) {
                updateMiddleBuffer(drawBasicTexAttribute.mWidth, drawBasicTexAttribute.mHeight);
            }
            this.mFrameBuffer = getFrameBuffer(this.mBufferWidth, this.mBufferHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(this.mBasicTextureAttr.init(drawBasicTexAttribute.mBasicTexture, 0, 0, this.mFrameBuffer.getTexture().getTextureWidth(), this.mFrameBuffer.getTexture().getTextureHeight()));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mFrameBuffer.getTexture(), drawBasicTexAttribute.mX, drawBasicTexAttribute.mY, drawBasicTexAttribute.mWidth, drawBasicTexAttribute.mHeight));
            return true;
        } else if (drawAttribute.getTarget() != 6) {
            return false;
        } else {
            DrawIntTexAttribute drawIntTexAttribute = (DrawIntTexAttribute) drawAttribute;
            this.mFrameBuffer = getFrameBuffer(drawIntTexAttribute.mWidth, drawIntTexAttribute.mHeight);
            beginBindFrameBuffer(this.mFrameBuffer);
            this.mFirstRender.draw(new DrawIntTexAttribute(drawIntTexAttribute.mTexId, 0, 0, drawIntTexAttribute.mWidth, drawIntTexAttribute.mHeight, drawIntTexAttribute.mIsSnapshot));
            endBindFrameBuffer();
            setFrameBufferInfo(this.mSecondRender, this.mFrameBuffer);
            this.mSecondRender.draw(this.mBasicTextureAttr.init(this.mFrameBuffer.getTexture(), drawIntTexAttribute.mX, drawIntTexAttribute.mY, drawIntTexAttribute.mWidth, drawIntTexAttribute.mHeight, drawIntTexAttribute.mIsSnapshot));
            return true;
        }
    }

    public RawTexture getTexture() {
        if (this.mFrameBuffer == null) {
            return null;
        }
        return this.mFrameBuffer.getTexture();
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        this.mFrameBuffers.clear();
        this.mFrameBuffer = null;
        this.mMiddleFrameBuffer = null;
    }

    private FrameBuffer getFrameBuffer(int i, int i2) {
        FrameBuffer frameBuffer;
        if (!this.mFrameBuffers.isEmpty()) {
            for (int size = this.mFrameBuffers.size() - 1; size >= 0; size--) {
                double abs;
                int width = ((FrameBuffer) this.mFrameBuffers.get(size)).getWidth();
                int height = ((FrameBuffer) this.mFrameBuffers.get(size)).getHeight();
                if (i < i2) {
                    abs = Math.abs((((double) height) / ((double) width)) - (((double) i2) / ((double) i)));
                } else {
                    abs = Math.abs((((double) width) / ((double) height)) - (((double) i) / ((double) i2)));
                }
                if (abs <= 0.1d && Utils.nextPowerOf2(width) == Utils.nextPowerOf2(i) && Utils.nextPowerOf2(height) == Utils.nextPowerOf2(i2)) {
                    frameBuffer = (FrameBuffer) this.mFrameBuffers.get(size);
                    break;
                }
            }
        }
        frameBuffer = null;
        if (frameBuffer == null) {
            frameBuffer = new FrameBuffer(this.mGLCanvas, i, i2, this.mParentFrameBufferId);
            if (this.mFrameBuffers.size() > 5) {
                this.mFrameBuffers.remove(this.mFrameBuffers.size() - 1);
            }
            this.mFrameBuffers.add(frameBuffer);
        }
        return frameBuffer;
    }

    public void setUsedMiddleBuffer(boolean z) {
        this.mUseMiddleBuffer = z;
    }

    private void updateMiddleBuffer(int i, int i2) {
        if (this.mUseMiddleBuffer) {
            this.mBufferWidth = i / 12;
            this.mBufferHeight = i2 / 12;
            return;
        }
        this.mBufferWidth = i;
        this.mBufferHeight = i2;
    }

    public void prepareCopyBlurTexture() {
        this.mTextureFilled = false;
    }
}
