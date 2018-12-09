package io.reactivex.internal.disposables;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.queue.SpscLinkedArrayQueue;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;

public final class ObserverFullArbiter<T> extends FullArbiterPad1 implements Disposable {
    final Observer<? super T> actual;
    volatile boolean cancelled;
    final SpscLinkedArrayQueue<Object> queue;
    Disposable resource;
    volatile Disposable s = EmptyDisposable.INSTANCE;

    public ObserverFullArbiter(Observer<? super T> observer, Disposable disposable, int i) {
        this.actual = observer;
        this.resource = disposable;
        this.queue = new SpscLinkedArrayQueue(i);
    }

    public void dispose() {
        if (!this.cancelled) {
            this.cancelled = true;
            disposeResource();
        }
    }

    public boolean isDisposed() {
        Disposable disposable = this.resource;
        return disposable != null ? disposable.isDisposed() : this.cancelled;
    }

    void disposeResource() {
        Disposable disposable = this.resource;
        this.resource = null;
        if (disposable != null) {
            disposable.dispose();
        }
    }

    public boolean setDisposable(Disposable disposable) {
        if (this.cancelled) {
            return false;
        }
        this.queue.offer(this.s, NotificationLite.disposable(disposable));
        drain();
        return true;
    }

    public boolean onNext(T t, Disposable disposable) {
        if (this.cancelled) {
            return false;
        }
        this.queue.offer(disposable, NotificationLite.next(t));
        drain();
        return true;
    }

    public void onError(Throwable th, Disposable disposable) {
        if (this.cancelled) {
            RxJavaPlugins.onError(th);
            return;
        }
        this.queue.offer(disposable, NotificationLite.error(th));
        drain();
    }

    public void onComplete(Disposable disposable) {
        this.queue.offer(disposable, NotificationLite.complete());
        drain();
    }

    void drain() {
        if (this.wip.getAndIncrement() == 0) {
            SpscLinkedArrayQueue spscLinkedArrayQueue = this.queue;
            Observer observer = this.actual;
            int i = 1;
            while (true) {
                Disposable poll = spscLinkedArrayQueue.poll();
                if (poll == null) {
                    i = this.wip.addAndGet(-i);
                    if (i == 0) {
                        return;
                    }
                } else {
                    Object poll2 = spscLinkedArrayQueue.poll();
                    if (poll == this.s) {
                        if (NotificationLite.isDisposable(poll2)) {
                            poll = NotificationLite.getDisposable(poll2);
                            this.s.dispose();
                            if (this.cancelled) {
                                poll.dispose();
                            } else {
                                this.s = poll;
                            }
                        } else if (NotificationLite.isError(poll2)) {
                            spscLinkedArrayQueue.clear();
                            disposeResource();
                            Throwable error = NotificationLite.getError(poll2);
                            if (this.cancelled) {
                                RxJavaPlugins.onError(error);
                            } else {
                                this.cancelled = true;
                                observer.onError(error);
                            }
                        } else if (NotificationLite.isComplete(poll2)) {
                            spscLinkedArrayQueue.clear();
                            disposeResource();
                            if (!this.cancelled) {
                                this.cancelled = true;
                                observer.onComplete();
                            }
                        } else {
                            observer.onNext(NotificationLite.getValue(poll2));
                        }
                    }
                }
            }
        }
    }
}
