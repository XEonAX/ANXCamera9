package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;

public interface IReadUpdateTagListener {
    void onFailed(ExceptionResult exceptionResult);

    void onFinally();

    void onSuccess();
}
