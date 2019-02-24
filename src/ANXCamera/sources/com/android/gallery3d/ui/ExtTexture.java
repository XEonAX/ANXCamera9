package com.android.gallery3d.ui;

import android.opengl.GLES20;
import com.android.camera.log.Log;

public class ExtTexture extends BasicTexture {
    private static int[] sTextureId = new int[1];
    private int mTarget;

    public ExtTexture() {
        GLES20.glGenTextures(1, sTextureId, 0);
        this.mId = sTextureId[0];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("texId=");
        stringBuilder.append(this.mId);
        Log.d("ExtTexture", stringBuilder.toString());
        this.mTarget = 36197;
    }

    private void uploadToCanvas(GLCanvas gLCanvas) {
        GLES20.glBindTexture(this.mTarget, this.mId);
        GLES20.glTexParameteri(this.mTarget, 10242, 33071);
        GLES20.glTexParameteri(this.mTarget, 10243, 33071);
        GLES20.glTexParameterf(this.mTarget, 10241, 9729.0f);
        GLES20.glTexParameterf(this.mTarget, 10240, 9729.0f);
        setAssociatedCanvas(gLCanvas);
        this.mState = 1;
    }

    public boolean hasBorder() {
        return false;
    }

    public void draw(GLCanvas gLCanvas, int i, int i2) {
    }

    public void draw(GLCanvas gLCanvas, int i, int i2, int i3, int i4) {
    }

    public boolean onBind(GLCanvas gLCanvas) {
        if (!isLoaded()) {
            uploadToCanvas(gLCanvas);
        }
        return true;
    }

    public int getTarget() {
        return this.mTarget;
    }

    public boolean isOpaque() {
        return true;
    }

    public void yield() {
    }
}
