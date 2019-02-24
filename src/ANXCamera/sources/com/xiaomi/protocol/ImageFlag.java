package com.xiaomi.protocol;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface ImageFlag {
    public static final int MAIN_IMAGE = 0;
    public static final int SUB_IMAGE = 1;
}
