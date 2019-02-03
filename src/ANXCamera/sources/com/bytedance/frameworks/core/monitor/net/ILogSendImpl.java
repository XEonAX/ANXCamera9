package com.bytedance.frameworks.core.monitor.net;

public interface ILogSendImpl {
    boolean logStopCollectSwitch();

    boolean send(String str);
}
