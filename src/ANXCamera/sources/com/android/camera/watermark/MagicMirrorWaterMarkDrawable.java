package com.android.camera.watermark;

import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.Drawable;
import com.android.camera.CameraAppImpl;
import com.oneplus.camera.R;
import java.util.List;

public class MagicMirrorWaterMarkDrawable extends BaseWaterMarkDrawable {
    private static final int MAGIC_MIRROR_RECT_COLOR = -18377;
    private Drawable mBeautyScoreIc;
    private Paint mFaceRectPaint;
    private int mHonPadding;
    private Drawable mMagicMirrorInfoPop;

    public MagicMirrorWaterMarkDrawable(List<WaterMarkData> list) {
        super(list);
    }

    protected void initBeforeDraw() {
        this.mMagicMirrorInfoPop = this.mContext.getResources().getDrawable(R.drawable.magic_mirror_info_pop);
        this.mBeautyScoreIc = this.mContext.getResources().getDrawable(R.drawable.ic_beauty_score);
        this.mFaceRectPaint = new Paint();
        this.mFaceRectPaint.setAntiAlias(true);
        this.mFaceRectPaint.setStrokeWidth((float) CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.face_rect_width));
        this.mFaceRectPaint.setStyle(Style.STROKE);
        this.mFaceRectPaint.setColor(MAGIC_MIRROR_RECT_COLOR);
        this.mFacePopupBottom = (int) (((double) this.mMagicMirrorInfoPop.getIntrinsicHeight()) * 0.12d);
        this.mHonPadding = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_female_hon_padding);
        this.mVerPadding = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_ver_padding);
    }

    protected Paint getFaceRectPaint(WaterMarkData waterMarkData) {
        return this.mFaceRectPaint;
    }

    protected int getHonPadding(WaterMarkData waterMarkData) {
        return this.mHonPadding;
    }

    protected Drawable getTopBackgroundDrawable(WaterMarkData waterMarkData) {
        return this.mMagicMirrorInfoPop;
    }

    protected Drawable getTopIndicatorDrawable(WaterMarkData waterMarkData) {
        return this.mBeautyScoreIc;
    }
}
