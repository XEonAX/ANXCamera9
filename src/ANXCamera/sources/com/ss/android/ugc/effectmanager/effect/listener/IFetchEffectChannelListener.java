package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;

public interface IFetchEffectChannelListener {
    void onFail(ExceptionResult exceptionResult);

    void onSuccess(EffectChannelResponse effectChannelResponse);
}
