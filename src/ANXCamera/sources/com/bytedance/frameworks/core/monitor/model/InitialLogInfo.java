package com.bytedance.frameworks.core.monitor.model;

public class InitialLogInfo {
    public boolean isSampled;
    public String key;
    public String type;
    public String type2;
    public float value;

    public InitialLogInfo(String str, String str2, String str3, float f, boolean z) {
        this.type = str;
        this.type2 = str2;
        this.key = str3;
        this.value = f;
        this.isSampled = z;
    }
}
