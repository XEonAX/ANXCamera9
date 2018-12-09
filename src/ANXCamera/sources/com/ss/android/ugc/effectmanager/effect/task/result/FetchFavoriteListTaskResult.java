package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.util.ArrayList;
import java.util.List;

public class FetchFavoriteListTaskResult extends BaseTaskResult {
    private List<Effect> mEffects = new ArrayList();
    private ExceptionResult mException;
    private String mType;

    public FetchFavoriteListTaskResult(List<Effect> list, String str) {
        this.mEffects.clear();
        this.mEffects.addAll(list);
        this.mType = str;
    }

    public FetchFavoriteListTaskResult(ExceptionResult exceptionResult) {
        this.mException = exceptionResult;
    }

    public List<Effect> getEffects() {
        return this.mEffects;
    }

    public void setEffects(List<Effect> list) {
        this.mEffects = list;
    }

    public String getType() {
        return this.mType;
    }

    public void setType(String str) {
        this.mType = str;
    }

    public ExceptionResult getException() {
        return this.mException;
    }
}
