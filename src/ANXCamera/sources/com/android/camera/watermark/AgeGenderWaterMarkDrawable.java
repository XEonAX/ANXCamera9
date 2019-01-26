package com.android.camera.watermark;

import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.Drawable;
import com.aeonax.camera.R;
import java.util.List;

public class AgeGenderWaterMarkDrawable extends BaseWaterMarkDrawable {
    private static final int GENDER_FEMALE_RECT_COLOR = -1152383;
    private static final int GENDER_MALE_RECT_COLOR = -9455628;
    private Paint mFaceRectPaint;
    private Drawable mFemaleAgeInfoPop;
    private int mFemaleHonPadding;
    private Drawable mMaleAgeInfoPop;
    private int mMaleHonPadding;
    private Drawable mSexFemaleIc;
    private Drawable mSexMaleIc;

    public AgeGenderWaterMarkDrawable(List<WaterMarkData> list) {
        super(list);
    }

    protected void initBeforeDraw() {
        this.mMaleAgeInfoPop = this.mContext.getResources().getDrawable(R.drawable.male_age_info_pop);
        this.mFemaleAgeInfoPop = this.mContext.getResources().getDrawable(R.drawable.female_age_info_pop);
        this.mSexMaleIc = this.mContext.getResources().getDrawable(R.drawable.ic_sex_male);
        this.mSexFemaleIc = this.mContext.getResources().getDrawable(R.drawable.ic_sex_female);
        this.mFaceRectPaint = new Paint();
        this.mFaceRectPaint.setAntiAlias(true);
        this.mFaceRectPaint.setStrokeWidth((float) this.mContext.getResources().getDimensionPixelSize(R.dimen.face_rect_width));
        this.mFaceRectPaint.setStyle(Style.STROKE);
        this.mFaceRectPaint.setColor(GENDER_MALE_RECT_COLOR);
        this.mMaleHonPadding = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_male_hon_padding);
        this.mFemaleHonPadding = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_female_hon_padding);
        this.mFacePopupBottom = (int) (((double) this.mMaleAgeInfoPop.getIntrinsicHeight()) * 0.12d);
    }

    protected Paint getFaceRectPaint(WaterMarkData waterMarkData) {
        if (waterMarkData.isFemale()) {
            this.mFaceRectPaint.setColor(GENDER_FEMALE_RECT_COLOR);
        } else {
            this.mFaceRectPaint.setColor(GENDER_MALE_RECT_COLOR);
        }
        return this.mFaceRectPaint;
    }

    protected int getHonPadding(WaterMarkData waterMarkData) {
        return waterMarkData.isFemale() ? this.mFemaleHonPadding : this.mMaleHonPadding;
    }

    protected Drawable getTopBackgroundDrawable(WaterMarkData waterMarkData) {
        return waterMarkData.isFemale() ? this.mFemaleAgeInfoPop : this.mMaleAgeInfoPop;
    }

    protected Drawable getTopIndicatorDrawable(WaterMarkData waterMarkData) {
        return waterMarkData.isFemale() ? this.mSexFemaleIc : this.mSexMaleIc;
    }
}
