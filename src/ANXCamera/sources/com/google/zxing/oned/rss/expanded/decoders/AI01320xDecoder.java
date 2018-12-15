package com.google.zxing.oned.rss.expanded.decoders;

import com.android.camera.constant.DurationConstant;
import com.google.zxing.common.BitArray;

final class AI01320xDecoder extends AI013x0xDecoder {
    AI01320xDecoder(BitArray information) {
        super(information);
    }

    protected void addWeightCode(StringBuilder buf, int weight) {
        if (weight < DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE) {
            buf.append("(3202)");
        } else {
            buf.append("(3203)");
        }
    }

    protected int checkWeight(int weight) {
        if (weight < DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE) {
            return weight;
        }
        return weight - 10000;
    }
}
