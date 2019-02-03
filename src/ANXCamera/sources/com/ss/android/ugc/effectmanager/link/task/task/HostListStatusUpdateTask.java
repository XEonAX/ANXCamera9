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

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Exception block dominator not found, method:com.ss.android.ugc.effectmanager.link.task.task.HostListStatusUpdateTask.getHostStatus(com.ss.android.ugc.effectmanager.link.model.host.Host, long):void, dom blocks: [B:19:0x0097, B:38:0x0138]
        	at jadx.core.dex.visitors.regions.ProcessTryCatchRegions.searchTryCatchDominators(ProcessTryCatchRegions.java:89)
        	at jadx.core.dex.visitors.regions.ProcessTryCatchRegions.process(ProcessTryCatchRegions.java:45)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.postProcessRegions(RegionMakerVisitor.java:63)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:58)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.ProcessClass.process(ProcessClass.java:32)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:292)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
        */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01f7  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01f7  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x016f A:{ExcHandler: all (th java.lang.Throwable), PHI: r22 , Splitter: B:19:0x0097} */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01f7  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01f7  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x019f A:{ExcHandler: all (th java.lang.Throwable), Splitter: B:6:0x0048} */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x016f A:{ExcHandler: all (th java.lang.Throwable), PHI: r22 , Splitter: B:19:0x0097} */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x016f A:{ExcHandler: all (th java.lang.Throwable), PHI: r22 , Splitter: B:19:0x0097} */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x016f A:{ExcHandler: all (th java.lang.Throwable), PHI: r22 , Splitter: B:19:0x0097} */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x019f A:{ExcHandler: all (th java.lang.Throwable), Splitter: B:6:0x0048} */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01f7  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01ec  */
    private void getHostStatus(com.ss.android.ugc.effectmanager.link.model.host.Host r27, long r28) {
        /*
        r26 = this;
        r12 = r26;
        r13 = r27;
        if (r13 != 0) goto L_0x0007;
    L_0x0006:
        return;
    L_0x0007:
        r14 = new java.lang.StringBuilder;
        r14.<init>();
        r0 = r27.getSchema();
        r14.append(r0);
        r0 = "://";
        r14.append(r0);
        r0 = r27.getHost();
        r14.append(r0);
        r0 = r12.mSpeedApi;
        r14.append(r0);
        r0 = java.lang.System.currentTimeMillis();
        r14.append(r0);
        r15 = java.lang.System.currentTimeMillis();
        r1 = -1;
        r2 = -1;
        r10 = 2147483647; // 0x7fffffff float:NaN double:1.060997895E-314;
        r4 = 0;
        r0 = new java.net.URL;	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r5 = r14.toString();	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r0.<init>(r5);	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r5 = r0.openConnection();	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r9 = r5;	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r9 = (java.net.HttpURLConnection) r9;	 Catch:{ Exception -> 0x01b3, all -> 0x01b0 }
        r5 = r12.mLinkSelector;	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r5 = r5.getSpeedTimeOut();	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r9.setConnectTimeout(r5);	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r5 = r12.mLinkSelector;	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r5 = r5.getSpeedTimeOut();	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r9.setReadTimeout(r5);	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r5 = "X-SS-No-Cookie";	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r6 = "true";	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r9.setRequestProperty(r5, r6);	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r7 = r9.getResponseCode();	 Catch:{ Exception -> 0x01a3, all -> 0x019f }
        r5 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x0190, all -> 0x019f }
        r5 = r5 - r15;
        r1 = "X-TT-LOGID";	 Catch:{ Exception -> 0x017d, all -> 0x019f }
        r17 = r9.getHeaderField(r1);	 Catch:{ Exception -> 0x017d, all -> 0x019f }
        r1 = 200; // 0xc8 float:2.8E-43 double:9.9E-322;
        if (r7 != r1) goto L_0x0120;
    L_0x0074:
        r1 = r5 + r28;
        r13.setSortTime(r1);	 Catch:{ Exception -> 0x010c, all -> 0x0105 }
        r27.resetStatus();	 Catch:{ Exception -> 0x010c, all -> 0x0105 }
        r2 = r0.toString();	 Catch:{ Exception -> 0x010c, all -> 0x0105 }
        r0 = 0;
        r18 = 1;
        r1 = r12;
        r3 = r13;
        r4 = r7;
        r19 = r5;
        r21 = r7;
        r7 = r15;
        r22 = r9;
        r9 = r17;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r0;
        r11 = r18;
        r1.sendEvent(r2, r3, r4, r5, r7, r9, r10, r11);	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r0 = "HostListStatusUpdateTask";	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r1 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r1.<init>();	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r2 = "sort speed time = ";	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x0100, all -> 0x016f }
        r10 = r19;
        r1.append(r10);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = " ";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = r27.getSchema();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = "://";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = r27.getHost();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1 = r1.toString();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        com.ss.android.ugc.effectmanager.common.utils.LogUtils.d(r0, r1);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r0 = "HostListStatusUpdateTask";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.<init>();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = "sort weight time = ";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = r27.getWeightTime();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = " ";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = r27.getSchema();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = "://";	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r2 = r27.getHost();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1.append(r2);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        r1 = r1.toString();	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        com.ss.android.ugc.effectmanager.common.utils.LogUtils.d(r0, r1);	 Catch:{ Exception -> 0x00fe, all -> 0x016f }
        goto L_0x015e;
    L_0x00fe:
        r0 = move-exception;
        goto L_0x0103;
    L_0x0100:
        r0 = move-exception;
        r10 = r19;
    L_0x0103:
        r5 = r10;
        goto L_0x0117;
    L_0x0105:
        r0 = move-exception;
        r22 = r9;
    L_0x0108:
        r5 = r22;
        goto L_0x01f5;
    L_0x010c:
        r0 = move-exception;
        r21 = r7;
        r22 = r9;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r5;
    L_0x0117:
        r9 = r17;
        r4 = r21;
        r11 = r22;
        r10 = r0;
        goto L_0x01be;
    L_0x0120:
        r21 = r7;
        r22 = r9;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r5;
        r1 = "HostListStatusUpdateTask";	 Catch:{ Exception -> 0x0171, all -> 0x016f }
        r2 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0171, all -> 0x016f }
        r2.<init>();	 Catch:{ Exception -> 0x0171, all -> 0x016f }
        r3 = "sort speed error code = ";	 Catch:{ Exception -> 0x0171, all -> 0x016f }
        r2.append(r3);	 Catch:{ Exception -> 0x0171, all -> 0x016f }
        r9 = r21;
        r2.append(r9);	 Catch:{ Exception -> 0x0169, all -> 0x016f }
        r2 = r2.toString();	 Catch:{ Exception -> 0x0169, all -> 0x016f }
        com.ss.android.ugc.effectmanager.common.utils.LogUtils.e(r1, r2);	 Catch:{ Exception -> 0x0169, all -> 0x016f }
        r13.setSortTime(r14);	 Catch:{ Exception -> 0x0169, all -> 0x016f }
        r2 = r0.toString();	 Catch:{ Exception -> 0x0169, all -> 0x016f }
        r0 = 0;
        r16 = 0;
        r1 = r12;
        r3 = r13;
        r4 = r9;
        r5 = r10;
        r7 = r24;
        r18 = r9;
        r9 = r17;
        r19 = r10;
        r10 = r0;
        r11 = r16;
        r1.sendEvent(r2, r3, r4, r5, r7, r9, r10, r11);	 Catch:{ Exception -> 0x0167, all -> 0x016f }
    L_0x015e:
        r5 = r22;
        if (r5 == 0) goto L_0x01ef;
    L_0x0162:
        r5.disconnect();
        goto L_0x01ef;
    L_0x0167:
        r0 = move-exception;
        goto L_0x0176;
    L_0x0169:
        r0 = move-exception;
        r18 = r9;
        r19 = r10;
        goto L_0x0176;
    L_0x016f:
        r0 = move-exception;
        goto L_0x0108;
    L_0x0171:
        r0 = move-exception;
        r19 = r10;
        r18 = r21;
    L_0x0176:
        r5 = r22;
        r10 = r0;
        r11 = r5;
        r9 = r17;
        goto L_0x018b;
    L_0x017d:
        r0 = move-exception;
        r19 = r5;
        r18 = r7;
        r5 = r9;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r0;
        r9 = r4;
        r11 = r5;
    L_0x018b:
        r4 = r18;
        r5 = r19;
        goto L_0x01be;
    L_0x0190:
        r0 = move-exception;
        r18 = r7;
        r5 = r9;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r0;
        r9 = r4;
        r11 = r5;
        r4 = r18;
        goto L_0x01ae;
    L_0x019f:
        r0 = move-exception;
        r5 = r9;
        goto L_0x01f5;
    L_0x01a3:
        r0 = move-exception;
        r5 = r9;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r0;
        r9 = r4;
        r11 = r5;
        r4 = r1;
    L_0x01ae:
        r5 = r2;
        goto L_0x01be;
    L_0x01b0:
        r0 = move-exception;
        r5 = r4;
        goto L_0x01f5;
    L_0x01b3:
        r0 = move-exception;
        r23 = r14;
        r24 = r15;
        r14 = r10;
        r10 = r0;
        r5 = r2;
        r9 = r4;
        r11 = r9;
        r4 = r1;
    L_0x01be:
        r0 = "HostListStatusUpdateTask";	 Catch:{ all -> 0x01f2 }
        r1 = new java.lang.StringBuilder;	 Catch:{ all -> 0x01f2 }
        r1.<init>();	 Catch:{ all -> 0x01f2 }
        r2 = "sort speed error = ";	 Catch:{ all -> 0x01f2 }
        r1.append(r2);	 Catch:{ all -> 0x01f2 }
        r1.append(r10);	 Catch:{ all -> 0x01f2 }
        r1 = r1.toString();	 Catch:{ all -> 0x01f2 }
        com.ss.android.ugc.effectmanager.common.utils.LogUtils.e(r0, r1);	 Catch:{ all -> 0x01f2 }
        r13.setSortTime(r14);	 Catch:{ all -> 0x01f2 }
        r10.printStackTrace();	 Catch:{ all -> 0x01f2 }
        r1 = r23;	 Catch:{ all -> 0x01f2 }
        r2 = r1.toString();	 Catch:{ all -> 0x01f2 }
        r0 = 0;
        r1 = r12;
        r3 = r13;
        r7 = r24;
        r12 = r11;
        r11 = r0;
        r1.sendEvent(r2, r3, r4, r5, r7, r9, r10, r11);	 Catch:{ all -> 0x01f0 }
        if (r12 == 0) goto L_0x01ef;
    L_0x01ec:
        r12.disconnect();
    L_0x01ef:
        return;
    L_0x01f0:
        r0 = move-exception;
        goto L_0x01f4;
    L_0x01f2:
        r0 = move-exception;
        r12 = r11;
    L_0x01f4:
        r5 = r12;
    L_0x01f5:
        if (r5 == 0) goto L_0x01fa;
    L_0x01f7:
        r5.disconnect();
    L_0x01fa:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ugc.effectmanager.link.task.task.HostListStatusUpdateTask.getHostStatus(com.ss.android.ugc.effectmanager.link.model.host.Host, long):void");
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
