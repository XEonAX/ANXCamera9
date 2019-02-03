package com.bytedance.frameworks.core.monitor.net;

public interface ISendLog {
    public static final int COMPRESS_TYPE_GZIP = 1;

    NetResponse sendLog(long j, String str, byte[] bArr, int i, String str2);
}
