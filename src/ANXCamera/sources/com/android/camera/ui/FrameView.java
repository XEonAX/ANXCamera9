package com.android.camera.ui;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.log.Log;
import com.android.camera2.CameraHardwareFace;

public abstract class FrameView extends View implements FocusIndicator, Rotatable {
    private static final String TAG = "FrameView";
    protected int mCameraDisplayOrientation;
    protected boolean mIsBigEnoughRect;
    protected Matrix mMatrix = new Matrix();
    protected boolean mMirror;
    protected int mOrientation;
    protected boolean mPause;

    public abstract RectF getFocusRect();

    public FrameView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public boolean setFaces(CameraHardwareFace[] cameraHardwareFaceArr) {
        return true;
    }

    public boolean isNeedExposure() {
        return this.mIsBigEnoughRect;
    }

    public boolean isFaceStable() {
        return true;
    }

    public void setCameraDisplayOrientation(int i) {
        this.mCameraDisplayOrientation = i;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mCameraDisplayOrientation=");
        stringBuilder.append(i);
        Log.v(str, stringBuilder.toString());
    }

    public void setOrientation(int i, boolean z) {
        this.mOrientation = i;
        invalidate();
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mMirror=");
        stringBuilder.append(z);
        Log.v(str, stringBuilder.toString());
    }

    public boolean faceExists() {
        return false;
    }

    public void showStart() {
    }

    public void showSuccess() {
    }

    public void showFail() {
    }

    public void clear() {
    }

    public void pause() {
        this.mPause = true;
    }

    public void resume() {
        this.mPause = false;
    }

    public void setShowGenderAndAge(boolean z) {
    }
}
