package com.ss.android.ugc.effectmanager.link.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.link.model.host.HostStatus;

public class HostStatusUpdateResult extends BaseTaskResult {
    private ExceptionResult mExceptionResult;
    private HostStatus mHostStatus;

    public HostStatus getHostStatus() {
        return this.mHostStatus;
    }

    public void setHostStatus(HostStatus hostStatus) {
        this.mHostStatus = hostStatus;
    }

    public ExceptionResult getExceptionResult() {
        return this.mExceptionResult;
    }

    public void setExceptionResult(ExceptionResult exceptionResult) {
        this.mExceptionResult = exceptionResult;
    }

    public HostStatusUpdateResult(HostStatus hostStatus, ExceptionResult exceptionResult) {
        this.mHostStatus = hostStatus;
        this.mExceptionResult = exceptionResult;
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("HostStatusUpdateResult{mHostStatus=");
        stringBuilder.append(this.mHostStatus);
        stringBuilder.append(", mExceptionResult=");
        stringBuilder.append(this.mExceptionResult);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
