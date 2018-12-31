package com.ss.android.ugc.effectmanager.effect.task.result;

import com.ss.android.ugc.effectmanager.common.task.BaseTaskResult;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import java.util.ArrayList;
import java.util.List;

public class FavoriteTaskResult extends BaseTaskResult {
    private List<String> mEffectIds = new ArrayList();
    private ExceptionResult mException;
    private boolean mIsSuccess;

    public ExceptionResult getException() {
        return this.mException;
    }

    public FavoriteTaskResult(boolean z, List<String> list, ExceptionResult exceptionResult) {
        this.mIsSuccess = z;
        this.mEffectIds.clear();
        this.mEffectIds.addAll(list);
        this.mException = exceptionResult;
    }

    public boolean isSuccess() {
        return this.mIsSuccess;
    }

    public List<String> getEffectIds() {
        return this.mEffectIds;
    }
}
