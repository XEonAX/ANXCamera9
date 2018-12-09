package com.xiaomi.camera.liveshot.util;

import com.android.camera.log.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;

public class BackgroundTaskScheduler {
    private static final String TAG = BackgroundTaskScheduler.class.getSimpleName();
    private final ExecutorService mExecutor;
    private final List<BackgroundTaskContainer> mTaskList = new ArrayList();

    public interface Cancellable extends Runnable {
        void cancel();
    }

    private class BackgroundTaskContainer implements Runnable {
        private final Cancellable mTask;

        private BackgroundTaskContainer(Cancellable cancellable) {
            this.mTask = cancellable;
        }

        private void cancel() {
            this.mTask.cancel();
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

    public void submit(Cancellable cancellable) {
        synchronized (this.mTaskList) {
            Runnable backgroundTaskContainer = new BackgroundTaskContainer(cancellable);
            this.mTaskList.add(backgroundTaskContainer);
            this.mExecutor.execute(backgroundTaskContainer);
        }
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
