package com.android.camera.effect;

import com.android.camera.effect.renders.BasicRender;
import com.android.camera.effect.renders.RenderGroup;
import com.android.gallery3d.ui.BaseGLCanvas;

public class SnapshotCanvas extends BaseGLCanvas {
    private final int BASIC_RENDER_INDEX;
    private final int EFFECT_GROUP_INDEX;

    public SnapshotCanvas() {
        this.EFFECT_GROUP_INDEX = 0;
        this.BASIC_RENDER_INDEX = 1;
        this.mRenderCaches = new RenderGroup(this);
        this.mRenderGroup = new RenderGroup(this);
        this.mRenderGroup.addRender(this.mRenderCaches);
        this.mRenderGroup.addRender(new BasicRender(this));
        initialize();
    }

    public RenderGroup getEffectRenderGroup() {
        return (RenderGroup) this.mRenderGroup.getRenderByIndex(0);
    }

    public BasicRender getBasicRender() {
        return (BasicRender) this.mRenderGroup.getRenderByIndex(1);
    }

    public void deleteProgram() {
        super.deleteProgram();
    }
}
