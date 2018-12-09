package com.android.camera;

import android.graphics.Color;
import android.os.SystemClock;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;

public class CaptureAnimManager {
    private static final int ANIM_BOTH = 1;
    private static final int ANIM_HOLD = 2;
    private static final int ANIM_NONE = 0;
    private static final int ANIM_SLIDE = 3;
    private static final int TIME_HOLD = 20;
    private static final int TIME_SLIDE = 60;
    private long mAnimStartTime;
    private int mAnimType;
    private int mDrawHeight;
    private int mDrawWidth;
    private float mX;
    private float mY;

    public void startAnimation(int i, int i2, int i3, int i4) {
        this.mAnimStartTime = SystemClock.uptimeMillis();
        this.mDrawWidth = i3;
        this.mDrawHeight = i4;
        this.mX = (float) i;
        this.mY = (float) i2;
    }

    public void animateSlide() {
        if (this.mAnimType == 2) {
            this.mAnimType = 3;
            this.mAnimStartTime = SystemClock.uptimeMillis();
        }
    }

    public void animateHold() {
        this.mAnimType = 2;
    }

    public void clearAnimation() {
        this.mAnimType = 0;
    }

    public void animateHoldAndSlide() {
        this.mAnimType = 1;
    }

    public boolean drawAnimation(GLCanvas gLCanvas, RawTexture rawTexture) {
        GLCanvas gLCanvas2 = gLCanvas;
        long uptimeMillis = SystemClock.uptimeMillis() - this.mAnimStartTime;
        if (this.mAnimType == 3 && uptimeMillis > 60) {
            return false;
        }
        if (this.mAnimType == 1 && uptimeMillis > 80) {
            return false;
        }
        int i = this.mAnimType;
        if (this.mAnimType == 1) {
            i = uptimeMillis < 20 ? 2 : 3;
        }
        if (i == 2) {
            gLCanvas2.draw(new DrawBasicTexAttribute(rawTexture, (int) this.mX, (int) this.mY, this.mDrawWidth, this.mDrawHeight));
        } else if (i != 3) {
            return false;
        } else {
            gLCanvas2.draw(new DrawBasicTexAttribute(rawTexture, (int) this.mX, (int) this.mY, this.mDrawWidth, this.mDrawHeight));
            gLCanvas2.draw(new FillRectAttribute(this.mX, this.mY, (float) this.mDrawWidth, (float) this.mDrawHeight, Color.argb(178, 0, 0, 0)));
        }
        return true;
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4, RawTexture rawTexture) {
        rawTexture.draw(gLCanvas, i, i2, i3, i4);
    }
}
