package com.android.camera.effect.renders;

import android.graphics.Color;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectChangedListener;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.gallery3d.ui.GLCanvas;

public class EffectRenderGroup extends RenderGroup implements EffectChangedListener {
    private static final String TAG = EffectRenderGroup.class.getSimpleName();
    private int mEffectId = FilterInfo.FILTER_ID_NONE;
    private boolean mFirstFrameDrawn;
    private boolean mIsFocusPeakEnabled;
    private boolean mIsGradienterEnabled;
    private boolean mIsMakeupEnabled;
    private boolean mIsStickerEnabled;
    private PipeRenderPair mPreviewPipeRender;
    private PipeRender mPreviewSecondRender;
    private RenderGroup mRenderCaches;
    private Boolean mRenderChanged = new Boolean(false);
    private final Object mRenderChangedLock = new Object();
    private String mTiltShiftMode;

    public EffectRenderGroup(GLCanvas gLCanvas) {
        super(gLCanvas);
        this.mRenderCaches = gLCanvas.getEffectRenderGroup();
        this.mPreviewPipeRender = new PipeRenderPair(gLCanvas);
        this.mPreviewPipeRender.setFirstRender(new SurfaceTextureRender(gLCanvas));
        this.mPreviewSecondRender = new PipeRender(gLCanvas);
        addRender(this.mPreviewPipeRender);
    }

    public boolean draw(DrawAttribute drawAttribute) {
        if (EffectController.getInstance().getEffectForPreview(true) != this.mEffectId && EffectController.getInstance().isBackGroundBlur()) {
            this.mPreviewPipeRender.prepareCopyBlurTexture();
        }
        if (drawAttribute.getTarget() != 8) {
            return false;
        }
        return drawPreview(drawAttribute);
    }

    public void onEffectChanged(int... iArr) {
        synchronized (this.mRenderChangedLock) {
            EffectController instance = EffectController.getInstance();
            DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
            for (int i : iArr) {
                switch (i) {
                    case 1:
                        this.mEffectId = instance.getEffectForPreview(true);
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("onEffectChanged: EFFECT_CHANGE_FILTER mEffectId = ");
                        stringBuilder.append(this.mEffectId);
                        Log.d(str, stringBuilder.toString());
                        break;
                    case 2:
                        this.mIsStickerEnabled = instance.isStickerEnable();
                        break;
                    case 3:
                        this.mIsMakeupEnabled = instance.isMakeupEnable();
                        break;
                    case 4:
                        this.mIsFocusPeakEnabled = instance.isNeedDrawPeaking();
                        break;
                    case 5:
                        if (!instance.isDrawTilt()) {
                            this.mTiltShiftMode = null;
                            break;
                        } else {
                            this.mTiltShiftMode = dataItemRunning.getComponentRunningTiltValue().getComponentValue(160);
                            break;
                        }
                    case 6:
                        this.mIsGradienterEnabled = instance.isDrawGradienter();
                        break;
                    default:
                        break;
                }
            }
            this.mRenderChanged = Boolean.valueOf(true);
        }
    }

    private boolean drawPreview(DrawAttribute drawAttribute) {
        if (!this.mFirstFrameDrawn) {
            this.mFirstFrameDrawn = true;
            setViewportSize(this.mViewportWidth, this.mViewportHeight);
            setPreviewSize(this.mPreviewWidth, this.mPreviewHeight);
        }
        DrawExtTexAttribute drawExtTexAttribute = (DrawExtTexAttribute) drawAttribute;
        if (updatePreviewSecondRender()) {
            if (this.mPreviewSecondRender.getRenderSize() == 0) {
                this.mPreviewPipeRender.setSecondRender(null);
            } else if (this.mPreviewPipeRender.getRenderSize() == 1) {
                this.mPreviewPipeRender.setSecondRender(this.mPreviewSecondRender);
            }
        }
        this.mPreviewPipeRender.setUsedMiddleBuffer(EffectController.getInstance().isBackGroundBlur());
        this.mPreviewPipeRender.draw(drawAttribute);
        drawAnimationMask(drawAttribute);
        return true;
    }

    private void drawAnimationMask(DrawAttribute drawAttribute) {
        int blurAnimationValue = EffectController.getInstance().getBlurAnimationValue();
        if (blurAnimationValue > 0) {
            DrawExtTexAttribute drawExtTexAttribute = (DrawExtTexAttribute) drawAttribute;
            this.mGLCanvas.draw(new FillRectAttribute(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, (float) drawExtTexAttribute.mWidth, (float) drawExtTexAttribute.mHeight, Color.argb(blurAnimationValue, 0, 0, 0)));
        }
    }

