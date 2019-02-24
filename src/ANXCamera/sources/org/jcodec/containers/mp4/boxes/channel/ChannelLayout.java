package org.jcodec.containers.mp4.boxes.channel;

import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.model.Label;

public final class ChannelLayout {
    private static final List<ChannelLayout> _values = new ArrayList();
    public static final ChannelLayout kCAFChannelLayoutTag_AAC_6_0 = new ChannelLayout(9240582, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_AAC_6_1 = new ChannelLayout(9306119, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.CenterSurround, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_AAC_7_0 = new ChannelLayout(9371655, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.RearSurroundLeft, Label.RearSurroundRight});
    public static final ChannelLayout kCAFChannelLayoutTag_AAC_Octagonal = new ChannelLayout(9437192, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.RearSurroundLeft, Label.RearSurroundRight, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_Ambisonic_B_Format = new ChannelLayout(7012356, new Label[]{Label.Ambisonic_W, Label.Ambisonic_X, Label.Ambisonic_Y, Label.Ambisonic_Z});
    public static final ChannelLayout kCAFChannelLayoutTag_AudioUnit_6_0 = new ChannelLayout(9109510, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_AudioUnit_7_0 = new ChannelLayout(9175047, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.RearSurroundLeft, Label.RearSurroundRight});
    public static final ChannelLayout kCAFChannelLayoutTag_Binaural = new ChannelLayout(6946818, new Label[]{Label.HeadphonesLeft, Label.HeadphonesRight});
    public static final ChannelLayout kCAFChannelLayoutTag_Cube = new ChannelLayout(7340040, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.TopBackLeft, Label.TopBackRight, Label.TopBackCenter, Label.TopCenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_10 = new ChannelLayout(8912900, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_11 = new ChannelLayout(8978437, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_18 = new ChannelLayout(9043973, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_4 = new ChannelLayout(8716291, new Label[]{Label.Left, Label.Right, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_5 = new ChannelLayout(8781828, new Label[]{Label.Left, Label.Right, Label.LFEScreen, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_DVD_6 = new ChannelLayout(8847365, new Label[]{Label.Left, Label.Right, Label.LFEScreen, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_Emagic_Default_7_1 = new ChannelLayout(8454152, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.LFEScreen, Label.LeftCenter, Label.RightCenter});
    public static final ChannelLayout kCAFChannelLayoutTag_Hexagonal = new ChannelLayout(7208966, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_ITU_2_1 = new ChannelLayout(8585219, new Label[]{Label.Left, Label.Right, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_ITU_2_2 = new ChannelLayout(8650756, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_3_0_A = new ChannelLayout(7405571, new Label[]{Label.Left, Label.Right, Label.Center});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_3_0_B = new ChannelLayout(7471107, new Label[]{Label.Center, Label.Left, Label.Right});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_4_0_A = new ChannelLayout(7536644, new Label[]{Label.Left, Label.Right, Label.Center, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_4_0_B = new ChannelLayout(7602180, new Label[]{Label.Center, Label.Left, Label.Right, Label.CenterSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_0_A = new ChannelLayout(7667717, new Label[]{Label.Left, Label.Right, Label.Center, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_0_B = new ChannelLayout(7733253, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_0_C = new ChannelLayout(7798789, new Label[]{Label.Left, Label.Center, Label.Right, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_0_D = new ChannelLayout(7864325, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_1_A = new ChannelLayout(7929862, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_1_B = new ChannelLayout(7995398, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_1_C = new ChannelLayout(8060934, new Label[]{Label.Left, Label.Center, Label.Right, Label.LeftSurround, Label.RightSurround, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_5_1_D = new ChannelLayout(8126470, new Label[]{Label.Center, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_6_1_A = new ChannelLayout(8192007, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.LeftSurround, Label.RightSurround, Label.Right});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_7_1_A = new ChannelLayout(8257544, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.LeftSurround, Label.RightSurround, Label.LeftCenter, Label.RightCenter});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_7_1_B = new ChannelLayout(8323080, new Label[]{Label.Center, Label.LeftCenter, Label.RightCenter, Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.LFEScreen});
    public static final ChannelLayout kCAFChannelLayoutTag_MPEG_7_1_C = new ChannelLayout(8388616, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.LeftSurround, Label.RightSurround, Label.RearSurroundLeft, Label.RearSurroundRight});
    public static final ChannelLayout kCAFChannelLayoutTag_MatrixStereo = new ChannelLayout(6750210, new Label[]{Label.LeftTotal, Label.RightTotal});
    public static final ChannelLayout kCAFChannelLayoutTag_MidSide = new ChannelLayout(6815746, new Label[]{Label.MS_Mid, Label.MS_Side});
    public static final ChannelLayout kCAFChannelLayoutTag_Mono = new ChannelLayout(6553601, new Label[]{Label.Mono});
    public static final ChannelLayout kCAFChannelLayoutTag_Octagonal = new ChannelLayout(7274504, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center, Label.CenterSurround, Label.LeftCenter, Label.RightCenter});
    public static final ChannelLayout kCAFChannelLayoutTag_Pentagonal = new ChannelLayout(7143429, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround, Label.Center});
    public static final ChannelLayout kCAFChannelLayoutTag_Quadraphonic = new ChannelLayout(7077892, new Label[]{Label.Left, Label.Right, Label.LeftSurround, Label.RightSurround});
    public static final ChannelLayout kCAFChannelLayoutTag_RESERVED_DO_NOT_USE = new ChannelLayout(9633792, new Label[0]);
    public static final ChannelLayout kCAFChannelLayoutTag_SMPTE_DTV = new ChannelLayout(8519688, new Label[]{Label.Left, Label.Right, Label.Center, Label.LFEScreen, Label.LeftSurround, Label.RightSurround, Label.LeftTotal, Label.RightTotal});
    public static final ChannelLayout kCAFChannelLayoutTag_Stereo = new ChannelLayout(6619138, new Label[]{Label.Left, Label.Right});
    public static final ChannelLayout kCAFChannelLayoutTag_StereoHeadphones = new ChannelLayout(6684674, new Label[]{Label.HeadphonesLeft, Label.HeadphonesRight});
    public static final ChannelLayout kCAFChannelLayoutTag_TMH_10_2_full = new ChannelLayout(9568277, new Label[]{Label.LeftCenter, Label.RightCenter, Label.Mono, Label.Mono, Label.Mono});
    public static final ChannelLayout kCAFChannelLayoutTag_TMH_10_2_std = new ChannelLayout(9502736, new Label[]{Label.Left, Label.Right, Label.Center, Label.Mono, Label.Mono, Label.Mono, Label.LeftSurround, Label.RightSurround, Label.Mono, Label.Mono, Label.Mono, Label.Mono, Label.Mono, Label.CenterSurround, Label.LFEScreen, Label.LFE2});
    public static final ChannelLayout kCAFChannelLayoutTag_UseChannelBitmap = new ChannelLayout(65536, new Label[0]);
    public static final ChannelLayout kCAFChannelLayoutTag_UseChannelDescriptions = new ChannelLayout(0, new Label[0]);
    public static final ChannelLayout kCAFChannelLayoutTag_XY = new ChannelLayout(6881282, new Label[]{Label.XY_X, Label.XY_Y});
    private int code;
    private Label[] labels;

    private ChannelLayout(int i, Label[] labelArr) {
        this.code = i;
        this.labels = labelArr;
        _values.add(this);
    }

    public int getCode() {
        return this.code;
    }

    public Label[] getLabels() {
        return this.labels;
    }

    public static ChannelLayout[] values() {
        return (ChannelLayout[]) _values.toArray(new ChannelLayout[0]);
    }
}
