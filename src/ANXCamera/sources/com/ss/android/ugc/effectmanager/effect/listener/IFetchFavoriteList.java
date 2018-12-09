package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.util.List;

public interface IFetchFavoriteList {
    void onFailed(ExceptionResult exceptionResult);

    void onSuccess(List<Effect> list, String str);
}
