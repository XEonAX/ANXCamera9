package com.android.camera.effect.renders;

import android.graphics.Color;
import com.aeonax.camera.R;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectChangedListener;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawAttribute;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.draw_mode.FillRectAttribute;
import com.android.camera.log.Log;
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
            this.mGLCanvas.draw(new FillRectAttribute(0.0f, 0.0f, (float) drawExtTexAttribute.mWidth, (float) drawExtTexAttribute.mHeight, Color.argb(blurAnimationValue, 0, 0, 0)));
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean updatePreviewSecondRender() {
        if (!this.mRenderChanged.booleanValue()) {
            return false;
        }
        synchronized (this.mRenderChangedLock) {
            this.mPreviewSecondRender.clearRenders();
            if (EffectController.getInstance().needDestroyMakeup()) {
                removeCache(FilterInfo.RENDER_ID_MAKEUP);
                EffectController.getInstance().setDestroyMakeup(false);
            }
            Render fetchRender;
            if (this.mIsStickerEnabled) {
                if (this.mEffectId != FilterInfo.FILTER_ID_NONE) {
                    fetchRender = fetchRender(this.mEffectId);
                    if (fetchRender != null) {
                        this.mPreviewSecondRender.addRender(fetchRender);
                    }
                }
                fetchRender = fetchRender(FilterInfo.FILTER_ID_STICKER);
                if (fetchRender != null) {
                    this.mPreviewSecondRender.addRender(fetchRender);
                }
            } else {
                Render fetchRender2;
                Render fetchRender3;
                Render fetchRender4;
                Render render = null;
                if (this.mIsMakeupEnabled) {
                    fetchRender = fetchRender(FilterInfo.RENDER_ID_MAKEUP);
                } else {
                    fetchRender = null;
                }
                if (this.mEffectId != FilterInfo.FILTER_ID_NONE) {
                    fetchRender2 = fetchRender(this.mEffectId);
                } else {
                    fetchRender2 = null;
                }
                if (this.mIsGradienterEnabled) {
                    fetchRender3 = fetchRender(FilterInfo.FILTER_ID_GRADIENTER);
                } else {
                    fetchRender3 = null;
                }
                if (this.mTiltShiftMode != null) {
                    if (CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_circle).equals(this.mTiltShiftMode)) {
                        fetchRender4 = fetchRender(FilterInfo.FILTER_ID_GAUSSIAN);
                    } else if (CameraSettings.getString(R.string.pref_camera_tilt_shift_entryvalue_parallel).equals(this.mTiltShiftMode)) {
                        fetchRender4 = fetchRender(FilterInfo.FILTER_ID_TILTSHIFT);
                    }
                    if (this.mIsFocusPeakEnabled) {
                        render = fetchRender(FilterInfo.FILTER_ID_PEAKINGMF);
                    }
                    if (fetchRender != null && EffectController.getInstance().isBeautyFrameReady()) {
                        this.mPreviewSecondRender.addRender(fetchRender);
                    }
                    if (fetchRender2 != null) {
                        this.mPreviewSecondRender.addRender(fetchRender2);
                    }
                    if (fetchRender3 == null) {
                        this.mPreviewSecondRender.addRender(fetchRender3);
                    } else if (fetchRender4 != null) {
                        this.mPreviewSecondRender.addRender(fetchRender4);
                    } else if (render != null) {
                        this.mPreviewSecondRender.addRender(render);
                    }
                }
                fetchRender4 = null;
                if (this.mIsFocusPeakEnabled) {
                }
                this.mPreviewSecondRender.addRender(fetchRender);
                if (fetchRender2 != null) {
                }
                if (fetchRender3 == null) {
                }
            }
            this.mPreviewSecondRender.setFrameBufferSize(this.mPreviewWidth, this.mPreviewHeight);
            this.mRenderChanged = Boolean.valueOf(false);
        }
        return true;
    }
}
