package com.android.camera.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.RelativeLayout.LayoutParams;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.module.ModuleManager;

public class V6PreviewFrame extends V6RelativeLayout {
    public SplitLineDrawer mReferenceGrid;

    public V6PreviewFrame(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void onCameraOpen() {
        super.onCameraOpen();
    }

    public void onResume() {
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
}
