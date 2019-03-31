package com.xiaomi.camera.liveshot.writer;

import java.util.concurrent.CountDownLatch;

public abstract class SampleWriter implements Runnable {

    public static class StatusNotifier<T> {
        private final CountDownLatch mCountDownLatch = new CountDownLatch(1);
        private T mStatus = null;

        public StatusNotifier(T t) {
            this.mStatus = t;
        }

        public T getStatus() {
            try {
                this.mCountDownLatch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return this.mStatus;
        }

        public void notify(T t) {
            this.mStatus = t;
            this.mCountDownLatch.countDown();
        }
    }

    public void run() {
        writeSample();
    }

    protected abstract void writeSample();
}
