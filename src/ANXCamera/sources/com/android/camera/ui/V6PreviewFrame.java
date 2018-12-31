package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnLayoutChangeListener;
import android.widget.RelativeLayout.LayoutParams;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.module.ModuleManager;

public class V6PreviewFrame extends V6RelativeLayout implements OnLayoutChangeListener {
    private float mAspectRatio = 1.7777778f;
    public SplitLineDrawer mReferenceGrid;

    public V6PreviewFrame(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void onCameraOpen() {
        super.onCameraOpen();
    }

    public void onResume() {
        if (!(getWidth() == 0 || getHeight() == 0)) {
            this.mAspectRatio = CameraSettings.getPreviewAspectRatio(getHeight(), getWidth());
        }
        if (!ModuleManager.isCameraModule()) {
            this.mReferenceGrid.setVisibility(8);
        }
    }

    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mReferenceGrid = (SplitLineDrawer) findViewById(R.id.v6_reference_grid);
        this.mReferenceGrid.initialize(3, 3);
        this.mReferenceGrid.setBorderVisible(false, false);
        this.mReferenceGrid.setLineColor(-2130706433);
        addOnLayoutChangeListener(this);
    }

    public void setAspectRatio(float f) {
        if (((double) f) <= 0.0d) {
            throw new IllegalArgumentException();
        } else if (((double) Math.abs(this.mAspectRatio - f)) > 0.01d) {
            this.mAspectRatio = f;
        }
    }

    public void updateReferenceLineAccordSquare() {
        LayoutParams layoutParams = (LayoutParams) this.mReferenceGrid.getLayoutParams();
        if (ModuleManager.isSquareModule()) {
            int i = Util.sWindowWidth / 6;
            layoutParams.topMargin = i;
            layoutParams.bottomMargin = i;
        } else {
            layoutParams.topMargin = 0;
            layoutParams.bottomMargin = 0;
        }
        if (this.mReferenceGrid.getVisibility() == 0) {
            this.mReferenceGrid.requestLayout();
        }
    }

    public boolean isFullScreen() {
        return Math.abs(this.mAspectRatio - CameraSettings.getPreviewAspectRatio(Util.sWindowHeight, Util.sWindowWidth)) < 0.1f || Math.abs(((double) this.mAspectRatio) - 1.5d) < 0.10000000149011612d;
    }

    public void updatePreviewGrid() {
        if (isReferenceLineEnabled() && !((ActivityBase) getContext()).getCameraIntentManager().isScanQRCodeIntent() && needReferenceLineMode()) {
            this.mReferenceGrid.setVisibility(0);
        } else {
            this.mReferenceGrid.setVisibility(8);
        }
    }

    public void hidePreviewGrid() {
        if (this.mReferenceGrid.getVisibility() == 0) {
            this.mReferenceGrid.setVisibility(8);
        }
    }

    private boolean needReferenceLineMode() {
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        return currentMode == 163 || currentMode == 167 || currentMode == 171 || currentMode == 173 || currentMode == 165;
    }

    private boolean isReferenceLineEnabled() {
        return DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_REFERENCE_LINE, false);
    }

    public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        i3 -= i;
        i4 -= i2;
        if (i3 <= i4) {
            this.mAspectRatio = CameraSettings.getPreviewAspectRatio(i4, i3);
        }
    }

    protected void onSizeChanged(int i, int i2, int i3, int i4) {
    }
}
