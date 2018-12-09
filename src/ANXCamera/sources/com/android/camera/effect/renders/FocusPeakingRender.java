package com.android.camera.effect.renders;

import android.os.SystemProperties;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.gallery3d.ui.GLCanvas;

public class FocusPeakingRender extends RenderGroup {
    static final int DEFAULT_PEAK_COLOR = -65536;
    static final float DEFAULT_THRESHOLD = (((float) SystemProperties.getInt("camera_peaking_mf_threshold", 20)) / 100.0f);
    public FocusPeakingFirstPassRender mFirstPassRender;
    public PipeRenderPair mFocusPeakingRender;
    public NoneEffectRender mNoneEffectRender;
    public FocusPeakingSecondPassRender mSecondPassRender;

    public FocusPeakingRender(GLCanvas gLCanvas) {
        super(gLCanvas);
        this.mNoneEffectRender = new NoneEffectRender(gLCanvas);
        this.mFirstPassRender = new FocusPeakingFirstPassRender(gLCanvas);
        this.mSecondPassRender = new FocusPeakingSecondPassRender(gLCanvas);
        this.mFocusPeakingRender = new PipeRenderPair(gLCanvas, this.mFirstPassRender, this.mSecondPassRender, false);
        addRender(this.mNoneEffectRender);
        addRender(this.mFocusPeakingRender);
    }

    public FocusPeakingRender(GLCanvas gLCanvas, int i) {
        this(gLCanvas);
        this.mId = i;
    }

    public boolean draw(DrawAttribute drawAttribute) {
        return this.mFocusPeakingRender.draw(drawAttribute) | (this.mNoneEffectRender.draw(drawAttribute) | 0);
    }
}
