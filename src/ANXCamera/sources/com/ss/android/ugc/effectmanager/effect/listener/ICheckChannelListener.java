package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;

public interface ICheckChannelListener {
    void checkChannelFailed(ExceptionResult exceptionResult);

    void checkChannelSuccess(boolean z);
}
