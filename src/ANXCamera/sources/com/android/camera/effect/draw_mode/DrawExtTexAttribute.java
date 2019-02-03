package com.android.camera.effect.draw_mode;

import com.android.gallery3d.ui.ExtTexture;

public class DrawExtTexAttribute extends DrawAttribute {
    public boolean mEffectPopup;
    public ExtTexture mExtTexture;
    public int mHeight;
    public float[] mTextureTransform;
    public int mWidth;
    public int mX;
    public int mY;

    public DrawExtTexAttribute() {
        this.mEffectPopup = false;
        this.mTarget = 8;
    }

    public DrawExtTexAttribute(boolean z) {
        this.mEffectPopup = false;
        this.mEffectPopup = z;
        this.mTarget = 8;
    }

    public DrawExtTexAttribute(ExtTexture extTexture, float[] fArr, int i, int i2, int i3, int i4) {
        this.mEffectPopup = false;
        this.mX = i;
        this.mY = i2;
        this.mWidth = i3;
        this.mHeight = i4;
        this.mExtTexture = extTexture;
        this.mTextureTransform = fArr;
        this.mTarget = 8;
    }

    public DrawExtTexAttribute init(ExtTexture extTexture, float[] fArr, int i, int i2, int i3, int i4) {
        this.mX = i;
        this.mY = i2;
        this.mWidth = i3;
        this.mHeight = i4;
        this.mExtTexture = extTexture;
        this.mTextureTransform = fArr;
        return this;
    }
}
