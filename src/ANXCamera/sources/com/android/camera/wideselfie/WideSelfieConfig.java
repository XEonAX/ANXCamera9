package com.android.camera.wideselfie;

import android.content.Context;
import android.content.res.Resources;
import com.android.camera.R;
import com.android.camera.log.Log;
import java.util.concurrent.atomic.AtomicReference;

public class WideSelfieConfig {
    private static final AtomicReference<WideSelfieConfig> INSTANCE = new AtomicReference();
    public static final String TAG = "WideSelfieConstants";
    public static final int THUMB_BORDER = 1;
    private static final float UI_RATE = 1.3333334f;
    private int mStillPreviewHeight;
    private int mStillPreviewWidth;
    private int mThumbBgHeight;
    private int mThumbBgHeightVertical;
    private int mThumbBgTopMargin;
    private int mThumbBgTopMarginVertical;
    private int mThumbBgWidth;
    private int mThumbBgWidthVertical;
    private int mThumbViewHeight;
    private int mThumbViewHeightVertical;
    private int mThumbViewTopMargin;
    private int mThumbViewTopMarginVertical;
    private int mThumbViewWidth;
    private int mThumbViewWidthVertical;

    private WideSelfieConfig(Context context) {
        init(context);
    }

    public static WideSelfieConfig getInstance(Context context) {
        while (true) {
            WideSelfieConfig wideSelfieConfig = (WideSelfieConfig) INSTANCE.get();
            if (wideSelfieConfig != null) {
                return wideSelfieConfig;
            }
            wideSelfieConfig = new WideSelfieConfig(context);
            if (INSTANCE.compareAndSet(null, wideSelfieConfig)) {
                return wideSelfieConfig;
            }
        }
    }

    private void init(Context context) {
        Resources resources = context.getResources();
        this.mStillPreviewWidth = resources.getDimensionPixelOffset(R.dimen.wide_selfie_use_hint_area_top_margin);
        this.mStillPreviewHeight = (int) (((float) this.mStillPreviewWidth) * UI_RATE);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mStillPreviewWidth ");
        stringBuilder.append(this.mStillPreviewWidth);
        stringBuilder.append(", mStillPreviewHeight = ");
        stringBuilder.append(this.mStillPreviewHeight);
        Log.d(str, stringBuilder.toString());
        this.mThumbBgWidth = resources.getDimensionPixelSize(R.dimen.chips_icon_margin_right) + 2;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("mThumbBgWidth ");
        stringBuilder.append(this.mThumbBgWidth);
        stringBuilder.append(", mStillPreviewWidth = ");
        stringBuilder.append(this.mStillPreviewWidth);
        Log.d(str, stringBuilder.toString());
        this.mThumbBgHeight = resources.getDimensionPixelSize(R.dimen.chips_close_padding) + 2;
        this.mThumbBgTopMargin = resources.getDimensionPixelSize(R.dimen.chips_close_margin_left) - 1;
        this.mThumbBgWidthVertical = resources.getDimensionPixelSize(R.dimen.chips_close_margin_right) + 2;
        this.mThumbBgHeightVertical = resources.getDimensionPixelSize(R.dimen.chip_animation_size) + 2;
        this.mThumbBgTopMarginVertical = resources.getDimensionPixelSize(R.dimen.chip_animation_margin_left) - 1;
        this.mThumbViewWidth = this.mThumbBgWidth + this.mStillPreviewWidth;
        this.mThumbViewHeight = this.mThumbBgHeight + this.mStillPreviewWidth;
        this.mThumbViewTopMargin = (this.mThumbBgTopMargin + 1) - (this.mStillPreviewWidth / 2);
        this.mThumbViewWidthVertical = this.mThumbBgWidthVertical + this.mStillPreviewHeight;
        this.mThumbViewHeightVertical = this.mThumbBgHeightVertical + this.mStillPreviewHeight;
        this.mThumbViewTopMarginVertical = (this.mThumbBgTopMarginVertical + 1) - (this.mStillPreviewHeight / 2);
    }

    public int getStillPreviewHeight() {
        return this.mStillPreviewHeight;
    }

    public int getStillPreviewWidth() {
        return this.mStillPreviewWidth;
    }

    public int getThumbBgHeight() {
        return this.mThumbBgHeight;
    }

    public int getThumbBgHeightVertical() {
        return this.mThumbBgHeightVertical;
    }

    public int getThumbBgTopMargin() {
        return this.mThumbBgTopMargin;
    }

    public int getThumbBgTopMarginVertical() {
        return this.mThumbBgTopMarginVertical;
    }

    public int getThumbBgWidth() {
        return this.mThumbBgWidth;
    }

    public int getThumbBgWidthVertical() {
        return this.mThumbBgWidthVertical;
    }

    public int getThumbViewHeight() {
        return this.mThumbViewHeight;
    }

    public int getThumbViewHeightVertical() {
        return this.mThumbViewHeightVertical;
    }

    public int getThumbViewTopMargin() {
        return this.mThumbViewTopMargin;
    }

    public int getThumbViewTopMarginVertical() {
        return this.mThumbViewTopMarginVertical;
    }

    public int getThumbViewWidth() {
        return this.mThumbViewWidth;
    }

    public int getThumbViewWidthVertical() {
        return this.mThumbViewWidthVertical;
    }
}
