package com.bytedance.frameworks.core.monitor.model;

public class TimerInfo {
    public long firstTime;
    public boolean isSampled;
    public String key;
    public int times;
    public String type;
    public String type2;
    public float value;

    public TimerInfo(String str, String str2, int i, float f, long j) {
        this.key = str;
        this.type = str2;
        this.times = i;
        this.value = f;
        this.firstTime = j;
    }

    public TimerInfo setType2(String str) {
        this.type2 = str;
        return this;
    }
}
