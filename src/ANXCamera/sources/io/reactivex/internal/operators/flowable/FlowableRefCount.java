package io.reactivex.internal.operators.flowable;

import io.reactivex.FlowableSubscriber;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.disposables.Disposables;
import io.reactivex.flowables.ConnectableFlowable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.ReentrantLock;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

public final class FlowableRefCount<T> extends AbstractFlowableWithUpstream<T, T> {
    volatile CompositeDisposable baseDisposable = new CompositeDisposable();
    final ReentrantLock lock = new ReentrantLock();
    final ConnectableFlowable<T> source;
    final AtomicInteger subscriptionCount = new AtomicInteger();

    final class ConnectionSubscriber extends AtomicReference<Subscription> implements FlowableSubscriber<T>, Subscription {
        private static final long serialVersionUID = 152064694420235350L;
        final CompositeDisposable currentBase;
        final AtomicLong requested = new AtomicLong();
        final Disposable resource;
        final Subscriber<? super T> subscriber;

        ConnectionSubscriber(Subscriber<? super T> subscriber, CompositeDisposable compositeDisposable, Disposable disposable) {
            this.subscriber = subscriber;
            this.currentBase = compositeDisposable;
            this.resource = disposable;
        }

        public void onSubscribe(Subscription subscription) {
            SubscriptionHelper.deferredSetOnce(this, this.requested, subscription);
        }

        public void onError(Throwable th) {
            cleanup();
            this.subscriber.onError(th);
        }

        public void onNext(T t) {
            this.subscriber.onNext(t);
        }

        public void onComplete() {
            cleanup();
            this.subscriber.onComplete();
        }

        public void request(long j) {
            SubscriptionHelper.deferredRequest(this, this.requested, j);
        }

        public void cancel() {
            SubscriptionHelper.cancel(this);
            this.resource.dispose();
        }

        void cleanup() {
            FlowableRefCount.this.lock.lock();
            try {
                if (FlowableRefCount.this.baseDisposable == this.currentBase) {
                    if (FlowableRefCount.this.source instanceof Disposable) {
                        ((Disposable) FlowableRefCount.this.source).dispose();
                    }
                    FlowableRefCount.this.baseDisposable.dispose();
                    FlowableRefCount.this.baseDisposable = new CompositeDisposable();
                    FlowableRefCount.this.subscriptionCount.set(0);
                }
                FlowableRefCount.this.lock.unlock();
            } catch (Throwable th) {
                FlowableRefCount.this.lock.unlock();
            }
        }
    }

    final class DisposeConsumer implements Consumer<Disposable> {
        private final Subscriber<? super T> subscriber;
        private final AtomicBoolean writeLocked;

        DisposeConsumer(Subscriber<? super T> subscriber, AtomicBoolean atomicBoolean) {
            this.subscriber = subscriber;
            this.writeLocked = atomicBoolean;
        }

        public void accept(Disposable disposable) {
            try {
                FlowableRefCount.this.baseDisposable.add(disposable);
                FlowableRefCount.this.doSubscribe(this.subscriber, FlowableRefCount.this.baseDisposable);
            } finally {
                FlowableRefCount.this.lock.unlock();
                this.writeLocked.set(false);
            }
        }
    }

    final class DisposeTask implements Runnable {
        private final CompositeDisposable current;

        DisposeTask(CompositeDisposable compositeDisposable) {
            this.current = compositeDisposable;
        }

        public void run() {
            FlowableRefCount.this.lock.lock();
            try {
                if (FlowableRefCount.this.baseDisposable == this.current && FlowableRefCount.this.subscriptionCount.decrementAndGet() == 0) {
                    if (FlowableRefCount.this.source instanceof Disposable) {
                        ((Disposable) FlowableRefCount.this.source).dispose();
                    }
                    FlowableRefCount.this.baseDisposable.dispose();
                    FlowableRefCount.this.baseDisposable = new CompositeDisposable();
                }
                FlowableRefCount.this.lock.unlock();
            } catch (Throwable th) {
                FlowableRefCount.this.lock.unlock();
            }
        }
    }

    public FlowableRefCount(ConnectableFlowable<T> connectableFlowable) {
        super(connectableFlowable);
        this.source = connectableFlowable;
    }

    /* JADX WARNING: Failed to extract finally block: empty outs */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0034 A:{REMOVE} */
    public void subscribeActual(org.reactivestreams.Subscriber<? super T> r3) {
        /*
        r2 = this;
        r0 = r2.lock;
        r0.lock();
        r0 = r2.subscriptionCount;
        r0 = r0.incrementAndGet();
        r1 = 1;
        if (r0 != r1) goto L_0x0035;
    L_0x000e:
        r0 = new java.util.concurrent.atomic.AtomicBoolean;
        r0.<init>(r1);
        r1 = r2.source;	 Catch:{ all -> 0x0028 }
        r3 = r2.onSubscribe(r3, r0);	 Catch:{ all -> 0x0028 }
        r1.connect(r3);	 Catch:{ all -> 0x0028 }
        r3 = r0.get();
        if (r3 == 0) goto L_0x0027;
    L_0x0022:
        r3 = r2.lock;
        r3.unlock();
    L_0x0027:
        goto L_0x0040;
    L_0x0028:
        r3 = move-exception;
        r0 = r0.get();
        if (r0 == 0) goto L_0x0034;
    L_0x002f:
        r0 = r2.lock;
        r0.unlock();
    L_0x0034:
        throw r3;
    L_0x0035:
        r0 = r2.baseDisposable;	 Catch:{ all -> 0x0041 }
        r2.doSubscribe(r3, r0);	 Catch:{ all -> 0x0041 }
        r3 = r2.lock;
        r3.unlock();
    L_0x0040:
        return;
    L_0x0041:
        r3 = move-exception;
        r0 = r2.lock;
        r0.unlock();
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.flowable.FlowableRefCount.subscribeActual(org.reactivestreams.Subscriber):void");
    }

    private Consumer<Disposable> onSubscribe(Subscriber<? super T> subscriber, AtomicBoolean atomicBoolean) {
        return new DisposeConsumer(subscriber, atomicBoolean);
    }

    void doSubscribe(Subscriber<? super T> subscriber, CompositeDisposable compositeDisposable) {
        Object connectionSubscriber = new ConnectionSubscriber(subscriber, compositeDisposable, disconnect(compositeDisposable));
        subscriber.onSubscribe(connectionSubscriber);
        this.source.subscribe((FlowableSubscriber) connectionSubscriber);
    }

    private Disposable disconnect(CompositeDisposable compositeDisposable) {
        return Disposables.fromRunnable(new DisposeTask(compositeDisposable));
    }
}
