package okhttp3;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import okhttp3.internal.NamedRunnable;
import okhttp3.internal.cache.CacheInterceptor;
import okhttp3.internal.connection.ConnectInterceptor;
import okhttp3.internal.connection.StreamAllocation;
import okhttp3.internal.http.BridgeInterceptor;
import okhttp3.internal.http.CallServerInterceptor;
import okhttp3.internal.http.RealInterceptorChain;
import okhttp3.internal.http.RetryAndFollowUpInterceptor;
import okhttp3.internal.platform.Platform;

final class RealCall implements Call {
    final OkHttpClient client;
    private EventListener eventListener;
    private boolean executed;
    final boolean forWebSocket;
    final Request originalRequest;
    final RetryAndFollowUpInterceptor retryAndFollowUpInterceptor;

    final class AsyncCall extends NamedRunnable {
        private final Callback responseCallback;

        AsyncCall(Callback callback) {
            super("OkHttp %s", r4.redactedUrl());
            this.responseCallback = callback;
        }

        String host() {
            return RealCall.this.originalRequest.url().host();
        }

        Request request() {
            return RealCall.this.originalRequest;
        }

        RealCall get() {
            return RealCall.this;
        }

        /* JADX WARNING: Removed duplicated region for block: B:15:0x0061 A:{Catch:{ all -> 0x0039 }} */
        /* JADX WARNING: Removed duplicated region for block: B:13:0x0041 A:{SYNTHETIC, Splitter: B:13:0x0041} */
        protected void execute() {
            /*
            r6 = this;
            r0 = 1;
            r1 = 0;
            r2 = okhttp3.RealCall.this;	 Catch:{ IOException -> 0x003b }
            r2 = r2.getResponseWithInterceptorChain();	 Catch:{ IOException -> 0x003b }
            r3 = okhttp3.RealCall.this;	 Catch:{ IOException -> 0x003b }
            r3 = r3.retryAndFollowUpInterceptor;	 Catch:{ IOException -> 0x003b }
            r3 = r3.isCanceled();	 Catch:{ IOException -> 0x003b }
            if (r3 == 0) goto L_0x0025;
            r1 = r6.responseCallback;	 Catch:{ IOException -> 0x0023 }
            r2 = okhttp3.RealCall.this;	 Catch:{ IOException -> 0x0023 }
            r3 = new java.io.IOException;	 Catch:{ IOException -> 0x0023 }
            r4 = "Canceled";
            r3.<init>(r4);	 Catch:{ IOException -> 0x0023 }
            r1.onFailure(r2, r3);	 Catch:{ IOException -> 0x0023 }
            goto L_0x002d;
        L_0x0023:
            r1 = move-exception;
            goto L_0x003f;
            r1 = r6.responseCallback;	 Catch:{ IOException -> 0x0023 }
            r3 = okhttp3.RealCall.this;	 Catch:{ IOException -> 0x0023 }
            r1.onResponse(r3, r2);	 Catch:{ IOException -> 0x0023 }
        L_0x002d:
            r0 = okhttp3.RealCall.this;
            r0 = r0.client;
            r0 = r0.dispatcher();
            r0.finished(r6);
            goto L_0x0074;
        L_0x0039:
            r0 = move-exception;
            goto L_0x0075;
        L_0x003b:
            r0 = move-exception;
            r5 = r1;
            r1 = r0;
            r0 = r5;
        L_0x003f:
            if (r0 == 0) goto L_0x0061;
        L_0x0041:
            r0 = okhttp3.internal.platform.Platform.get();	 Catch:{ all -> 0x0039 }
            r2 = 4;
            r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0039 }
            r3.<init>();	 Catch:{ all -> 0x0039 }
            r4 = "Callback failure for ";
            r3.append(r4);	 Catch:{ all -> 0x0039 }
            r4 = okhttp3.RealCall.this;	 Catch:{ all -> 0x0039 }
            r4 = r4.toLoggableString();	 Catch:{ all -> 0x0039 }
            r3.append(r4);	 Catch:{ all -> 0x0039 }
            r3 = r3.toString();	 Catch:{ all -> 0x0039 }
            r0.log(r2, r3, r1);	 Catch:{ all -> 0x0039 }
            goto L_0x002d;
        L_0x0061:
            r0 = okhttp3.RealCall.this;	 Catch:{ all -> 0x0039 }
            r0 = r0.eventListener;	 Catch:{ all -> 0x0039 }
            r2 = okhttp3.RealCall.this;	 Catch:{ all -> 0x0039 }
            r0.callFailed(r2, r1);	 Catch:{ all -> 0x0039 }
            r0 = r6.responseCallback;	 Catch:{ all -> 0x0039 }
            r2 = okhttp3.RealCall.this;	 Catch:{ all -> 0x0039 }
            r0.onFailure(r2, r1);	 Catch:{ all -> 0x0039 }
            goto L_0x002d;
        L_0x0074:
            return;
        L_0x0075:
            r1 = okhttp3.RealCall.this;
            r1 = r1.client;
            r1 = r1.dispatcher();
            r1.finished(r6);
            throw r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: okhttp3.RealCall.AsyncCall.execute():void");
        }
    }

    private RealCall(OkHttpClient okHttpClient, Request request, boolean z) {
        this.client = okHttpClient;
        this.originalRequest = request;
        this.forWebSocket = z;
        this.retryAndFollowUpInterceptor = new RetryAndFollowUpInterceptor(okHttpClient, z);
    }

    static RealCall newRealCall(OkHttpClient okHttpClient, Request request, boolean z) {
        RealCall realCall = new RealCall(okHttpClient, request, z);
        realCall.eventListener = okHttpClient.eventListenerFactory().create(realCall);
        return realCall;
    }

    public Request request() {
        return this.originalRequest;
    }

    public Response execute() throws IOException {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        captureCallStackTrace();
        this.eventListener.callStart(this);
        try {
            this.client.dispatcher().executed(this);
            Response responseWithInterceptorChain = getResponseWithInterceptorChain();
            if (responseWithInterceptorChain != null) {
                this.client.dispatcher().finished(this);
                return responseWithInterceptorChain;
            }
            throw new IOException("Canceled");
        } catch (IOException e) {
            this.eventListener.callFailed(this, e);
            throw e;
        } catch (Throwable th) {
            this.client.dispatcher().finished(this);
        }
    }

    private void captureCallStackTrace() {
        this.retryAndFollowUpInterceptor.setCallStackTrace(Platform.get().getStackTraceForCloseable("response.body().close()"));
    }

    public void enqueue(Callback callback) {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        captureCallStackTrace();
        this.eventListener.callStart(this);
        this.client.dispatcher().enqueue(new AsyncCall(callback));
    }

    public void cancel() {
        this.retryAndFollowUpInterceptor.cancel();
    }

    public synchronized boolean isExecuted() {
        return this.executed;
    }

    public boolean isCanceled() {
        return this.retryAndFollowUpInterceptor.isCanceled();
    }

    public RealCall clone() {
        return newRealCall(this.client, this.originalRequest, this.forWebSocket);
    }

    StreamAllocation streamAllocation() {
        return this.retryAndFollowUpInterceptor.streamAllocation();
    }

    String toLoggableString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(isCanceled() ? "canceled " : "");
        stringBuilder.append(this.forWebSocket ? "web socket" : "call");
        stringBuilder.append(" to ");
        stringBuilder.append(redactedUrl());
        return stringBuilder.toString();
    }

    String redactedUrl() {
        return this.originalRequest.url().redact();
    }

    Response getResponseWithInterceptorChain() throws IOException {
        List arrayList = new ArrayList();
        arrayList.addAll(this.client.interceptors());
        arrayList.add(this.retryAndFollowUpInterceptor);
        arrayList.add(new BridgeInterceptor(this.client.cookieJar()));
        arrayList.add(new CacheInterceptor(this.client.internalCache()));
        arrayList.add(new ConnectInterceptor(this.client));
        if (!this.forWebSocket) {
            arrayList.addAll(this.client.networkInterceptors());
        }
        arrayList.add(new CallServerInterceptor(this.forWebSocket));
        return new RealInterceptorChain(arrayList, null, null, null, 0, this.originalRequest, this, this.eventListener, this.client.connectTimeoutMillis(), this.client.readTimeoutMillis(), this.client.writeTimeoutMillis()).proceed(this.originalRequest);
    }
}
