package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.BlockingObserver;
import io.reactivex.internal.observers.LambdaObserver;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.internal.util.BlockingIgnoringReceiver;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.NotificationLite;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.LinkedBlockingQueue;

public final class ObservableBlockingSubscribe {
    private ObservableBlockingSubscribe() {
        throw new IllegalStateException("No instances!");
    }

    public static <T> void subscribe(ObservableSource<? extends T> observableSource, Observer<? super T> observer) {
        BlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
        BlockingObserver blockingObserver = new BlockingObserver(linkedBlockingQueue);
        observer.onSubscribe(blockingObserver);
        observableSource.subscribe(blockingObserver);
        while (!blockingObserver.isDisposed()) {
            Object poll = linkedBlockingQueue.poll();
            if (poll == null) {
                try {
                    poll = linkedBlockingQueue.take();
                } catch (Throwable e) {
                    blockingObserver.dispose();
                    observer.onError(e);
                    return;
                }
            }
            if (blockingObserver.isDisposed() || observableSource == BlockingObserver.TERMINATED || NotificationLite.acceptFull(poll, (Observer) observer)) {
                break;
            }
        }
    }

    public static <T> void subscribe(ObservableSource<? extends T> observableSource) {
        CountDownLatch blockingIgnoringReceiver = new BlockingIgnoringReceiver();
        Object lambdaObserver = new LambdaObserver(Functions.emptyConsumer(), blockingIgnoringReceiver, blockingIgnoringReceiver, Functions.emptyConsumer());
        observableSource.subscribe(lambdaObserver);
        BlockingHelper.awaitForComplete(blockingIgnoringReceiver, lambdaObserver);
        Throwable th = blockingIgnoringReceiver.error;
        if (th != null) {
            throw ExceptionHelper.wrapOrThrow(th);
        }
    }

    public static <T> void subscribe(ObservableSource<? extends T> observableSource, Consumer<? super T> consumer, Consumer<? super Throwable> consumer2, Action action) {
        ObjectHelper.requireNonNull(consumer, "onNext is null");
        ObjectHelper.requireNonNull(consumer2, "onError is null");
        ObjectHelper.requireNonNull(action, "onComplete is null");
        subscribe(observableSource, new LambdaObserver(consumer, consumer2, action, Functions.emptyConsumer()));
    }
}
