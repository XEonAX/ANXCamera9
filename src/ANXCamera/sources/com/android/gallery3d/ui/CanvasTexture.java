package com.android.gallery3d.ui;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;

abstract class CanvasTexture extends UploadedTexture {
    protected Canvas mCanvas;
    private final Config mConfig = Config.ARGB_8888;

    protected abstract void onDraw(Canvas canvas, Bitmap bitmap);

    public CanvasTexture(int i, int i2) {
        setSize(i, i2);
        setOpaque(false);
    }

    protected Bitmap onGetBitmap() {
        Bitmap createBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, this.mConfig);
        this.mCanvas = new Canvas(createBitmap);
        onDraw(this.mCanvas, createBitmap);
        return createBitmap;
    }

    protected void onFreeBitmap(Bitmap bitmap) {
        if (!BasicTexture.inFinalizer()) {
            bitmap.recycle();
        }
    }
}
