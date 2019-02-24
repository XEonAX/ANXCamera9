package com.xiaomi.camera.liveshot.writer;

import java.util.concurrent.CountDownLatch;

public abstract class SampleWriter implements Runnable {

    public static class StatusNotifier<T> {
        private final CountDownLatch mCountDownLatch = new CountDownLatch(1);
        private T mStatus = null;

        public StatusNotifier(T t) {
            this.mStatus = t;
        }

        public void notify(T t) {
            this.mStatus = t;
            this.mCountDownLatch.countDown();
        }

        public T getStatus() {
            try {
                this.mCountDownLatch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return this.mStatus;
        }
    }

    protected abstract void writeSample();

    public void run() {
        writeSample();
    }
}
