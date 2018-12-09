package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;

public interface IFetchEffectListener {
    void onFail(Effect effect, ExceptionResult exceptionResult);

    void onStart(Effect effect);

    void onSuccess(Effect effect);
}
