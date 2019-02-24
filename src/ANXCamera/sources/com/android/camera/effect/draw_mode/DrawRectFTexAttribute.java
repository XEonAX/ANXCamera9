package com.android.camera.effect.draw_mode;

import android.graphics.RectF;
import com.android.gallery3d.ui.BasicTexture;

public class DrawRectFTexAttribute extends DrawAttribute {
    public BasicTexture mBasicTexture;
    public RectF mSourceRectF;
    public RectF mTargetRectF;

    public DrawRectFTexAttribute(BasicTexture basicTexture, RectF rectF, RectF rectF2) {
        this.mSourceRectF = rectF;
        this.mTargetRectF = rectF2;
        this.mBasicTexture = basicTexture;
        this.mTarget = 7;
    }
}
