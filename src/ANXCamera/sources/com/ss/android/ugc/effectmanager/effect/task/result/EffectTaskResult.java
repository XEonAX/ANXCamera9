package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;

public class EffectTaskResult extends BaseTaskResult {
    private Effect effect;
    private ExceptionResult exception;

    public Effect getEffect() {
        return this.effect;
    }

    public void setEffect(Effect effect) {
        this.effect = effect;
    }

    public ExceptionResult getException() {
        return this.exception;
    }

    public void setException(ExceptionResult exceptionResult) {
        this.exception = exceptionResult;
    }

    public EffectTaskResult(Effect effect, ExceptionResult exceptionResult) {
        this.effect = effect;
        this.exception = exceptionResult;
    }
}
