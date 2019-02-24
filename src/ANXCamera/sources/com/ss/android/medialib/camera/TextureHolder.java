package com.ss.android.medialib.camera;

import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import com.ss.android.medialib.common.Common;

public class TextureHolder {
    protected float[] mMPV = new float[16];
    private Texture mTexture = new Texture();
    private OnFrameAvailableListener onFrameAvailableListener;

    public static class Texture {
        private SurfaceTexture surfaceTexture;
        private int surfaceTextureID;

        public Texture(int i, SurfaceTexture surfaceTexture) {
            this.surfaceTextureID = i;
            this.surfaceTexture = surfaceTexture;
        }

        public int getSurfaceTextureID() {
            return this.surfaceTextureID;
        }

        public SurfaceTexture getSurfaceTexture() {
            return this.surfaceTexture;
        }
    }

    public void setOnFrameAvailableListener(OnFrameAvailableListener onFrameAvailableListener) {
        this.onFrameAvailableListener = onFrameAvailableListener;
    }

    public void onCreate(Texture texture) {
        if (texture == null) {
            this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else if (!Common.isTextureID(texture.surfaceTextureID)) {
            this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else if (texture.surfaceTexture == null) {
            this.mTexture.surfaceTextureID = texture.surfaceTextureID;
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else {
            this.mTexture.surfaceTextureID = texture.surfaceTextureID;
            this.mTexture.surfaceTexture = texture.surfaceTexture;
        }
        this.mTexture.surfaceTexture.setOnFrameAvailableListener(new OnFrameAvailableListener() {
            public void onFrameAvailable(SurfaceTexture surfaceTexture) {
                TextureHolder.this.frameAvailable();
            }
        });
    }

    public void frameAvailable() {
        if (this.mTexture.surfaceTexture != null) {
            this.mTexture.surfaceTexture.getTransformMatrix(this.mMPV);
            if (this.onFrameAvailableListener != null) {
                this.onFrameAvailableListener.onFrameAvailable(this.mTexture.surfaceTexture);
            }
        }
    }

    public void onCreate() {
        this.mTexture = new Texture();
        this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
        this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        this.mTexture.surfaceTexture.setOnFrameAvailableListener(new OnFrameAvailableListener() {
            public void onFrameAvailable(SurfaceTexture surfaceTexture) {
                surfaceTexture.getTransformMatrix(TextureHolder.this.mMPV);
                if (TextureHolder.this.onFrameAvailableListener != null) {
                    TextureHolder.this.onFrameAvailableListener.onFrameAvailable(surfaceTexture);
                }
            }
        });
    }

    public void onDestroy(boolean z) {
        if (z) {
            if (this.mTexture.surfaceTexture != null) {
                this.mTexture.surfaceTexture.release();
                this.mTexture.surfaceTexture = null;
            }
            if (Common.isTextureID(this.mTexture.surfaceTextureID)) {
                Common.deleteTextureID(this.mTexture.surfaceTextureID);
                this.mTexture.surfaceTextureID = 0;
            }
        }
    }

    public void updateTexImage() {
        this.mTexture.surfaceTexture.updateTexImage();
    }

    public int getSurfaceTextureID() {
        return this.mTexture.surfaceTextureID;
    }

    public SurfaceTexture getSurfaceTexture() {
        return this.mTexture.surfaceTexture;
    }

    public float[] getMPV() {
        return this.mMPV;
    }

    public Texture getTexture() {
        return this.mTexture;
    }
}
