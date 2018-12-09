package com.xiaomi.engine;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface ResultCode {
    public static final int MIAS_INVALID_CALL = -2147483642;
    public static final int MIAS_INVALID_PARAM = -2147483647;
    public static final int MIAS_MAP_FAILED = -2147483645;
    public static final int MIAS_NO_MEM = -2147483646;
    public static final int MIAS_OK = 0;
    public static final int MIAS_OPEN_FAILED = -2147483643;
    public static final int MIAS_UNKNOWN_ERROR = Integer.MIN_VALUE;
    public static final int MIAS_UNMAP_FAILED = -2147483644;
}
