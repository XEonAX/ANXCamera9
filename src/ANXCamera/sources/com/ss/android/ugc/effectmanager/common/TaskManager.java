package com.ss.android.ugc.effectmanager.common;

import com.ss.android.ugc.effectmanager.common.task.BaseTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.network.interceptor.BaseInterceptor;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;

public class TaskManager {
    private EffectContext mEffectContext;
    private ExecutorService mExecutor;
    private boolean mInit = false;
    private Map<String, BaseInterceptor> mInterceptions;

    public static class TaskManagerConfig {
        private EffectContext mEffectContext;
        private ExecutorService mExecutor;

        public ExecutorService getExecutor() {
            return this.mExecutor;
        }

        public TaskManagerConfig setExecutor(ExecutorService executorService) {
            this.mExecutor = executorService;
            return this;
        }

        public TaskManagerConfig setEffectContext(EffectContext effectContext) {
            this.mEffectContext = effectContext;
            return this;
        }
    }

    public void init(TaskManagerConfig taskManagerConfig) {
        this.mExecutor = taskManagerConfig.getExecutor();
        this.mEffectContext = taskManagerConfig.mEffectContext;
        this.mInit = true;
        this.mInterceptions = new HashMap();
    }

    private void checkInit() {
        if (!this.mInit) {
            throw new IllegalStateException("EffectPlatformSDK: TaskManager is not init !!!");
        }
    }

    public void commit(final BaseTask baseTask) {
        if (baseTask != null) {
            Object obj;
            checkInit();
            for (BaseInterceptor intercept : this.mInterceptions.values()) {
                if (intercept.intercept(baseTask)) {
                    obj = 1;
                    break;
                }
            }
            obj = null;
            if (obj == null) {
                this.mExecutor.execute(new Runnable() {
                    public void run() {
                        baseTask.execute();
                    }
                });
            }
        }
    }

    public void destroy() {
        this.mExecutor.shutdownNow();
    }

    public void addInterception(String str, BaseInterceptor baseInterceptor) {
        this.mInterceptions.put(str, baseInterceptor);
    }

    public void enableInterception(String str, boolean z) {
        BaseInterceptor baseInterceptor = (BaseInterceptor) this.mInterceptions.get(str);
        if (baseInterceptor != null) {
            baseInterceptor.enable(z);
        }
    }

    public Map<String, BaseInterceptor> getInterceptions() {
        return this.mInterceptions;
    }
}
