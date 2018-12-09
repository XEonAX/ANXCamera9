package io.reactivex.observers;

import com.android.camera.CameraIntentManager.ControlActions;
import io.reactivex.CompletableObserver;
import io.reactivex.MaybeObserver;
import io.reactivex.Observer;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.internal.util.ExceptionHelper;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public class TestObserver<T> extends BaseTestConsumer<T, TestObserver<T>> implements CompletableObserver, MaybeObserver<T>, Observer<T>, SingleObserver<T>, Disposable {
    private final Observer<? super T> actual;
    private QueueDisposable<T> qs;
    private final AtomicReference<Disposable> subscription;

    enum EmptyObserver implements Observer<Object> {
        INSTANCE;

        public void onSubscribe(Disposable disposable) {
        }

        public void onNext(Object obj) {
        }

        public void onError(Throwable th) {
        }

        public void onComplete() {
        }
    }

    public static <T> TestObserver<T> create() {
        return new TestObserver();
    }

    public static <T> TestObserver<T> create(Observer<? super T> observer) {
        return new TestObserver(observer);
    }

    public TestObserver() {
        this(EmptyObserver.INSTANCE);
    }

    public TestObserver(Observer<? super T> observer) {
        this.subscription = new AtomicReference();
        this.actual = observer;
    }

    public void onSubscribe(Disposable disposable) {
        this.lastThread = Thread.currentThread();
        if (disposable == null) {
            this.errors.add(new NullPointerException("onSubscribe received a null Subscription"));
        } else if (this.subscription.compareAndSet(null, disposable)) {
            if (this.initialFusionMode != 0 && (disposable instanceof QueueDisposable)) {
                this.qs = (QueueDisposable) disposable;
                int requestFusion = this.qs.requestFusion(this.initialFusionMode);
                this.establishedFusionMode = requestFusion;
                if (requestFusion == 1) {
                    this.checkSubscriptionOnce = true;
                    this.lastThread = Thread.currentThread();
                    while (true) {
                        try {
                            Object poll = this.qs.poll();
                            if (poll == null) {
                                break;
                            }
                            this.values.add(poll);
                        } catch (Throwable th) {
                            this.errors.add(th);
                        }
                    }
                    this.completions++;
                    this.subscription.lazySet(DisposableHelper.DISPOSED);
                    return;
                }
            }
            this.actual.onSubscribe(disposable);
        } else {
            disposable.dispose();
            if (this.subscription.get() != DisposableHelper.DISPOSED) {
                List list = this.errors;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onSubscribe received multiple subscriptions: ");
                stringBuilder.append(disposable);
                list.add(new IllegalStateException(stringBuilder.toString()));
            }
        }
    }

    public void onNext(T t) {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        this.lastThread = Thread.currentThread();
        if (this.establishedFusionMode == 2) {
            while (true) {
                try {
                    Object poll = this.qs.poll();
                    if (poll == null) {
                        break;
                    }
                    this.values.add(poll);
                } catch (Throwable th) {
                    this.errors.add(th);
                    this.qs.dispose();
                }
            }
            return;
        }
        this.values.add(t);
        if (t == null) {
            this.errors.add(new NullPointerException("onNext received a null value"));
        }
        this.actual.onNext(t);
    }

    public void onError(Throwable th) {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        try {
            this.lastThread = Thread.currentThread();
            if (th == null) {
                this.errors.add(new NullPointerException("onError received a null Throwable"));
            } else {
                this.errors.add(th);
            }
            this.actual.onError(th);
        } finally {
            this.done.countDown();
        }
    }

    public void onComplete() {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        try {
            this.lastThread = Thread.currentThread();
            this.completions++;
            this.actual.onComplete();
        } finally {
            this.done.countDown();
        }
    }

    public final boolean isCancelled() {
        return isDisposed();
    }

    public final void cancel() {
        dispose();
    }

    public final void dispose() {
        DisposableHelper.dispose(this.subscription);
    }

    public final boolean isDisposed() {
        return DisposableHelper.isDisposed((Disposable) this.subscription.get());
    }

    public final boolean hasSubscription() {
        return this.subscription.get() != null;
    }

    public final TestObserver<T> assertSubscribed() {
        if (this.subscription.get() != null) {
            return this;
        }
        throw fail("Not subscribed!");
    }

    public final TestObserver<T> assertNotSubscribed() {
        if (this.subscription.get() != null) {
            throw fail("Subscribed!");
        } else if (this.errors.isEmpty()) {
            return this;
        } else {
            throw fail("Not subscribed but errors found");
        }
    }

    public final TestObserver<T> assertOf(Consumer<? super TestObserver<T>> consumer) {
        try {
            consumer.accept(this);
            return this;
        } catch (Throwable th) {
            RuntimeException wrapOrThrow = ExceptionHelper.wrapOrThrow(th);
        }
    }

    final TestObserver<T> setInitialFusionMode(int i) {
        this.initialFusionMode = i;
        return this;
    }

    final TestObserver<T> assertFusionMode(int i) {
        int i2 = this.establishedFusionMode;
        if (i2 == i) {
            return this;
        }
        if (this.qs != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Fusion mode different. Expected: ");
            stringBuilder.append(fusionModeToString(i));
            stringBuilder.append(", actual: ");
            stringBuilder.append(fusionModeToString(i2));
            throw new AssertionError(stringBuilder.toString());
        }
        throw fail("Upstream is not fuseable");
    }

    static String fusionModeToString(int i) {
        switch (i) {
            case 0:
                return ControlActions.CONTROL_ACTION_UNKNOWN;
            case 1:
                return "SYNC";
            case 2:
                return "ASYNC";
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unknown(");
                stringBuilder.append(i);
                stringBuilder.append(")");
                return stringBuilder.toString();
        }
    }

    final TestObserver<T> assertFuseable() {
        if (this.qs != null) {
            return this;
        }
        throw new AssertionError("Upstream is not fuseable.");
    }

    final TestObserver<T> assertNotFuseable() {
        if (this.qs == null) {
            return this;
        }
        throw new AssertionError("Upstream is fuseable.");
    }

    public void onSuccess(T t) {
        onNext(t);
        onComplete();
    }
}
