package com.android.camera.effect.renders;

import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.Locale;

public class VideoRecorderRender extends RenderGroup {
    private static final String TAG = VideoRecorderRender.class.getSimpleName();
    private int mEffectId = FilterInfo.FILTER_ID_NONE;
    private boolean mFirstFrameDrawn;
    private PipeRenderPair mRenderPipe;
    private boolean mStickerEnabled;
    private PipeRenderPair mStickerPipeRender;

    public VideoRecorderRender(GLCanvas gLCanvas) {
        super(gLCanvas);
        this.mStickerPipeRender = new PipeRenderPair(gLCanvas);
        this.mRenderPipe = new PipeRenderPair(gLCanvas);
        this.mRenderPipe.setFirstRender(new SurfaceTextureRender(gLCanvas));
        updateSecondRender();
        addRender(this.mRenderPipe);
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (drawAttribute.getTarget() == 8) {
            return drawPreview(drawAttribute);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("unsupported target ");
        stringBuilder.append(drawAttribute.getTarget());
        Log.e(str, stringBuilder.toString());
        return false;
    }

    private boolean drawPreview(DrawAttribute drawAttribute) {
        if (!this.mFirstFrameDrawn) {
            this.mFirstFrameDrawn = true;
            setViewportSize(this.mViewportWidth, this.mViewportHeight);
            setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
        }
        synchronized (this) {
            super.draw(drawAttribute);
        }
        return true;
    }

    private void updateSecondRender() {
        int i = this.mEffectId;
        this.mEffectId = EffectController.getInstance().getEffectForPreview(false);
        boolean z = this.mStickerEnabled;
        this.mStickerEnabled = EffectController.getInstance().isStickerEnable();
        Log.d(TAG, String.format(Locale.ENGLISH, "effectId: 0x%x->0x%x stickerEnabled: %b->%b", new Object[]{Integer.valueOf(i), Integer.valueOf(this.mEffectId), Boolean.valueOf(z), Boolean.valueOf(this.mStickerEnabled)}));
        if (this.mEffectId != i || this.mStickerEnabled != z) {
            this.mFirstFrameDrawn = false;
            this.mRenderPipe.setSecondRender(getSecondRender(this.mEffectId, this.mStickerEnabled));
        }
    }

    public void setFilterId(int i) {
        if (i != this.mEffectId) {
            synchronized (this) {
                updateSecondRender();
            }
        }
    }

    private Render getSecondRender(int i, boolean z) {
        Render render;
        if (i != FilterInfo.FILTER_ID_NONE) {
            render = this.mGLCanvas.getEffectRenderGroup().getRender(i);
            if (render == null) {
                this.mGLCanvas.prepareEffectRenders(false, i);
                render = this.mGLCanvas.getEffectRenderGroup().getRender(i);
            }
        } else {
            render = null;
        }
        if (!z) {
            return render;
        }
        Render render2 = this.mGLCanvas.getEffectRenderGroup().getRender(FilterInfo.FILTER_ID_STICKER);
        if (render2 == null) {
            this.mGLCanvas.prepareEffectRenders(false, FilterInfo.FILTER_ID_STICKER);
            render2 = this.mGLCanvas.getEffectRenderGroup().getRender(FilterInfo.FILTER_ID_STICKER);
        }
        if (render == null) {
            return render2;
        }
        this.mStickerPipeRender.setRenderPairs(render, render2);
        return this.mStickerPipeRender;
    }
}
