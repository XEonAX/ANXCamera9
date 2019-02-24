package com.android.camera.storage;

import java.util.concurrent.BlockingQueue;

public class ImageSaverThread extends Thread {
    private final BlockingQueue<SaveRequest> mQueue;
    private volatile boolean mQuit;

    public ImageSaverThread(String str, BlockingQueue<SaveRequest> blockingQueue) {
        super(str);
        this.mQueue = blockingQueue;
    }

    public void quit() {
        this.mQuit = true;
        if (this.mQueue.isEmpty()) {
            interrupt();
        }
    }

    public void run() {
        while (true) {
            try {
                SaveRequest saveRequest = (SaveRequest) this.mQueue.take();
                saveRequest.save();
                saveRequest.onFinish();
                if (this.mQuit) {
                    interrupt();
                }
            } catch (InterruptedException e) {
                if (this.mQuit) {
                    this.mQueue.clear();
                }
            }
        }
    }
}
