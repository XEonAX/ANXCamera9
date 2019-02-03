package com.bytedance.frameworks.core.monitor.model;

public class CountInfo {
    public float count;
    public long firstTime;
    public boolean isSampled;
    public String key;
    public String type;
    public String type2;

    public CountInfo(String str, String str2, float f, long j) {
        this.key = str;
        this.type = str2;
        this.count = f;
        this.firstTime = j;
    }

    public CountInfo setType2(String str) {
        this.type2 = str;
        return this;
    }
}
