package com.xiaomi.camera.liveshot.util;

import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;

public class BackgroundTaskScheduler {
    private static final String TAG = BackgroundTaskScheduler.class.getSimpleName();
    private final ExecutorService mExecutor;
    private final List<BackgroundTaskContainer> mTaskList = new ArrayList();

    public static abstract class CancellableTask implements Runnable {
        private final AtomicBoolean mCancelled = new AtomicBoolean();

        protected void setCancelled() {
            this.mCancelled.set(true);
        }

        protected boolean isCancelled() {
            return this.mCancelled.get();
        }
    }

    private class BackgroundTaskContainer implements Runnable {
        private final CancellableTask mTask;

        private BackgroundTaskContainer(CancellableTask cancellableTask) {
            this.mTask = cancellableTask;
        }

        private void cancel() {
            this.mTask.setCancelled();
        }

        public void run() {
            synchronized (BackgroundTaskScheduler.this.mTaskList) {
                if (!BackgroundTaskScheduler.this.mTaskList.remove(this)) {
                    Log.d(BackgroundTaskScheduler.TAG, "This task does not exist in task list.");
                }
            }
            this.mTask.run();
        }
    }

    public BackgroundTaskScheduler(ExecutorService executorService) {
        this.mExecutor = executorService;
    }

    public void execute(CancellableTask cancellableTask) {
        synchronized (this.mTaskList) {
            Runnable backgroundTaskContainer = new BackgroundTaskContainer(cancellableTask);
            this.mTaskList.add(backgroundTaskContainer);
            this.mExecutor.execute(backgroundTaskContainer);
        }
    }

    public Future<?> submit(CancellableTask cancellableTask) {
        Future<?> submit;
        synchronized (this.mTaskList) {
            Runnable backgroundTaskContainer = new BackgroundTaskContainer(cancellableTask);
            this.mTaskList.add(backgroundTaskContainer);
            submit = this.mExecutor.submit(backgroundTaskContainer);
        }
        return submit;
    }

    public void shutdown() {
        this.mExecutor.shutdown();
    }

    public int getRemainingTaskCount() {
        int size;
        synchronized (this.mTaskList) {
            size = this.mTaskList.size();
        }
        return size;
    }

    public void abortRemainingTasks() {
        synchronized (this.mTaskList) {
            for (BackgroundTaskContainer access$100 : this.mTaskList) {
                access$100.cancel();
            }
        }
    }
}
