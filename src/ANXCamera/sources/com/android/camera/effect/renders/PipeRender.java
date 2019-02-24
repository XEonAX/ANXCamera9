package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawBasicTexAttribute;
import com.android.camera.effect.draw_mode.DrawIntTexAttribute;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.GLCanvas;
import java.util.List;
import java.util.Locale;

public class PipeRender extends RenderGroup {
    private static final boolean DUMP_TEXTURE = false;
    private static final String TAG = PipeRender.class.getSimpleName();
    private int mBufferHeight;
    private int mBufferWidth;
    private int[] mFrameBufferTextures;
    private int[] mFrameBuffers;

    public PipeRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public PipeRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    public boolean draw(DrawAttribute drawAttribute) {
        DrawAttribute drawAttribute2 = drawAttribute;
        if (this.mFrameBuffers == null || this.mFrameBufferTextures == null) {
            Log.e(TAG, "framebuffer hasn't been initialized");
            return false;
        }
        int i;
        int i2;
        int i3;
        int i4;
        int id;
        int i5;
        boolean z;
        int target = drawAttribute.getTarget();
        if (target != 11) {
            boolean z2;
            switch (target) {
                case 5:
                    DrawBasicTexAttribute drawBasicTexAttribute = (DrawBasicTexAttribute) drawAttribute2;
                    i = drawBasicTexAttribute.mX;
                    i2 = drawBasicTexAttribute.mY;
                    i3 = drawBasicTexAttribute.mWidth;
                    i4 = drawBasicTexAttribute.mHeight;
                    id = drawBasicTexAttribute.mBasicTexture.getId();
                    z2 = drawBasicTexAttribute.mIsSnapshot;
                    break;
                case 6:
                    DrawIntTexAttribute drawIntTexAttribute = (DrawIntTexAttribute) drawAttribute2;
                    i = drawIntTexAttribute.mX;
                    i2 = drawIntTexAttribute.mY;
                    i3 = drawIntTexAttribute.mWidth;
                    i4 = drawIntTexAttribute.mHeight;
                    id = drawIntTexAttribute.mTexId;
                    z2 = drawIntTexAttribute.mIsSnapshot;
                    break;
                default:
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("unsupported target ");
                    stringBuilder.append(target);
                    Log.w(str, stringBuilder.toString());
                    i5 = 0;
                    i = 0;
                    i2 = 0;
                    i3 = 0;
                    i4 = 0;
                    z = false;
                    break;
            }
            z = z2;
            i5 = id;
        } else {
            DrawYuvAttribute drawYuvAttribute = (DrawYuvAttribute) drawAttribute2;
            i = drawYuvAttribute.mPictureSize.getWidth();
            i4 = drawYuvAttribute.mPictureSize.getHeight();
            i3 = i;
            i5 = 0;
            i = 0;
            i2 = 0;
            z = true;
        }
        if (i3 == 0 || i4 == 0) {
            Log.e(TAG, String.format(Locale.ENGLISH, "invalid size: %dx%d", new Object[]{Integer.valueOf(i3), Integer.valueOf(i4)}));
            return false;
        }
        int i6 = this.mBufferWidth;
        int i7 = this.mBufferHeight;
        List renders = getRenders();
        if (renders != null) {
            int size = renders.size();
            DrawAttribute drawAttribute3 = null;
            id = 0;
            while (id < size) {
                int i8;
                int i9;
                List list;
                Object obj;
                DrawAttribute drawIntTexAttribute2;
                int i10;
                int i11;
                Render render = (Render) renders.get(id);
                Object obj2 = id < size + -1 ? 1 : null;
                if (obj2 != null) {
                    i8 = size;
                    beginBindFrameBuffer(this.mFrameBuffers[id], i6, i7);
                } else {
                    i8 = size;
                }
                int i12;
                int i13;
                if (id != 0) {
                    i9 = id;
                    list = renders;
                    i12 = i7;
                    i13 = i6;
                    obj = 11;
                    render.setPreviousFrameBufferInfo(this.mFrameBuffers[i9 - 1], i6, i7);
                    if (obj2 == null) {
                        drawAttribute3.mX = i;
                        drawAttribute3.mY = i2;
                        drawAttribute3.mWidth = i3;
                        drawAttribute3.mHeight = i4;
                    }
                    render.draw(drawAttribute3);
                } else if (11 == target || obj2 == null) {
                    i9 = id;
                    obj = 11;
                    list = renders;
                    i12 = i7;
                    i13 = i6;
                    render.draw(drawAttribute2);
                    i7 = i12;
                    i6 = i13;
                } else {
                    i9 = id;
                    obj = 11;
                    list = renders;
                    i12 = i7;
                    i13 = i6;
                    drawIntTexAttribute2 = new DrawIntTexAttribute(i5, 0, 0, i6, i12, z);
                    render.draw(drawIntTexAttribute2);
                    i7 = i12;
                }
                if (obj2 != null) {
                    i10 = i7;
                    i11 = i6;
                    drawIntTexAttribute2 = new DrawIntTexAttribute(this.mFrameBufferTextures[i9], 0, 0, i6, i10, z);
                    endBindFrameBuffer();
                } else {
                    i10 = i7;
                    i11 = i6;
                }
                id = i9 + 1;
                i6 = i11;
                i7 = i10;
                size = i8;
                obj2 = obj;
                renders = list;
            }
        }
        return true;
    }

