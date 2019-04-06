package com.arcsoft.avatar.a;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import java.nio.IntBuffer;

/* compiled from: TextureHelper */
public class h {
    private int[] a = new int[1];

    public void a(Bitmap bitmap) {
        GLES20.glBindTexture(3553, this.a[0]);
        GLUtils.texImage2D(3553, 0, bitmap, 0);
        GLES20.glBindTexture(3553, 0);
    }

    public void deleteTexture() {
        GLES20.glDeleteTextures(this.a.length, IntBuffer.wrap(this.a));
    }

    public int getTextureId() {
        if (this.a[0] != 0) {
            return this.a[0];
        }
        throw new RuntimeException("Error generating texture name.");
    }

    public void s() {
        GLES20.glGenTextures(this.a.length, this.a, 0);
        if (this.a[0] != 0) {
            GLES20.glBindTexture(3553, this.a[0]);
            GLES20.glTexParameteri(3553, 10241, 9728);
            GLES20.glTexParameteri(3553, 10240, 9728);
            GLES20.glBindTexture(3553, 0);
            return;
        }
        throw new RuntimeException("Error generating texture name.");
    }
}
