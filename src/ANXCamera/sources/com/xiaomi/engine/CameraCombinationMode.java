package com.xiaomi.engine;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface CameraCombinationMode {
    public static final int CAM_COMBINATION_MODE_FRONT = 17;
    public static final int CAM_COMBINATION_MODE_FRONT_AUX = 18;
    public static final int CAM_COMBINATION_MODE_FRONT_BOKEH = 771;
    public static final int CAM_COMBINATION_MODE_FRONT_SAT = 515;
    public static final int CAM_COMBINATION_MODE_REAR_BOKEH_WT = 769;
    public static final int CAM_COMBINATION_MODE_REAR_BOKEH_WU = 770;
    public static final int CAM_COMBINATION_MODE_REAR_SAT_WT = 513;
    public static final int CAM_COMBINATION_MODE_REAR_SAT_WU = 514;
    public static final int CAM_COMBINATION_MODE_REAR_TELE = 2;
    public static final int CAM_COMBINATION_MODE_REAR_ULTRA = 3;
    public static final int CAM_COMBINATION_MODE_REAR_WIDE = 1;
    public static final int CAM_COMBINATION_MODE_UNKNOWN = 0;
}
