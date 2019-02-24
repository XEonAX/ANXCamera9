package com.android.volley.toolbox;

import com.android.volley.C0000VolleyError;
import com.android.volley.C0021Request;
import com.android.volley.Response.C0025ErrorListener;
import com.android.volley.Response.C0026Listener;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* renamed from: com.android.volley.toolbox.RequestFuture */
public class C0066RequestFuture<T> implements Future<T>, C0026Listener<T>, C0025ErrorListener {
    private C0000VolleyError mException;
    private C0021Request<?> mRequest;
    private T mResult;
    private boolean mResultReceived;

    public static <E> C0066RequestFuture<E> newFuture() {
        return new C0066RequestFuture();
    }

    private C0066RequestFuture() {
    }

    public void setRequest(C0021Request<?> request) {
        this.mRequest = request;
    }

    public synchronized boolean cancel(boolean mayInterruptIfRunning) {
        if (this.mRequest == null) {
            return false;
        }
        if (isDone()) {
            return false;
        }
        this.mRequest.cancel();
        return true;
    }

    public T get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    public T get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(TimeUnit.MILLISECONDS.convert(timeout, unit)));
    }

    private synchronized T doGet(Long timeoutMs) throws InterruptedException, ExecutionException, TimeoutException {
        if (this.mException != null) {
            throw new ExecutionException(this.mException);
        } else if (this.mResultReceived) {
            return this.mResult;
        } else {
            if (timeoutMs == null) {
                wait(0);
            } else if (timeoutMs.longValue() > 0) {
                wait(timeoutMs.longValue());
            }
            if (this.mException != null) {
                throw new ExecutionException(this.mException);
            } else if (this.mResultReceived) {
                return this.mResult;
            } else {
                throw new TimeoutException();
            }
        }
    }

    public boolean isCancelled() {
        if (this.mRequest == null) {
            return false;
        }
        return this.mRequest.isCanceled();
    }

    public synchronized boolean isDone() {
        boolean z;
        z = this.mResultReceived || this.mException != null || isCancelled();
        return z;
    }

    public synchronized void onResponse(T response) {
        this.mResultReceived = true;
        this.mResult = response;
        notifyAll();
    }

    public synchronized void onErrorResponse(C0000VolleyError error) {
        this.mException = error;
        notifyAll();
    }
}