    public void setFrameBufferSize(int i, int i2) {
        if (this.mBufferWidth != i || this.mBufferHeight != i2) {
            this.mBufferWidth = i;
            this.mBufferHeight = i2;
            reInitFrameBuffers(i, i2);
        }
    }

    public void addRender(Render render) {
        super.addRender(render);
        int renderSize = getRenderSize() - 1;
        if ((this.mFrameBuffers == null || renderSize > this.mFrameBuffers.length) && this.mBufferWidth > 0 && this.mBufferHeight > 0) {
            reInitFrameBuffers(this.mBufferWidth, this.mBufferHeight);
        }
    }

    public void deleteBuffer() {
        super.deleteBuffer();
        destroyFrameBuffers();
    }

    public void reInitFrameBuffers(int i, int i2) {
        destroyFrameBuffers();
        initFrameBuffers(Math.max(2, getRenderSize() - 1), i, i2);
    }

    private synchronized void destroyFrameBuffers() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("destroyFrameBuffers: count=");
        stringBuilder.append(this.mFrameBuffers == null ? 0 : this.mFrameBuffers.length);
        Log.v(str, stringBuilder.toString());
        if (this.mFrameBufferTextures != null) {
            GLES20.glDeleteTextures(this.mFrameBufferTextures.length, this.mFrameBufferTextures, 0);
            this.mFrameBufferTextures = null;
        }
        if (this.mFrameBuffers != null) {
            GLES20.glDeleteFramebuffers(this.mFrameBuffers.length, this.mFrameBuffers, 0);
            this.mFrameBuffers = null;
        }
    }

    private synchronized void initFrameBuffers(int i, int i2, int i3) {
        int i4 = i;
        synchronized (this) {
            if (i4 <= 0) {
                return;
            }
            Log.v(TAG, String.format(Locale.ENGLISH, "initFrameBuffers: count=%d size=%dx%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3)}));
            this.mFrameBuffers = new int[i4];
            this.mFrameBufferTextures = new int[i4];
            for (int i5 = 0; i5 < i4; i5++) {
                GLES20.glGenFramebuffers(1, this.mFrameBuffers, i5);
                GLES20.glGenTextures(1, this.mFrameBufferTextures, i5);
                GLES20.glBindTexture(3553, this.mFrameBufferTextures[i5]);
                GLES20.glTexImage2D(3553, 0, 6408, i2, i3, 0, 6408, 5121, null);
                GLES20.glTexParameterf(3553, 10240, 9729.0f);
                GLES20.glTexParameterf(3553, 10241, 9729.0f);
                GLES20.glTexParameterf(3553, 10242, 33071.0f);
                GLES20.glTexParameterf(3553, 10243, 33071.0f);
                GLES20.glBindFramebuffer(36160, this.mFrameBuffers[i5]);
                GLES20.glFramebufferTexture2D(36160, 36064, 3553, this.mFrameBufferTextures[i5], 0);
                Log.v(TAG, String.format(Locale.ENGLISH, "fbo[%d]: %d %d", new Object[]{Integer.valueOf(i5), Integer.valueOf(this.mFrameBuffers[i5]), Integer.valueOf(this.mFrameBufferTextures[i5])}));
                GLES20.glBindTexture(3553, 0);
                GLES20.glBindFramebuffer(36160, 0);
            }
        }
    }
}
