package org.jcodec.common.model;

import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public final class Label {
    public static final Label Ambisonic_W = new Label(200);
    public static final Label Ambisonic_X = new Label(201);
    public static final Label Ambisonic_Y = new Label(202);
    public static final Label Ambisonic_Z = new Label(203);
    public static final Label Center = new Label(3);
    public static final Label CenterSurround = new Label(9);
    public static final Label CenterSurroundDirect = new Label(44);
    public static final Label ClickTrack = new Label(304);
    public static final Label DialogCentricMix = new Label(43);
    public static final Label Discrete = new Label(MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME);
    public static final Label Discrete_0 = new Label(65536);
    public static final Label Discrete_1 = new Label(65537);
    public static final Label Discrete_10 = new Label(65546);
    public static final Label Discrete_11 = new Label(65547);
    public static final Label Discrete_12 = new Label(65548);
    public static final Label Discrete_13 = new Label(65549);
    public static final Label Discrete_14 = new Label(65550);
    public static final Label Discrete_15 = new Label(65551);
    public static final Label Discrete_2 = new Label(65538);
    public static final Label Discrete_3 = new Label(65539);
    public static final Label Discrete_4 = new Label(65540);
    public static final Label Discrete_5 = new Label(65541);
    public static final Label Discrete_6 = new Label(65542);
    public static final Label Discrete_65535 = new Label(131071);
    public static final Label Discrete_7 = new Label(65543);
    public static final Label Discrete_8 = new Label(65544);
    public static final Label Discrete_9 = new Label(65545);
    public static final Label ForeignLanguage = new Label(305);
    public static final Label HeadphonesLeft = new Label(301);
    public static final Label HeadphonesRight = new Label(302);
    public static final Label HearingImpaired = new Label(40);
    public static final Label LFE2 = new Label(37);
    public static final Label LFEScreen = new Label(4);
    public static final Label Left = new Label(1);
    public static final Label LeftCenter = new Label(7);
    public static final Label LeftSurround = new Label(5);
    public static final Label LeftSurroundDirect = new Label(10);
    public static final Label LeftTotal = new Label(38);
    public static final Label LeftWide = new Label(35);
    public static final Label MS_Mid = new Label(204);
    public static final Label MS_Side = new Label(205);
    public static final Label Mono = new Label(42);
    public static final Label Narration = new Label(41);
    public static final Label RearSurroundLeft = new Label(33);
    public static final Label RearSurroundRight = new Label(34);
    public static final Label Right = new Label(2);
    public static final Label RightCenter = new Label(8);
    public static final Label RightSurround = new Label(6);
    public static final Label RightSurroundDirect = new Label(11);
    public static final Label RightTotal = new Label(39);
    public static final Label RightWide = new Label(36);
    public static final Label TopBackCenter = new Label(17);
    public static final Label TopBackLeft = new Label(16);
    public static final Label TopBackRight = new Label(18);
    public static final Label TopCenterSurround = new Label(12);
    public static final Label Unknown = new Label(-1);
    public static final Label Unused = new Label(0);
    public static final Label UseCoordinates = new Label(100);
    public static final Label VerticalHeightCenter = new Label(14);
    public static final Label VerticalHeightLeft = new Label(13);
    public static final Label VerticalHeightRight = new Label(15);
    public static final Label XY_X = new Label(206);
    public static final Label XY_Y = new Label(207);
    private static final List<Label> _values = new ArrayList();
    public static final Pattern channelMappingRegex = Pattern.compile("[_\\ \\.][a-zA-Z]+$");
    public final long bitmapVal;
    final int labelVal;

    private Label(int i) {
        this.labelVal = i;
        long j = (this.labelVal > 18 || this.labelVal < 1) ? 0 : (long) (1 << (this.labelVal - 1));
        this.bitmapVal = j;
        _values.add(this);
    }

    public static Label[] values() {
        return (Label[]) _values.toArray(new Label[0]);
    }

    public static Label getByVal(int i) {
        Label[] values = values();
        for (Label label : values) {
            if (label.labelVal == i) {
                return label;
            }
        }
        return Mono;
    }

    public int getVal() {
        return this.labelVal;
    }
}
