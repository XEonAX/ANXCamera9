package com.ss.android.ugc.effectmanager.link.task.task;

import android.os.Handler;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.LogUtils;
import com.ss.android.ugc.effectmanager.link.LinkSelector;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import com.ss.android.ugc.effectmanager.link.model.host.HostStatus;
import com.ss.android.ugc.effectmanager.link.task.result.HostListStatusUpdateTaskResult;
import com.ss.android.ugc.effectmanager.link.task.result.HostStatusUpdateResult;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class HostListStatusUpdateTask extends NormalTask {
    private static final long MAX_SORT_TIME = 2147483647L;
    private static final String TAG = "HostListStatusUpdateTask";
    private List<Host> mHosts = new ArrayList();
    private LinkSelector mLinkSelector;
    private String mSpeedApi;

    public HostListStatusUpdateTask(LinkSelector linkSelector, Handler handler, String str) {
        super(handler, str, EffectConstants.NORMAL);
        this.mHosts.clear();
        this.mHosts.addAll(linkSelector.getOriginHosts());
        this.mSpeedApi = linkSelector.getSpeedApi();
        this.mLinkSelector = linkSelector;
    }

    public void execute() {
        speedMeasure();
        sortHost();
        sendResults();
    }

    private void speedMeasure() {
        for (int i = 0; i < this.mHosts.size(); i++) {
            ((Host) this.mHosts.get(i)).setSortTime(0);
            for (int i2 = 0; i2 < this.mLinkSelector.getRepeatTime(); i2++) {
                getHostStatus((Host) this.mHosts.get(i), ((Host) this.mHosts.get(i)).getSortTime());
            }
        }
    }

    private void getHostStatus(Host host, long j) {
        int i;
        StringBuilder stringBuilder;
        long j2;
        long j3;
        Exception e;
        long j4;
        String str;
        int i2;
        Exception exception;
        int i3;
        Host host2 = host;
        if (host2 != null) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append(host.getSchema());
            stringBuilder2.append("://");
            stringBuilder2.append(host.getHost());
            stringBuilder2.append(this.mSpeedApi);
            stringBuilder2.append(System.currentTimeMillis());
            long currentTimeMillis = System.currentTimeMillis();
            String str2;
            StringBuilder stringBuilder3;
            try {
                URL url = new URL(stringBuilder2.toString());
                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.setConnectTimeout(this.mLinkSelector.getSpeedTimeOut());
                httpURLConnection.setReadTimeout(this.mLinkSelector.getSpeedTimeOut());
                httpURLConnection.setRequestProperty("X-SS-No-Cookie", "true");
                int responseCode = httpURLConnection.getResponseCode();
                try {
                    long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                    long j5;
                    try {
                        String headerField = httpURLConnection.getHeaderField("X-TT-LOGID");
                        long j6;
                        if (responseCode == 200) {
                            try {
                                host2.setSortTime(currentTimeMillis2 + j);
                                host.resetStatus();
                                long j7 = currentTimeMillis2;
                                j5 = j7;
                                i = responseCode;
                                stringBuilder = stringBuilder2;
                                j2 = currentTimeMillis;
                                j3 = 2147483647L;
                                try {
                                    sendEvent(url.toString(), host2, responseCode, j7, currentTimeMillis, headerField, null, true);
                                    str2 = TAG;
                                    stringBuilder3 = new StringBuilder();
                                    stringBuilder3.append("sort speed time = ");
                                    j6 = j5;
                                    try {
                                        stringBuilder3.append(j6);
                                        stringBuilder3.append(" ");
                                        stringBuilder3.append(host.getSchema());
                                        stringBuilder3.append("://");
                                        stringBuilder3.append(host.getHost());
                                        LogUtils.d(str2, stringBuilder3.toString());
                                        str2 = TAG;
                                        stringBuilder3 = new StringBuilder();
                                        stringBuilder3.append("sort weight time = ");
                                        stringBuilder3.append(host.getWeightTime());
                                        stringBuilder3.append(" ");
                                        stringBuilder3.append(host.getSchema());
                                        stringBuilder3.append("://");
                                        stringBuilder3.append(host.getHost());
                                        LogUtils.d(str2, stringBuilder3.toString());
                                    } catch (Exception e2) {
                                        e = e2;
                                    }
                                } catch (Exception e3) {
                                    e = e3;
                                    j6 = j5;
                                    j4 = j6;
                                    str = headerField;
                                    i2 = i;
                                    exception = e;
                                    str2 = TAG;
                                    stringBuilder3 = new StringBuilder();
                                    stringBuilder3.append("sort speed error = ");
                                    stringBuilder3.append(exception);
                                    LogUtils.e(str2, stringBuilder3.toString());
                                    host2.setSortTime(j3);
                                    exception.printStackTrace();
                                    sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                                }
                            } catch (Exception e4) {
                                e = e4;
                                i = responseCode;
                                stringBuilder = stringBuilder2;
                                j2 = currentTimeMillis;
                                j3 = 2147483647L;
                                j6 = currentTimeMillis2;
                                j4 = j6;
                                str = headerField;
                                i2 = i;
                                exception = e;
                                str2 = TAG;
                                stringBuilder3 = new StringBuilder();
                                stringBuilder3.append("sort speed error = ");
                                stringBuilder3.append(exception);
                                LogUtils.e(str2, stringBuilder3.toString());
                                host2.setSortTime(j3);
                                exception.printStackTrace();
                                sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                            }
                        }
                        String str3;
                        StringBuilder stringBuilder4;
                        i = responseCode;
                        stringBuilder = stringBuilder2;
                        j2 = currentTimeMillis;
                        j3 = MAX_SORT_TIME;
                        j6 = currentTimeMillis2;
                        try {
                            str3 = TAG;
                            stringBuilder4 = new StringBuilder();
                            stringBuilder4.append("sort speed error code = ");
                            responseCode = i;
                        } catch (Exception e5) {
                            e = e5;
                            j5 = j6;
                            i3 = i;
                            exception = e;
                            str = headerField;
                            i2 = i3;
                            j4 = j5;
                            str2 = TAG;
                            stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("sort speed error = ");
                            stringBuilder3.append(exception);
                            LogUtils.e(str2, stringBuilder3.toString());
                            host2.setSortTime(j3);
                            exception.printStackTrace();
                            sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                        }
                        try {
                            stringBuilder4.append(responseCode);
                            LogUtils.e(str3, stringBuilder4.toString());
                            host2.setSortTime(j3);
                            i3 = responseCode;
                            j5 = j6;
                            try {
                                sendEvent(url.toString(), host2, responseCode, j6, j2, headerField, null, false);
                            } catch (Exception e6) {
                                e = e6;
                            }
                        } catch (Exception e7) {
                            e = e7;
                            i3 = responseCode;
                            j5 = j6;
                            exception = e;
                            str = headerField;
                            i2 = i3;
                            j4 = j5;
                            str2 = TAG;
                            stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("sort speed error = ");
                            stringBuilder3.append(exception);
                            LogUtils.e(str2, stringBuilder3.toString());
                            host2.setSortTime(j3);
                            exception.printStackTrace();
                            sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                        }
                    } catch (Exception e8) {
                        j5 = currentTimeMillis2;
                        i3 = responseCode;
                        stringBuilder = stringBuilder2;
                        j2 = currentTimeMillis;
                        j3 = MAX_SORT_TIME;
                        exception = e8;
                        str = null;
                        i2 = i3;
                        j4 = j5;
                        str2 = TAG;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("sort speed error = ");
                        stringBuilder3.append(exception);
                        LogUtils.e(str2, stringBuilder3.toString());
                        host2.setSortTime(j3);
                        exception.printStackTrace();
                        sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                    }
                } catch (Exception e82) {
                    i3 = responseCode;
                    stringBuilder = stringBuilder2;
                    j2 = currentTimeMillis;
                    j3 = MAX_SORT_TIME;
                    exception = e82;
                    str = null;
                    j4 = -1;
                    i2 = i3;
                    str2 = TAG;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("sort speed error = ");
                    stringBuilder3.append(exception);
                    LogUtils.e(str2, stringBuilder3.toString());
                    host2.setSortTime(j3);
                    exception.printStackTrace();
                    sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
                }
            } catch (Exception e822) {
                stringBuilder = stringBuilder2;
                j2 = currentTimeMillis;
                j3 = MAX_SORT_TIME;
                exception = e822;
                str = null;
                j4 = -1;
                i2 = -1;
                str2 = TAG;
                stringBuilder3 = new StringBuilder();
                stringBuilder3.append("sort speed error = ");
                stringBuilder3.append(exception);
                LogUtils.e(str2, stringBuilder3.toString());
                host2.setSortTime(j3);
                exception.printStackTrace();
                sendEvent(stringBuilder.toString(), host2, i2, j4, j2, str, exception, false);
            }
        }
    }

    private void sendEvent(String str, Host host, int i, long j, long j2, String str2, Exception exception, boolean z) {
        sendMessage(30, new HostStatusUpdateResult(new HostStatus(str, host, i, j, j2, str2, exception, z), null));
    }

    private void sortHost() {
        Collections.sort(this.mHosts, new Comparator<Host>() {
            public int compare(Host host, Host host2) {
                return (int) (host.getSortTime() - host2.getSortTime());
            }
        });
        Collection arrayList = new ArrayList(this.mHosts);
        arrayList.clear();
        arrayList.addAll(this.mHosts);
        int i = 0;
        while (i < this.mHosts.size()) {
            Host host = (Host) this.mHosts.get(i);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("weight sort = ");
            stringBuilder.append(host.getSortTime());
            stringBuilder.append(" ");
            stringBuilder.append(host.getSchema());
            stringBuilder.append("://");
            stringBuilder.append(host.getHost());
            stringBuilder.append(this.mSpeedApi);
            LogUtils.d(str, stringBuilder.toString());
            i++;
            for (int i2 = i; i2 < this.mHosts.size(); i2++) {
                Host host2 = (Host) this.mHosts.get(i2);
                if (host.getHost().equals(host2.getHost())) {
                    arrayList.remove(host2);
                }
            }
        }
        this.mHosts.clear();
        this.mHosts.addAll(arrayList);
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("speed distinct = ");
        stringBuilder2.append(this.mHosts.size());
        stringBuilder2.append(" thread = ");
        stringBuilder2.append(Thread.currentThread());
        LogUtils.d(str2, stringBuilder2.toString());
    }

    private void sendResults() {
        sendMessage(31, new HostListStatusUpdateTaskResult(this.mHosts, null));
    }
}
