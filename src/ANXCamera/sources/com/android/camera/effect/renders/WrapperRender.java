package com.android.camera.effect.renders;

import android.opengl.GLES20;
import android.opengl.Matrix;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.filter.base.GPUImageFilter;

public class WrapperRender extends ShaderRender {
    private static final String TAG = WrapperRender.class.getSimpleName();
    private static final float[] VERTICES = new float[]{PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f};
    private float[] mConvertedVertex = new float[16];
    protected GPUImageFilter mFilter;
    private float mRenderHeight;
    private float mRenderWidth;
    private float mRenderX;
    private float mRenderY;

    public WrapperRender(GLCanvas gLCanvas, int i, GPUImageFilter gPUImageFilter) {
        super(gLCanvas, i);
        this.mFilter = gPUImageFilter;
        initFilter();
    }

    public void initFilter() {
        if (this.mFilter != null && !this.mFilter.isInitialized()) {
            this.mFilter.init();
        }
    }

    public void releaseFilter() {
        if (this.mFilter != null && this.mFilter.isInitialized()) {
            this.mFilter.destroy();
        }
    }

    public void setViewportSize(int i, int i2) {
        super.setViewportSize(i, i2);
        this.mRenderWidth = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        this.mRenderHeight = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
        if (this.mFilter != null) {
            this.mFilter.onDisplaySizeChanged(i, i2);
        }
    }

    protected void initShader() {
    }

    protected void initVertexData() {
        int length = (VERTICES.length * 32) / 8;
        this.mVertexBuffer = ShaderRender.allocateByteBuffer(length).asFloatBuffer();
        this.mTexCoorBuffer = ShaderRender.allocateByteBuffer(length).asFloatBuffer();
    }

    protected void initSupportAttriList() {
        this.mAttriSupportedList.add(Integer.valueOf(5));
        this.mAttriSupportedList.add(Integer.valueOf(6));
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (!isAttriSupported(drawAttribute.getTarget())) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("unsupported target ");
            stringBuilder.append(drawAttribute.getTarget());
            Log.w(str, stringBuilder.toString());
            return false;
        } else if (this.mFilter == null) {
            Log.e(TAG, "null filter!");
            return false;
        } else {
            switch (drawAttribute.getTarget()) {
                case 5:
                    DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute;
                    drawTexture(drawBasicTexAttribute.mBasicTexture, (float) drawBasicTexAttribute.mX, (float) drawBasicTexAttribute.mY, (float) drawBasicTexAttribute.mWidth, (float) drawBasicTexAttribute.mHeight);
                    break;
                case 6:
                    DrawIntTexAttribute drawIntTexAttribute = (DrawIntTexAttribute) drawAttribute;
                    drawTexture(drawIntTexAttribute.mTexId, (float) drawIntTexAttribute.mX, (float) drawIntTexAttribute.mY, (float) drawIntTexAttribute.mWidth, (float) drawIntTexAttribute.mHeight);
                    break;
            }
            return true;
        }
    }

    public String getFragShaderString() {
        return null;
    }

    public void destroy() {
        super.destroy();
        releaseFilter();
    }

    protected void drawTexture(BasicTexture basicTexture, float f, float f2, float f3, float f4) {
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
        }
        if (basicTexture.onBind(this.mGLCanvas) && bindTexture(basicTexture, 33984)) {
            setBlendEnabled(false);
            updateViewport();
            checkRenderRect(f, f2, f3, f4);
            this.mFilter.onDrawFrame(basicTexture.getId(), this.mVertexBuffer, this.mTexCoorBuffer);
        }
    }

    protected void drawTexture(int i, float f, float f2, float f3, float f4) {
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
        }
        bindTexture(i, 33984);
        setBlendEnabled(false);
        updateViewport();
        checkRenderRect(f, f2, f3, f4);
        this.mFilter.onDrawFrame(i, this.mVertexBuffer, this.mTexCoorBuffer);
    }

    private void checkRenderRect(float f, float f2, float f3, float f4) {
        if (this.mRenderX != f || this.mRenderY != f2 || this.mRenderWidth != f3 || this.mRenderHeight != f4) {
            this.mRenderX = f;
            this.mRenderY = f2;
            this.mRenderWidth = f3;
            this.mRenderHeight = f4;
            updateVertexData(f, f2, f3, f4);
        }
    }

    private void updateVertexData(float f, float f2, float f3, float f4) {
        int i;
        int i2;
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        this.mGLCanvas.getState().scale(f3, f4, 1.0f);
        Matrix.multiplyMM(this.mConvertedVertex, 0, this.mGLCanvas.getState().getFinalMatrix(), 0, VERTICES, 0);
        for (i = 0; i < 4; i++) {
            for (i2 = 0; i2 < 2; i2++) {
                this.mVertexBuffer.put(this.mConvertedVertex[(4 * i) + i2]);
            }
        }
        this.mVertexBuffer.position(0);
        Matrix.multiplyMM(this.mConvertedVertex, 0, this.mGLCanvas.getState().getTexMatrix(), 0, VERTICES, 0);
        for (i = 0; i < 4; i++) {
            for (i2 = 0; i2 < 2; i2++) {
                this.mTexCoorBuffer.put(this.mConvertedVertex[(4 * i) + i2]);
            }
        }
        this.mTexCoorBuffer.position(0);
        this.mGLCanvas.getState().popState();
    }
}
