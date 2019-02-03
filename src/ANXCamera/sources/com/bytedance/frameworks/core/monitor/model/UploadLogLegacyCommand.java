package com.bytedance.frameworks.core.monitor.model;

import java.util.List;

public class UploadLogLegacyCommand {
    public long endTime;
    public long startTime;
    private List<String> uploadTypeList;

    public UploadLogLegacyCommand(long j, long j2, List<String> list) {
        this.startTime = j;
        this.endTime = j2;
        this.uploadTypeList = list;
    }

    public List<String> getUploadTypeList() {
        return this.uploadTypeList;
    }
}
