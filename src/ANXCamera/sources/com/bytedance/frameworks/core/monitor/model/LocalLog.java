package com.bytedance.frameworks.core.monitor.model;

public class LocalLog {
    public long createTime;
    public String data;
    public long id;
    public boolean isSampled;
    public String type;
    public String type2;
    public long versionId;

    public LocalLog(long j, String str, long j2, String str2) {
        this.id = j;
        this.type = str;
        this.data = str2;
        this.versionId = j2;
    }

    public LocalLog setId(long j) {
        this.id = j;
        return this;
    }

    public LocalLog setType(String str) {
        this.type = str;
        return this;
    }

    public LocalLog setType2(String str) {
        this.type2 = str;
        return this;
    }

    public LocalLog setData(String str) {
        this.data = str;
        return this;
    }

    public LocalLog setIsSampled(boolean z) {
        this.isSampled = z;
        return this;
    }

    public LocalLog setVersionId(long j) {
        this.versionId = j;
        return this;
    }

    public LocalLog setTimestamp(long j) {
        this.createTime = j;
        return this;
    }
}
