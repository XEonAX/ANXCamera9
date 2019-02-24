package com.ss.android.ugc.effectmanager.network.interceptor;

import com.ss.android.ugc.effectmanager.common.task.BaseTask;

public abstract class BaseInterceptor {
    private boolean isEnabled = false;

    public abstract boolean intercept(BaseTask baseTask);

    public boolean isEnabled() {
        return this.isEnabled;
    }

    public void enable(boolean z) {
        this.isEnabled = z;
    }
}
