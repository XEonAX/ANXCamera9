package io.reactivex.processors;

import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.NotificationLite;
import org.reactivestreams.Subscriber;
import org.reactivestreams.Subscription;

final class SerializedProcessor<T> extends FlowableProcessor<T> {
    final FlowableProcessor<T> actual;
    volatile boolean done;
    boolean emitting;
    AppendOnlyLinkedArrayList<Object> queue;

    SerializedProcessor(FlowableProcessor<T> flowableProcessor) {
        this.actual = flowableProcessor;
    }

    protected void subscribeActual(Subscriber<? super T> subscriber) {
        this.actual.subscribe((Subscriber) subscriber);
    }

    public void onSubscribe(Subscription subscription) {
        boolean z = true;
        if (!this.done) {
            synchronized (this) {
                if (!this.done) {
                    if (this.emitting) {
                        AppendOnlyLinkedArrayList appendOnlyLinkedArrayList = this.queue;
                        if (appendOnlyLinkedArrayList == null) {
                            appendOnlyLinkedArrayList = new AppendOnlyLinkedArrayList(4);
                            this.queue = appendOnlyLinkedArrayList;
                        }
                        appendOnlyLinkedArrayList.add(NotificationLite.subscription(subscription));
                        return;
                    }
                    this.emitting = true;
                    z = false;
                }
            }
        }
        if (z) {
            subscription.cancel();
        } else {
            this.actual.onSubscribe(subscription);
            emitLoop();
        }
    }

    public void onNext(T t) {
        if (!this.done) {
            synchronized (this) {
                if (this.done) {
                } else if (this.emitting) {
                    AppendOnlyLinkedArrayList appendOnlyLinkedArrayList = this.queue;
                    if (appendOnlyLinkedArrayList == null) {
                        appendOnlyLinkedArrayList = new AppendOnlyLinkedArrayList(4);
                        this.queue = appendOnlyLinkedArrayList;
                    }
                    appendOnlyLinkedArrayList.add(NotificationLite.next(t));
                } else {
                    this.emitting = true;
                    this.actual.onNext(t);
                    emitLoop();
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:19:0x0030, code:
            if (r0 == false) goto L_0x0036;
     */
    /* JADX WARNING: Missing block: B:20:0x0032, code:
            io.reactivex.plugins.RxJavaPlugins.onError(r3);
     */
    /* JADX WARNING: Missing block: B:21:0x0035, code:
            return;
     */
    /* JADX WARNING: Missing block: B:22:0x0036, code:
            r2.actual.onError(r3);
     */
    /* JADX WARNING: Missing block: B:23:0x003b, code:
            return;
     */
    public void onError(java.lang.Throwable r3) {
        /*
        r2 = this;
        r0 = r2.done;
        if (r0 == 0) goto L_0x0008;
    L_0x0004:
        io.reactivex.plugins.RxJavaPlugins.onError(r3);
        return;
    L_0x0008:
        monitor-enter(r2);
        r0 = r2.done;	 Catch:{ all -> 0x003c }
        r1 = 1;
        if (r0 == 0) goto L_0x0011;
        r0 = r1;
        goto L_0x002f;
    L_0x0011:
        r2.done = r1;	 Catch:{ all -> 0x003c }
        r0 = r2.emitting;	 Catch:{ all -> 0x003c }
        if (r0 == 0) goto L_0x002c;
    L_0x0017:
        r0 = r2.queue;	 Catch:{ all -> 0x003c }
        if (r0 != 0) goto L_0x0023;
    L_0x001b:
        r0 = new io.reactivex.internal.util.AppendOnlyLinkedArrayList;	 Catch:{ all -> 0x003c }
        r1 = 4;
        r0.<init>(r1);	 Catch:{ all -> 0x003c }
        r2.queue = r0;	 Catch:{ all -> 0x003c }
    L_0x0023:
        r3 = io.reactivex.internal.util.NotificationLite.error(r3);	 Catch:{ all -> 0x003c }
        r0.setFirst(r3);	 Catch:{ all -> 0x003c }
        monitor-exit(r2);	 Catch:{ all -> 0x003c }
        return;
    L_0x002c:
        r0 = 0;
        r2.emitting = r1;	 Catch:{ all -> 0x003c }
    L_0x002f:
        monitor-exit(r2);	 Catch:{ all -> 0x003c }
        if (r0 == 0) goto L_0x0036;
    L_0x0032:
        io.reactivex.plugins.RxJavaPlugins.onError(r3);
        return;
    L_0x0036:
        r0 = r2.actual;
        r0.onError(r3);
        return;
    L_0x003c:
        r3 = move-exception;
        monitor-exit(r2);	 Catch:{ all -> 0x003c }
        throw r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.processors.SerializedProcessor.onError(java.lang.Throwable):void");
    }

    public void onComplete() {
        if (!this.done) {
            synchronized (this) {
                if (this.done) {
                    return;
                }
                this.done = true;
                if (this.emitting) {
                    AppendOnlyLinkedArrayList appendOnlyLinkedArrayList = this.queue;
                    if (appendOnlyLinkedArrayList == null) {
                        appendOnlyLinkedArrayList = new AppendOnlyLinkedArrayList(4);
                        this.queue = appendOnlyLinkedArrayList;
                    }
                    appendOnlyLinkedArrayList.add(NotificationLite.complete());
                    return;
                }
                this.emitting = true;
                this.actual.onComplete();
            }
        }
    }

    void emitLoop() {
        while (true) {
            AppendOnlyLinkedArrayList appendOnlyLinkedArrayList;
            synchronized (this) {
                appendOnlyLinkedArrayList = this.queue;
                if (appendOnlyLinkedArrayList == null) {
                    this.emitting = false;
                    return;
                }
                this.queue = null;
            }
            appendOnlyLinkedArrayList.accept(this.actual);
        }
        while (true) {
        }
    }

    public boolean hasSubscribers() {
        return this.actual.hasSubscribers();
    }

    public boolean hasThrowable() {
        return this.actual.hasThrowable();
    }

    public Throwable getThrowable() {
        return this.actual.getThrowable();
    }

    public boolean hasComplete() {
        return this.actual.hasComplete();
    }
}
