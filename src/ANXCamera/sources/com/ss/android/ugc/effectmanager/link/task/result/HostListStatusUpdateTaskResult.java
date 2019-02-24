package com.ss.android.ugc.effectmanager.link.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import java.util.ArrayList;
import java.util.List;

public class HostListStatusUpdateTaskResult extends BaseTaskResult {
    private ExceptionResult mExceptionResult;
    private List<Host> mHosts = new ArrayList();

    public List<Host> getHosts() {
        return this.mHosts;
    }

    public void setHosts(List<Host> list) {
        this.mHosts = list;
    }

    public ExceptionResult getExceptionResult() {
        return this.mExceptionResult;
    }

    public void setExceptionResult(ExceptionResult exceptionResult) {
        this.mExceptionResult = exceptionResult;
    }

    public HostListStatusUpdateTaskResult(List<Host> list, ExceptionResult exceptionResult) {
        this.mHosts.clear();
        this.mHosts.addAll(list);
        this.mExceptionResult = exceptionResult;
    }

    public String toString() {
        String str = "HostListStatusUpdateTaskResult{ Hosts{";
        for (Host host : this.mHosts) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(host.toString());
            stringBuilder.append(", ");
            str = stringBuilder.toString();
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(str);
        stringBuilder2.append(" }, mExceptionResult=");
        stringBuilder2.append(this.mExceptionResult);
        stringBuilder2.append('}');
        return stringBuilder2.toString();
    }
}
