package com.xiaomi.engine;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface ErrorType {
    public static final int MI_RTN_EXEC_FAILED = 9;
    public static final int MI_RTN_FAIL_THREAD = 3;
    public static final int MI_RTN_FAIL_WORKTASK = 15;
    public static final int MI_RTN_INVALID_FUC_CALL = 14;
    public static final int MI_RTN_INVALID_PARAM = 1;
    public static final int MI_RTN_MAP_FAILED = 5;
    public static final int MI_RTN_NORMAL = 0;
    public static final int MI_RTN_NO_EVENT = 10;
    public static final int MI_RTN_NO_FOUND = 2;
    public static final int MI_RTN_NO_MEM = 4;
    public static final int MI_RTN_NO_SERVICE = 16;
    public static final int MI_RTN_NO_TASK = 12;
    public static final int MI_RTN_OPEN_FAILED = 13;
    public static final int MI_RTN_SET_PARAM_FAILED = 11;
    public static final int MI_RTN_UNINITIALIZED = 7;
    public static final int MI_RTN_UNMAP_FAILED = 6;
    public static final int MI_RTN_UPDATE_FAILED = 8;
}
