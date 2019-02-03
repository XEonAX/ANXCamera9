package com.xiaomi.engine;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.SOURCE)
public @interface NodeType {
    public static final int NDTP_CLEARSHOT = 1;
    public static final int NDTP_CLEARSHOT_S = 2;
    public static final int NDTP_HHT = 3;
    public static final int NDTP_INVALID = 0;
    public static final int NDTP_MAX = 4;
}
