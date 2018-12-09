package com.ss.android.ugc.effectmanager.effect.listener;

import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import java.util.List;

public interface IModFavoriteList {
    void onFail(ExceptionResult exceptionResult);

    void onSuccess(List<String> list);
}
