package io.reactivex.observers;

import com.ss.android.ttve.common.TEDefine;
import io.reactivex.Notification;
import io.reactivex.annotations.Experimental;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.util.ExceptionHelper;
import io.reactivex.internal.util.VolatileSizeArrayList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public abstract class BaseTestConsumer<T, U extends BaseTestConsumer<T, U>> implements Disposable {
    protected boolean checkSubscriptionOnce;
    protected long completions;
    protected final CountDownLatch done = new CountDownLatch(1);
    protected final List<Throwable> errors = new VolatileSizeArrayList();
    protected int establishedFusionMode;
    protected int initialFusionMode;
    protected Thread lastThread;
    protected CharSequence tag;
    protected boolean timeout;
    protected final List<T> values = new VolatileSizeArrayList();

    public enum TestWaitStrategy implements Runnable {
        SPIN {
            public void run() {
            }
        },
        YIELD {
            public void run() {
                Thread.yield();
            }
        },
        SLEEP_1MS {
            public void run() {
                TestWaitStrategy.sleep(1);
            }
        },
        SLEEP_10MS {
            public void run() {
                TestWaitStrategy.sleep(10);
            }
        },
        SLEEP_100MS {
            public void run() {
                TestWaitStrategy.sleep(100);
            }
        },
        SLEEP_1000MS {
            public void run() {
                TestWaitStrategy.sleep(1000);
            }
        };

        public abstract void run();

        static void sleep(int i) {
            try {
                Thread.sleep((long) i);
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
        }
    }

    public abstract U assertNotSubscribed();

    public abstract U assertSubscribed();

    public final Thread lastThread() {
        return this.lastThread;
    }

    public final List<T> values() {
        return this.values;
    }

    public final List<Throwable> errors() {
        return this.errors;
    }

    public final long completions() {
        return this.completions;
    }

    public final boolean isTerminated() {
        return this.done.getCount() == 0;
    }

    public final int valueCount() {
        return this.values.size();
    }

    public final int errorCount() {
        return this.errors.size();
    }

    protected final AssertionError fail(String str) {
        StringBuilder stringBuilder = new StringBuilder(64 + str.length());
        stringBuilder.append(str);
        stringBuilder.append(" (");
        stringBuilder.append("latch = ");
        stringBuilder.append(this.done.getCount());
        stringBuilder.append(", ");
        stringBuilder.append("values = ");
        stringBuilder.append(this.values.size());
        stringBuilder.append(", ");
        stringBuilder.append("errors = ");
        stringBuilder.append(this.errors.size());
        stringBuilder.append(", ");
        stringBuilder.append("completions = ");
        stringBuilder.append(this.completions);
        if (this.timeout) {
            stringBuilder.append(", timeout!");
        }
        if (isDisposed()) {
            stringBuilder.append(", disposed!");
        }
        CharSequence charSequence = this.tag;
        if (charSequence != null) {
            stringBuilder.append(", tag = ");
            stringBuilder.append(charSequence);
        }
        stringBuilder.append(')');
        AssertionError assertionError = new AssertionError(stringBuilder.toString());
        if (!this.errors.isEmpty()) {
            if (this.errors.size() == 1) {
                assertionError.initCause((Throwable) this.errors.get(0));
            } else {
                assertionError.initCause(new CompositeException(this.errors));
            }
        }
        return assertionError;
    }

    public final U await() throws InterruptedException {
        if (this.done.getCount() == 0) {
            return this;
        }
        this.done.await();
        return this;
    }

    public final boolean await(long j, TimeUnit timeUnit) throws InterruptedException {
        boolean z;
        if (this.done.getCount() == 0 || this.done.await(j, timeUnit)) {
            z = true;
        } else {
            z = false;
        }
        this.timeout = z ^ 1;
        return z;
    }

    public final U assertComplete() {
        long j = this.completions;
        if (j == 0) {
            throw fail("Not completed");
        } else if (j <= 1) {
            return this;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Multiple completions: ");
            stringBuilder.append(j);
            throw fail(stringBuilder.toString());
        }
    }

    public final U assertNotComplete() {
        long j = this.completions;
        int i = (j > 1 ? 1 : (j == 1 ? 0 : -1));
        if (i == 0) {
            throw fail("Completed!");
        } else if (i <= 0) {
            return this;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Multiple completions: ");
            stringBuilder.append(j);
            throw fail(stringBuilder.toString());
        }
    }

    public final U assertNoErrors() {
        if (this.errors.size() == 0) {
            return this;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Error(s) present: ");
        stringBuilder.append(this.errors);
        throw fail(stringBuilder.toString());
    }

    public final U assertError(Throwable th) {
        return assertError(Functions.equalsWith(th));
    }

    public final U assertError(Class<? extends Throwable> cls) {
        return assertError(Functions.isInstanceOf(cls));
    }

    public final U assertError(Predicate<Throwable> predicate) {
        int size = this.errors.size();
        if (size != 0) {
            Object obj = null;
            for (Throwable test : this.errors) {
                try {
                    if (predicate.test(test)) {
                        obj = 1;
                        break;
                    }
                } catch (Throwable e) {
                    throw ExceptionHelper.wrapOrThrow(e);
                }
            }
            if (obj == null) {
                throw fail("Error not present");
            } else if (size == 1) {
                return this;
            } else {
                throw fail("Error present but other errors as well");
            }
        }
        throw fail("No errors");
    }

    public final U assertValue(T t) {
        if (this.values.size() == 1) {
            Object obj = this.values.get(0);
            if (ObjectHelper.equals(t, obj)) {
                return this;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Expected: ");
            stringBuilder.append(valueAndClass(t));
            stringBuilder.append(", Actual: ");
            stringBuilder.append(valueAndClass(obj));
            throw fail(stringBuilder.toString());
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Expected: ");
        stringBuilder2.append(valueAndClass(t));
        stringBuilder2.append(", Actual: ");
        stringBuilder2.append(this.values);
        throw fail(stringBuilder2.toString());
    }

    public final U assertNever(T t) {
        int size = this.values.size();
        for (int i = 0; i < size; i++) {
            if (ObjectHelper.equals(this.values.get(i), t)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Value at position ");
                stringBuilder.append(i);
                stringBuilder.append(" is equal to ");
                stringBuilder.append(valueAndClass(t));
                stringBuilder.append("; Expected them to be different");
                throw fail(stringBuilder.toString());
            }
        }
        return this;
    }

    public final U assertValue(Predicate<T> predicate) {
        assertValueAt(0, (Predicate) predicate);
        if (this.values.size() <= 1) {
            return this;
        }
        throw fail("Value present but other values as well");
    }

    public final U assertNever(Predicate<? super T> predicate) {
        int size = this.values.size();
        int i = 0;
        while (i < size) {
            try {
                if (predicate.test(this.values.get(i))) {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Value at position ");
                    stringBuilder.append(i);
                    stringBuilder.append(" matches predicate ");
                    stringBuilder.append(predicate.toString());
                    stringBuilder.append(", which was not expected.");
                    throw fail(stringBuilder.toString());
                }
                i++;
            } catch (Throwable e) {
                throw ExceptionHelper.wrapOrThrow(e);
            }
        }
        return this;
    }

    @Experimental
    public final U assertValueAt(int i, T t) {
        int size = this.values.size();
        if (size == 0) {
            throw fail("No values");
        } else if (i < size) {
            Object obj = this.values.get(i);
            if (ObjectHelper.equals(t, obj)) {
                return this;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Expected: ");
            stringBuilder.append(valueAndClass(t));
            stringBuilder.append(", Actual: ");
            stringBuilder.append(valueAndClass(obj));
            throw fail(stringBuilder.toString());
        } else {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Invalid index: ");
            stringBuilder2.append(i);
            throw fail(stringBuilder2.toString());
        }
    }

    public final U assertValueAt(int i, Predicate<T> predicate) {
        if (this.values.size() == 0) {
            throw fail("No values");
        } else if (i < this.values.size()) {
            Object obj = null;
            try {
                if (predicate.test(this.values.get(i))) {
                    obj = 1;
                }
                if (obj != null) {
                    return this;
                }
                throw fail("Value not present");
            } catch (Throwable e) {
                throw ExceptionHelper.wrapOrThrow(e);
            }
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Invalid index: ");
            stringBuilder.append(i);
            throw fail(stringBuilder.toString());
        }
    }

    public static String valueAndClass(Object obj) {
        if (obj == null) {
            return TEDefine.FACE_BEAUTY_NULL;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(obj);
        stringBuilder.append(" (class: ");
        stringBuilder.append(obj.getClass().getSimpleName());
        stringBuilder.append(")");
        return stringBuilder.toString();
    }

    public final U assertValueCount(int i) {
        int size = this.values.size();
        if (size == i) {
            return this;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Value counts differ; Expected: ");
        stringBuilder.append(i);
        stringBuilder.append(", Actual: ");
        stringBuilder.append(size);
        throw fail(stringBuilder.toString());
    }

    public final U assertNoValues() {
        return assertValueCount(0);
    }

    public final U assertValues(T... tArr) {
        int size = this.values.size();
        if (size == tArr.length) {
            int i = 0;
            while (i < size) {
                Object obj = this.values.get(i);
                Object obj2 = tArr[i];
                if (ObjectHelper.equals(obj2, obj)) {
                    i++;
                } else {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Values at position ");
                    stringBuilder.append(i);
                    stringBuilder.append(" differ; Expected: ");
                    stringBuilder.append(valueAndClass(obj2));
                    stringBuilder.append(", Actual: ");
                    stringBuilder.append(valueAndClass(obj));
                    throw fail(stringBuilder.toString());
                }
            }
            return this;
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Value count differs; Expected: ");
        stringBuilder2.append(tArr.length);
        stringBuilder2.append(" ");
        stringBuilder2.append(Arrays.toString(tArr));
        stringBuilder2.append(", Actual: ");
        stringBuilder2.append(size);
        stringBuilder2.append(" ");
        stringBuilder2.append(this.values);
        throw fail(stringBuilder2.toString());
    }

    @Experimental
    public final U assertValuesOnly(T... tArr) {
        return assertSubscribed().assertValues(tArr).assertNoErrors().assertNotComplete();
    }

    public final U assertValueSet(Collection<? extends T> collection) {
        if (collection.isEmpty()) {
            assertNoValues();
            return this;
        }
        for (Object next : this.values) {
            if (!collection.contains(next)) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Value not in the expected collection: ");
                stringBuilder.append(valueAndClass(next));
                throw fail(stringBuilder.toString());
            }
        }
        return this;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0078  */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x005a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final U assertValueSequence(Iterable<? extends T> iterable) {
        boolean hasNext;
        Iterator it = this.values.iterator();
        Iterator it2 = iterable.iterator();
        int i = 0;
        while (true) {
            boolean hasNext2 = it2.hasNext();
            hasNext = it.hasNext();
            StringBuilder stringBuilder;
            if (hasNext && hasNext2) {
                Object next = it2.next();
                Object next2 = it.next();
                if (ObjectHelper.equals(next, next2)) {
                    i++;
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Values at position ");
                    stringBuilder.append(i);
                    stringBuilder.append(" differ; Expected: ");
                    stringBuilder.append(valueAndClass(next));
                    stringBuilder.append(", Actual: ");
                    stringBuilder.append(valueAndClass(next2));
                    throw fail(stringBuilder.toString());
                }
            } else if (!hasNext) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("More values received than expected (");
                stringBuilder.append(i);
                stringBuilder.append(")");
                throw fail(stringBuilder.toString());
            } else if (!hasNext2) {
                return this;
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("Fewer values received than expected (");
                stringBuilder.append(i);
                stringBuilder.append(")");
                throw fail(stringBuilder.toString());
            }
        }
        if (!hasNext) {
        }
    }

    public final U assertTerminated() {
        if (this.done.getCount() == 0) {
            long j = this.completions;
            StringBuilder stringBuilder;
            if (j <= 1) {
                int size = this.errors.size();
                if (size > 1) {
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Terminated with multiple errors: ");
                    stringBuilder2.append(size);
                    throw fail(stringBuilder2.toString());
                } else if (j == 0 || size == 0) {
                    return this;
                } else {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Terminated with multiple completions and errors: ");
                    stringBuilder.append(j);
                    throw fail(stringBuilder.toString());
                }
            }
            stringBuilder = new StringBuilder();
            stringBuilder.append("Terminated with multiple completions: ");
            stringBuilder.append(j);
            throw fail(stringBuilder.toString());
        }
        throw fail("Subscriber still running!");
    }

    public final U assertNotTerminated() {
        if (this.done.getCount() != 0) {
            return this;
        }
        throw fail("Subscriber terminated!");
    }

    public final boolean awaitTerminalEvent() {
        try {
            await();
            return true;
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
    }

    public final boolean awaitTerminalEvent(long j, TimeUnit timeUnit) {
        try {
            return await(j, timeUnit);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
    }

    public final U assertErrorMessage(String str) {
        int size = this.errors.size();
        if (size == 0) {
            throw fail("No errors");
        } else if (size == 1) {
            String message = ((Throwable) this.errors.get(0)).getMessage();
            if (ObjectHelper.equals(str, message)) {
                return this;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Error message differs; Expected: ");
            stringBuilder.append(str);
            stringBuilder.append(", Actual: ");
            stringBuilder.append(message);
            throw fail(stringBuilder.toString());
        } else {
            throw fail("Multiple errors");
        }
    }

    public final List<List<Object>> getEvents() {
        List<List<Object>> arrayList = new ArrayList();
        arrayList.add(values());
        arrayList.add(errors());
        List arrayList2 = new ArrayList();
        for (long j = 0; j < this.completions; j++) {
            arrayList2.add(Notification.createOnComplete());
        }
        arrayList.add(arrayList2);
        return arrayList;
    }

    public final U assertResult(T... tArr) {
        return assertSubscribed().assertValues(tArr).assertNoErrors().assertComplete();
    }

    public final U assertFailure(Class<? extends Throwable> cls, T... tArr) {
        return assertSubscribed().assertValues(tArr).assertError((Class) cls).assertNotComplete();
    }

    public final U assertFailure(Predicate<Throwable> predicate, T... tArr) {
        return assertSubscribed().assertValues(tArr).assertError((Predicate) predicate).assertNotComplete();
    }

    public final U assertFailureAndMessage(Class<? extends Throwable> cls, String str, T... tArr) {
        return assertSubscribed().assertValues(tArr).assertError((Class) cls).assertErrorMessage(str).assertNotComplete();
    }

    public final U awaitDone(long j, TimeUnit timeUnit) {
        try {
            if (!this.done.await(j, timeUnit)) {
                this.timeout = true;
                dispose();
            }
            return this;
        } catch (Throwable e) {
            dispose();
            throw ExceptionHelper.wrapOrThrow(e);
        }
    }

    public final U assertEmpty() {
        return assertSubscribed().assertNoValues().assertNoErrors().assertNotComplete();
    }

    public final U withTag(CharSequence charSequence) {
        this.tag = charSequence;
        return this;
    }

    public final U awaitCount(int i) {
        return awaitCount(i, TestWaitStrategy.SLEEP_10MS, 5000);
    }

    public final U awaitCount(int i, Runnable runnable) {
        return awaitCount(i, runnable, 5000);
    }

    public final U awaitCount(int i, Runnable runnable, long j) {
        long currentTimeMillis = System.currentTimeMillis();
        while (true) {
            if (j <= 0 || System.currentTimeMillis() - currentTimeMillis < j) {
                if (this.done.getCount() == 0 || this.values.size() >= i) {
                    break;
                }
                runnable.run();
            } else {
                this.timeout = true;
                break;
            }
        }
        return this;
    }

    public final boolean isTimeout() {
        return this.timeout;
    }

    public final U clearTimeout() {
        this.timeout = false;
        return this;
    }

    public final U assertTimeout() {
        if (this.timeout) {
            return this;
        }
        throw fail("No timeout?!");
    }

    public final U assertNoTimeout() {
        if (!this.timeout) {
            return this;
        }
        throw fail("Timeout?!");
    }
}
