package com.android.camera2.autozoom;

import android.graphics.RectF;
import android.util.Size;

public interface IObjectView {

    public interface IViewInteractive {
        void onViewTapped(RectF rectF);
    }

    void clear(int i);

    void feedData(AutoZoomCaptureResult autoZoomCaptureResult);

    Size getPreviewSize();

    boolean isMoving();

    boolean isViewActive();

    boolean isViewEnabled();

    boolean isViewVisibile();

    void setPreviewSize(Size size);

    void setViewActive(boolean z);

    void setViewEnable(boolean z);

    void setViewVisibility(int i);
}
