package com.android.camera.network.download;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GalleryDownloadManager {
    private static final int CORE_POOL_SIZE = 2;
    public static final GalleryDownloadManager INSTANCE = new GalleryDownloadManager();
    private static final long KEET_ALIVE_SECOND = 30;
    private static final int MAX_DOWNLOAD_TASK = 4;
    private static final String TAG = "GalleryDownloader";
    private BlockingQueue<Runnable> mBlockingQueue = new LinkedBlockingQueue();
    private ThreadPoolExecutor mExecutor = new ThreadPoolExecutor(2, 4, KEET_ALIVE_SECOND, TimeUnit.SECONDS, this.mBlockingQueue, this.mThreadFactory);
    private Map<String, DownloadTask> mTasks = new HashMap();
    private ThreadFactory mThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger();

        public Thread newThread(Runnable runnable) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("DownloadTask #");
            stringBuilder.append(this.mCount.getAndIncrement());
            return new Thread(runnable, stringBuilder.toString());
        }
    };

    public interface OnCompleteListener extends OnCompleteListener {
        void onRequestComplete(Request request, int i);
    }

    public interface OnProgressListener extends OnProgressListener {
        void onProgressUpdate(Request request, int i);
    }

    private class TaskMonitor implements OnCompleteListener {
        private OnCompleteListener mWrapped;

        TaskMonitor(OnCompleteListener onCompleteListener) {
            this.mWrapped = onCompleteListener;
        }

        public void onRequestComplete(Request request, int i) {
            DownloadTask downloadTask = (DownloadTask) GalleryDownloadManager.this.mTasks.remove(request.getTag());
            if (downloadTask != null) {
                downloadTask.setOnProgressListener(null);
            }
            this.mWrapped.onRequestComplete(request, i);
        }
    }

    public void enqueue(Request request, OnCompleteListener onCompleteListener) {
        DownloadTask downloadTask = new DownloadTask(request, new TaskMonitor(onCompleteListener));
        this.mTasks.put(request.getTag(), downloadTask);
        downloadTask.execute(this.mExecutor);
    }

    public int download(Request request, OnProgressListener onProgressListener) {
        DownloadTask downloadTask = new DownloadTask(request);
        downloadTask.setOnProgressListener(onProgressListener);
        this.mTasks.put(request.getTag(), downloadTask);
        try {
            int execute = downloadTask.execute();
            return execute;
        } finally {
            downloadTask.setOnProgressListener(null);
            this.mTasks.remove(request.getTag());
        }
    }

    public void cancel(String str) {
        DownloadTask downloadTask = (DownloadTask) this.mTasks.get(str);
        if (downloadTask != null) {
            downloadTask.cancel(false);
        }
    }

    public void registerOnProgressListener(String str, OnProgressListener onProgressListener) {
        DownloadTask downloadTask = (DownloadTask) this.mTasks.get(str);
        if (downloadTask != null) {
            downloadTask.setOnProgressListener(onProgressListener);
        }
    }

    public void unregisterOnProgressListener(String str) {
        DownloadTask downloadTask = (DownloadTask) this.mTasks.get(str);
        if (downloadTask != null) {
            downloadTask.setOnProgressListener(null);
        }
    }
}
