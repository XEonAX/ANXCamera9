package com.android.gallery3d.ui;

import com.android.camera.effect.FrameBuffer;
import com.android.camera.effect.GLCanvasState;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.renders.RenderGroup;

public interface GLCanvas {
    void beginBindFrameBuffer(FrameBuffer frameBuffer);

    void clearBuffer();

    void deleteBuffer(int i);

    void deleteFrameBuffer(int i);

    void deleteProgram();

    void deleteProgram(int i);

    boolean deleteTexture(int i);

    boolean deleteTexture(BasicTexture basicTexture);

    void draw(DrawAttribute drawAttribute);

    void endBindFrameBuffer();

    RenderGroup getEffectRenderGroup();

    int getHeight();

    GLCanvasState getState();

    int getWidth();

    void prepareBlurRenders();

    void prepareEffectRenders(boolean z, int i);

    void recycledResources();

    void setPreviewSize(int i, int i2);

    void setSize(int i, int i2);
}
