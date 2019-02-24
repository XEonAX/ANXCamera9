package com.ss.android.ugc.effectmanager.link.model.host;

public class HostStatus {
    private long duration;
    private Exception exception;
    private Host host;
    private boolean isSuccess;
    private long sendTime;
    private int status;
    private String traceCode;
    private String url;

    public HostStatus(String str, Host host, int i, long j, long j2, String str2, Exception exception, boolean z) {
        this.url = str;
        this.host = host;
        this.status = i;
        this.duration = j;
        this.sendTime = j2;
        this.traceCode = str2;
        this.exception = exception;
        this.isSuccess = z;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public Host getHost() {
        return this.host;
    }

    public void setHost(Host host) {
        this.host = host;
    }

    public int getStatus() {
        return this.status;
    }

    public void setStatus(int i) {
        this.status = i;
    }

    public boolean isSuccess() {
        return this.isSuccess;
    }

    public void setSuccess(boolean z) {
        this.isSuccess = z;
    }

    public long getDuration() {
        return this.duration;
    }

    public void setDuration(long j) {
        this.duration = j;
    }

    public long getSendTime() {
        return this.sendTime;
    }

    public void setSendTime(long j) {
        this.sendTime = j;
    }

    public String getTraceCode() {
        return this.traceCode;
    }

    public void setTraceCode(String str) {
        this.traceCode = str;
    }

    public Exception getException() {
        return this.exception;
    }

    public void setException(Exception exception) {
        this.exception = exception;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("HostStatus{url='");
        stringBuilder.append(this.url);
        stringBuilder.append('\'');
        stringBuilder.append(", host=");
        stringBuilder.append(this.host.toString());
        stringBuilder.append(", status=");
        stringBuilder.append(this.status);
        stringBuilder.append(", duration=");
        stringBuilder.append(this.duration);
        stringBuilder.append(", sendTime=");
        stringBuilder.append(this.sendTime);
        stringBuilder.append(", traceCode='");
        stringBuilder.append(this.traceCode);
        stringBuilder.append('\'');
        stringBuilder.append(", exception=");
        stringBuilder.append(this.exception);
        stringBuilder.append(", isSuccess=");
        stringBuilder.append(this.isSuccess);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
