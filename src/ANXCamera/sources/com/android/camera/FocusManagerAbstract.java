package com.android.camera;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.params.MeteringRectangle;
import com.android.camera.log.Log;

public abstract class FocusManagerAbstract {
    public static final int FOCUS_FROM_AUTO = 0;
    public static final int FOCUS_FROM_FACE = 1;
    public static final int FOCUS_FROM_FORCE = 4;
    public static final int FOCUS_FROM_NONE = -1;
    public static final int FOCUS_FROM_OBJECT_TRACK = 2;
    public static final int FOCUS_FROM_TOUCH = 3;
    public static final int STATE_FAIL = 4;
    public static final int STATE_FOCUSING = 1;
    public static final int STATE_FOCUSING_SNAP_ON_FINISH = 2;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SUCCESS = 3;
    protected final int FOCUS_AREA_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_height);
    protected final float FOCUS_AREA_SCALE = 1.0f;
    protected final int FOCUS_AREA_WIDTH = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_width);
    protected final float METERING_AREA_SCALE = 1.8f;
    protected Rect mActiveArraySize;
    protected boolean mCancelAutoFocusIfMove;
    protected int mDisplayOrientation;
    protected MeteringRectangle[] mFocusArea;
    protected boolean mInitialized = false;
    protected Matrix mMatrix = new Matrix();
    protected MeteringRectangle[] mMeteringArea;
    protected boolean mMirror;
    protected int mPreviewHeight;
    protected int mPreviewWidth;
    protected int mRenderHeight;
    protected int mRenderWidth;
    protected int mState = 0;

    public abstract void setPreviewSize(int i, int i2);

    protected void setMatrix() {
        if (this.mPreviewWidth != 0 && this.mPreviewHeight != 0) {
            Matrix matrix = new Matrix();
            Util.prepareMatrix(matrix, this.mMirror, this.mDisplayOrientation, this.mRenderWidth, this.mRenderHeight, Math.round(((float) this.mPreviewWidth) / 2.0f), Math.round(((float) this.mPreviewHeight) / 2.0f), this.mActiveArraySize.width(), this.mActiveArraySize.height());
            matrix.invert(this.mMatrix);
            this.mInitialized = true;
        }
    }

    public int getPreviewWidth() {
        return this.mPreviewWidth;
    }

    public int getPreviewHeight() {
        return this.mPreviewHeight;
    }

    public void setRenderSize(int i, int i2) {
        if (i != this.mRenderWidth || i2 != this.mRenderHeight) {
            this.mRenderWidth = i;
            this.mRenderHeight = i2;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mRenderWidth);
            stringBuilder.append(" | ");
            stringBuilder.append(this.mRenderHeight);
            Log.e("focus setRenderSize: ", stringBuilder.toString());
            setMatrix();
        }
    }

    protected void calculateTapArea(int i, int i2, float f, int i3, int i4, int i5, int i6, Rect rect) {
        i = (int) (((float) i) * f);
        i2 = (int) (((float) i2) * f);
        i3 = Util.clamp(i3 - (i / 2), 0, i5 - i);
        int clamp = Util.clamp(i4 - (i2 / 2), 0, i6 - i2);
        Util.rectFToRect(new RectF((float) i3, (float) clamp, (float) (i3 + i), (float) (clamp + i2)), rect);
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
        setMatrix();
    }

    public void setDisplayOrientation(int i) {
        this.mDisplayOrientation = i;
        setMatrix();
    }
}
