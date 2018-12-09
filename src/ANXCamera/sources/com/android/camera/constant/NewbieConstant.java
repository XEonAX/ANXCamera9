package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class NewbieConstant {
    public static final int NEWBIE_AI_SCENE = 3;
    public static final int NEWBIE_FRONT_CAM_ROTATE = 2;
    public static final int NEWBIE_NULL = -1;
    public static final int NEWBIE_PORTRAIT = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface NewbieType {
    }
}
