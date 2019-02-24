package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.GLCanvas;
import com.miui.filtersdk.filter.NewBeautificationFilter;
import com.miui.filtersdk.filter.base.GPUImageFilter;
import com.miui.filtersdk.utils.TextureRotationUtil;
import java.util.Locale;

public class BeautificationWrapperRender extends WrapperRender {
    private static final String TAG = BeautificationWrapperRender.class.getSimpleName();
    private NoneEffectRender mSimpleRender;

    public BeautificationWrapperRender(GLCanvas gLCanvas, int i, GPUImageFilter gPUImageFilter, boolean z) {
        super(gLCanvas, i, gPUImageFilter);
        this.mSimpleRender = new NoneEffectRender(gLCanvas);
        adjustSize(z);
    }

    public void adjustSize(boolean z) {
        if (z) {
            TextureRotationUtil.adjustSize(90, false, false, this.mVertexBuffer, this.mTexCoorBuffer);
        } else {
            TextureRotationUtil.adjustSize(270, false, true, this.mVertexBuffer, this.mTexCoorBuffer);
        }
    }

    public void setBuffer(byte[] bArr, int i, int i2) {
        if (this.mFilter instanceof NewBeautificationFilter) {
            ((NewBeautificationFilter) this.mFilter).passPreviewFrameToTexture(bArr, i, i2);
        }
    }

    protected void drawTexture(BasicTexture basicTexture, float f, float f2, float f3, float f4) {
        int onDrawToTexture = this.mFilter.onDrawToTexture(basicTexture.getId(), this.mVertexBuffer, this.mTexCoorBuffer);
        if (onDrawToTexture == -1) {
            onDrawToTexture = basicTexture.getId();
        }
        int i = onDrawToTexture;
        GLES20.glDisable(2884);
        drawToFrameBuffer(i, f, f2, f3, f4);
    }

    protected void drawTexture(int i, float f, float f2, float f3, float f4) {
        int onDrawToTexture = this.mFilter.onDrawToTexture(i, this.mVertexBuffer, this.mTexCoorBuffer);
        int i2 = onDrawToTexture == -1 ? i : onDrawToTexture;
        GLES20.glDisable(2884);
        drawToFrameBuffer(i2, f, f2, f3, f4);
    }

    private void drawToFrameBuffer(int i, float f, float f2, float f3, float f4) {
        if (this.mParentFrameBufferId != 0) {
            GLES20.glBindFramebuffer(36160, this.mParentFrameBufferId);
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        }
        this.mSimpleRender.drawTexture(i, f, f2, f3, f4, false);
    }

    public void setViewportSize(int i, int i2) {
        super.setViewportSize(i, i2);
        this.mSimpleRender.setViewportSize(i, i2);
    }

    public void setPreviewSize(int i, int i2) {
        super.setPreviewSize(i, i2);
        this.mSimpleRender.setPreviewSize(i, i2);
        this.mFilter.onDisplaySizeChanged(i, i2);
    }

    private void dumpGLParams(String str) {
        boolean glIsEnabled = GLES20.glIsEnabled(2884);
        int[] iArr = new int[1];
        GLES20.glGetIntegerv(2885, iArr, 0);
        int i = iArr[0];
        GLES20.glGetIntegerv(2886, iArr, 0);
        int i2 = iArr[0];
        GLES20.glGetIntegerv(34016, iArr, 0);
        int i3 = iArr[0];
        GLES20.glGetIntegerv(32873, iArr, 0);
        int i4 = iArr[0];
        GLES20.glGetIntegerv(36006, iArr, 0);
        int i5 = iArr[0];
        GLES20.glGetIntegerv(2978, new int[4], 0);
        String str2 = TAG;
        Locale locale = Locale.ENGLISH;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("cullFace=%b faceMode=0x%x frontFace=0x%x activeTex=0x%x bindTex=%d bindBuf=%d viewport=[%d %d %d %d]");
        Log.d(str2, String.format(locale, stringBuilder.toString(), new Object[]{Boolean.valueOf(glIsEnabled), Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(i4), Integer.valueOf(i5), Integer.valueOf(r9[0]), Integer.valueOf(r9[1]), Integer.valueOf(r9[2]), Integer.valueOf(r9[3])}));
    }
}
