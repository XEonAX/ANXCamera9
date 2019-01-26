package com.android.camera.effect.renders;

import android.opengl.GLES20;
import com.aeonax.camera.R;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.gallery3d.ui.GLCanvas;

public class GradienterEffectRender extends PixelEffectRender {
    private static final float FILTER = 0.7f;
    private static final String PREVIEW_FRAG = "precision highp float; \nvarying vec2 vTexCoord; \nuniform sampler2D sTexture; \nuniform float sAngle; \nuniform vec2 vTexSize; \nuniform vec2 vTargetSize; \nuniform vec2 vTargetCenter; \nuniform float uAlpha; \nvoid main() \n{ \n  vec4 color = texture2D(sTexture, vTexCoord); \n  if (sAngle != 0.0) { \n    float pf = min(vTargetSize.s,vTargetSize.t) / max(vTargetSize.s,vTargetSize.t); \n    float mOrigin = atan(pf); \n    float rorate_angle = -sAngle; \n    float fangle = radians(abs(rorate_angle)) + mOrigin; \n    float s = sin(mOrigin) / sin(fangle);\n    s = 1.0 / s; \n    float center_x = 0.5 * vTexSize.s; \n    float center_y = 0.5 * vTexSize.t; \n    float cosangle = cos(radians(rorate_angle)); \n    float sinangle = sin(radians(rorate_angle)); \n    float x = vTexCoord.s * vTexSize.s; \n    float y = vTexCoord.t * vTexSize.t; \n    float  x1 = x - vTargetCenter.x; \n    float  y1 = y - vTargetCenter.y; \n    x = cosangle * x1 + sinangle * y1 + center_x; \n    y = -1.0 * sinangle * x1 + cosangle * y1 + center_y; \n    x = s * (x - center_x) + center_x - (vTexSize.s - vTargetSize.s) * 0.5; \n     y = s * (y - center_y) + center_y - (vTexSize.t - vTargetSize.t) * 0.5; \n     float dis = min( min(y,vTargetSize.t - y),min(x, vTargetSize.s - x)); \n    float ap = abs(dis) / s /1.0; \n    float a = sqrt(exp(-1.0 * ap * ap)); \n    float yy = float(int(y + 0.5)); \n    float xx = float(int(x + 0.5)); \n    if (yy <= 0.0 || yy >= vTargetSize.t || xx <= 0.0 || xx >= vTargetSize.s) { \n        color = mix(color * 0.4,vec4(1.0,1.0,1.0,1.0),a); \n    } else { \n        color = mix(color,vec4(1.0,1.0,1.0,1.0),a); \n    } \n    color = clamp(color,0.0,1.0); \n  } \n  gl_FragColor = color*uAlpha; \n} \n";
    private static final int SHIFT_THRESHOLD = 5;
    private static final String TAG = "GradienterEffectRender";
    private static final float ZEROING_THRESHOLD = 0.5f;
    private boolean mKeepZero;
    private float mLastRotation = -1.0f;
    private int mShiftTimes;
    private int mSquareModeExtraMargin;
    private int mUniformAngle;
    private int mUniformTargetCenter;
    private int mUniformTargetSize;
    private int mUniformTexSize;
    private boolean mZero;

    public GradienterEffectRender(GLCanvas gLCanvas) {
        super(gLCanvas);
    }

    public GradienterEffectRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
    }

    protected void initShader() {
        super.initShader();
        this.mUniformAngle = GLES20.glGetUniformLocation(this.mProgram, "sAngle");
        this.mUniformTexSize = GLES20.glGetUniformLocation(this.mProgram, "vTexSize");
        this.mUniformTargetSize = GLES20.glGetUniformLocation(this.mProgram, "vTargetSize");
        this.mUniformTargetCenter = GLES20.glGetUniformLocation(this.mProgram, "vTargetCenter");
        this.mSquareModeExtraMargin = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.square_mode_bottom_cover_extra_margin);
    }

    protected void initShaderValue(boolean z) {
        super.initShaderValue(z);
        GLES20.glUniform2f(this.mUniformTexSize, (float) this.mPreviewWidth, (float) this.mPreviewHeight);
        float f = ((float) this.mPreviewWidth) * 0.5f;
        float f2 = ((float) this.mPreviewHeight) * 0.5f;
        if (ModuleManager.isSquareModule()) {
            float min = (float) Math.min(this.mPreviewWidth, this.mPreviewHeight);
            GLES20.glUniform2f(this.mUniformTargetSize, min, min);
            f2 -= (float) ((this.mSquareModeExtraMargin * this.mPreviewWidth) / Util.sWindowWidth);
        } else {
            GLES20.glUniform2f(this.mUniformTargetSize, (float) this.mPreviewWidth, (float) this.mPreviewHeight);
        }
        GLES20.glUniform2f(this.mUniformTargetCenter, f, f2);
        GLES20.glUniform1f(this.mUniformAngle, getRotation());
    }

    public String getFragShaderString() {
        return PREVIEW_FRAG;
    }

    private float getRotation() {
        float deviceRotation = EffectController.getInstance().getDeviceRotation();
        if (deviceRotation < 0.0f) {
            this.mLastRotation = -1.0f;
            return 0.0f;
        }
        boolean z;
        filteRotation(deviceRotation);
        deviceRotation = this.mLastRotation - ((float) EffectController.getInstance().getOrientation());
        if (deviceRotation > 180.0f) {
            deviceRotation -= 360.0f;
        }
        if (Math.abs(deviceRotation) < 0.5f) {
            z = true;
        } else {
            z = false;
        }
        if (z != this.mKeepZero) {
            this.mKeepZero = z;
            this.mShiftTimes = 1;
        } else {
            if (this.mShiftTimes < 5) {
                this.mShiftTimes++;
            }
            if (this.mShiftTimes == 5) {
                this.mZero = this.mKeepZero;
            }
        }
        if (this.mZero) {
            deviceRotation = 0.0f;
        }
        return deviceRotation;
    }

    private void filteRotation(float f) {
        if (this.mLastRotation != -1.0f) {
            if (Math.abs(f - this.mLastRotation) > 180.0f) {
                if (f < this.mLastRotation) {
                    f += 360.0f;
                } else {
                    this.mLastRotation += 360.0f;
                }
            }
            this.mLastRotation = (this.mLastRotation * FILTER) + (0.3f * f);
        } else {
            this.mLastRotation = f;
        }
        while (this.mLastRotation >= 360.0f) {
            this.mLastRotation -= 360.0f;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("filteRotation deviceRotation=");
        stringBuilder.append(f);
        stringBuilder.append(" mLastRotation=");
        stringBuilder.append(this.mLastRotation);
        Log.v(str, stringBuilder.toString());
    }
}
