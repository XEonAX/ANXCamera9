package com.bytedance.frameworks.core.monitor;

public class MonitorCommonConstants {
    public static final String COUNT_TYPE = "count";
    public static final String DATA_TYPE = "data";
    public static final String DEBUG_REAL_TYPE = "debug_real";
    public static final String DEFAULT_AID = "default";
    public static final boolean IS_LOG_SEND_SWITCH = true;
    public static final long LAST_STOP_INTERVAL = 1800000;
    public static final String LOG_REPORT_TYPE_DEFAULT = "monitor";
    public static final int MAX_COUNT_UPLOAD_SINGLE_TIME = 400;
    public static final int MAX_MONITOR_LOG_SAVE_COUNT = 40000;
    public static final int MSG_CLEAN_EXPIRED_LOG = 16;
    public static final int MSG_FLUSH_BUFFER = 12;
    public static final int MSG_HANDLE_COUNT = 3;
    public static final int MSG_HANDLE_DEBUG_REAL = 5;
    public static final int MSG_HANDLE_DIRECT_COUNT = 7;
    public static final int MSG_HANDLE_DIRECT_TIMER = 6;
    public static final int MSG_HANDLE_LOG_TIMED_TASK = 13;
    public static final int MSG_HANDLE_PACK_AND_SEND_LOG = 14;
    public static final int MSG_HANDLE_TIMER = 4;
    public static final int MSG_HANDLE_UPDATE_CONFIG = 8;
    public static final int MSG_INIT = 1;
    public static final int MSG_INIT_CURRENT_VERSION_INFO = 2;
    public static final int MSG_LOG_SEND = 10;
    public static final int MSG_REPORT_LOG_COUNT_DAILY = 15;
    public static final int MSG_UPDATE_COLLECT_LOG_SWITCH = 9;
    public static final int MSG_UPLOAD_LEGACY = 11;
    public static final boolean REMOVE_LOG_SWITCH = false;
    public static final int REPORT_COUNT = 100;
    public static final int REPORT_FAIL_BASE_TIME = 15;
    public static final int REPORT_FAIL_REPEAT_COUNT = 4;
    public static final int REPORT_INTERVAL = 120;
    public static final long SECOND_STOP_INTERVAL = 300000;
    public static final long STOP_MORE_CHANNEL_INTERVAL = 600000;
    public static final long THIRD_STOP_INTERVAL = 900000;
    public static final String TIMER_TYPE = "timer";
}
