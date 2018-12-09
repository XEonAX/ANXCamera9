package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.BasicTexture;

public class DrawBlurTexAttribute extends DrawBasicTexAttribute {
    public DrawBlurTexAttribute(BasicTexture basicTexture, int i, int i2, int i3, int i4) {
        super(basicTexture, i, i2, i3, i4);
        this.mTarget = 10;
    }

    public DrawBlurTexAttribute(BasicTexture basicTexture) {
        init(basicTexture);
    }

    public DrawBlurTexAttribute init(BasicTexture basicTexture) {
        super.init(basicTexture);
        this.mTarget = 10;
        return this;
    }

    public DrawBlurTexAttribute init(BasicTexture basicTexture, int i, int i2, int i3, int i4) {
        super.init(basicTexture, i, i2, i3, i4);
        this.mTarget = 10;
        return this;
    }

    public DrawBlurTexAttribute init(BasicTexture basicTexture, int i, int i2, int i3, int i4, boolean z) {
        super.init(basicTexture, i, i2, i3, i4, z);
        this.mTarget = 10;
        return this;
    }

    public DrawBlurTexAttribute init(BasicTexture basicTexture, int i, int i2, int i3, int i4, boolean z, boolean z2) {
        super.init(basicTexture, i, i2, i3, i4, z, z2);
        this.mTarget = 10;
        return this;
    }
}
