package com.android.camera;

import android.os.SystemClock;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import com.android.gallery3d.ui.RawTexture;

public class SwitchAnimManager {
    private static final float ROTATE_DURATION = 300.0f;
    private static final String TAG = "SwitchAnimManager";
    private static final float ZOOM_DELTA_PREVIEW = 0.2f;
    private boolean mAlphaAnimation;
    private long mAnimStartTime;
    private float mExtScale = 1.0f;
    private Interpolator mInterpolator = new AccelerateDecelerateInterpolator();
    private boolean mMoveBack;
    private boolean mNewPreview;
    private int mPreviewFrameLayoutWidth;
    private boolean mRecurBlur;
    private int mReviewDrawingHeight;
    private int mReviewDrawingWidth;
    private int mReviewDrawingX;
    private int mReviewDrawingY;

    public void setReviewDrawingSize(int i, int i2, int i3, int i4) {
        this.mReviewDrawingX = i;
        this.mReviewDrawingY = i2;
        this.mReviewDrawingWidth = i3;
        this.mReviewDrawingHeight = i4;
        this.mMoveBack = CameraSettings.isBackCamera();
        this.mNewPreview = false;
    }

    public void setPreviewFrameLayoutSize(int i, int i2) {
        this.mPreviewFrameLayoutWidth = i;
        if (i == 0) {
            Log.e(TAG, "invalid preview frame width", new RuntimeException());
        }
    }

    public void startAnimation(boolean z) {
        if (z) {
            Log.v(TAG, "startAnimation with alpha animation");
        } else {
            Log.v(TAG, "startAnimation");
        }
        this.mAnimStartTime = SystemClock.uptimeMillis();
        this.mRecurBlur = true;
        this.mAlphaAnimation = z;
    }

    public void clearAnimation() {
        this.mAnimStartTime = 0;
        this.mRecurBlur = false;
        this.mAlphaAnimation = false;
    }

    public void startResume() {
        Log.v(TAG, "startResume");
        this.mNewPreview = true;
        this.mRecurBlur = false;
    }

    private boolean drawAnimationBlend(GLCanvas gLCanvas, int i, int i2, int i3, int i4, CameraScreenNail cameraScreenNail, RawTexture rawTexture) {
        if (this.mNewPreview) {
            return false;
        }
        boolean z;
        long uptimeMillis = SystemClock.uptimeMillis() - this.mAnimStartTime;
        if (((float) uptimeMillis) > ROTATE_DURATION) {
            uptimeMillis = 300;
            z = false;
        } else {
            z = true;
        }
        if (!z && this.mRecurBlur) {
            this.mRecurBlur = false;
        }
        drawBlurTexture(gLCanvas, i, i2, i3, i4, cameraScreenNail, this.mInterpolator.getInterpolation(((float) uptimeMillis) / ROTATE_DURATION));
        return z;
    }

    private void drawRealTimeTexture(GLCanvas gLCanvas, int i, int i2, int i3, int i4, CameraScreenNail cameraScreenNail, float f) {
        if (this.mNewPreview) {
            gLCanvas.getState().pushState();
            gLCanvas.getState().setAlpha(f);
            cameraScreenNail.directDraw(gLCanvas, i, i2, i3, i4);
            gLCanvas.getState().popState();
        }
    }

    private void drawBlurTexture(GLCanvas gLCanvas, int i, int i2, int i3, int i4, CameraScreenNail cameraScreenNail, float f) {
        if (this.mRecurBlur) {
            cameraScreenNail.renderBlurTexture(gLCanvas);
        }
        gLCanvas.getState().pushState();
        if (this.mAlphaAnimation) {
            gLCanvas.getState().setBlendAlpha(1.0f - (f * 0.7f));
        }
        cameraScreenNail.drawBlurTexture(gLCanvas, this.mReviewDrawingX, this.mReviewDrawingY, this.mReviewDrawingWidth, this.mReviewDrawingHeight);
        gLCanvas.getState().popState();
    }

    private void drawCopiedTexture(GLCanvas gLCanvas, int i, int i2, RawTexture rawTexture, float f) {
        float f2;
        float f3;
        float f4;
        if (this.mMoveBack) {
            f2 = ((float) this.mReviewDrawingX) + (((float) this.mReviewDrawingWidth) / 2.0f);
            f3 = ((float) this.mReviewDrawingY) + (((float) this.mReviewDrawingHeight) / 2.0f);
            f4 = 1.0f - (ZOOM_DELTA_PREVIEW * f);
            float f5 = ((float) this.mReviewDrawingWidth) * f4;
            float f6 = ((float) this.mReviewDrawingHeight) * f4;
            rawTexture.draw(gLCanvas, Math.round(f2 - (f5 / 2.0f)), Math.round(f3 - (f6 / 2.0f)), Math.round(f5), Math.round(f6));
            return;
        }
        f2 = (float) rawTexture.getWidth();
        float f7 = f2 / 2.0f;
        f3 = (float) rawTexture.getHeight();
        float f8 = f3 / 2.0f;
        f4 = 1.0f - (ZOOM_DELTA_PREVIEW * f);
        f2 *= f4;
        f3 *= f4;
        rawTexture.draw(gLCanvas, Math.round(f7 - (f2 / 2.0f)), Math.round(f8 - (f3 / 2.0f)), Math.round(f2), Math.round(f3), this.mReviewDrawingX, this.mReviewDrawingY, this.mReviewDrawingWidth, this.mReviewDrawingHeight);
    }

    public boolean drawPreview(GLCanvas gLCanvas, int i, int i2, int i3, int i4, RawTexture rawTexture) {
        float f = (float) i3;
        float f2 = ((float) i) + (f / 2.0f);
        float f3 = ((float) i2) + (((float) i4) / 2.0f);
        if (this.mPreviewFrameLayoutWidth != 0) {
            f /= (float) this.mPreviewFrameLayoutWidth;
        } else {
            Log.e(TAG, "previewFrameLayoutWidth=0");
            f = 1.0f;
        }
        float f4 = ((float) this.mReviewDrawingWidth) * f;
        float f5 = ((float) this.mReviewDrawingHeight) * f;
        int round = Math.round(f2 - (f4 / 2.0f));
        int round2 = Math.round(f3 - (f5 / 2.0f));
        f2 = gLCanvas.getState().getAlpha();
        rawTexture.draw(gLCanvas, round, round2, Math.round(f4), Math.round(f5));
        gLCanvas.getState().setAlpha(f2);
        return true;
    }

    public boolean drawAnimation(GLCanvas gLCanvas, int i, int i2, int i3, int i4, CameraScreenNail cameraScreenNail, RawTexture rawTexture) {
        return drawAnimationBlend(gLCanvas, i, i2, i3, i4, cameraScreenNail, rawTexture);
    }

    public float getExtScaleX() {
        return this.mExtScale;
    }

    public float getExtScaleY() {
        return this.mExtScale;
    }
}
