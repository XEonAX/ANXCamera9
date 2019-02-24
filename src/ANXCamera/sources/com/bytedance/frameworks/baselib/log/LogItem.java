package com.bytedance.frameworks.baselib.log;

class LogItem {
    public long id;
    public int retry_count;
    public long retry_time;
    public long timestamp;
    public String type;
    public byte[] value;

    public LogItem(String str, byte[] bArr) {
        this.type = str;
        this.value = bArr;
    }
}
