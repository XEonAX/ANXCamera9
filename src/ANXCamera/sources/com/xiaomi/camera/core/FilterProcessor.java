package com.xiaomi.camera.core;

import android.media.Image;
import android.support.annotation.NonNull;
import android.util.Size;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawYuvAttribute;
import com.android.camera.effect.renders.DualWatermarkParam;
import com.android.camera.effect.renders.SnapshotRender;
import com.android.camera.log.Log;

public class FilterProcessor {
    private static final String TAG = FilterProcessor.class.getSimpleName();
    private Size mRenderSize = new Size(0, 0);
    private SnapshotRender mYuvSnapshotRender;

    public void init(Size size) {
        releaseEffectProcessor();
        this.mYuvSnapshotRender = new SnapshotRender(size);
        this.mRenderSize = size;
    }

    public void deInit() {
        releaseEffectProcessor();
    }

    public Image doFilterSync(@NonNull ParallelTaskData parallelTaskData, @NonNull Image image, @NonNull int i) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        if (shouldApplyEffect(parallelTaskData)) {
            prepareEffectProcessor(dataParameter);
            boolean z = i == 0 && isWatermarkEnabled(parallelTaskData);
            this.mYuvSnapshotRender.processImageSync(getDrawYuvAttribute(image, z, parallelTaskData));
        }
        return image;
    }

    private void prepareEffectProcessor(ParallelTaskDataParameter parallelTaskDataParameter) {
        int filterId = parallelTaskDataParameter.getFilterId();
        Size pictureSize = parallelTaskDataParameter.getPictureSize();
        DualWatermarkParam dualWatermarkParam = parallelTaskDataParameter.getDualWatermarkParam();
        if (this.mYuvSnapshotRender == null || !this.mRenderSize.equals(pictureSize)) {
            init(pictureSize);
        }
        Log.d(TAG, String.format("prepareEffectProcessor: %x", new Object[]{Integer.valueOf(filterId)}));
        this.mYuvSnapshotRender.prepareEffectRender(dualWatermarkParam, filterId);
    }

    private boolean isWatermarkEnabled(ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        return dataParameter.isHasDualWaterMark() || dataParameter.getTimeWaterMarkString() != null || dataParameter.isAgeGenderAndMagicMirrorWater();
    }

    private boolean shouldApplyEffect(@NonNull ParallelTaskData parallelTaskData) {
        return FilterInfo.FILTER_ID_NONE != parallelTaskData.getDataParameter().getFilterId() || isWatermarkEnabled(parallelTaskData);
    }

    private void releaseEffectProcessor() {
        if (this.mYuvSnapshotRender != null) {
            this.mYuvSnapshotRender.release();
            this.mYuvSnapshotRender = null;
        }
    }

    private static DrawYuvAttribute getDrawYuvAttribute(Image image, boolean z, ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        return new DrawYuvAttribute(image, dataParameter.getPreviewSize(), dataParameter.getPictureSize(), dataParameter.getFilterId(), dataParameter.getOrientation(), dataParameter.getJpegRotation(), dataParameter.getShootRotation(), System.currentTimeMillis(), dataParameter.isMirror(), z, dataParameter.isGradienterOn(), dataParameter.getTiltShiftMode(), dataParameter.getTimeWaterMarkString(), EffectController.getInstance().copyEffectRectAttribute(), dataParameter.getFaceWaterMarkList());
    }
}
