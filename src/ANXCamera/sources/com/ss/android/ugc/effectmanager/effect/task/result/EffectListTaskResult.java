package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.util.List;

public class EffectListTaskResult extends BaseTaskResult {
    private List<Effect> effectList;
    private ExceptionResult exception;

    public List<Effect> getEffectList() {
        return this.effectList;
    }

    public void setEffectList(List<Effect> list) {
        this.effectList = list;
    }

    public ExceptionResult getException() {
        return this.exception;
    }

    public void setException(ExceptionResult exceptionResult) {
        this.exception = exceptionResult;
    }

    public EffectListTaskResult(List<Effect> list, ExceptionResult exceptionResult) {
        this.effectList = list;
        this.exception = exceptionResult;
    }
}
