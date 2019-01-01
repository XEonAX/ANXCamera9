package io.reactivex.subjects;

import io.reactivex.Observer;
import io.reactivex.annotations.CheckReturnValue;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList;
import io.reactivex.internal.util.AppendOnlyLinkedArrayList.NonThrowingPredicate;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.NotificationLite;
import io.reactivex.plugins.RxJavaPlugins;
import java.lang.reflect.Array;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public final class BehaviorSubject<T> extends Subject<T> {
    static final BehaviorDisposable[] EMPTY = new BehaviorDisposable[0];
    private static final Object[] EMPTY_ARRAY = new Object[0];
    static final BehaviorDisposable[] TERMINATED = new BehaviorDisposable[0];
    long index;
    final ReadWriteLock lock;
    final Lock readLock;
    final AtomicReference<BehaviorDisposable<T>[]> subscribers;
    final AtomicReference<Throwable> terminalEvent;
    final AtomicReference<Object> value;
    final Lock writeLock;

    static final class BehaviorDisposable<T> implements Disposable, NonThrowingPredicate<Object> {
        final Observer<? super T> actual;
        volatile boolean cancelled;
        boolean emitting;
        boolean fastPath;
        long index;
        boolean next;
        AppendOnlyLinkedArrayList<Object> queue;
        final BehaviorSubject<T> state;

        BehaviorDisposable(Observer<? super T> observer, BehaviorSubject<T> behaviorSubject) {
            this.actual = observer;
            this.state = behaviorSubject;
        }

        public void dispose() {
            if (!this.cancelled) {
                this.cancelled = true;
                this.state.remove(this);
            }
        }

        public boolean isDisposed() {
            return this.cancelled;
        }

        /* JADX WARNING: Missing block: B:19:0x0031, code:
            if (r0 == null) goto L_0x003d;
     */
        /* JADX WARNING: Missing block: B:21:0x0037, code:
            if (test(r0) == false) goto L_0x003a;
     */
        /* JADX WARNING: Missing block: B:22:0x0039, code:
            return;
     */
        /* JADX WARNING: Missing block: B:23:0x003a, code:
            emitLoop();
     */
        /* JADX WARNING: Missing block: B:24:0x003d, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void emitFirst() {
            if (!this.cancelled) {
                synchronized (this) {
                    if (this.cancelled) {
                    } else if (this.next) {
                    } else {
                        BehaviorSubject behaviorSubject = this.state;
                        Lock lock = behaviorSubject.readLock;
                        lock.lock();
                        this.index = behaviorSubject.index;
                        Object obj = behaviorSubject.value.get();
                        lock.unlock();
                        this.emitting = obj != null;
                        this.next = true;
                    }
                }
            }
        }

        /* JADX WARNING: Missing block: B:25:0x0031, code:
            r2.fastPath = true;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void emitNext(Object obj, long j) {
            if (!this.cancelled) {
                if (!this.fastPath) {
                    synchronized (this) {
                        if (this.cancelled) {
                            return;
                        } else if (this.index == j) {
                            return;
                        } else if (this.emitting) {
                            AppendOnlyLinkedArrayList appendOnlyLinkedArrayList = this.queue;
                            if (appendOnlyLinkedArrayList == null) {
                                appendOnlyLinkedArrayList = new AppendOnlyLinkedArrayList(4);
                                this.queue = appendOnlyLinkedArrayList;
                            }
                            appendOnlyLinkedArrayList.add(obj);
                            return;
                        } else {
                            this.next = true;
                        }
                    }
                }
                test(obj);
            }
        }

        public boolean test(Object obj) {
            return this.cancelled || NotificationLite.accept(obj, this.actual);
        }

        /* JADX WARNING: Missing block: B:12:0x0013, code:
            r0.forEachWhile(r2);
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        void emitLoop() {
            while (!this.cancelled) {
                synchronized (this) {
                    AppendOnlyLinkedArrayList appendOnlyLinkedArrayList = this.queue;
                    if (appendOnlyLinkedArrayList == null) {
                        this.emitting = false;
                        return;
                    }
                    this.queue = null;
                }
            }
        }
    }

    @CheckReturnValue
    public static <T> BehaviorSubject<T> create() {
        return new BehaviorSubject();
    }

    @CheckReturnValue
    public static <T> BehaviorSubject<T> createDefault(T t) {
        return new BehaviorSubject(t);
    }

    BehaviorSubject() {
        this.lock = new ReentrantReadWriteLock();
        this.readLock = this.lock.readLock();
        this.writeLock = this.lock.writeLock();
        this.subscribers = new AtomicReference(EMPTY);
        this.value = new AtomicReference();
        this.terminalEvent = new AtomicReference();
    }

    BehaviorSubject(T t) {
        this();
        this.value.lazySet(ObjectHelper.requireNonNull(t, "defaultValue is null"));
    }

    protected void subscribeActual(Observer<? super T> observer) {
        BehaviorDisposable behaviorDisposable = new BehaviorDisposable(observer, this);
        observer.onSubscribe(behaviorDisposable);
        if (!add(behaviorDisposable)) {
            Throwable th = (Throwable) this.terminalEvent.get();
            if (th == ExceptionHelper.TERMINATED) {
                observer.onComplete();
            } else {
                observer.onError(th);
            }
        } else if (behaviorDisposable.cancelled) {
            remove(behaviorDisposable);
        } else {
            behaviorDisposable.emitFirst();
        }
    }

    public void onSubscribe(Disposable disposable) {
        if (this.terminalEvent.get() != null) {
            disposable.dispose();
        }
    }

    public void onNext(T t) {
        ObjectHelper.requireNonNull(t, "onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.terminalEvent.get() == null) {
            Object next = NotificationLite.next(t);
            setCurrent(next);
            for (BehaviorDisposable emitNext : (BehaviorDisposable[]) this.subscribers.get()) {
                emitNext.emitNext(next, this.index);
            }
        }
    }

    public void onError(Throwable th) {
        ObjectHelper.requireNonNull(th, "onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        if (this.terminalEvent.compareAndSet(null, th)) {
            Object error = NotificationLite.error(th);
            for (BehaviorDisposable emitNext : terminate(error)) {
                emitNext.emitNext(error, this.index);
            }
            return;
        }
        RxJavaPlugins.onError(th);
    }

    public void onComplete() {
        if (this.terminalEvent.compareAndSet(null, ExceptionHelper.TERMINATED)) {
            Object complete = NotificationLite.complete();
            for (BehaviorDisposable emitNext : terminate(complete)) {
                emitNext.emitNext(complete, this.index);
            }
        }
    }

    public boolean hasObservers() {
        return ((BehaviorDisposable[]) this.subscribers.get()).length != 0;
    }

    int subscriberCount() {
        return ((BehaviorDisposable[]) this.subscribers.get()).length;
    }

    public Throwable getThrowable() {
        Object obj = this.value.get();
        if (NotificationLite.isError(obj)) {
            return NotificationLite.getError(obj);
        }
        return null;
    }

    public T getValue() {
        Object obj = this.value.get();
        if (NotificationLite.isComplete(obj) || NotificationLite.isError(obj)) {
            return null;
        }
        return NotificationLite.getValue(obj);
    }

    public Object[] getValues() {
        Object[] values = getValues(EMPTY_ARRAY);
        if (values == EMPTY_ARRAY) {
            return new Object[0];
        }
        return values;
    }

    public T[] getValues(T[] tArr) {
        Object obj = this.value.get();
        if (obj == null || NotificationLite.isComplete(obj) || NotificationLite.isError(obj)) {
            if (tArr.length != 0) {
                tArr[0] = null;
            }
            return tArr;
        }
        obj = NotificationLite.getValue(obj);
        if (tArr.length != 0) {
            tArr[0] = obj;
            if (tArr.length != 1) {
                tArr[1] = null;
            }
        } else {
            tArr = (Object[]) Array.newInstance(tArr.getClass().getComponentType(), 1);
            tArr[0] = obj;
        }
        return tArr;
    }

    public boolean hasComplete() {
        return NotificationLite.isComplete(this.value.get());
    }

    public boolean hasThrowable() {
        return NotificationLite.isError(this.value.get());
    }

    public boolean hasValue() {
        Object obj = this.value.get();
        return (obj == null || NotificationLite.isComplete(obj) || NotificationLite.isError(obj)) ? false : true;
    }

    boolean add(BehaviorDisposable<T> behaviorDisposable) {
        while (true) {
            BehaviorDisposable[] behaviorDisposableArr = (BehaviorDisposable[]) this.subscribers.get();
            if (behaviorDisposableArr == TERMINATED) {
                return false;
            }
            int length = behaviorDisposableArr.length;
            Object obj = new BehaviorDisposable[(length + 1)];
            System.arraycopy(behaviorDisposableArr, 0, obj, 0, length);
            obj[length] = behaviorDisposable;
            if (this.subscribers.compareAndSet(behaviorDisposableArr, obj)) {
                return true;
            }
        }
    }

    void remove(BehaviorDisposable<T> behaviorDisposable) {
        while (true) {
            BehaviorDisposable[] behaviorDisposableArr = (BehaviorDisposable[]) this.subscribers.get();
            if (behaviorDisposableArr != TERMINATED && behaviorDisposableArr != EMPTY) {
                int length = behaviorDisposableArr.length;
                int i = -1;
                for (int i2 = 0; i2 < length; i2++) {
                    if (behaviorDisposableArr[i2] == behaviorDisposable) {
                        i = i2;
                        break;
                    }
                }
                if (i >= 0) {
                    Object obj;
                    if (length == 1) {
                        obj = EMPTY;
                    } else {
                        Object obj2 = new BehaviorDisposable[(length - 1)];
                        System.arraycopy(behaviorDisposableArr, 0, obj2, 0, i);
                        System.arraycopy(behaviorDisposableArr, i + 1, obj2, i, (length - i) - 1);
                        obj = obj2;
                    }
                    if (this.subscribers.compareAndSet(behaviorDisposableArr, obj)) {
                        return;
                    }
                } else {
                    return;
                }
            }
        }
    }

    BehaviorDisposable<T>[] terminate(Object obj) {
        BehaviorDisposable<T>[] behaviorDisposableArr = (BehaviorDisposable[]) this.subscribers.get();
        if (behaviorDisposableArr != TERMINATED) {
            behaviorDisposableArr = (BehaviorDisposable[]) this.subscribers.getAndSet(TERMINATED);
            if (behaviorDisposableArr != TERMINATED) {
                setCurrent(obj);
            }
        }
        return behaviorDisposableArr;
    }

    void setCurrent(Object obj) {
        this.writeLock.lock();
        try {
            this.index++;
            this.value.lazySet(obj);
        } finally {
            this.writeLock.unlock();
        }
    }
}
