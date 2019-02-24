package com.ss.android.medialib;

import android.support.annotation.Keep;

@Keep
public interface Result {
    public static final int SUC = 0;

    public interface Error {
        public static final int FILE_NOT_EXSIT = -101;
        public static final int HANDLE_INVALID = -100;
        public static final int PARAM_INVALID = -102;
        public static final int SYN_CACHE_ERROR = -500;
        public static final int SYN_INIT_FAILED = -1000;
        public static final int SYN_UNINIT_FAILED = -2000;
        public static final int THREAD_CREATE_ERROR = -3000;
    }
}
