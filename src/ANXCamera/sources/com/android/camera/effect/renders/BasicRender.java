package com.android.camera.effect.renders;

import android.graphics.Color;
import android.graphics.RectF;
import android.opengl.GLES20;
import com.android.camera.effect.ShaderUtil;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawLineAttribute;
import com.android.camera.effect.draw_mode.DrawMeshAttribute;
import com.android.camera.effect.draw_mode.DrawMixedAttribute;
import com.android.camera.effect.draw_mode.DrawRectAttribute;
import com.android.camera.effect.draw_mode.DrawRectFTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.GLPaint;
import com.android.gallery3d.ui.UploadedTexture;

public class BasicRender extends ShaderRender {
    private static final float BYTE_COLOR_TO_FLOAT = 0.003921569f;
    private static final int OFFSET_DRAW_LINE = 4;
    private static final int OFFSET_DRAW_RECT = 6;
    private static final int OFFSET_FILL_RECT = 0;
    private static final float[] TEXTURES = new float[]{0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
    private static final float[] VERTICES = new float[]{0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};
    private int mUniformBlendFactorH;
    private int mUniformPaintColorH;

    public BasicRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    protected void initShader() {
        this.mProgram = ShaderUtil.createProgram(getVertexShaderString(), getFragShaderString());
        if (this.mProgram != 0) {
            GLES20.glUseProgram(this.mProgram);
            this.mUniformMVPMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uMVPMatrix");
            this.mUniformSTMatrixH = GLES20.glGetUniformLocation(this.mProgram, "uSTMatrix");
            this.mUniformTextureH = GLES20.glGetUniformLocation(this.mProgram, "sTexture");
            this.mUniformAlphaH = GLES20.glGetUniformLocation(this.mProgram, "uAlpha");
            this.mUniformBlendAlphaH = GLES20.glGetUniformLocation(this.mProgram, "uMixAlpha");
            this.mUniformBlendFactorH = GLES20.glGetUniformLocation(this.mProgram, "uBlendFactor");
            this.mUniformPaintColorH = GLES20.glGetUniformLocation(this.mProgram, "uPaintColor");
            this.mAttributePositionH = GLES20.glGetAttribLocation(this.mProgram, "aPosition");
            this.mAttributeTexCoorH = GLES20.glGetAttribLocation(this.mProgram, "aTexCoord");
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getClass());
        stringBuilder.append(": mProgram = 0");
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public String getFragShaderString() {
        return ShaderUtil.loadFromAssetsFile("frag_normal.txt");
    }

    protected void initVertexData() {
        this.mVertexBuffer = ShaderRender.allocateByteBuffer((VERTICES.length * 32) / 8).asFloatBuffer();
        this.mVertexBuffer.put(VERTICES);
        this.mVertexBuffer.position(0);
        this.mTexCoorBuffer = ShaderRender.allocateByteBuffer((TEXTURES.length * 32) / 8).asFloatBuffer();
        this.mTexCoorBuffer.put(TEXTURES);
        this.mTexCoorBuffer.position(0);
    }

    protected void initSupportAttriList() {
        this.mAttriSupportedList.add(Integer.valueOf(0));
        this.mAttriSupportedList.add(Integer.valueOf(1));
        this.mAttriSupportedList.add(Integer.valueOf(2));
        this.mAttriSupportedList.add(Integer.valueOf(3));
        this.mAttriSupportedList.add(Integer.valueOf(4));
        this.mAttriSupportedList.add(Integer.valueOf(5));
        this.mAttriSupportedList.add(Integer.valueOf(7));
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (!isAttriSupported(drawAttribute.getTarget())) {
            return false;
        }
        int target = drawAttribute.getTarget();
        if (target != 7) {
            switch (target) {
                case 0:
                    DrawLineAttribute drawLineAttribute = (DrawLineAttribute) drawAttribute;
                    drawLine(drawLineAttribute.mX1, drawLineAttribute.mY1, drawLineAttribute.mX2, drawLineAttribute.mY2, drawLineAttribute.mGLPaint);
                    break;
                case 1:
                    DrawRectAttribute drawRectAttribute = (DrawRectAttribute) drawAttribute;
                    drawRect(drawRectAttribute.mX, drawRectAttribute.mY, drawRectAttribute.mWidth, drawRectAttribute.mHeight, drawRectAttribute.mGLPaint);
                    break;
                case 2:
                    DrawMeshAttribute drawMeshAttribute = (DrawMeshAttribute) drawAttribute;
                    drawMesh(drawMeshAttribute.mBasicTexture, drawMeshAttribute.mX, drawMeshAttribute.mY, drawMeshAttribute.mXYBuffer, drawMeshAttribute.mUVBuffer, drawMeshAttribute.mIndexBuffer, drawMeshAttribute.mIndexCount);
                    break;
                case 3:
                    DrawMixedAttribute drawMixedAttribute = (DrawMixedAttribute) drawAttribute;
                    drawMixed(drawMixedAttribute.mBasicTexture, drawMixedAttribute.mToColor, drawMixedAttribute.mRatio, drawMixedAttribute.mX, drawMixedAttribute.mY, drawMixedAttribute.mWidth, drawMixedAttribute.mHeight);
                    break;
                case 4:
                    FillRectAttribute fillRectAttribute = (FillRectAttribute) drawAttribute;
                    fillRect(fillRectAttribute.mX, fillRectAttribute.mY, fillRectAttribute.mWidth, fillRectAttribute.mHeight, fillRectAttribute.mColor);
                    break;
                case 5:
                    DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute;
                    drawTexture(drawBasicTexAttribute.mBasicTexture, (float) drawBasicTexAttribute.mX, (float) drawBasicTexAttribute.mY, (float) drawBasicTexAttribute.mWidth, (float) drawBasicTexAttribute.mHeight);
                    break;
            }
        }
        DrawRectFTexAttribute drawRectFTexAttribute = (DrawRectFTexAttribute) drawAttribute;
        drawTexture(drawRectFTexAttribute.mBasicTexture, drawRectFTexAttribute.mSourceRectF, drawRectFTexAttribute.mTargetRectF);
        return true;
    }

    private void drawRect(float f, float f2, float f3, float f4, GLPaint gLPaint) {
        GLES20.glUseProgram(this.mProgram);
        initAttribPointer();
        updateViewport();
        initGLPaint(gLPaint);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, 0.0f);
        this.mGLCanvas.getState().scale(f3, f4, 1.0f);
        GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
        GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
        GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
        GLES20.glUniform1f(this.mUniformBlendAlphaH, this.mGLCanvas.getState().getBlendAlpha());
        GLES20.glUniform4f(this.mUniformBlendFactorH, 0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glDrawArrays(2, 6, 4);
        this.mGLCanvas.getState().popState();
    }

    private void fillRect(float f, float f2, float f3, float f4, int i) {
        GLES20.glUseProgram(this.mProgram);
        initAttribPointer();
        updateViewport();
        initGLPaint(i);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, 0.0f);
        this.mGLCanvas.getState().scale(f3, f4, 1.0f);
        GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
        GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
        GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
        GLES20.glUniform1f(this.mUniformBlendAlphaH, this.mGLCanvas.getState().getBlendAlpha());
        GLES20.glUniform4f(this.mUniformBlendFactorH, 0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glDrawArrays(5, 0, 4);
        this.mGLCanvas.getState().popState();
    }

    private void drawLine(float f, float f2, float f3, float f4, GLPaint gLPaint) {
        GLES20.glUseProgram(this.mProgram);
        initAttribPointer();
        updateViewport();
        initGLPaint(gLPaint);
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().translate(f, f2, 0.0f);
        this.mGLCanvas.getState().scale(f3 - f, f4 - f2, 1.0f);
        GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
        GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
        GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
        GLES20.glUniform1f(this.mUniformBlendAlphaH, this.mGLCanvas.getState().getBlendAlpha());
        GLES20.glUniform4f(this.mUniformBlendFactorH, 0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glDrawArrays(3, 4, 2);
        this.mGLCanvas.getState().popState();
    }

    private void drawTexture(BasicTexture basicTexture, float f, float f2, float f3, float f4) {
        this.mGLCanvas.getState().pushState();
        this.mGLCanvas.getState().identityTexM();
        drawTextureInternal(basicTexture, f, f2, f3, f4);
        this.mGLCanvas.getState().popState();
    }

    /* JADX WARNING: Missing block: B:9:0x0053, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void drawTexture(BasicTexture basicTexture, RectF rectF, RectF rectF2) {
        if (rectF2.width() > 0.0f && rectF2.height() > 0.0f && basicTexture.onBind(this.mGLCanvas)) {
            convertCoordinate(rectF, rectF2, basicTexture);
            this.mGLCanvas.getState().pushState();
            this.mGLCanvas.getState().setTexMatrix(rectF.left, rectF.top, rectF.right, rectF.bottom);
            drawTextureInternal(basicTexture, rectF2.left, rectF2.top, rectF2.width(), rectF2.height());
            this.mGLCanvas.getState().popState();
        }
    }

    private void drawTextureInternal(BasicTexture basicTexture, float f, float f2, float f3, float f4) {
        if (f3 > 0.0f && f4 > 0.0f) {
            GLES20.glUseProgram(this.mProgram);
            if (bindTexture(basicTexture, 33984)) {
                boolean isPremultiplied;
                GLES20.glUniform4f(this.mUniformBlendFactorH, 1.0f, 0.0f, 0.0f, 0.0f);
                GLES20.glUniform1i(this.mUniformTextureH, 0);
                initAttribPointer();
                updateViewport();
                float alpha = this.mGLCanvas.getState().getAlpha();
                float blendAlpha = this.mGLCanvas.getState().getBlendAlpha();
                if (basicTexture instanceof UploadedTexture) {
                    isPremultiplied = ((UploadedTexture) basicTexture).isPremultiplied();
                } else {
                    isPremultiplied = false;
                }
                boolean z = this.mBlendEnabled && (!basicTexture.isOpaque() || alpha < 0.95f || blendAlpha >= 0.0f);
                setBlendEnabled(z, isPremultiplied);
                this.mGLCanvas.getState().translate(f, f2, 0.0f);
                this.mGLCanvas.getState().scale(f3, f4, 1.0f);
                GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
                GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
                GLES20.glUniform1f(this.mUniformAlphaH, alpha);
                GLES20.glUniform1f(this.mUniformBlendAlphaH, blendAlpha);
                GLES20.glDrawArrays(5, 0, 4);
            }
        }
    }

    private void drawMixed(BasicTexture basicTexture, int i, float f, float f2, float f3, float f4, float f5) {
        GLES20.glUseProgram(this.mProgram);
        if (bindTexture(basicTexture, 33984)) {
            initAttribPointer();
            initGLPaint(i);
            updateViewport();
            boolean z = this.mBlendEnabled && (!basicTexture.isOpaque() || this.mGLCanvas.getState().getAlpha() < 0.95f);
            setBlendEnabled(z);
            this.mGLCanvas.getState().pushState();
            this.mGLCanvas.getState().translate(f2, f3, 0.0f);
            this.mGLCanvas.getState().scale(f4, f5, 1.0f);
            GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
            GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
            GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
            GLES20.glUniform4f(this.mUniformBlendFactorH, 1.0f - f, 0.0f, 0.0f, f);
            GLES20.glUniform1i(this.mUniformTextureH, 0);
            GLES20.glUniform1f(this.mUniformBlendAlphaH, this.mGLCanvas.getState().getBlendAlpha());
            GLES20.glDrawArrays(5, 0, 4);
            this.mGLCanvas.getState().popState();
        }
    }

    private void drawMesh(BasicTexture basicTexture, float f, float f2, int i, int i2, int i3, int i4) {
        GLES20.glUseProgram(this.mProgram);
        if (bindTexture(basicTexture, 33984)) {
            boolean z = this.mBlendEnabled && this.mGLCanvas.getState().getAlpha() < 0.95f;
            setBlendEnabled(z);
            GLES20.glBindBuffer(34962, i);
            GLES20.glVertexAttribPointer(this.mAttributePositionH, 2, 5126, false, 0, 0);
            GLES20.glEnableVertexAttribArray(this.mAttributePositionH);
            GLES20.glBindBuffer(34962, i2);
            GLES20.glVertexAttribPointer(this.mAttributeTexCoorH, 2, 5126, false, 0, 0);
            GLES20.glEnableVertexAttribArray(this.mAttributeTexCoorH);
            this.mGLCanvas.getState().pushState();
            this.mGLCanvas.getState().translate(f, f2, 0.0f);
            GLES20.glUniformMatrix4fv(this.mUniformMVPMatrixH, 1, false, this.mGLCanvas.getState().getFinalMatrix(), 0);
            GLES20.glUniformMatrix4fv(this.mUniformSTMatrixH, 1, false, this.mGLCanvas.getState().getTexMatrix(), 0);
            GLES20.glUniform1f(this.mUniformAlphaH, this.mGLCanvas.getState().getAlpha());
            GLES20.glUniform1f(this.mUniformBlendAlphaH, this.mGLCanvas.getState().getBlendAlpha());
            GLES20.glUniform4f(this.mUniformBlendFactorH, 1.0f, 0.0f, 0.0f, 0.0f);
            GLES20.glUniform1i(this.mUniformTextureH, 0);
            GLES20.glBindBuffer(34963, i3);
            GLES20.glDrawElements(5, i4, 5121, 0);
            GLES20.glBindBuffer(34963, 0);
            GLES20.glBindBuffer(34962, 0);
            this.mGLCanvas.getState().popState();
        }
    }

    private void initGLPaint(GLPaint gLPaint) {
        initGLPaint(gLPaint.getColor());
        GLES20.glLineWidth(gLPaint.getLineWidth());
    }

    private void initGLPaint(int i) {
        float alpha = ((float) Color.alpha(i)) * BYTE_COLOR_TO_FLOAT;
        boolean z = this.mBlendEnabled && (alpha < 0.95f || this.mGLCanvas.getState().getAlpha() < 0.95f);
        setBlendEnabled(z);
        GLES20.glUniform4f(this.mUniformPaintColorH, ((float) Color.red(i)) * BYTE_COLOR_TO_FLOAT, ((float) Color.green(i)) * BYTE_COLOR_TO_FLOAT, ((float) Color.blue(i)) * BYTE_COLOR_TO_FLOAT, alpha);
    }

    private void initAttribPointer() {
        GLES20.glVertexAttribPointer(this.mAttributePositionH, 2, 5126, false, 8, this.mVertexBuffer);
        GLES20.glVertexAttribPointer(this.mAttributeTexCoorH, 2, 5126, false, 8, this.mTexCoorBuffer);
        GLES20.glEnableVertexAttribArray(this.mAttributePositionH);
        GLES20.glEnableVertexAttribArray(this.mAttributeTexCoorH);
    }

    private void convertCoordinate(RectF rectF, RectF rectF2, BasicTexture basicTexture) {
        int width = basicTexture.getWidth();
        int height = basicTexture.getHeight();
        int textureWidth = basicTexture.getTextureWidth();
        int textureHeight = basicTexture.getTextureHeight();
        float f = (float) textureWidth;
        rectF.left /= f;
        rectF.right /= f;
        float f2 = (float) textureHeight;
        rectF.top /= f2;
        rectF.bottom /= f2;
        float f3 = ((float) width) / f;
        if (rectF.right > f3) {
            rectF2.right = rectF2.left + ((rectF2.width() * (f3 - rectF.left)) / rectF.width());
            rectF.right = f3;
        }
        f3 = ((float) height) / f2;
        if (rectF.bottom > f3) {
            rectF2.bottom = rectF2.top + ((rectF2.height() * (f3 - rectF.top)) / rectF.height());
            rectF.bottom = f3;
        }
    }
}
