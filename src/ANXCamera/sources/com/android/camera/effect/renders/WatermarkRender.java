package com.android.camera.effect.renders;

import android.util.Size;
import com.android.camera.watermark.WaterMarkData;
import java.util.List;

public interface WatermarkRender {
    void drawFaceWaterMarkInfos(Size size, Size size2, int i, List<WaterMarkData> list);

    void drawWaterMark(int i, int i2, int i3, int i4, int i5, String str);
}
