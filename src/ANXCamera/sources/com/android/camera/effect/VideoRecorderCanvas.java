package com.android.camera.effect;

import com.android.camera.Util;
import com.android.camera.effect.renders.RenderGroup;
import com.android.camera.effect.renders.VideoRecorderRender;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BaseGLCanvas;

public class VideoRecorderCanvas extends BaseGLCanvas {
    public VideoRecorderCanvas() {
        this.mRenderCaches = new RenderGroup(this);
        this.mRenderGroup = new VideoRecorderRender(this);
        initialize();
    }

    public void setSize(int i, int i2) {
        super.setSize(i, i2);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setSize: size=");
        stringBuilder.append(i);
        stringBuilder.append("x");
        stringBuilder.append(i2);
        stringBuilder.append(" modelMatrix=");
        stringBuilder.append(Util.dumpMatrix(this.mState.getModelMatrix()));
        Log.d("VideoRecorderCanvas", stringBuilder.toString());
    }

    public void applyFilterId(int i) {
        ((VideoRecorderRender) this.mRenderGroup).setFilterId(i);
    }

    public void deleteProgram() {
        super.deleteProgram();
        this.mRenderCaches.destroy();
        this.mRenderGroup.destroy();
    }
}
