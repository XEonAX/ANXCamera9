package com.xiaomi.camera.core;

import android.util.Log;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.effect.renders.DualWatermarkParam;
import com.android.camera.effect.renders.SnapshotRender;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.xiaomi.camera.imagecodec.MiImage;
import com.xiaomi.camera.imagecodec.MiImage.Plane;
import java.nio.ByteBuffer;

public class FilterProcessor {
    private static final String TAG = FilterProcessor.class.getSimpleName();
    private int mHeight;
    private int mWidth;
    private SnapshotRender mYuvSnapshotRender;

    public void init(int i, int i2) {
        prepareEffectProcessor(FilterInfo.FILTER_ID_NONE, i, i2);
    }

    public void deInit() {
        releaseEffectProcessor();
    }

    public MiImage doFilterSync(ParallelTaskData parallelTaskData, MiImage miImage, int i) {
        if (shouldApplyEffect(parallelTaskData)) {
            prepareEffectProcessor(parallelTaskData.getFilterId(), parallelTaskData.getPreviewWidth(), parallelTaskData.getPictureHeight());
            Plane[] planes = miImage.getPlanes();
            ByteBuffer buffer = planes[0].getBuffer();
            ByteBuffer buffer2 = planes[1].getBuffer();
            boolean z = 1 == i && isWatermarkEnabled(parallelTaskData);
            this.mYuvSnapshotRender.processImageSync(getDrawYuvAttribute(buffer, buffer2, z, false, null, parallelTaskData));
        }
        return miImage;
    }

    private void prepareEffectProcessor(int i, int i2, int i3) {
        Log.d(TAG, String.format("prepareEffectProcessor: %x", new Object[]{Integer.valueOf(i)}));
        if (!(this.mYuvSnapshotRender != null && this.mWidth == i2 && this.mHeight == i3)) {
            this.mYuvSnapshotRender = new SnapshotRender(new DualWatermarkParam(CameraSettings.getDualCameraWaterMarkFilePathVendor(), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO), CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO)), i2, i3);
            this.mWidth = i2;
            this.mHeight = i3;
        }
        if (FilterInfo.FILTER_ID_NONE != i) {
            this.mYuvSnapshotRender.prepareEffectRender(i);
        }
    }

    private boolean isWatermarkEnabled(ParallelTaskData parallelTaskData) {
        return parallelTaskData.isHasDualWaterMark() || parallelTaskData.getTimeWaterMarkString() != null || parallelTaskData.isAgeGenderAndMagicMirrorWater();
    }

    private boolean shouldApplyEffect(ParallelTaskData parallelTaskData) {
        return FilterInfo.FILTER_ID_NONE != parallelTaskData.getFilterId() || isWatermarkEnabled(parallelTaskData);
    }

    private void releaseEffectProcessor() {
        if (this.mYuvSnapshotRender != null) {
            this.mYuvSnapshotRender.release();
            this.mYuvSnapshotRender = null;
        }
    }

    private DrawYuvAttribute getDrawYuvAttribute(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, boolean z, boolean z2, String str, ParallelTaskData parallelTaskData) {
        return new DrawYuvAttribute(byteBuffer, byteBuffer2, parallelTaskData.getPreviewWidth(), parallelTaskData.getPreviewHeight(), parallelTaskData.getPictureWidth(), parallelTaskData.getPictureHeight(), parallelTaskData.getFilterId(), parallelTaskData.getOrientation(), parallelTaskData.getJpegRotation(), parallelTaskData.getShootRotation(), System.currentTimeMillis(), parallelTaskData.isMirror(), z, z2, str, parallelTaskData.getTimeWaterMarkString(), EffectController.getInstance().copyEffectRectAttribute(), parallelTaskData.getFaceWaterMarkList());
    }
}
