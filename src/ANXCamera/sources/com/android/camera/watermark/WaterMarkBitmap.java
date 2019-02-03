package com.android.camera.watermark;

import android.graphics.Bitmap;
import com.android.camera.log.Log;
import java.util.List;

public class WaterMarkBitmap {
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
        int watermarkType = ((WaterMarkData) this.mWaterInfos.get(0)).getWatermarkType();
        switch (watermarkType) {
            case 1:
                this.mWaterMarkDrawable = new MagicMirrorWaterMarkDrawable(this.mWaterInfos);
                waterMarkData = this.mWaterMarkDrawable.getWaterMarkData();
                break;
            case 2:
                this.mWaterMarkDrawable = new AgeGenderWaterMarkDrawable(this.mWaterInfos);
                waterMarkData = this.mWaterMarkDrawable.getWaterMarkData();
                break;
            default:
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected watermark type ");
                stringBuilder.append(watermarkType);
                Log.w(str, stringBuilder.toString());
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
