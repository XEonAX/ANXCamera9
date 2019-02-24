package io.reactivex.internal.util;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.schedulers.NonBlockingThread;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.CountDownLatch;

public final class BlockingHelper {
    private BlockingHelper() {
        throw new IllegalStateException("No instances!");
    }

    public static void awaitForComplete(CountDownLatch countDownLatch, Disposable disposable) {
        if (countDownLatch.getCount() != 0) {
            try {
                verifyNonBlocking();
                countDownLatch.await();
            } catch (Throwable e) {
                disposable.dispose();
                Thread.currentThread().interrupt();
                throw new IllegalStateException("Interrupted while waiting for subscription to complete.", e);
            }
        }
    }

    public static void verifyNonBlocking() {
        if (!RxJavaPlugins.isFailOnNonBlockingScheduler()) {
            return;
        }
        if ((Thread.currentThread() instanceof NonBlockingThread) || RxJavaPlugins.onBeforeBlocking()) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Attempt to block on a Scheduler ");
            stringBuilder.append(Thread.currentThread().getName());
            stringBuilder.append(" that doesn't support blocking operators as they may lead to deadlock");
            throw new IllegalStateException(stringBuilder.toString());
        }
    }
}
