package com.bytedance.frameworks.core.monitor;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.bytedance.frameworks.core.monitor.model.DebugRealLog;
import com.bytedance.frameworks.core.monitor.model.InitialLogInfo;
import com.bytedance.frameworks.core.monitor.model.LocalLog;
import com.bytedance.frameworks.core.monitor.model.LocalVersionInfo;
import com.bytedance.frameworks.core.monitor.model.UploadLogLegacyCommand;
import java.util.ArrayList;
import java.util.List;

public class LogTaskManager {
    private static final int WAIT_INTERVAL = 15000;
    private static HandlerThread sHandlerThread;
    private Handler mHandler;
    private Runnable mTimerRunnable = new Runnable() {
        public void run() {
            LogTaskManager.this.mHandler.sendEmptyMessage(13);
            LogTaskManager.this.mHandler.sendEmptyMessage(14);
            if (!(LogTaskManager.this.sAllInactiveMonitor == null || LogTaskManager.this.sAllInactiveMonitor.isEmpty())) {
                for (IInactiveMonitor handleEvent : LogTaskManager.this.sAllInactiveMonitor) {
                    handleEvent.handleEvent();
                }
            }
            LogTaskManager.this.mHandler.postDelayed(this, 15000);
        }
    };
    private List<IInactiveMonitor> sAllInactiveMonitor = new ArrayList();

    public interface IInactiveMonitor {
        void handleEvent();
    }

    public void registerInactiveMonitor(IInactiveMonitor iInactiveMonitor) {
        if (!this.sAllInactiveMonitor.contains(iInactiveMonitor)) {
            this.sAllInactiveMonitor.add(iInactiveMonitor);
        }
    }

    public void unregisterInavtiveMonitor(IInactiveMonitor iInactiveMonitor) {
        if (this.sAllInactiveMonitor.contains(iInactiveMonitor)) {
            this.sAllInactiveMonitor.remove(iInactiveMonitor);
        }
    }

    public LogTaskManager(Context context, String str) {
        if (sHandlerThread == null) {
            sHandlerThread = new HandlerThread("monitorlib", 5);
            sHandlerThread.start();
        }
        this.mHandler = new MonitorLogHandler(sHandlerThread.getLooper(), context, str);
        this.mHandler.sendEmptyMessage(1);
        this.mHandler.post(this.mTimerRunnable);
    }

    public void initCurrentVersionInfo(LocalVersionInfo localVersionInfo) {
        Message obtain = Message.obtain();
        obtain.what = 2;
        obtain.obj = localVersionInfo;
        this.mHandler.sendMessage(obtain);
    }

    public void handleCount(String str, String str2, String str3, float f, boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 3;
        obtain.obj = new InitialLogInfo(str, str2, str3, f, z);
        this.mHandler.sendMessage(obtain);
    }

    public void handleTimer(String str, String str2, String str3, float f, boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 4;
        obtain.obj = new InitialLogInfo(str, str2, str3, f, z);
        this.mHandler.sendMessage(obtain);
    }

    public void handleDirectTimer(String str, String str2, float f, boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 6;
        obtain.obj = new InitialLogInfo(str, "", str2, f, z);
        this.mHandler.sendMessage(obtain);
    }

    public void handleDirectCount(String str, String str2, String str3, float f, boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 7;
        obtain.obj = new InitialLogInfo(str, str2, str3, f, z);
        this.mHandler.sendMessage(obtain);
    }

    public void handleDebug(String str, String str2) {
        Message obtain = Message.obtain();
        obtain.what = 5;
        obtain.obj = new DebugRealLog(str, str2);
        this.mHandler.sendMessage(obtain);
    }

    public void handleUpdateConfig() {
        Message obtain = Message.obtain();
        obtain.what = 8;
        this.mHandler.sendMessage(obtain);
    }

    public void setReportLogSwitch(boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 9;
        obtain.obj = Boolean.valueOf(z);
        this.mHandler.sendMessage(obtain);
    }

    public void logSend(String str, String str2, String str3, boolean z, boolean z2) {
        Message obtain = Message.obtain();
        obtain.what = 10;
        obtain.arg1 = z2;
        obtain.obj = new LocalLog().setType(str).setType2(str2).setData(str3).setIsSampled(z);
        this.mHandler.sendMessage(obtain);
    }

    public void uploadLogLegacy(UploadLogLegacyCommand uploadLogLegacyCommand) {
        Message obtain = Message.obtain();
        obtain.what = 11;
        obtain.obj = uploadLogLegacyCommand;
        this.mHandler.sendMessage(obtain);
    }

    public void reportLogCountDaily(boolean z) {
        Message obtain = Message.obtain();
        obtain.what = 15;
        obtain.arg1 = z;
        this.mHandler.sendMessage(obtain);
    }

    public void flushBuffer2DB() {
        Message obtain = Message.obtain();
        obtain.what = 12;
        this.mHandler.sendMessage(obtain);
    }

    public void cleanExpiredLog(long j) {
        Message obtain = Message.obtain();
        obtain.what = 16;
        obtain.arg1 = (int) j;
        this.mHandler.sendMessage(obtain);
    }

    public void quit() {
    }
}
