package com.android.camera.watermark;

import android.graphics.Bitmap;
import android.util.Log;
import com.android.camera.CameraSettings;
import java.util.List;

public class WaterMarkBitmap {
    private static final int AGE_GENDER_WATER_MARK = 2;
    private static final int MAGIC_MIRROR_WATER_MARK = 1;
    private static final String TAG = WaterMarkBitmap.class.getSimpleName();
    private List<WaterMarkData> mWaterInfos;
    private WaterMarkData mWaterMarkData = generateWaterMarkData();
    private BaseWaterMarkDrawable mWaterMarkDrawable;

    public WaterMarkBitmap(List<WaterMarkData> list) {
        this.mWaterInfos = list;
    }

    public WaterMarkData getWaterMarkData() {
        return this.mWaterMarkData;
    }

    public WaterMarkData generateWaterMarkData() {
        WaterMarkData waterMarkData = null;
        if (this.mWaterInfos == null || this.mWaterInfos.isEmpty()) {
            Log.e(TAG, "The watermark data is empty.");
            return null;
        }
        boolean isAgeGenderWaterMarkOpen = CameraSettings.isAgeGenderWaterMarkOpen();
        boolean isMagicMirrorWaterMarkOpen = CameraSettings.isMagicMirrorWaterMarkOpen();
        Object obj = 2;
        if (!isAgeGenderWaterMarkOpen && isMagicMirrorWaterMarkOpen) {
            obj = 1;
        }
        switch (obj) {
            case 1:
                this.mWaterMarkDrawable = new MagicMirrorWaterMarkDrawable(this.mWaterInfos);
                waterMarkData = this.mWaterMarkDrawable.getWaterMarkData();
                break;
            case 2:
                this.mWaterMarkDrawable = new AgeGenderWaterMarkDrawable(this.mWaterInfos);
                waterMarkData = this.mWaterMarkDrawable.getWaterMarkData();
                break;
        }
        return waterMarkData;
    }

    public void releaseBitmap() {
        if (this.mWaterMarkDrawable != null) {
            Bitmap bitmap = this.mWaterMarkDrawable.getBitmap();
            if (bitmap != null) {
                bitmap.recycle();
            }
        }
    }
}
