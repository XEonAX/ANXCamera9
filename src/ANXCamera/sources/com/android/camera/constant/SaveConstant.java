package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class SaveConstant {
    public static final int SAVE_PIC_BEAUTY = 13;
    public static final int SAVE_PIC_BURST_DURING = 5;
    public static final int SAVE_PIC_BURST_FIRST = 4;
    public static final int SAVE_PIC_BURST_LAST = 6;
    public static final int SAVE_PIC_FILTER = 3;
    public static final int SAVE_PIC_GROUP = 10;
    public static final int SAVE_PIC_HDR = 2;
    public static final int SAVE_PIC_INTENT = 11;
    public static final int SAVE_PIC_IN_VIDEO = 12;
    public static final int SAVE_PIC_NORMAL = 1;
    public static final int SAVE_PIC_PANORAMA = 9;
    public static final int SAVE_PIC_PORTRAIT = 7;
    public static final int SAVE_PIC_STEREO = 8;

    @Retention(RetentionPolicy.SOURCE)
    public @interface SaveType {
    }
}