    private Render fetchRender(int i) {
        Render render = this.mRenderCaches.getRender(i);
        if (render != null) {
            return render;
        }
        this.mGLCanvas.prepareEffectRenders(false, i);
        return this.mRenderCaches.getRender(i);
    }

    private void removeCache(int i) {
        this.mRenderCaches.removeRender(i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:42:0x00b0  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c9  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00d0  */
    private boolean updatePreviewSecondRender() {
        /*
        r8 = this;
        r0 = r8.mRenderChanged;
        r0 = r0.booleanValue();
        r1 = 0;
        if (r0 != 0) goto L_0x000a;
    L_0x0009:
        return r1;
    L_0x000a:
        r0 = r8.mRenderChangedLock;
        monitor-enter(r0);
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r2.clearRenders();	 Catch:{ all -> 0x00f7 }
        r2 = com.android.camera.effect.EffectController.getInstance();	 Catch:{ all -> 0x00f7 }
        r2 = r2.needDestroyMakeup();	 Catch:{ all -> 0x00f7 }
        if (r2 == 0) goto L_0x002e;
    L_0x0022:
        r2 = com.android.camera.effect.FilterInfo.RENDER_ID_MAKEUP;	 Catch:{ all -> 0x00f7 }
        r8.removeCache(r2);	 Catch:{ all -> 0x00f7 }
        r2 = com.android.camera.effect.EffectController.getInstance();	 Catch:{ all -> 0x00f7 }
        r2.setDestroyMakeup(r1);	 Catch:{ all -> 0x00f7 }
    L_0x002e:
        r2 = r8.mIsStickerEnabled;	 Catch:{ all -> 0x00f7 }
        if (r2 == 0) goto L_0x0054;
    L_0x0032:
        r2 = r8.mEffectId;	 Catch:{ all -> 0x00f7 }
        r3 = com.android.camera.effect.FilterInfo.FILTER_ID_NONE;	 Catch:{ all -> 0x00f7 }
        if (r2 == r3) goto L_0x0045;
    L_0x0038:
        r2 = r8.mEffectId;	 Catch:{ all -> 0x00f7 }
        r2 = r8.fetchRender(r2);	 Catch:{ all -> 0x00f7 }
        if (r2 == 0) goto L_0x0045;
    L_0x0040:
        r3 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r3.addRender(r2);	 Catch:{ all -> 0x00f7 }
    L_0x0045:
        r2 = com.android.camera.effect.FilterInfo.FILTER_ID_STICKER;	 Catch:{ all -> 0x00f7 }
        r2 = r8.fetchRender(r2);	 Catch:{ all -> 0x00f7 }
        if (r2 == 0) goto L_0x00e5;
    L_0x004d:
        r3 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r3.addRender(r2);	 Catch:{ all -> 0x00f7 }
        goto L_0x00e5;
    L_0x0054:
        r2 = r8.mIsMakeupEnabled;	 Catch:{ all -> 0x00f7 }
        r3 = 0;
        if (r2 == 0) goto L_0x0060;
    L_0x0059:
        r2 = com.android.camera.effect.FilterInfo.RENDER_ID_MAKEUP;	 Catch:{ all -> 0x00f7 }
        r2 = r8.fetchRender(r2);	 Catch:{ all -> 0x00f7 }
        goto L_0x0061;
    L_0x0060:
        r2 = r3;
    L_0x0061:
        r4 = r8.mEffectId;	 Catch:{ all -> 0x00f7 }
        r5 = com.android.camera.effect.FilterInfo.FILTER_ID_NONE;	 Catch:{ all -> 0x00f7 }
        if (r4 == r5) goto L_0x006e;
    L_0x0067:
        r4 = r8.mEffectId;	 Catch:{ all -> 0x00f7 }
        r4 = r8.fetchRender(r4);	 Catch:{ all -> 0x00f7 }
        goto L_0x006f;
    L_0x006e:
        r4 = r3;
    L_0x006f:
        r5 = r8.mIsGradienterEnabled;	 Catch:{ all -> 0x00f7 }
        if (r5 == 0) goto L_0x007a;
    L_0x0073:
        r5 = com.android.camera.effect.FilterInfo.FILTER_ID_GRADIENTER;	 Catch:{ all -> 0x00f7 }
        r5 = r8.fetchRender(r5);	 Catch:{ all -> 0x00f7 }
        goto L_0x007b;
    L_0x007a:
        r5 = r3;
    L_0x007b:
        r6 = r8.mTiltShiftMode;	 Catch:{ all -> 0x00f7 }
        if (r6 == 0) goto L_0x00ab;
    L_0x007f:
        r6 = 2131427663; // 0x7f0b014f float:1.8476949E38 double:1.053065185E-314;
        r6 = com.android.camera.CameraSettings.getString(r6);	 Catch:{ all -> 0x00f7 }
        r7 = r8.mTiltShiftMode;	 Catch:{ all -> 0x00f7 }
        r6 = r6.equals(r7);	 Catch:{ all -> 0x00f7 }
        if (r6 == 0) goto L_0x0095;
    L_0x008e:
        r6 = com.android.camera.effect.FilterInfo.FILTER_ID_GAUSSIAN;	 Catch:{ all -> 0x00f7 }
        r6 = r8.fetchRender(r6);	 Catch:{ all -> 0x00f7 }
        goto L_0x00ac;
    L_0x0095:
        r6 = 2131427664; // 0x7f0b0150 float:1.847695E38 double:1.0530651854E-314;
        r6 = com.android.camera.CameraSettings.getString(r6);	 Catch:{ all -> 0x00f7 }
        r7 = r8.mTiltShiftMode;	 Catch:{ all -> 0x00f7 }
        r6 = r6.equals(r7);	 Catch:{ all -> 0x00f7 }
        if (r6 == 0) goto L_0x00ab;
    L_0x00a4:
        r6 = com.android.camera.effect.FilterInfo.FILTER_ID_TILTSHIFT;	 Catch:{ all -> 0x00f7 }
        r6 = r8.fetchRender(r6);	 Catch:{ all -> 0x00f7 }
        goto L_0x00ac;
    L_0x00ab:
        r6 = r3;
    L_0x00ac:
        r7 = r8.mIsFocusPeakEnabled;	 Catch:{ all -> 0x00f7 }
        if (r7 == 0) goto L_0x00b6;
    L_0x00b0:
        r3 = com.android.camera.effect.FilterInfo.FILTER_ID_PEAKINGMF;	 Catch:{ all -> 0x00f7 }
        r3 = r8.fetchRender(r3);	 Catch:{ all -> 0x00f7 }
    L_0x00b6:
        if (r2 == 0) goto L_0x00c7;
    L_0x00b8:
        r7 = com.android.camera.effect.EffectController.getInstance();	 Catch:{ all -> 0x00f7 }
        r7 = r7.isBeautyFrameReady();	 Catch:{ all -> 0x00f7 }
        if (r7 == 0) goto L_0x00c7;
    L_0x00c2:
        r7 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r7.addRender(r2);	 Catch:{ all -> 0x00f7 }
    L_0x00c7:
        if (r4 == 0) goto L_0x00ce;
    L_0x00c9:
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r2.addRender(r4);	 Catch:{ all -> 0x00f7 }
    L_0x00ce:
        if (r5 == 0) goto L_0x00d6;
    L_0x00d0:
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r2.addRender(r5);	 Catch:{ all -> 0x00f7 }
        goto L_0x00e5;
    L_0x00d6:
        if (r6 == 0) goto L_0x00de;
    L_0x00d8:
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r2.addRender(r6);	 Catch:{ all -> 0x00f7 }
        goto L_0x00e5;
    L_0x00de:
        if (r3 == 0) goto L_0x00e5;
    L_0x00e0:
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r2.addRender(r3);	 Catch:{ all -> 0x00f7 }
    L_0x00e5:
        r2 = r8.mPreviewSecondRender;	 Catch:{ all -> 0x00f7 }
        r3 = r8.mPreviewWidth;	 Catch:{ all -> 0x00f7 }
        r4 = r8.mPreviewHeight;	 Catch:{ all -> 0x00f7 }
        r2.setFrameBufferSize(r3, r4);	 Catch:{ all -> 0x00f7 }
        r1 = java.lang.Boolean.valueOf(r1);	 Catch:{ all -> 0x00f7 }
        r8.mRenderChanged = r1;	 Catch:{ all -> 0x00f7 }
        r1 = 1;
        monitor-exit(r0);	 Catch:{ all -> 0x00f7 }
        return r1;
    L_0x00f7:
        r1 = move-exception;
        monitor-exit(r0);	 Catch:{ all -> 0x00f7 }
        throw r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.effect.renders.EffectRenderGroup.updatePreviewSecondRender():boolean");
    }
}
